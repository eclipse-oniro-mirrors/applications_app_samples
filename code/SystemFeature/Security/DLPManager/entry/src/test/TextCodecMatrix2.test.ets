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
  normalizeEol, splitLines, toHex, truncateToByteLength, utf8ByteLength, utf8BomLength } from '../main/ets/core/TextCodecCore';

function toBytes(codes: number[]): Uint8Array {
  const output: Uint8Array = new Uint8Array(codes.length);
  for (let index = 0; index < codes.length; index++) {
    output[index] = codes[index];
  }
  return output;
}

function joinBytes(values: Uint8Array): string {
  const parts: string[] = [];
  for (let index = 0; index < values.length; index++) {
    parts.push(values[index].toString());
  }
  return parts.join(',');
}

export default function textCodecMatrix2Test(): void {
  describe('TextCodecMatrix2Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0001
     * @tc.name      testAsciiSentence0001
     * @tc.desc      ascii sentences decode without replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiSentence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(encodeUtf8('The quick brown fox jumps over 13 dogs.'));
      expect(outcome.text).assertEqual('The quick brown fox jumps over 13 dogs.');
      expect(outcome.replacements).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0002
     * @tc.name      testChineseParagraph0002
     * @tc.desc      chinese paragraphs round trip with correct byte length
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChineseParagraph0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = '文件权限管理与加密保护说明';
      expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
      expect(utf8ByteLength(source)).assertEqual(source.length * 3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0003
     * @tc.name      testMixedParagraph0003
     * @tc.desc      mixed paragraphs round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testMixedParagraph0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'DLP v1.2 文件😀 100% 完成';
      expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0004
     * @tc.name      testTwoByteRange0004
     * @tc.desc      two byte range characters round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTwoByteRange0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let code = 0x80; code <= 0x7FF; code += 127) {
        const source: string = String.fromCharCode(code);
        expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0005
     * @tc.name      testThreeByteRange0005
     * @tc.desc      three byte range characters round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testThreeByteRange0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const samples: number[] = [0x800, 0x1000, 0x4E00, 0x9FA5, 0xFFFF];
      for (let index = 0; index < samples.length; index++) {
        const source: string = String.fromCharCode(samples[index]);
        expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0006
     * @tc.name      testFourByteRange0006
     * @tc.desc      four byte characters round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFourByteRange0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const samples: number[] = [0x1F600, 0x1F680, 0x1F4A9];
      for (let index = 0; index < samples.length; index++) {
        const source: string = String.fromCodePoint(samples[index]);
        expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0007
     * @tc.name      testInvalidContinuation0007
     * @tc.desc      invalid continuation bytes produce replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidContinuation0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xC2, 0x41]));
      expect(outcome.replacements).assertEqual(1);
      expect(outcome.text).assertEqual('\uFFFDA');
      expect(outcome.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0008
     * @tc.name      testTruncatedThree0008
     * @tc.desc      truncated three byte sequences yield replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncatedThree0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xE0, 0xA0]));
      expect(outcome.replacements).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0009
     * @tc.name      testTruncatedFour0009
     * @tc.desc      truncated four byte sequences yield replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncatedFour0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xF0, 0x90, 0x80]));
      expect(outcome.replacements).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0010
     * @tc.name      testRepeatedInvalid0010
     * @tc.desc      repeated invalid bytes each produce a replacement
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testRepeatedInvalid0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xFF, 0xFF, 0xFF]));
      expect(outcome.replacements).assertEqual(3);
      expect(outcome.text.length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0011
     * @tc.name      testTruncateMixed0011
     * @tc.desc      truncation budgets respect character boundaries
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateMixed0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'ab你😀';
      expect(truncateToByteLength(source, 1)).assertEqual('a');
      expect(truncateToByteLength(source, 2)).assertEqual('ab');
      expect(truncateToByteLength(source, 5)).assertEqual('ab你');
      expect(truncateToByteLength(source, 8)).assertEqual('ab你');
      expect(truncateToByteLength(source, 9)).assertEqual('ab你😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0012
     * @tc.name      testCountMixed0012
     * @tc.desc      code point counts handle mixed content
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountMixed0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(countCodePoints('ab你😀')).assertEqual(4);
      expect(countCodePoints('😀😀你')).assertEqual(3);
      expect('😀😀你'.length).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0013
     * @tc.name      testSplitMixedEndings0013
     * @tc.desc      mixed line endings split consistently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitMixedEndings0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const lines: string[] = splitLines('a\r\nb\rc\nd');
      expect(lines.length).assertEqual(4);
      expect(lines[0]).assertEqual('a');
      expect(lines[3]).assertEqual('d');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0014
     * @tc.name      testSplitTrailingBlank0014
     * @tc.desc      single trailing newlines do not add empty lines
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitTrailingBlank0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(splitLines('a\nb\n').length).assertEqual(2);
      expect(splitLines('a\nb\n\n').length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0015
     * @tc.name      testNormalizeRoundTrip0015
     * @tc.desc      normalization to crlf and back is stable
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeRoundTrip0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'a\nb\nc';
      const crlf: string = normalizeEol(source, true);
      expect(normalizeEol(crlf, false)).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0016
     * @tc.name      testHexRoundTripSweep0016
     * @tc.desc      hex conversion round trips several buffers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHexRoundTripSweep0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const buffers: Uint8Array[] = [
        toBytes([0]),
        toBytes([1, 2, 3]),
        toBytes([0xEF, 0xBB, 0xBF]),
        toBytes([0x80, 0xFF, 0x7F])
      ];
      for (let index = 0; index < buffers.length; index++) {
        const parsed: HexOutcome = fromHex(toHex(buffers[index], false));
        expect(parsed.valid).assertTrue();
        expect(joinBytes(parsed.bytes)).assertEqual(joinBytes(buffers[index]));
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0017
     * @tc.name      testBomPrefixNul0017
     * @tc.desc      prefix decoding combines bom skipping and nul stopping
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBomPrefixNul0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: Uint8Array = toBytes([0xEF, 0xBB, 0xBF, 0x41, 0x42, 0x00, 0x43]);
      const outcome: DecodeOutcome = decodeUtf8Prefix(source, 7, true, true);
      expect(outcome.text).assertEqual('AB');
      expect(outcome.bytesConsumed).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0018
     * @tc.name      testBomOnlyBuffer0018
     * @tc.desc      bom only buffers decode to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBomOnlyBuffer0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: Uint8Array = toBytes([0xEF, 0xBB, 0xBF]);
      expect(utf8BomLength(source)).assertEqual(3);
      expect(decodeUtf8Prefix(source, 3, true, false).text).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0019
     * @tc.name      testNulInMiddle0019
     * @tc.desc      nul bytes decode visibly without prefix mode
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNulInMiddle0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0x41, 0x00, 0x42]));
      expect(outcome.text.length).assertEqual(3);
      expect(outcome.text.charCodeAt(1)).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0020
     * @tc.name      testSurrogateEncoding0020
     * @tc.desc      surrogate pairs encode to four bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSurrogateEncoding0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = String.fromCharCode(0xD83D, 0xDE00);
      const bytes: Uint8Array = encodeUtf8(source);
      expect(bytes.length).assertEqual(4);
      expect(bytes[0]).assertEqual(0xF0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0021
     * @tc.name      testLoneSurrogateByteLength0021
     * @tc.desc      lone surrogates count as replacement characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLoneSurrogateByteLength0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const lone: string = String.fromCharCode(0xDC00);
      expect(utf8ByteLength(lone)).assertEqual(3);
      expect(joinBytes(encodeUtf8(lone))).assertEqual('239,191,189');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0022
     * @tc.name      testEmptyMatrix0022
     * @tc.desc      empty inputs behave consistently across helpers
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmptyMatrix0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(encodeUtf8('').length).assertEqual(0);
      expect(utf8ByteLength('')).assertEqual(0);
      expect(countCodePoints('')).assertEqual(0);
      expect(truncateToByteLength('', 10)).assertEqual('');
      expect(splitLines('').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0023
     * @tc.name      testHexEmpty0023
     * @tc.desc      empty buffers convert to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHexEmpty0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(toHex(toBytes([]), false)).assertEqual('');
      expect(fromHex('').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX2_0024
     * @tc.name      testPrefixConsumed0024
     * @tc.desc      prefix decoding reports consumed bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrefixConsumed0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: Uint8Array = toBytes([0x41, 0x42, 0x43, 0x44, 0x45]);
      expect(decodeUtf8Prefix(source, 3, false, false).bytesConsumed).assertEqual(3);
      expect(decodeUtf8Prefix(source, 0, false, false).bytesConsumed).assertEqual(0);
    })
  });
}
