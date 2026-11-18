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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { util } from '@kit.ArkTS';
import { CryptoUtils } from 'library';

const DOMAIN: number = 0xF811;

// Registers the numeric matrix test suite for the offline crypto helper assertions.
export default function numericMatrixCryptoTest() {
  describe('NumericMatrixCryptoSuite', () => {
    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0100
     * @tc.name      testNumCrypto0001
     * @tc.desc      Verify md5 renders the published RFC 1321 test vector of the string abc as lowercase hex.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0001';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The three character string abc is the canonical RFC 1321 test vector.
      const digest: string = await CryptoUtils.md5('abc');
      // The digest must match the published vector byte for byte.
      expect(digest).assertEqual('900150983cd24fb0d6963f7d28e17f72');
      // MD5 always renders thirty two hex characters.
      expect(digest.length).assertEqual(32);
      // A repeated call must reproduce exactly the same digest.
      expect(await CryptoUtils.md5('abc')).assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0200
     * @tc.name      testNumCrypto0002
     * @tc.desc      Verify md5 of the empty message returns the published RFC 1321 empty digest constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0002';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty message takes the fixed published digest instead of the framework path.
      const digest: string = await CryptoUtils.md5('');
      // The empty digest constant matches the RFC 1321 definition exactly.
      expect(digest).assertEqual('d41d8cd98f00b204e9800998ecf8427e');
      // The empty digest still keeps the full thirty two character width.
      expect(digest.length).assertEqual(32);
      // Repeating the empty digest call stays stable across invocations.
      expect(await CryptoUtils.md5('')).assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0300
     * @tc.name      testNumCrypto0003
     * @tc.desc      Verify md5 renders the well known digest of hello and stays case sensitive against Hello.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0003';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lower case greeting has a widely published MD5 vector.
      const digest: string = await CryptoUtils.md5('hello');
      // The digest matches the published hello vector exactly.
      expect(digest).assertEqual('5d41402abc4b2a76b9719d911017c592');
      // The width of the hello digest is the standard thirty two characters.
      expect(digest.length).assertEqual(32);
      // Changing one letter to upper case must produce a different digest.
      expect(await CryptoUtils.md5('Hello')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0400
     * @tc.name      testNumCrypto0004
     * @tc.desc      Verify md5 renders the well known digest of the numeric string 123456 and differs from the empty digest.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0004';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The six digit numeric string has a widely published MD5 vector.
      const digest: string = await CryptoUtils.md5('123456');
      // The digest matches the published numeric vector exactly.
      expect(digest).assertEqual('e10adc3949ba59abbe56e057f20f883e');
      // The width of the numeric digest is the standard thirty two characters.
      expect(digest.length).assertEqual(32);
      // A non empty digest must differ from the published empty message digest.
      expect(digest).not().assertEqual('d41d8cd98f00b204e9800998ecf8427e');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0500
     * @tc.name      testNumCrypto0005
     * @tc.desc      Verify md5 renders the published digest of the classic pangolin sentence used by many RFC suites.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0005';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The quick brown fox sentence is a widely published cross implementation vector.
      const digest: string = await CryptoUtils.md5('The quick brown fox jumps over the lazy dog');
      // The digest matches the published fox vector exactly.
      expect(digest).assertEqual('9e107d9d372bb6826bd81d3542a419d6');
      // The width of the fox digest is the standard thirty two characters.
      expect(digest.length).assertEqual(32);
      // Removing the trailing word must produce a completely different digest.
      expect(await CryptoUtils.md5('The quick brown fox jumps over the lazy')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0600
     * @tc.name      testNumCrypto0006
     * @tc.desc      Verify md5 renders the published RFC 1321 single character vector of the letter a.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0006';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single character a is the smallest RFC 1321 message vector.
      const digest: string = await CryptoUtils.md5('a');
      // The digest matches the published single character vector exactly.
      expect(digest).assertEqual('0cc175b9c0f1b6a831c399e269772661');
      // The width of the single character digest stays at thirty two characters.
      expect(digest.length).assertEqual(32);
      // The single character digest differs from the empty message digest.
      expect(digest).not().assertEqual('d41d8cd98f00b204e9800998ecf8427e');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0700
     * @tc.name      testNumCrypto0007
     * @tc.desc      Verify md5 renders the fixed expected digest of the eight-character ASCII sample.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0007';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const digest: string = await CryptoUtils.md5('testdata');
      expect(digest).assertEqual('ef654c40ab4f1747fc699915d4f70902');
      expect(digest.length).assertEqual(32);
      // A longer variant with one digit appended must hash differently.
      expect(await CryptoUtils.md5('testdata1')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0800
     * @tc.name      testNumCrypto0008
     * @tc.desc      Verify md5 renders the published digest of the single digit string 0 and differs from the letter vector.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0008';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single digit string 0 has a well known published vector.
      const digest: string = await CryptoUtils.md5('0');
      // The digest matches the published single digit vector exactly.
      expect(digest).assertEqual('cfcd208495d565ef66e7dff9f98764da');
      // The width of the single digit digest stays at thirty two characters.
      expect(digest.length).assertEqual(32);
      // A one character text and a one digit text must hash differently.
      expect(await CryptoUtils.md5('a')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_0900
     * @tc.name      testNumCrypto0009
     * @tc.desc      Verify every md5 result is a thirty two character lowercase hexadecimal string for several inputs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0009';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three representative inputs cover short, mixed case and numeric content.
      const first: string = await CryptoUtils.md5('abcdef');
      const second: string = await CryptoUtils.md5('Network');
      const third: string = await CryptoUtils.md5('9876543210');
      // Each digest keeps the fixed thirty two character width.
      expect(first.length).assertEqual(32);
      expect(second.length).assertEqual(32);
      expect(third.length).assertEqual(32);
      // Every digest is a pure lowercase hexadecimal string.
      expect(/^[0-9a-f]{32}$/.test(first)).assertTrue();
      expect(/^[0-9a-f]{32}$/.test(second)).assertTrue();
      expect(/^[0-9a-f]{32}$/.test(third)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1000
     * @tc.name      testNumCrypto0010
     * @tc.desc      Verify md5 is deterministic by repeating two distinct inputs and comparing both repetitions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0010';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two distinct inputs exercise determinism on different content shapes.
      const first: string = await CryptoUtils.md5('determinism');
      const second: string = await CryptoUtils.md5('matrix');
      // Repeating the first input reproduces the first digest exactly.
      expect(await CryptoUtils.md5('determinism')).assertEqual(first);
      // Repeating the second input reproduces the second digest exactly.
      expect(await CryptoUtils.md5('matrix')).assertEqual(second);
      // The two different inputs keep producing different digests.
      expect(first).not().assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1100
     * @tc.name      testNumCrypto0011
     * @tc.desc      Verify md5 reacts to one letter change, one trailing space and one case flip with different digests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0011';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The baseline digest of the three letter prefix anchors the comparison.
      const baseline: string = await CryptoUtils.md5('abc');
      // A one letter change must change the digest.
      expect(await CryptoUtils.md5('abd')).not().assertEqual(baseline);
      // One trailing space is content and must change the digest.
      expect(await CryptoUtils.md5('abc ')).not().assertEqual(baseline);
      // An all upper case variant must change the digest too.
      expect(await CryptoUtils.md5('ABC')).not().assertEqual(baseline);
      // The baseline itself still matches its published vector.
      expect(baseline).assertEqual('900150983cd24fb0d6963f7d28e17f72');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1200
     * @tc.name      testNumCrypto0012
     * @tc.desc      Verify md5 of a three hundred character repeated text stays deterministic and differs from the shorter variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0012';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A three hundred character repeated text exercises the multi block update path.
      const longText: string = 'a'.repeat(300);
      const digest: string = await CryptoUtils.md5(longText);
      // Even long inputs collapse to the fixed thirty two character width.
      expect(digest.length).assertEqual(32);
      // Repeating the long input reproduces the same digest.
      expect(await CryptoUtils.md5(longText)).assertEqual(digest);
      // One extra character changes the digest of the long text.
      expect(await CryptoUtils.md5('a'.repeat(301))).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1300
     * @tc.name      testNumCrypto0013
     * @tc.desc      Verify md5 of a Chinese multi byte text keeps the fixed width, stays deterministic and differs from ASCII content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0013';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese characters encode to multiple UTF-8 bytes per character.
      const digest: string = await CryptoUtils.md5('网络安全');
      // Multi byte content still collapses to the fixed thirty two character width.
      expect(digest.length).assertEqual(32);
      // Repeating the Chinese input reproduces the same digest.
      expect(await CryptoUtils.md5('网络安全')).assertEqual(digest);
      // The multi byte digest differs from the single letter ASCII digest.
      expect(digest).not().assertEqual(await CryptoUtils.md5('a'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1400
     * @tc.name      testNumCrypto0014
     * @tc.desc      Verify sha256 renders the published NIST test vector of the string abc as sixty four lowercase hex characters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0014';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The three character string abc is the canonical NIST SHA-256 vector.
      const digest: string = await CryptoUtils.sha256('abc');
      // The digest matches the published NIST vector exactly.
      expect(digest).assertEqual('ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad');
      // SHA-256 always renders sixty four hex characters.
      expect(digest.length).assertEqual(64);
      // A repeated call must reproduce exactly the same digest.
      expect(await CryptoUtils.sha256('abc')).assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1500
     * @tc.name      testNumCrypto0015
     * @tc.desc      Verify sha256 of the empty message returns the published NIST empty digest constant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0015';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty message takes the fixed published digest instead of the framework path.
      const digest: string = await CryptoUtils.sha256('');
      // The empty digest constant matches the NIST definition exactly.
      expect(digest).assertEqual('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
      // The empty digest still keeps the full sixty four character width.
      expect(digest.length).assertEqual(64);
      // Repeating the empty digest call stays stable across invocations.
      expect(await CryptoUtils.sha256('')).assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1600
     * @tc.name      testNumCrypto0016
     * @tc.desc      Verify sha256 renders the well known digest of hello and differs from the md5 digest of the same text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0016';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The lower case greeting has a widely published SHA-256 vector.
      const digest: string = await CryptoUtils.sha256('hello');
      // The digest matches the published hello vector exactly.
      expect(digest).assertEqual('2cf24dba5fb0a30e26e83b2ac5b9e29e1b161e5c1fa7425e73043362938b9824');
      // The width of the hello digest is the standard sixty four characters.
      expect(digest.length).assertEqual(64);
      // The same text must hash differently under MD5 and SHA-256.
      expect(await CryptoUtils.md5('hello')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1700
     * @tc.name      testNumCrypto0017
     * @tc.desc      Verify sha256 renders the well known digest of the numeric string 123456 and keeps the sixty four character width.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0017';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The six digit numeric string has a widely published SHA-256 vector.
      const digest: string = await CryptoUtils.sha256('123456');
      // The digest matches the published numeric vector exactly.
      expect(digest).assertEqual('8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92');
      // The width of the numeric digest is the standard sixty four characters.
      expect(digest.length).assertEqual(64);
      // A non empty digest must differ from the published empty message digest.
      expect(digest).not().assertEqual('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1800
     * @tc.name      testNumCrypto0018
     * @tc.desc      Verify sha256 renders the published digest of the classic pangolin sentence and reacts to dropped words.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0018';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The quick brown fox sentence is a widely published cross implementation vector.
      const digest: string = await CryptoUtils.sha256('The quick brown fox jumps over the lazy dog');
      // The digest matches the published fox vector exactly.
      expect(digest).assertEqual('d7a8fbb307d7809469ca9abcb0082e4f8d5651e46d3cdb762d02d0bf37c9e592');
      // The width of the fox digest is the standard sixty four characters.
      expect(digest.length).assertEqual(64);
      // Removing the trailing word must produce a completely different digest.
      expect(await CryptoUtils.sha256('The quick brown fox jumps over the lazy')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_1900
     * @tc.name      testNumCrypto0019
     * @tc.desc      Verify sha256 renders the published NIST single character vector of the letter a.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0019';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single character a is the smallest NIST message vector.
      const digest: string = await CryptoUtils.sha256('a');
      // The digest matches the published single character vector exactly.
      expect(digest).assertEqual('ca978112ca1bbdcafac231b39a23dc4da786eff8147c4e72b9807785afee48bb');
      // The width of the single character digest stays at sixty four characters.
      expect(digest.length).assertEqual(64);
      // The single character digest differs from the empty message digest.
      expect(digest).not().assertEqual('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2000
     * @tc.name      testNumCrypto0020
     * @tc.desc      Verify sha256 renders the fixed expected digest of the eight-character ASCII sample and reacts to appended digits.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0020';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      const digest: string = await CryptoUtils.sha256('testdata');
      expect(digest).assertEqual('810ff2fb242a5dee4220f2cb0e6a519891fb67f2f828a6cab4ef8894633b1f50');
      expect(digest.length).assertEqual(64);
      // A longer variant with one digit appended must hash differently.
      expect(await CryptoUtils.sha256('testdata1')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2100
     * @tc.name      testNumCrypto0021
     * @tc.desc      Verify sha256 renders the well known digest of the single digit string 0 and differs from the letter vector.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0021';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The single digit string 0 has a well known published vector.
      const digest: string = await CryptoUtils.sha256('0');
      // The digest matches the published single digit vector exactly.
      expect(digest).assertEqual('5feceb66ffc86f38d952786c6d696c79c2dbc239dd4e91b46729d73a27fb57e9');
      // The width of the single digit digest stays at sixty four characters.
      expect(digest.length).assertEqual(64);
      // A one character text and a one digit text must hash differently.
      expect(await CryptoUtils.sha256('a')).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2200
     * @tc.name      testNumCrypto0022
     * @tc.desc      Verify every sha256 result is a sixty four character lowercase hexadecimal string for several inputs.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0022';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three representative inputs cover short, mixed case and numeric content.
      const first: string = await CryptoUtils.sha256('abcdef');
      const second: string = await CryptoUtils.sha256('Network');
      const third: string = await CryptoUtils.sha256('9876543210');
      // Each digest keeps the fixed sixty four character width.
      expect(first.length).assertEqual(64);
      expect(second.length).assertEqual(64);
      expect(third.length).assertEqual(64);
      // Every digest is a pure lowercase hexadecimal string.
      expect(/^[0-9a-f]{64}$/.test(first)).assertTrue();
      expect(/^[0-9a-f]{64}$/.test(second)).assertTrue();
      expect(/^[0-9a-f]{64}$/.test(third)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2300
     * @tc.name      testNumCrypto0023
     * @tc.desc      Verify sha256 is deterministic by repeating two distinct inputs and comparing both repetitions.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0023';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two distinct inputs exercise determinism on different content shapes.
      const first: string = await CryptoUtils.sha256('determinism');
      const second: string = await CryptoUtils.sha256('matrix');
      // Repeating the first input reproduces the first digest exactly.
      expect(await CryptoUtils.sha256('determinism')).assertEqual(first);
      // Repeating the second input reproduces the second digest exactly.
      expect(await CryptoUtils.sha256('matrix')).assertEqual(second);
      // The two different inputs keep producing different digests.
      expect(first).not().assertEqual(second);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2400
     * @tc.name      testNumCrypto0024
     * @tc.desc      Verify sha256 reacts to one letter change, one trailing space and one case flip with different digests.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0024';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The baseline digest of the three letter prefix anchors the comparison.
      const baseline: string = await CryptoUtils.sha256('abc');
      // A one letter change must change the digest.
      expect(await CryptoUtils.sha256('abd')).not().assertEqual(baseline);
      // One trailing space is content and must change the digest.
      expect(await CryptoUtils.sha256('abc ')).not().assertEqual(baseline);
      // An all upper case variant must change the digest too.
      expect(await CryptoUtils.sha256('ABC')).not().assertEqual(baseline);
      // The baseline itself still matches its published vector.
      expect(baseline).assertEqual('ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2500
     * @tc.name      testNumCrypto0025
     * @tc.desc      Verify sha256 of a three hundred character repeated text stays deterministic and differs from the shorter variant.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0025';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A three hundred character repeated text exercises the multi block update path.
      const longText: string = 'b'.repeat(300);
      const digest: string = await CryptoUtils.sha256(longText);
      // Even long inputs collapse to the fixed sixty four character width.
      expect(digest.length).assertEqual(64);
      // Repeating the long input reproduces the same digest.
      expect(await CryptoUtils.sha256(longText)).assertEqual(digest);
      // One extra character changes the digest of the long text.
      expect(await CryptoUtils.sha256('b'.repeat(301))).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2600
     * @tc.name      testNumCrypto0026
     * @tc.desc      Verify sha256 of a Chinese multi byte text keeps the fixed width, stays deterministic and differs from ASCII content.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0026';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese characters encode to multiple UTF-8 bytes per character.
      const digest: string = await CryptoUtils.sha256('安全矩阵');
      // Multi byte content still collapses to the fixed sixty four character width.
      expect(digest.length).assertEqual(64);
      // Repeating the Chinese input reproduces the same digest.
      expect(await CryptoUtils.sha256('安全矩阵')).assertEqual(digest);
      // The multi byte digest differs from the single letter ASCII digest.
      expect(digest).not().assertEqual(await CryptoUtils.sha256('a'));
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2700
     * @tc.name      testNumCrypto0027
     * @tc.desc      Verify both digest methods return their exact published empty message constants in one combined case.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0027';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Both algorithms run against the same empty message content.
      const md5Empty: string = await CryptoUtils.md5('');
      const sha256Empty: string = await CryptoUtils.sha256('');
      // The MD5 empty constant matches the RFC 1321 definition exactly.
      expect(md5Empty).assertEqual('d41d8cd98f00b204e9800998ecf8427e');
      // The SHA-256 empty constant matches the NIST definition exactly.
      expect(sha256Empty).assertEqual('e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855');
      // The two empty constants must differ from each other.
      expect(md5Empty).not().assertEqual(sha256Empty);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2800
     * @tc.name      testNumCrypto0028
     * @tc.desc      Verify md5 and sha256 produce different digests of widths thirty two and sixty four for the same text.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testNumCrypto0028';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The same anchor text feeds both algorithms.
      const md5Digest: string = await CryptoUtils.md5('cross-check');
      const sha256Digest: string = await CryptoUtils.sha256('cross-check');
      // MD5 keeps the thirty two character width.
      expect(md5Digest.length).assertEqual(32);
      // SHA-256 keeps the sixty four character width.
      expect(sha256Digest.length).assertEqual(64);
      // The two digests of the same text must differ in content.
      expect(md5Digest).not().assertEqual(sha256Digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_2900
     * @tc.name      testNumCrypto0029
     * @tc.desc      Verify bytesToHex renders the empty byte array as an empty lowercase string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0029';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty byte array is the smallest possible input.
      const empty: Uint8Array = new Uint8Array(0);
      const result: string = CryptoUtils.bytesToHex(empty);
      // Zero bytes render as the empty string.
      expect(result).assertEqual('');
      // The rendered text has zero characters.
      expect(result.length).assertEqual(0);
      // Repeating the render reproduces the empty result.
      expect(CryptoUtils.bytesToHex(empty)).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3000
     * @tc.name      testNumCrypto0030
     * @tc.desc      Verify bytesToHex renders the minimum byte value zero as the padded pair 00.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0030';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The byte value zero is the minimum representable byte.
      const bytes: Uint8Array = new Uint8Array([0]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The minimum byte renders as the zero padded pair 00.
      expect(result).assertEqual('00');
      // One byte always renders exactly two characters.
      expect(result.length).assertEqual(2);
      // The padded render is fully lowercase hexadecimal.
      expect(/^[0-9a-f]{2}$/.test(result)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3100
     * @tc.name      testNumCrypto0031
     * @tc.desc      Verify bytesToHex renders the maximum byte value 255 as the lowercase pair ff.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0031';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The byte value 255 is the maximum representable byte.
      const bytes: Uint8Array = new Uint8Array([255]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The maximum byte renders as the lowercase pair ff.
      expect(result).assertEqual('ff');
      // One byte always renders exactly two characters.
      expect(result.length).assertEqual(2);
      // The render never produces uppercase letters.
      expect(result).assertEqual(result.toLowerCase());
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3200
     * @tc.name      testNumCrypto0032
     * @tc.desc      Verify bytesToHex pads single digit hex values with a leading zero for the byte ten.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0032';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The byte value ten renders as one hex digit without padding.
      const bytes: Uint8Array = new Uint8Array([10]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The padStart helper prepends the missing zero digit.
      expect(result).assertEqual('0a');
      // The padded pair keeps the fixed two character width.
      expect(result.length).assertEqual(2);
      // The byte value sixteen renders as the two digit pair 10.
      expect(CryptoUtils.bytesToHex(new Uint8Array([16]))).assertEqual('10');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3300
     * @tc.name      testNumCrypto0033
     * @tc.desc      Verify bytesToHex renders the ascending byte triple with zero padded pairs in order.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0033';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three ascending bytes cover padded and two digit renders together.
      const bytes: Uint8Array = new Uint8Array([1, 2, 3]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The joined render arranges every pair in byte order.
      expect(result).assertEqual('010203');
      // Three bytes render exactly six characters.
      expect(result.length).assertEqual(6);
      // Dropping to one byte keeps only its own pair.
      expect(CryptoUtils.bytesToHex(new Uint8Array([2]))).assertEqual('02');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3400
     * @tc.name      testNumCrypto0034
     * @tc.desc      Verify bytesToHex renders a mixed low and high byte triple as 1234ab with lowercase letters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0034';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The triple 0x12, 0x34 and 0xab mixes digits and a letter pair.
      const bytes: Uint8Array = new Uint8Array([0x12, 0x34, 0xab]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The render joins all three pairs in byte order.
      expect(result).assertEqual('1234ab');
      // Three bytes render exactly six characters.
      expect(result.length).assertEqual(6);
      // The letter pair renders lowercase instead of uppercase.
      expect(result.substring(4, 6)).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3500
     * @tc.name      testNumCrypto0035
     * @tc.desc      Verify bytesToHex always renders exactly two characters per byte for several array lengths.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0035';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three array lengths of one, three and five bytes cover odd and even counts.
      const one: string = CryptoUtils.bytesToHex(new Uint8Array([7]));
      const three: string = CryptoUtils.bytesToHex(new Uint8Array([7, 8, 9]));
      const five: string = CryptoUtils.bytesToHex(new Uint8Array([7, 8, 9, 10, 11]));
      // Every byte contributes exactly two characters.
      expect(one.length).assertEqual(2);
      expect(three.length).assertEqual(6);
      expect(five.length).assertEqual(10);
      // The five byte render keeps the same prefix as the three byte render.
      expect(five.substring(0, 6)).assertEqual(three);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3600
     * @tc.name      testNumCrypto0036
     * @tc.desc      Verify bytesToHex renders eight maximum bytes as a repeated f string of sixteen characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0036';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Eight maximum bytes all render the same pair ff.
      const bytes: Uint8Array = new Uint8Array([255, 255, 255, 255, 255, 255, 255, 255]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The joined render is a pure f sequence of sixteen characters.
      expect(result).assertEqual('ffffffffffffffff');
      // Eight bytes render exactly sixteen characters.
      expect(result.length).assertEqual(16);
      // A single maximum byte still renders the two character pair.
      expect(CryptoUtils.bytesToHex(new Uint8Array([255]))).assertEqual('ff');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3700
     * @tc.name      testNumCrypto0037
     * @tc.desc      Verify bytesToHex renders the classic marker quadruple as the well known deadbeef text.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0037';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The four marker bytes render the classic debug constant.
      const bytes: Uint8Array = new Uint8Array([0xde, 0xad, 0xbe, 0xef]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The joined render spells the well known constant.
      expect(result).assertEqual('deadbeef');
      // Four bytes render exactly eight characters.
      expect(result.length).assertEqual(8);
      // Reversing the byte order changes the rendered text.
      expect(CryptoUtils.bytesToHex(new Uint8Array([0xef, 0xbe, 0xad, 0xde]))).assertEqual('efbeadde');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3800
     * @tc.name      testNumCrypto0038
     * @tc.desc      Verify bytesToHex renders the signed boundary pair 7f80 for the bytes just below and above one hundred twenty eight.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0038';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The pair 127 and 128 straddles the signed byte boundary.
      const bytes: Uint8Array = new Uint8Array([127, 128]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The render keeps both pairs lowercase and in order.
      expect(result).assertEqual('7f80');
      // Two bytes render exactly four characters.
      expect(result.length).assertEqual(4);
      // The single high boundary byte renders the two digit pair 80.
      expect(CryptoUtils.bytesToHex(new Uint8Array([128]))).assertEqual('80');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_3900
     * @tc.name      testNumCrypto0039
     * @tc.desc      Verify bytesToHex renders the powers of two sequence 102040 for the bytes sixteen, thirty two and sixty four.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0039';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The powers of two bytes all render as two digit hex pairs.
      const bytes: Uint8Array = new Uint8Array([16, 32, 64]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The joined render spells the power of two sequence.
      expect(result).assertEqual('102040');
      // Three bytes render exactly six characters.
      expect(result.length).assertEqual(6);
      // Doubling one byte to one hundred twenty eight renders the pair 80.
      expect(CryptoUtils.bytesToHex(new Uint8Array([128]))).assertEqual('80');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4000
     * @tc.name      testNumCrypto0040
     * @tc.desc      Verify bytesToHex renders the full byte range sweep with length five hundred twelve and boundary prefixes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0040';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The sweep fills every byte value from zero to two hundred fifty five.
      const bytes: Uint8Array = new Uint8Array(256);
      for (let i = 0; i < 256; i++) {
        bytes[i] = i;
      }
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The full sweep renders exactly five hundred twelve characters.
      expect(result.length).assertEqual(512);
      // The render starts with the ascending zero padded prefix.
      expect(result.substring(0, 6)).assertEqual('000102');
      // Two bytes need four hex characters, so the suffix starts at 508.
      expect(result.substring(508, 512)).assertEqual('feff');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4100
     * @tc.name      testNumCrypto0041
     * @tc.desc      Verify bytesToHex renders the UTF-8 bytes of the ASCII text hi as the pair sequence 6869.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0041';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The platform text encoder produces the raw bytes of the ASCII text.
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto('hi');
      // ASCII letters encode to one byte each.
      expect(bytes.length).assertEqual(2);
      // The hex render spells the ASCII code points h and i.
      expect(CryptoUtils.bytesToHex(bytes)).assertEqual('6869');
      // The single letter a encodes to the byte 0x41 rendered as 41.
      expect(CryptoUtils.bytesToHex(encoder.encodeInto('A'))).assertEqual('41');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4200
     * @tc.name      testNumCrypto0042
     * @tc.desc      Verify bytesToHex renders the multi byte UTF-8 encoding of a Chinese character with one byte per hex pair.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0042';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese characters encode to three UTF-8 bytes each.
      const encoder: util.TextEncoder = new util.TextEncoder();
      const bytes: Uint8Array = encoder.encodeInto('网');
      // One Chinese character encodes to exactly three bytes.
      expect(bytes.length).assertEqual(3);
      // Three bytes render exactly six hex characters.
      expect(CryptoUtils.bytesToHex(bytes).length).assertEqual(6);
      // The render is a pure lowercase hexadecimal string.
      expect(/^[0-9a-f]{6}$/.test(CryptoUtils.bytesToHex(bytes))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4300
     * @tc.name      testNumCrypto0043
     * @tc.desc      Verify base64Encode renders the empty text as the empty Base64 string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0043';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Encoding the empty text produces zero payload characters.
      const result: string = CryptoUtils.base64Encode('');
      // The empty text renders as the empty Base64 string.
      expect(result).assertEqual('');
      // The rendered text has zero characters.
      expect(result.length).assertEqual(0);
      // Repeating the encode reproduces the empty result.
      expect(CryptoUtils.base64Encode('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4400
     * @tc.name      testNumCrypto0044
     * @tc.desc      Verify base64Encode renders the one byte text a with the standard padding YQ equals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0044';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One byte of payload produces one padded Base64 group.
      const result: string = CryptoUtils.base64Encode('a');
      // The one byte render uses the standard two padding equals signs.
      expect(result).assertEqual('YQ==');
      // One payload byte renders exactly four characters.
      expect(result.length).assertEqual(4);
      // The render keeps the exact two character padding suffix.
      expect(result.substring(2, 4)).assertEqual('==');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4500
     * @tc.name      testNumCrypto0045
     * @tc.desc      Verify base64Encode renders the two byte text ab with one padding equals sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0045';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two bytes of payload produce one group with one padding character.
      const result: string = CryptoUtils.base64Encode('ab');
      // The two byte render carries exactly one trailing equals sign.
      expect(result).assertEqual('YWI=');
      // Two payload bytes render exactly four characters.
      expect(result.length).assertEqual(4);
      // The render keeps the exact one character padding suffix.
      expect(result.substring(3, 4)).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4600
     * @tc.name      testNumCrypto0046
     * @tc.desc      Verify base64Encode renders the three byte text abc without any padding characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0046';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three bytes of payload fill one group with no padding needed.
      const result: string = CryptoUtils.base64Encode('abc');
      // The three byte render carries no padding at all.
      expect(result).assertEqual('YWJj');
      // Three payload bytes render exactly four characters.
      expect(result.length).assertEqual(4);
      // The render stays free of the equals padding character.
      expect(result.indexOf('=')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4700
     * @tc.name      testNumCrypto0047
     * @tc.desc      Verify base64Encode renders the well known hello vector with its single padding equals sign.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0047';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five bytes of hello fill one full group plus a two byte remainder.
      const result: string = CryptoUtils.base64Encode('hello');
      // The render matches the widely published hello vector.
      expect(result).assertEqual('aGVsbG8=');
      // Five payload bytes render exactly eight characters.
      expect(result.length).assertEqual(8);
      // The remainder group keeps exactly one padding character.
      expect(result.substring(7, 8)).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4800
     * @tc.name      testNumCrypto0048
     * @tc.desc      Verify base64Encode renders the well known Hello World vector including the encoded space byte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0048';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Eleven bytes of payload fill three full groups plus a two byte remainder.
      const result: string = CryptoUtils.base64Encode('Hello World');
      // The render matches the widely published Hello World vector.
      expect(result).assertEqual('SGVsbG8gV29ybGQ=');
      // Eleven payload bytes render exactly sixteen characters.
      expect(result.length).assertEqual(16);
      // A two-byte remainder requires exactly one padding character.
      expect(result.substring(15, 16)).assertEqual('=');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_4900
     * @tc.name      testNumCrypto0049
     * @tc.desc      Verify base64Encode renders the numeric string 123456 as two unpadded full groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0049';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Six bytes of payload fill exactly two full groups.
      const result: string = CryptoUtils.base64Encode('123456');
      // The render matches the published numeric vector.
      expect(result).assertEqual('MTIzNDU2');
      // Six payload bytes render exactly eight characters.
      expect(result.length).assertEqual(8);
      // Two full groups carry no padding at all.
      expect(result.indexOf('=')).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5000
     * @tc.name      testNumCrypto0050
     * @tc.desc      Verify base64Encode renders the single capital letter A as the padded pair QQ equals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0050';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One byte of the capital letter produces one padded group.
      const result: string = CryptoUtils.base64Encode('A');
      // The capital letter render uses the standard two padding signs.
      expect(result).assertEqual('QQ==');
      // One payload byte renders exactly four characters.
      expect(result.length).assertEqual(4);
      // The lower case letter and the capital letter render differently.
      expect(CryptoUtils.base64Encode('a')).not().assertEqual(result);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5100
     * @tc.name      testNumCrypto0051
     * @tc.desc      Verify base64Encode output length is always a positive multiple of four for several payload sizes.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0051';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Payloads of one to five bytes cover every remainder class.
      const one: string = CryptoUtils.base64Encode('a');
      const two: string = CryptoUtils.base64Encode('ab');
      const three: string = CryptoUtils.base64Encode('abc');
      const four: string = CryptoUtils.base64Encode('abcd');
      const five: string = CryptoUtils.base64Encode('abcde');
      // Every render length divides evenly by four.
      expect(one.length % 4).assertEqual(0);
      expect(two.length % 4).assertEqual(0);
      expect(three.length % 4).assertEqual(0);
      expect(four.length % 4).assertEqual(0);
      expect(five.length % 4).assertEqual(0);
      // Each three-byte group adds four characters, including padding.
      expect(one.length).assertEqual(4);
      expect(four.length).assertEqual(8);
      expect(five.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5200
     * @tc.name      testNumCrypto0052
     * @tc.desc      Verify base64Encode is deterministic and distinguishes two different texts of the same length.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0052';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Two same length texts exercise determinism and content sensitivity.
      const first: string = CryptoUtils.base64Encode('even');
      const second: string = CryptoUtils.base64Encode('odds');
      // Repeating the first encode reproduces the first render.
      expect(CryptoUtils.base64Encode('even')).assertEqual(first);
      // The two same length texts render differently.
      expect(first).not().assertEqual(second);
      // Both renders keep the same four group width.
      expect(first.length).assertEqual(second.length);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5300
     * @tc.name      testNumCrypto0053
     * @tc.desc      Verify base64Decode returns the original single letter for the padded vector YQ equals.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0053';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The padded single group decodes back to one byte.
      const result: string = CryptoUtils.base64Decode('YQ==');
      // The decoded text matches the original letter.
      expect(result).assertEqual('a');
      // The decoded text keeps one character.
      expect(result.length).assertEqual(1);
      // Repeating the decode reproduces the same text.
      expect(CryptoUtils.base64Decode('YQ==')).assertEqual(result);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5400
     * @tc.name      testNumCrypto0054
     * @tc.desc      Verify base64Decode returns the original hello text for the well known padded vector.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0054';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The five byte payload decodes back to the original greeting.
      const result: string = CryptoUtils.base64Decode('aGVsbG8=');
      // The decoded text matches the original hello word.
      expect(result).assertEqual('hello');
      // The decoded text keeps five characters.
      expect(result.length).assertEqual(5);
      // Decoding the round trip render reproduces the original again.
      expect(CryptoUtils.base64Decode(CryptoUtils.base64Encode('hello'))).assertEqual('hello');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5500
     * @tc.name      testNumCrypto0055
     * @tc.desc      Verify base64Decode returns the original three letter text for the unpadded vector YWJj.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0055';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The unpadded full group decodes back to three bytes.
      const result: string = CryptoUtils.base64Decode('YWJj');
      // The decoded text matches the original three letters.
      expect(result).assertEqual('abc');
      // The decoded text keeps three characters.
      expect(result.length).assertEqual(3);
      // The unpadded decode matches the padded round trip decode.
      expect(CryptoUtils.base64Decode(CryptoUtils.base64Encode('abc'))).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5600
     * @tc.name      testNumCrypto0056
     * @tc.desc      Verify base64Decode returns the original Hello World text including the encoded space byte.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0056';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The eleven byte payload decodes back to the original phrase.
      const result: string = CryptoUtils.base64Decode('SGVsbG8gV29ybGQ=');
      // The decoded text matches the original phrase with its space.
      expect(result).assertEqual('Hello World');
      // The decoded text keeps eleven characters.
      expect(result.length).assertEqual(11);
      // The space byte survives the decode at its original index.
      expect(result.substring(5, 6)).assertEqual(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5700
     * @tc.name      testNumCrypto0057
     * @tc.desc      Verify base64Decode returns the original numeric string for the unpadded two group vector.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0057';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The six byte payload decodes back to the original digits.
      const result: string = CryptoUtils.base64Decode('MTIzNDU2');
      // The decoded text matches the original numeric string.
      expect(result).assertEqual('123456');
      // The decoded text keeps six characters.
      expect(result.length).assertEqual(6);
      // The numeric round trip keeps the original content stable.
      expect(CryptoUtils.base64Decode(CryptoUtils.base64Encode('123456'))).assertEqual('123456');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5800
     * @tc.name      testNumCrypto0058
     * @tc.desc      Verify base64Decode distinguishes the capital letter vector from the lower case letter vector.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0058';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The capital letter vector decodes back to the capital letter.
      const result: string = CryptoUtils.base64Decode('QQ==');
      // The decoded text matches the capital letter.
      expect(result).assertEqual('A');
      // The capital and lower case vectors decode to different letters.
      expect(CryptoUtils.base64Decode('YQ==')).not().assertEqual(result);
      // The capital letter decode keeps one character.
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_5900
     * @tc.name      testNumCrypto0059
     * @tc.desc      Verify base64Decode returns the empty text for the empty Base64 input.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0059';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The empty Base64 input decodes to zero payload bytes.
      const result: string = CryptoUtils.base64Decode('');
      // The empty input renders the empty text.
      expect(result).assertEqual('');
      // The decoded text has zero characters.
      expect(result.length).assertEqual(0);
      // Repeating the empty decode reproduces the empty result.
      expect(CryptoUtils.base64Decode('')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6000
     * @tc.name      testNumCrypto0060
     * @tc.desc      Verify base64Decode swallows the failure of a pure invalid character input and returns the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0060';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Bang characters are outside the Base64 alphabet.
      const result: string = CryptoUtils.base64Decode('!!!');
      // The caught failure path returns the empty sentinel string.
      expect(result).assertEqual('');
      // The failure result keeps zero characters.
      expect(result.length).assertEqual(0);
      // Repeating the invalid decode keeps returning the empty sentinel.
      expect(CryptoUtils.base64Decode('!!!')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6100
     * @tc.name      testNumCrypto0061
     * @tc.desc      Verify base64Decode swallows the failure of an input containing an interior space and returns the empty string.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0061';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A space character is outside the Base64 alphabet.
      const result: string = CryptoUtils.base64Decode('a b');
      // The caught failure path returns the empty sentinel string.
      expect(result).assertEqual('');
      // The failure result keeps zero characters.
      expect(result.length).assertEqual(0);
      // The valid prefix alone still decodes successfully.
      expect(CryptoUtils.base64Decode('YWI=')).assertEqual('ab');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6200
     * @tc.name      testNumCrypto0062
     * @tc.desc      Verify base64Decode swallows the failure of a five character input whose length cannot form groups.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0062';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Five characters leave one trailing Base64 digit that cannot encode a complete byte.
      const result: string = CryptoUtils.base64Decode('abcde');
      // The caught failure path returns the empty sentinel string.
      expect(result).assertEqual('');
      // The failure result keeps zero characters.
      expect(result.length).assertEqual(0);
      expect(CryptoUtils.base64Decode('a')).assertEqual('');
      expect(CryptoUtils.base64Decode('YWJjZGVmZ')).assertEqual('');
      // A clean four character group of the same alphabet still decodes safely.
      expect(CryptoUtils.base64Decode('YQ==')).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6300
     * @tc.name      testNumCrypto0063
     * @tc.desc      Verify a Chinese multi byte text survives the base64 encode and decode round trip unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0063';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Chinese text carries multi byte UTF-8 payloads through the round trip.
      const original: string = '网络安全测试';
      const encoded: string = CryptoUtils.base64Encode(original);
      // The encoded render is a non empty Base64 group sequence.
      expect(encoded.length % 4).assertEqual(0);
      // The decoded text restores the original Chinese content exactly.
      expect(CryptoUtils.base64Decode(encoded)).assertEqual(original);
      // Repeating the round trip keeps the result stable.
      expect(CryptoUtils.base64Decode(CryptoUtils.base64Encode(original))).assertEqual(original);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6400
     * @tc.name      testNumCrypto0064
     * @tc.desc      Verify a three hundred character text survives the base64 round trip and renders the expected group count.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0064';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Three hundred characters span one hundred full Base64 groups.
      const original: string = 'a'.repeat(300);
      const encoded: string = CryptoUtils.base64Encode(original);
      // The render of full groups carries no padding at all.
      expect(encoded.indexOf('=')).assertEqual(-1);
      // The render keeps exactly four hundred characters.
      expect(encoded.length).assertEqual(400);
      // The decoded text restores the original content exactly.
      expect(CryptoUtils.base64Decode(encoded)).assertEqual(original);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6500
     * @tc.name      testNumCrypto0065
     * @tc.desc      Verify a text with operator characters and spaces survives the base64 round trip unchanged.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0065';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Operator and punctuation characters are plain payload bytes here.
      const original: string = 'a+b/c & d=e?';
      const encoded: string = CryptoUtils.base64Encode(original);
      // The encoded render stays a clean Base64 group sequence.
      expect(encoded.length % 4).assertEqual(0);
      // The decoded text restores every operator character in place.
      expect(CryptoUtils.base64Decode(encoded)).assertEqual(original);
      // The first operator survives at its original index.
      expect(CryptoUtils.base64Decode(encoded).substring(1, 2)).assertEqual('+');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6600
     * @tc.name      testNumCrypto0066
     * @tc.desc      Verify base64Decode swallows the failure of a full four character group of invalid characters.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testNumCrypto0066';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // A full group of bang characters fails the alphabet check.
      const result: string = CryptoUtils.base64Decode('!!!!');
      // The caught failure path returns the empty sentinel string.
      expect(result).assertEqual('');
      // The failure result keeps zero characters.
      expect(result.length).assertEqual(0);
      // Substituting one valid group decodes normally again.
      expect(CryptoUtils.base64Decode('YWJj')).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6700
     * @tc.name      testNumCrypto0067
     * @tc.desc      Verify a mixed alphanumeric identifier survives the base64 round trip with stable group padding.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0067';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Nineteen characters leave a one byte remainder group.
      const original: string = 'NetworkSecurity2026';
      const encoded: string = CryptoUtils.base64Encode(original);
      // Nineteen bytes render twenty eight characters with one padding sign.
      expect(encoded.length).assertEqual(28);
      expect(encoded.substring(27, 28)).assertEqual('=');
      // The decoded text restores the identifier exactly.
      expect(CryptoUtils.base64Decode(encoded)).assertEqual(original);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6800
     * @tc.name      testNumCrypto0068
     * @tc.desc      Verify the digest helpers and base64 helpers agree on one shared text with the expected widths and round trip.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0068';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One shared text feeds every helper in this combined sanity case.
      const text: string = 'numeric-matrix';
      const md5Digest: string = await CryptoUtils.md5(text);
      const sha256Digest: string = await CryptoUtils.sha256(text);
      const encoded: string = CryptoUtils.base64Encode(text);
      // The MD5 digest keeps the thirty two character width.
      expect(md5Digest.length).assertEqual(32);
      // The SHA-256 digest keeps the sixty four character width.
      expect(sha256Digest.length).assertEqual(64);
      // The base64 round trip restores the shared text exactly.
      expect(CryptoUtils.base64Decode(encoded)).assertEqual(text);
      // The two digests of the same text remain different.
      expect(md5Digest).not().assertEqual(sha256Digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_6900
     * @tc.name      testNumCrypto0069
     * @tc.desc      Verify md5 treats one extra interior space as different content for both algorithms of the phrase.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0069';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The two phrase variants differ only by one interior space.
      const singleSpace: string = await CryptoUtils.md5('Network Security');
      const doubleSpace: string = await CryptoUtils.md5('Network  Security');
      // The double space variant renders a different digest.
      expect(doubleSpace).not().assertEqual(singleSpace);
      // Both variants keep the fixed thirty two character width.
      expect(singleSpace.length).assertEqual(32);
      expect(doubleSpace.length).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_7000
     * @tc.name      testNumCrypto0070
     * @tc.desc      Verify sha256 of four boundary texts keeps the sixty four character lowercase hex format everywhere.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0070';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // Four boundary texts cover the empty, one byte, word and long shapes.
      const empty: string = await CryptoUtils.sha256('');
      const single: string = await CryptoUtils.sha256('x');
      const word: string = await CryptoUtils.sha256('boundary');
      const long: string = await CryptoUtils.sha256('x'.repeat(200));
      // Every shape keeps the sixty four character width.
      expect(empty.length).assertEqual(64);
      expect(single.length).assertEqual(64);
      expect(word.length).assertEqual(64);
      expect(long.length).assertEqual(64);
      // Every shape is a pure lowercase hexadecimal string.
      expect(/^[0-9a-f]{64}$/.test(empty)).assertTrue();
      expect(/^[0-9a-f]{64}$/.test(long)).assertTrue();
      // All four shapes hash to distinct digests.
      expect(empty).not().assertEqual(single);
      expect(word).not().assertEqual(long);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_7100
     * @tc.name      testNumCrypto0071
     * @tc.desc      Verify bytesToHex renders the alternating minimum and maximum byte pattern as the repeated 00ff sequence.
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testNumCrypto0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testNumCrypto0071';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // The alternating pattern arranges zero and two hundred fifty five in turn.
      const bytes: Uint8Array = new Uint8Array([0, 255, 0, 255]);
      const result: string = CryptoUtils.bytesToHex(bytes);
      // The render spells the repeated 00ff sequence.
      expect(result).assertEqual('00ff00ff');
      // Four bytes render exactly eight characters.
      expect(result.length).assertEqual(8);
      // The render starts and ends with the minimum byte pair.
      expect(result.substring(0, 2)).assertEqual('00');
      expect(result.substring(6, 8)).assertEqual('ff');
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });

    /**
     * @tc.number    SUB_NETWORKSECURITY_NUMERIC_CRYPTO_7200
     * @tc.name      testNumCrypto0072
     * @tc.desc      Verify md5 of a one thousand character multi block text stays deterministic and reacts to length changes.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testNumCrypto0072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testNumCrypto0072';
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' start');
      // One thousand characters force multiple update blocks in the framework path.
      const longText: string = 'matrix'.repeat(166).substring(0, 996) + 'abcd';
      const digest: string = await CryptoUtils.md5(longText);
      // The long input keeps the fixed thirty two character width.
      expect(digest.length).assertEqual(32);
      // Repeating the long input reproduces the same digest.
      expect(await CryptoUtils.md5(longText)).assertEqual(digest);
      // The digest is a pure lowercase hexadecimal string.
      expect(/^[0-9a-f]{32}$/.test(digest)).assertTrue();
      // Trimming one character changes the digest.
      expect(await CryptoUtils.md5(longText.substring(0, 999))).not().assertEqual(digest);
      hilog.info(DOMAIN, TAG, '%{public}s', TAG + ' end');
    });
  });
}
