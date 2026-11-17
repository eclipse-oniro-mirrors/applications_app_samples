/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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
import { DecodeOutcome, HexOutcome, countCodePoints, decodeUtf8, decodeUtf8Prefix, encodeUtf8, fromHex,
  hasUtf8Bom, isAsciiOnly, normalizeEol, splitLines, toHex, truncateToByteLength, utf8ByteLength,
  utf8BomLength } from '../main/ets/core/TextCodecCore';

function toBytes(codes: Array<number>): Uint8Array {
  const output: Uint8Array = new Uint8Array(codes.length);
  for (let index = 0; index < codes.length; index++) {
    output[index] = codes[index];
  }
  return output;
}

function joinBytes(values: Uint8Array): string {
  const parts: Array<string> = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(values[index].toString());
  }
  return parts.join(',');
}

function roundTrip(text: string): string {
  return decodeUtf8(encodeUtf8(text)).text;
}

export default function textCodecMatrixTest(): void {
  describe('TextCodecMatrixTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0001
     * @tc.name      testRoundTripAscii0001
     * @tc.desc      ascii text round trips
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripAscii0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripAscii0001 begin');
      expect(roundTrip('Hello, DLP!')).assertEqual('Hello, DLP!');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0002
     * @tc.name      testRoundTripChinese0002
     * @tc.desc      chinese text round trips
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripChinese0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripChinese0002 begin');
      expect(roundTrip('你好世界')).assertEqual('你好世界');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0003
     * @tc.name      testRoundTripEmoji0003
     * @tc.desc      emoji sequences round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripEmoji0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripEmoji0003 begin');
      expect(roundTrip('😀😁😂')).assertEqual('😀😁😂');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0004
     * @tc.name      testRoundTripMixed0004
     * @tc.desc      mixed text round trips
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripMixed0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripMixed0004 begin');
      expect(roundTrip('a你😀z')).assertEqual('a你😀z');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0005
     * @tc.name      testRoundTripNul0005
     * @tc.desc      nul and ascii round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripNul0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripNul0005 begin');
      const source: string = 'A\u0000B';
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0006
     * @tc.name      testRoundTripDel0006
     * @tc.desc      the delete control character round trips
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripDel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripDel0006 begin');
      const source: string = String.fromCharCode(0x7F);
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0007
     * @tc.name      testRoundTripTwoByteMin0007
     * @tc.desc      U+0080 round trips through two bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripTwoByteMin0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripTwoByteMin0007 begin');
      const source: string = String.fromCharCode(0x80);
      expect(encodeUtf8(source).length).assertEqual(2);
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0008
     * @tc.name      testRoundTripTwoByteMax0008
     * @tc.desc      U+07FF round trips through two bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripTwoByteMax0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripTwoByteMax0008 begin');
      const source: string = String.fromCharCode(0x7FF);
      expect(encodeUtf8(source).length).assertEqual(2);
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0009
     * @tc.name      testRoundTripThreeByteMin0009
     * @tc.desc      U+0800 round trips through three bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripThreeByteMin0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripThreeByteMin0009 begin');
      const source: string = String.fromCharCode(0x800);
      expect(encodeUtf8(source).length).assertEqual(3);
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0010
     * @tc.name      testRoundTripThreeByteMax0010
     * @tc.desc      U+FFFF round trips through three bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripThreeByteMax0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripThreeByteMax0010 begin');
      const source: string = String.fromCharCode(0xFFFF);
      expect(encodeUtf8(source).length).assertEqual(3);
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0011
     * @tc.name      testRoundTripFourByteMin0011
     * @tc.desc      U+10000 round trips through four bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripFourByteMin0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripFourByteMin0011 begin');
      const source: string = String.fromCharCode(0xD800, 0xDC00);
      expect(encodeUtf8(source).length).assertEqual(4);
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0012
     * @tc.name      testRoundTripFourByteMax0012
     * @tc.desc      U+10FFFF round trips through four bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRoundTripFourByteMax0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testRoundTripFourByteMax0012 begin');
      const source: string = String.fromCharCode(0xDBFF, 0xDFFF);
      expect(encodeUtf8(source).length).assertEqual(4);
      expect(roundTrip(source)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0013
     * @tc.name      testEncodeLoneHigh0013
     * @tc.desc      lone high surrogates encode as replacement characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeLoneHigh0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeLoneHigh0013 begin');
      const source: string = String.fromCharCode(0xD800) + 'a';
      expect(joinBytes(encodeUtf8(source))).assertEqual('239,191,189,97');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0014
     * @tc.name      testEncodeLoneLow0014
     * @tc.desc      lone low surrogates encode as replacement characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeLoneLow0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeLoneLow0014 begin');
      const source: string = 'a' + String.fromCharCode(0xDFFF);
      expect(joinBytes(encodeUtf8(source))).assertEqual('97,239,191,189');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0015
     * @tc.name      testDecodeLoneHighByte0015
     * @tc.desc      invalid high lead bytes decode with replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeLoneHighByte0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeLoneHighByte0015 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xF5, 0x41]));
      expect(outcome.replacements).assertEqual(1);
      expect(outcome.text).assertEqual('\uFFFDA');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0016
     * @tc.name      testBomLength00016
     * @tc.desc      bom length detection handles short buffers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBomLength00016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testBomLength00016 begin');
      expect(utf8BomLength(toBytes([]))).assertEqual(0);
      expect(utf8BomLength(toBytes([0xEF, 0xBB]))).assertEqual(0);
      expect(utf8BomLength(toBytes([0xEF, 0xBB, 0xBF]))).assertEqual(3);
      expect(hasUtf8Bom(toBytes([0xEF, 0xBB, 0xBF, 0x41]))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0017
     * @tc.name      testPrefixSkipBom0017
     * @tc.desc      prefix decoding can skip the bom
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrefixSkipBom0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPrefixSkipBom0017 begin');
      const source: Uint8Array = toBytes([0xEF, 0xBB, 0xBF, 0x41, 0x42]);
      expect(decodeUtf8Prefix(source, 5, true, false).text).assertEqual('AB');
      expect(decodeUtf8Prefix(source, 5, false, false).text.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0018
     * @tc.name      testPrefixLengths0018
     * @tc.desc      prefix decoding respects every length
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrefixLengths0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPrefixLengths0018 begin');
      const source: Uint8Array = toBytes([0x41, 0x42, 0x43, 0x44]);
      expect(decodeUtf8Prefix(source, 1, false, false).text).assertEqual('A');
      expect(decodeUtf8Prefix(source, 2, false, false).text).assertEqual('AB');
      expect(decodeUtf8Prefix(source, 3, false, false).text).assertEqual('ABC');
      expect(decodeUtf8Prefix(source, 4, false, false).text).assertEqual('ABCD');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0019
     * @tc.name      testPrefixStopNul0019
     * @tc.desc      prefix decoding stops at nul when requested
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrefixStopNul0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPrefixStopNul0019 begin');
      const source: Uint8Array = toBytes([0x41, 0x42, 0x00, 0x43]);
      expect(decodeUtf8Prefix(source, 4, false, true).text).assertEqual('AB');
      expect(decodeUtf8Prefix(source, 4, false, true).bytesConsumed).assertEqual(2);
      expect(decodeUtf8Prefix(source, 4, false, false).text.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0020
     * @tc.name      testPrefixClamp0020
     * @tc.desc      prefix lengths are clamped to the buffer
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrefixClamp0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPrefixClamp0020 begin');
      const source: Uint8Array = toBytes([0x41]);
      expect(decodeUtf8Prefix(source, -3, false, false).text).assertEqual('');
      expect(decodeUtf8Prefix(source, 99, false, false).text).assertEqual('A');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0021
     * @tc.name      testTruncateSweep0021
     * @tc.desc      truncation budgets never split characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateSweep0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateSweep0021 begin');
      const source: string = '你a😀';
      expect(truncateToByteLength(source, 0)).assertEqual('');
      expect(truncateToByteLength(source, 1)).assertEqual('');
      expect(truncateToByteLength(source, 3)).assertEqual('你');
      expect(truncateToByteLength(source, 4)).assertEqual('你a');
      expect(truncateToByteLength(source, 7)).assertEqual('你a');
      expect(truncateToByteLength(source, 8)).assertEqual('你a😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0022
     * @tc.name      testByteLengthSweep0022
     * @tc.desc      byte length matches the encoder for every class
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByteLengthSweep0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testByteLengthSweep0022 begin');
      const samples: Array<string> = ['', 'a', 'ab', '你', '你好', '😀', 'a你😀'];
      for (let index = 0; index < samples.length; index++) {
        expect(utf8ByteLength(samples[index])).assertEqual(encodeUtf8(samples[index]).length);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0023
     * @tc.name      testCountCodePoints0023
     * @tc.desc      code point counts differ from code unit lengths
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountCodePoints0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCountCodePoints0023 begin');
      expect(countCodePoints('😀😀')).assertEqual(2);
      expect('😀😀'.length).assertEqual(4);
      expect(countCodePoints('a😀你b')).assertEqual(4);
      expect(countCodePoints(String.fromCharCode(0xD83D))).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0024
     * @tc.name      testAsciiSweep0024
     * @tc.desc      ascii detection covers control and high bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiSweep0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAsciiSweep0024 begin');
      expect(isAsciiOnly('')).assertTrue();
      expect(isAsciiOnly('\u0000\u007F')).assertTrue();
      expect(isAsciiOnly(String.fromCharCode(0x80))).assertFalse();
      expect(isAsciiOnly('中')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0025
     * @tc.name      testSplitSweep0025
     * @tc.desc      line splitting handles every separator mix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitSweep0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitSweep0025 begin');
      expect(splitLines('a\nb\nc').length).assertEqual(3);
      expect(splitLines('a\r\nb').length).assertEqual(2);
      expect(splitLines('a\rb').length).assertEqual(2);
      expect(splitLines('a\n\nb').length).assertEqual(3);
      expect(splitLines('\n\n\n').length).assertEqual(3);
      expect(splitLines('').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0026
     * @tc.name      testNormalizeSweep0026
     * @tc.desc      eol normalization is idempotent
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeSweep0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeSweep0026 begin');
      expect(normalizeEol('a\r\nb\rc\nd', false)).assertEqual('a\nb\nc\nd');
      expect(normalizeEol('a\nb', true)).assertEqual('a\r\nb');
      expect(normalizeEol(normalizeEol('a\rb', true), false)).assertEqual('a\nb');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0027
     * @tc.name      testHexSweep0027
     * @tc.desc      hex conversion round trips random values
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHexSweep0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHexSweep0027 begin');
      const source: Uint8Array = toBytes([0x00, 0x01, 0x7F, 0x80, 0xFE, 0xFF]);
      const hex: string = toHex(source, false);
      const parsed: HexOutcome = fromHex(hex);
      expect(parsed.valid).assertTrue();
      expect(joinBytes(parsed.bytes)).assertEqual(joinBytes(source));
      expect(toHex(source, true)).assertEqual('00017F80FEFF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0028
     * @tc.name      testHexInvalid0028
     * @tc.desc      invalid hex inputs are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHexInvalid0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHexInvalid0028 begin');
      expect(fromHex('').valid).assertFalse();
      expect(fromHex('abc').valid).assertFalse();
      expect(fromHex('0x').valid).assertFalse();
      expect(fromHex('xx').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0029
     * @tc.name      testDecodeTwoByteSequence0029
     * @tc.desc      two byte sequences decode to the expected code points
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeTwoByteSequence0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeTwoByteSequence0029 begin');
      expect(decodeUtf8(toBytes([0xC2, 0xA9])).text).assertEqual('©');
      expect(decodeUtf8(toBytes([0xCE, 0xA9])).text).assertEqual('Ω');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX_0030
     * @tc.name      testDecodeThreeByteSequence0030
     * @tc.desc      three byte sequences decode to the expected code points
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeThreeByteSequence0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeThreeByteSequence0030 begin');
      expect(decodeUtf8(toBytes([0xE2, 0x9C, 0x94])).text).assertEqual('✔');
      expect(decodeUtf8(toBytes([0xE5, 0x8E, 0x9F])).text).assertEqual('原');
    })
  });
}
