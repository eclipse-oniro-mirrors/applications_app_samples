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


import { describe, it, expect, beforeAll, afterAll, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { FileSecurityUtil } from 'library';

const DOMAIN: number = 0xF811;
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_FILESECB64]';

interface Base64Case {
  input: string;
  expected: string;
}

const BASE64_CASES: Base64Case[] = [
  { input: '', expected: '' },
  { input: 'a', expected: 'YQ==' },
  { input: 'ab', expected: 'YWI=' },
  { input: 'abc', expected: 'YWJj' },
  { input: 'hello', expected: 'aGVsbG8=' },
  { input: 'hello world', expected: 'aGVsbG8gd29ybGQ=' },
  { input: '0', expected: 'MA==' },
  { input: '01', expected: 'MDE=' },
  { input: '123456789', expected: 'MTIzNDU2Nzg5' },
  { input: '中文', expected: '5Lit5paH' },
  { input: 'geofence', expected: 'Z2VvZmVuY2U=' },
  { input: 'Line1', expected: 'TGluZTE=' },
  { input: 'A', expected: 'QQ==' },
  { input: 'Z', expected: 'Wg==' },
];

interface HexLengthCase {
  bytes: number;
  expectedLength: number;
}

const HEX_LENGTH_CASES: HexLengthCase[] = [
  { bytes: 1, expectedLength: 2 },
  { bytes: 2, expectedLength: 4 },
  { bytes: 4, expectedLength: 8 },
  { bytes: 8, expectedLength: 16 },
  { bytes: 16, expectedLength: 32 },
  { bytes: 32, expectedLength: 64 },
  { bytes: 64, expectedLength: 128 },
];

export default function fileSecurityEncodingMatrixTest() {
  describe('FileSecurityEncodingMatrixTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'FileSecurityEncodingMatrixTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'FileSecurityEncodingMatrixTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0100
     * @tc.name      testBase64Encode0001
     * @tc.desc      Verify base64Encode returns the standard encoding for known text vectors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Encode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64Encode0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < BASE64_CASES.length; i++) {
        const row: Base64Case = BASE64_CASES[i];
        expect(FileSecurityUtil.base64Encode(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(BASE64_CASES.length);
      expect(BASE64_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'base64 rows checked: ' + checked);
      expect(FileSecurityUtil.base64Encode('abc')).assertEqual('YWJj');
      expect(FileSecurityUtil.base64Encode('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0200
     * @tc.name      testBase64Decode0002
     * @tc.desc      Verify base64Decode restores the byte length of ASCII vectors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Decode0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64Decode0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(FileSecurityUtil.base64Decode('YWJj').length).assertEqual(3);
      expect(FileSecurityUtil.base64Decode('YQ==').length).assertEqual(1);
      expect(FileSecurityUtil.base64Decode('').length).assertEqual(0);
      const bytes: Uint8Array = FileSecurityUtil.base64Decode('YWJj');
      expect(bytes[0]).assertEqual(97);
      expect(bytes[1]).assertEqual(98);
      expect(bytes[2]).assertEqual(99);
      expect(bytes.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0300
     * @tc.name      testBase64RoundTrip0003
     * @tc.desc      Verify encode then decode preserves the byte length for several texts.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64RoundTrip0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64RoundTrip0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const samples: string[] = ['a', 'ab', 'abc', 'hello', 'geofence', '123456789'];
      for (let i = 0; i < samples.length; i++) {
        const encoded: string = FileSecurityUtil.base64Encode(samples[i]);
        const decoded: Uint8Array = FileSecurityUtil.base64Decode(encoded);
        expect(decoded.length).assertEqual(samples[i].length);
        expect(encoded.length > 0).assertTrue();
      }
      expect(samples.length).assertEqual(6);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0400
     * @tc.name      testUuidFormat0004
     * @tc.desc      Verify generateUuid returns a 36 character version four identifier.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUuidFormat0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUuidFormat0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const uuid: string = FileSecurityUtil.generateUuid();
      expect(uuid.length).assertEqual(36);
      expect(uuid.charAt(8)).assertEqual('-');
      expect(uuid.charAt(13)).assertEqual('-');
      expect(uuid.charAt(18)).assertEqual('-');
      expect(uuid.charAt(23)).assertEqual('-');
      expect(uuid.charAt(14)).assertEqual('4');
      expect(uuid.split('-').length).assertEqual(5);
      expect(uuid.length).assertEqual(36);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0500
     * @tc.name      testUuidUniqueness0005
     * @tc.desc      Verify generated identifiers are distinct across a batch of calls.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUuidUniqueness0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUuidUniqueness0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const seen: string[] = [];
      let duplicates: number = 0;
      for (let i = 0; i < 30; i++) {
        const uuid: string = FileSecurityUtil.generateUuid();
        if (seen.indexOf(uuid) >= 0) {
          duplicates = duplicates + 1;
        }
        seen.push(uuid);
      }
      expect(seen.length).assertEqual(30);
      expect(duplicates).assertEqual(0);
      expect(seen[0] !== seen[1]).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0600
     * @tc.name      testRandomHexLength0006
     * @tc.desc      Verify generateRandomHex returns two hexadecimal characters per requested byte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomHexLength0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomHexLength0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < HEX_LENGTH_CASES.length; i++) {
        const row: HexLengthCase = HEX_LENGTH_CASES[i];
        expect(FileSecurityUtil.generateRandomHex(row.bytes).length).assertEqual(row.expectedLength);
        checked = checked + 1;
      }
      expect(checked).assertEqual(HEX_LENGTH_CASES.length);
      expect(HEX_LENGTH_CASES.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'hex rows checked: ' + checked);
      expect(FileSecurityUtil.generateRandomHex(0).length).assertEqual(0);
      expect(FileSecurityUtil.generateRandomHex(1).length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0700
     * @tc.name      testRandomHexCharset0007
     * @tc.desc      Verify generateRandomHex only emits lower case hexadecimal characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomHexCharset0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomHexCharset0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const alphabet: string = '0123456789abcdef';
      const text: string = FileSecurityUtil.generateRandomHex(64);
      expect(text.length).assertEqual(128);
      let valid: number = 0;
      for (let i = 0; i < text.length; i++) {
        if (alphabet.indexOf(text.charAt(i)) >= 0) {
          valid = valid + 1;
        }
      }
      expect(valid).assertEqual(text.length);
      expect(text).assertEqual(text.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECB64_0800
     * @tc.name      testBase64Padding0008
     * @tc.desc      Verify base64Encode applies the standard padding for one and two byte inputs.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64Padding0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64Padding0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      expect(FileSecurityUtil.base64Encode('a').endsWith('==')).assertTrue();
      expect(FileSecurityUtil.base64Encode('ab').endsWith('=')).assertTrue();
      expect(FileSecurityUtil.base64Encode('abc').endsWith('=')).assertFalse();
      expect(FileSecurityUtil.base64Encode('a').length).assertEqual(4);
      expect(FileSecurityUtil.base64Encode('ab').length).assertEqual(4);
      expect(FileSecurityUtil.base64Encode('abc').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
