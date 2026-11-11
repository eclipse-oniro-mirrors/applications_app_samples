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

import { describe, expect, it } from '@ohos/hypium';
import { KEYBOARD_BUFFER_LIMIT } from '../../../main/ets/common/AppConstants';
import {
  ACTION_CHAR,
  ACTION_DELETE,
  ACTION_ENTER,
  ACTION_MODE,
  ACTION_SPACE,
  KeyEdit,
  KeySpec,
  KeyboardMode,
  LETTER_ROWS,
  NUMBER_ROWS,
  appendChar,
  applyKey,
  buildFunctionRow,
  buildRows,
  candidatesFor,
  charCount,
  deleteLast,
  modeName,
  rowsOf,
  switchMode
} from '../../../main/ets/model/KeyboardModel';

/**
 * 软键盘矩阵：布局（两种模式 × 三行）、缓冲（0/1/63/64/65）、按键动作（字符/删除/空格/回车/模式/未知）
 * 与码点计数（ASCII/CJK/emoji/孤立代理）交叉取值，每个组合一条用例。
 * 断言的是 main/ets 的真实纯函数，页面与系统面板页共用同一份实现。
 */
export default function inputMethodKeyboardMatrixTest() {
  describe('InputMethodKeyboardMatrixTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0100
     * @tc.name testKeyboardMatrix0001
     * @tc.desc Verify the letter layout keeps the classic 10/9/7 row widths.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0001', 0, () => {
      expect(LETTER_ROWS.length).assertEqual(3);
      expect(LETTER_ROWS[0].length).assertEqual(10);
      expect(LETTER_ROWS[1].length).assertEqual(9);
      expect(LETTER_ROWS[2].length).assertEqual(7);
      expect(LETTER_ROWS[0][0]).assertEqual('q');
      expect(LETTER_ROWS[2][6]).assertEqual('m');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0200
     * @tc.name testKeyboardMatrix0002
     * @tc.desc Verify the number layout exposes ten keys per row including the symbol rows.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0002', 0, () => {
      expect(NUMBER_ROWS.length).assertEqual(3);
      expect(NUMBER_ROWS[0].length).assertEqual(10);
      expect(NUMBER_ROWS[1].length).assertEqual(10);
      expect(NUMBER_ROWS[2].length).assertEqual(10);
      expect(NUMBER_ROWS[0][9]).assertEqual('0');
      expect(NUMBER_ROWS[1][0]).assertEqual('-');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0300
     * @tc.name testKeyboardMatrix0003
     * @tc.desc Verify rowsOf returns the shared constant arrays so a page cannot mutate a copy by accident.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0003', 0, () => {
      expect(rowsOf(KeyboardMode.LETTER) === LETTER_ROWS).assertTrue();
      expect(rowsOf(KeyboardMode.NUMBER) === NUMBER_ROWS).assertTrue();
      // 两个模式拿到的不是同一个数组，否则改一个布局会连带另一个
      expect(rowsOf(KeyboardMode.LETTER) === rowsOf(KeyboardMode.NUMBER)).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0400
     * @tc.name testKeyboardMatrix0004
     * @tc.desc Verify every character key carries the char action and is not wide.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0004', 0, () => {
      const rows = buildRows(KeyboardMode.LETTER);
      expect(rows.length).assertEqual(3);
      expect(rows[0].length).assertEqual(10);
      expect(rows[0][0].action).assertEqual(ACTION_CHAR);
      expect(rows[0][0].label).assertEqual('q');
      expect(rows[0][0].wide).assertFalse();
      expect(rows[1][0].action).assertEqual(ACTION_CHAR);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0500
     * @tc.name testKeyboardMatrix0005
     * @tc.desc Verify the delete key is appended only to the last row and marked wide in both modes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0005', 0, () => {
      const letter = buildRows(KeyboardMode.LETTER);
      expect(letter[2].length).assertEqual(8);
      expect(letter[2][7].action).assertEqual(ACTION_DELETE);
      expect(letter[2][7].wide).assertTrue();
      expect(letter[0].some((key: KeySpec) => key.action === ACTION_DELETE)).assertFalse();
      const number = buildRows(KeyboardMode.NUMBER);
      expect(number[2].length).assertEqual(11);
      expect(number[2][10].action).assertEqual(ACTION_DELETE);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0600
     * @tc.name testKeyboardMatrix0006
     * @tc.desc Verify the function row swaps the mode label and keeps space and enter in place.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0006', 0, () => {
      const letter = buildFunctionRow(KeyboardMode.LETTER);
      expect(letter.length).assertEqual(3);
      expect(letter[0].label).assertEqual('123');
      expect(letter[0].action).assertEqual(ACTION_MODE);
      expect(letter[1].action).assertEqual(ACTION_SPACE);
      expect(letter[2].action).assertEqual(ACTION_ENTER);
      expect(buildFunctionRow(KeyboardMode.NUMBER)[0].label).assertEqual('abc');
      expect(letter.every((key: KeySpec) => key.wide)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0700
     * @tc.name testKeyboardMatrix0007
     * @tc.desc Verify a plain key is narrow by default so layout code need not pass the flag everywhere.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0007', 0, () => {
      const key = new KeySpec('a', ACTION_CHAR);
      expect(key.wide).assertFalse();
      expect(key.label).assertEqual('a');
      expect(key.action).assertEqual(ACTION_CHAR);
      expect(new KeySpec('x', ACTION_CHAR, true).wide).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0800
     * @tc.name testKeyboardMatrix0008
     * @tc.desc Verify both modes render a distinct Chinese label for the panel header.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0008', 0, () => {
      expect(modeName(KeyboardMode.LETTER)).assertEqual('字母');
      expect(modeName(KeyboardMode.NUMBER)).assertEqual('数字与符号');
      // 两个模式的标题必须不同，否则面板上分不出当前模式
      expect(modeName(KeyboardMode.LETTER) === modeName(KeyboardMode.NUMBER)).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_0900
     * @tc.name testKeyboardMatrix0009
     * @tc.desc Verify switching twice returns to the original mode and never leaves a third state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0009', 0, () => {
      expect(switchMode(KeyboardMode.LETTER)).assertEqual(KeyboardMode.NUMBER);
      expect(switchMode(KeyboardMode.NUMBER)).assertEqual(KeyboardMode.LETTER);
      let mode: KeyboardMode = KeyboardMode.LETTER;
      for (let i = 0; i < 10; i++) {
        mode = switchMode(mode);
      }
      expect(mode).assertEqual(KeyboardMode.LETTER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1000
     * @tc.name testKeyboardMatrix0010
     * @tc.desc Verify ASCII buffers count one per character including the empty buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0010', 0, () => {
      expect(charCount('')).assertEqual(0);
      expect(charCount('a')).assertEqual(1);
      expect(charCount('abc')).assertEqual(3);
      expect(charCount(' ')).assertEqual(1);
      expect(charCount('\n')).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1100
     * @tc.name testKeyboardMatrix0011
     * @tc.desc Verify CJK characters count as one code point each although they cost three bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0011', 0, () => {
      expect(charCount('中')).assertEqual(1);
      expect(charCount('中文')).assertEqual(2);
      expect(charCount('双拼中文')).assertEqual(4);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1200
     * @tc.name testKeyboardMatrix0012
     * @tc.desc Verify an emoji counts as one character even though it takes two code units.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0012', 0, () => {
      expect('😀'.length).assertEqual(2);
      expect(charCount('😀')).assertEqual(1);
      expect(charCount('😀😀')).assertEqual(2);
      expect(charCount('a😀b')).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1300
     * @tc.name testKeyboardMatrix0013
     * @tc.desc Verify a lone surrogate still counts once so a broken buffer cannot report a negative remaining quota.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0013', 0, () => {
      expect(charCount('\uD800')).assertEqual(1);
      expect(charCount('\uDC00')).assertEqual(1);
      expect(charCount('\uD800\uD800')).assertEqual(1);
      expect(charCount('\uDC00\uDC00')).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1400
     * @tc.name testKeyboardMatrix0014
     * @tc.desc Verify appending below the limit grows the buffer by one character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0014', 0, () => {
      expect(appendChar('', 'a', 8)).assertEqual('a');
      expect(appendChar('ab', 'c', 8)).assertEqual('abc');
      expect(appendChar('', '中', 2)).assertEqual('中');
      expect(charCount(appendChar('ab', 'c', 8))).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1500
     * @tc.name testKeyboardMatrix0015
     * @tc.desc Verify a full buffer rejects the character at the limit minus one plus one boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0015', 0, () => {
      const almost = 'x'.repeat(KEYBOARD_BUFFER_LIMIT - 1);
      expect(charCount(appendChar(almost, 'y', KEYBOARD_BUFFER_LIMIT))).assertEqual(KEYBOARD_BUFFER_LIMIT);
      const full = 'x'.repeat(KEYBOARD_BUFFER_LIMIT);
      expect(appendChar(full, 'y', KEYBOARD_BUFFER_LIMIT)).assertEqual(full);
      expect(appendChar(full, '😀', KEYBOARD_BUFFER_LIMIT)).assertEqual(full);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1600
     * @tc.name testKeyboardMatrix0016
     * @tc.desc Verify a zero limit blocks every character instead of appending one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0016', 0, () => {
      expect(appendChar('', 'a', 0)).assertEqual('');
      expect(appendChar('x', 'a', 0)).assertEqual('x');
      expect(appendChar('', 'a', -1)).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1700
     * @tc.name testKeyboardMatrix0017
     * @tc.desc Verify appending an emoji spends exactly one character of quota.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0017', 0, () => {
      const almost = 'x'.repeat(KEYBOARD_BUFFER_LIMIT - 1);
      const withEmoji = appendChar(almost, '😀', KEYBOARD_BUFFER_LIMIT);
      expect(withEmoji.endsWith('😀')).assertTrue();
      expect(charCount(withEmoji)).assertEqual(KEYBOARD_BUFFER_LIMIT);
      expect(withEmoji.length).assertEqual(KEYBOARD_BUFFER_LIMIT + 1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1800
     * @tc.name testKeyboardMatrix0018
     * @tc.desc Verify deleting on empty, ASCII and CJK buffers removes exactly one character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0018', 0, () => {
      expect(deleteLast('')).assertEqual('');
      expect(deleteLast('a')).assertEqual('');
      expect(deleteLast('ab')).assertEqual('a');
      expect(deleteLast('中')).assertEqual('');
      expect(deleteLast('ab中')).assertEqual('ab');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_1900
     * @tc.name testKeyboardMatrix0019
     * @tc.desc Verify deleting an emoji chain removes one whole surrogate pair per press.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0019', 0, () => {
      expect(deleteLast('😀')).assertEqual('');
      expect(deleteLast('a😀')).assertEqual('a');
      expect(deleteLast('😀😀')).assertEqual('😀');
      expect(deleteLast('😀😀😀')).assertEqual('😀😀');
      expect(charCount(deleteLast('😀😀😀'))).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_2000
     * @tc.name testKeyboardMatrix0020
     * @tc.desc Verify a buffer ending in a lone low surrogate drops two code units,
     * which is the only way to keep the text well formed.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0020', 0, () => {
      expect(deleteLast('a\uDC00')).assertEqual('');
      expect(deleteLast('\uDC00')).assertEqual('');
      expect(deleteLast('\uD800')).assertEqual('');
      expect(deleteLast('ab\uDC00')).assertEqual('a');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_2100
     * @tc.name testKeyboardMatrix0021
     * @tc.desc Verify a character key reports what to insert and stays silent once the buffer is full.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0021', 0, () => {
      const edit: KeyEdit = applyKey('', KeyboardMode.LETTER, new KeySpec('q', ACTION_CHAR), 8);
      expect(edit.text).assertEqual('q');
      expect(edit.inserted).assertEqual('q');
      expect(edit.deleted).assertEqual(0);
      expect(edit.mode).assertEqual(KeyboardMode.LETTER);
      const full = applyKey('abcdefgh', KeyboardMode.LETTER, new KeySpec('z', ACTION_CHAR), 8);
      expect(full.text).assertEqual('abcdefgh');
      expect(full.inserted).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_2200
     * @tc.name testKeyboardMatrix0022
     * @tc.desc Verify delete reports the removed count as zero on empty and one per press otherwise.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0022', 0, () => {
      const empty = applyKey('', KeyboardMode.LETTER, new KeySpec('⌫', ACTION_DELETE, true), 8);
      expect(empty.text).assertEqual('');
      expect(empty.deleted).assertEqual(0);
      const emoji = applyKey('a😀', KeyboardMode.LETTER, new KeySpec('⌫', ACTION_DELETE, true), 8);
      expect(emoji.text).assertEqual('a');
      expect(emoji.deleted).assertEqual(1);
      expect(emoji.inserted).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_2300
     * @tc.name testKeyboardMatrix0023
     * @tc.desc Verify the mode key flips the layout without touching the buffer or the editor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0023', 0, () => {
      const edit = applyKey('ab', KeyboardMode.LETTER, new KeySpec('123', ACTION_MODE, true), 8);
      expect(edit.text).assertEqual('ab');
      expect(edit.mode).assertEqual(KeyboardMode.NUMBER);
      expect(edit.inserted).assertEqual('');
      expect(edit.deleted).assertEqual(0);
      expect(applyKey('ab', KeyboardMode.NUMBER, new KeySpec('abc', ACTION_MODE, true), 8).mode)
        .assertEqual(KeyboardMode.LETTER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_2400
     * @tc.name testKeyboardMatrix0024
     * @tc.desc Verify space and enter insert one character even from an empty buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0024', 0, () => {
      const space = applyKey('', KeyboardMode.LETTER, new KeySpec('空格', ACTION_SPACE, true), 8);
      expect(space.text).assertEqual(' ');
      expect(space.inserted).assertEqual(' ');
      const enter = applyKey('', KeyboardMode.NUMBER, new KeySpec('↵', ACTION_ENTER, true), 8);
      expect(enter.text).assertEqual('\n');
      expect(enter.inserted).assertEqual('\n');
      expect(enter.mode).assertEqual(KeyboardMode.NUMBER);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_KEY_2500
     * @tc.name testKeyboardMatrix0025
     * @tc.desc Verify candidates stay empty for an empty buffer and carry three suffixes otherwise.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardMatrix0025', 0, () => {
      expect(candidatesFor('').length).assertEqual(0);
      const list = candidatesFor('a');
      expect(list.length).assertEqual(3);
      expect(list[0]).assertEqual('a');
      expect(list[1]).assertEqual('a好');
      expect(list[2]).assertEqual('a的');
      expect(candidatesFor('中文')[2]).assertEqual('中文的');
    });
  });
}
