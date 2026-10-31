import { describe, beforeAll, it, expect } from '@ohos/hypium';
import fastbuffer from '@ohos.fastbuffer';

/**
 * FastBuffer 基础能力设备侧测试（RK3568 / API 26 镜像）
 * 覆盖：创建（from/alloc/边界）、二进制读写（UInt32BE/LE/Int8）、
 * 编码转换（hex/base64）、concat 拼接、copy/subarray 片段、equals/compare、byteLength/isBuffer/fill
 */
export default function fastBufferBasicsTest() {
  describe('fastBufferBasicsTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0100
     * @tc.name fromStringLengthAndUtf8Roundtrip001
     * @tc.desc Verify fastbuffer.from(string) reports the utf8 byte length and round-trips the content
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('from_string_length', 0, () => {
      const buf = fastbuffer.from('OpenHarmony FastBuffer');
      expect(buf.length).assertEqual(22);
      expect(buf.toString('utf8')).assertEqual('OpenHarmony FastBuffer');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0200
     * @tc.name allocZeroFill002
     * @tc.desc Verify alloc creates a zero-filled buffer of the requested size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('alloc_zeroFill', 0, () => {
      const buf = fastbuffer.alloc(8);
      expect(buf.length).assertEqual(8);
      // 默认填充 0x00
      expect(buf.toString('hex')).assertEqual('0000000000000000');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0300
     * @tc.name allocFillChar003
     * @tc.desc Verify alloc with a fill character repeats the character across the buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('alloc_fillChar', 0, () => {
      const buf = fastbuffer.alloc(5, 'a');
      expect(buf.toString('utf8')).assertEqual('aaaaa');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0400
     * @tc.name allocZeroSizeAndEmptyString004
     * @tc.desc Verify zero-length alloc and empty-string from return empty buffers without throwing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('alloc_zeroSize_and_emptyString', 0, () => {
      // 边界：长度 0 不抛异常
      const empty = fastbuffer.alloc(0);
      expect(empty.length).assertEqual(0);
      const fromEmpty = fastbuffer.from('');
      expect(fromEmpty.length).assertEqual(0);
      expect(fromEmpty.toString('utf8')).assertEqual('');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0500
     * @tc.name writeReadUint32BERoundtrip005
     * @tc.desc Verify writeUInt32BE/readUInt32BE round-trip and produce big-endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('writeRead_uint32BE_roundtrip', 0, () => {
      const buf = fastbuffer.alloc(8);
      buf.writeUInt32BE(0x4F484F53, 0);
      buf.writeUInt32BE(20, 4);
      expect(buf.readUInt32BE(0)).assertEqual(0x4F484F53);
      expect(buf.readUInt32BE(4)).assertEqual(20);
      expect(buf.toString('hex')).assertEqual('4f484f5300000014');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0600
     * @tc.name writeReadUint32LERoundtrip006
     * @tc.desc Verify writeUInt32LE/readUInt32LE round-trip and produce little-endian bytes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('writeRead_uint32LE_roundtrip', 0, () => {
      const buf = fastbuffer.alloc(4);
      buf.writeUInt32LE(0x12345678, 0);
      expect(buf.readUInt32LE(0)).assertEqual(0x12345678);
      // 小端序字节序校验
      expect(buf.toString('hex')).assertEqual('78563412');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0700
     * @tc.name writeReadInt8Negative007
     * @tc.desc Verify signed byte round-trip for negative values and the unsigned reinterpretation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('writeRead_int8_negative', 0, () => {
      const buf = fastbuffer.alloc(2);
      buf.writeInt8(-2, 0);
      buf.writeInt8(5, 1);
      expect(buf.readInt8(0)).assertEqual(-2);
      expect(buf.readInt8(1)).assertEqual(5);
      // -2 的无符号表示为 254
      expect(buf.readUInt8(0)).assertEqual(254);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0800
     * @tc.name toStringHex008
     * @tc.desc Verify toString with hex encoding converts bytes to lowercase hexadecimal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('toString_hex', 0, () => {
      expect(fastbuffer.from('AB').toString('hex')).assertEqual('4142');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_0900
     * @tc.name base64Roundtrip009
     * @tc.desc Verify base64 encode-decode round-trips the original text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('base64_roundtrip', 0, () => {
      const origin = 'OpenHarmony FastBuffer';
      const b64 = fastbuffer.from(origin).toString('base64');
      const restored = fastbuffer.from(b64, 'base64').toString('utf8');
      expect(restored).assertEqual(origin);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_1000
     * @tc.name fromHexDecode010
     * @tc.desc Verify from with hex encoding decodes hexadecimal input into the expected text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('from_hex_decode', 0, () => {
      expect(fastbuffer.from('74686973', 'hex').toString('utf8')).assertEqual('this');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_1100
     * @tc.name concatLengthAndTruncation011
     * @tc.desc Verify concat joins buffers with the correct length and honors totalLength truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('concat_lengthAndContent', 0, () => {
      const b1 = fastbuffer.from('AB');
      const b2 = fastbuffer.from('CD');
      const joined = fastbuffer.concat([b1, b2]);
      expect(joined.length).assertEqual(4);
      expect(joined.toString('hex')).assertEqual('41424344');
      // totalLength 截断语义
      const truncated = fastbuffer.concat([b1, b2], 3);
      expect(truncated.length).assertEqual(3);
      expect(truncated.toString('hex')).assertEqual('414243');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_1200
     * @tc.name copyTailBytes012
     * @tc.desc Verify copy copies a source range into the destination and returns the copied byte count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('copy_tailBytes', 0, () => {
      const src = fastbuffer.from('0123456789');
      const dst = fastbuffer.alloc(4);
      const n = src.copy(dst, 0, 6, 10);
      expect(n).assertEqual(4);
      expect(dst.toString('utf8')).assertEqual('6789');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_1300
     * @tc.name subarraySharedMemory013
     * @tc.desc Verify subarray returns a memory-sharing view whose writes mutate the parent buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('subarray_sharedMemory', 0, () => {
      const buf = fastbuffer.from('abcdef');
      const view = buf.subarray(0, 3);
      expect(view.toString('utf8')).assertEqual('abc');
      // 修改切片视图，原缓冲区同步变化（共享内存语义）
      view.writeUInt8(0x58, 0);
      expect(buf.toString('utf8')).assertEqual('Xbcdef');
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_1400
     * @tc.name equalsAndCompare014
     * @tc.desc Verify equals and compare distinguish equal, unequal and ordered buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('equals_and_compare', 0, () => {
      const b1 = fastbuffer.from('ABC');
      const b2 = fastbuffer.from('414243', 'hex');
      const b3 = fastbuffer.from('ABCD');
      expect(b1.equals(b2)).assertTrue();
      expect(b1.equals(b3)).assertFalse();
      expect(b1.compare(b2)).assertEqual(0);
      expect(b3.compare(b1)).assertEqual(1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_1500
     * @tc.name byteLengthMultibyte015
     * @tc.desc Verify byteLength reports byte counts for ascii and multi-byte strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('byteLength_multibyte', 0, () => {
      expect(fastbuffer.byteLength('hello world', 'utf-8')).assertEqual(11);
      // 多字节字符：9 个字符占 12 字节（docs 官方示例）
      expect(fastbuffer.byteLength('\u00bd + \u00bc = \u00be', 'utf-8')).assertEqual(12);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_FASTBUFFERBASICS_1600
     * @tc.name isBufferAndFill016
     * @tc.desc Verify isBuffer identifies FastBuffer instances and fill repeats a character
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('isBuffer_and_fill', 0, () => {
      expect(fastbuffer.isBuffer(fastbuffer.alloc(4))).assertTrue();
      expect(fastbuffer.isBuffer('string')).assertFalse();
      expect(fastbuffer.isBuffer(new Uint8Array(4))).assertFalse();
      const filled = fastbuffer.alloc(6).fill('h');
      expect(filled.toString('utf8')).assertEqual('hhhhhh');
    });
  });
}
