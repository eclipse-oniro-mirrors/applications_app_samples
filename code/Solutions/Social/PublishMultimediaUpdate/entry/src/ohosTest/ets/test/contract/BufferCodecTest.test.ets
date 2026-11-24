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

import { describe, it, expect, beforeAll } from '@ohos/hypium';
import buffer from '@ohos.buffer';
import Logger from '../Logger';
import { BUNDLE, TAG } from '../common/TestConstant';
import { yieldToEventLoop } from '../common/TestYield';
/**
 * Binary payload handling through the buffer module.
 * A picked image or video is moved as raw bytes before it becomes a data URI.
 * These cases pin the byte level contracts of that move: size, encoding
 * round trips, fill, endianness and the shared memory view.
 */
export default function bufferCodecTest() {
  describe('BufferCodecTest', () => {
    beforeAll(async (): Promise<void> => {
      await yieldToEventLoop();
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0100
     * @tc.name AsciiStringByteLength001
     * @tc.desc Verify one ascii character occupies one byte
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AsciiStringByteLength_001', 0, (): void => {
      Logger.info(TAG, 'AsciiStringByteLength_001 begin');
      const bytes: buffer.Buffer = buffer.from('publish', 'utf-8');
      expect(bytes.length).assertEqual(7);
      Logger.info(TAG, 'AsciiStringByteLength_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0200
     * @tc.name CjkStringByteLength002
     * @tc.desc Verify a CJK character occupies three UTF-8 bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CjkStringByteLength_002', 0, (): void => {
      Logger.info(TAG, 'CjkStringByteLength_002 begin');
      const measured: number = buffer.byteLength('来杯香槟', 'utf-8');
      const bytes: buffer.Buffer = buffer.from('来杯香槟', 'utf-8');
      expect(measured).assertEqual(bytes.length);
      expect(bytes.length).assertEqual(12);
      Logger.info(TAG, 'CjkStringByteLength_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0300
     * @tc.name ArrayInputKeepsOrder003
     * @tc.desc Verify a byte array is stored in the given order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ArrayInputKeepsOrder_003', 0, (): void => {
      Logger.info(TAG, 'ArrayInputKeepsOrder_003 begin');
      const bytes: buffer.Buffer = buffer.from([1, 2, 3]);
      expect(bytes.length).assertEqual(3);
      expect(bytes.readUInt8(1)).assertEqual(2);
      Logger.info(TAG, 'ArrayInputKeepsOrder_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0400
     * @tc.name HexEncoding004
     * @tc.desc Verify text turns into its lowercase hex digits
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HexEncoding_004', 0, (): void => {
      Logger.info(TAG, 'HexEncoding_004 begin');
      const hex: string = buffer.from('abc', 'utf-8').toString('hex');
      expect(hex).assertEqual('616263');
      Logger.info(TAG, 'HexEncoding_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0500
     * @tc.name HexDecoding005
     * @tc.desc Verify hex digits decode back to the original text
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'HexDecoding_005', 0, (): void => {
      Logger.info(TAG, 'HexDecoding_005 begin');
      const text: string = buffer.from('616263', 'hex').toString('utf-8');
      expect(text).assertEqual('abc');
      Logger.info(TAG, 'HexDecoding_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0600
     * @tc.name Base64Encoding006
     * @tc.desc Verify text turns into the standard base64 alphabet
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Base64Encoding_006', 0, (): void => {
      Logger.info(TAG, 'Base64Encoding_006 begin');
      const encoded: string = buffer.from('abc', 'utf-8').toString('base64');
      expect(encoded).assertEqual('YWJj');
      Logger.info(TAG, 'Base64Encoding_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0700
     * @tc.name Base64Decoding007
     * @tc.desc Verify base64 text decodes back to the original bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'Base64Decoding_007', 0, (): void => {
      Logger.info(TAG, 'Base64Decoding_007 begin');
      const original: string = 'abc';
      const encoded: string = buffer.from(original, 'utf-8').toString('base64');
      const decoded: string = buffer.from(encoded, 'base64').toString('utf-8');
      expect(decoded).assertEqual(original);
      expect(encoded).assertEqual('YWJj');
      Logger.info(TAG, 'Base64Decoding_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0800
     * @tc.name AllocIsZeroFilled008
     * @tc.desc Verify an allocated buffer starts with zero bytes
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllocIsZeroFilled_008', 0, (): void => {
      Logger.info(TAG, 'AllocIsZeroFilled_008 begin');
      const bytes: buffer.Buffer = buffer.alloc(4);
      expect(bytes.toString('hex')).assertEqual('00000000');
      Logger.info(TAG, 'AllocIsZeroFilled_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_0900
     * @tc.name AllocRepeatsFillText009
     * @tc.desc Verify the fill text is repeated until the buffer is full
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'AllocRepeatsFillText_009', 0, (): void => {
      Logger.info(TAG, 'AllocRepeatsFillText_009 begin');
      const bytes: buffer.Buffer = buffer.alloc(6, 'ab');
      expect(bytes.toString('utf-8')).assertEqual('ababab');
      Logger.info(TAG, 'AllocRepeatsFillText_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1000
     * @tc.name FillOverwritesEveryByte010
     * @tc.desc Verify filling with one byte value replaces the whole payload
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'FillOverwritesEveryByte_010', 0, (): void => {
      Logger.info(TAG, 'FillOverwritesEveryByte_010 begin');
      const bytes: buffer.Buffer = buffer.alloc(4);
      bytes.fill(0x41);
      expect(bytes.toString('utf-8')).assertEqual('AAAA');
      Logger.info(TAG, 'FillOverwritesEveryByte_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1100
     * @tc.name WriteReturnsByteCount011
     * @tc.desc Verify writing text returns the number of bytes stored
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'WriteReturnsByteCount_011', 0, (): void => {
      Logger.info(TAG, 'WriteReturnsByteCount_011 begin');
      const bytes: buffer.Buffer = buffer.alloc(8);
      const written: number = bytes.write('publish', 0, 7, 'utf-8');
      expect(written).assertEqual(7);
      expect(bytes.readUInt8(0)).assertEqual(0x70);
      Logger.info(TAG, 'WriteReturnsByteCount_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1200
     * @tc.name UInt8RoundTrip012
     * @tc.desc Verify a single byte survives a write and read cycle
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UInt8RoundTrip_012', 0, (): void => {
      Logger.info(TAG, 'UInt8RoundTrip_012 begin');
      const bytes: buffer.Buffer = buffer.alloc(2);
      bytes.writeUInt8(0x7F, 0);
      expect(bytes.readUInt8(0)).assertEqual(127);
      Logger.info(TAG, 'UInt8RoundTrip_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1300
     * @tc.name UInt16Endianness013
     * @tc.desc Verify the same bytes read as different values per byte order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'UInt16Endianness_013', 0, (): void => {
      Logger.info(TAG, 'UInt16Endianness_013 begin');
      const bytes: buffer.Buffer = buffer.alloc(2);
      bytes.writeUInt16BE(0x1234, 0);
      expect(bytes.readUInt16BE(0)).assertEqual(0x1234);
      expect(bytes.readUInt16LE(0)).assertEqual(0x3412);
      Logger.info(TAG, 'UInt16Endianness_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1400
     * @tc.name SubarraySharesBytes014
     * @tc.desc Verify a subarray view writes through to the original buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'SubarraySharesBytes_014', 0, (): void => {
      Logger.info(TAG, 'SubarraySharesBytes_014 begin');
      const source: buffer.Buffer = buffer.from('abcd', 'utf-8');
      const window: buffer.Buffer = source.subarray(0, 2);
      window.writeUInt8(0x5A, 0);
      expect(source.readUInt8(0)).assertEqual(0x5A);
      Logger.info(TAG, 'SubarraySharesBytes_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1500
     * @tc.name CopyMovesPayload015
     * @tc.desc Verify copying writes the payload at the start of the target
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CopyMovesPayload_015', 0, (): void => {
      Logger.info(TAG, 'CopyMovesPayload_015 begin');
      const source: buffer.Buffer = buffer.from('abc', 'utf-8');
      const target: buffer.Buffer = buffer.alloc(5);
      const copied: number = source.copy(target, 0);
      expect(copied).assertEqual(3);
      expect(target.toString('utf-8', 0, 3)).assertEqual('abc');
      Logger.info(TAG, 'CopyMovesPayload_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1600
     * @tc.name ConcatKeepsOrder016
     * @tc.desc Verify concatenation appends the parts in list order
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ConcatKeepsOrder_016', 0, (): void => {
      Logger.info(TAG, 'ConcatKeepsOrder_016 begin');
      const parts: Array<buffer.Buffer> = [buffer.from('ab', 'utf-8'), buffer.from('cd', 'utf-8')];
      const joined: buffer.Buffer = buffer.concat(parts);
      expect(joined.toString('utf-8')).assertEqual('abcd');
      Logger.info(TAG, 'ConcatKeepsOrder_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1700
     * @tc.name IndexOfFindsFirstOccurrence017
     * @tc.desc Verify the search reports the first matching byte position
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'IndexOfFindsFirstOccurrence_017', 0, (): void => {
      Logger.info(TAG, 'IndexOfFindsFirstOccurrence_017 begin');
      const bytes: buffer.Buffer = buffer.from('abcabc', 'utf-8');
      expect(bytes.indexOf('b')).assertEqual(1);
      Logger.info(TAG, 'IndexOfFindsFirstOccurrence_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1800
     * @tc.name ByteLengthMatchesBuffer018
     * @tc.desc Verify the length helper agrees with the constructed buffer
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'ByteLengthMatchesBuffer_018', 0, (): void => {
      Logger.info(TAG, 'ByteLengthMatchesBuffer_018 begin');
      const measured: number = buffer.byteLength('来杯香槟', 'utf-8');
      expect(measured).assertEqual(buffer.from('来杯香槟', 'utf-8').length);
      Logger.info(TAG, 'ByteLengthMatchesBuffer_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_1900
     * @tc.name EqualContentIsEqual019
     * @tc.desc Verify two buffers with the same bytes compare as equal
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'EqualContentIsEqual_019', 0, (): void => {
      Logger.info(TAG, 'EqualContentIsEqual_019 begin');
      const first: buffer.Buffer = buffer.from('abc', 'utf-8');
      const second: buffer.Buffer = buffer.from('abc', 'utf-8');
      expect(first.equals(second)).assertTrue();
      Logger.info(TAG, 'EqualContentIsEqual_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_PUBLISH_CONTRACT_BUFFER_2000
     * @tc.name CompareOrdersLexically020
     * @tc.desc Verify a smaller first byte makes the whole buffer compare lower
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'CompareOrdersLexically_020', 0, (): void => {
      Logger.info(TAG, 'CompareOrdersLexically_020 begin');
      const result: number = buffer.compare(buffer.from('a', 'utf-8'), buffer.from('b', 'utf-8'));
      expect(result).assertEqual(-1);
      Logger.info(TAG, 'CompareOrdersLexically_020 end');
    });
  });
}
