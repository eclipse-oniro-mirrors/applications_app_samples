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

export default function TextPropagationTest(): void {
  describe('TextPropagationTest', () => {
    beforeAll(() => {
      logSuite('TextPropagationTest', 'begin');
    });
    beforeEach(async () => {
      await new Promise<void>((resolve) => { setTimeout((): void => { resolve(undefined); }, 1); });
    });
    afterAll(() => {
      logSuite('TextPropagationTest', 'end');
    });

    /**
     * @tc.name TextPropagationTest_case_001
     * @tc.desc text-propagation: @Link textVal round-trip for empty, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_001', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('');
      expect(board.parentText).assertEqual('');
      expect(board.mainTitle()).assertEqual('');
      expect(board.bottomEcho()).assertEqual('');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(true);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_002
     * @tc.desc text-propagation: @Link textVal round-trip for empty, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_002', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('');
      expect(board.parentText).assertEqual('');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_003
     * @tc.desc text-propagation: @Link textVal round-trip for empty, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_003', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('');
      board.typeText('X');
      board.typeText('');
      expect(board.parentText).assertEqual('');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_004
     * @tc.desc text-propagation: @Link textVal round-trip for space, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_004', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText(' ');
      expect(board.parentText).assertEqual(' ');
      expect(board.mainTitle()).assertEqual(' ');
      expect(board.bottomEcho()).assertEqual(' ');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_005
     * @tc.desc text-propagation: @Link textVal round-trip for space, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_005', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText(' ');
      expect(board.parentText).assertEqual(' ');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_006
     * @tc.desc text-propagation: @Link textVal round-trip for space, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_006', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText(' ');
      board.typeText('X');
      board.typeText(' ');
      expect(board.parentText).assertEqual(' ');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_007
     * @tc.desc text-propagation: @Link textVal round-trip for ascii, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_007', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainTitle()).assertEqual('A');
      expect(board.bottomEcho()).assertEqual('A');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_008
     * @tc.desc text-propagation: @Link textVal round-trip for ascii, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_008', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_009
     * @tc.desc text-propagation: @Link textVal round-trip for ascii, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_009', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('A');
      board.typeText('X');
      board.typeText('A');
      expect(board.parentText).assertEqual('A');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_010
     * @tc.desc text-propagation: @Link textVal round-trip for word, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_010', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('hello');
      expect(board.parentText).assertEqual('hello');
      expect(board.mainTitle()).assertEqual('hello');
      expect(board.bottomEcho()).assertEqual('hello');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_011
     * @tc.desc text-propagation: @Link textVal round-trip for word, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_011', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('hello');
      expect(board.parentText).assertEqual('hello');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_012
     * @tc.desc text-propagation: @Link textVal round-trip for word, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_012', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('hello');
      board.typeText('X');
      board.typeText('hello');
      expect(board.parentText).assertEqual('hello');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_013
     * @tc.desc text-propagation: @Link textVal round-trip for han, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_013', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainTitle()).assertEqual('\u65b0');
      expect(board.bottomEcho()).assertEqual('\u65b0');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_014
     * @tc.desc text-propagation: @Link textVal round-trip for han, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_014', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_015
     * @tc.desc text-propagation: @Link textVal round-trip for han, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_015', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u65b0');
      board.typeText('X');
      board.typeText('\u65b0');
      expect(board.parentText).assertEqual('\u65b0');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_016
     * @tc.desc text-propagation: @Link textVal round-trip for wish, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_016', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.parentText).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.mainTitle()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.bottomEcho()).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_017
     * @tc.desc text-propagation: @Link textVal round-trip for wish, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_017', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.parentText).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_018
     * @tc.desc text-propagation: @Link textVal round-trip for wish, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_018', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('X');
      board.typeText('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.parentText).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_019
     * @tc.desc text-propagation: @Link textVal round-trip for emoji, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_019', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83c\udf88');
      expect(board.parentText).assertEqual('\ud83c\udf88');
      expect(board.mainTitle()).assertEqual('\ud83c\udf88');
      expect(board.bottomEcho()).assertEqual('\ud83c\udf88');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_020
     * @tc.desc text-propagation: @Link textVal round-trip for emoji, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_020', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\ud83c\udf88');
      expect(board.parentText).assertEqual('\ud83c\udf88');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_021
     * @tc.desc text-propagation: @Link textVal round-trip for emoji, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_021', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83c\udf88');
      board.typeText('X');
      board.typeText('\ud83c\udf88');
      expect(board.parentText).assertEqual('\ud83c\udf88');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_022
     * @tc.desc text-propagation: @Link textVal round-trip for sparkle, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_022', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.parentText).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.mainTitle()).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.bottomEcho()).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_023
     * @tc.desc text-propagation: @Link textVal round-trip for sparkle, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_023', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.parentText).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_024
     * @tc.desc text-propagation: @Link textVal round-trip for sparkle, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_024', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83d\udcab \u613f\u65b0\u5e74');
      board.typeText('X');
      board.typeText('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.parentText).assertEqual('\ud83d\udcab \u613f\u65b0\u5e74');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_025
     * @tc.desc text-propagation: @Link textVal round-trip for placeholder, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_025', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.parentText).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.mainTitle()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.bottomEcho()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_026
     * @tc.desc text-propagation: @Link textVal round-trip for placeholder, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_026', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.parentText).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_027
     * @tc.desc text-propagation: @Link textVal round-trip for placeholder, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_027', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      board.typeText('X');
      board.typeText('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.parentText).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_028
     * @tc.desc text-propagation: @Link textVal round-trip for padded, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_028', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('  padded  ');
      expect(board.parentText).assertEqual('  padded  ');
      expect(board.mainTitle()).assertEqual('  padded  ');
      expect(board.bottomEcho()).assertEqual('  padded  ');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_029
     * @tc.desc text-propagation: @Link textVal round-trip for padded, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_029', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('  padded  ');
      expect(board.parentText).assertEqual('  padded  ');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_030
     * @tc.desc text-propagation: @Link textVal round-trip for padded, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_030', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('  padded  ');
      board.typeText('X');
      board.typeText('  padded  ');
      expect(board.parentText).assertEqual('  padded  ');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_031
     * @tc.desc text-propagation: @Link textVal round-trip for newline, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_031', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('line\nbreak');
      expect(board.parentText).assertEqual('line\nbreak');
      expect(board.mainTitle()).assertEqual('line\nbreak');
      expect(board.bottomEcho()).assertEqual('line\nbreak');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_032
     * @tc.desc text-propagation: @Link textVal round-trip for newline, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_032', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('line\nbreak');
      expect(board.parentText).assertEqual('line\nbreak');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_033
     * @tc.desc text-propagation: @Link textVal round-trip for newline, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_033', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('line\nbreak');
      board.typeText('X');
      board.typeText('line\nbreak');
      expect(board.parentText).assertEqual('line\nbreak');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_034
     * @tc.desc text-propagation: @Link textVal round-trip for quotes, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_034', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('quote"slash\\');
      expect(board.parentText).assertEqual('quote"slash\\');
      expect(board.mainTitle()).assertEqual('quote"slash\\');
      expect(board.bottomEcho()).assertEqual('quote"slash\\');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_035
     * @tc.desc text-propagation: @Link textVal round-trip for quotes, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_035', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('quote"slash\\');
      expect(board.parentText).assertEqual('quote"slash\\');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_036
     * @tc.desc text-propagation: @Link textVal round-trip for quotes, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_036', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('quote"slash\\');
      board.typeText('X');
      board.typeText('quote"slash\\');
      expect(board.parentText).assertEqual('quote"slash\\');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_037
     * @tc.desc text-propagation: @Link textVal round-trip for template, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_037', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('${notExecuted}');
      expect(board.parentText).assertEqual('${notExecuted}');
      expect(board.mainTitle()).assertEqual('${notExecuted}');
      expect(board.bottomEcho()).assertEqual('${notExecuted}');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_038
     * @tc.desc text-propagation: @Link textVal round-trip for template, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_038', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('${notExecuted}');
      expect(board.parentText).assertEqual('${notExecuted}');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_039
     * @tc.desc text-propagation: @Link textVal round-trip for template, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_039', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('${notExecuted}');
      board.typeText('X');
      board.typeText('${notExecuted}');
      expect(board.parentText).assertEqual('${notExecuted}');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_040
     * @tc.desc text-propagation: @Link textVal round-trip for markup, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_040', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('<b>wish</b>');
      expect(board.parentText).assertEqual('<b>wish</b>');
      expect(board.mainTitle()).assertEqual('<b>wish</b>');
      expect(board.bottomEcho()).assertEqual('<b>wish</b>');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_041
     * @tc.desc text-propagation: @Link textVal round-trip for markup, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_041', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('<b>wish</b>');
      expect(board.parentText).assertEqual('<b>wish</b>');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_042
     * @tc.desc text-propagation: @Link textVal round-trip for markup, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_042', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('<b>wish</b>');
      board.typeText('X');
      board.typeText('<b>wish</b>');
      expect(board.parentText).assertEqual('<b>wish</b>');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_043
     * @tc.desc text-propagation: @Link textVal round-trip for zero, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_043', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('0');
      expect(board.parentText).assertEqual('0');
      expect(board.mainTitle()).assertEqual('0');
      expect(board.bottomEcho()).assertEqual('0');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_044
     * @tc.desc text-propagation: @Link textVal round-trip for zero, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_044', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('0');
      expect(board.parentText).assertEqual('0');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_045
     * @tc.desc text-propagation: @Link textVal round-trip for zero, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_045', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('0');
      board.typeText('X');
      board.typeText('0');
      expect(board.parentText).assertEqual('0');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_046
     * @tc.desc text-propagation: @Link textVal round-trip for falseword, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_046', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('false');
      expect(board.parentText).assertEqual('false');
      expect(board.mainTitle()).assertEqual('false');
      expect(board.bottomEcho()).assertEqual('false');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_047
     * @tc.desc text-propagation: @Link textVal round-trip for falseword, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_047', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('false');
      expect(board.parentText).assertEqual('false');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_048
     * @tc.desc text-propagation: @Link textVal round-trip for falseword, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_048', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('false');
      board.typeText('X');
      board.typeText('false');
      expect(board.parentText).assertEqual('false');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_049
     * @tc.desc text-propagation: @Link textVal round-trip for arabic, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_049', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u0645\u0631\u062d\u0628\u0627');
      expect(board.parentText).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(board.mainTitle()).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(board.bottomEcho()).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_050
     * @tc.desc text-propagation: @Link textVal round-trip for arabic, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_050', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\u0645\u0631\u062d\u0628\u0627');
      expect(board.parentText).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_051
     * @tc.desc text-propagation: @Link textVal round-trip for arabic, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_051', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u0645\u0631\u062d\u0628\u0627');
      board.typeText('X');
      board.typeText('\u0645\u0631\u062d\u0628\u0627');
      expect(board.parentText).assertEqual('\u0645\u0631\u062d\u0628\u0627');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_052
     * @tc.desc text-propagation: @Link textVal round-trip for combining, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_052', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('e\u0301');
      expect(board.parentText).assertEqual('e\u0301');
      expect(board.mainTitle()).assertEqual('e\u0301');
      expect(board.bottomEcho()).assertEqual('e\u0301');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_053
     * @tc.desc text-propagation: @Link textVal round-trip for combining, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_053', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('e\u0301');
      expect(board.parentText).assertEqual('e\u0301');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_054
     * @tc.desc text-propagation: @Link textVal round-trip for combining, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_054', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('e\u0301');
      board.typeText('X');
      board.typeText('e\u0301');
      expect(board.parentText).assertEqual('e\u0301');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_055
     * @tc.desc text-propagation: @Link textVal round-trip for zwj, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_055', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.parentText).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.mainTitle()).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.bottomEcho()).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_056
     * @tc.desc text-propagation: @Link textVal round-trip for zwj, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_056', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.parentText).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_057
     * @tc.desc text-propagation: @Link textVal round-trip for zwj, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_057', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83d\udc69\u200d\ud83d\udcbb');
      board.typeText('X');
      board.typeText('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.parentText).assertEqual('\ud83d\udc69\u200d\ud83d\udcbb');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_058
     * @tc.desc text-propagation: @Link textVal round-trip for long, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_058', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.parentText).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.mainTitle()).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.bottomEcho()).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_059
     * @tc.desc text-propagation: @Link textVal round-trip for long, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_059', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.parentText).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_060
     * @tc.desc text-propagation: @Link textVal round-trip for long, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_060', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      board.typeText('X');
      board.typeText('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.parentText).assertEqual('AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_061
     * @tc.desc text-propagation: @Link textVal round-trip for proto, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_061', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('__proto__');
      expect(board.parentText).assertEqual('__proto__');
      expect(board.mainTitle()).assertEqual('__proto__');
      expect(board.bottomEcho()).assertEqual('__proto__');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_062
     * @tc.desc text-propagation: @Link textVal round-trip for proto, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_062', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('__proto__');
      expect(board.parentText).assertEqual('__proto__');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_063
     * @tc.desc text-propagation: @Link textVal round-trip for proto, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_063', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('__proto__');
      board.typeText('X');
      board.typeText('__proto__');
      expect(board.parentText).assertEqual('__proto__');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_064
     * @tc.desc text-propagation: @Link textVal round-trip for ctor, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_064', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('constructor');
      expect(board.parentText).assertEqual('constructor');
      expect(board.mainTitle()).assertEqual('constructor');
      expect(board.bottomEcho()).assertEqual('constructor');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_065
     * @tc.desc text-propagation: @Link textVal round-trip for ctor, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_065', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('constructor');
      expect(board.parentText).assertEqual('constructor');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_066
     * @tc.desc text-propagation: @Link textVal round-trip for ctor, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_066', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('constructor');
      board.typeText('X');
      board.typeText('constructor');
      expect(board.parentText).assertEqual('constructor');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_067
     * @tc.desc text-propagation: @Link textVal round-trip for nullword, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_067', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('null');
      expect(board.parentText).assertEqual('null');
      expect(board.mainTitle()).assertEqual('null');
      expect(board.bottomEcho()).assertEqual('null');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_068
     * @tc.desc text-propagation: @Link textVal round-trip for nullword, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_068', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('null');
      expect(board.parentText).assertEqual('null');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_069
     * @tc.desc text-propagation: @Link textVal round-trip for nullword, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_069', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('null');
      board.typeText('X');
      board.typeText('null');
      expect(board.parentText).assertEqual('null');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_070
     * @tc.desc text-propagation: @Link textVal round-trip for undefword, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_070', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('undefined');
      expect(board.parentText).assertEqual('undefined');
      expect(board.mainTitle()).assertEqual('undefined');
      expect(board.bottomEcho()).assertEqual('undefined');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_071
     * @tc.desc text-propagation: @Link textVal round-trip for undefword, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_071', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('undefined');
      expect(board.parentText).assertEqual('undefined');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_072
     * @tc.desc text-propagation: @Link textVal round-trip for undefword, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_072', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('undefined');
      board.typeText('X');
      board.typeText('undefined');
      expect(board.parentText).assertEqual('undefined');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_073
     * @tc.desc text-propagation: @Link textVal round-trip for doublequoted, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_073', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('"quoted"');
      expect(board.parentText).assertEqual('"quoted"');
      expect(board.mainTitle()).assertEqual('"quoted"');
      expect(board.bottomEcho()).assertEqual('"quoted"');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_074
     * @tc.desc text-propagation: @Link textVal round-trip for doublequoted, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_074', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('"quoted"');
      expect(board.parentText).assertEqual('"quoted"');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_075
     * @tc.desc text-propagation: @Link textVal round-trip for doublequoted, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_075', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('"quoted"');
      board.typeText('X');
      board.typeText('"quoted"');
      expect(board.parentText).assertEqual('"quoted"');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_076
     * @tc.desc text-propagation: @Link textVal round-trip for onlyTab, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_076', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\t');
      expect(board.parentText).assertEqual('\t');
      expect(board.mainTitle()).assertEqual('\t');
      expect(board.bottomEcho()).assertEqual('\t');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_077
     * @tc.desc text-propagation: @Link textVal round-trip for onlyTab, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_077', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\t');
      expect(board.parentText).assertEqual('\t');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_078
     * @tc.desc text-propagation: @Link textVal round-trip for onlyTab, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_078', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\t');
      board.typeText('X');
      board.typeText('\t');
      expect(board.parentText).assertEqual('\t');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_079
     * @tc.desc text-propagation: @Link textVal round-trip for nul, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_079', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u0000');
      expect(board.parentText).assertEqual('\u0000');
      expect(board.mainTitle()).assertEqual('\u0000');
      expect(board.bottomEcho()).assertEqual('\u0000');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_080
     * @tc.desc text-propagation: @Link textVal round-trip for nul, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_080', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\u0000');
      expect(board.parentText).assertEqual('\u0000');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_081
     * @tc.desc text-propagation: @Link textVal round-trip for nul, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_081', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u0000');
      board.typeText('X');
      board.typeText('\u0000');
      expect(board.parentText).assertEqual('\u0000');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_082
     * @tc.desc text-propagation: @Link textVal round-trip for linesep, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_082', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u2028');
      expect(board.parentText).assertEqual('\u2028');
      expect(board.mainTitle()).assertEqual('\u2028');
      expect(board.bottomEcho()).assertEqual('\u2028');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_083
     * @tc.desc text-propagation: @Link textVal round-trip for linesep, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_083', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\u2028');
      expect(board.parentText).assertEqual('\u2028');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_084
     * @tc.desc text-propagation: @Link textVal round-trip for linesep, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_084', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u2028');
      board.typeText('X');
      board.typeText('\u2028');
      expect(board.parentText).assertEqual('\u2028');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_085
     * @tc.desc text-propagation: @Link textVal round-trip for rocket, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_085', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83d\ude80');
      expect(board.parentText).assertEqual('\ud83d\ude80');
      expect(board.mainTitle()).assertEqual('\ud83d\ude80');
      expect(board.bottomEcho()).assertEqual('\ud83d\ude80');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_086
     * @tc.desc text-propagation: @Link textVal round-trip for rocket, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_086', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\ud83d\ude80');
      expect(board.parentText).assertEqual('\ud83d\ude80');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_087
     * @tc.desc text-propagation: @Link textVal round-trip for rocket, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_087', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\ud83d\ude80');
      board.typeText('X');
      board.typeText('\ud83d\ude80');
      expect(board.parentText).assertEqual('\ud83d\ude80');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

    /**
     * @tc.name TextPropagationTest_case_088
     * @tc.desc text-propagation: @Link textVal round-trip for accents, form 1.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_088', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u00e9\u00e8\u00ea');
      expect(board.parentText).assertEqual('\u00e9\u00e8\u00ea');
      expect(board.mainTitle()).assertEqual('\u00e9\u00e8\u00ea');
      expect(board.bottomEcho()).assertEqual('\u00e9\u00e8\u00ea');
      expect(board.inputEvents).assertEqual(1);
      expect(board.isEmpty()).assertEqual(false);
      board.clearText();
      expect(board.parentText).assertEqual('');
      expect(board.isEmpty()).assertTrue();
      expect(board.inputEvents).assertEqual(2);
    });

    /**
     * @tc.name TextPropagationTest_case_089
     * @tc.desc text-propagation: @Link textVal round-trip for accents, form 2.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_089', 0, () => {
      const board: WishBoard = new WishBoard();
      board.clickUpdate();
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      board.typeText('\u00e9\u00e8\u00ea');
      expect(board.parentText).assertEqual('\u00e9\u00e8\u00ea');
      expect(board.mainPlaceholder).assertEqual('\u65b0\u5e74\u5feb\u4e50!');
      expect(board.updateClicks).assertEqual(1);
      expect(board.inputEvents).assertEqual(1);
      expect(board.bottomPlaceholder).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
    });

    /**
     * @tc.name TextPropagationTest_case_090
     * @tc.desc text-propagation: @Link textVal round-trip for accents, form 3.
     * @tc.type Function
     * @tc.level Level1
     */
    it('TextPropagationTest_case_090', 0, () => {
      const board: WishBoard = new WishBoard();
      board.typeText('\u00e9\u00e8\u00ea');
      board.typeText('X');
      board.typeText('\u00e9\u00e8\u00ea');
      expect(board.parentText).assertEqual('\u00e9\u00e8\u00ea');
      expect(board.inputEvents).assertEqual(3);
      expect(board.mainTitle()).assertEqual(board.bottomEcho());
      expect(board.mainTitle().length).assertEqual(board.parentText.length);
      expect(board.inputPlaceholder()).assertEqual('\u8bf7\u8f93\u5165\u4f60\u7684\u65b0\u5e74\u613f\u671b...');
      expect(board.updateClicks).assertEqual(0);
    });

  });
}
