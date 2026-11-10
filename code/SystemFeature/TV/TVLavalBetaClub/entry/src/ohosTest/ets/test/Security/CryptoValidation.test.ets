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

const BASE64_CHARS: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/';

const MAX_HASH_INPUT: number = 4096;

const CHECKSUM_MOD: number = 1000003;

const MIN_SECRET_LENGTH: number = 8;

// Deterministic checksum used to validate log archives
class ChecksumUtil {
  public static checksum(value: string): number {
    if (value.length > MAX_HASH_INPUT) {
      return -1;
    }
    let hash: number = 0;
    for (let i = 0; i < value.length; i++) {
      hash = (hash * 31 + value.charCodeAt(i)) % CHECKSUM_MOD;
    }
    return hash;
  }

  public static hex(value: string): string {
    const checksum = ChecksumUtil.checksum(value);
    return checksum < 0 ? '' : checksum.toString(16);
  }

  public static matches(value: string, expected: string): boolean {
    return ChecksumUtil.hex(value) === expected;
  }

  public static isStable(value: string): boolean {
    return ChecksumUtil.checksum(value) === ChecksumUtil.checksum(value);
  }

  public static isWithinLimit(value: string): boolean {
    return value.length <= MAX_HASH_INPUT;
  }
}

// Validates base64 encoded payloads
class Base64Validator {
  public static isCharsetValid(value: string): boolean {
    for (let i = 0; i < value.length; i++) {
      const char = value.charAt(i);
      if (char === '=') {
        continue;
      }
      if (BASE64_CHARS.indexOf(char) < 0) {
        return false;
      }
    }
    return true;
  }

  public static isLengthValid(value: string): boolean {
    return value.length > 0 && value.length % 4 === 0;
  }

  public static paddingCount(value: string): number {
    let count: number = 0;
    for (let i = value.length - 1; i >= 0 && i >= value.length - 2; i--) {
      if (value.charAt(i) === '=') {
        count++;
      }
    }
    return count;
  }

  public static isValid(value: string): boolean {
    return Base64Validator.isLengthValid(value) && Base64Validator.isCharsetValid(value) &&
      Base64Validator.paddingCount(value) <= 2;
  }

  public static isDataUri(value: string): boolean {
    return value.startsWith('data:image/') && value.indexOf(';base64,') > 0;
  }
}

// Compares secrets without early exit on mismatch
class SecureCompare {
  public static equals(first: string, second: string): boolean {
    if (first.length !== second.length) {
      return false;
    }
    let diff: number = 0;
    for (let i = 0; i < first.length; i++) {
      diff = diff | (first.charCodeAt(i) ^ second.charCodeAt(i));
    }
    return diff === 0;
  }

  public static isStrongSecret(value: string): boolean {
    if (value.length < MIN_SECRET_LENGTH) {
      return false;
    }
    let hasDigit: boolean = false;
    let hasLetter: boolean = false;
    for (let i = 0; i < value.length; i++) {
      const code = value.charCodeAt(i);
      if (code >= 48 && code <= 57) {
        hasDigit = true;
      }
      if ((code >= 65 && code <= 90) || (code >= 97 && code <= 122)) {
        hasLetter = true;
      }
    }
    return hasDigit && hasLetter;
  }

  public static maskSecret(value: string): string {
    if (value.length <= 4) {
      return '***';
    }
    return value.substring(0, 2) + '***' + value.substring(value.length - 2);
  }
}

// Validates file integrity metadata before upload
class IntegrityValidator {
  public static isSha256Hex(value: string): boolean {
    const pattern: RegExp = new RegExp('^[a-fA-F0-9]{64}$');
    return pattern.test(value);
  }

  public static isMd5Hex(value: string): boolean {
    const pattern: RegExp = new RegExp('^[a-fA-F0-9]{32}$');
    return pattern.test(value);
  }

  public static isDigestSupported(algorithm: string): boolean {
    return algorithm === 'sha256' || algorithm === 'md5';
  }

  public static isSizeConsistent(declaredBytes: number, actualBytes: number): boolean {
    return declaredBytes >= 0 && actualBytes >= 0 && declaredBytes === actualBytes;
  }

  public static isWithinBudget(sizeBytes: number, budgetBytes: number): boolean {
    return sizeBytes >= 0 && budgetBytes > 0 && sizeBytes <= budgetBytes;
  }
}

// Aggregates crypto validation checks
class CryptoReport {
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

export default function cryptoValidationTest() {
  describe('CryptoValidation_Test', () => {

    it('checksum_should_be_deterministic', 0, () => {
      expect(ChecksumUtil.isStable('issue-log')).assertTrue();
      expect(ChecksumUtil.checksum('')).assertEqual(0);
      expect(ChecksumUtil.checksum('a')).assertEqual(97);
      expect(ChecksumUtil.checksum('a')).assertEqual(ChecksumUtil.checksum('a'));
      expect(ChecksumUtil.checksum('a') === ChecksumUtil.checksum('b')).assertFalse();
    });

    it('checksum_should_reject_oversized_input', 0, () => {
      expect(ChecksumUtil.isWithinLimit('a'.repeat(MAX_HASH_INPUT))).assertTrue();
      expect(ChecksumUtil.isWithinLimit('a'.repeat(MAX_HASH_INPUT + 1))).assertFalse();
      expect(ChecksumUtil.checksum('a'.repeat(MAX_HASH_INPUT + 1))).assertEqual(-1);
      expect(ChecksumUtil.hex('a'.repeat(MAX_HASH_INPUT + 1))).assertEqual('');
    });

    it('checksum_should_render_hex_and_match', 0, () => {
      const hex = ChecksumUtil.hex('issue-log');
      expect(hex.length).assertLarger(0);
      expect(ChecksumUtil.matches('issue-log', hex)).assertTrue();
      expect(ChecksumUtil.matches('issue-log', 'deadbeef')).assertFalse();
      expect(ChecksumUtil.matches('changed', hex)).assertFalse();
    });

    it('base64_should_validate_charset', 0, () => {
      expect(Base64Validator.isCharsetValid('QUJDRA==')).assertTrue();
      expect(Base64Validator.isCharsetValid('abc123+/')).assertTrue();
      expect(Base64Validator.isCharsetValid('bad!')).assertFalse();
      expect(Base64Validator.isCharsetValid('has space')).assertFalse();
    });

    it('base64_should_validate_length_and_padding', 0, () => {
      expect(Base64Validator.isLengthValid('QUJDRA==')).assertTrue();
      expect(Base64Validator.isLengthValid('QUJDRA=')).assertFalse();
      expect(Base64Validator.isLengthValid('')).assertFalse();
      expect(Base64Validator.paddingCount('QUJDRA==')).assertEqual(2);
      expect(Base64Validator.paddingCount('QUJDRA=')).assertEqual(1);
      expect(Base64Validator.paddingCount('QUJDRA')).assertEqual(0);
    });

    it('base64_should_validate_full_payloads', 0, () => {
      expect(Base64Validator.isValid('QUJDRA==')).assertTrue();
      expect(Base64Validator.isValid('abc123+/')).assertTrue();
      expect(Base64Validator.isValid('bad!')).assertFalse();
      expect(Base64Validator.isValid('abc')).assertFalse();
      expect(Base64Validator.isDataUri('data:image/png;base64,QUJDRA==')).assertTrue();
      expect(Base64Validator.isDataUri('file://a.png')).assertFalse();
    });

    it('secure_compare_should_match_equal_values', 0, () => {
      expect(SecureCompare.equals('abc', 'abc')).assertTrue();
      expect(SecureCompare.equals('abc', 'abd')).assertFalse();
      expect(SecureCompare.equals('abc', 'abcd')).assertFalse();
      expect(SecureCompare.equals('', '')).assertTrue();
    });

    it('secure_compare_should_validate_strength', 0, () => {
      expect(SecureCompare.isStrongSecret('abc12345')).assertTrue();
      expect(SecureCompare.isStrongSecret('abcdefgh')).assertFalse();
      expect(SecureCompare.isStrongSecret('12345678')).assertFalse();
      expect(SecureCompare.isStrongSecret('a1')).assertFalse();
      expect(SecureCompare.isStrongSecret('pass1234')).assertTrue();
    });

    it('secure_compare_should_mask_secrets', 0, () => {
      expect(SecureCompare.maskSecret('secret1234')).assertEqual('se***34');
      expect(SecureCompare.maskSecret('abcd')).assertEqual('***');
      expect(SecureCompare.maskSecret('ab')).assertEqual('***');
      expect(SecureCompare.maskSecret('secret1234').includes('cret')).assertFalse();
    });

    it('integrity_should_validate_digests', 0, () => {
      expect(IntegrityValidator.isSha256Hex('a'.repeat(64))).assertTrue();
      expect(IntegrityValidator.isSha256Hex('a'.repeat(63))).assertFalse();
      expect(IntegrityValidator.isSha256Hex('g'.repeat(64))).assertFalse();
      expect(IntegrityValidator.isMd5Hex('a'.repeat(32))).assertTrue();
      expect(IntegrityValidator.isMd5Hex('a'.repeat(31))).assertFalse();
      expect(IntegrityValidator.isDigestSupported('sha256')).assertTrue();
      expect(IntegrityValidator.isDigestSupported('sha1')).assertFalse();
    });

    it('integrity_should_validate_sizes', 0, () => {
      expect(IntegrityValidator.isSizeConsistent(1024, 1024)).assertTrue();
      expect(IntegrityValidator.isSizeConsistent(1024, 1025)).assertFalse();
      expect(IntegrityValidator.isSizeConsistent(-1, -1)).assertFalse();
      expect(IntegrityValidator.isWithinBudget(100, 100)).assertTrue();
      expect(IntegrityValidator.isWithinBudget(101, 100)).assertFalse();
      expect(IntegrityValidator.isWithinBudget(0, 0)).assertFalse();
    });

    it('crypto_flow_should_validate_log_archive', 0, () => {
      const payload = 'log-content';
      const digest = ChecksumUtil.hex(payload);
      const report = new CryptoReport();
      report.check('checksum', ChecksumUtil.matches(payload, digest));
      report.check('size', IntegrityValidator.isSizeConsistent(payload.length, payload.length));
      report.check('budget', IntegrityValidator.isWithinBudget(payload.length, 4096));
      report.check('algorithm', IntegrityValidator.isDigestSupported('sha256'));
      expect(report.count()).assertEqual(4);
      expect(report.isPassed()).assertTrue();
      expect(SecureCompare.maskSecret('token12345')).assertContain('***');
    });

    it('crypto_constants_should_be_stable', 0, () => {
      expect(BASE64_CHARS.length).assertEqual(64);
      expect(MAX_HASH_INPUT).assertEqual(4096);
      expect(CHECKSUM_MOD).assertEqual(1000003);
      expect(MIN_SECRET_LENGTH).assertEqual(8);
    });
  });
}

