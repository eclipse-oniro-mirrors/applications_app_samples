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
 
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import fastbuffer from '@ohos.fastbuffer';
import { FastBufferUtil } from '../../../main/ets/model/utils/FastBufferUtil';

/**
 * FastBufferUtil 工具类设备侧测试
 * 覆盖：utf8/hex/base64 编解码往返、非法输入、字节序读写封装、批量拼接、
 * hexDump 格式（行数/ASCII 列/不可打印字符/地址列）、CRC32 标准校验值与篡改检测
 */
export default function fastBufferUtilTest() {
  describe('fastBufferUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0100
     * @tc.name utf8Roundtrip001
     * @tc.desc Verify utf8Encode/utf8Decode round-trip the original string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('utf8_roundtrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const origin = 'OpenHarmony FastBufferUtil';
      const decoded = FastBufferUtil.utf8Decode(FastBufferUtil.utf8Encode(origin));
      expect(decoded).assertEqual(origin);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0200
     * @tc.name toHexKnown002
     * @tc.desc Verify toHex encodes bytes as lowercase hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toHex_known', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.toHex(FastBufferUtil.utf8Encode('AB'))).assertEqual('4142');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0300
     * @tc.name fromHexValid003
     * @tc.desc Verify fromHex decodes valid hexadecimal strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_valid', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.utf8Decode(FastBufferUtil.fromHex('4142'))).assertEqual('AB');
      expect(FastBufferUtil.fromHex('74686973').toString('utf8')).assertEqual('this');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0400
     * @tc.name fromHexOddLengthThrows004
     * @tc.desc Verify fromHex throws for odd-length hexadecimal input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_oddLength_throws', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let thrown = false;
      try {
        FastBufferUtil.fromHex('414');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0500
     * @tc.name fromHexInvalidCharThrows005
     * @tc.desc Verify fromHex throws for non-hexadecimal characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('fromHex_invalidChar_throws', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let thrown = false;
      try {
        FastBufferUtil.fromHex('zz');
      } catch (err) {
        thrown = true;
      }
      expect(thrown).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0600
     * @tc.name base64Roundtrip006
     * @tc.desc Verify base64 encode-decode round-trips the payload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_roundtrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const origin = 'FastBufferUtil base64 roundtrip';
      const b64 = FastBufferUtil.toBase64(FastBufferUtil.utf8Encode(origin));
      const decoded = FastBufferUtil.utf8Decode(FastBufferUtil.fromBase64(b64));
      expect(decoded).assertEqual(origin);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0700
     * @tc.name writeReadUint32Endian007
     * @tc.desc Verify writeUint32/readUint32 support both byte orders at explicit offsets
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('writeRead_uint32_endian', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(8);
      FastBufferUtil.writeUint32(buf, 0x4F484F53, 0, false);
      FastBufferUtil.writeUint32(buf, 0x4F484F53, 4, true);
      expect(buf.toString('hex')).assertEqual('4f484f53534f484f');
      expect(FastBufferUtil.readUint32(buf, 0, false)).assertEqual(0x4F484F53);
      expect(FastBufferUtil.readUint32(buf, 4, true)).assertEqual(0x4F484F53);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0800
     * @tc.name concatAllLengthAndContent008
     * @tc.desc Verify concatAll joins buffers with the correct length and byte order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concatAll_lengthAndContent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const joined = FastBufferUtil.concatAll([
        FastBufferUtil.utf8Encode('AA'),
        FastBufferUtil.utf8Encode('BB'),
        FastBufferUtil.utf8Encode('CC')
      ]);
      expect(joined.length).assertEqual(6);
      expect(FastBufferUtil.utf8Decode(joined)).assertEqual('AABBCC');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_0900
     * @tc.name hexDumpEmpty009
     * @tc.desc Verify hexDump renders a placeholder for an empty buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.hexDump(fastbuffer.alloc(0))).assertEqual('Empty buffer');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_1000
     * @tc.name hexDumpLineCount010
     * @tc.desc Verify hexDump emits one line per sixteen bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_lineCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 25 字节按每行 16 字节 → 2 行
      const dump = FastBufferUtil.hexDump(FastBufferUtil.utf8Encode('a'.repeat(25)));
      expect(dump.split('\n').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_1100
     * @tc.name hexDumpAsciiColumn011
     * @tc.desc Verify hexDump includes the address column and the ASCII column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_asciiColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const dump = FastBufferUtil.hexDump(FastBufferUtil.utf8Encode('AB'));
      // 地址列 + ASCII 列
      expect(dump.startsWith('00000000')).assertTrue();
      expect(dump.includes('|AB|')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_1200
     * @tc.name hexDumpUnprintable012
     * @tc.desc Verify hexDump substitutes non-printable bytes with dots
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('hexDump_unprintable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeUInt8(0x01, 0);
      buf.writeUInt8(0x7e, 1);
      const dump = FastBufferUtil.hexDump(buf);
      // 不可打印字节显示为 '.'，0x7e 显示为 '~'
      expect(dump.includes('|.~|')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_1300
     * @tc.name crc32KnownVector013
     * @tc.desc Verify crc32 matches the standard vector for the 123456789 input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_knownVector', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 标准校验值：CRC32("123456789") = 0xCBF43926
      expect(FastBufferUtil.crc32(FastBufferUtil.utf8Encode('123456789'))).assertEqual(0xCBF43926);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_1400
     * @tc.name crc32Empty014
     * @tc.desc Verify crc32 of an empty buffer is zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_empty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(FastBufferUtil.crc32(fastbuffer.alloc(0))).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_1500
     * @tc.name crc32TamperDetected015
     * @tc.desc Verify crc32 changes after a single-byte payload tamper
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32_tamperDetected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const buf = FastBufferUtil.utf8Encode('integrity check payload');
      const before = FastBufferUtil.crc32(buf);
      buf.writeUInt8(buf.readUInt8(0) ^ 0xFF, 0);
      const after = FastBufferUtil.crc32(buf);
      expect(before !== after).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERUTIL_1600
     * @tc.name crc32HexFormat016
     * @tc.desc Verify crc32Hex renders the checksum as eight uppercase hexadecimal digits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('crc32Hex_format', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const hex = FastBufferUtil.crc32Hex(FastBufferUtil.utf8Encode('123456789'));
      expect(hex).assertEqual('CBF43926');
    });
  });
}
