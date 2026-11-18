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
import { hilog } from '@kit.PerformanceAnalysisKit';
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0001', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#1 assert ' + "expect(EncryptionUtils.base64Encode('')).assertEqual('')");
      expect(EncryptionUtils.base64Encode('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#2 assert ' + "expect(EncryptionUtils.base64Encode('M')).assertEqual('TQ==')");
      expect(EncryptionUtils.base64Encode('M')).assertEqual('TQ==');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#3 assert ' + "expect(EncryptionUtils.base64Encode('Ma')).assertEqual('TWE=')");
      expect(EncryptionUtils.base64Encode('Ma')).assertEqual('TWE=');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#4 assert ' + "expect(EncryptionUtils.base64Encode('Man')).assertEqual('TWFu')");
      expect(EncryptionUtils.base64Encode('Man')).assertEqual('TWFu');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#5 assert ' + "expect(EncryptionUtils.base64Encode('abc')).assertEqual('YWJj')");
      expect(EncryptionUtils.base64Encode('abc')).assertEqual('YWJj');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#6 assert ' + "expect(EncryptionUtils.base64Encode('M').length % 4).assertEqual(0)");
      expect(EncryptionUtils.base64Encode('M').length % 4).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#7 assert ' + "expect(EncryptionUtils.base64Encode('Ma').length % 4).assertEqual(0)");
      expect(EncryptionUtils.base64Encode('Ma').length % 4).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0001',
        '#8 assert ' + "expect(EncryptionUtils.base64Encode('Man').length % 4).assertEqual(0)");
      expect(EncryptionUtils.base64Encode('Man').length % 4).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0001', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0002', 'begin');
      const aligned: string = EncryptionUtils.base64Encode('abcdef');
      const tailOne: string = EncryptionUtils.base64Encode('abcde');
      const tailTwo: string = EncryptionUtils.base64Encode('abcd');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#1 ' + "aligned" + ' = ' + JSON.stringify(aligned));
      expect(aligned).assertEqual('YWJjZGVm');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#2 ' + "tailOne" + ' = ' + JSON.stringify(tailOne));
      expect(tailOne).assertEqual('YWJjZGU=');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#3 ' + "tailTwo" + ' = ' + JSON.stringify(tailTwo));
      expect(tailTwo).assertEqual('YWJjZA==');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#4 assert ' + "expect(aligned.indexOf('=')).assertEqual(-1)");
      expect(aligned.indexOf('=')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#5 assert ' + "expect(tailOne.charAt(tailOne.length - 1)).assertEqual('=')");
      expect(tailOne.charAt(tailOne.length - 1)).assertEqual('=');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#6 assert ' + "expect(tailTwo.charAt(tailTwo.length - 2)).assertEqual('=')");
      expect(tailTwo.charAt(tailTwo.length - 2)).assertEqual('=');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#7 ' + "tailOne.length" + ' = ' + JSON.stringify(tailOne.length));
      expect(tailOne.length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0002',
        '#8 ' + "tailTwo.length" + ' = ' + JSON.stringify(tailTwo.length));
      expect(tailTwo.length).assertEqual(8);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0002', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0003', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0003',
        '#1 assert ' + "expect(EncryptionUtils.base64Encode('Hello, World')).assertEqual('SGVsbG8sIFdvcmxk')");
      expect(EncryptionUtils.base64Encode('Hello, World')).assertEqual('SGVsbG8sIFdvcmxk');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0003',
        '#2 assert ' + "expect(EncryptionUtils.base64Encode('Hello, World!')).assertEqual('SGVsbG8sIFdvcmxkIQ==')");
      expect(EncryptionUtils.base64Encode('Hello, World!')).assertEqual('SGVsbG8sIFdvcmxkIQ==');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0003',
        '#3 assert ' + "expect(EncryptionUtils.base64Encode('BT-Audio')).assertEqual('QlQtQXVkaW8=')");
      expect(EncryptionUtils.base64Encode('BT-Audio')).assertEqual('QlQtQXVkaW8=');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0003',
        '#4 assert ' + "expect(EncryptionUtils.base64Encode('BT-Audio-Device')).assertEqual('QlQtQXVkaW8tRGV2aWNl')");
      expect(EncryptionUtils.base64Encode('BT-Audio-Device')).assertEqual('QlQtQXVkaW8tRGV2aWNl');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0003',
        '#5 assert ' + "expect(EncryptionUtils.base64Encode('0123456789')).assertEqual('MDEyMzQ1Njc4OQ==')");
      expect(EncryptionUtils.base64Encode('0123456789')).assertEqual('MDEyMzQ1Njc4OQ==');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0003',
        '#6 assert ' + "expect(EncryptionUtils.base64Encode('abcdefgh')).assertEqual('YWJjZGVmZ2g=')");
      expect(EncryptionUtils.base64Encode('abcdefgh')).assertEqual('YWJjZGVmZ2g=');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0003', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0004', 'begin');
      const spaces: string = EncryptionUtils.base64Encode('  ');
      const control: string = EncryptionUtils.base64Encode('\n\t');
      const symbols: string = EncryptionUtils.base64Encode('a+b/c=d?');
      const digits: string = EncryptionUtils.base64Encode('1234567890');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#1 ' + "spaces" + ' = ' + JSON.stringify(spaces));
      expect(spaces).assertEqual('ICA=');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#2 ' + "control" + ' = ' + JSON.stringify(control));
      expect(control).assertEqual('Cgk=');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#3 assert ' + "expect(countOutsideTable(spaces, BASE64_TABLE)).assertEqual(0)");
      expect(countOutsideTable(spaces, BASE64_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#4 assert ' + "expect(countOutsideTable(control, BASE64_TABLE)).assertEqual(0)");
      expect(countOutsideTable(control, BASE64_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#5 assert ' + "expect(countOutsideTable(symbols, BASE64_TABLE)).assertEqual(0)");
      expect(countOutsideTable(symbols, BASE64_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#6 assert ' + "expect(countOutsideTable(digits, BASE64_TABLE)).assertEqual(0)");
      expect(countOutsideTable(digits, BASE64_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#7 ' + "symbols.length % 4" + ' = ' + JSON.stringify(symbols.length % 4));
      expect(symbols.length % 4).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0004',
        '#8 assert ' + "expect(EncryptionUtils.base64Encode('a+b/c=d?').length).assertEqual(12)");
      expect(EncryptionUtils.base64Encode('a+b/c=d?').length).assertEqual(12);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0004', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0005', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#1 assert ' + "expect(EncryptionUtils.base64Decode('')).assertEqual('')");
      expect(EncryptionUtils.base64Decode('')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#2 assert ' + "expect(EncryptionUtils.base64Decode('TWFu')).assertEqual('Man')");
      expect(EncryptionUtils.base64Decode('TWFu')).assertEqual('Man');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#3 assert ' + "expect(EncryptionUtils.base64Decode('YWJj')).assertEqual('abc')");
      expect(EncryptionUtils.base64Decode('YWJj')).assertEqual('abc');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#4 assert ' + "expect(EncryptionUtils.base64Decode('YWJjZGVm')).assertEqual('abcdef')");
      expect(EncryptionUtils.base64Decode('YWJjZGVm')).assertEqual('abcdef');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#5 assert ' + "expect(EncryptionUtils.base64Decode('SGVsbG8sIFdvcmxk')).assertEqual('Hello, World')");
      expect(EncryptionUtils.base64Decode('SGVsbG8sIFdvcmxk')).assertEqual('Hello, World');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#6 assert ' + "expect(EncryptionUtils.base64Decode('QlQtQXVkaW8tRGV2aWNl')).assertEqual('BT-Audio-Device')");
      expect(EncryptionUtils.base64Decode('QlQtQXVkaW8tRGV2aWNl')).assertEqual('BT-Audio-Device');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#7 assert ' + "expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4')).assertEqual('012345678')");
      expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4')).assertEqual('012345678');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#8 assert ' + "expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4OQ').indexOf('012345678')).assertEqual(0)");
      expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4OQ').indexOf('012345678')).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0005',
        '#9 assert ' + "expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4OQ').length).assertLarger(9)");
      expect(EncryptionUtils.base64Decode('MDEyMzQ1Njc4OQ').length).assertLarger(9);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0005', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0006', 'begin');
      const samples: string[] = ['Man', 'abc', 'abcdef', 'Hello, World', '0123456789ab', 'connect_0000'];

      let matched: number = 0;
      for (const sample of samples) {
        if (EncryptionUtils.base64Decode(EncryptionUtils.base64Encode(sample)) === sample) {
          matched++;
        }
      }

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0006',
        '#1 ' + "matched" + ' = ' + JSON.stringify(matched));
      expect(matched).assertEqual(samples.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0006',
        '#2 assert ' + "expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode('Man'))).assertEqual('Man')");
      expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode('Man'))).assertEqual('Man');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0006',
        '#3 assert ' +
        "expect(EncryptionUtils.base64Encode(EncryptionUtils.base64Decode('TWFu'))).assertEqual('TWFu')");
      expect(EncryptionUtils.base64Encode(EncryptionUtils.base64Decode('TWFu'))).assertEqual('TWFu');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0006',
        '#4 assert ' +
        "expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode('abcdef'))).assertEqual('abcdef')");
      expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode('abcdef'))).assertEqual('abcdef');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0006',
        '#5 assert ' + "expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode(''))).assertEqual('')");
      expect(EncryptionUtils.base64Decode(EncryptionUtils.base64Encode(''))).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0006',
        '#6 assert ' + "expect(EncryptionUtils.base64Encode(EncryptionUtils.base64Decode(''))).assertEqual('')");
      expect(EncryptionUtils.base64Encode(EncryptionUtils.base64Decode(''))).assertEqual('');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0006', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0007', 'begin');
      const padded: string = EncryptionUtils.base64Decode('YWJj====');
      const invalid: string = EncryptionUtils.base64Decode('!!!!');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0007',
        '#1 ' + "padded" + ' = ' + JSON.stringify(padded));
      expect(padded).assertEqual('abc');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0007',
        '#2 ' + "padded.length" + ' = ' + JSON.stringify(padded.length));
      expect(padded.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0007',
        '#3 ' + "invalid.length" + ' = ' + JSON.stringify(invalid.length));
      expect(invalid.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0007',
        '#4 assert ' + "expect(invalid.charCodeAt(0)).assertEqual(255)");
      expect(invalid.charCodeAt(0)).assertEqual(255);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0007',
        '#5 assert ' + "expect(invalid.charCodeAt(1)).assertEqual(255)");
      expect(invalid.charCodeAt(1)).assertEqual(255);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0007',
        '#6 assert ' + "expect(invalid.charCodeAt(2)).assertEqual(255)");
      expect(invalid.charCodeAt(2)).assertEqual(255);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0007',
        '#7 assert ' + "expect(EncryptionUtils.base64Decode('TWFu')).assertEqual('Man')");
      expect(EncryptionUtils.base64Decode('TWFu')).assertEqual('Man');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0007', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0008', 'begin');
      const cipher: string = EncryptionUtils.xorEncrypt('abc', 'k');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#1 ' + "cipher.length" + ' = ' + JSON.stringify(cipher.length));
      expect(cipher.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#2 assert ' + "expect(cipher.charCodeAt(0)).assertEqual(10)");
      expect(cipher.charCodeAt(0)).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#3 assert ' + "expect(cipher.charCodeAt(1)).assertEqual(9)");
      expect(cipher.charCodeAt(1)).assertEqual(9);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#4 assert ' + "expect(cipher.charCodeAt(2)).assertEqual(8)");
      expect(cipher.charCodeAt(2)).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#5 assert ' + "expect(EncryptionUtils.xorDecrypt(cipher, 'k')).assertEqual('abc')");
      expect(EncryptionUtils.xorDecrypt(cipher, 'k')).assertEqual('abc');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#6 assert ' + "expect(EncryptionUtils.xorEncrypt('abc', 'k')).assertEqual(cipher)");
      expect(EncryptionUtils.xorEncrypt('abc', 'k')).assertEqual(cipher);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#7 assert ' + "expect(EncryptionUtils.xorEncrypt('abc', 'l').charCodeAt(0)).assertEqual(13)");
      expect(EncryptionUtils.xorEncrypt('abc', 'l').charCodeAt(0)).assertEqual(13);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0008',
        '#8 assert ' + "expect(EncryptionUtils.xorEncrypt('abc', 'l').charCodeAt(1)).assertEqual(14)");
      expect(EncryptionUtils.xorEncrypt('abc', 'l').charCodeAt(1)).assertEqual(14);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0008', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0009', 'begin');
      const longKey: string = 'abcdefgh';
      const shortText: string = EncryptionUtils.xorEncrypt('ab', longKey);
      const secret: string = 'Bluetooth Device 01';

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0009',
        '#1 ' + "shortText.length" + ' = ' + JSON.stringify(shortText.length));
      expect(shortText.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0009',
        '#2 assert ' + "expect(shortText.charCodeAt(0)).assertEqual(0)");
      expect(shortText.charCodeAt(0)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0009',
        '#3 assert ' + "expect(shortText.charCodeAt(1)).assertEqual(0)");
      expect(shortText.charCodeAt(1)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0009',
        '#4 assert ' +
        "expect(EncryptionUtils.xorEncrypt(EncryptionUtils.xorEncrypt(secret, longKey), longKey)).assertEqual(secret)");
      expect(EncryptionUtils.xorEncrypt(EncryptionUtils.xorEncrypt(secret, longKey), longKey)).assertEqual(secret);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0009',
        '#5 assert ' +
        "expect(EncryptionUtils.xorDecrypt(EncryptionUtils.xorEncrypt(secret, 'zz'), 'zz')).assertEqual(secret)");
      expect(EncryptionUtils.xorDecrypt(EncryptionUtils.xorEncrypt(secret, 'zz'), 'zz')).assertEqual(secret);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0009',
        '#6 assert ' +
        "expect(EncryptionUtils.xorEncrypt('aaaa', 'z').charCodeAt(0)).assertEqual('aaaa'.charCodeAt(0) ^ 'z'.charCo" +
        "deAt(0))");
      expect(EncryptionUtils.xorEncrypt('aaaa',
          'z').charCodeAt(0)).assertEqual('aaaa'.charCodeAt(0) ^ 'z'.charCodeAt(0));
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0009',
        '#7 assert ' +
        "expect(EncryptionUtils.xorEncrypt('AB', 'ab')).assertEqual(EncryptionUtils.xorEncrypt('AB', 'ab'))");
      expect(EncryptionUtils.xorEncrypt('AB', 'ab')).assertEqual(EncryptionUtils.xorEncrypt('AB', 'ab'));
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0009', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0010', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0010',
        '#1 assert ' + "expect(EncryptionUtils.xorEncrypt('', 'key')).assertEqual('')");
      expect(EncryptionUtils.xorEncrypt('', 'key')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0010',
        '#2 assert ' + "expect(EncryptionUtils.xorEncrypt('abc', '')).assertEqual('')");
      expect(EncryptionUtils.xorEncrypt('abc', '')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0010',
        '#3 assert ' + "expect(EncryptionUtils.xorDecrypt('', 'key')).assertEqual('')");
      expect(EncryptionUtils.xorDecrypt('', 'key')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0010',
        '#4 assert ' + "expect(EncryptionUtils.xorDecrypt('abc', '')).assertEqual('')");
      expect(EncryptionUtils.xorDecrypt('abc', '')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0010',
        '#5 assert ' + "expect(EncryptionUtils.xorEncrypt('', '')).assertEqual('')");
      expect(EncryptionUtils.xorEncrypt('', '')).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0010',
        '#6 assert ' + "expect(EncryptionUtils.xorEncrypt('abc', 'k').length).assertEqual(3)");
      expect(EncryptionUtils.xorEncrypt('abc', 'k').length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0010',
        '#7 assert ' +
        "expect(EncryptionUtils.xorDecrypt(EncryptionUtils.xorEncrypt('x', 'l'), 'l')).assertEqual('x')");
      expect(EncryptionUtils.xorDecrypt(EncryptionUtils.xorEncrypt('x', 'l'), 'l')).assertEqual('x');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0010', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0011', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0011',
        '#1 assert ' + "expect(EncryptionUtils.simpleHash('')).assertEqual('00000000')");
      expect(EncryptionUtils.simpleHash('')).assertEqual('00000000');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0011',
        '#2 assert ' + "expect(EncryptionUtils.simpleHash('a')).assertEqual('e40c292c')");
      expect(EncryptionUtils.simpleHash('a')).assertEqual('e40c292c');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0011',
        '#3 assert ' + "expect(EncryptionUtils.simpleHash('abc')).assertEqual('1a47e90b')");
      expect(EncryptionUtils.simpleHash('abc')).assertEqual('1a47e90b');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0011',
        '#4 assert ' + "expect(EncryptionUtils.simpleHash('Man')).assertEqual('4ea8000f')");
      expect(EncryptionUtils.simpleHash('Man')).assertEqual('4ea8000f');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0011',
        '#5 assert ' + "expect(EncryptionUtils.simpleHash('bluetooth')).assertEqual('644e121d')");
      expect(EncryptionUtils.simpleHash('bluetooth')).assertEqual('644e121d');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0011',
        '#6 assert ' + "expect(EncryptionUtils.simpleHash('BT-Audio-Device')).assertEqual('f8f83dc1')");
      expect(EncryptionUtils.simpleHash('BT-Audio-Device')).assertEqual('f8f83dc1');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0011', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0012', 'begin');
      const base: string = EncryptionUtils.simpleHash('Bluetooth Device 01');
      const variant: string = EncryptionUtils.simpleHash('Bluetooth Device 02');
      const repeated: string = EncryptionUtils.simpleHash('Bluetooth Device 01');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#1 ' + "base" + ' = ' + JSON.stringify(base));
      expect(base).assertEqual(repeated);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#2 ' + "base.length" + ' = ' + JSON.stringify(base.length));
      expect(base.length).assertEqual(HASH_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#3 ' + "variant.length" + ' = ' + JSON.stringify(variant.length));
      expect(variant.length).assertEqual(HASH_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#4 assert ' + "expect(countOutsideTable(base, HEX_TABLE)).assertEqual(0)");
      expect(countOutsideTable(base, HEX_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#5 assert ' + "expect(countOutsideTable(variant, HEX_TABLE)).assertEqual(0)");
      expect(countOutsideTable(variant, HEX_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#6 ' + "base === variant" + ' = ' + JSON.stringify(base === variant));
      expect(base === variant).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#7 assert ' + "expect(EncryptionUtils.simpleHash('') === base).assertFalse()");
      expect(EncryptionUtils.simpleHash('') === base).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0012',
        '#8 assert ' + "expect(EncryptionUtils.simpleHash('abc') === EncryptionUtils.simpleHash('Man')).assertFalse()");
      expect(EncryptionUtils.simpleHash('abc') === EncryptionUtils.simpleHash('Man')).assertFalse();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0012', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0013', 'begin');
      const uuid: string = EncryptionUtils.generateUuid();

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#1 ' + "uuid.length" + ' = ' + JSON.stringify(uuid.length));
      expect(uuid.length).assertEqual(UUID_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#2 assert ' + "expect(uuid.charAt(8)).assertEqual('-')");
      expect(uuid.charAt(8)).assertEqual('-');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#3 assert ' + "expect(uuid.charAt(13)).assertEqual('-')");
      expect(uuid.charAt(13)).assertEqual('-');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#4 assert ' + "expect(uuid.charAt(18)).assertEqual('-')");
      expect(uuid.charAt(18)).assertEqual('-');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#5 assert ' + "expect(uuid.charAt(23)).assertEqual('-')");
      expect(uuid.charAt(23)).assertEqual('-');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#6 assert ' + "expect(uuid.charAt(14)).assertEqual('4')");
      expect(uuid.charAt(14)).assertEqual('4');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#7 assert ' + "expect('89ab'.indexOf(uuid.charAt(19)) >= 0).assertTrue()");
      expect('89ab'.indexOf(uuid.charAt(19)) >= 0).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#8 assert ' + "expect(uuid.split('-')[0].length).assertEqual(8)");
      expect(uuid.split('-')[0].length).assertEqual(8);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0013',
        '#9 assert ' + "expect(uuid.split('-')[4].length).assertEqual(12)");
      expect(uuid.split('-')[4].length).assertEqual(12);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0013', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0014', 'begin');
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0014',
        '#1 ' + "generated.length" + ' = ' + JSON.stringify(generated.length));
      expect(generated.length).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0014',
        '#2 ' + "uniqueCount" + ' = ' + JSON.stringify(uniqueCount));
      expect(uniqueCount).assertEqual(30);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0014',
        '#3 ' + "invalidCount" + ' = ' + JSON.stringify(invalidCount));
      expect(invalidCount).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0014',
        '#4 ' + "generated[0].length" + ' = ' + JSON.stringify(generated[0].length));
      expect(generated[0].length).assertEqual(UUID_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0014',
        '#5 ' + "generated[29].length" + ' = ' + JSON.stringify(generated[29].length));
      expect(generated[29].length).assertEqual(UUID_LENGTH);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0014',
        '#6 ' + "generated[0] === generated[29]" + ' = ' + JSON.stringify(generated[0] === generated[29]));
      expect(generated[0] === generated[29]).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0014',
        '#7 assert ' + "expect(generated[0].charAt(14)).assertEqual('4')");
      expect(generated[0].charAt(14)).assertEqual('4');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0014', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0015', 'begin');
      const bytes: number[] = EncryptionUtils.hexToBytes('00ff10');

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#1 ' + "bytes.length" + ' = ' + JSON.stringify(bytes.length));
      expect(bytes.length).assertEqual(3);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#2 ' + "bytes[0]" + ' = ' + JSON.stringify(bytes[0]));
      expect(bytes[0]).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#3 ' + "bytes[1]" + ' = ' + JSON.stringify(bytes[1]));
      expect(bytes[1]).assertEqual(255);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#4 ' + "bytes[2]" + ' = ' + JSON.stringify(bytes[2]));
      expect(bytes[2]).assertEqual(16);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#5 assert ' + "expect(EncryptionUtils.hexToBytes('').length).assertEqual(0)");
      expect(EncryptionUtils.hexToBytes('').length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#6 assert ' + "expect(EncryptionUtils.hexToBytes('FF')[0]).assertEqual(255)");
      expect(EncryptionUtils.hexToBytes('FF')[0]).assertEqual(255);
      const odd: number[] = EncryptionUtils.hexToBytes('abc');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#7 ' + "odd.length" + ' = ' + JSON.stringify(odd.length));
      expect(odd.length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#8 ' + "odd[0]" + ' = ' + JSON.stringify(odd[0]));
      expect(odd[0]).assertEqual(171);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#9 ' + "odd[1]" + ' = ' + JSON.stringify(odd[1]));
      expect(odd[1]).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0015',
        '#10 assert ' + "expect(Number.isNaN(EncryptionUtils.hexToBytes('zz')[0])).assertTrue()");
      expect(Number.isNaN(EncryptionUtils.hexToBytes('zz')[0])).assertTrue();
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0015', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0016', 'begin');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0016',
        '#1 assert ' + "expect(EncryptionUtils.bytesToHex([])).assertEqual('')");
      expect(EncryptionUtils.bytesToHex([])).assertEqual('');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0016',
        '#2 assert ' + "expect(EncryptionUtils.bytesToHex([0, 15, 255])).assertEqual('000fff')");
      expect(EncryptionUtils.bytesToHex([0, 15, 255])).assertEqual('000fff');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0016',
        '#3 assert ' + "expect(EncryptionUtils.bytesToHex([1, 2, 3])).assertEqual('010203')");
      expect(EncryptionUtils.bytesToHex([1, 2, 3])).assertEqual('010203');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0016',
        '#4 assert ' +
        "expect(EncryptionUtils.bytesToHex(EncryptionUtils.hexToBytes('0a1fFF90'))).assertEqual('0a1fff90')");
      expect(EncryptionUtils.bytesToHex(EncryptionUtils.hexToBytes('0a1fFF90'))).assertEqual('0a1fff90');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0016',
        '#5 assert ' +
        "expect(EncryptionUtils.hexToBytes(EncryptionUtils.bytesToHex([0, 15, 255]))[1]).assertEqual(15)");
      expect(EncryptionUtils.hexToBytes(EncryptionUtils.bytesToHex([0, 15, 255]))[1]).assertEqual(15);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0016',
        '#6 assert ' + "expect(EncryptionUtils.bytesToHex([16]).length).assertEqual(2)");
      expect(EncryptionUtils.bytesToHex([16]).length).assertEqual(2);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0016',
        '#7 assert ' + "expect(EncryptionUtils.bytesToHex([171, 12])).assertEqual('ab0c')");
      expect(EncryptionUtils.bytesToHex([171, 12])).assertEqual('ab0c');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0016', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0017', 'begin');
      const empty: string = EncryptionUtils.generateKey(0);
      const shortKey: string = EncryptionUtils.generateKey(1);
      const defaultKey: string = EncryptionUtils.generateKey();
      const longKey: string = EncryptionUtils.generateKey(48);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#1 ' + "empty.length" + ' = ' + JSON.stringify(empty.length));
      expect(empty.length).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#2 ' + "shortKey.length" + ' = ' + JSON.stringify(shortKey.length));
      expect(shortKey.length).assertEqual(1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#3 ' + "defaultKey.length" + ' = ' + JSON.stringify(defaultKey.length));
      expect(defaultKey.length).assertEqual(16);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#4 ' + "longKey.length" + ' = ' + JSON.stringify(longKey.length));
      expect(longKey.length).assertEqual(48);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#5 assert ' + "expect(countOutsideTable(shortKey, KEY_TABLE)).assertEqual(0)");
      expect(countOutsideTable(shortKey, KEY_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#6 assert ' + "expect(countOutsideTable(defaultKey, KEY_TABLE)).assertEqual(0)");
      expect(countOutsideTable(defaultKey, KEY_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#7 assert ' + "expect(countOutsideTable(longKey, KEY_TABLE)).assertEqual(0)");
      expect(countOutsideTable(longKey, KEY_TABLE)).assertEqual(0);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0017',
        '#8 assert ' + "expect(longKey.indexOf('=')).assertEqual(-1)");
      expect(longKey.indexOf('=')).assertEqual(-1);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0017', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0018', 'begin');
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

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0018',
        '#1 ' + "first.length" + ' = ' + JSON.stringify(first.length));
      expect(first.length).assertEqual(24);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0018',
        '#2 ' + "second.length" + ' = ' + JSON.stringify(second.length));
      expect(second.length).assertEqual(24);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0018',
        '#3 ' + "first === second" + ' = ' + JSON.stringify(first === second));
      expect(first === second).assertFalse();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0018',
        '#4 ' + "collected.length" + ' = ' + JSON.stringify(collected.length));
      expect(collected.length).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0018',
        '#5 ' + "uniqueCount" + ' = ' + JSON.stringify(uniqueCount));
      expect(uniqueCount).assertEqual(10);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0018',
        '#6 ' + "collected[0].length" + ' = ' + JSON.stringify(collected[0].length));
      expect(collected[0].length).assertEqual(12);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0018',
        '#7 assert ' + "expect(countOutsideTable(collected[9], KEY_TABLE)).assertEqual(0)");
      expect(countOutsideTable(collected[9], KEY_TABLE)).assertEqual(0);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0018', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0019', 'begin');
      const account: string = '1234567890';

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#1 assert ' + "expect(EncryptionUtils.maskSensitive('')).assertEqual(MASKED_BLOCK)");
      expect(EncryptionUtils.maskSensitive('')).assertEqual(MASKED_BLOCK);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#2 assert ' + "expect(EncryptionUtils.maskSensitive('1234')).assertEqual(MASKED_BLOCK)");
      expect(EncryptionUtils.maskSensitive('1234')).assertEqual(MASKED_BLOCK);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#3 assert ' + "expect(EncryptionUtils.maskSensitive('12345')).assertEqual('*2345')");
      expect(EncryptionUtils.maskSensitive('12345')).assertEqual('*2345');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#4 assert ' + "expect(EncryptionUtils.maskSensitive(account)).assertEqual('******7890')");
      expect(EncryptionUtils.maskSensitive(account)).assertEqual('******7890');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#5 assert ' + "expect(EncryptionUtils.maskSensitive(account, 2)).assertEqual('********90')");
      expect(EncryptionUtils.maskSensitive(account, 2)).assertEqual('********90');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#6 assert ' + "expect(EncryptionUtils.maskSensitive(account, 0)).assertEqual('**********')");
      expect(EncryptionUtils.maskSensitive(account, 0)).assertEqual('**********');
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#7 assert ' + "expect(EncryptionUtils.maskSensitive(account, 10)).assertEqual(MASKED_BLOCK)");
      expect(EncryptionUtils.maskSensitive(account, 10)).assertEqual(MASKED_BLOCK);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0019',
        '#8 assert ' + "expect(EncryptionUtils.maskSensitive(account, 20)).assertEqual(MASKED_BLOCK)");
      expect(EncryptionUtils.maskSensitive(account, 20)).assertEqual(MASKED_BLOCK);
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0019', 'end');
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
      hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0020', 'begin');
      const mac: string = 'AABBCCDDEEFF';
      const masked: string = EncryptionUtils.maskSensitive(mac, 4);
      const tight: string = EncryptionUtils.maskSensitive(mac, 6);

      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#1 ' + "masked.length" + ' = ' + JSON.stringify(masked.length));
      expect(masked.length).assertEqual(mac.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#2 assert ' + "expect(masked.endsWith('EEFF')).assertTrue()");
      expect(masked.endsWith('EEFF')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#3 assert ' + "expect(masked.indexOf('AABBCC')).assertEqual(-1)");
      expect(masked.indexOf('AABBCC')).assertEqual(-1);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#4 assert ' + "expect(tight.endsWith('DDEEFF')).assertTrue()");
      expect(tight.endsWith('DDEEFF')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#5 ' + "tight.length" + ' = ' + JSON.stringify(tight.length));
      expect(tight.length).assertEqual(mac.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#6 assert ' + "expect(EncryptionUtils.maskSensitive(mac).length).assertEqual(mac.length)");
      expect(EncryptionUtils.maskSensitive(mac).length).assertEqual(mac.length);
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#7 assert ' + "expect(EncryptionUtils.maskSensitive(mac, 11).startsWith('*')).assertTrue()");
      expect(EncryptionUtils.maskSensitive(mac, 11).startsWith('*')).assertTrue();
      hilog.info(0xF811,
        '[Sample_BluetoothBaseProfile] testEncryptionUtils0020',
        '#8 assert ' + "expect(EncryptionUtils.maskSensitive('abcdef', 5)).assertEqual('*bcdef')");
      expect(EncryptionUtils.maskSensitive('abcdef', 5)).assertEqual('*bcdef');
    hilog.info(0xF811, '[Sample_BluetoothBaseProfile] testEncryptionUtils0020', 'end');
    });
  });
}
