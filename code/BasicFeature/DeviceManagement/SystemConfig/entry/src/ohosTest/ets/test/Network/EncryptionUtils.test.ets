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
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EncryptionUtils } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * EncryptionUtils utility test suite.
 */
export default function EncryptionUtilsTest(): void {
  describe('EncryptionUtilsTest', () => {

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0100
     * @tc.name testEncryptionUtils0001
     * @tc.desc Verify Base64 decode restores the value after encoding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0001: begin');
      const original: string = 'Hello OpenHarmony';
      const encoded: string = EncryptionUtils.base64Encode(original);
      expect(encoded.length).assertLarger(0);
      expect(encoded === original).assertFalse();
      const decoded: string = EncryptionUtils.base64Decode(encoded);
      expect(decoded).assertEqual(original);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0200
     * @tc.name testEncryptionUtils0002
     * @tc.desc Verify encoding/decoding an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0002: begin');
      const encoded: string = EncryptionUtils.base64Encode('');
      expect(encoded.length).assertEqual(0);
      const decoded: string = EncryptionUtils.base64Decode(encoded);
      expect(decoded).assertEqual('');
      expect(decoded).assertEqual('');
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0300
     * @tc.name testEncryptionUtils0003
     * @tc.desc Verify MD5 hash returns 32 hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0003: begin');
      const hash: string = EncryptionUtils.md5Hash('test');
      expect(hash.length).assertEqual(32);
      expect(hash.indexOf('0x')).assertEqual(-1);
      expect(/^[0-9a-f]+$/.test(hash)).assertTrue();
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0400
     * @tc.name testEncryptionUtils0004
     * @tc.desc Verify the same input yields a consistent MD5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0004: begin');
      const hash1: string = EncryptionUtils.md5Hash('hello');
      const hash2: string = EncryptionUtils.md5Hash('hello');
      expect(hash1).assertEqual(hash2);
      expect(hash1.length).assertEqual(32);
      expect(hash2.length).assertEqual(32);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0500
     * @tc.name testEncryptionUtils0005
     * @tc.desc Verify SHA-256 hash returns 64 hex digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0005: begin');
      const hash: string = EncryptionUtils.sha256Hash('test');
      expect(hash.length).assertEqual(64);
      expect(/^[0-9a-f]+$/.test(hash)).assertTrue();
      const hash2: string = EncryptionUtils.sha256Hash('test');
      expect(hash2).assertEqual(hash);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0600
     * @tc.name testEncryptionUtils0006
     * @tc.desc Verify decryption restores the value after Caesar encryption
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0006: begin');
      const original: string = 'HelloWorld';
      const encrypted: string = EncryptionUtils.encryptCaesar(original, 3);
      expect(encrypted === original).assertFalse();
      expect(encrypted.length).assertEqual(original.length);
      const decrypted: string = EncryptionUtils.decryptCaesar(encrypted, 3);
      expect(decrypted).assertEqual(original);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0700
     * @tc.name testEncryptionUtils0007
     * @tc.desc Verify generating a Nonce of the specified length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0007: begin');
      const nonce: string = EncryptionUtils.generateNonce(16);
      expect(nonce.length).assertEqual(16);
      const nonce2: string = EncryptionUtils.generateNonce(16);
      expect(nonce === nonce2).assertFalse();
      expect(nonce2.length).assertEqual(16);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0800
     * @tc.name testEncryptionUtils0008
     * @tc.desc Verify generating a 64-character Token
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0008: begin');
      const token: string = EncryptionUtils.generateToken();
      expect(token.length).assertEqual(64);
      expect(/^[0-9a-f]+$/.test(token)).assertTrue();
      const token2: string = EncryptionUtils.generateToken();
      expect(token === token2).assertFalse();
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_0900
     * @tc.name testEncryptionUtils0009
     * @tc.desc Verify hex to bytes and back
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0009: begin');
      const hex: string = '48656c6c6f';
      const bytes: number[] = EncryptionUtils.hexToBytes(hex);
      expect(bytes.length).assertLarger(0);
      expect(bytes.length).assertEqual(5);
      const result: string = EncryptionUtils.bytesToHex(bytes);
      expect(result).assertEqual(hex);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_1000
     * @tc.name testEncryptionUtils0010
     * @tc.desc Verify different inputs produce different MD5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0010: begin');
      const hash1: string = EncryptionUtils.md5Hash('input1');
      const hash2: string = EncryptionUtils.md5Hash('input2');
      expect(hash1 === hash2).assertFalse();
      expect(hash1.length).assertEqual(32);
      expect(hash2.length).assertEqual(32);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_1100
     * @tc.name testEncryptionUtils0011
     * @tc.desc Verify the MD5 result matches standard test vectors (real algorithm check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0011: begin');
      // RFC standard vectors: MD5("test") and MD5("")
      const hashTest: string = EncryptionUtils.md5Hash('test');
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0011: md5(test)=%{public}s', hashTest);
      expect(hashTest).assertEqual('098f6bcd4621d373cade4e832627b4f6');
      const hashEmpty: string = EncryptionUtils.md5Hash('');
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0011: md5(empty)=%{public}s', hashEmpty);
      expect(hashEmpty).assertEqual('d41d8cd98f00b204e9800998ecf8427e');
      // Real MD5 output is always 32 lowercase hex digits
      expect(hashTest.length).assertEqual(32);
    });

    /**
     * @tc.number SUB_ENCRYPTION_UTILS_1200
     * @tc.name testEncryptionUtils0012
     * @tc.desc Verify the SHA-256 result matches standard test vectors (real algorithm check)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0012: begin');
      // Standard vectors: SHA-256("test") and SHA-256("")
      const hashTest: string = EncryptionUtils.sha256Hash('test');
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0012: sha256(test)=%{public}s', hashTest);
      expect(hashTest).assertEqual('9f86d081884c7d659a2feaa0c55ad015a3bf4f1b2b0b822cd15d6c15b0f00a08');
      const hashEmpty: string = EncryptionUtils.sha256Hash('');
      hilog.info(DOMAIN, TAG, 'testEncryptionUtils0012: sha256(empty)=%{public}s', hashEmpty);
      expect(hashEmpty).assertEqual('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
      // Real SHA-256 output is always 64 lowercase hex digits
      expect(hashTest.length).assertEqual(64);
    });
  });
}
