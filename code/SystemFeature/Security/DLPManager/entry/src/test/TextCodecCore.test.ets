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
import { DecodeOutcome, HexOutcome, utf8BomLength, hasUtf8Bom, decodeUtf8, decodeUtf8Prefix,
  encodeUtf8, utf8ByteLength, truncateToByteLength, countCodePoints, isAsciiOnly, normalizeEol,
  splitLines, toHex, fromHex } from '../main/ets/core/TextCodecCore';

function toBytes(codes: number[]): Uint8Array {
  const output: Uint8Array = new Uint8Array(codes.length);
  for (let index = 0; index < codes.length; index++) {
    output[index] = codes[index];
  }
  return output;
}

function asciiBytes(text: string): Uint8Array {
  const output: Uint8Array = new Uint8Array(text.length);
  for (let index = 0; index < text.length; index++) {
    output[index] = text.charCodeAt(index);
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

function joinTexts(values: string[]): string {
  return values.join('|');
}

const BOM: number[] = [0xEF, 0xBB, 0xBF];
const CHINESE_BYTES: number[] = [0xE4, 0xBD, 0xA0, 0xE5, 0xA5, 0xBD];
const SMILE_BYTES: number[] = [0xF0, 0x9F, 0x98, 0x80];

export default function textCodecCoreTest(): void {
  describe('TextCodecCoreTest', () => {
    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0001
     * @tc.name      testUtf8BomLength0001
     * @tc.desc      empty input has no bom
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUtf8BomLength0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUtf8BomLength0001 begin');
      console.info('testUtf8BomLength0001 begin');
      const actual: number = utf8BomLength(toBytes([]));
      expect(actual).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0002
     * @tc.name      testUtf8BomLength0002
     * @tc.desc      single bom byte is not enough
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUtf8BomLength0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUtf8BomLength0002 begin');
      console.info('testUtf8BomLength0002 begin');
      const actual: number = utf8BomLength(toBytes([0xEF]));
      expect(actual).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0003
     * @tc.name      testUtf8BomLength0003
     * @tc.desc      two bom bytes are not enough
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUtf8BomLength0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUtf8BomLength0003 begin');
      console.info('testUtf8BomLength0003 begin');
      const actual: number = utf8BomLength(toBytes([0xEF, 0xBB]));
      expect(actual).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0004
     * @tc.name      testUtf8BomLength0004
     * @tc.desc      full bom returns three
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUtf8BomLength0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUtf8BomLength0004 begin');
      console.info('testUtf8BomLength0004 begin');
      const actual: number = utf8BomLength(toBytes(BOM));
      expect(actual).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0005
     * @tc.name      testUtf8BomLength0005
     * @tc.desc      bom followed by content still returns three
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUtf8BomLength0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUtf8BomLength0005 begin');
      console.info('testUtf8BomLength0005 begin');
      const actual: number = utf8BomLength(toBytes([0xEF, 0xBB, 0xBF, 0x41]));
      expect(actual).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0006
     * @tc.name      testUtf8BomLength0006
     * @tc.desc      broken bom returns zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testUtf8BomLength0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testUtf8BomLength0006 begin');
      console.info('testUtf8BomLength0006 begin');
      const actual: number = utf8BomLength(toBytes([0xEF, 0xBB, 0xBE]));
      expect(actual).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0007
     * @tc.name      testHasUtf8Bom0007
     * @tc.desc      empty buffer has no bom
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHasUtf8Bom0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHasUtf8Bom0007 begin');
      console.info('testHasUtf8Bom0007 begin');
      expect(hasUtf8Bom(toBytes([]))).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0008
     * @tc.name      testHasUtf8Bom0008
     * @tc.desc      full bom is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHasUtf8Bom0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHasUtf8Bom0008 begin');
      console.info('testHasUtf8Bom0008 begin');
      expect(hasUtf8Bom(toBytes(BOM))).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0009
     * @tc.name      testHasUtf8Bom0009
     * @tc.desc      utf16 bom is not utf8 bom
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHasUtf8Bom0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHasUtf8Bom0009 begin');
      console.info('testHasUtf8Bom0009 begin');
      expect(hasUtf8Bom(toBytes([0xFF, 0xFE]))).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0010
     * @tc.name      testHasUtf8Bom0010
     * @tc.desc      ascii content has no bom
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testHasUtf8Bom0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testHasUtf8Bom0010 begin');
      console.info('testHasUtf8Bom0010 begin');
      expect(hasUtf8Bom(toBytes([0x41, 0x42]))).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0011
     * @tc.name      testDecodeUtf8Empty0011
     * @tc.desc      empty buffer decodes to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8Empty0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8Empty0011 begin');
      console.info('testDecodeUtf8Empty0011 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([]));
      expect(outcome.text).assertEqual('');
      expect(outcome.valid).assertTrue();
      expect(outcome.bytesConsumed).assertEqual(0);
      expect(outcome.replacements).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0012
     * @tc.name      testDecodeUtf8Ascii0012
     * @tc.desc      single ascii byte decodes to one character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8Ascii0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8Ascii0012 begin');
      console.info('testDecodeUtf8Ascii0012 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0x41]));
      expect(outcome.text).assertEqual('A');
      expect(outcome.valid).assertTrue();
      expect(outcome.bytesConsumed).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0013
     * @tc.name      testDecodeUtf8AsciiText0013
     * @tc.desc      ascii sentence decodes without loss
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8AsciiText0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8AsciiText0013 begin');
      console.info('testDecodeUtf8AsciiText0013 begin');
      const outcome: DecodeOutcome = decodeUtf8(asciiBytes('Hello World'));
      expect(outcome.text).assertEqual('Hello World');
      expect(outcome.bytesConsumed).assertEqual(11);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0014
     * @tc.name      testDecodeUtf8Chinese0014
     * @tc.desc      two chinese characters decode correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8Chinese0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8Chinese0014 begin');
      console.info('testDecodeUtf8Chinese0014 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes(CHINESE_BYTES));
      expect(outcome.text).assertEqual('你好');
      expect(outcome.valid).assertTrue();
      expect(outcome.bytesConsumed).assertEqual(6);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0015
     * @tc.name      testDecodeUtf8Emoji0015
     * @tc.desc      four byte emoji decodes to surrogate pair
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8Emoji0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8Emoji0015 begin');
      console.info('testDecodeUtf8Emoji0015 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes(SMILE_BYTES));
      expect(outcome.text.length).assertEqual(2);
      expect(outcome.text.charCodeAt(0)).assertEqual(0xD83D);
      expect(outcome.text.charCodeAt(1)).assertEqual(0xDE00);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0016
     * @tc.name      testDecodeUtf8TwoByteMin0016
     * @tc.desc      minimum two byte sequence decodes to U+0080
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8TwoByteMin0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8TwoByteMin0016 begin');
      console.info('testDecodeUtf8TwoByteMin0016 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xC2, 0x80]));
      expect(outcome.text.charCodeAt(0)).assertEqual(0x80);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0017
     * @tc.name      testDecodeUtf8TwoByteMax0017
     * @tc.desc      maximum two byte sequence decodes to U+07FF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8TwoByteMax0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8TwoByteMax0017 begin');
      console.info('testDecodeUtf8TwoByteMax0017 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xDF, 0xBF]));
      expect(outcome.text.charCodeAt(0)).assertEqual(0x7FF);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0018
     * @tc.name      testDecodeUtf8ThreeByteMin0018
     * @tc.desc      minimum three byte sequence decodes to U+0800
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8ThreeByteMin0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8ThreeByteMin0018 begin');
      console.info('testDecodeUtf8ThreeByteMin0018 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xE0, 0xA0, 0x80]));
      expect(outcome.text.charCodeAt(0)).assertEqual(0x800);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0019
     * @tc.name      testDecodeUtf8ThreeByteMax0019
     * @tc.desc      three byte sequence decodes to U+FFFF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8ThreeByteMax0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8ThreeByteMax0019 begin');
      console.info('testDecodeUtf8ThreeByteMax0019 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xEF, 0xBF, 0xBF]));
      expect(outcome.text.charCodeAt(0)).assertEqual(0xFFFF);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0020
     * @tc.name      testDecodeUtf8FourByteMin0020
     * @tc.desc      minimum four byte sequence decodes to U+10000
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8FourByteMin0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8FourByteMin0020 begin');
      console.info('testDecodeUtf8FourByteMin0020 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xF0, 0x90, 0x80, 0x80]));
      expect(outcome.text.charCodeAt(0)).assertEqual(0xD800);
      expect(outcome.text.charCodeAt(1)).assertEqual(0xDC00);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0021
     * @tc.name      testDecodeUtf8FourByteMax0021
     * @tc.desc      maximum four byte sequence decodes to U+10FFFF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8FourByteMax0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8FourByteMax0021 begin');
      console.info('testDecodeUtf8FourByteMax0021 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xF4, 0x8F, 0xBF, 0xBF]));
      expect(outcome.text.charCodeAt(0)).assertEqual(0xDBFF);
      expect(outcome.text.charCodeAt(1)).assertEqual(0xDFFF);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0022
     * @tc.name      testDecodeUtf8LoneContinuation0022
     * @tc.desc      lone continuation byte becomes one replacement
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8LoneContinuation0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8LoneContinuation0022 begin');
      console.info('testDecodeUtf8LoneContinuation0022 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0x80]));
      expect(outcome.text).assertEqual('\uFFFD');
      expect(outcome.valid).assertFalse();
      expect(outcome.replacements).assertEqual(1);
      expect(outcome.bytesConsumed).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0023
     * @tc.name      testDecodeUtf8InvalidStart0023
     * @tc.desc      0xFF is never a valid start byte
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8InvalidStart0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8InvalidStart0023 begin');
      console.info('testDecodeUtf8InvalidStart0023 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xFF, 0x41]));
      expect(outcome.text).assertEqual('\uFFFDA');
      expect(outcome.replacements).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0024
     * @tc.name      testDecodeUtf8OverlongC00024
     * @tc.desc      overlong C0 sequence yields two replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8OverlongC00024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8OverlongC00024 begin');
      console.info('testDecodeUtf8OverlongC00024 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xC0, 0x80]));
      expect(outcome.text).assertEqual('\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(2);
      expect(outcome.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0025
     * @tc.name      testDecodeUtf8OverlongC10025
     * @tc.desc      overlong C1 sequence yields two replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8OverlongC10025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8OverlongC10025 begin');
      console.info('testDecodeUtf8OverlongC10025 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xC1, 0xBF]));
      expect(outcome.text).assertEqual('\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0026
     * @tc.name      testDecodeUtf8E0InvalidSecond0026
     * @tc.desc      E0 second byte below A0 is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8E0InvalidSecond0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8E0InvalidSecond0026 begin');
      console.info('testDecodeUtf8E0InvalidSecond0026 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xE0, 0x80, 0x80]));
      expect(outcome.text).assertEqual('\uFFFD\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(3);
      expect(outcome.valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0027
     * @tc.name      testDecodeUtf8EdSurrogate0027
     * @tc.desc      ED A0 sequence carries a surrogate and is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8EdSurrogate0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8EdSurrogate0027 begin');
      console.info('testDecodeUtf8EdSurrogate0027 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xED, 0xA0, 0x80]));
      expect(outcome.text).assertEqual('\uFFFD\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0028
     * @tc.name      testDecodeUtf8F0InvalidSecond0028
     * @tc.desc      F0 second byte below 90 is rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8F0InvalidSecond0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8F0InvalidSecond0028 begin');
      console.info('testDecodeUtf8F0InvalidSecond0028 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xF0, 0x8F, 0xBF, 0xBF]));
      expect(outcome.text).assertEqual('\uFFFD\uFFFD\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0029
     * @tc.name      testDecodeUtf8F4InvalidSecond0029
     * @tc.desc      F4 second byte above 8F exceeds U+10FFFF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8F4InvalidSecond0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8F4InvalidSecond0029 begin');
      console.info('testDecodeUtf8F4InvalidSecond0029 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xF4, 0x90, 0x80, 0x80]));
      expect(outcome.text).assertEqual('\uFFFD\uFFFD\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0030
     * @tc.name      testDecodeUtf8TruncatedTail0030
     * @tc.desc      lone three byte lead at the tail is replaced
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8TruncatedTail0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8TruncatedTail0030 begin');
      console.info('testDecodeUtf8TruncatedTail0030 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0x41, 0xE4, 0xBD]));
      expect(outcome.text).assertEqual('A\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(2);
      expect(outcome.bytesConsumed).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0031
     * @tc.name      testDecodeUtf8MixedValidInvalid0031
     * @tc.desc      valid chinese followed by ascii keeps both
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8MixedValidInvalid0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8MixedValidInvalid0031 begin');
      console.info('testDecodeUtf8MixedValidInvalid0031 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xE4, 0xBD, 0xA0, 0x41]));
      expect(outcome.text).assertEqual('你A');
      expect(outcome.valid).assertTrue();
      expect(outcome.bytesConsumed).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0032
     * @tc.name      testDecodeUtf8Nul0032
     * @tc.desc      nul byte outside prefix mode decodes as a character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8Nul0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8Nul0032 begin');
      console.info('testDecodeUtf8Nul0032 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0x41, 0x00, 0x42]));
      expect(outcome.text.length).assertEqual(3);
      expect(outcome.text.charCodeAt(1)).assertEqual(0);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0033
     * @tc.name      testDecodeUtf8BomKept0033
     * @tc.desc      plain decode keeps the bom character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8BomKept0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8BomKept0033 begin');
      console.info('testDecodeUtf8BomKept0033 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xEF, 0xBB, 0xBF, 0x41]));
      expect(outcome.text.length).assertEqual(2);
      expect(outcome.text.charCodeAt(0)).assertEqual(0xFEFF);
      expect(outcome.text.charAt(1)).assertEqual('A');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0034
     * @tc.name      testDecodeUtf8PrefixLengthZero0034
     * @tc.desc      zero prefix decodes to empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixLengthZero0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixLengthZero0034 begin');
      console.info('testDecodeUtf8PrefixLengthZero0034 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(asciiBytes('ABC'), 0, false, false);
      expect(outcome.text).assertEqual('');
      expect(outcome.bytesConsumed).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0035
     * @tc.name      testDecodeUtf8PrefixNegative0035
     * @tc.desc      negative length is clamped to zero
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixNegative0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixNegative0035 begin');
      console.info('testDecodeUtf8PrefixNegative0035 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(asciiBytes('ABC'), -5, false, false);
      expect(outcome.text).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0036
     * @tc.name      testDecodeUtf8PrefixOverflow0036
     * @tc.desc      length beyond buffer is clamped to buffer size
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixOverflow0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixOverflow0036 begin');
      console.info('testDecodeUtf8PrefixOverflow0036 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(asciiBytes('ABCD'), 99, false, false);
      expect(outcome.text).assertEqual('ABCD');
      expect(outcome.bytesConsumed).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0037
     * @tc.name      testDecodeUtf8PrefixPartial0037
     * @tc.desc      prefix stops in the middle of the buffer
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixPartial0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixPartial0037 begin');
      console.info('testDecodeUtf8PrefixPartial0037 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(asciiBytes('ABCD'), 2, false, false);
      expect(outcome.text).assertEqual('AB');
      expect(outcome.bytesConsumed).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0038
     * @tc.name      testDecodeUtf8PrefixSkipBom0038
     * @tc.desc      skip bom removes the bom character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixSkipBom0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixSkipBom0038 begin');
      console.info('testDecodeUtf8PrefixSkipBom0038 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(toBytes([0xEF, 0xBB, 0xBF, 0x41]), 4, true, false);
      expect(outcome.text).assertEqual('A');
      expect(outcome.bytesConsumed).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0039
     * @tc.name      testDecodeUtf8PrefixKeepBom0039
     * @tc.desc      keep bom when skip flag is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixKeepBom0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixKeepBom0039 begin');
      console.info('testDecodeUtf8PrefixKeepBom0039 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(toBytes([0xEF, 0xBB, 0xBF, 0x41]), 4, false, false);
      expect(outcome.text.length).assertEqual(2);
      expect(outcome.text.charCodeAt(0)).assertEqual(0xFEFF);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0040
     * @tc.name      testDecodeUtf8PrefixPartialBom0040
     * @tc.desc      two bom bytes inside prefix are not stripped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixPartialBom0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixPartialBom0040 begin');
      console.info('testDecodeUtf8PrefixPartialBom0040 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(toBytes([0xEF, 0xBB]), 2, true, false);
      expect(outcome.text).assertEqual('\uFFFD\uFFFD');
      expect(outcome.replacements).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0041
     * @tc.name      testDecodeUtf8PrefixBomBeyondLength0041
     * @tc.desc      bom outside the prefix length is not skipped
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixBomBeyondLength0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixBomBeyondLength0041 begin');
      console.info('testDecodeUtf8PrefixBomBeyondLength0041 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(toBytes([0xEF, 0xBB, 0xBF, 0x41]), 2, true, false);
      expect(outcome.text).assertEqual('\uFFFD\uFFFD');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0042
     * @tc.name      testDecodeUtf8PrefixStopAtNul0042
     * @tc.desc      stop at nul leaves trailing bytes unread
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixStopAtNul0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixStopAtNul0042 begin');
      console.info('testDecodeUtf8PrefixStopAtNul0042 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(toBytes([0x41, 0x42, 0x00, 0x43]), 4, false, true);
      expect(outcome.text).assertEqual('AB');
      expect(outcome.bytesConsumed).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0043
     * @tc.name      testDecodeUtf8PrefixNulKept0043
     * @tc.desc      nul is decoded when stop flag is false
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixNulKept0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixNulKept0043 begin');
      console.info('testDecodeUtf8PrefixNulKept0043 begin');
      const outcome: DecodeOutcome = decodeUtf8Prefix(toBytes([0x41, 0x00, 0x42]), 3, false, false);
      expect(outcome.text.length).assertEqual(3);
      expect(outcome.bytesConsumed).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0044
     * @tc.name      testDecodeUtf8PrefixFixedBuffer0044
     * @tc.desc      fixed size buffer decodes only the meaningful prefix
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8PrefixFixedBuffer0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8PrefixFixedBuffer0044 begin');
      console.info('testDecodeUtf8PrefixFixedBuffer0044 begin');
      const buffer: Uint8Array = new Uint8Array(8);
      buffer[0] = 0x48;
      buffer[1] = 0x69;
      const outcome: DecodeOutcome = decodeUtf8Prefix(buffer, 8, false, true);
      expect(outcome.text).assertEqual('Hi');
      expect(outcome.bytesConsumed).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0045
     * @tc.name      testEncodeUtf8Empty0045
     * @tc.desc      empty text encodes to zero bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8Empty0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8Empty0045 begin');
      console.info('testEncodeUtf8Empty0045 begin');
      const actual: Uint8Array = encodeUtf8('');
      expect(actual.length).assertEqual(0);
      expect(joinBytes(actual)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0046
     * @tc.name      testEncodeUtf8Ascii0046
     * @tc.desc      single ascii character encodes to one byte
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8Ascii0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8Ascii0046 begin');
      console.info('testEncodeUtf8Ascii0046 begin');
      expect(joinBytes(encodeUtf8('A'))).assertEqual('65');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0047
     * @tc.name      testEncodeUtf8Chinese0047
     * @tc.desc      two chinese characters encode to six bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8Chinese0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8Chinese0047 begin');
      console.info('testEncodeUtf8Chinese0047 begin');
      expect(joinBytes(encodeUtf8('你好'))).assertEqual('228,189,160,229,165,189');
      expect(encodeUtf8('你好').length).assertEqual(6);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0048
     * @tc.name      testEncodeUtf8Emoji0048
     * @tc.desc      emoji encodes to four bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8Emoji0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8Emoji0048 begin');
      console.info('testEncodeUtf8Emoji0048 begin');
      expect(joinBytes(encodeUtf8('😀'))).assertEqual('240,159,152,128');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0049
     * @tc.name      testEncodeUtf8LoneHigh0049
     * @tc.desc      lone high surrogate becomes the replacement character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8LoneHigh0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8LoneHigh0049 begin');
      console.info('testEncodeUtf8LoneHigh0049 begin');
      const text: string = String.fromCharCode(0xD83D);
      expect(joinBytes(encodeUtf8(text))).assertEqual('239,191,189');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0050
     * @tc.name      testEncodeUtf8LoneLow0050
     * @tc.desc      lone low surrogate becomes the replacement character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8LoneLow0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8LoneLow0050 begin');
      console.info('testEncodeUtf8LoneLow0050 begin');
      const text: string = String.fromCharCode(0xDE00);
      expect(joinBytes(encodeUtf8(text))).assertEqual('239,191,189');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0051
     * @tc.name      testEncodeUtf8TwoByteMin0051
     * @tc.desc      U+0080 encodes to C2 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8TwoByteMin0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8TwoByteMin0051 begin');
      console.info('testEncodeUtf8TwoByteMin0051 begin');
      const text: string = String.fromCharCode(0x80);
      expect(joinBytes(encodeUtf8(text))).assertEqual('194,128');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0052
     * @tc.name      testEncodeUtf8TwoByteMax0052
     * @tc.desc      U+07FF encodes to DF BF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8TwoByteMax0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8TwoByteMax0052 begin');
      console.info('testEncodeUtf8TwoByteMax0052 begin');
      const text: string = String.fromCharCode(0x7FF);
      expect(joinBytes(encodeUtf8(text))).assertEqual('223,191');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0053
     * @tc.name      testEncodeUtf8ThreeByteMin0053
     * @tc.desc      U+0800 encodes to E0 A0 80
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8ThreeByteMin0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8ThreeByteMin0053 begin');
      console.info('testEncodeUtf8ThreeByteMin0053 begin');
      const text: string = String.fromCharCode(0x800);
      expect(joinBytes(encodeUtf8(text))).assertEqual('224,160,128');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0054
     * @tc.name      testEncodeUtf8ThreeByteMax0054
     * @tc.desc      U+FFFF encodes to EF BF BF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8ThreeByteMax0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8ThreeByteMax0054 begin');
      console.info('testEncodeUtf8ThreeByteMax0054 begin');
      const text: string = String.fromCharCode(0xFFFF);
      expect(joinBytes(encodeUtf8(text))).assertEqual('239,191,191');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0055
     * @tc.name      testEncodeUtf8FourByteMax0055
     * @tc.desc      U+10FFFF encodes to F4 8F BF BF
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeUtf8FourByteMax0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeUtf8FourByteMax0055 begin');
      console.info('testEncodeUtf8FourByteMax0055 begin');
      const text: string = String.fromCharCode(0xDBFF, 0xDFFF);
      expect(joinBytes(encodeUtf8(text))).assertEqual('244,143,191,191');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0056
     * @tc.name      testEncodeDecodeRoundTrip0056
     * @tc.desc      mixed text survives an encode decode round trip
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testEncodeDecodeRoundTrip0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testEncodeDecodeRoundTrip0056 begin');
      console.info('testEncodeDecodeRoundTrip0056 begin');
      const source: string = 'abc你好😀';
      const outcome: DecodeOutcome = decodeUtf8(encodeUtf8(source));
      expect(outcome.text).assertEqual(source);
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0057
     * @tc.name      testByteLengthEmpty0057
     * @tc.desc      empty text has zero byte length
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByteLengthEmpty0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testByteLengthEmpty0057 begin');
      console.info('testByteLengthEmpty0057 begin');
      expect(utf8ByteLength('')).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0058
     * @tc.name      testByteLengthAscii0058
     * @tc.desc      ascii text length equals its byte length
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByteLengthAscii0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testByteLengthAscii0058 begin');
      console.info('testByteLengthAscii0058 begin');
      expect(utf8ByteLength('Hello')).assertEqual(5);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0059
     * @tc.name      testByteLengthChinese0059
     * @tc.desc      two chinese characters take six bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByteLengthChinese0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testByteLengthChinese0059 begin');
      console.info('testByteLengthChinese0059 begin');
      expect(utf8ByteLength('你好')).assertEqual(6);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0060
     * @tc.name      testByteLengthEmoji0060
     * @tc.desc      emoji takes four bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByteLengthEmoji0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testByteLengthEmoji0060 begin');
      console.info('testByteLengthEmoji0060 begin');
      expect(utf8ByteLength('😀')).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0061
     * @tc.name      testByteLengthMatchesEncoding0061
     * @tc.desc      byte length always matches encoded length
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testByteLengthMatchesEncoding0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testByteLengthMatchesEncoding0061 begin');
      console.info('testByteLengthMatchesEncoding0061 begin');
      const samples: string[] = ['', 'a', '你好', '😀', 'a你好😀z'];
      for (let index = 0; index < samples.length; index++) {
        expect(utf8ByteLength(samples[index])).assertEqual(encodeUtf8(samples[index]).length);
      }
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0062
     * @tc.name      testTruncateZero0062
     * @tc.desc      zero budget returns empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateZero0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateZero0062 begin');
      console.info('testTruncateZero0062 begin');
      expect(truncateToByteLength('abc', 0)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0063
     * @tc.name      testTruncateNegative0063
     * @tc.desc      negative budget returns empty text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateNegative0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateNegative0063 begin');
      console.info('testTruncateNegative0063 begin');
      expect(truncateToByteLength('abc', -1)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0064
     * @tc.name      testTruncateExact0064
     * @tc.desc      budget equal to text length keeps all text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateExact0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateExact0064 begin');
      console.info('testTruncateExact0064 begin');
      expect(truncateToByteLength('abc', 3)).assertEqual('abc');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0065
     * @tc.name      testTruncateAscii0065
     * @tc.desc      ascii text is cut at the budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateAscii0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateAscii0065 begin');
      console.info('testTruncateAscii0065 begin');
      expect(truncateToByteLength('abcdef', 2)).assertEqual('ab');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0066
     * @tc.name      testTruncateChinesePartial0066
     * @tc.desc      chinese character is not split for a small budget
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateChinesePartial0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateChinesePartial0066 begin');
      console.info('testTruncateChinesePartial0066 begin');
      expect(truncateToByteLength('你好', 2)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0067
     * @tc.name      testTruncateChineseOne0067
     * @tc.desc      four byte budget fits exactly one chinese character
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateChineseOne0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateChineseOne0067 begin');
      console.info('testTruncateChineseOne0067 begin');
      expect(truncateToByteLength('你好', 4)).assertEqual('你');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0068
     * @tc.name      testTruncateEmojiPartial0068
     * @tc.desc      emoji is dropped when the budget is below four bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEmojiPartial0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEmojiPartial0068 begin');
      console.info('testTruncateEmojiPartial0068 begin');
      expect(truncateToByteLength('😀', 3)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0069
     * @tc.name      testTruncateEmojiExact0069
     * @tc.desc      four byte budget keeps the emoji
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEmojiExact0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEmojiExact0069 begin');
      console.info('testTruncateEmojiExact0069 begin');
      expect(truncateToByteLength('😀a', 4)).assertEqual('😀');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0070
     * @tc.name      testTruncateEmojiAndAscii0070
     * @tc.desc      five byte budget keeps emoji and following ascii
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateEmojiAndAscii0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateEmojiAndAscii0070 begin');
      console.info('testTruncateEmojiAndAscii0070 begin');
      expect(truncateToByteLength('😀a', 5)).assertEqual('😀a');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0071
     * @tc.name      testTruncateNoSplitSurrogate0071
     * @tc.desc      truncation never leaves a lone surrogate
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateNoSplitSurrogate0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateNoSplitSurrogate0071 begin');
      console.info('testTruncateNoSplitSurrogate0071 begin');
      const result: string = truncateToByteLength('😀😀', 6);
      expect(result).assertEqual('😀');
      expect(result.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0072
     * @tc.name      testCodePointEmpty0072
     * @tc.desc      empty text has zero code points
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCodePointEmpty0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCodePointEmpty0072 begin');
      console.info('testCodePointEmpty0072 begin');
      expect(countCodePoints('')).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0073
     * @tc.name      testCodePointAscii0073
     * @tc.desc      ascii code point count matches length
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCodePointAscii0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCodePointAscii0073 begin');
      console.info('testCodePointAscii0073 begin');
      expect(countCodePoints('abc')).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0074
     * @tc.name      testCodePointChinese0074
     * @tc.desc      chinese characters count by code point
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCodePointChinese0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCodePointChinese0074 begin');
      console.info('testCodePointChinese0074 begin');
      expect(countCodePoints('你好')).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0075
     * @tc.name      testCodePointEmoji0075
     * @tc.desc      one emoji is one code point but two code units
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCodePointEmoji0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCodePointEmoji0075 begin');
      console.info('testCodePointEmoji0075 begin');
      expect(countCodePoints('😀')).assertEqual(1);
      expect('😀'.length).assertEqual(2);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0076
     * @tc.name      testCodePointMixed0076
     * @tc.desc      mixed text counts three code points
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCodePointMixed0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCodePointMixed0076 begin');
      console.info('testCodePointMixed0076 begin');
      expect(countCodePoints('a😀b')).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0077
     * @tc.name      testCodePointLoneSurrogate0077
     * @tc.desc      lone surrogate counts as one code point
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testCodePointLoneSurrogate0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testCodePointLoneSurrogate0077 begin');
      console.info('testCodePointLoneSurrogate0077 begin');
      expect(countCodePoints(String.fromCharCode(0xD83D))).assertEqual(1);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0078
     * @tc.name      testAsciiEmpty0078
     * @tc.desc      empty text is ascii
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiEmpty0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAsciiEmpty0078 begin');
      console.info('testAsciiEmpty0078 begin');
      expect(isAsciiOnly('')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0079
     * @tc.name      testAsciiTrue0079
     * @tc.desc      plain ascii text is detected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiTrue0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAsciiTrue0079 begin');
      console.info('testAsciiTrue0079 begin');
      expect(isAsciiOnly('abcXYZ019')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0080
     * @tc.name      testAsciiChinese0080
     * @tc.desc      chinese text is not ascii
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiChinese0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAsciiChinese0080 begin');
      console.info('testAsciiChinese0080 begin');
      expect(isAsciiOnly('a你')).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0081
     * @tc.name      testAsciiHighByte0081
     * @tc.desc      code unit above 0x7F is not ascii
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiHighByte0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAsciiHighByte0081 begin');
      console.info('testAsciiHighByte0081 begin');
      expect(isAsciiOnly('a' + String.fromCharCode(0x80))).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0082
     * @tc.name      testAsciiControl0082
     * @tc.desc      control characters below 0x80 are still ascii
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testAsciiControl0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testAsciiControl0082 begin');
      console.info('testAsciiControl0082 begin');
      expect(isAsciiOnly('a\nb\tc')).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0083
     * @tc.name      testNormalizeEolEmpty0083
     * @tc.desc      empty text stays empty
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEolEmpty0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEolEmpty0083 begin');
      console.info('testNormalizeEolEmpty0083 begin');
      expect(normalizeEol('', false)).assertEqual('');
      expect(normalizeEol('', true)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0084
     * @tc.name      testNormalizeEolCrlfToLf0084
     * @tc.desc      crlf becomes lf
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEolCrlfToLf0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEolCrlfToLf0084 begin');
      console.info('testNormalizeEolCrlfToLf0084 begin');
      expect(normalizeEol('a\r\nb', false)).assertEqual('a\nb');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0085
     * @tc.name      testNormalizeEolCrToLf0085
     * @tc.desc      lone cr becomes lf
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEolCrToLf0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEolCrToLf0085 begin');
      console.info('testNormalizeEolCrToLf0085 begin');
      expect(normalizeEol('a\rb', false)).assertEqual('a\nb');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0086
     * @tc.name      testNormalizeEolLfToCrlf0086
     * @tc.desc      lf becomes crlf when requested
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEolLfToCrlf0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEolLfToCrlf0086 begin');
      console.info('testNormalizeEolLfToCrlf0086 begin');
      expect(normalizeEol('a\nb', true)).assertEqual('a\r\nb');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0087
     * @tc.name      testNormalizeEolMixed0087
     * @tc.desc      mixed endings normalize to a single style
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEolMixed0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEolMixed0087 begin');
      console.info('testNormalizeEolMixed0087 begin');
      expect(normalizeEol('a\r\nb\rc\nd', false)).assertEqual('a\nb\nc\nd');
      expect(normalizeEol('a\r\nb\rc\nd', true)).assertEqual('a\r\nb\r\nc\r\nd');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0088
     * @tc.name      testNormalizeEolIdempotent0088
     * @tc.desc      normalized crlf text stays unchanged
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testNormalizeEolIdempotent0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testNormalizeEolIdempotent0088 begin');
      console.info('testNormalizeEolIdempotent0088 begin');
      const source: string = 'a\r\nb\r\n';
      expect(normalizeEol(source, true)).assertEqual(source);
      expect(normalizeEol(normalizeEol(source, false), false)).assertEqual('a\nb\n');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0089
     * @tc.name      testSplitLinesEmpty0089
     * @tc.desc      empty text has no lines
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesEmpty0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesEmpty0089 begin');
      console.info('testSplitLinesEmpty0089 begin');
      expect(splitLines('').length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0090
     * @tc.name      testSplitLinesSingle0090
     * @tc.desc      text without newline is one line
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesSingle0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesSingle0090 begin');
      console.info('testSplitLinesSingle0090 begin');
      expect(joinTexts(splitLines('abc'))).assertEqual('abc');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0091
     * @tc.name      testSplitLinesLf0091
     * @tc.desc      lf separates two lines
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesLf0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesLf0091 begin');
      console.info('testSplitLinesLf0091 begin');
      expect(joinTexts(splitLines('a\nb'))).assertEqual('a|b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0092
     * @tc.name      testSplitLinesTrailing0092
     * @tc.desc      trailing newline does not create a trailing empty line
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesTrailing0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesTrailing0092 begin');
      console.info('testSplitLinesTrailing0092 begin');
      const lines: string[] = splitLines('a\nb\n');
      expect(lines.length).assertEqual(2);
      expect(joinTexts(lines)).assertEqual('a|b');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0093
     * @tc.name      testSplitLinesCrlf0093
     * @tc.desc      crlf separates lines without stray carriage returns
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesCrlf0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesCrlf0093 begin');
      console.info('testSplitLinesCrlf0093 begin');
      expect(joinTexts(splitLines('a\r\nb\r\nc'))).assertEqual('a|b|c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0094
     * @tc.name      testSplitLinesEmptyLines0094
     * @tc.desc      consecutive newlines keep inner empty lines
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesEmptyLines0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesEmptyLines0094 begin');
      console.info('testSplitLinesEmptyLines0094 begin');
      const lines: string[] = splitLines('a\n\nb');
      expect(lines.length).assertEqual(3);
      expect(lines[1]).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0095
     * @tc.name      testSplitLinesOnlyNewline0095
     * @tc.desc      a single newline yields one empty line
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesOnlyNewline0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesOnlyNewline0095 begin');
      console.info('testSplitLinesOnlyNewline0095 begin');
      const lines: string[] = splitLines('\n');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0096
     * @tc.name      testSplitLinesOnlyCr0096
     * @tc.desc      a lone carriage return also yields one empty line
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesOnlyCr0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesOnlyCr0096 begin');
      console.info('testSplitLinesOnlyCr0096 begin');
      const lines: string[] = splitLines('\r');
      expect(lines.length).assertEqual(1);
      expect(lines[0]).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0097
     * @tc.name      testSplitLinesCrOnly0097
     * @tc.desc      lone carriage returns separate lines
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesCrOnly0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesCrOnly0097 begin');
      console.info('testSplitLinesCrOnly0097 begin');
      expect(joinTexts(splitLines('a\rb\rc'))).assertEqual('a|b|c');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0098
     * @tc.name      testSplitLinesChinese0098
     * @tc.desc      chinese lines are preserved
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testSplitLinesChinese0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testSplitLinesChinese0098 begin');
      console.info('testSplitLinesChinese0098 begin');
      expect(joinTexts(splitLines('你好\n世界'))).assertEqual('你好|世界');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0099
     * @tc.name      testToHexEmpty0099
     * @tc.desc      empty bytes produce empty hex
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToHexEmpty0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToHexEmpty0099 begin');
      console.info('testToHexEmpty0099 begin');
      expect(toHex(toBytes([]), false)).assertEqual('');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0100
     * @tc.name      testToHexLower0100
     * @tc.desc      bytes convert to lowercase hex with padding
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToHexLower0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToHexLower0100 begin');
      console.info('testToHexLower0100 begin');
      expect(toHex(toBytes([0x00, 0x0F, 0x10, 0xFF]), false)).assertEqual('000f10ff');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0101
     * @tc.name      testToHexUpper0101
     * @tc.desc      uppercase hex option is honored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToHexUpper0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToHexUpper0101 begin');
      console.info('testToHexUpper0101 begin');
      expect(toHex(toBytes([0x00, 0x0F, 0x10, 0xFF]), true)).assertEqual('000F10FF');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0102
     * @tc.name      testToHexBom0102
     * @tc.desc      bom bytes convert to efbbbf
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testToHexBom0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testToHexBom0102 begin');
      console.info('testToHexBom0102 begin');
      expect(toHex(toBytes(BOM), false)).assertEqual('efbbbf');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0103
     * @tc.name      testFromHexEmpty0103
     * @tc.desc      empty hex is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexEmpty0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexEmpty0103 begin');
      console.info('testFromHexEmpty0103 begin');
      const outcome: HexOutcome = fromHex('');
      expect(outcome.valid).assertFalse();
      expect(outcome.bytes.length).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0104
     * @tc.name      testFromHexOdd0104
     * @tc.desc      odd length hex is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexOdd0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexOdd0104 begin');
      console.info('testFromHexOdd0104 begin');
      expect(fromHex('414').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0105
     * @tc.name      testFromHexPrefix0105
     * @tc.desc      hex with 0x prefix decodes correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexPrefix0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexPrefix0105 begin');
      console.info('testFromHexPrefix0105 begin');
      const outcome: HexOutcome = fromHex('0x4142');
      expect(outcome.valid).assertTrue();
      expect(joinBytes(outcome.bytes)).assertEqual('65,66');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0106
     * @tc.name      testFromHexUpperPrefix0106
     * @tc.desc      uppercase 0X prefix is accepted
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexUpperPrefix0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexUpperPrefix0106 begin');
      console.info('testFromHexUpperPrefix0106 begin');
      const outcome: HexOutcome = fromHex('0X41');
      expect(outcome.valid).assertTrue();
      expect(outcome.bytes[0]).assertEqual(0x41);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0107
     * @tc.name      testFromHexWhitespace0107
     * @tc.desc      surrounding whitespace is ignored
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexWhitespace0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexWhitespace0107 begin');
      console.info('testFromHexWhitespace0107 begin');
      const outcome: HexOutcome = fromHex('  41  ');
      expect(outcome.valid).assertTrue();
      expect(outcome.bytes[0]).assertEqual(0x41);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0108
     * @tc.name      testFromHexInvalidChar0108
     * @tc.desc      non hex characters are rejected
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexInvalidChar0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexInvalidChar0108 begin');
      console.info('testFromHexInvalidChar0108 begin');
      expect(fromHex('4G').valid).assertFalse();
      expect(fromHex('zz').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0109
     * @tc.name      testFromHexEmptyBody0109
     * @tc.desc      prefix without body is invalid
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexEmptyBody0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexEmptyBody0109 begin');
      console.info('testFromHexEmptyBody0109 begin');
      expect(fromHex('0x').valid).assertFalse();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0110
     * @tc.name      testFromHexLower0110
     * @tc.desc      lowercase hex decodes correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexLower0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexLower0110 begin');
      console.info('testFromHexLower0110 begin');
      const outcome: HexOutcome = fromHex('efbbbf');
      expect(outcome.valid).assertTrue();
      expect(joinBytes(outcome.bytes)).assertEqual('239,187,191');
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0111
     * @tc.name      testFromHexRoundTrip0111
     * @tc.desc      hex round trip preserves bytes
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexRoundTrip0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexRoundTrip0111 begin');
      console.info('testFromHexRoundTrip0111 begin');
      const source: Uint8Array = toBytes([0x00, 0x7F, 0x80, 0xFF]);
      const decoded: HexOutcome = fromHex(toHex(source, true));
      expect(decoded.valid).assertTrue();
      expect(joinBytes(decoded.bytes)).assertEqual(joinBytes(source));
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0112
     * @tc.name      testFromHexZeroByte0112
     * @tc.desc      single zero byte decodes correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testFromHexZeroByte0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testFromHexZeroByte0112 begin');
      console.info('testFromHexZeroByte0112 begin');
      const outcome: HexOutcome = fromHex('00');
      expect(outcome.valid).assertTrue();
      expect(outcome.bytes.length).assertEqual(1);
      expect(outcome.bytes[0]).assertEqual(0);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0113
     * @tc.name      testDecodeThenEncodeChinese0113
     * @tc.desc      chinese bytes decode and re-encode identically
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeThenEncodeChinese0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeThenEncodeChinese0113 begin');
      console.info('testDecodeThenEncodeChinese0113 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes(CHINESE_BYTES));
      expect(joinBytes(encodeUtf8(outcome.text))).assertEqual(joinBytes(toBytes(CHINESE_BYTES)));
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0114
     * @tc.name      testDecodeThenEncodeEmoji0114
     * @tc.desc      emoji bytes decode and re-encode identically
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeThenEncodeEmoji0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeThenEncodeEmoji0114 begin');
      console.info('testDecodeThenEncodeEmoji0114 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes(SMILE_BYTES));
      expect(joinBytes(encodeUtf8(outcome.text))).assertEqual(joinBytes(toBytes(SMILE_BYTES)));
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0115
     * @tc.name      testPrefixWithStopNulAndBom0115
     * @tc.desc      bom skipping and nul stopping can be combined
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testPrefixWithStopNulAndBom0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testPrefixWithStopNulAndBom0115 begin');
      console.info('testPrefixWithStopNulAndBom0115 begin');
      const source: Uint8Array = toBytes([0xEF, 0xBB, 0xBF, 0x41, 0x00, 0x42]);
      const outcome: DecodeOutcome = decodeUtf8Prefix(source, 6, true, true);
      expect(outcome.text).assertEqual('A');
      expect(outcome.bytesConsumed).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0116
     * @tc.name      testDecodeUtf8TabAndNewline0116
     * @tc.desc      control characters are preserved in valid text
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8TabAndNewline0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8TabAndNewline0116 begin');
      console.info('testDecodeUtf8TabAndNewline0116 begin');
      const outcome: DecodeOutcome = decodeUtf8(asciiBytes('a\tb\nc'));
      expect(outcome.text).assertEqual('a\tb\nc');
      expect(outcome.valid).assertTrue();
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0117
     * @tc.name      testDecodeUtf8FourContinuationBytes0117
     * @tc.desc      four continuation bytes yield four replacements
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8FourContinuationBytes0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8FourContinuationBytes0117 begin');
      console.info('testDecodeUtf8FourContinuationBytes0117 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0x80, 0x81, 0x82, 0x83]));
      expect(outcome.replacements).assertEqual(4);
      expect(outcome.text.length).assertEqual(4);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0118
     * @tc.name      testDecodeUtf8AsciiAfterInvalid0118
     * @tc.desc      ascii is decoded after an invalid byte
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testDecodeUtf8AsciiAfterInvalid0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testDecodeUtf8AsciiAfterInvalid0118 begin');
      console.info('testDecodeUtf8AsciiAfterInvalid0118 begin');
      const outcome: DecodeOutcome = decodeUtf8(toBytes([0xFF, 0x41, 0x42]));
      expect(outcome.text).assertEqual('\uFFFDAB');
      expect(outcome.replacements).assertEqual(1);
      expect(outcome.bytesConsumed).assertEqual(3);
    })

    /**
     * @tc.number    SUB_DLP_MANAGER_TEXTCORE_0119
     * @tc.name      testTruncateChineseAsciiMix0119
     * @tc.desc      truncation counts multibyte characters correctly
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testTruncateChineseAsciiMix0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      console.info('testTruncateChineseAsciiMix0119 begin');
      console.info('testTruncateChineseAsciiMix0119 begin');
      expect(truncateToByteLength('你a好', 4)).assertEqual('你a');
      expect(truncateToByteLength('你a好', 3)).assertEqual('你');
    })
  });
}
