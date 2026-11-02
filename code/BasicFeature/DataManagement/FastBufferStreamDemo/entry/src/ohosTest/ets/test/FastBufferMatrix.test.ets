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
import fastbuffer from '@ohos.fastbuffer';

/**
 * FastBuffer 基础 API 矩阵测试
 *
 * 与 FastBufferBasics 的区别：本套件把「取值 × 字节序」「长度 × 切片方式」
 * 「复制区间 × 目标偏移」等组合展开为逐条独立用例，断言直接落在 @ohos.fastbuffer
 * 的真实实现上，不复制业务侧常量或包装逻辑。
 * 覆盖：UInt16/UInt32/Int16/Int32 大小端、通用 UIntBE/LE、多字段偏移、
 * subarray 共享视图、copy 区间裁剪、concat 拼接、fill 区间填充、
 * equals/compare、indexOf/includes、byteLength/isBuffer。
 */

export default function fastBufferMatrixTest() {
  describe('fastBufferMatrixTest', () => {
    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0100
     * @tc.name uint32_roundtrip_zero_be
     * @tc.desc Verify uint32 big-endian round-trip of zero writes four zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_zero_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32BE(0x00000000, 0);
      expect(buf.toString('hex')).assertEqual('00000000');
      expect(buf.readUInt32BE(0)).assertEqual(0x00000000);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0200
     * @tc.name uint32_roundtrip_zero_le
     * @tc.desc Verify uint32 little-endian round-trip of zero writes four zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_zero_le', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32LE(0x00000000, 0);
      expect(buf.toString('hex')).assertEqual('00000000');
      expect(buf.readUInt32LE(0)).assertEqual(0x00000000);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0300
     * @tc.name uint32_roundtrip_one_be
     * @tc.desc Verify uint32 big-endian round-trip of one places the byte at the most significant position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_one_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32BE(0x00000001, 0);
      expect(buf.toString('hex')).assertEqual('00000001');
      expect(buf.readUInt32BE(0)).assertEqual(0x00000001);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0400
     * @tc.name uint32_roundtrip_one_le
     * @tc.desc Verify uint32 little-endian round-trip of one places the byte at the least significant position
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_one_le', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32LE(0x00000001, 0);
      expect(buf.toString('hex')).assertEqual('01000000');
      expect(buf.readUInt32LE(0)).assertEqual(0x00000001);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0500
     * @tc.name uint32_roundtrip_ffff_be
     * @tc.desc Verify uint32 big-endian round-trip of 0x0000FFFF keeps leading zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_ffff_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32BE(0x0000FFFF, 0);
      expect(buf.toString('hex')).assertEqual('0000ffff');
      expect(buf.readUInt32BE(0)).assertEqual(0x0000FFFF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0600
     * @tc.name uint32_roundtrip_ffff_le
     * @tc.desc Verify uint32 little-endian round-trip of 0x0000FFFF puts the two bytes first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_ffff_le', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32LE(0x0000FFFF, 0);
      expect(buf.toString('hex')).assertEqual('ffff0000');
      expect(buf.readUInt32LE(0)).assertEqual(0x0000FFFF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0700
     * @tc.name uint32_roundtrip_magic_be
     * @tc.desc Verify uint32 big-endian round-trip of the demo magic number 0x4F484F53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_magic_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32BE(0x4F484F53, 0);
      expect(buf.toString('hex')).assertEqual('4f484f53');
      expect(buf.readUInt32BE(0)).assertEqual(0x4F484F53);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0800
     * @tc.name uint32_roundtrip_magic_le
     * @tc.desc Verify uint32 little-endian round-trip of the demo magic number 0x4F484F53
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_magic_le', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32LE(0x4F484F53, 0);
      expect(buf.toString('hex')).assertEqual('534f484f');
      expect(buf.readUInt32LE(0)).assertEqual(0x4F484F53);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_0900
     * @tc.name uint32_roundtrip_max_signed_be
     * @tc.desc Verify uint32 big-endian round-trip of 0x7FFFFFFF keeps the sign bit clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_max_signed_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32BE(0x7FFFFFFF, 0);
      expect(buf.toString('hex')).assertEqual('7fffffff');
      expect(buf.readUInt32BE(0)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1000
     * @tc.name uint32_roundtrip_max_signed_le
     * @tc.desc Verify uint32 little-endian round-trip of 0x7FFFFFFF reverses the byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint32_roundtrip_max_signed_le', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32LE(0x7FFFFFFF, 0);
      expect(buf.toString('hex')).assertEqual('ffffff7f');
      expect(buf.readUInt32LE(0)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1100
     * @tc.name uint16_roundtrip_zero_be
     * @tc.desc Verify uint16 big-endian round-trip of zero writes two zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint16_roundtrip_zero_be', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeUInt16BE(0x0000, 0);
      expect(buf.toString('hex')).assertEqual('0000');
      expect(buf.readUInt16BE(0)).assertEqual(0x0000);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1200
     * @tc.name uint16_roundtrip_zero_le
     * @tc.desc Verify uint16 little-endian round-trip of zero writes two zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint16_roundtrip_zero_le', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeUInt16LE(0x0000, 0);
      expect(buf.toString('hex')).assertEqual('0000');
      expect(buf.readUInt16LE(0)).assertEqual(0x0000);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1300
     * @tc.name uint16_roundtrip_ff_be
     * @tc.desc Verify uint16 big-endian round-trip of 0x00FF places the byte last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint16_roundtrip_ff_be', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeUInt16BE(0x00FF, 0);
      expect(buf.toString('hex')).assertEqual('00ff');
      expect(buf.readUInt16BE(0)).assertEqual(0x00FF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1400
     * @tc.name uint16_roundtrip_ff_le
     * @tc.desc Verify uint16 little-endian round-trip of 0x00FF places the byte first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint16_roundtrip_ff_le', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeUInt16LE(0x00FF, 0);
      expect(buf.toString('hex')).assertEqual('ff00');
      expect(buf.readUInt16LE(0)).assertEqual(0x00FF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1500
     * @tc.name uint16_roundtrip_abcd_be
     * @tc.desc Verify uint16 big-endian round-trip of 0xABCD writes ab then cd
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint16_roundtrip_abcd_be', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeUInt16BE(0xABCD, 0);
      expect(buf.toString('hex')).assertEqual('abcd');
      expect(buf.readUInt16BE(0)).assertEqual(0xABCD);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1600
     * @tc.name uint16_roundtrip_abcd_le
     * @tc.desc Verify uint16 little-endian round-trip of 0xABCD writes cd then ab
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint16_roundtrip_abcd_le', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeUInt16LE(0xABCD, 0);
      expect(buf.toString('hex')).assertEqual('cdab');
      expect(buf.readUInt16LE(0)).assertEqual(0xABCD);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1700
     * @tc.name int16_negative_be
     * @tc.desc Verify int16 big-endian write of -1 stores all ones and reads back negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('int16_negative_be', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeInt16BE(-1, 0);
      expect(buf.toString('hex')).assertEqual('ffff');
      expect(buf.readInt16BE(0)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1800
     * @tc.name int16_min_be
     * @tc.desc Verify int16 big-endian minimum value 0x8000 reads back as -32768 and 32768 unsigned
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('int16_min_be', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeInt16BE(-32768, 0);
      expect(buf.toString('hex')).assertEqual('8000');
      expect(buf.readInt16BE(0)).assertEqual(-32768);
      expect(buf.readUInt16BE(0)).assertEqual(32768);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_1900
     * @tc.name int16_max_be
     * @tc.desc Verify int16 big-endian maximum value 0x7FFF round-trips as 32767
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('int16_max_be', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeInt16BE(32767, 0);
      expect(buf.toString('hex')).assertEqual('7fff');
      expect(buf.readInt16BE(0)).assertEqual(32767);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2000
     * @tc.name int32_negative_be
     * @tc.desc Verify int32 big-endian write of -2 stores 0xFFFFFFFE and reads back negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('int32_negative_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeInt32BE(-2, 0);
      expect(buf.toString('hex')).assertEqual('fffffffe');
      expect(buf.readInt32BE(0)).assertEqual(-2);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2100
     * @tc.name int32_min_be
     * @tc.desc Verify int32 big-endian minimum value 0x80000000 round-trips as -2147483648
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('int32_min_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeInt32BE(-2147483648, 0);
      expect(buf.toString('hex')).assertEqual('80000000');
      expect(buf.readInt32BE(0)).assertEqual(-2147483648);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2200
     * @tc.name int32_max_be
     * @tc.desc Verify int32 big-endian maximum value 0x7FFFFFFF round-trips as 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('int32_max_be', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeInt32BE(2147483647, 0);
      expect(buf.toString('hex')).assertEqual('7fffffff');
      expect(buf.readInt32BE(0)).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2300
     * @tc.name uint_be_general_three_bytes
     * @tc.desc Verify the generic big-endian writer handles a three-byte integer width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint_be_general_three_bytes', 0, () => {
      const buf = fastbuffer.alloc(3);
      buf.writeUIntBE(0x123456, 0, 3);
      expect(buf.toString('hex')).assertEqual('123456');
      expect(buf.readUIntBE(0, 3)).assertEqual(0x123456);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2400
     * @tc.name uint_le_general_three_bytes
     * @tc.desc Verify the generic little-endian writer handles a three-byte integer width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('uint_le_general_three_bytes', 0, () => {
      const buf = fastbuffer.alloc(3);
      buf.writeUIntLE(0x123456, 0, 3);
      expect(buf.toString('hex')).assertEqual('563412');
      expect(buf.readUIntLE(0, 3)).assertEqual(0x123456);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2500
     * @tc.name multi_field_offsets_be
     * @tc.desc Verify three uint32 fields written at offsets zero four and eight keep their order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('multi_field_offsets_be', 0, () => {
      const buf = fastbuffer.alloc(12);
      buf.writeUInt32BE(0x01020304, 0);
      buf.writeUInt32BE(0x05060708, 4);
      buf.writeUInt32BE(0x090A0B0C, 8);
      expect(buf.toString('hex')).assertEqual('0102030405060708090a0b0c');
      expect(buf.readUInt32BE(0)).assertEqual(0x01020304);
      expect(buf.readUInt32BE(4)).assertEqual(0x05060708);
      expect(buf.readUInt32BE(8)).assertEqual(0x090A0B0C);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2600
     * @tc.name subarray_zero_offset_content
     * @tc.desc Verify a subarray view starting at zero decodes the first four characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('subarray_zero_offset_content', 0, () => {
      const buf = fastbuffer.from('abcdefgh');
      const view = buf.subarray(0, 4);
      expect(view.length).assertEqual(4);
      expect(view.toString('utf8')).assertEqual('abcd');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2700
     * @tc.name subarray_full_buffer
     * @tc.desc Verify a subarray without arguments spans the whole parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('subarray_full_buffer', 0, () => {
      const buf = fastbuffer.from('abcdefgh');
      expect(buf.subarray().toString('utf8')).assertEqual('abcdefgh');
      expect(buf.subarray(0).length).assertEqual(8);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2800
     * @tc.name subarray_empty_view
     * @tc.desc Verify a zero-length subarray reports length zero and an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('subarray_empty_view', 0, () => {
      const buf = fastbuffer.from('abcdefgh');
      const view = buf.subarray(0, 0);
      expect(view.length).assertEqual(0);
      expect(view.toString('utf8')).assertEqual('');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_2900
     * @tc.name subarray_offset_reads_parent_bytes
     * @tc.desc Verify a mid-buffer subarray reads view-relative bytes c and f from the parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('subarray_offset_reads_parent_bytes', 0, () => {
      const buf = fastbuffer.from('abcdefgh');
      const view = buf.subarray(2, 6);
      expect(view.length).assertEqual(4);
      // 视图的下标是视图内偏移：0 对应父缓冲的 'c'，3 对应 'f'
      expect(view.readUInt8(0)).assertEqual('c'.charCodeAt(0));
      expect(view.readUInt8(3)).assertEqual('f'.charCodeAt(0));
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3000
     * @tc.name subarray_mutation_visible_in_parent
     * @tc.desc Verify writing through a subarray view mutates the shared parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('subarray_mutation_visible_in_parent', 0, () => {
      const buf = fastbuffer.from('abcdefgh');
      const view = buf.subarray(2, 4);
      view.writeUInt8(0x58, 0);
      expect(buf.toString('utf8')).assertEqual('abXdefgh');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3100
     * @tc.name copy_whole_buffer
     * @tc.desc Verify copying the whole ten-byte source into a same-sized target reproduces content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_whole_buffer', 0, () => {
      const src = fastbuffer.from('0123456789');
      const dst = fastbuffer.alloc(10);
      const copied: number = src.copy(dst, 0, 0, 10);
      expect(copied).assertEqual(10);
      expect(dst.toString('hex')).assertEqual('30313233343536373839');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3200
     * @tc.name copy_middle_range
     * @tc.desc Verify copying source bytes three through six into a four-byte target yields 3456
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_middle_range', 0, () => {
      const src = fastbuffer.from('0123456789');
      const dst = fastbuffer.alloc(4);
      const copied: number = src.copy(dst, 0, 3, 7);
      expect(copied).assertEqual(4);
      expect(dst.toString('hex')).assertEqual('33343536');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3300
     * @tc.name copy_with_target_offset
     * @tc.desc Verify a target start of two leaves two zero bytes before the copied content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_with_target_offset', 0, () => {
      const src = fastbuffer.from('0123456789');
      const dst = fastbuffer.alloc(6);
      const copied: number = src.copy(dst, 2, 0, 4);
      expect(copied).assertEqual(4);
      expect(dst.toString('hex')).assertEqual('000030313233');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3400
     * @tc.name copy_tail_clamped
     * @tc.desc Verify copying the last two source bytes into a two-byte target yields 89
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_tail_clamped', 0, () => {
      const src = fastbuffer.from('0123456789');
      const dst = fastbuffer.alloc(2);
      const copied: number = src.copy(dst, 0, 8, 10);
      expect(copied).assertEqual(2);
      expect(dst.toString('hex')).assertEqual('3839');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3500
     * @tc.name concat_three_parts
     * @tc.desc Verify concatenating three two-byte buffers yields AABBCC with length six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concat_three_parts', 0, () => {
      const joined = fastbuffer.concat([fastbuffer.from('AA'), fastbuffer.from('BB'), fastbuffer.from('CC')]);
      expect(joined.length).assertEqual(6);
      expect(joined.toString('utf8')).assertEqual('AABBCC');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3600
     * @tc.name concat_with_empty_parts
     * @tc.desc Verify empty buffers in the concat list contribute no bytes or content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concat_with_empty_parts', 0, () => {
      const joined = fastbuffer.concat([fastbuffer.alloc(0), fastbuffer.from('AB'), fastbuffer.alloc(0)]);
      expect(joined.length).assertEqual(2);
      expect(joined.toString('utf8')).assertEqual('AB');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3700
     * @tc.name concat_ten_small_parts
     * @tc.desc Verify concatenating ten four-byte buffers yields forty bytes with all parts in order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concat_ten_small_parts', 0, () => {
      const parts: fastbuffer.FastBuffer[] = [];
      for (let i = 0; i < 10; i++) {
        parts.push(fastbuffer.from('0123'));
      }
      const joined = fastbuffer.concat(parts);
      expect(joined.length).assertEqual(40);
      expect(joined.toString('utf8')).assertEqual('0123'.repeat(10));
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3800
     * @tc.name fill_numeric_value
     * @tc.desc Verify filling a four-byte buffer with the numeric value 0x41 yields four A bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fill_numeric_value', 0, () => {
      const buf = fastbuffer.alloc(4).fill(0x41);
      expect(buf.toString('hex')).assertEqual('41414141');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_3900
     * @tc.name fill_range_with_char
     * @tc.desc Verify filling the range two to four with z leaves both ends zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fill_range_with_char', 0, () => {
      const buf = fastbuffer.alloc(6).fill('z', 2, 4);
      expect(buf.toString('hex')).assertEqual('00007a7a0000');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4000
     * @tc.name fill_repeats_single_char
     * @tc.desc Verify the alloc fill argument repeats a single character across the buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fill_repeats_single_char', 0, () => {
      expect(fastbuffer.alloc(3, '0').toString('utf8')).assertEqual('000');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4100
     * @tc.name equals_same_content_different_origin
     * @tc.desc Verify an ASCII buffer equals the same bytes decoded from hex with compare zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('equals_same_content_different_origin', 0, () => {
      const b1 = fastbuffer.from('ABC');
      const b2 = fastbuffer.from('414243', 'hex');
      expect(b1.equals(b2)).assertTrue();
      expect(b1.compare(b2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4200
     * @tc.name compare_prefix_is_ordered
     * @tc.desc Verify a shorter prefix sorts before its extension in both directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('compare_prefix_is_ordered', 0, () => {
      const shortBuf = fastbuffer.from('ABC');
      const longBuf = fastbuffer.from('ABCD');
      expect(shortBuf.equals(longBuf)).assertFalse();
      expect(shortBuf.compare(longBuf)).assertEqual(-1);
      expect(longBuf.compare(shortBuf)).assertEqual(1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4300
     * @tc.name compare_lexicographic_order
     * @tc.desc Verify compare orders A before B and returns one for the reverse comparison
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('compare_lexicographic_order', 0, () => {
      const a = fastbuffer.from('A');
      const b = fastbuffer.from('B');
      expect(a.compare(b)).assertEqual(-1);
      expect(b.compare(a)).assertEqual(1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4400
     * @tc.name equals_empty_buffers
     * @tc.desc Verify a zero-length allocated buffer equals a buffer created from an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('equals_empty_buffers', 0, () => {
      expect(fastbuffer.alloc(0).equals(fastbuffer.from(''))).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4500
     * @tc.name indexOf_string_hits_and_misses
     * @tc.desc Verify indexOf locates substrings from a start offset and returns minus one when absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('indexOf_string_hits_and_misses', 0, () => {
      const buf = fastbuffer.from('hello world');
      expect(buf.indexOf('world')).assertEqual(6);
      expect(buf.indexOf('o', 5)).assertEqual(7);
      expect(buf.indexOf('zz')).assertEqual(-1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4600
     * @tc.name includes_string_case_sensitive
     * @tc.desc Verify includes matches exact case and rejects an upper-cased variant
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('includes_string_case_sensitive', 0, () => {
      const buf = fastbuffer.from('hello world');
      expect(buf.includes('hello')).assertTrue();
      expect(buf.includes('HELLO')).assertFalse();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4700
     * @tc.name byteLength_utf8_matrix
     * @tc.desc Verify byteLength reports zero one and multi-byte widths for empty ASCII and CJK text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('byteLength_utf8_matrix', 0, () => {
      expect(fastbuffer.byteLength('')).assertEqual(0);
      expect(fastbuffer.byteLength('abc')).assertEqual(3);
      expect(fastbuffer.byteLength('你好')).assertEqual(6);
      expect(fastbuffer.byteLength('\u00e9')).assertEqual(2);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERMATRIX_4800
     * @tc.name isBuffer_classification
     * @tc.desc Verify isBuffer accepts FastBuffer instances and rejects strings typed arrays and array buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('isBuffer_classification', 0, () => {
      expect(fastbuffer.isBuffer(fastbuffer.alloc(1))).assertTrue();
      expect(fastbuffer.isBuffer(fastbuffer.from('x'))).assertTrue();
      expect(fastbuffer.isBuffer('x')).assertFalse();
      expect(fastbuffer.isBuffer(new Uint8Array(1))).assertFalse();
      expect(fastbuffer.isBuffer(new ArrayBuffer(1))).assertFalse();
    });
  });
}
