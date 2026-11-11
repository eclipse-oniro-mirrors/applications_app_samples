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
import fastbuffer from '@ohos.fastbuffer';
import { FastBufferUtil } from '../../../main/ets/model/utils/FastBufferUtil';

/**
 * FastBufferUtil 工具类矩阵测试
 *
 * 与 FastBufferUtil.test 的区别：本套件按「输入取值 × 编码方式 × 边界」展开逐条用例，
 * 覆盖 utf8 字节长度、视图逐字节解码、hex 合法/非法输入、base64 标准向量、
 * uint32 字节序与偏移、concatAll 空/单/多段、hexDump 行数与 ASCII 边界、
 * CRC32 标准向量与大小写敏感。断言全部调用真实工具实现。
 */

export default function fastBufferUtilMatrixTest() {
  describe('fastBufferUtilMatrixTest', () => {
    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0100
     * @tc.name utf8_byteLength_empty
     * @tc.desc Verify encoding an empty string produces a zero-length buffer that decodes back empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8_byteLength_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.utf8Encode('');
      expect(buf.length).assertEqual(0);
      expect(FastBufferUtil.utf8Decode(buf)).assertEqual('');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0200
     * @tc.name utf8_byteLength_ascii_single
     * @tc.desc Verify a single ASCII character encodes to one byte
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8_byteLength_ascii_single', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.utf8Encode('A');
      expect(buf.length).assertEqual(1);
      expect(FastBufferUtil.utf8Decode(buf)).assertEqual('A');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0300
     * @tc.name utf8_byteLength_ascii_word
     * @tc.desc Verify an eleven-character ASCII word encodes to eleven bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8_byteLength_ascii_word', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.utf8Encode('OpenHarmony');
      expect(buf.length).assertEqual(11);
      expect(FastBufferUtil.utf8Decode(buf)).assertEqual('OpenHarmony');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0400
     * @tc.name utf8_byteLength_cjk
     * @tc.desc Verify five CJK characters including the full-width comma encode to fifteen bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8_byteLength_cjk', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text = '你好，世界';
      const buf = FastBufferUtil.utf8Encode(text);
      expect(buf.length).assertEqual(15);
      expect(FastBufferUtil.utf8Decode(buf)).assertEqual(text);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0500
     * @tc.name utf8_byteLength_mixed
     * @tc.desc Verify mixed letters digits and punctuation encode one byte each
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8_byteLength_mixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text = 'hello 123 !@#';
      const buf = FastBufferUtil.utf8Encode(text);
      expect(buf.length).assertEqual(13);
      expect(FastBufferUtil.utf8Decode(buf)).assertEqual(text);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0600
     * @tc.name utf8View_decode_from_zero
     * @tc.desc Verify decoding a view from offset zero returns the first four characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8View_decode_from_zero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.from('abcdefgh');
      expect(FastBufferUtil.utf8ViewDecode(buf.subarray(0, 4))).assertEqual('abcd');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0700
     * @tc.name utf8View_decode_middle
     * @tc.desc Verify decoding a mid-buffer view returns characters c through f
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8View_decode_middle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.from('abcdefgh');
      expect(FastBufferUtil.utf8ViewDecode(buf.subarray(2, 6))).assertEqual('cdef');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0800
     * @tc.name utf8View_decode_tail
     * @tc.desc Verify decoding a tail view returns characters e through h
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8View_decode_tail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.from('abcdefgh');
      expect(FastBufferUtil.utf8ViewDecode(buf.subarray(4, 8))).assertEqual('efgh');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_0900
     * @tc.name utf8View_decode_empty
     * @tc.desc Verify decoding a zero-length view returns an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8View_decode_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.from('abcdefgh');
      expect(FastBufferUtil.utf8ViewDecode(buf.subarray(0, 0))).assertEqual('');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1000
     * @tc.name fromHex_accepts_lowercase_input
     * @tc.desc Verify lowercase hex input decodes to the same bytes when re-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_accepts_lowercase_input', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.fromHex('4142');
      expect(FastBufferUtil.toHex(buf)).assertEqual('4142');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1100
     * @tc.name fromHex_accepts_uppercase_input
     * @tc.desc Verify uppercase hex input is normalised to lowercase when re-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_accepts_uppercase_input', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.fromHex('ABCD');
      expect(FastBufferUtil.toHex(buf)).assertEqual('abcd');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1200
     * @tc.name fromHex_accepts_mixed_case_input
     * @tc.desc Verify mixed-case hex input is normalised to lowercase when re-encoded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_accepts_mixed_case_input', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.fromHex('aBcD');
      expect(FastBufferUtil.toHex(buf)).assertEqual('abcd');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1300
     * @tc.name fromHex_accepts_zero_padded
     * @tc.desc Verify hex bytes containing zero values survive a decode and encode round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_accepts_zero_padded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.fromHex('00ff');
      expect(FastBufferUtil.toHex(buf)).assertEqual('00ff');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1400
     * @tc.name toHex_known_word
     * @tc.desc Verify the hex encoding of the ASCII word OpenHarmony matches its known byte sequence
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toHex_known_word', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toHex(FastBufferUtil.utf8Encode('OpenHarmony')))
        .assertEqual('4f70656e4861726d6f6e79');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1500
     * @tc.name fromHex_empty_string
     * @tc.desc Verify decoding an empty hex string yields a zero-length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_empty_string', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.fromHex('').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1600
     * @tc.name fromHex_rejects_odd_length_one
     * @tc.desc Verify a single hex digit is rejected as an odd-length input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_rejects_odd_length_one', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let thrown = false;
      try {
        FastBufferUtil.fromHex('4');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1700
     * @tc.name fromHex_rejects_odd_length_three
     * @tc.desc Verify a three-digit hex string is rejected as an odd-length input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_rejects_odd_length_three', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let thrown = false;
      try {
        FastBufferUtil.fromHex('414');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1800
     * @tc.name fromHex_rejects_letter_g
     * @tc.desc Verify hex characters outside zero through f are rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_rejects_letter_g', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let thrown = false;
      try {
        FastBufferUtil.fromHex('gg');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_1900
     * @tc.name fromHex_rejects_digit_then_letter
     * @tc.desc Verify a valid digit followed by an invalid letter is rejected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_rejects_digit_then_letter', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let thrown = false;
      try {
        FastBufferUtil.fromHex('0g');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2000
     * @tc.name fromHex_rejects_embedded_space
     * @tc.desc Verify even-length hex input containing an embedded space is rejected by the character check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_rejects_embedded_space', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let thrown = false;
      try {
        // 偶数长度，确保进入字符校验而不是奇数长度分支
        FastBufferUtil.fromHex('41 2');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2100
     * @tc.name base64_rfc_vector_empty
     * @tc.desc Verify the RFC 4648 empty input encodes to an empty base64 string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_rfc_vector_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode(''))).assertEqual('');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64(''))).assertEqual('');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2200
     * @tc.name base64_rfc_vector_one_byte
     * @tc.desc Verify the RFC 4648 one-byte vector f encodes to Zg with double padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_rfc_vector_one_byte', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode('f'))).assertEqual('Zg==');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64('Zg=='))).assertEqual('f');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2300
     * @tc.name base64_rfc_vector_two_bytes
     * @tc.desc Verify the RFC 4648 two-byte vector fo encodes to Zm8 with single padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_rfc_vector_two_bytes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode('fo'))).assertEqual('Zm8=');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64('Zm8='))).assertEqual('fo');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2400
     * @tc.name base64_rfc_vector_three_bytes
     * @tc.desc Verify the RFC 4648 three-byte vector foo encodes to Zm9v without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_rfc_vector_three_bytes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode('foo'))).assertEqual('Zm9v');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64('Zm9v'))).assertEqual('foo');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2500
     * @tc.name base64_rfc_vector_four_bytes
     * @tc.desc Verify the RFC 4648 four-byte vector foob encodes to Zm9vYg with double padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_rfc_vector_four_bytes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode('foob'))).assertEqual('Zm9vYg==');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64('Zm9vYg=='))).assertEqual('foob');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2600
     * @tc.name base64_rfc_vector_five_bytes
     * @tc.desc Verify the RFC 4648 five-byte vector fooba encodes to Zm9vYmE with single padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_rfc_vector_five_bytes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode('fooba'))).assertEqual('Zm9vYmE=');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64('Zm9vYmE='))).assertEqual('fooba');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2700
     * @tc.name base64_rfc_vector_six_bytes
     * @tc.desc Verify the RFC 4648 six-byte vector foobar encodes to Zm9vYmFy without padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_rfc_vector_six_bytes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode('foobar'))).assertEqual('Zm9vYmFy');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64('Zm9vYmFy'))).assertEqual('foobar');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2800
     * @tc.name base64_roundtrip_cjk
     * @tc.desc Verify two CJK characters round-trip through base64 as the known UTF-8 vector
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_roundtrip_cjk', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text = '你好';
      expect(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode(text))).assertEqual('5L2g5aW9');
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64('5L2g5aW9'))).assertEqual(text);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_2900
     * @tc.name base64_roundtrip_long_text
     * @tc.desc Verify a long mixed-case payload survives a base64 encode and decode round-trip
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_roundtrip_long_text', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text = 'FastBufferUtil base64 matrix payload 0123456789 ABCDEFGHIJKLMNOPQRSTUVWXYZ';
      const restored = FastBufferUtil.utf8Decode(
        FastBufferUtil.fromBase64(FastBufferUtil.toBase64(FastBufferUtil.utf8Encode(text))));
      expect(restored).assertEqual(text);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3000
     * @tc.name util_uint32_zero_be
     * @tc.desc Verify util uint32 big-endian write of zero yields four zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_zero_be', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 0, 0, false);
      expect(buf.toString('hex')).assertEqual('00000000');
      expect(FastBufferUtil.readUint32(buf, 0, false)).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3100
     * @tc.name util_uint32_zero_le
     * @tc.desc Verify util uint32 little-endian write of zero yields four zero bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_zero_le', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 0, 0, true);
      expect(buf.toString('hex')).assertEqual('00000000');
      expect(FastBufferUtil.readUint32(buf, 0, true)).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3200
     * @tc.name util_uint32_one_be
     * @tc.desc Verify util uint32 big-endian write of one puts the byte last
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_one_be', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 1, 0, false);
      expect(buf.toString('hex')).assertEqual('00000001');
      expect(FastBufferUtil.readUint32(buf, 0, false)).assertEqual(1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3300
     * @tc.name util_uint32_one_le
     * @tc.desc Verify util uint32 little-endian write of one puts the byte first
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_one_le', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 1, 0, true);
      expect(buf.toString('hex')).assertEqual('01000000');
      expect(FastBufferUtil.readUint32(buf, 0, true)).assertEqual(1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3400
     * @tc.name util_uint32_word_be
     * @tc.desc Verify util uint32 big-endian write of 0x12345678 keeps the byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_word_be', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 0x12345678, 0, false);
      expect(buf.toString('hex')).assertEqual('12345678');
      expect(FastBufferUtil.readUint32(buf, 0, false)).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3500
     * @tc.name util_uint32_word_le
     * @tc.desc Verify util uint32 little-endian write of 0x12345678 reverses the byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_word_le', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 0x12345678, 0, true);
      expect(buf.toString('hex')).assertEqual('78563412');
      expect(FastBufferUtil.readUint32(buf, 0, true)).assertEqual(0x12345678);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3600
     * @tc.name util_uint32_max_be
     * @tc.desc Verify util uint32 big-endian write of 0x7FFFFFFF keeps the high bit clear
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_max_be', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 0x7FFFFFFF, 0, false);
      expect(buf.toString('hex')).assertEqual('7fffffff');
      expect(FastBufferUtil.readUint32(buf, 0, false)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3700
     * @tc.name util_uint32_max_le
     * @tc.desc Verify util uint32 little-endian write of 0x7FFFFFFF reverses the byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_max_le', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      FastBufferUtil.writeUint32(buf, 0x7FFFFFFF, 0, true);
      expect(buf.toString('hex')).assertEqual('ffffff7f');
      expect(FastBufferUtil.readUint32(buf, 0, true)).assertEqual(0x7FFFFFFF);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3800
     * @tc.name util_uint32_at_nonzero_offset
     * @tc.desc Verify util uint32 write at offset four leaves the first field zeroed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('util_uint32_at_nonzero_offset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(8);
      FastBufferUtil.writeUint32(buf, 0x01020304, 4, false);
      expect(buf.toString('hex')).assertEqual('0000000001020304');
      expect(FastBufferUtil.readUint32(buf, 4, false)).assertEqual(0x01020304);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_3900
     * @tc.name concatAll_empty_list
     * @tc.desc Verify concatenating an empty list returns a zero-length buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concatAll_empty_list', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.concatAll([]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4000
     * @tc.name concatAll_single_buffer
     * @tc.desc Verify concatenating a single buffer preserves content and length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concatAll_single_buffer', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const joined = FastBufferUtil.concatAll([FastBufferUtil.utf8Encode('only')]);
      expect(joined.length).assertEqual(4);
      expect(FastBufferUtil.utf8Decode(joined)).assertEqual('only');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4100
     * @tc.name concatAll_skips_empty_parts
     * @tc.desc Verify empty buffers interleaved in the list do not disturb the joined content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concatAll_skips_empty_parts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const joined = FastBufferUtil.concatAll([
        fastbuffer.alloc(0),
        FastBufferUtil.utf8Encode('AB'),
        fastbuffer.alloc(0),
        FastBufferUtil.utf8Encode('CD')
      ]);
      expect(joined.length).assertEqual(4);
      expect(FastBufferUtil.utf8Decode(joined)).assertEqual('ABCD');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4200
     * @tc.name concatAll_twenty_parts
     * @tc.desc Verify concatenating twenty hundred-byte parts yields two thousand identical bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concatAll_twenty_parts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const parts: fastbuffer.FastBuffer[] = [];
      for (let i = 0; i < 20; i++) {
        parts.push(FastBufferUtil.utf8Encode('x'.repeat(100)));
      }
      const joined = FastBufferUtil.concatAll(parts);
      expect(joined.length).assertEqual(2000);
      expect(FastBufferUtil.utf8Decode(joined) === 'x'.repeat(2000)).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4300
     * @tc.name hexDump_eight_bytes_per_line
     * @tc.desc Verify dumping twenty-five bytes at eight per line produces four lines
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_eight_bytes_per_line', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const dump = FastBufferUtil.hexDump(FastBufferUtil.utf8Encode('a'.repeat(25)), 8);
      expect(dump.split('\n').length).assertEqual(4);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4400
     * @tc.name hexDump_thirty_two_bytes_per_line
     * @tc.desc Verify dumping exactly thirty-two bytes at thirty-two per line produces one line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_thirty_two_bytes_per_line', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const dump = FastBufferUtil.hexDump(FastBufferUtil.utf8Encode('b'.repeat(32)), 32);
      expect(dump.split('\n').length).assertEqual(1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4500
     * @tc.name hexDump_second_line_address
     * @tc.desc Verify the second line of a default dump starts at address 0x10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_second_line_address', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const dump = FastBufferUtil.hexDump(FastBufferUtil.utf8Encode('c'.repeat(17)));
      const rows = dump.split('\n');
      expect(rows.length).assertEqual(2);
      expect(rows[1].startsWith('00000010')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4600
     * @tc.name hexDump_four_bytes_per_line_addresses
     * @tc.desc Verify a four-byte line width advances addresses by four on each line
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_four_bytes_per_line_addresses', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const dump = FastBufferUtil.hexDump(FastBufferUtil.utf8Encode('d'.repeat(9)), 4);
      const rows = dump.split('\n');
      expect(rows.length).assertEqual(3);
      expect(rows[1].startsWith('00000004')).assertTrue();
      expect(rows[2].startsWith('00000008')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4700
     * @tc.name hexDump_printable_boundaries
     * @tc.desc Verify only bytes 0x20 through 0x7E appear as printable in the ASCII column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_printable_boundaries', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt8(0x1F, 0);
      buf.writeUInt8(0x20, 1);
      buf.writeUInt8(0x7E, 2);
      buf.writeUInt8(0x7F, 3);
      expect(FastBufferUtil.hexDump(buf).includes('|. ~.|')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4800
     * @tc.name hexDump_hex_column_alignment
     * @tc.desc Verify two adjacent bytes appear space-separated in the hex column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_hex_column_alignment', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.hexDump(FastBufferUtil.utf8Encode('AB')).includes('41 42')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_4900
     * @tc.name crc32_vector_single_char
     * @tc.desc Verify CRC32 of the single character a matches the published vector E8B7BE43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_vector_single_char', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.crc32(FastBufferUtil.utf8Encode('a'))).assertEqual(0xE8B7BE43);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_5000
     * @tc.name crc32_vector_three_chars
     * @tc.desc Verify CRC32 of abc matches the published vector 352441C2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_vector_three_chars', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.crc32(FastBufferUtil.utf8Encode('abc'))).assertEqual(0x352441C2);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_5100
     * @tc.name crc32_vector_sentence
     * @tc.desc Verify CRC32 of the pangram sentence matches the published vector 414FA339
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_vector_sentence', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const text = 'The quick brown fox jumps over the lazy dog';
      expect(FastBufferUtil.crc32(FastBufferUtil.utf8Encode(text))).assertEqual(0x414FA339);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_5200
     * @tc.name crc32_is_case_sensitive
     * @tc.desc Verify upper and lower case a produce different CRC32 values and A matches its vector
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_is_case_sensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const upperCrc = FastBufferUtil.crc32(FastBufferUtil.utf8Encode('A'));
      const lowerCrc = FastBufferUtil.crc32(FastBufferUtil.utf8Encode('a'));
      expect(upperCrc).assertEqual(0xD3D99E8B);
      expect(upperCrc === lowerCrc).assertFalse();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_5300
     * @tc.name crc32_changes_on_byte_append
     * @tc.desc Verify appending one byte to a payload changes its CRC32 value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_changes_on_byte_append', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const base = FastBufferUtil.crc32(FastBufferUtil.utf8Encode('payload'));
      const extended = FastBufferUtil.crc32(FastBufferUtil.utf8Encode('payload!'));
      expect(base === extended).assertFalse();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_5400
     * @tc.name crc32Hex_zero_padded
     * @tc.desc Verify CRC32 of an empty buffer renders as eight zero digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32Hex_zero_padded', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.crc32Hex(fastbuffer.alloc(0))).assertEqual('00000000');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTILMATRIX_5500
     * @tc.name crc32Hex_uppercase_eight_digits
     * @tc.desc Verify crc32Hex renders the single character a as eight upper-case digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32Hex_uppercase_eight_digits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const hex = FastBufferUtil.crc32Hex(FastBufferUtil.utf8Encode('a'));
      expect(hex).assertEqual('E8B7BE43');
      expect(hex.length).assertEqual(8);
    });
  });
}
