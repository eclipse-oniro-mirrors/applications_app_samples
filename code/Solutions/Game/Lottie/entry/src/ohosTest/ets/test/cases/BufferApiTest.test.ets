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


import { describe, it, expect } from '@ohos/hypium';
import buffer from '@ohos.buffer';
import Logger from '../../utils/Logger';
import { BUNDLE, SuiteTag } from '../common/TestConstant';

const TAG: string = SuiteTag.BUFFER;


export default function bufferApiTest(): void {
  describe('BufferApiTest', (): void => {

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0100
     * @tc.name bufferFromArrayLength001
     * @tc.desc Verify a buffer built from a byte array keeps the array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferFromArrayLength_001', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferFromArrayLength_001 begin');
      const data: buffer.Buffer = buffer.from([1, 2, 3, 4]);
      Logger.info(TAG, 'bufferFromArrayLength_001, check01=' + JSON.stringify(data.length));
      expect(data.length).assertEqual(4);
      Logger.info(TAG, 'bufferFromArrayLength_001 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0200
     * @tc.name bufferFromArrayValues002
     * @tc.desc Verify a buffer built from a byte array keeps the byte values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferFromArrayValues_002', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferFromArrayValues_002 begin');
      const data: buffer.Buffer = buffer.from([1, 2, 3, 4]);
      Logger.info(TAG, 'bufferFromArrayValues_002, check01=' + JSON.stringify(data.readUInt8(0)));
      expect(data.readUInt8(0)).assertEqual(1);
      Logger.info(TAG, 'bufferFromArrayValues_002, check02=' + JSON.stringify(data.readUInt8(3)));
      expect(data.readUInt8(3)).assertEqual(4);
      Logger.info(TAG, 'bufferFromArrayValues_002 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0300
     * @tc.name bufferFromBufferCopy003
     * @tc.desc Verify building from another buffer copies the payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferFromBufferCopy_003', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferFromBufferCopy_003 begin');
      const source: buffer.Buffer = buffer.from('abc');
      const copy: buffer.Buffer = buffer.from(source);
      Logger.info(TAG, 'bufferFromBufferCopy_003, check01=' + JSON.stringify(copy.length));
      expect(copy.length).assertEqual(3);
      Logger.info(TAG, 'bufferFromBufferCopy_003, check02=' + JSON.stringify(copy.toString('utf-8')));
      expect(copy.toString('utf-8')).assertEqual('abc');
      Logger.info(TAG, 'bufferFromBufferCopy_003 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0400
     * @tc.name bufferAllocZeroFilled004
     * @tc.desc Verify alloc zero initializes every byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferAllocZeroFilled_004', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferAllocZeroFilled_004 begin');
      const data: buffer.Buffer = buffer.alloc(4);
      Logger.info(TAG, 'bufferAllocZeroFilled_004, check01=' + JSON.stringify(data.length));
      expect(data.length).assertEqual(4);
      Logger.info(TAG, 'bufferAllocZeroFilled_004, check02=' + JSON.stringify(data.readUInt8(0)));
      expect(data.readUInt8(0)).assertEqual(0);
      Logger.info(TAG, 'bufferAllocZeroFilled_004, check03=' + JSON.stringify(data.readUInt8(3)));
      expect(data.readUInt8(3)).assertEqual(0);
      Logger.info(TAG, 'bufferAllocZeroFilled_004 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0500
     * @tc.name bufferAllocFillValue005
     * @tc.desc Verify alloc applies the requested fill value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferAllocFillValue_005', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferAllocFillValue_005 begin');
      const data: buffer.Buffer = buffer.alloc(3, 7);
      Logger.info(TAG, 'bufferAllocFillValue_005, check01=' + JSON.stringify(data.readUInt8(0)));
      expect(data.readUInt8(0)).assertEqual(7);
      Logger.info(TAG, 'bufferAllocFillValue_005, check02=' + JSON.stringify(data.readUInt8(2)));
      expect(data.readUInt8(2)).assertEqual(7);
      Logger.info(TAG, 'bufferAllocFillValue_005 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0600
     * @tc.name bufferByteLengthTypedArray006
     * @tc.desc Verify byteLength accepts a byte array and reports its size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferByteLengthTypedArray_006', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferByteLengthTypedArray_006 begin');
      const bytes: Uint8Array = new Uint8Array(5);
      const check01: number = buffer.byteLength(bytes);
      Logger.info(TAG, 'bufferByteLengthTypedArray_006, check01=' + JSON.stringify(check01));
      expect(check01).assertEqual(5);
      Logger.info(TAG, 'bufferByteLengthTypedArray_006 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0700
     * @tc.name bufferConcatLength007
     * @tc.desc Verify concat joins two buffers into one payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferConcatLength_007', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferConcatLength_007 begin');
      const first: buffer.Buffer = buffer.from('ab');
      const second: buffer.Buffer = buffer.from('cd');
      const parts: Array<buffer.Buffer> = [first, second];
      const joined: buffer.Buffer = buffer.concat(parts);
      Logger.info(TAG, 'bufferConcatLength_007, check01=' + JSON.stringify(joined.length));
      expect(joined.length).assertEqual(4);
      Logger.info(TAG, 'bufferConcatLength_007, check02=' + JSON.stringify(joined.toString('utf-8')));
      expect(joined.toString('utf-8')).assertEqual('abcd');
      Logger.info(TAG, 'bufferConcatLength_007 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0800
     * @tc.name bufferConcatEmpty008
     * @tc.desc Verify concat of an empty list yields an empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferConcatEmpty_008', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferConcatEmpty_008 begin');
      const parts: Array<buffer.Buffer> = [];
      const joined: buffer.Buffer = buffer.concat(parts);
      Logger.info(TAG, 'bufferConcatEmpty_008, check01=' + JSON.stringify(joined.length));
      expect(joined.length).assertEqual(0);
      Logger.info(TAG, 'bufferConcatEmpty_008 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_0900
     * @tc.name bufferCompareEqual009
     * @tc.desc Verify compare reports equality for identical payloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferCompareEqual_009', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferCompareEqual_009 begin');
      const first: buffer.Buffer = buffer.from('abc');
      const second: buffer.Buffer = buffer.from('abc');
      Logger.info(TAG, 'bufferCompareEqual_009, check01=' + JSON.stringify(buffer.compare(first, second)));
      expect(buffer.compare(first, second)).assertEqual(0);
      Logger.info(TAG, 'bufferCompareEqual_009 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1000
     * @tc.name bufferCompareLess010
     * @tc.desc Verify compare reports less for a smaller payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferCompareLess_010', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferCompareLess_010 begin');
      const first: buffer.Buffer = buffer.from('abc');
      const second: buffer.Buffer = buffer.from('abd');
      Logger.info(TAG, 'bufferCompareLess_010, check01=' + JSON.stringify(buffer.compare(first, second)));
      expect(buffer.compare(first, second)).assertEqual(-1);
      Logger.info(TAG, 'bufferCompareLess_010 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1100
     * @tc.name bufferCompareGreater011
     * @tc.desc Verify compare reports greater for a larger payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferCompareGreater_011', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferCompareGreater_011 begin');
      const first: buffer.Buffer = buffer.from('abd');
      const second: buffer.Buffer = buffer.from('abc');
      Logger.info(TAG, 'bufferCompareGreater_011, check01=' + JSON.stringify(buffer.compare(first, second)));
      expect(buffer.compare(first, second)).assertEqual(1);
      Logger.info(TAG, 'bufferCompareGreater_011 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1200
     * @tc.name bufferIsEncodingUtf8012
     * @tc.desc Verify isEncoding accepts the UTF-8 encoding name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferIsEncodingUtf8_012', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferIsEncodingUtf8_012 begin');
      const check01: boolean = buffer.isEncoding('utf8');
      Logger.info(TAG, 'bufferIsEncodingUtf8_012, check01=' + JSON.stringify(check01));
      expect(check01).assertTrue();
      Logger.info(TAG, 'bufferIsEncodingUtf8_012 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1300
     * @tc.name bufferIsEncodingUnknown013
     * @tc.desc Verify isEncoding rejects an unknown encoding name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferIsEncodingUnknown_013', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferIsEncodingUnknown_013 begin');
      const check01: boolean = buffer.isEncoding('lottie-encoding');
      Logger.info(TAG, 'bufferIsEncodingUnknown_013, check01=' + JSON.stringify(check01));
      expect(check01).assertFalse();
      Logger.info(TAG, 'bufferIsEncodingUnknown_013 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1400
     * @tc.name bufferSubarrayLength014
     * @tc.desc Verify subarray narrows the payload length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferSubarrayLength_014', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferSubarrayLength_014 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      const part: buffer.Buffer = data.subarray(1, 4);
      Logger.info(TAG, 'bufferSubarrayLength_014, check01=' + JSON.stringify(part.length));
      expect(part.length).assertEqual(3);
      Logger.info(TAG, 'bufferSubarrayLength_014 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1500
     * @tc.name bufferSubarrayContent015
     * @tc.desc Verify subarray keeps the selected bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferSubarrayContent_015', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferSubarrayContent_015 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      const part: buffer.Buffer = data.subarray(1, 4);
      Logger.info(TAG, 'bufferSubarrayContent_015, check01=' + JSON.stringify(part.toString('utf-8')));
      expect(part.toString('utf-8')).assertEqual('ott');
      Logger.info(TAG, 'bufferSubarrayContent_015 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1600
     * @tc.name bufferCopyReturnsCount016
     * @tc.desc Verify copy reports the number of copied bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferCopyReturnsCount_016', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferCopyReturnsCount_016 begin');
      const data: buffer.Buffer = buffer.from('abc');
      const target: buffer.Buffer = buffer.alloc(5);
      const copied: number = data.copy(target, 1);
      Logger.info(TAG, 'bufferCopyReturnsCount_016, check01=' + JSON.stringify(copied));
      expect(copied).assertEqual(3);
      Logger.info(TAG, 'bufferCopyReturnsCount_016 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1700
     * @tc.name bufferCopyKeepsContent017
     * @tc.desc Verify copy stores the payload at the requested target offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferCopyKeepsContent_017', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferCopyKeepsContent_017 begin');
      const data: buffer.Buffer = buffer.from('abc');
      const target: buffer.Buffer = buffer.alloc(5);
      data.copy(target, 1);
      Logger.info(TAG, 'bufferCopyKeepsContent_017, check01=' + JSON.stringify(target.toString('utf-8', 1, 4)));
      expect(target.toString('utf-8', 1, 4)).assertEqual('abc');
      Logger.info(TAG, 'bufferCopyKeepsContent_017 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1800
     * @tc.name bufferFillNumber018
     * @tc.desc Verify fill overwrites every byte with the requested value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferFillNumber_018', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferFillNumber_018 begin');
      const data: buffer.Buffer = buffer.alloc(4);
      data.fill(9);
      Logger.info(TAG, 'bufferFillNumber_018, check01=' + JSON.stringify(data.readUInt8(0)));
      expect(data.readUInt8(0)).assertEqual(9);
      Logger.info(TAG, 'bufferFillNumber_018, check02=' + JSON.stringify(data.readUInt8(3)));
      expect(data.readUInt8(3)).assertEqual(9);
      Logger.info(TAG, 'bufferFillNumber_018 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_1900
     * @tc.name bufferEqualsSame019
     * @tc.desc Verify equals accepts an identical payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferEqualsSame_019', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferEqualsSame_019 begin');
      const first: buffer.Buffer = buffer.from('abc');
      const second: buffer.Buffer = buffer.from('abc');
      Logger.info(TAG, 'bufferEqualsSame_019, check01=' + JSON.stringify(first.equals(second)));
      expect(first.equals(second)).assertTrue();
      Logger.info(TAG, 'bufferEqualsSame_019 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2000
     * @tc.name bufferEqualsDifferent020
     * @tc.desc Verify equals rejects a different payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferEqualsDifferent_020', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferEqualsDifferent_020 begin');
      const first: buffer.Buffer = buffer.from('abc');
      const second: buffer.Buffer = buffer.from('abd');
      Logger.info(TAG, 'bufferEqualsDifferent_020, check01=' + JSON.stringify(first.equals(second)));
      expect(first.equals(second)).assertFalse();
      Logger.info(TAG, 'bufferEqualsDifferent_020 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2100
     * @tc.name bufferIndexOfFound021
     * @tc.desc Verify indexOf returns the slot of a present byte sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferIndexOfFound_021', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferIndexOfFound_021 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      Logger.info(TAG, 'bufferIndexOfFound_021, check01=' + JSON.stringify(data.indexOf('tt')));
      expect(data.indexOf('tt')).assertEqual(2);
      Logger.info(TAG, 'bufferIndexOfFound_021 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2200
     * @tc.name bufferIndexOfMissing022
     * @tc.desc Verify indexOf returns minus one for an absent sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferIndexOfMissing_022', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferIndexOfMissing_022 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      Logger.info(TAG, 'bufferIndexOfMissing_022, check01=' + JSON.stringify(data.indexOf('zz')));
      expect(data.indexOf('zz')).assertEqual(-1);
      Logger.info(TAG, 'bufferIndexOfMissing_022 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2300
     * @tc.name bufferIncludesTrue023
     * @tc.desc Verify includes accepts a present sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferIncludesTrue_023', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferIncludesTrue_023 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      Logger.info(TAG, 'bufferIncludesTrue_023, check01=' + JSON.stringify(data.includes('Lott')));
      expect(data.includes('Lott')).assertTrue();
      Logger.info(TAG, 'bufferIncludesTrue_023 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2400
     * @tc.name bufferIncludesFalse024
     * @tc.desc Verify includes rejects an absent sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferIncludesFalse_024', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferIncludesFalse_024 begin');
      const data: buffer.Buffer = buffer.from('Lottie');
      Logger.info(TAG, 'bufferIncludesFalse_024, check01=' + JSON.stringify(data.includes('zz')));
      expect(data.includes('zz')).assertFalse();
      Logger.info(TAG, 'bufferIncludesFalse_024 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2500
     * @tc.name bufferWriteStringLength025
     * @tc.desc Verify write reports the number of written characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferWriteStringLength_025', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferWriteStringLength_025 begin');
      const data: buffer.Buffer = buffer.alloc(6);
      const written: number = data.write('Lottie', 0);
      Logger.info(TAG, 'bufferWriteStringLength_025, check01=' + JSON.stringify(written));
      expect(written).assertEqual(6);
      Logger.info(TAG, 'bufferWriteStringLength_025 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2600
     * @tc.name bufferWriteStringContent026
     * @tc.desc Verify write stores the text at the requested offset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferWriteStringContent_026', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferWriteStringContent_026 begin');
      const data: buffer.Buffer = buffer.alloc(6);
      data.write('Lottie', 0);
      Logger.info(TAG, 'bufferWriteStringContent_026, check01=' + JSON.stringify(data.toString('utf-8', 0, 6)));
      expect(data.toString('utf-8', 0, 6)).assertEqual('Lottie');
      Logger.info(TAG, 'bufferWriteStringContent_026 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2700
     * @tc.name bufferReadUInt8027
     * @tc.desc Verify readUInt8 returns the unsigned byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadUInt8_027', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadUInt8_027 begin');
      const data: buffer.Buffer = buffer.from([255]);
      Logger.info(TAG, 'bufferReadUInt8_027, check01=' + JSON.stringify(data.readUInt8(0)));
      expect(data.readUInt8(0)).assertEqual(255);
      Logger.info(TAG, 'bufferReadUInt8_027 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2800
     * @tc.name bufferReadInt8Negative028
     * @tc.desc Verify readInt8 returns the signed byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadInt8Negative_028', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadInt8Negative_028 begin');
      const data: buffer.Buffer = buffer.from([255]);
      Logger.info(TAG, 'bufferReadInt8Negative_028, check01=' + JSON.stringify(data.readInt8(0)));
      expect(data.readInt8(0)).assertEqual(-1);
      Logger.info(TAG, 'bufferReadInt8Negative_028 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_2900
     * @tc.name bufferReadUInt16LE029
     * @tc.desc Verify readUInt16LE assembles little endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadUInt16LE_029', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadUInt16LE_029 begin');
      const data: buffer.Buffer = buffer.from([0x34, 0x12]);
      Logger.info(TAG, 'bufferReadUInt16LE_029, check01=' + JSON.stringify(data.readUInt16LE(0)));
      expect(data.readUInt16LE(0)).assertEqual(4660);
      Logger.info(TAG, 'bufferReadUInt16LE_029 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3000
     * @tc.name bufferReadUInt16BE030
     * @tc.desc Verify readUInt16BE assembles big endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadUInt16BE_030', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadUInt16BE_030 begin');
      const data: buffer.Buffer = buffer.from([0x12, 0x34]);
      Logger.info(TAG, 'bufferReadUInt16BE_030, check01=' + JSON.stringify(data.readUInt16BE(0)));
      expect(data.readUInt16BE(0)).assertEqual(4660);
      Logger.info(TAG, 'bufferReadUInt16BE_030 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3100
     * @tc.name bufferReadInt16LE031
     * @tc.desc Verify readInt16LE returns a negative little endian value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadInt16LE_031', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadInt16LE_031 begin');
      const data: buffer.Buffer = buffer.from([0xFE, 0xFF]);
      Logger.info(TAG, 'bufferReadInt16LE_031, check01=' + JSON.stringify(data.readInt16LE(0)));
      expect(data.readInt16LE(0)).assertEqual(-2);
      Logger.info(TAG, 'bufferReadInt16LE_031 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3200
     * @tc.name bufferReadInt16BE032
     * @tc.desc Verify readInt16BE returns a negative big endian value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadInt16BE_032', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadInt16BE_032 begin');
      const data: buffer.Buffer = buffer.from([0xFF, 0xFE]);
      Logger.info(TAG, 'bufferReadInt16BE_032, check01=' + JSON.stringify(data.readInt16BE(0)));
      expect(data.readInt16BE(0)).assertEqual(-2);
      Logger.info(TAG, 'bufferReadInt16BE_032 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3300
     * @tc.name bufferReadUInt32LE033
     * @tc.desc Verify readUInt32LE assembles little endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadUInt32LE_033', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadUInt32LE_033 begin');
      const data: buffer.Buffer = buffer.from([0x78, 0x56, 0x34, 0x12]);
      Logger.info(TAG, 'bufferReadUInt32LE_033, check01=' + JSON.stringify(data.readUInt32LE(0)));
      expect(data.readUInt32LE(0)).assertEqual(305419896);
      Logger.info(TAG, 'bufferReadUInt32LE_033 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3400
     * @tc.name bufferReadUInt32BE034
     * @tc.desc Verify readUInt32BE assembles big endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadUInt32BE_034', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadUInt32BE_034 begin');
      const data: buffer.Buffer = buffer.from([0x12, 0x34, 0x56, 0x78]);
      Logger.info(TAG, 'bufferReadUInt32BE_034, check01=' + JSON.stringify(data.readUInt32BE(0)));
      expect(data.readUInt32BE(0)).assertEqual(305419896);
      Logger.info(TAG, 'bufferReadUInt32BE_034 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3500
     * @tc.name bufferReadInt32LE035
     * @tc.desc Verify readInt32LE returns a negative little endian value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadInt32LE_035', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadInt32LE_035 begin');
      const data: buffer.Buffer = buffer.from([0xFE, 0xFF, 0xFF, 0xFF]);
      Logger.info(TAG, 'bufferReadInt32LE_035, check01=' + JSON.stringify(data.readInt32LE(0)));
      expect(data.readInt32LE(0)).assertEqual(-2);
      Logger.info(TAG, 'bufferReadInt32LE_035 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3600
     * @tc.name bufferReadInt32BE036
     * @tc.desc Verify readInt32BE returns a negative big endian value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferReadInt32BE_036', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferReadInt32BE_036 begin');
      const data: buffer.Buffer = buffer.from([0xFF, 0xFF, 0xFF, 0xFE]);
      Logger.info(TAG, 'bufferReadInt32BE_036, check01=' + JSON.stringify(data.readInt32BE(0)));
      expect(data.readInt32BE(0)).assertEqual(-2);
      Logger.info(TAG, 'bufferReadInt32BE_036 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3700
     * @tc.name bufferRoundTripUInt8037
     * @tc.desc Verify a written unsigned byte reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripUInt8_037', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripUInt8_037 begin');
      const data: buffer.Buffer = buffer.alloc(1);
      data.writeUInt8(200, 0);
      Logger.info(TAG, 'bufferRoundTripUInt8_037, check01=' + JSON.stringify(data.readUInt8(0)));
      expect(data.readUInt8(0)).assertEqual(200);
      Logger.info(TAG, 'bufferRoundTripUInt8_037 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3800
     * @tc.name bufferRoundTripInt16LE038
     * @tc.desc Verify a written little endian short reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripInt16LE_038', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripInt16LE_038 begin');
      const data: buffer.Buffer = buffer.alloc(2);
      data.writeInt16LE(-1234, 0);
      Logger.info(TAG, 'bufferRoundTripInt16LE_038, check01=' + JSON.stringify(data.readInt16LE(0)));
      expect(data.readInt16LE(0)).assertEqual(-1234);
      Logger.info(TAG, 'bufferRoundTripInt16LE_038 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_3900
     * @tc.name bufferRoundTripInt16BE039
     * @tc.desc Verify a written big endian short reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripInt16BE_039', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripInt16BE_039 begin');
      const data: buffer.Buffer = buffer.alloc(2);
      data.writeInt16BE(1234, 0);
      Logger.info(TAG, 'bufferRoundTripInt16BE_039, check01=' + JSON.stringify(data.readInt16BE(0)));
      expect(data.readInt16BE(0)).assertEqual(1234);
      Logger.info(TAG, 'bufferRoundTripInt16BE_039 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_4000
     * @tc.name bufferRoundTripUInt32LE040
     * @tc.desc Verify a written little endian word reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripUInt32LE_040', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripUInt32LE_040 begin');
      const data: buffer.Buffer = buffer.alloc(4);
      data.writeUInt32LE(4000000000, 0);
      Logger.info(TAG, 'bufferRoundTripUInt32LE_040, check01=' + JSON.stringify(data.readUInt32LE(0)));
      expect(data.readUInt32LE(0)).assertEqual(4000000000);
      Logger.info(TAG, 'bufferRoundTripUInt32LE_040 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_4100
     * @tc.name bufferRoundTripFloatLE041
     * @tc.desc Verify a written little endian float reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripFloatLE_041', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripFloatLE_041 begin');
      const data: buffer.Buffer = buffer.alloc(4);
      data.writeFloatLE(1.5, 0);
      Logger.info(TAG, 'bufferRoundTripFloatLE_041, check01=' + JSON.stringify(data.readFloatLE(0)));
      expect(data.readFloatLE(0)).assertEqual(1.5);
      Logger.info(TAG, 'bufferRoundTripFloatLE_041 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_4200
     * @tc.name bufferRoundTripFloatBE042
     * @tc.desc Verify a written big endian float reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripFloatBE_042', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripFloatBE_042 begin');
      const data: buffer.Buffer = buffer.alloc(4);
      data.writeFloatBE(1.5, 0);
      Logger.info(TAG, 'bufferRoundTripFloatBE_042, check01=' + JSON.stringify(data.readFloatBE(0)));
      expect(data.readFloatBE(0)).assertEqual(1.5);
      Logger.info(TAG, 'bufferRoundTripFloatBE_042 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_4300
     * @tc.name bufferRoundTripDoubleLE043
     * @tc.desc Verify a written little endian double reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripDoubleLE_043', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripDoubleLE_043 begin');
      const data: buffer.Buffer = buffer.alloc(8);
      data.writeDoubleLE(1.5, 0);
      Logger.info(TAG, 'bufferRoundTripDoubleLE_043, check01=' + JSON.stringify(data.readDoubleLE(0)));
      expect(data.readDoubleLE(0)).assertEqual(1.5);
      Logger.info(TAG, 'bufferRoundTripDoubleLE_043 end');
    });

    /**
     * @tc.number SUB_SAMPLE_LOTTIE_BUFFER_4400
     * @tc.name bufferRoundTripDoubleBE044
     * @tc.desc Verify a written big endian double reads back unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it(BUNDLE + 'bufferRoundTripDoubleBE_044', 0, async (): Promise<void> => {
      Logger.info(TAG, 'bufferRoundTripDoubleBE_044 begin');
      const data: buffer.Buffer = buffer.alloc(8);
      data.writeDoubleBE(1.5, 0);
      Logger.info(TAG, 'bufferRoundTripDoubleBE_044, check01=' + JSON.stringify(data.readDoubleBE(0)));
      expect(data.readDoubleBE(0)).assertEqual(1.5);
      Logger.info(TAG, 'bufferRoundTripDoubleBE_044 end');
    });

  });
}
