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
import { SecurityUtils, DigestAlgorithm, FileUtils } from 'common';

/**
 * SecurityUtils / FileUtils 补充逻辑套件（第二轮追加）。
 * 覆盖范围：
 *   1. Base64 同步编解码：base64Encode / base64EncodeBytes / base64Decode /
 *      base64DecodeToBytes 的往返一致性、字符集约束、字节长度约束。
 *   2. 摘要异步接口：digestHex / sha256Hex / sha1Hex / md5Hex 的已知常量、
 *      长度、大小写、确定性与敏感度。
 *   3. FileUtils.joinPath 纯路径拼接：分段数、空段剔除、分隔符计数。
 * 明确不覆盖：exists / readText / writeText / ensureDir / deleteFile /
 *   getFileSize / listFiles / copyFile，这些方法会触碰应用沙箱文件系统，
 *   在单元测试环境下依赖真实 context，不属于本次纯函数/纯算法覆盖范围。
 * 与 CommonUtilsLogic.test.ets 中的少量 Base64 / digest / joinPath 用例
 * 在输入取值、断言角度与措辞上均不重复。
 */

/** Hilog domain reserved for the security and path logic tests. */
const DOMAIN: number = 0xF826;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_SecurityFile_';

/** UTF-8 encoding name used by TextEncoder / TextDecoder helpers. */
const TEXT_ENCODING_UTF8: string = 'utf-8';
/** Bytes occupied by one UTF-8 encoded Chinese (CJK) character. */
const CJK_BYTES: number = 3;
/** Bytes occupied by one ASCII character. */
const ASCII_BYTES: number = 1;
/** Expected hex length of a SHA-256 digest. */
const SHA256_HEX_LEN: number = 64;
/** Expected hex length of a SHA-1 digest. */
const SHA1_HEX_LEN: number = 40;
/** Expected hex length of an MD5 digest. */
const MD5_HEX_LEN: number = 32;
/** Character carried by every Base64 output; used by the alphabet regex. */
const BASE64_ALPHABET_REGEX: RegExp = /^[A-Za-z0-9+/=]*$/;
/** Lower-case hexadecimal text produced by the digest helpers. */
const LOWER_HEX_REGEX: RegExp = /^[0-9a-f]+$/;
/** Path separator used by FileUtils.joinPath. */
const PATH_SEPARATOR: string = '/';
/** Number of repeated segments used by the long joinPath case. */
const LONG_SEGMENT_COUNT: number = 64;
/** Length of the synthetic long text used by the 256 byte round trip. */
const LONG_TEXT_LEN: number = 256;

/** Known SHA-256 digest of the three byte text 'abc'. */
const KNOWN_SHA256_ABC: string = 'ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad';
const SHA1_STANDARD_INPUT: string = 'abcdbcdecdefdefgefghfghighijhijkijkljklmklmnlmnomnopnopq';
const KNOWN_SHA1_STANDARD: string = '84983e441c3bd26ebaae4aa1f95129e5e54670f1';
/** Known MD5 digest of the three byte text 'abc'. */
const KNOWN_MD5_ABC: string = '900150983cd24fb0d6963f7d28e17f72';

/** Sample ASCII sentence used by the encrypt/decrypt round trips. */
const ASCII_SAMPLE: string = 'Meeting room 3F-B booked by Alice at 09:30.';
/** Sample CJK sentence used by the UTF-8 round trips. */
const CJK_SAMPLE: string = '会议室三号已被预约';
/** CJK characters used by the byte-length assertions. */
const CJK_WORD: string = '会议';
/** CJK word whose Base64 form is checked directly. */
const CJK_WORD_B64: string = '5Lya6K6u';

/** Result carrier for a byte-length probe. */
interface LengthProbe {
  /** Byte count reported by TextEncoder for the probe text. */
  bytes: number;
  /** Character count of the probe text. */
  chars: number;
}

/** Result carrier for a joinPath segmentation probe. */
interface PathProbe {
  /** Path produced by FileUtils.joinPath. */
  path: string;
  /** Number of non-empty input segments. */
  nonEmpty: number;
  /** Number of separator characters inside the produced path. */
  separators: number;
}

/** Encodes the given text as UTF-8 bytes through the public ArkTS encoder. */
function toUtf8Bytes(text: string): Uint8Array {
  const encoder: util.TextEncoder = new util.TextEncoder();
  return encoder.encodeInto(text);
}

/** Counts the occurrences of one character inside the given text. */
function countChar(text: string, target: string): number {
  let count: number = 0;
  for (let i = 0; i < text.length; i++) {
    if (text.charAt(i) === target) {
      count++;
    }
  }
  return count;
}

/** Counts the segments that are not empty inside the given segment list. */
function countNonEmpty(segments: string[]): number {
  let count: number = 0;
  for (let i = 0; i < segments.length; i++) {
    if (segments[i].length > 0) {
      count++;
    }
  }
  return count;
}

/** Joins the segments and reports the path plus its segmentation facts. */
function probeJoin(segments: string[]): PathProbe {
  const result: string = FileUtils.joinPath(segments);
  return {
    path: result,
    nonEmpty: countNonEmpty(segments),
    separators: countChar(result, PATH_SEPARATOR)
  };
}

/** Builds a deterministic ASCII text of the requested length. */
function buildAsciiText(length: number): string {
  const alphabet: string = 'abcdefghijklmnopqrstuvwxyz0123456789';
  let text: string = '';
  for (let i = 0; i < length; i++) {
    text += alphabet.charAt(i % alphabet.length);
  }
  return text;
}

/** Builds a segment list of the given length, each segment tagged by index. */
function buildSegments(count: number, prefix: string): string[] {
  const segments: string[] = [];
  for (let i = 0; i < count; i++) {
    segments.push(`${prefix}${i}`);
  }
  return segments;
}

/** Reports whether every byte of the given buffer is zero. */
function isAllZero(bytes: Uint8Array): boolean {
  for (let i = 0; i < bytes.length; i++) {
    if (bytes[i] !== 0) {
      return false;
    }
  }
  return bytes.length > 0;
}

/** Counts the CJK unified ideographs inside the given text. */
function countCjk(text: string): number {
  let count: number = 0;
  for (let i = 0; i < text.length; i++) {
    const code: number = text.charCodeAt(i);
    if (code >= 0x4E00 && code <= 0x9FFF) {
      count++;
    }
  }
  return count;
}

/** Local helper alias kept private to this suite. */
function joinSegments(segments: string[]): string {
  return FileUtils.joinPath(segments);
}

export default function securityFileLogicTest() {
  describe('SecurityFileLogicTest', () => {

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0100
     * @tc.name      testSecurityFile0001
     * @tc.desc      Verify Base64 encode/decode round trips a plain ASCII sentence
     *               without changing any character and keeps the alphabet.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const encoded: string = SecurityUtils.base64Encode(ASCII_SAMPLE);
      expect(encoded.length > 0).assertTrue();
      expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
      expect(encoded.indexOf(' ')).assertEqual(-1);
      const decoded: string = SecurityUtils.base64Decode(encoded);
      expect(decoded).assertEqual(ASCII_SAMPLE);
      expect(decoded.length).assertEqual(ASCII_SAMPLE.length);
      expect(SecurityUtils.base64Encode(decoded)).assertEqual(encoded);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0101
     * @tc.name      testSecurityFile0002
     * @tc.desc      Verify the CJK sentence survives a Base64 round trip and that the
     *               decoded byte length equals three bytes per CJK character.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const encoded: string = SecurityUtils.base64Encode(CJK_SAMPLE);
      expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
      expect(SecurityUtils.base64Decode(encoded)).assertEqual(CJK_SAMPLE);
      const bytes: Uint8Array = SecurityUtils.base64DecodeToBytes(encoded);
      expect(bytes.length).assertEqual(CJK_SAMPLE.length * CJK_BYTES);
      expect(bytes.length).assertEqual(toUtf8Bytes(CJK_SAMPLE).length);
      const probe: LengthProbe = { bytes: bytes.length, chars: CJK_SAMPLE.length };
      expect(probe.bytes / probe.chars).assertEqual(CJK_BYTES);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0102
     * @tc.name      testSecurityFile0003
     * @tc.desc      Verify the empty string encodes to an empty string and the empty
     *               Base64 input decodes to the empty string on both decode paths.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SecurityUtils.base64Encode('')).assertEqual('');
      expect(SecurityUtils.base64Encode('').length).assertEqual(0);
      expect(SecurityUtils.base64Decode('')).assertEqual('');
      expect(SecurityUtils.base64Decode('').length).assertEqual(0);
      expect(SecurityUtils.base64DecodeToBytes('').length).assertEqual(0);
      expect(SecurityUtils.base64EncodeBytes(toUtf8Bytes(''))).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0103
     * @tc.name      testSecurityFile0004
     * @tc.desc      Verify single character inputs round trip on every Base64 path and
     *               that the encoded text keeps a four character block structure.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const singleAscii: string = 'x';
      const singleAsciiB64: string = SecurityUtils.base64Encode(singleAscii);
      expect(singleAsciiB64.length).assertEqual(4);
      expect(singleAsciiB64).assertEqual('eA==');
      expect(SecurityUtils.base64Decode(singleAsciiB64)).assertEqual(singleAscii);
      expect(SecurityUtils.base64DecodeToBytes(singleAsciiB64).length).assertEqual(ASCII_BYTES);
      const singleCjk: string = '会';
      const singleCjkB64: string = SecurityUtils.base64Encode(singleCjk);
      expect(SecurityUtils.base64Decode(singleCjkB64)).assertEqual(singleCjk);
      expect(SecurityUtils.base64DecodeToBytes(singleCjkB64).length).assertEqual(CJK_BYTES);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0104
     * @tc.name      testSecurityFile0005
     * @tc.desc      Verify a 256 byte ASCII text round trips exactly and that its Base64
     *               output is longer than the source while staying alphabet clean.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const longText: string = buildAsciiText(LONG_TEXT_LEN);
      expect(longText.length).assertEqual(LONG_TEXT_LEN);
      expect(toUtf8Bytes(longText).length).assertEqual(LONG_TEXT_LEN);
      const encoded: string = SecurityUtils.base64Encode(longText);
      expect(encoded.length > longText.length).assertTrue();
      expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
      expect(encoded.length % 4).assertEqual(0);
      const decoded: string = SecurityUtils.base64Decode(encoded);
      expect(decoded).assertEqual(longText);
      expect(decoded.length).assertEqual(LONG_TEXT_LEN);
      expect(SecurityUtils.base64DecodeToBytes(encoded).length).assertEqual(LONG_TEXT_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0105
     * @tc.name      testSecurityFile0006
     * @tc.desc      Verify base64EncodeBytes and base64Encode produce identical text for
     *               the same input across ASCII, CJK and mixed content.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const samples: string[] = [ASCII_SAMPLE, CJK_SAMPLE, CJK_WORD, 'A1', 'Mixed 混排 text 42'];
      for (let i = 0; i < samples.length; i++) {
        const sample: string = samples[i];
        const viaText: string = SecurityUtils.base64Encode(sample);
        const viaBytes: string = SecurityUtils.base64EncodeBytes(toUtf8Bytes(sample));
        expect(viaText).assertEqual(viaBytes);
      }
      expect(SecurityUtils.base64EncodeBytes(toUtf8Bytes(CJK_WORD))).assertEqual(CJK_WORD_B64);
      expect(SecurityUtils.base64Encode(CJK_WORD)).assertEqual(CJK_WORD_B64);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0106
     * @tc.name      testSecurityFile0007
     * @tc.desc      Verify every encoded form of a mixed content matrix only contains the
     *               standard Base64 alphabet and never contains whitespace.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const samples: string[] = ['a', 'ab', 'abc', 'abcd', 'abcde', '0', '~!@#$%^&*()',
        'Tab\tInside', 'Line\nBreak', CJK_WORD, `${CJK_WORD}abc`];
      for (let i = 0; i < samples.length; i++) {
        const encoded: string = SecurityUtils.base64Encode(samples[i]);
        expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
        expect(encoded.indexOf(' ')).assertEqual(-1);
        expect(encoded.indexOf('\n')).assertEqual(-1);
        expect(encoded.indexOf('\t')).assertEqual(-1);
      }
      expect(BASE64_ALPHABET_REGEX.test('aGVsbG8=')).assertTrue();
      expect(BASE64_ALPHABET_REGEX.test('aGVsbG8-')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0107
     * @tc.name      testSecurityFile0008
     * @tc.desc      Verify the decoded byte length equals the UTF-8 byte length of the
     *               source for ASCII, two CJK characters and mixed content.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(CJK_WORD.length).assertEqual(2);
      expect(toUtf8Bytes(CJK_WORD).length).assertEqual(CJK_BYTES * 2);
      const matrix: string[] = [ASCII_SAMPLE, CJK_WORD, 'ab会', CJK_SAMPLE];
      for (let i = 0; i < matrix.length; i++) {
        const text: string = matrix[i];
        const encoded: string = SecurityUtils.base64Encode(text);
        const decodedBytes: Uint8Array = SecurityUtils.base64DecodeToBytes(encoded);
        expect(decodedBytes.length).assertEqual(toUtf8Bytes(text).length);
      }
      expect(SecurityUtils.base64DecodeToBytes('aWQ=').length).assertEqual(2);
      expect(SecurityUtils.base64Decode(SecurityUtils.base64Encode('id'))).assertEqual('id');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0108
     * @tc.name      testSecurityFile0009
     * @tc.desc      Verify malformed Base64 text degrades to an empty string or empty byte
     *               array instead of throwing on the two decode entry points.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const badInputs: string[] = ['!!!!', '@@@@', '#bad#', 'aGVsbG8'];
      for (let i = 0; i < badInputs.length; i++) {
        const bad: string = badInputs[i];
        const decoded: string = SecurityUtils.base64Decode(bad);
        expect(decoded.length >= 0).assertTrue();
      }
      expect(SecurityUtils.base64Decode('!!!!')).assertEqual('');
      const rawBytes: Uint8Array = SecurityUtils.base64DecodeToBytes('!!!!');
      expect(rawBytes.length).assertEqual(0);
      expect(SecurityUtils.base64Decode(SecurityUtils.base64Encode('ok'))).assertEqual('ok');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0109
     * @tc.name      testSecurityFile0010
     * @tc.desc      Verify Base64 encoding is stable across repeated calls and that a
     *               change of one character always changes the encoded text.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: string = SecurityUtils.base64Encode(ASCII_SAMPLE);
      const second: string = SecurityUtils.base64Encode(ASCII_SAMPLE);
      expect(first).assertEqual(second);
      expect(SecurityUtils.base64Encode('room-a')).assertEqual(SecurityUtils.base64Encode('room-a'));
      expect(SecurityUtils.base64Encode('room-a') === SecurityUtils.base64Encode('room-b')).assertFalse();
      expect(SecurityUtils.base64Encode('abc').length).assertEqual(4);
      expect(SecurityUtils.base64Encode('abcd').length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0110
     * @tc.name      testSecurityFile0011
     * @tc.desc      Verify pad characters appear only when the source byte length is not a
     *               multiple of three, following standard Base64 block rules.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const oneByte: string = SecurityUtils.base64Encode('a');
      const twoBytes: string = SecurityUtils.base64Encode('ab');
      const threeBytes: string = SecurityUtils.base64Encode('abc');
      expect(countChar(oneByte, '=')).assertEqual(2);
      expect(countChar(twoBytes, '=')).assertEqual(1);
      expect(countChar(threeBytes, '=')).assertEqual(0);
      expect(oneByte.length).assertEqual(4);
      expect(twoBytes.length).assertEqual(4);
      expect(threeBytes.length).assertEqual(4);
      expect(SecurityUtils.base64Decode(oneByte)).assertEqual('a');
      expect(SecurityUtils.base64Decode(twoBytes)).assertEqual('ab');
      expect(SecurityUtils.base64Decode(threeBytes)).assertEqual('abc');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0111
     * @tc.name      testSecurityFile0012
     * @tc.desc      Verify the known SHA-256 digest of 'abc' matches the published
     *               constant and carries the expected lower-case hex length.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSecurityFile0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const digest: string = await SecurityUtils.sha256Hex('abc');
      expect(digest).assertEqual(KNOWN_SHA256_ABC);
      expect(digest.length).assertEqual(SHA256_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(digest)).assertTrue();
      const viaCore: string = await SecurityUtils.digestHex('abc', DigestAlgorithm.SHA256);
      expect(viaCore).assertEqual(KNOWN_SHA256_ABC);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0112
     * @tc.name      testSecurityFile0013
     * @tc.desc      Verify the SHA-1 digest of the 56-byte standard input matches the known constant
     *               and carries the expected lower-case hex length.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSecurityFile0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const digest: string = await SecurityUtils.sha1Hex(SHA1_STANDARD_INPUT);
      expect(digest).assertEqual(KNOWN_SHA1_STANDARD);
      expect(digest.length).assertEqual(SHA1_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(digest)).assertTrue();
      const viaCore: string = await SecurityUtils.digestHex(SHA1_STANDARD_INPUT, DigestAlgorithm.SHA1);
      expect(viaCore).assertEqual(KNOWN_SHA1_STANDARD);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0113
     * @tc.name      testSecurityFile0014
     * @tc.desc      Verify the known MD5 digest of 'abc' matches the published constant and
     *               carries the expected lower-case hex length.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSecurityFile0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const digest: string = await SecurityUtils.md5Hex('abc');
      expect(digest).assertEqual(KNOWN_MD5_ABC);
      expect(digest.length).assertEqual(MD5_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(digest)).assertTrue();
      const viaCore: string = await SecurityUtils.digestHex('abc', DigestAlgorithm.MD5);
      expect(viaCore).assertEqual(KNOWN_MD5_ABC);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0114
     * @tc.name      testSecurityFile0015
     * @tc.desc      Verify an empty input yields an empty digest for all three algorithms
     *               on both the wrappers and the generic digest entry point.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSecurityFile0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const emptySha256: string = await SecurityUtils.sha256Hex('');
      const emptySha1: string = await SecurityUtils.sha1Hex('');
      const emptyMd5: string = await SecurityUtils.md5Hex('');
      const emptyCoreSha256: string = await SecurityUtils.digestHex('', DigestAlgorithm.SHA256);
      const emptyCoreSha1: string = await SecurityUtils.digestHex('', DigestAlgorithm.SHA1);
      const emptyCoreMd5: string = await SecurityUtils.digestHex('', DigestAlgorithm.MD5);
      expect(emptySha256).assertEqual('');
      expect(emptySha1).assertEqual('');
      expect(emptyMd5).assertEqual('');
      expect(emptyCoreSha256).assertEqual('');
      expect(emptyCoreSha1).assertEqual('');
      expect(emptyCoreMd5).assertEqual('');
      expect(emptySha256.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0115
     * @tc.name      testSecurityFile0016
     * @tc.desc      Verify two calls with the same input produce identical digests for
     *               every algorithm, so the helpers are deterministic.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const sample: string = 'meeting-scene-room-305';
      const sha256First: string = await SecurityUtils.sha256Hex(sample);
      const sha256Second: string = await SecurityUtils.sha256Hex(sample);
      expect(sha256First).assertEqual(sha256Second);
      const sha1First: string = await SecurityUtils.sha1Hex(sample);
      const sha1Second: string = await SecurityUtils.sha1Hex(sample);
      expect(sha1First).assertEqual(sha1Second);
      const md5First: string = await SecurityUtils.md5Hex(sample);
      const md5Second: string = await SecurityUtils.md5Hex(sample);
      expect(md5First).assertEqual(md5Second);
      expect(sha256First.length).assertEqual(SHA256_HEX_LEN);
      expect(sha1First.length).assertEqual(SHA1_HEX_LEN);
      expect(md5First.length).assertEqual(MD5_HEX_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0116
     * @tc.name      testSecurityFile0017
     * @tc.desc      Verify digests of a multi byte CJK input are lower-case hex text of the
     *               documented length for all three algorithms.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const sha256: string = await SecurityUtils.sha256Hex(CJK_SAMPLE);
      const sha1: string = await SecurityUtils.sha1Hex(CJK_SAMPLE);
      const md5: string = await SecurityUtils.md5Hex(CJK_SAMPLE);
      expect(sha256.length).assertEqual(SHA256_HEX_LEN);
      expect(sha1.length).assertEqual(SHA1_HEX_LEN);
      expect(md5.length).assertEqual(MD5_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(sha256)).assertTrue();
      expect(LOWER_HEX_REGEX.test(sha1)).assertTrue();
      expect(LOWER_HEX_REGEX.test(md5)).assertTrue();
      expect(sha256.toUpperCase() === sha256).assertFalse();
      expect(md5.toUpperCase() === md5).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0117
     * @tc.name      testSecurityFile0018
     * @tc.desc      Verify different inputs always produce different digests, and that the
     *               comparison is case sensitive for all three algorithms.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const abcLowerSha256: string = await SecurityUtils.sha256Hex('abc');
      const abdLowerSha256: string = await SecurityUtils.sha256Hex('abd');
      const abcLowerSha1: string = await SecurityUtils.sha1Hex('abc');
      const abdLowerSha1: string = await SecurityUtils.sha1Hex('abd');
      const abcLowerMd5: string = await SecurityUtils.md5Hex('abc');
      const abdLowerMd5: string = await SecurityUtils.md5Hex('abd');
      const abcUpperSha256: string = await SecurityUtils.sha256Hex('ABC');
      const abcUpperSha1: string = await SecurityUtils.sha1Hex('ABC');
      const abcUpperMd5: string = await SecurityUtils.md5Hex('ABC');
      // Different payloads must never collide, for every algorithm.
      expect(abcLowerSha256 === abdLowerSha256).assertFalse();
      expect(abcLowerSha1 === abdLowerSha1).assertFalse();
      expect(abcLowerMd5 === abdLowerMd5).assertFalse();
      // Digest input is treated as raw text, so the case difference must be visible.
      expect(abcLowerSha256 === abcUpperSha256).assertFalse();
      expect(abcLowerSha1 === abcUpperSha1).assertFalse();
      expect(abcLowerMd5 === abcUpperMd5).assertFalse();
      expect(abcLowerSha256).assertEqual(KNOWN_SHA256_ABC);
      expect(abcUpperSha256 === KNOWN_SHA256_ABC).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0118
     * @tc.name      testSecurityFile0019
     * @tc.desc      Verify the three algorithms produce three distinct digests for the same
     *               input, so the algorithm selection is honoured.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const sha256: string = await SecurityUtils.sha256Hex('abc');
      const sha1: string = await SecurityUtils.sha1Hex('abc');
      const md5: string = await SecurityUtils.md5Hex('abc');
      expect(sha256 === sha1).assertFalse();
      expect(sha256 === md5).assertFalse();
      expect(sha1 === md5).assertFalse();
      expect(sha256.startsWith(KNOWN_SHA256_ABC.substring(0, 8))).assertTrue();
      expect(sha1.startsWith('a9993e36')).assertTrue();
      expect(md5.startsWith(KNOWN_MD5_ABC.substring(0, 8))).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0119
     * @tc.name      testSecurityFile0020
     * @tc.desc      Verify single character and long text inputs still yield correctly
     *               sized lower-case digests on every algorithm.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const longText: string = buildAsciiText(LONG_TEXT_LEN);
      const singleSha256: string = await SecurityUtils.sha256Hex('a');
      expect(singleSha256.length).assertEqual(SHA256_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(singleSha256)).assertTrue();
      const longSha256: string = await SecurityUtils.sha256Hex(longText);
      expect(longSha256.length).assertEqual(SHA256_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(longSha256)).assertTrue();
      const longSha1: string = await SecurityUtils.sha1Hex(longText);
      expect(longSha1.length).assertEqual(SHA1_HEX_LEN);
      const longMd5: string = await SecurityUtils.md5Hex(longText);
      expect(longMd5.length).assertEqual(MD5_HEX_LEN);
      expect(singleSha256 === longSha256).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0120
     * @tc.name      testSecurityFile0021
     * @tc.desc      Verify the generic digestHex entry point agrees with the three
     *               convenience wrappers for the same input and algorithm.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const TAG: string = 'testSecurityFile0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const sample: string = 'IrSendQueue heartbeat';
      const coreSha256: string = await SecurityUtils.digestHex(sample, DigestAlgorithm.SHA256);
      const coreSha1: string = await SecurityUtils.digestHex(sample, DigestAlgorithm.SHA1);
      const coreMd5: string = await SecurityUtils.digestHex(sample, DigestAlgorithm.MD5);
      const wrapSha256: string = await SecurityUtils.sha256Hex(sample);
      const wrapSha1: string = await SecurityUtils.sha1Hex(sample);
      const wrapMd5: string = await SecurityUtils.md5Hex(sample);
      expect(coreSha256).assertEqual(wrapSha256);
      expect(coreSha1).assertEqual(wrapSha1);
      expect(coreMd5).assertEqual(wrapMd5);
      const knownSha256: string = await SecurityUtils.digestHex('abc', DigestAlgorithm.SHA256);
      expect(knownSha256).assertEqual(KNOWN_SHA256_ABC);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0121
     * @tc.name      testSecurityFile0022
     * @tc.desc      Verify a digest changes whenever a single whitespace character is
     *               appended, so trailing characters are really digested.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const base: string = await SecurityUtils.sha256Hex('room');
      const withSpace: string = await SecurityUtils.sha256Hex('room ');
      const withNewline: string = await SecurityUtils.sha256Hex('room\n');
      expect(base === withSpace).assertFalse();
      expect(base === withNewline).assertFalse();
      expect(withSpace === withNewline).assertFalse();
      expect(base.length).assertEqual(SHA256_HEX_LEN);
      expect(withSpace.length).assertEqual(SHA256_HEX_LEN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0122
     * @tc.name      testSecurityFile0023
     * @tc.desc      Verify joinPath returns the single segment unchanged when only one
     *               non-empty segment is supplied.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const probe: PathProbe = probeJoin(['meeting']);
      expect(probe.path).assertEqual('meeting');
      expect(probe.separators).assertEqual(0);
      expect(probe.separators).assertEqual(probe.nonEmpty - 1);
      expect(FileUtils.joinPath(['note.txt'])).assertEqual('note.txt');
      expect(countChar(FileUtils.joinPath(['note.txt']), PATH_SEPARATOR)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0123
     * @tc.name      testSecurityFile0024
     * @tc.desc      Verify joinPath joins two and three non-empty segments with exactly one
     *               and two separators respectively.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const two: PathProbe = probeJoin(['base', 'files']);
      expect(two.path).assertEqual('base/files');
      expect(two.separators).assertEqual(1);
      expect(two.separators).assertEqual(two.nonEmpty - 1);
      const three: PathProbe = probeJoin(['base', 'files', 'room.log']);
      expect(three.path).assertEqual('base/files/room.log');
      expect(three.separators).assertEqual(2);
      expect(three.separators).assertEqual(three.nonEmpty - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0124
     * @tc.name      testSecurityFile0025
     * @tc.desc      Verify empty segments are dropped so the separator count still equals
     *               the number of non-empty segments minus one.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const cases: string[][] = [
        ['a', '', 'b'],
        ['', 'a', 'b'],
        ['a', 'b', ''],
        ['', 'a', '', 'b', ''],
        ['', '', 'a', '', '', 'b', '', '']
      ];
      for (let i = 0; i < cases.length; i++) {
        const probe: PathProbe = probeJoin(cases[i]);
        expect(probe.path).assertEqual('a/b');
        expect(probe.separators).assertEqual(1);
        expect(probe.separators).assertEqual(probe.nonEmpty - 1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0125
     * @tc.name      testSecurityFile0026
     * @tc.desc      Verify an all-empty segment list produces the empty string with zero
     *               separators and no trailing separator artefact.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testSecurityFile0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testSecurityFile0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(FileUtils.joinPath([])).assertEqual('');
      expect(FileUtils.joinPath([''])).assertEqual('');
      expect(FileUtils.joinPath(['', '', ''])).assertEqual('');
      expect(FileUtils.joinPath(['', '', '', '', ''])).assertEqual('');
      const probe: PathProbe = probeJoin(['', '', '']);
      expect(probe.nonEmpty).assertEqual(0);
      expect(probe.path).assertEqual('');
      expect(probe.separators).assertEqual(0);
      expect(probe.path.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0126
     * @tc.name      testSecurityFile0027
     * @tc.desc      Verify a segment carrying a trailing separator is kept verbatim, which
     *               documents that joinPath never normalises separators.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(FileUtils.joinPath(['logs/', 'app.txt'])).assertEqual('logs//app.txt');
      expect(FileUtils.joinPath(['logs', 'app.txt'])).assertEqual('logs/app.txt');
      const probe: PathProbe = probeJoin(['logs/', 'app.txt']);
      expect(probe.separators).assertEqual(2);
      expect(probe.nonEmpty).assertEqual(2);
      expect(probe.separators).assertEqual(probe.nonEmpty);
      expect(countChar(FileUtils.joinPath(['a', 'b']), PATH_SEPARATOR)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0127
     * @tc.name      testSecurityFile0028
     * @tc.desc      Verify an absolute path prefix segment is preserved and produces the
     *               expected leading separator without collapsing it.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(FileUtils.joinPath(['/a'])).assertEqual('/a');
      expect(FileUtils.joinPath(['/a', 'b'])).assertEqual('/a/b');
      expect(FileUtils.joinPath(['/a', 'b', 'c'])).assertEqual('/a/b/c');
      expect(FileUtils.joinPath(['/a', 'b']).startsWith(PATH_SEPARATOR)).assertTrue();
      expect(FileUtils.joinPath(['a', 'b']).startsWith(PATH_SEPARATOR)).assertFalse();
      expect(countChar(FileUtils.joinPath(['/a', 'b', 'c']), PATH_SEPARATOR)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0128
     * @tc.name      testSecurityFile0029
     * @tc.desc      Verify a 64 segment list is joined with exactly 63 separators and keeps
     *               the declared order of every segment.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const segments: string[] = [];
      for (let i = 0; i < LONG_SEGMENT_COUNT; i++) {
        segments.push(`s${i}`);
      }
      expect(segments.length).assertEqual(LONG_SEGMENT_COUNT);
      const joined: string = FileUtils.joinPath(segments);
      expect(countChar(joined, PATH_SEPARATOR)).assertEqual(LONG_SEGMENT_COUNT - 1);
      expect(joined.startsWith('s0/')).assertTrue();
      expect(joined.endsWith(`/s${LONG_SEGMENT_COUNT - 1}`)).assertTrue();
      expect(joined.indexOf('s1/s2')).assertLarger(0);
      const probe: PathProbe = probeJoin(segments);
      expect(probe.nonEmpty).assertEqual(LONG_SEGMENT_COUNT);
      expect(probe.separators).assertEqual(probe.nonEmpty - 1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0129
     * @tc.name      testSecurityFile0030
     * @tc.desc      Verify the separator count invariant holds for segment lists of
     *               varying size built inside a loop, including lists with gaps.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      for (let size = 1; size <= 8; size++) {
        const segments: string[] = [];
        for (let i = 0; i < size; i++) {
          segments.push(`seg${i}`);
        }
        const probe: PathProbe = probeJoin(segments);
        expect(probe.nonEmpty).assertEqual(size);
        expect(probe.separators).assertEqual(size - 1);
        expect(probe.separators).assertEqual(probe.nonEmpty - 1);
      }
      const withGaps: string[] = buildSegments(6, 'p');
      withGaps.unshift('');
      withGaps.push('');
      const gapProbe: PathProbe = probeJoin(withGaps);
      expect(gapProbe.nonEmpty).assertEqual(6);
      expect(gapProbe.separators).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0130
     * @tc.name      testSecurityFile0031
     * @tc.desc      Verify Base64 text round trips a single printable ASCII character and
     *               that the decoded byte count matches one ASCII byte.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const single: string = 'Z';
      const encoded: string = SecurityUtils.base64Encode(single);
      expect(SecurityUtils.base64Decode(encoded)).assertEqual(single);
      expect(encoded.length).assertEqual(4);
      expect(encoded.endsWith('==')).assertTrue();
      expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
      const bytes: Uint8Array = SecurityUtils.base64DecodeToBytes(encoded);
      expect(bytes.length).assertEqual(ASCII_BYTES);
      expect(bytes[0]).assertEqual(90);
      expect(SecurityUtils.base64EncodeBytes(toUtf8Bytes(single))).assertEqual(encoded);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0131
     * @tc.name      testSecurityFile0032
     * @tc.desc      Verify Base64 handles a single CJK character and that the decoded byte
     *               count equals three bytes for that one UTF-8 character.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const singleCjk: string = '会';
      expect(singleCjk.length).assertEqual(1);
      const encoded: string = SecurityUtils.base64Encode(singleCjk);
      expect(SecurityUtils.base64Decode(encoded)).assertEqual(singleCjk);
      expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
      const bytes: Uint8Array = SecurityUtils.base64DecodeToBytes(encoded);
      expect(bytes.length).assertEqual(CJK_BYTES);
      expect(bytes.length).assertEqual(toUtf8Bytes(singleCjk).length);
      expect(encoded.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0132
     * @tc.name      testSecurityFile0033
     * @tc.desc      Verify encode and decode are inverse maps over a mixed ASCII and CJK
     *               text, so the decoded byte count equals the UTF-8 byte count.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const mixed: string = 'Room-3F 会议室 A 座 09:30';
      const encoded: string = SecurityUtils.base64Encode(mixed);
      expect(SecurityUtils.base64Decode(encoded)).assertEqual(mixed);
      expect(SecurityUtils.base64Encode(SecurityUtils.base64Decode(encoded))).assertEqual(encoded);
      const decodedBytes: Uint8Array = SecurityUtils.base64DecodeToBytes(encoded);
      expect(decodedBytes.length).assertEqual(toUtf8Bytes(mixed).length);
      const cjkCount: number = countCjk(mixed);
      // The payload carries four CJK characters: 会议室 and 座.
      expect(cjkCount).assertEqual(4);
      expect(decodedBytes.length).assertEqual(mixed.length + cjkCount * (CJK_BYTES - 1));
      expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0133
     * @tc.name      testSecurityFile0034
     * @tc.desc      Verify encoded Base64 output length always follows the four character
     *               block rule for payloads of one to five ASCII bytes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SecurityUtils.base64Encode('a').length).assertEqual(4);
      expect(SecurityUtils.base64Encode('ab').length).assertEqual(4);
      expect(SecurityUtils.base64Encode('abc').length).assertEqual(4);
      expect(SecurityUtils.base64Encode('abcd').length).assertEqual(8);
      expect(SecurityUtils.base64Encode('abcde').length).assertEqual(8);
      for (let size = 1; size <= 5; size++) {
        const payload: string = buildAsciiText(size);
        const encoded: string = SecurityUtils.base64Encode(payload);
        expect(encoded.length % 4).assertEqual(0);
        expect(encoded.length).assertEqual(Math.ceil(size / 3) * 4);
        expect(SecurityUtils.base64Decode(encoded)).assertEqual(payload);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0134
     * @tc.name      testSecurityFile0035
     * @tc.desc      Verify every alignment of padding characters is produced and that the
     *               padding count matches the remainder of the byte length modulo three.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(countChar(SecurityUtils.base64Encode('a'), '=')).assertEqual(2);
      expect(countChar(SecurityUtils.base64Encode('ab'), '=')).assertEqual(1);
      expect(countChar(SecurityUtils.base64Encode('abc'), '=')).assertEqual(0);
      for (let size = 1; size <= 9; size++) {
        const payload: string = buildAsciiText(size);
        const encoded: string = SecurityUtils.base64Encode(payload);
        const remainder: number = size % 3;
        const expectedPadding: number = remainder === 0 ? 0 : 3 - remainder;
        expect(countChar(encoded, '=')).assertEqual(expectedPadding);
        expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
        expect(SecurityUtils.base64Decode(encoded)).assertEqual(payload);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0135
     * @tc.name      testSecurityFile0036
     * @tc.desc      Verify a 256 byte ASCII payload round trips and that the decoded byte
     *               count equals the source length exactly.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const longText: string = buildAsciiText(LONG_TEXT_LEN);
      expect(longText.length).assertEqual(LONG_TEXT_LEN);
      const encoded: string = SecurityUtils.base64Encode(longText);
      expect(SecurityUtils.base64Decode(encoded)).assertEqual(longText);
      expect(encoded.length % 4).assertEqual(0);
      expect(BASE64_ALPHABET_REGEX.test(encoded)).assertTrue();
      expect(SecurityUtils.base64DecodeToBytes(encoded).length).assertEqual(LONG_TEXT_LEN);
      expect(SecurityUtils.base64DecodeToBytes(encoded).length).assertEqual(toUtf8Bytes(longText).length);
      expect(SecurityUtils.base64EncodeBytes(toUtf8Bytes(longText))).assertEqual(encoded);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0136
     * @tc.name      testSecurityFile0037
     * @tc.desc      Verify an all zero byte block encodes to the known Base64 text and
     *               decodes back to the same zero bytes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const zeros: Uint8Array = new Uint8Array(3);
      expect(zeros.length).assertEqual(3);
      const encoded: string = SecurityUtils.base64EncodeBytes(zeros);
      expect(encoded).assertEqual('AAAA');
      const decoded: Uint8Array = SecurityUtils.base64DecodeToBytes(encoded);
      expect(decoded.length).assertEqual(3);
      expect(decoded[0]).assertEqual(0);
      expect(decoded[1]).assertEqual(0);
      expect(decoded[2]).assertEqual(0);
      expect(isAllZero(decoded)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0137
     * @tc.name      testSecurityFile0038
     * @tc.desc      Verify every single byte value from 0 to 63 encodes through base64EncodeBytes
     *               into four alphabet characters and decodes back to the same byte, and that a zero
     *               byte encodes to 'AA=='.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      for (let value = 0; value < 64; value++) {
        const block: Uint8Array = new Uint8Array(1);
        block[0] = value;
        const fromBytes: string = SecurityUtils.base64EncodeBytes(block);
        const decoded: Uint8Array = SecurityUtils.base64DecodeToBytes(fromBytes);
        expect(decoded.length).assertEqual(1);
        expect(decoded[0]).assertEqual(value);
        expect(fromBytes.length).assertEqual(4);
        expect(BASE64_ALPHABET_REGEX.test(fromBytes)).assertTrue();
      }
      const zeroBlock: Uint8Array = new Uint8Array(1);
      expect(SecurityUtils.base64EncodeBytes(zeroBlock)).assertEqual('AA==');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0138
     * @tc.name      testSecurityFile0039
     * @tc.desc      Verify control characters and quotes survive a Base64 round trip, and that emoji
     *               text encodes inside the alphabet, decodes back and yields eight UTF-8 bytes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testSecurityFile0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const control: string = 'line1\nline2\ttab\r\nend';
      expect(SecurityUtils.base64Decode(SecurityUtils.base64Encode(control))).assertEqual(control);
      const quoted: string = '"quoted" + \'single\' \\ backslash';
      expect(SecurityUtils.base64Decode(SecurityUtils.base64Encode(quoted))).assertEqual(quoted);
      // Two four-byte UTF-8 code points: a calendar and a clock face.
      const emoji: string = String.fromCodePoint(0x1F4C5) + String.fromCodePoint(0x1F550);
      const encodedEmoji: string = SecurityUtils.base64Encode(emoji);
      expect(BASE64_ALPHABET_REGEX.test(encodedEmoji)).assertTrue();
      expect(SecurityUtils.base64Decode(encodedEmoji)).assertEqual(emoji);
      expect(SecurityUtils.base64DecodeToBytes(encodedEmoji).length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0139
     * @tc.name      testSecurityFile0040
     * @tc.desc      Verify MD5 digest of a known ASCII payload keeps the documented length,
     *               lower-case alphabet and determinism across repeated calls.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: string = await SecurityUtils.md5Hex('meeting-room-3f');
      const second: string = await SecurityUtils.md5Hex('meeting-room-3f');
      expect(first).assertEqual(second);
      expect(first.length).assertEqual(MD5_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(first)).assertTrue();
      expect(first.toUpperCase() === first).assertFalse();
      const viaCore: string = await SecurityUtils.digestHex('meeting-room-3f', DigestAlgorithm.MD5);
      expect(viaCore).assertEqual(first);
      const other: string = await SecurityUtils.md5Hex('meeting-room-3f-2');
      expect(first === other).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0140
     * @tc.name      testSecurityFile0041
     * @tc.desc      Verify the three digest algorithms always produce distinct values for
     *               the same payload and never coincide with each other.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const payload: string = 'agenda-2026-04-01';
      const sha256: string = await SecurityUtils.sha256Hex(payload);
      const sha1: string = await SecurityUtils.sha1Hex(payload);
      const md5: string = await SecurityUtils.md5Hex(payload);
      expect(sha256 === sha1).assertFalse();
      expect(sha256 === md5).assertFalse();
      expect(sha1 === md5).assertFalse();
      expect(sha256.length).assertEqual(SHA256_HEX_LEN);
      expect(sha1.length).assertEqual(SHA1_HEX_LEN);
      expect(md5.length).assertEqual(MD5_HEX_LEN);
      expect(LOWER_HEX_REGEX.test(sha256)).assertTrue();
      expect(LOWER_HEX_REGEX.test(sha1)).assertTrue();
      expect(LOWER_HEX_REGEX.test(md5)).assertTrue();
      expect(sha256.startsWith(KNOWN_SHA256_ABC)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_SECFILE_0141
     * @tc.name      testSecurityFile0042
     * @tc.desc      Verify digests of a long 256 character payload keep the documented
     *               lengths and differ from digests of its truncated prefix.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testSecurityFile0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const TAG: string = 'testSecurityFile0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const longPayload: string = buildAsciiText(LONG_TEXT_LEN);
      const prefix: string = longPayload.substring(0, LONG_TEXT_LEN - 1);
      expect(prefix.length).assertEqual(LONG_TEXT_LEN - 1);
      const longSha256: string = await SecurityUtils.sha256Hex(longPayload);
      const prefixSha256: string = await SecurityUtils.sha256Hex(prefix);
      const longSha256Repeat: string = await SecurityUtils.sha256Hex(longPayload);
      const longSha1: string = await SecurityUtils.sha1Hex(longPayload);
      const prefixSha1: string = await SecurityUtils.sha1Hex(prefix);
      const longMd5: string = await SecurityUtils.md5Hex(longPayload);
      const prefixMd5: string = await SecurityUtils.md5Hex(prefix);
      expect(longSha256).assertEqual(longSha256Repeat);
      expect(longSha256 === prefixSha256).assertFalse();
      expect(longSha256.length).assertEqual(SHA256_HEX_LEN);
      expect(longSha1.length).assertEqual(SHA1_HEX_LEN);
      expect(longSha1 === prefixSha1).assertFalse();
      expect(longMd5.length).assertEqual(MD5_HEX_LEN);
      expect(longMd5 === prefixMd5).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
