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
  ACTION_SPACE,
  KeyEdit,
  KeySpec,
  KeyboardMode,
  applyKey,
  buildFunctionRow,
  buildRows,
  candidatesFor,
  charCount,
  modeName,
  switchMode
} from '../../../main/ets/model/KeyboardModel';

/**
 * 从 buildRows/buildFunctionRow 里按标签取真实按键，取不到就抛错。
 * 用例只描述“按了哪个键”，键位定义仍由 KeyboardModel 提供，不在测试里另写一份布局。
 */
function requireKey(label: string, mode: KeyboardMode): KeySpec {
  const rows: KeySpec[][] = buildRows(mode);
  for (let i = 0; i < rows.length; i++) {
    for (let j = 0; j < rows[i].length; j++) {
      if (rows[i][j].label === label) {
        return rows[i][j];
      }
    }
  }
  const functions: KeySpec[] = buildFunctionRow(mode);
  for (let i = 0; i < functions.length; i++) {
    if (functions[i].label === label) {
      return functions[i];
    }
  }
  throw new Error(`KeyboardModel 中没有这个按键：${label}`);
}

/** 按一次键：入参与返回值直接走 applyKey，测试不复制编辑规则 */
function press(text: string, mode: KeyboardMode, label: string, limit: number): KeyEdit {
  return applyKey(text, mode, requireKey(label, mode), limit);
}

/** 连续按键：每一步都用上一步的文本与模式，模拟真实的连续输入 */
function pressAll(labels: string[], startMode: KeyboardMode, limit: number): KeyEdit {
  const startText: string = '';
  let edit: KeyEdit = new KeyEdit(startText, startMode, startText, 0);
  for (let i = 0; i < labels.length; i++) {
    edit = applyKey(edit.text, edit.mode, requireKey(labels[i], edit.mode), limit);
  }
  return edit;
}

/**
 * 键盘状态机流程：连续输入、删除到空、缓冲封顶、模式往返。
 * 与单点矩阵互补——这里断言的是“一串按键之后的状态”，
 * 逐步调用 main/ets 的 applyKey，键位与规则都取自被测实现。
 */
export default function inputMethodKeyboardFlowTest() {
  describe('InputMethodKeyboardFlowTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0100
     * @tc.name testKeyboardFlow0001
     * @tc.desc Verify three consecutive letter presses append in order and report only the last character as inserted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0001', 0, () => {
      const edit = pressAll(['q', 'w', 'e'], KeyboardMode.LETTER, KEYBOARD_BUFFER_LIMIT);
      expect(edit.text).assertEqual('qwe');
      expect(edit.mode).assertEqual(KeyboardMode.LETTER);
      expect(edit.inserted).assertEqual('e');
      expect(edit.deleted).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0200
     * @tc.name testKeyboardFlow0002
     * @tc.desc Verify the letter layout exposes plain character keys and a wide delete key on the last row.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0002', 0, () => {
      expect(requireKey('q', KeyboardMode.LETTER).action).assertEqual(ACTION_CHAR);
      expect(requireKey('p', KeyboardMode.LETTER).wide).assertFalse();
      expect(requireKey('m', KeyboardMode.LETTER).action).assertEqual(ACTION_CHAR);
      expect(requireKey('⌫', KeyboardMode.LETTER).action).assertEqual(ACTION_DELETE);
      expect(requireKey('⌫', KeyboardMode.LETTER).wide).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0300
     * @tc.name testKeyboardFlow0003
     * @tc.desc Verify the number layout is reachable by label and digits type in order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0003', 0, () => {
      expect(requireKey('1', KeyboardMode.NUMBER).action).assertEqual(ACTION_CHAR);
      expect(requireKey('¥', KeyboardMode.NUMBER).label).assertEqual('¥');
      expect(requireKey('=', KeyboardMode.NUMBER).action).assertEqual(ACTION_CHAR);
      expect(pressAll(['1', '2', '3'], KeyboardMode.NUMBER, KEYBOARD_BUFFER_LIMIT).text).assertEqual('123');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0400
     * @tc.name testKeyboardFlow0004
     * @tc.desc Verify the space key inserts exactly one blank and leaves the mode alone.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0004', 0, () => {
      const edit = press('ab', KeyboardMode.LETTER, '空格', KEYBOARD_BUFFER_LIMIT);
      expect(edit.text).assertEqual('ab ');
      expect(edit.inserted).assertEqual(' ');
      expect(edit.deleted).assertEqual(0);
      expect(requireKey('空格', KeyboardMode.LETTER).action).assertEqual(ACTION_SPACE);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0500
     * @tc.name testKeyboardFlow0005
     * @tc.desc Verify the enter key forwards a newline instead of the key label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0005', 0, () => {
      const edit = press('ab', KeyboardMode.LETTER, '↵', KEYBOARD_BUFFER_LIMIT);
      expect(edit.text).assertEqual('ab\n');
      expect(edit.inserted).assertEqual('\n');
      expect(edit.text.endsWith('\n')).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0600
     * @tc.name testKeyboardFlow0006
     * @tc.desc Verify the mode key flips the layout without touching the buffer or reporting an insertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0006', 0, () => {
      const edit = press('ab', KeyboardMode.LETTER, '123', KEYBOARD_BUFFER_LIMIT);
      expect(edit.mode).assertEqual(KeyboardMode.NUMBER);
      expect(edit.text).assertEqual('ab');
      expect(edit.inserted).assertEqual('');
      expect(edit.deleted).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0700
     * @tc.name testKeyboardFlow0007
     * @tc.desc Verify two mode presses restore the letter layout and its function row label.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0007', 0, () => {
      const first = press('ab', KeyboardMode.LETTER, '123', KEYBOARD_BUFFER_LIMIT);
      const second = applyKey(first.text, first.mode, requireKey('abc', first.mode), KEYBOARD_BUFFER_LIMIT);
      expect(second.mode).assertEqual(KeyboardMode.LETTER);
      expect(second.text).assertEqual('ab');
      expect(buildFunctionRow(second.mode)[0].label).assertEqual('123');
      expect(modeName(second.mode)).assertEqual('字母');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0800
     * @tc.name testKeyboardFlow0008
     * @tc.desc Verify repeated deletes shrink the buffer one character at a time and stop at empty.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0008', 0, () => {
      const first = press('abc', KeyboardMode.LETTER, '⌫', KEYBOARD_BUFFER_LIMIT);
      const second = press(first.text, first.mode, '⌫', KEYBOARD_BUFFER_LIMIT);
      const third = press(second.text, second.mode, '⌫', KEYBOARD_BUFFER_LIMIT);
      const extra = press(third.text, third.mode, '⌫', KEYBOARD_BUFFER_LIMIT);
      expect(first.text).assertEqual('ab');
      expect(second.text).assertEqual('a');
      expect(third.text).assertEqual('');
      expect(first.deleted).assertEqual(1);
      expect(extra.deleted).assertEqual(0);
      expect(extra.text).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_0900
     * @tc.name testKeyboardFlow0009
     * @tc.desc Verify deleting in the number layout keeps the number layout, so the keyboard does not jump back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0009', 0, () => {
      const edit = press('12', KeyboardMode.NUMBER, '⌫', KEYBOARD_BUFFER_LIMIT);
      expect(edit.text).assertEqual('1');
      expect(edit.mode).assertEqual(KeyboardMode.NUMBER);
      expect(edit.deleted).assertEqual(1);
      expect(modeName(edit.mode)).assertEqual('数字与符号');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1000
     * @tc.name testKeyboardFlow0010
     * @tc.desc Verify one delete removes a whole surrogate pair,
     * which is what the buffer limit counts as one character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0010', 0, () => {
      const edit = applyKey('😀', KeyboardMode.LETTER, requireKey('⌫', KeyboardMode.LETTER), KEYBOARD_BUFFER_LIMIT);
      expect(edit.text).assertEqual('');
      expect(edit.text.length).assertEqual(0);
      expect(edit.deleted).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1100
     * @tc.name testKeyboardFlow0011
     * @tc.desc Verify deleting past an emoji leaves the ascii prefix intact before removing the emoji.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0011', 0, () => {
      const first = applyKey('a😀', KeyboardMode.LETTER, requireKey('⌫', KeyboardMode.LETTER), KEYBOARD_BUFFER_LIMIT);
      const second = applyKey(first.text, first.mode, requireKey('⌫', KeyboardMode.LETTER), KEYBOARD_BUFFER_LIMIT);
      expect(first.text).assertEqual('a');
      expect(second.text).assertEqual('');
      expect(first.deleted).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1200
     * @tc.name testKeyboardFlow0012
     * @tc.desc Verify typing past the buffer limit keeps the text at exactly the limit and reports no insertion.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0012', 0, () => {
      const edit = pressAll(['q', 'w', 'e', 'r', 't'], KeyboardMode.LETTER, 3);
      expect(edit.text).assertEqual('qwe');
      expect(charCount(edit.text)).assertEqual(3);
      expect(edit.inserted).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1300
     * @tc.name testKeyboardFlow0013
     * @tc.desc Verify a zero limit turns every character key into a no-op instead of appending one character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0013', 0, () => {
      const edit = press('', KeyboardMode.LETTER, 'q', 0);
      expect(edit.text).assertEqual('');
      expect(edit.inserted).assertEqual('');
      expect(charCount(edit.text)).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1400
     * @tc.name testKeyboardFlow0014
     * @tc.desc Verify an emoji costs one slot of the limit,
     * so a limit of two admits one emoji plus one ascii character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0014', 0, () => {
      const emoji = applyKey('', KeyboardMode.LETTER, new KeySpec('😀', ACTION_CHAR), 2);
      const mixed = applyKey(emoji.text, emoji.mode, new KeySpec('x', ACTION_CHAR), 2);
      const blocked = applyKey(mixed.text, mixed.mode, new KeySpec('y', ACTION_CHAR), 2);
      expect(emoji.text).assertEqual('😀');
      expect(mixed.text).assertEqual('😀x');
      expect(mixed.text.length).assertEqual(3);
      expect(charCount(mixed.text)).assertEqual(2);
      expect(blocked.text).assertEqual('😀x');
      expect(blocked.inserted).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1500
     * @tc.name testKeyboardFlow0015
     * @tc.desc Verify enter cannot push the buffer past its limit,
     * which would otherwise write an extra newline to the editor.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0015', 0, () => {
      const edit = press('abc', KeyboardMode.LETTER, '↵', 3);
      expect(edit.text).assertEqual('abc');
      expect(edit.inserted).assertEqual('');
      expect(charCount(edit.text)).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1600
     * @tc.name testKeyboardFlow0016
     * @tc.desc Verify the space key obeys the same limit as character keys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0016', 0, () => {
      const edit = press('a', KeyboardMode.LETTER, '空格', 1);
      expect(edit.text).assertEqual('a');
      expect(edit.inserted).assertEqual('');
      expect(edit.text.includes(' ')).assertFalse();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1700
     * @tc.name testKeyboardFlow0017
     * @tc.desc Verify an action the model does not know is treated as a character so no key becomes a silent no-op.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0017', 0, () => {
      const edit = applyKey('a', KeyboardMode.LETTER, new KeySpec('?', 'raw'), KEYBOARD_BUFFER_LIMIT);
      expect(edit.text).assertEqual('a?');
      expect(edit.inserted).assertEqual('?');
      expect(edit.deleted).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1800
     * @tc.name testKeyboardFlow0018
     * @tc.desc Verify editing after a delete continues from the shortened text instead of a stale buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0018', 0, () => {
      const deleted = press('ab', KeyboardMode.LETTER, '⌫', KEYBOARD_BUFFER_LIMIT);
      const typed = press(deleted.text, deleted.mode, 'z', KEYBOARD_BUFFER_LIMIT);
      expect(deleted.text).assertEqual('a');
      expect(typed.text).assertEqual('az');
      expect(typed.inserted).assertEqual('z');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_1900
     * @tc.name testKeyboardFlow0019
     * @tc.desc Verify the candidate bar mirrors the buffer and keeps the demo suffix order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0019', 0, () => {
      const candidates = candidatesFor('ni');
      expect(candidates.length).assertEqual(3);
      expect(candidates[0]).assertEqual('ni');
      expect(candidates[1]).assertEqual('ni好');
      expect(candidates[2]).assertEqual('ni的');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_2000
     * @tc.name testKeyboardFlow0020
     * @tc.desc Verify deleting back to empty clears the candidates, so the bar never suggests stale text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0020', 0, () => {
      let text = 'ni';
      text = press(text, KeyboardMode.LETTER, '⌫', KEYBOARD_BUFFER_LIMIT).text;
      text = press(text, KeyboardMode.LETTER, '⌫', KEYBOARD_BUFFER_LIMIT).text;
      expect(text).assertEqual('');
      expect(candidatesFor(text).length).assertEqual(0);
      expect(charCount(text)).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_2100
     * @tc.name testKeyboardFlow0021
     * @tc.desc Verify a full buffer of sixty four characters can be typed and cleared without drifting off the limit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0021', 0, () => {
      let text = '';
      for (let i = 0; i < KEYBOARD_BUFFER_LIMIT; i++) {
        text = press(text, KeyboardMode.LETTER, 'a', KEYBOARD_BUFFER_LIMIT).text;
      }
      expect(text.length).assertEqual(KEYBOARD_BUFFER_LIMIT);
      expect(charCount(text)).assertEqual(KEYBOARD_BUFFER_LIMIT);
      for (let i = 0; i < KEYBOARD_BUFFER_LIMIT; i++) {
        text = press(text, KeyboardMode.LETTER, '⌫', KEYBOARD_BUFFER_LIMIT).text;
      }
      expect(text).assertEqual('');
      expect(press(text, KeyboardMode.LETTER, 'z', KEYBOARD_BUFFER_LIMIT).text).assertEqual('z');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_2200
     * @tc.name testKeyboardFlow0022
     * @tc.desc Verify each press yields its own result object so the page cannot mutate the previous state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0022', 0, () => {
      const first = applyKey('a', KeyboardMode.LETTER, new KeySpec('b', ACTION_CHAR), KEYBOARD_BUFFER_LIMIT);
      const second = applyKey('a', KeyboardMode.LETTER, new KeySpec('c', ACTION_CHAR), KEYBOARD_BUFFER_LIMIT);
      expect(first.text).assertEqual('ab');
      expect(second.text).assertEqual('ac');
      expect(first.inserted).assertEqual('b');
      expect(second.inserted).assertEqual('c');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_FLOW_2300
     * @tc.name testKeyboardFlow0023
     * @tc.desc Verify switching mode changes the row contents while the layout stays three rows with a delete key.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testKeyboardFlow0023', 0, () => {
      const letters = buildRows(KeyboardMode.LETTER);
      const numbers = buildRows(KeyboardMode.NUMBER);
      expect(letters.length).assertEqual(3);
      expect(numbers.length).assertEqual(3);
      expect(letters[0][0].label).assertEqual('q');
      expect(numbers[0][0].label).assertEqual('1');
      expect(letters[2][letters[2].length - 1].action).assertEqual(ACTION_DELETE);
      expect(numbers[2][numbers[2].length - 1].action).assertEqual(ACTION_DELETE);
      expect(switchMode(KeyboardMode.LETTER)).assertEqual(KeyboardMode.NUMBER);
    });
  });
}
