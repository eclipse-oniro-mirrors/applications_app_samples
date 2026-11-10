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

const MAX_SANITIZED_LENGTH: number = 1024;

const REPLACEMENT: string = ' ';

interface SanitizeResult {
  value: string;
  changed: boolean;
  removedCount: number;
}

// Sanitizes user input before display or upload
class InputSanitizer {
  public static stripControlChars(value: string): SanitizeResult {
    let result: string = '';
    let removed: number = 0;
    for (let i = 0; i < value.length; i++) {
      const code = value.charCodeAt(i);
      if ((code < 32 && code !== 9 && code !== 10) || code === 127) {
        removed++;
        continue;
      }
      result += value.charAt(i);
    }
    return {
      value: result,
      changed: removed > 0,
      removedCount: removed
    };
  }

  public static collapseWhitespace(value: string): SanitizeResult {
    const collapsed = value.split('\n').join(REPLACEMENT).split('\r').join(REPLACEMENT)
      .split('\t').join(REPLACEMENT);
    let result: string = '';
    let previousSpace: boolean = false;
    let removed: number = 0;
    for (let i = 0; i < collapsed.length; i++) {
      const char = collapsed.charAt(i);
      if (char === ' ') {
        if (previousSpace) {
          removed++;
          continue;
        }
        previousSpace = true;
      } else {
        previousSpace = false;
      }
      result += char;
    }
    return {
      value: result.trim(),
      changed: removed > 0 || result !== collapsed,
      removedCount: removed
    };
  }

  public static stripHtmlTags(value: string): SanitizeResult {
    let result: string = '';
    let inTag: boolean = false;
    let removed: number = 0;
    for (let i = 0; i < value.length; i++) {
      const char = value.charAt(i);
      if (char === '<') {
        inTag = true;
        removed++;
        continue;
      }
      if (char === '>') {
        inTag = false;
        removed++;
        continue;
      }
      if (inTag) {
        removed++;
        continue;
      }
      result += char;
    }
    return { value: result, changed: removed > 0, removedCount: removed };
  }

  public static truncate(value: string, maxLength: number): SanitizeResult {
    if (maxLength <= 0) {
      return { value: '', changed: value.length > 0, removedCount: value.length };
    }
    if (value.length <= maxLength) {
      return { value: value, changed: false, removedCount: 0 };
    }
    return {
      value: value.substring(0, maxLength),
      changed: true,
      removedCount: value.length - maxLength
    };
  }

  public static sanitize(value: string): string {
    const withoutControl = InputSanitizer.stripControlChars(value);
    const withoutHtml = InputSanitizer.stripHtmlTags(withoutControl.value);
    const collapsed = InputSanitizer.collapseWhitespace(withoutHtml.value);
    return InputSanitizer.truncate(collapsed.value, MAX_SANITIZED_LENGTH).value;
  }

  public static maskPhone(value: string): string {
    const digits = InputSanitizer.digitsOnly(value);
    if (digits.length < 7) {
      return '***';
    }
    return digits.substring(0, 3) + '****' + digits.substring(digits.length - 4);
  }

  public static digitsOnly(value: string): string {
    let result: string = '';
    for (let i = 0; i < value.length; i++) {
      const code = value.charCodeAt(i);
      if (code >= 48 && code <= 57) {
        result += value.charAt(i);
      }
    }
    return result;
  }
}

// Audits sanitization changes
class SanitizerAudit {
  private inputs: number = 0;
  private changed: number = 0;
  private removedChars: number = 0;

  public record(result: SanitizeResult): void {
    this.inputs++;
    if (result.changed) {
      this.changed++;
    }
    this.removedChars += result.removedCount;
  }

  public getInputs(): number {
    return this.inputs;
  }

  public getChanged(): number {
    return this.changed;
  }

  public getRemovedChars(): number {
    return this.removedChars;
  }

  public changeRate(): number {
    return this.inputs === 0 ? 0 : this.changed * 100 / this.inputs;
  }

  public reset(): void {
    this.inputs = 0;
    this.changed = 0;
    this.removedChars = 0;
  }
}

export default function inputSanitizerValidationTest() {
  describe('InputSanitizerValidation_Test', () => {

    it('sanitizer_should_strip_control_chars', 0, () => {
      const result = InputSanitizer.stripControlChars('abc');
      expect(result.value).assertEqual('abc');
      expect(result.changed).assertFalse();
      expect(result.removedCount).assertEqual(0);
      const withControl = InputSanitizer.stripControlChars('a' + String.fromCharCode(1) + 'b');
      expect(withControl.value).assertEqual('ab');
      expect(withControl.changed).assertTrue();
      expect(withControl.removedCount).assertEqual(1);
    });

    it('sanitizer_should_keep_tabs_and_newlines', 0, () => {
      const result = InputSanitizer.stripControlChars('a\nb\tc');
      expect(result.value).assertEqual('a\nb\tc');
      expect(result.changed).assertFalse();
      const del = InputSanitizer.stripControlChars('a' + String.fromCharCode(127));
      expect(del.value).assertEqual('a');
      expect(del.removedCount).assertEqual(1);
    });

    it('sanitizer_should_collapse_whitespace', 0, () => {
      const result = InputSanitizer.collapseWhitespace('  a   b  ');
      expect(result.value).assertEqual('a b');
      expect(result.changed).assertTrue();
      const plain = InputSanitizer.collapseWhitespace('a b');
      expect(plain.value).assertEqual('a b');
      expect(plain.changed).assertFalse();
      expect(InputSanitizer.collapseWhitespace('a\n\nb').value).assertEqual('a b');
    });

    it('sanitizer_should_strip_html_tags', 0, () => {
      const result = InputSanitizer.stripHtmlTags('<b>bold</b> text');
      expect(result.value).assertEqual('bold text');
      expect(result.changed).assertTrue();
      expect(result.removedCount).assertEqual(7);
      const plain = InputSanitizer.stripHtmlTags('plain');
      expect(plain.changed).assertFalse();
      expect(plain.value).assertEqual('plain');
    });

    it('sanitizer_should_handle_unclosed_tags', 0, () => {
      const result = InputSanitizer.stripHtmlTags('text <b unclosed');
      expect(result.value).assertEqual('text ');
      expect(result.changed).assertTrue();
      expect(result.removedCount).assertLarger(0);
    });

    it('sanitizer_should_truncate', 0, () => {
      expect(InputSanitizer.truncate('abc', 5).value).assertEqual('abc');
      expect(InputSanitizer.truncate('abc', 5).changed).assertFalse();
      const cut = InputSanitizer.truncate('abcdef', 3);
      expect(cut.value).assertEqual('abc');
      expect(cut.changed).assertTrue();
      expect(cut.removedCount).assertEqual(3);
      const zero = InputSanitizer.truncate('abc', 0);
      expect(zero.value).assertEqual('');
      expect(zero.removedCount).assertEqual(3);
    });

    it('sanitizer_should_compose_pipeline', 0, () => {
      const raw = '  <b>screen</b>   flickers\n when\t switching  ';
      const sanitized = InputSanitizer.sanitize(raw);
      expect(sanitized).assertEqual('screen flickers when switching');
      expect(sanitized.indexOf('<')).assertEqual(-1);
      expect(sanitized.indexOf('\n')).assertEqual(-1);
      expect(sanitized.indexOf('\t')).assertEqual(-1);
    });

    it('sanitizer_should_limit_pipeline_output', 0, () => {
      const raw = 'a'.repeat(MAX_SANITIZED_LENGTH + 100);
      const sanitized = InputSanitizer.sanitize(raw);
      expect(sanitized.length).assertEqual(MAX_SANITIZED_LENGTH);
      expect(InputSanitizer.sanitize('')).assertEqual('');
    });

    it('sanitizer_should_mask_phone', 0, () => {
      expect(InputSanitizer.maskPhone('13812345678')).assertEqual('138****5678');
      expect(InputSanitizer.maskPhone('138-1234-5678')).assertEqual('138****5678');
      expect(InputSanitizer.maskPhone('123')).assertEqual('***');
      expect(InputSanitizer.maskPhone('')).assertEqual('***');
    });

    it('sanitizer_should_extract_digits', 0, () => {
      expect(InputSanitizer.digitsOnly('a1b2c3')).assertEqual('123');
      expect(InputSanitizer.digitsOnly('no digits')).assertEqual('');
      expect(InputSanitizer.digitsOnly('138 1234 5678')).assertEqual('13812345678');
    });

    it('audit_should_track_sanitization', 0, () => {
      const audit = new SanitizerAudit();
      audit.record(InputSanitizer.stripControlChars('abc'));
      audit.record(InputSanitizer.stripControlChars('a' + String.fromCharCode(1)));
      audit.record(InputSanitizer.stripControlChars('b' + String.fromCharCode(2) + String.fromCharCode(3)));
      expect(audit.getInputs()).assertEqual(3);
      expect(audit.getChanged()).assertEqual(2);
      expect(audit.getRemovedChars()).assertEqual(3);
      expect(audit.changeRate()).assertLarger(66);
      audit.reset();
      expect(audit.getInputs()).assertEqual(0);
    });

    it('sanitize_flow_should_protect_description', 0, () => {
      const raw = '  <i>issue</i>   at\tstartup  ';
      const sanitized = InputSanitizer.sanitize(raw);
      const digits = InputSanitizer.digitsOnly('call 13812345678');
      expect(sanitized).assertEqual('issue at startup');
      expect(digits).assertEqual('13812345678');
      expect(InputSanitizer.maskPhone(digits)).assertEqual('138****5678');
      expect(sanitized.length).assertLessOrEqual(MAX_SANITIZED_LENGTH);
    });

    it('sanitizer_constants_should_be_stable', 0, () => {
      expect(MAX_SANITIZED_LENGTH).assertEqual(1024);
      expect(REPLACEMENT).assertEqual(' ');
    });
  });
}

