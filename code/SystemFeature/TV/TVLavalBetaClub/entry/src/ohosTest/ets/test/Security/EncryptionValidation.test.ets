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

const ALG_AES_GCM: string = 'AES-GCM';

const ALG_AES_CBC: string = 'AES-CBC';

const IV_LENGTH: number = 12;

const TAG_LENGTH: number = 16;

const KEY_LENGTH: number = 32;

const MAX_PAYLOAD: number = 65536;

const MAX_KEY_AGE_MS: number = 86400000;

interface EncryptedPayload {
  algorithm: string;
  cipherText: string;
  iv: string;
  tag: string;
}

// Validates encrypted payload structure before decryption
class EncryptionValidator {
  public static isAlgorithmSupported(algorithm: string): boolean {
    return algorithm === ALG_AES_GCM || algorithm === ALG_AES_CBC;
  }

  public static isHex(value: string): boolean {
    const pattern: RegExp = new RegExp('^[0-9a-fA-F]+$');
    return value.length > 0 && pattern.test(value);
  }

  public static isIvValid(iv: string): boolean {
    return EncryptionValidator.isHex(iv) && iv.length === IV_LENGTH * 2;
  }

  public static isTagValid(tag: string): boolean {
    return EncryptionValidator.isHex(tag) && tag.length === TAG_LENGTH * 2;
  }

  public static isCipherTextValid(cipherText: string): boolean {
    return EncryptionValidator.isHex(cipherText) && cipherText.length <= MAX_PAYLOAD;
  }

  public static isValid(payload: EncryptedPayload): boolean {
    return EncryptionValidator.isAlgorithmSupported(payload.algorithm) &&
      EncryptionValidator.isIvValid(payload.iv) &&
      EncryptionValidator.isTagValid(payload.tag) &&
      EncryptionValidator.isCipherTextValid(payload.cipherText);
  }
}

// Validates key material and rotation policy
class KeyValidator {
  public static isLengthValid(key: string): boolean {
    return key.length === KEY_LENGTH * 2 && KeyValidator.isHex(key);
  }

  public static isHex(key: string): boolean {
    const pattern: RegExp = new RegExp('^[0-9a-fA-F]+$');
    return key.length > 0 && pattern.test(key);
  }

  public static isExpired(createdAt: number, now: number, maxAgeMs: number = MAX_KEY_AGE_MS): boolean {
    return createdAt < 0 || now - createdAt > maxAgeMs;
  }

  public static needsRotation(createdAt: number, now: number): boolean {
    return KeyValidator.isExpired(createdAt, now);
  }

  public static isRotationDue(createdAt: number, now: number, ageMs: number): boolean {
    return now - createdAt >= ageMs && ageMs >= 0;
  }
}

// Aggregates encryption checks
class EncryptionReport {
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

export default function encryptionValidationTest() {
  describe('EncryptionValidation_Test', () => {

    it('validator_should_accept_supported_algorithms', 0, () => {
      expect(EncryptionValidator.isAlgorithmSupported(ALG_AES_GCM)).assertTrue();
      expect(EncryptionValidator.isAlgorithmSupported(ALG_AES_CBC)).assertTrue();
      expect(EncryptionValidator.isAlgorithmSupported('AES-ECB')).assertFalse();
      expect(EncryptionValidator.isAlgorithmSupported('')).assertFalse();
    });

    it('validator_should_check_hex_values', 0, () => {
      expect(EncryptionValidator.isHex('0a1b2c')).assertTrue();
      expect(EncryptionValidator.isHex('ABCDEF')).assertTrue();
      expect(EncryptionValidator.isHex('')).assertFalse();
      expect(EncryptionValidator.isHex('xyz')).assertFalse();
      expect(EncryptionValidator.isHex('12 34')).assertFalse();
    });

    it('validator_should_check_iv_length', 0, () => {
      expect(EncryptionValidator.isIvValid('a'.repeat(IV_LENGTH * 2))).assertTrue();
      expect(EncryptionValidator.isIvValid('a'.repeat(IV_LENGTH * 2 - 1))).assertFalse();
      expect(EncryptionValidator.isIvValid('a'.repeat(IV_LENGTH * 2 + 1))).assertFalse();
      expect(EncryptionValidator.isIvValid('z'.repeat(IV_LENGTH * 2))).assertFalse();
    });

    it('validator_should_check_tag_length', 0, () => {
      expect(EncryptionValidator.isTagValid('b'.repeat(TAG_LENGTH * 2))).assertTrue();
      expect(EncryptionValidator.isTagValid('b'.repeat(TAG_LENGTH * 2 - 1))).assertFalse();
      expect(EncryptionValidator.isTagValid('')).assertFalse();
      expect(EncryptionValidator.isTagValid('g'.repeat(TAG_LENGTH * 2))).assertFalse();
    });

    it('validator_should_check_cipher_text', 0, () => {
      expect(EncryptionValidator.isCipherTextValid('deadbeef')).assertTrue();
      expect(EncryptionValidator.isCipherTextValid('')).assertFalse();
      expect(EncryptionValidator.isCipherTextValid('not-hex')).assertFalse();
      expect(EncryptionValidator.isCipherTextValid('a'.repeat(MAX_PAYLOAD + 1))).assertFalse();
    });

    it('validator_should_validate_payload', 0, () => {
      const payload: EncryptedPayload = {
        algorithm: ALG_AES_GCM,
        cipherText: 'deadbeef',
        iv: 'a'.repeat(IV_LENGTH * 2),
        tag: 'b'.repeat(TAG_LENGTH * 2)
      };
      expect(EncryptionValidator.isValid(payload)).assertTrue();
      payload.iv = 'short';
      expect(EncryptionValidator.isValid(payload)).assertFalse();
      payload.iv = 'a'.repeat(IV_LENGTH * 2);
      payload.algorithm = 'AES-ECB';
      expect(EncryptionValidator.isValid(payload)).assertFalse();
    });

    it('key_should_validate_length_and_hex', 0, () => {
      expect(KeyValidator.isLengthValid('a'.repeat(KEY_LENGTH * 2))).assertTrue();
      expect(KeyValidator.isLengthValid('a'.repeat(KEY_LENGTH * 2 - 1))).assertFalse();
      expect(KeyValidator.isLengthValid('z'.repeat(KEY_LENGTH * 2))).assertFalse();
      expect(KeyValidator.isHex('0123abcd')).assertTrue();
      expect(KeyValidator.isHex('')).assertFalse();
    });

    it('key_should_detect_expiry', 0, () => {
      expect(KeyValidator.isExpired(0, MAX_KEY_AGE_MS)).assertFalse();
      expect(KeyValidator.isExpired(0, MAX_KEY_AGE_MS + 1)).assertTrue();
      expect(KeyValidator.isExpired(-1, 0)).assertTrue();
      expect(KeyValidator.needsRotation(0, MAX_KEY_AGE_MS + 1)).assertTrue();
      expect(KeyValidator.needsRotation(0, 1000)).assertFalse();
    });

    it('key_should_check_custom_rotation_age', 0, () => {
      expect(KeyValidator.isRotationDue(0, 5000, 5000)).assertTrue();
      expect(KeyValidator.isRotationDue(0, 4999, 5000)).assertFalse();
      expect(KeyValidator.isRotationDue(0, 100, -1)).assertFalse();
      expect(KeyValidator.isRotationDue(100, 50, 10)).assertFalse();
    });

    it('report_should_aggregate_checks', 0, () => {
      const report = new EncryptionReport();
      report.check('payload', true);
      report.check('key', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      report.check('rotation', false);
      expect(report.isPassed()).assertFalse();
      expect(report.failures()).assertDeepEquals(['rotation']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('encryption_flow_should_validate_round_trip', 0, () => {
      const payload: EncryptedPayload = {
        algorithm: ALG_AES_GCM,
        cipherText: 'cafebabe',
        iv: '1'.repeat(IV_LENGTH * 2),
        tag: '2'.repeat(TAG_LENGTH * 2)
      };
      const key = 'f'.repeat(KEY_LENGTH * 2);
      const report = new EncryptionReport();
      report.check('payload', EncryptionValidator.isValid(payload));
      report.check('key', KeyValidator.isLengthValid(key));
      report.check('fresh', !KeyValidator.needsRotation(0, 1000));
      expect(report.isPassed()).assertTrue();
      expect(EncryptionValidator.isTagValid(payload.tag)).assertTrue();
      expect(KEY_LENGTH).assertEqual(32);
    });

    it('encryption_flow_should_reject_bad_payload', 0, () => {
      const payload: EncryptedPayload = {
        algorithm: ALG_AES_GCM,
        cipherText: 'zz',
        iv: '1',
        tag: '2'
      };
      const report = new EncryptionReport();
      report.check('payload', EncryptionValidator.isValid(payload));
      report.check('key', KeyValidator.isLengthValid('short'));
      expect(report.isPassed()).assertFalse();
      expect(report.failures().length).assertEqual(2);
      expect(EncryptionValidator.isValid(payload)).assertFalse();
    });

    it('encryption_constants_should_be_stable', 0, () => {
      expect(ALG_AES_GCM).assertEqual('AES-GCM');
      expect(ALG_AES_CBC).assertEqual('AES-CBC');
      expect(IV_LENGTH).assertEqual(12);
      expect(TAG_LENGTH).assertEqual(16);
      expect(KEY_LENGTH).assertEqual(32);
      expect(MAX_PAYLOAD).assertEqual(65536);
      expect(MAX_KEY_AGE_MS).assertEqual(86400000);
    });
  });
}

