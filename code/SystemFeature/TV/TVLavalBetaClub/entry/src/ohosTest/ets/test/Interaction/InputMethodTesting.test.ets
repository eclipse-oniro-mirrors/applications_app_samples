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

import { describe, it, expect } from '@ohos/hypium';

const MAX_INPUT_LENGTH: number = 1024;

const MAX_COMPOSING_LENGTH: number = 64;

const CURSOR_MIN: number = 0;

interface InputState {
  value: string;
  cursor: number;
  composing: string;
}

// Models text editing operations used by the issue description field
class InputMethodController {
  private value: string = '';
  private cursor: number = 0;
  private composing: string = '';
  private readonly maxLength: number;

  constructor(maxLength: number) {
    this.maxLength = maxLength;
  }

  public insert(text: string): boolean {
    if (text.length === 0 || this.value.length + text.length > this.maxLength) {
      return false;
    }
    this.value = this.value.substring(0, this.cursor) + text +
      this.value.substring(this.cursor);
    this.cursor += text.length;
    return true;
  }

  public deleteBackward(): boolean {
    if (this.cursor <= CURSOR_MIN) {
      return false;
    }
    this.value = this.value.substring(0, this.cursor - 1) +
      this.value.substring(this.cursor);
    this.cursor--;
    return true;
  }

  public deleteForward(): boolean {
    if (this.cursor >= this.value.length) {
      return false;
    }
    this.value = this.value.substring(0, this.cursor) +
      this.value.substring(this.cursor + 1);
    return true;
  }

  public moveCursor(offset: number): boolean {
    const next = this.cursor + offset;
    if (next < CURSOR_MIN || next > this.value.length) {
      return false;
    }
    this.cursor = next;
    return true;
  }

  public setCursor(position: number): boolean {
    if (position < CURSOR_MIN || position > this.value.length) {
      return false;
    }
    this.cursor = position;
    return true;
  }

  public setComposing(text: string): boolean {
    if (text.length > MAX_COMPOSING_LENGTH) {
      return false;
    }
    this.composing = text;
    return true;
  }

  public commitComposing(): boolean {
    if (this.composing.length === 0) {
      return false;
    }
    const committed = this.composing;
    this.composing = '';
    return this.insert(committed);
  }

  public getValue(): string {
    return this.value;
  }

  public getCursor(): number {
    return this.cursor;
  }

  public getComposing(): string {
    return this.composing;
  }

  public state(): InputState {
    return { value: this.value, cursor: this.cursor, composing: this.composing };
  }

  public isFull(): boolean {
    return this.value.length >= this.maxLength;
  }

  public clear(): void {
    this.value = '';
    this.cursor = 0;
    this.composing = '';
  }
}

// Validates pasted or programmatic text input
class InputTextValidator {
  public static isWithinLimit(value: string, maxLength: number): boolean {
    return value.length <= maxLength;
  }

  public static hasOnlyPrintable(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      const code = value.charCodeAt(i);
      if ((code < 32 && code !== 9 && code !== 10) || code === 127) {
        return false;
      }
    }
    return true;
  }

  public static countLines(value: string): number {
    if (value.length === 0) {
      return 0;
    }
    return value.split('\n').length;
  }

  public static normalize(value: string): string {
    return value.split('\r').join('').trim();
  }

  public static isBlank(value: string): boolean {
    return value.trim().length === 0;
  }
}

// Simulates remote numeric and letter keyboard entry
class RemoteKeyboard {
  private static readonly DIGITS: string[] = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];

  public static keyForDigit(digit: number): string {
    if (digit < 0 || digit >= RemoteKeyboard.DIGITS.length) {
      return '';
    }
    return RemoteKeyboard.DIGITS[digit];
  }

  public static isDigitKey(value: string): boolean {
    return value.length === 1 && RemoteKeyboard.DIGITS.includes(value);
  }

  public static isLetterKey(value: string): boolean {
    if (value.length !== 1) {
      return false;
    }
    const code = value.charCodeAt(0);
    return (code >= 65 && code <= 90) || (code >= 97 && code <= 122);
  }

  public static normalizeCase(value: string, uppercase: boolean): string {
    return uppercase ? value.toUpperCase() : value.toLowerCase();
  }

  public static moveCursorToEnd(controller: InputMethodController): boolean {
    return controller.setCursor(controller.getValue().length);
  }

  public static typeText(controller: InputMethodController, text: string): number {
    let inserted: number = 0;
    for (let i = 0; i < text.length; i++) {
      if (controller.insert(text.charAt(i))) {
        inserted++;
      } else {
        break;
      }
    }
    return inserted;
  }

  public static typeDigits(controller: InputMethodController, count: number): number {
    let inserted: number = 0;
    for (let i = 0; i < count; i++) {
      if (controller.insert(RemoteKeyboard.keyForDigit(i % 10))) {
        inserted++;
      }
    }
    return inserted;
  }
}

// Aggregates input method checks
class InputMethodReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

export default function inputMethodTestingTest() {
  describe('InputMethodTesting_Test', () => {

    it('controller_should_insert_at_cursor', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      expect(controller.insert('abc')).assertTrue();
      expect(controller.getValue()).assertEqual('abc');
      expect(controller.getCursor()).assertEqual(3);
      controller.setCursor(1);
      expect(controller.insert('X')).assertTrue();
      expect(controller.getValue()).assertEqual('aXbc');
      expect(controller.getCursor()).assertEqual(2);
    });

    it('controller_should_reject_empty_insert', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      expect(controller.insert('')).assertFalse();
      expect(controller.getValue()).assertEqual('');
      expect(controller.getCursor()).assertEqual(0);
    });

    it('controller_should_enforce_max_length', 0, () => {
      const controller = new InputMethodController(5);
      expect(controller.insert('abcde')).assertTrue();
      expect(controller.isFull()).assertTrue();
      expect(controller.insert('f')).assertFalse();
      expect(controller.getValue()).assertEqual('abcde');
      expect(controller.insert('')).assertFalse();
    });

    it('controller_should_delete_backward', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      controller.insert('abc');
      expect(controller.deleteBackward()).assertTrue();
      expect(controller.getValue()).assertEqual('ab');
      expect(controller.getCursor()).assertEqual(2);
      controller.setCursor(0);
      expect(controller.deleteBackward()).assertFalse();
      expect(controller.getValue()).assertEqual('ab');
    });

    it('controller_should_delete_forward', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      controller.insert('abc');
      controller.setCursor(1);
      expect(controller.deleteForward()).assertTrue();
      expect(controller.getValue()).assertEqual('ac');
      expect(controller.getCursor()).assertEqual(1);
      controller.setCursor(2);
      expect(controller.deleteForward()).assertFalse();
    });

    it('controller_should_move_cursor', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      controller.insert('abc');
      expect(controller.moveCursor(-1)).assertTrue();
      expect(controller.getCursor()).assertEqual(2);
      expect(controller.moveCursor(-5)).assertFalse();
      expect(controller.moveCursor(5)).assertFalse();
      expect(controller.moveCursor(-2)).assertTrue();
      expect(controller.getCursor()).assertEqual(0);
    });

    it('controller_should_set_cursor_bounds', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      controller.insert('abc');
      expect(controller.setCursor(0)).assertTrue();
      expect(controller.setCursor(3)).assertTrue();
      expect(controller.setCursor(4)).assertFalse();
      expect(controller.setCursor(-1)).assertFalse();
      expect(controller.getCursor()).assertEqual(3);
    });

    it('controller_should_handle_composing_text', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      expect(controller.setComposing('ni')).assertTrue();
      expect(controller.getComposing()).assertEqual('ni');
      expect(controller.getValue()).assertEqual('');
      expect(controller.commitComposing()).assertTrue();
      expect(controller.getValue()).assertEqual('ni');
      expect(controller.getComposing()).assertEqual('');
      expect(controller.commitComposing()).assertFalse();
    });

    it('controller_should_reject_long_composing', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      expect(controller.setComposing('a'.repeat(MAX_COMPOSING_LENGTH))).assertTrue();
      expect(controller.setComposing('a'.repeat(MAX_COMPOSING_LENGTH + 1))).assertFalse();
      controller.clear();
      expect(controller.getValue()).assertEqual('');
      expect(controller.getComposing()).assertEqual('');
      expect(controller.state().cursor).assertEqual(0);
    });

    it('validator_should_check_text', 0, () => {
      expect(InputTextValidator.isWithinLimit('abc', 3)).assertTrue();
      expect(InputTextValidator.isWithinLimit('abcd', 3)).assertFalse();
      expect(InputTextValidator.hasOnlyPrintable('abc')).assertTrue();
      expect(InputTextValidator.hasOnlyPrintable('a\nb')).assertTrue();
      expect(InputTextValidator.hasOnlyPrintable('bell' + String.fromCharCode(7))).assertFalse();
      expect(InputTextValidator.isBlank('   ')).assertTrue();
    });

    it('validator_should_normalize_and_count_lines', 0, () => {
      expect(InputTextValidator.normalize('  a\r\nb  ')).assertEqual('a\nb');
      expect(InputTextValidator.countLines('')).assertEqual(0);
      expect(InputTextValidator.countLines('a')).assertEqual(1);
      expect(InputTextValidator.countLines('a\nb\nc')).assertEqual(3);
      expect(InputTextValidator.normalize('\r')).assertEqual('');
    });

    it('keyboard_should_map_digit_keys', 0, () => {
      expect(RemoteKeyboard.keyForDigit(0)).assertEqual('0');
      expect(RemoteKeyboard.keyForDigit(9)).assertEqual('9');
      expect(RemoteKeyboard.keyForDigit(10)).assertEqual('');
      expect(RemoteKeyboard.keyForDigit(-1)).assertEqual('');
      expect(RemoteKeyboard.isDigitKey('5')).assertTrue();
      expect(RemoteKeyboard.isDigitKey('a')).assertFalse();
      expect(RemoteKeyboard.isDigitKey('12')).assertFalse();
    });

    it('keyboard_should_classify_letter_keys', 0, () => {
      expect(RemoteKeyboard.isLetterKey('a')).assertTrue();
      expect(RemoteKeyboard.isLetterKey('Z')).assertTrue();
      expect(RemoteKeyboard.isLetterKey('1')).assertFalse();
      expect(RemoteKeyboard.isLetterKey('')).assertFalse();
      expect(RemoteKeyboard.normalizeCase('aBc', true)).assertEqual('ABC');
      expect(RemoteKeyboard.normalizeCase('aBc', false)).assertEqual('abc');
    });

    it('keyboard_should_type_into_controller', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      expect(RemoteKeyboard.typeText(controller, 'hello')).assertEqual(5);
      expect(controller.getValue()).assertEqual('hello');
      expect(RemoteKeyboard.typeDigits(controller, 3)).assertEqual(3);
      expect(controller.getValue()).assertEqual('hello012');
      expect(RemoteKeyboard.moveCursorToEnd(controller)).assertTrue();
      expect(controller.getCursor()).assertEqual(8);
    });

    it('keyboard_should_stop_at_limit', 0, () => {
      const controller = new InputMethodController(4);
      expect(RemoteKeyboard.typeText(controller, 'abcdef')).assertEqual(4);
      expect(controller.getValue()).assertEqual('abcd');
      expect(RemoteKeyboard.typeDigits(controller, 2)).assertEqual(0);
      expect(controller.isFull()).assertTrue();
    });

    it('report_should_aggregate_input_checks', 0, () => {
      const report = new InputMethodReport();
      report.check('insert', true);
      report.check('cursor', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('compose', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['compose']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('input_flow_should_compose_and_commit', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      const report = new InputMethodReport();
      controller.insert('issue: ');
      controller.setComposing('screen');
      report.check('composing', controller.getComposing() === 'screen');
      report.check('commit', controller.commitComposing());
      controller.insert(' flickers');
      report.check('value', controller.getValue() === 'issue: screen flickers');
      expect(report.isPassed()).assertTrue();
      expect(controller.getValue().length).assertEqual(22);
      expect(InputTextValidator.isBlank(controller.getValue())).assertFalse();
    });

    it('input_flow_should_edit_middle_text', 0, () => {
      const controller = new InputMethodController(MAX_INPUT_LENGTH);
      controller.insert('abcd');
      controller.setCursor(2);
      controller.insert('XY');
      expect(controller.getValue()).assertEqual('abXYcd');
      expect(controller.deleteBackward()).assertTrue();
      expect(controller.getValue()).assertEqual('abXcd');
      expect(controller.deleteForward()).assertTrue();
      expect(controller.getValue()).assertEqual('abXd');
    });

    it('input_method_constants_should_be_stable', 0, () => {
      expect(MAX_INPUT_LENGTH).assertEqual(1024);
      expect(MAX_COMPOSING_LENGTH).assertEqual(64);
      expect(CURSOR_MIN).assertEqual(0);
    });
  });
}


