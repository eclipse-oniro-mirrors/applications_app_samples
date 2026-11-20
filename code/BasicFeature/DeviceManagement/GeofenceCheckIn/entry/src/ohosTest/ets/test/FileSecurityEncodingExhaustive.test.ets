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
const SUITE_TAG: string = '[Sample_GeofenceCheckIn_FILESECEXH]';

interface Base64Case {
  input: string;
  expected: string;
}

const BASE64_CASES: Base64Case[] = [
  { input: 'sample0', expected: 'c2FtcGxlMA==' },
  { input: 'sample1', expected: 'c2FtcGxlMQ==' },
  { input: 'sample2', expected: 'c2FtcGxlMg==' },
  { input: 'sample3', expected: 'c2FtcGxlMw==' },
  { input: 'sample4', expected: 'c2FtcGxlNA==' },
  { input: 'sample5', expected: 'c2FtcGxlNQ==' },
  { input: 'sample6', expected: 'c2FtcGxlNg==' },
  { input: 'sample7', expected: 'c2FtcGxlNw==' },
  { input: 'sample8', expected: 'c2FtcGxlOA==' },
  { input: 'sample9', expected: 'c2FtcGxlOQ==' },
  { input: 'sample10', expected: 'c2FtcGxlMTA=' },
  { input: 'sample11', expected: 'c2FtcGxlMTE=' },
  { input: 'sample12', expected: 'c2FtcGxlMTI=' },
  { input: 'sample13', expected: 'c2FtcGxlMTM=' },
  { input: 'sample14', expected: 'c2FtcGxlMTQ=' },
  { input: 'sample15', expected: 'c2FtcGxlMTU=' },
  { input: 'sample16', expected: 'c2FtcGxlMTY=' },
  { input: 'sample17', expected: 'c2FtcGxlMTc=' },
  { input: 'sample18', expected: 'c2FtcGxlMTg=' },
  { input: 'sample19', expected: 'c2FtcGxlMTk=' },
  { input: 'sample20', expected: 'c2FtcGxlMjA=' },
  { input: 'sample21', expected: 'c2FtcGxlMjE=' },
  { input: 'sample22', expected: 'c2FtcGxlMjI=' },
  { input: 'sample23', expected: 'c2FtcGxlMjM=' },
  { input: 'sample24', expected: 'c2FtcGxlMjQ=' },
  { input: 'sample25', expected: 'c2FtcGxlMjU=' },
  { input: 'sample26', expected: 'c2FtcGxlMjY=' },
  { input: 'sample27', expected: 'c2FtcGxlMjc=' },
  { input: 'sample28', expected: 'c2FtcGxlMjg=' },
  { input: 'sample29', expected: 'c2FtcGxlMjk=' },
  { input: 'sample30', expected: 'c2FtcGxlMzA=' },
  { input: 'sample31', expected: 'c2FtcGxlMzE=' },
  { input: 'sample32', expected: 'c2FtcGxlMzI=' },
  { input: 'sample33', expected: 'c2FtcGxlMzM=' },
  { input: 'sample34', expected: 'c2FtcGxlMzQ=' },
  { input: 'sample35', expected: 'c2FtcGxlMzU=' },
  { input: 'sample36', expected: 'c2FtcGxlMzY=' },
  { input: 'sample37', expected: 'c2FtcGxlMzc=' },
  { input: 'sample38', expected: 'c2FtcGxlMzg=' },
  { input: 'sample39', expected: 'c2FtcGxlMzk=' },
  { input: 'sample40', expected: 'c2FtcGxlNDA=' },
  { input: 'sample41', expected: 'c2FtcGxlNDE=' },
  { input: 'sample42', expected: 'c2FtcGxlNDI=' },
  { input: 'sample43', expected: 'c2FtcGxlNDM=' },
  { input: 'sample44', expected: 'c2FtcGxlNDQ=' },
  { input: 'sample45', expected: 'c2FtcGxlNDU=' },
  { input: 'sample46', expected: 'c2FtcGxlNDY=' },
  { input: 'sample47', expected: 'c2FtcGxlNDc=' },
  { input: 'sample48', expected: 'c2FtcGxlNDg=' },
  { input: 'sample49', expected: 'c2FtcGxlNDk=' },
  { input: 'sample50', expected: 'c2FtcGxlNTA=' },
  { input: 'sample51', expected: 'c2FtcGxlNTE=' },
  { input: 'sample52', expected: 'c2FtcGxlNTI=' },
  { input: 'sample53', expected: 'c2FtcGxlNTM=' },
  { input: 'sample54', expected: 'c2FtcGxlNTQ=' },
  { input: 'sample55', expected: 'c2FtcGxlNTU=' },
  { input: 'sample56', expected: 'c2FtcGxlNTY=' },
  { input: 'sample57', expected: 'c2FtcGxlNTc=' },
  { input: 'sample58', expected: 'c2FtcGxlNTg=' },
  { input: 'sample59', expected: 'c2FtcGxlNTk=' },
  { input: 'sample60', expected: 'c2FtcGxlNjA=' },
  { input: 'sample61', expected: 'c2FtcGxlNjE=' },
  { input: 'sample62', expected: 'c2FtcGxlNjI=' },
  { input: 'sample63', expected: 'c2FtcGxlNjM=' },
  { input: 'sample64', expected: 'c2FtcGxlNjQ=' },
  { input: 'sample65', expected: 'c2FtcGxlNjU=' },
  { input: 'sample66', expected: 'c2FtcGxlNjY=' },
  { input: 'sample67', expected: 'c2FtcGxlNjc=' },
  { input: 'sample68', expected: 'c2FtcGxlNjg=' },
  { input: 'sample69', expected: 'c2FtcGxlNjk=' },
  { input: 'sample70', expected: 'c2FtcGxlNzA=' },
  { input: 'sample71', expected: 'c2FtcGxlNzE=' },
  { input: 'sample72', expected: 'c2FtcGxlNzI=' },
  { input: 'sample73', expected: 'c2FtcGxlNzM=' },
  { input: 'sample74', expected: 'c2FtcGxlNzQ=' },
  { input: 'sample75', expected: 'c2FtcGxlNzU=' },
  { input: 'sample76', expected: 'c2FtcGxlNzY=' },
  { input: 'sample77', expected: 'c2FtcGxlNzc=' },
  { input: 'sample78', expected: 'c2FtcGxlNzg=' },
  { input: 'sample79', expected: 'c2FtcGxlNzk=' },
  { input: 'sample80', expected: 'c2FtcGxlODA=' },
  { input: 'sample81', expected: 'c2FtcGxlODE=' },
  { input: 'sample82', expected: 'c2FtcGxlODI=' },
  { input: 'sample83', expected: 'c2FtcGxlODM=' },
  { input: 'sample84', expected: 'c2FtcGxlODQ=' },
  { input: 'sample85', expected: 'c2FtcGxlODU=' },
  { input: 'sample86', expected: 'c2FtcGxlODY=' },
  { input: 'sample87', expected: 'c2FtcGxlODc=' },
  { input: 'sample88', expected: 'c2FtcGxlODg=' },
  { input: 'sample89', expected: 'c2FtcGxlODk=' },
  { input: 'sample90', expected: 'c2FtcGxlOTA=' },
  { input: 'sample91', expected: 'c2FtcGxlOTE=' },
  { input: 'sample92', expected: 'c2FtcGxlOTI=' },
  { input: 'sample93', expected: 'c2FtcGxlOTM=' },
  { input: 'sample94', expected: 'c2FtcGxlOTQ=' },
  { input: 'sample95', expected: 'c2FtcGxlOTU=' },
  { input: 'sample96', expected: 'c2FtcGxlOTY=' },
  { input: 'sample97', expected: 'c2FtcGxlOTc=' },
  { input: 'sample98', expected: 'c2FtcGxlOTg=' },
  { input: 'sample99', expected: 'c2FtcGxlOTk=' },
  { input: '', expected: '' },
  { input: 'a', expected: 'YQ==' },
  { input: 'abc', expected: 'YWJj' },
  { input: 'hello world', expected: 'aGVsbG8gd29ybGQ=' },
];

export default function fileSecurityEncodingExhaustiveTest() {
  describe('FileSecurityEncodingExhaustiveTest', () => {
    beforeAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'FileSecurityEncodingExhaustiveTest suite start');
    });

    afterAll(() => {
      hilog.info(DOMAIN, SUITE_TAG, '%{public}s', 'FileSecurityEncodingExhaustiveTest suite end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECEXH_0100
     * @tc.name      testBase64EncodeExhaustive0001
     * @tc.desc      Verify base64Encode for one hundred generated texts and four known vectors.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64EncodeExhaustive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64EncodeExhaustive0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < BASE64_CASES.length; i++) {
        const row: Base64Case = BASE64_CASES[i];
        expect(FileSecurityUtil.base64Encode(row.input)).assertEqual(row.expected);
        checked = checked + 1;
      }
      expect(checked).assertEqual(104);
      expect(FileSecurityUtil.base64Encode('abc').length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECEXH_0200
     * @tc.name      testBase64DecodeExhaustive0002
     * @tc.desc      Verify base64Decode returns the expected byte length for generated encodings.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testBase64DecodeExhaustive0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testBase64DecodeExhaustive0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      let checked: number = 0;
      for (let i = 0; i < 100; i++) {
        const source: string = 'sample' + i;
        const encoded: string = FileSecurityUtil.base64Encode(source);
        expect(FileSecurityUtil.base64Decode(encoded).length).assertEqual(source.length);
        checked = checked + 1;
      }
      expect(checked).assertEqual(100);
      expect(FileSecurityUtil.base64Decode('').length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECEXH_0300
     * @tc.name      testUuidExhaustive0003
     * @tc.desc      Verify generateUuid keeps the canonical length, separators and version nibble.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testUuidExhaustive0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testUuidExhaustive0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const seen: string[] = [];
      let unique: number = 0;
      for (let i = 0; i < 50; i++) {
        const value: string = FileSecurityUtil.generateUuid();
        expect(value.length).assertEqual(36);
        expect(value.charAt(8)).assertEqual('-');
        expect(value.charAt(13)).assertEqual('-');
        expect(value.charAt(18)).assertEqual('-');
        expect(value.charAt(23)).assertEqual('-');
        expect(value.charAt(14)).assertEqual('4');
        if (seen.indexOf(value) < 0) {
          seen.push(value);
          unique = unique + 1;
        }
      }
      expect(unique).assertEqual(50);
      expect(seen.length).assertEqual(50);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_GEOFENCECHECKIN_FILESECEXH_0400
     * @tc.name      testRandomHexExhaustive0004
     * @tc.desc      Verify generateRandomHex honours every requested byte length and the hex alphabet.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testRandomHexExhaustive0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testRandomHexExhaustive0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const lengths: number[] = [1, 2, 4, 8, 16, 32, 64];
      let checked: number = 0;
      for (let i = 0; i < lengths.length; i++) {
        const value: string = FileSecurityUtil.generateRandomHex(lengths[i]);
        expect(value.length).assertEqual(lengths[i] * 2);
        expect(value.toLowerCase()).assertEqual(value);
        checked = checked + 1;
      }
      expect(checked).assertEqual(7);
      expect(FileSecurityUtil.generateRandomHex(1).length).assertEqual(2);
      expect(FileSecurityUtil.generateRandomHex(16).length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

  });
}
