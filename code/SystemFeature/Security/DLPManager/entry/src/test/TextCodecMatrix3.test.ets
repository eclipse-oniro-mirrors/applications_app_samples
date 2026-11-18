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

export default function textCodecMatrix3Test(): void {
  describe('TextCodecMatrix3Test', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0001
     * @tc.name      testLatinSweep0001
     * @tc.desc      latin range characters round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testLatinSweep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let code = 0xA0; code <= 0xFF; code += 17) {
        const source: string = String.fromCharCode(code);
        expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0002
     * @tc.name      testCjkSweep0002
     * @tc.desc      cjk characters round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCjkSweep0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const samples: number[] = [0x4E00, 0x5F00, 0x6D4B, 0x8BD5, 0x9FA5];
      for (let index = 0; index < samples.length; index++) {
        const source: string = String.fromCharCode(samples[index]);
        expect(utf8ByteLength(source)).assertEqual(3);
        expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0003
     * @tc.name      testEmojiSweep0003
     * @tc.desc      emoji characters use four bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEmojiSweep0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const samples: string[] = ['😀', '🚀', '🔥'];
      for (let index = 0; index < samples.length; index++) {
        expect(utf8ByteLength(samples[index])).assertEqual(4);
        expect(countCodePoints(samples[index])).assertEqual(1);
        expect(decodeUtf8(encodeUtf8(samples[index])).text).assertEqual(samples[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0004
     * @tc.name      testInvalidLeadBytes0004
     * @tc.desc      invalid lead bytes each yield replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidLeadBytes0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0x80, 0xBF, 0xF5, 0xFF]));
      expect(outcome.replacements).assertEqual(4);
      expect(outcome.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0005
     * @tc.name      testInvalidSecondBytes0005
     * @tc.desc      invalid second bytes yield per byte replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testInvalidSecondBytes0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(decodeUtf8(toBytes([0xC2, 0xC2])).replacements).assertEqual(2);
      expect(decodeUtf8(toBytes([0xE0, 0x9F])).replacements).assertEqual(2);
      expect(decodeUtf8(toBytes([0xF0, 0x8F])).replacements).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0006
     * @tc.name      testTruncateEmojiMatrix0006
     * @tc.desc      truncation budgets respect four byte characters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEmojiMatrix0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = '😀你a';
      const budgets: number[] = [1, 3, 4, 5, 8];
      const expected: string[] = ['', '', '😀', '😀', '😀你a'];
      for (let index = 0; index < budgets.length; index++) {
        expect(truncateToByteLength(source, budgets[index])).assertEqual(expected[index]);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0007
     * @tc.name      testSplitCrLf0019
     * @tc.desc      cr lf combinations split consistently
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitCrLf0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(splitLines('a\r\nb\r\nc').length).assertEqual(3);
      expect(splitLines('a\rb\r\nc').length).assertEqual(3);
      expect(splitLines('a\nb\rc').length).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0008
     * @tc.name      testNormalizeIdempotent0008
     * @tc.desc      normalization is idempotent for both styles
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeIdempotent0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const once: string = normalizeEol('a\r\nb\rc', false);
      expect(normalizeEol(once, false)).assertEqual(once);
      expect(normalizeEol(normalizeEol(once, true), true)).assertEqual(normalizeEol(once, true));
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0009
     * @tc.name      testHexSweep0009
     * @tc.desc      hex conversion round trips length sweeps
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHexSweep0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      for (let length = 1; length <= 5; length++) {
        const codes: number[] = [];
        for (let index = 0; index < length; index++) {
          codes.push(index * 51);
        }
        const bytes: Uint8Array = toBytes(codes);
        const parsed: HexOutcome = fromHex(toHex(bytes, false));
        expect(parsed.valid).assertTrue();
        expect(joinBytes(parsed.bytes)).assertEqual(joinBytes(bytes));
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0010
     * @tc.name      testBomPrefixCombo0010
     * @tc.desc      bom handling combines with prefix limits
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testBomPrefixCombo0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: Uint8Array = toBytes([0xEF, 0xBB, 0xBF, 0xE4, 0xBD, 0xA0, 0x41]);
      expect(utf8BomLength(source)).assertEqual(3);
      expect(decodeUtf8Prefix(source, 7, true, false).text).assertEqual('你A');
      expect(decodeUtf8Prefix(source, 3, true, false).text).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0011
     * @tc.name      testByteLengthLoop0011
     * @tc.desc      byte lengths match encoded lengths for a sample set
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByteLengthLoop0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const samples: string[] = ['', 'a', 'abc', '中文', '😀', 'a中😀b', '100%'];
      for (let index = 0; index < samples.length; index++) {
        expect(utf8ByteLength(samples[index])).assertEqual(encodeUtf8(samples[index]).length);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0012
     * @tc.name      testNulRoundTrip0012
     * @tc.desc      nul characters round trip and count as code units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNulRoundTrip0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'a\u0000\u0000b';
      expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
      expect(source.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0013
     * @tc.name      testAsciiControlRoundTrip0013
     * @tc.desc      control characters round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiControlRoundTrip0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = '\u0001\u0002\u001F';
      expect(decodeUtf8(encodeUtf8(source)).text).assertEqual(source);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0014
     * @tc.name      testDecodeEmptyOutcome0014
     * @tc.desc      empty buffers decode with zero counters
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeEmptyOutcome0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const outcome: DecodeOutcome = decodeUtf8(new Uint8Array(0));
      expect(outcome.bytesConsumed).assertEqual(0);
      expect(outcome.replacements).assertEqual(0);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0015
     * @tc.name      testCountEmojiLoop0015
     * @tc.desc      emoji sequences count as single code points
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCountEmojiLoop0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      expect(countCodePoints('😀🚀🔥')).assertEqual(3);
      expect('😀🚀🔥'.length).assertEqual(6);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0016
     * @tc.name      testPrefixConsumedNul0016
     * @tc.desc      prefix decoding reports consumed bytes before nul
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrefixConsumedNul0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: Uint8Array = toBytes([0x41, 0x42, 0x43, 0x00, 0x44]);
      const outcome: DecodeOutcome = decodeUtf8Prefix(source, 5, false, true);
      expect(outcome.text).assertEqual('ABC');
      expect(outcome.bytesConsumed).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0017
     * @tc.name      testSplitWindowsFile0017
     * @tc.desc      windows style text splits without carriage returns
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitWindowsFile0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const lines: string[] = splitLines('年度\r\n报告\r\n');
      expect(lines.length).assertEqual(2);
      expect(lines[0]).assertEqual('年度');
      expect(lines[1]).assertEqual('报告');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0018
     * @tc.name      testEncodeRoundTripEmojiText0018
     * @tc.desc      emoji rich text round trips byte for byte
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeRoundTripEmojiText0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'DLP 文件😀🚀 100%';
      const first: Uint8Array = encodeUtf8(source);
      const second: Uint8Array = encodeUtf8(decodeUtf8(first).text);
      expect(joinBytes(first)).assertEqual(joinBytes(second));
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTMATRIX3_0019
     * @tc.name      testTruncateAsciiLoop0019
     * @tc.desc      ascii truncation respects every budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateAsciiLoop0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const source: string = 'abcdef';
      for (let budget = 0; budget <= 6; budget++) {
        expect(truncateToByteLength(source, budget)).assertEqual(source.substring(0, budget));
      }
    })
  });
}
