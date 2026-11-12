/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect } from '@ohos/hypium';
import { EncryptionUtils } from 'library';

/**
 * Test suite for EncryptionUtils.
 * @since 26.0.0
 */
const BASE64_TABLE: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=';
const HEX_TABLE: string = '0123456789abcdef';
const KEY_TABLE: string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
const UUID_LENGTH: number = 36;
const HASH_LENGTH: number = 8;
const MASKED_BLOCK: string = '****';

function countOutsideTable(value: string, table: string): number {
  let outside: number = 0;
  for (let i: number = 0; i < value.length; i++) {
    if (table.indexOf(value.charAt(i)) === -1) {
      outside++;
    }
  }
  return outside;
}

export default function encryptionUtilsTest(): void {
  describe('EncryptionUtilsTest', () => {
    // ==================== Base64 encode (4 cases) ====================

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0100
     * @tc.name: testEncryptionUtils0001
     * @tc.desc: Encode empty and short one to three byte inputs into padded Base64 groups.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0001', 0, () => {
      expect(EncryptionUtils.base64Encode('')).assertEqual('');
      expect(EncryptionUtils.base64Encode('M')).assertEqual('TQ==');
      expect(EncryptionUtils.base64Encode('Ma')).assertEqual('TWE=');
      expect(EncryptionUtils.base64Encode('Man')).assertEqual('TWFu');
      expect(EncryptionUtils.base64Encode('abc')).assertEqual('YWJj');
      expect(EncryptionUtils.base64Encode('M').length % 4).assertEqual(0);
      expect(EncryptionUtils.base64Encode('Ma').length % 4).assertEqual(0);
      expect(EncryptionUtils.base64Encode('Man').length % 4).assertEqual(0);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0200
     * @tc.name: testEncryptionUtils0002
     * @tc.desc: Apply the padding rule for inputs whose length leaves one or two tail bytes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0002', 0, () => {
      const aligned: string = EncryptionUtils.base64Encode('abcdef');
      const tailOne: string = EncryptionUtils.base64Encode('abcde');
      const tailTwo: string = EncryptionUtils.base64Encode('abcd');

      expect(aligned).assertEqual('YWJjZGVm');
      expect(tailOne).assertEqual('YWJjZGU=');
      expect(tailTwo).assertEqual('YWJjZA==');
      expect(aligned.indexOf('=')).assertEqual(-1);
      expect(tailOne.charAt(tailOne.length - 1)).assertEqual('=');
      expect(tailTwo.charAt(tailTwo.length - 2)).assertEqual('=');
      expect(tailOne.length).assertEqual(8);
      expect(tailTwo.length).assertEqual(8);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0300
     * @tc.name: testEncryptionUtils0003
     * @tc.desc: Encode longer printable sentences and match the published reference vectors.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0003', 0, () => {
      expect(EncryptionUtils.base64Encode('Hello, World')).assertEqual('SGVsbG8sIFdvcmxk');
      expect(EncryptionUtils.base64Encode('Hello, World!')).assertEqual('SGVsbG8sIFdvcmxkIQ==');
      expect(EncryptionUtils.base64Encode('BT-Audio')).assertEqual('QlQtQXVkaW8=');
      expect(EncryptionUtils.base64Encode('BT-Audio-Device')).assertEqual('QlQtQXVkaW8tRGV2aWNl');
      expect(EncryptionUtils.base64Encode('0123456789')).assertEqual('MDEyMzQ1Njc4OQ==');
      expect(EncryptionUtils.base64Encode('abcdefgh')).assertEqual('YWJjZGVmZ2g=');
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0400
     * @tc.name: testEncryptionUtils0004
     * @tc.desc: Restrict the encoder output to the Base64 alphabet for control and space inputs.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0004', 0, () => {
      const spaces: string = EncryptionUtils.base64Encode('  ');
      const control: string = EncryptionUtils.base64Encode('\n\t');
      const symbols: string = EncryptionUtils.base64Encode('a+b/c=d?');
      const digits: string = EncryptionUtils.base64Encode('1234567890');

      expect(spaces).assertEqual('ICA=');
      expect(control).assertEqual('Cgk=');
      expect(countOutsideTable(spaces, BASE64_TABLE)).assertEqual(0);
      expect(countOutsideTable(control, BASE64_TABLE)).assertEqual(0);
      expect(countOutsideTable(symbols, BASE64_TABLE)).assertEqual(0);
      expect(countOutsideTable(digits, BASE64_TABLE)).assertEqual(0);
      expect(symbols.length % 4).assertEqual(0);
      expect(EncryptionUtils.base64Encode('a+b/c=d?').length).assertEqual(12);
    });

    // ==================== Base64 decode and toward return (3 cases) ====================

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0500
     * @tc.name: testEncryptionUtils0005
     * @tc.desc: Decode complete Base64 groups back into their original ASCII text.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0005', 0, () => {
      expect(EncryptionUtils.base64Decode('')).assertEqual('');
      expect(EncryptionUtils.base64Decode('TWFu')).assertEqual('Man');
      expect(EncryptionUtils.base64Decode('YWJj')).assertEqual('abc');
      expect(EncryptionUtils.base64Decode('YWJjZGVm')).assertEqual('abcdef');
      expect(EncryptionUtils.base64Decode('SGVsbG8sIFdvcmxk')).assertEqual('Hello, World');
      expect(EncryptionUtils.base64Decode('QlQtQXVkaW8tRGV2aWNl')).assertEqual('BT-Audio-Device');
      expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4')).assertEqual('012345678');
      expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4OQ').indexOf('012345678')).assertEqual(0);
      expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4OQ').length).assertLarger(9);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0600
     * @tc.name: testEncryptionUtils0006
     * @tc.desc: Round trip byte aligned strings through the encoder and the decoder.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0006', 0, () => {
      const samples: string[] = ['Man', 'abc', 'abcdef', 'Hello, World', '0123456789ab', 'connect_0000'];

      let matched: number = 0;
      for (const sample of samples) {
        if (EncryptionUtils.base64Decode(EncryptionUtils.base64Encode(sample)) === sample) {
          matched++;
        }
      }

      expect(matched).assertEqual(samples.length);
      expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode('Man'))).assertEqual('Man');
      expect(EncryptionUtils.base64Encode(EncryptionUtils.base64Decode('TWFu'))).assertEqual('TWFu');
      expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode('abcdef'))).assertEqual('abcdef');
      expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode(''))).assertEqual('');
      expect(EncryptionUtils.base64Encode(EncryptionUtils.base64Decode(''))).assertEqual('');
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0700
     * @tc.name: testEncryptionUtils0007
     * @tc.desc: Ignore padding characters while decoding and map unknown symbols to raw bytes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0007', 0, () => {
      const padded: string = EncryptionUtils.base64Decode('YWJj====');
      const invalid: string = EncryptionUtils.base64Decode('!!!!');

      expect(padded).assertEqual('abc');
      expect(padded.length).assertEqual(3);
      expect(invalid.length).assertEqual(3);
      expect(invalid.charCodeAt(0)).assertEqual(255);
      expect(invalid.charCodeAt(1)).assertEqual(255);
      expect(invalid.charCodeAt(2)).assertEqual(255);
      expect(EncryptionUtils.base64Decode('TWFu')).assertEqual('Man');
    });

    // ==================== XOR can inverse mix confuse (3 cases) ====================

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0800
     * @tc.name: testEncryptionUtils0008
     * @tc.desc: Mix each character with the repeating key and verify the raw byte results.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0008', 0, () => {
      const cipher: string = EncryptionUtils.xorEncrypt('abc', 'k');

      expect(cipher.length).assertEqual(3);
      expect(cipher.charCodeAt(0)).assertEqual(10);
      expect(cipher.charCodeAt(1)).assertEqual(9);
      expect(cipher.charCodeAt(2)).assertEqual(8);
      expect(EncryptionUtils.xorDecrypt(cipher, 'k')).assertEqual('abc');
      expect(EncryptionUtils.xorEncrypt('abc', 'k')).assertEqual(cipher);
      expect(EncryptionUtils.xorEncrypt('abc', 'l').charCodeAt(0)).assertEqual(13);
      expect(EncryptionUtils.xorEncrypt('abc', 'l').charCodeAt(1)).assertEqual(14);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_0900
     * @tc.name: testEncryptionUtils0009
     * @tc.desc: Recover the plain text for messages longer and shorter than the key.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0009', 0, () => {
      const longKey: string = 'abcdefgh';
      const shortText: string = EncryptionUtils.xorEncrypt('ab', longKey);
      const secret: string = 'Bluetooth Device 01';

      expect(shortText.length).assertEqual(2);
      expect(shortText.charCodeAt(0)).assertEqual(0);
      expect(shortText.charCodeAt(1)).assertEqual(0);
      expect(EncryptionUtils.xorEncrypt(EncryptionUtils.xorEncrypt(secret, longKey), longKey)).assertEqual(secret);
      expect(EncryptionUtils.xorDecrypt(EncryptionUtils.xorEncrypt(secret, 'zz'), 'zz')).assertEqual(secret);
      expect(EncryptionUtils.xorEncrypt('aaaa',
          'z').charCodeAt(0)).assertEqual('aaaa'.charCodeAt(0) ^ 'z'.charCodeAt(0));
      expect(EncryptionUtils.xorEncrypt('AB', 'ab')).assertEqual(EncryptionUtils.xorEncrypt('AB', 'ab'));
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1000
     * @tc.name: testEncryptionUtils0010
     * @tc.desc: Return an empty cipher when either the plain text or the key is missing.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0010', 0, () => {
      expect(EncryptionUtils.xorEncrypt('', 'key')).assertEqual('');
      expect(EncryptionUtils.xorEncrypt('abc', '')).assertEqual('');
      expect(EncryptionUtils.xorDecrypt('', 'key')).assertEqual('');
      expect(EncryptionUtils.xorDecrypt('abc', '')).assertEqual('');
      expect(EncryptionUtils.xorEncrypt('', '')).assertEqual('');
      expect(EncryptionUtils.xorEncrypt('abc', 'k').length).assertEqual(3);
      expect(EncryptionUtils.xorDecrypt(EncryptionUtils.xorEncrypt('x', 'l'), 'l')).assertEqual('x');
    });

    // ==================== digest and random identifier (4 cases) ====================

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1100
     * @tc.name: testEncryptionUtils0011
     * @tc.desc: Hash known inputs to their fixed eight digit hexadecimal digests.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0011', 0, () => {
      expect(EncryptionUtils.simpleHash('')).assertEqual('00000000');
      expect(EncryptionUtils.simpleHash('a')).assertEqual('e40c292c');
      expect(EncryptionUtils.simpleHash('abc')).assertEqual('1a47e90b');
      expect(EncryptionUtils.simpleHash('Man')).assertEqual('4ea8000f');
      expect(EncryptionUtils.simpleHash('bluetooth')).assertEqual('644e121d');
      expect(EncryptionUtils.simpleHash('BT-Audio-Device')).assertEqual('f8f83dc1');
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1200
     * @tc.name: testEncryptionUtils0012
     * @tc.desc: Keep the digest stable, uniform in length and sensitive to small changes.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0012', 0, () => {
      const base: string = EncryptionUtils.simpleHash('Bluetooth Device 01');
      const variant: string = EncryptionUtils.simpleHash('Bluetooth Device 02');
      const repeated: string = EncryptionUtils.simpleHash('Bluetooth Device 01');

      expect(base).assertEqual(repeated);
      expect(base.length).assertEqual(HASH_LENGTH);
      expect(variant.length).assertEqual(HASH_LENGTH);
      expect(countOutsideTable(base, HEX_TABLE)).assertEqual(0);
      expect(countOutsideTable(variant, HEX_TABLE)).assertEqual(0);
      expect(base === variant).assertFalse();
      expect(EncryptionUtils.simpleHash('') === base).assertFalse();
      expect(EncryptionUtils.simpleHash('abc') === EncryptionUtils.simpleHash('Man')).assertFalse();
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1300
     * @tc.name: testEncryptionUtils0013
     * @tc.desc: Generate a version four identifier and verify its fixed layout and alphabet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0013', 0, () => {
      const uuid: string = EncryptionUtils.generateUuid();

      expect(uuid.length).assertEqual(UUID_LENGTH);
      expect(uuid.charAt(8)).assertEqual('-');
      expect(uuid.charAt(13)).assertEqual('-');
      expect(uuid.charAt(18)).assertEqual('-');
      expect(uuid.charAt(23)).assertEqual('-');
      expect(uuid.charAt(14)).assertEqual('4');
      expect('89ab'.indexOf(uuid.charAt(19)) >= 0).assertTrue();
      expect(uuid.split('-')[0].length).assertEqual(8);
      expect(uuid.split('-')[4].length).assertEqual(12);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1400
     * @tc.name: testEncryptionUtils0014
     * @tc.desc: Produce a batch of identifiers and confirm they are all hexadecimal and unique.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0014', 0, () => {
      const generated: string[] = [];
      let uniqueCount: number = 0;
      let invalidCount: number = 0;
      for (let i: number = 0; i < 30; i++) {
        const uuid: string = EncryptionUtils.generateUuid();
        if (generated.indexOf(uuid) === -1) {
          uniqueCount++;
        }
        generated.push(uuid);
        if (countOutsideTable(uuid.replace(/-/g, ''), HEX_TABLE) > 0 || uuid.length !== UUID_LENGTH) {
          invalidCount++;
        }
      }

      expect(generated.length).assertEqual(30);
      expect(uniqueCount).assertEqual(30);
      expect(invalidCount).assertEqual(0);
      expect(generated[0].length).assertEqual(UUID_LENGTH);
      expect(generated[29].length).assertEqual(UUID_LENGTH);
      expect(generated[0] === generated[29]).assertFalse();
      expect(generated[0].charAt(14)).assertEqual('4');
    });

    // ==================== hex conversion (2 cases) ====================

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1500
     * @tc.name: testEncryptionUtils0015
     * @tc.desc: Convert hexadecimal strings into byte arrays and report malformed input.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0015', 0, () => {
      const bytes: number[] = EncryptionUtils.hexToBytes('00ff10');

      expect(bytes.length).assertEqual(3);
      expect(bytes[0]).assertEqual(0);
      expect(bytes[1]).assertEqual(255);
      expect(bytes[2]).assertEqual(16);
      expect(EncryptionUtils.hexToBytes('').length).assertEqual(0);
      expect(EncryptionUtils.hexToBytes('FF')[0]).assertEqual(255);
      const odd: number[] = EncryptionUtils.hexToBytes('abc');
      expect(odd.length).assertEqual(2);
      expect(odd[0]).assertEqual(171);
      expect(odd[1]).assertEqual(12);
      expect(Number.isNaN(EncryptionUtils.hexToBytes('zz')[0])).assertTrue();
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1600
     * @tc.name: testEncryptionUtils0016
     * @tc.desc: Render byte arrays as lower case hex pairs and keep the conversion reversible.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0016', 0, () => {
      expect(EncryptionUtils.bytesToHex([])).assertEqual('');
      expect(EncryptionUtils.bytesToHex([0, 15, 255])).assertEqual('000fff');
      expect(EncryptionUtils.bytesToHex([1, 2, 3])).assertEqual('010203');
      expect(EncryptionUtils.bytesToHex(EncryptionUtils.hexToBytes('0a1fFF90'))).assertEqual('0a1fff90');
      expect(EncryptionUtils.hexToBytes(EncryptionUtils.bytesToHex([0, 15, 255]))[1]).assertEqual(15);
      expect(EncryptionUtils.bytesToHex([16]).length).assertEqual(2);
      expect(EncryptionUtils.bytesToHex([171, 12])).assertEqual('ab0c');
    });

    // ==================== random key and masking (3 cases) ====================

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1700
     * @tc.name: testEncryptionUtils0017
     * @tc.desc: Generate keys for the requested lengths using only the alphanumeric alphabet.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0017', 0, () => {
      const empty: string = EncryptionUtils.generateKey(0);
      const shortKey: string = EncryptionUtils.generateKey(1);
      const defaultKey: string = EncryptionUtils.generateKey();
      const longKey: string = EncryptionUtils.generateKey(48);

      expect(empty.length).assertEqual(0);
      expect(shortKey.length).assertEqual(1);
      expect(defaultKey.length).assertEqual(16);
      expect(longKey.length).assertEqual(48);
      expect(countOutsideTable(shortKey, KEY_TABLE)).assertEqual(0);
      expect(countOutsideTable(defaultKey, KEY_TABLE)).assertEqual(0);
      expect(countOutsideTable(longKey, KEY_TABLE)).assertEqual(0);
      expect(longKey.indexOf('=')).assertEqual(-1);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1800
     * @tc.name: testEncryptionUtils0018
     * @tc.desc: Draw successive keys and confirm the generator does not repeat its output.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0018', 0, () => {
      const first: string = EncryptionUtils.generateKey(24);
      const second: string = EncryptionUtils.generateKey(24);
      const collected: string[] = [];
      let uniqueCount: number = 0;
      for (let i: number = 0; i < 10; i++) {
        const candidate: string = EncryptionUtils.generateKey(12);
        if (collected.indexOf(candidate) === -1) {
          uniqueCount++;
        }
        collected.push(candidate);
      }

      expect(first.length).assertEqual(24);
      expect(second.length).assertEqual(24);
      expect(first === second).assertFalse();
      expect(collected.length).assertEqual(10);
      expect(uniqueCount).assertEqual(10);
      expect(collected[0].length).assertEqual(12);
      expect(countOutsideTable(collected[9], KEY_TABLE)).assertEqual(0);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_1900
     * @tc.name: testEncryptionUtils0019
     * @tc.desc: Mask a sensitive value while keeping only the requested tail characters.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 0
     */
    it('testEncryptionUtils0019', 0, () => {
      const account: string = '1234567890';

      expect(EncryptionUtils.maskSensitive('')).assertEqual(MASKED_BLOCK);
      expect(EncryptionUtils.maskSensitive('1234')).assertEqual(MASKED_BLOCK);
      expect(EncryptionUtils.maskSensitive('12345')).assertEqual('*2345');
      expect(EncryptionUtils.maskSensitive(account)).assertEqual('******7890');
      expect(EncryptionUtils.maskSensitive(account, 2)).assertEqual('********90');
      expect(EncryptionUtils.maskSensitive(account, 0)).assertEqual('**********');
      expect(EncryptionUtils.maskSensitive(account, 10)).assertEqual(MASKED_BLOCK);
      expect(EncryptionUtils.maskSensitive(account, 20)).assertEqual(MASKED_BLOCK);
    });

    /*
     * @tc.number: SUB_ENCRYPTION_UTILS_2000
     * @tc.name: testEncryptionUtils0020
     * @tc.desc: Preserve the masked length, hide the head characters and expose the exact tail.
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 1
     */
    it('testEncryptionUtils0020', 0, () => {
      const mac: string = 'AABBCCDDEEFF';
      const masked: string = EncryptionUtils.maskSensitive(mac, 4);
      const tight: string = EncryptionUtils.maskSensitive(mac, 6);

      expect(masked.length).assertEqual(mac.length);
      expect(masked.endsWith('EEFF')).assertTrue();
      expect(masked.indexOf('AABBCC')).assertEqual(-1);
      expect(tight.endsWith('DDEEFF')).assertTrue();
      expect(tight.length).assertEqual(mac.length);
      expect(EncryptionUtils.maskSensitive(mac).length).assertEqual(mac.length);
      expect(EncryptionUtils.maskSensitive(mac, 11).startsWith('*')).assertTrue();
      expect(EncryptionUtils.maskSensitive('abcdef', 5)).assertEqual('*bcdef');
    });
  });
}
