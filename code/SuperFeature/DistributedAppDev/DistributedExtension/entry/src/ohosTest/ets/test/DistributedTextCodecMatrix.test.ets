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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { decodeUtf8, encodeUtf8, utf8Length } from '../../../main/ets/model/TextCodec';

/** 按字节序列构造 ArrayBuffer：解码用例要构造合法与非法两种输入 */
function bufferOf(values: number[]): ArrayBuffer {
  const buffer = new ArrayBuffer(values.length);
  const view = new Uint8Array(buffer);
  for (let i = 0; i < values.length; i++) {
    view[i] = values[i];
  }
  return buffer;
}

/** 取字节序列，便于把 encodeUtf8 的结果写成可读的期望值 */
function bytesOf(buffer: ArrayBuffer): number[] {
  const view = new Uint8Array(buffer);
  const values: number[] = [];
  for (let i = 0; i < view.length; i++) {
    values.push(view[i]);
  }
  return values;
}

function bytesText(values: number[]): string {
  return values.join(',');
}

/**
 * 手写 UTF-8 编解码：sendData 只接受 ArrayBuffer，页面上输入的是字符串，
 * 字节数算错会直接触发 32390103（数据过长）或 32390206（超过 1024 字节）。
 * 这里按 1/2/3/4 字节的码点边界逐段验证，并覆盖代理对与被截断的输入。
 */
export default function distributedTextCodecMatrixTest() {
  describe('DistributedTextCodecMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0100
     * @tc.name testCodec0001
     * @tc.desc Verify an empty string encodes to zero bytes and ASCII stays within one byte.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0001', 0, () => {
      expect(encodeUtf8('').byteLength).assertEqual(0);
      expect(bytesText(bytesOf(encodeUtf8('A')))).assertEqual('65');
      expect(bytesText(bytesOf(encodeUtf8('\u007F')))).assertEqual('127');
      expect(utf8Length('A')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0200
     * @tc.name testCodec0002
     * @tc.desc Verify the two byte range starts at U+0080 and ends at U+07FF.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0002', 0, () => {
      expect(bytesText(bytesOf(encodeUtf8('\u0080')))).assertEqual('194,128');
      expect(bytesText(bytesOf(encodeUtf8('\u07FF')))).assertEqual('223,191');
      expect(utf8Length('\u0080')).assertEqual(2);
      expect(utf8Length('\u07FF')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0300
     * @tc.name testCodec0003
     * @tc.desc Verify the three byte range starts at U+0800 and covers the CJK block.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0003', 0, () => {
      expect(bytesText(bytesOf(encodeUtf8('\u0800')))).assertEqual('224,160,128');
      expect(bytesText(bytesOf(encodeUtf8('\uFFFF')))).assertEqual('239,191,191');
      expect(bytesText(bytesOf(encodeUtf8('中')))).assertEqual('228,184,173');
      expect(utf8Length('中')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0400
     * @tc.name testCodec0004
     * @tc.desc Verify the four byte range covers U+10000 up to U+10FFFF.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0004', 0, () => {
      expect(bytesText(bytesOf(encodeUtf8('😀')))).assertEqual('240,159,152,128');
      expect(bytesText(bytesOf(encodeUtf8('\uDBFF\uDFFF')))).assertEqual('244,143,191,191');
      expect(encodeUtf8('😀').byteLength).assertEqual(4);
      expect(utf8Length('\uDBFF\uDFFF')).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0500
     * @tc.name testCodec0005
     * @tc.desc Verify utf8Length counts bytes rather than UTF-16 code units.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0005', 0, () => {
      expect('中文'.length).assertEqual(2);
      expect(utf8Length('中文')).assertEqual(6);
      expect('abc'.length).assertEqual(3);
      expect(utf8Length('abc')).assertEqual(3);
      expect(utf8Length('a中😀')).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0600
     * @tc.name testCodec0006
     * @tc.desc Verify a surrogate pair encodes as one four byte code point.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0006', 0, () => {
      expect('😀'.length).assertEqual(2);
      expect(utf8Length('😀')).assertEqual(4);
      // 孤立的半个代理没有高位可合并，按单个码元编码成 3 字节
      expect(utf8Length('\uD83D')).assertEqual(3);
      expect(utf8Length('\uDE00')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0700
     * @tc.name testCodec0007
     * @tc.desc Verify an isolated high surrogate is not merged with a following ASCII character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCodec0007', 0, () => {
      const isolated = '\uD83DA';
      expect(isolated.length).assertEqual(2);
      expect(utf8Length(isolated)).assertEqual(4);
      expect(bytesText(bytesOf(encodeUtf8(isolated)))).assertEqual('237,160,189,65');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0800
     * @tc.name testCodec0008
     * @tc.desc Verify ASCII and U+0000 decode back without being dropped.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0008', 0, () => {
      expect(decodeUtf8(bufferOf([0x41, 0x42, 0x43]))).assertEqual('ABC');
      expect(decodeUtf8(bufferOf([]))).assertEqual('');
      expect(decodeUtf8(bufferOf([0x00])).length).assertEqual(1);
      expect(decodeUtf8(bufferOf([0x00])).charCodeAt(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_0900
     * @tc.name testCodec0009
     * @tc.desc Verify the decoder rebuilds two, three and four byte sequences.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0009', 0, () => {
      expect(decodeUtf8(bufferOf([0xC3, 0xA9]))).assertEqual('é');
      expect(decodeUtf8(bufferOf([0xE4, 0xB8, 0xAD]))).assertEqual('中');
      expect(decodeUtf8(bufferOf([0xF0, 0x9F, 0x98, 0x80]))).assertEqual('😀');
      expect(decodeUtf8(bufferOf([0xF0, 0x9F, 0x98, 0x80])).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_1000
     * @tc.name testCodec0010
     * @tc.desc Verify encode and decode round trip for empty, ASCII, CJK and emoji samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0010', 0, () => {
      // 往返相等之外还要看字节数：空串 0 字节，单个汉字 3 字节，多写/漏写都会让对端不解包
      expect(encodeUtf8('').byteLength).assertEqual(0);
      expect(encodeUtf8('中').byteLength).assertEqual(3);
      const samples: string[] = ['', 'abc', '中', '中文混排 abc', '😀', 'a😀b中c'];
      for (let i = 0; i < samples.length; i++) {
        expect(decodeUtf8(encodeUtf8(samples[i]))).assertEqual(samples[i]);
      }
      expect(decodeUtf8(encodeUtf8('😀'))).assertEqual('😀');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_1100
     * @tc.name testCodec0011
     * @tc.desc Verify an illegal leading byte is skipped instead of aborting the whole buffer.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCodec0011', 0, () => {
      expect(decodeUtf8(bufferOf([0x80, 0x41]))).assertEqual('A');
      expect(decodeUtf8(bufferOf([0xFF, 0x41]))).assertEqual('A');
      expect(decodeUtf8(bufferOf([0xF8, 0x41]))).assertEqual('A');
      expect(decodeUtf8(bufferOf([0x80])).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_1200
     * @tc.name testCodec0012
     * @tc.desc Verify a truncated tail sequence stops decoding without throwing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCodec0012', 0, () => {
      expect(decodeUtf8(bufferOf([0xC3]))).assertEqual('');
      expect(decodeUtf8(bufferOf([0xE4, 0xB8]))).assertEqual('');
      expect(decodeUtf8(bufferOf([0xF0, 0x9F, 0x98]))).assertEqual('');
      expect(decodeUtf8(bufferOf([0x41, 0xE4, 0xB8]))).assertEqual('A');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_1300
     * @tc.name testCodec0013
     * @tc.desc Verify bytes after a truncated sequence are discarded rather than misread.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCodec0013', 0, () => {
      expect(decodeUtf8(bufferOf([0x41, 0xE4, 0x42]))).assertEqual('A');
      expect(decodeUtf8(bufferOf([0x41, 0xF0, 0x9F]))).assertEqual('A');
      expect(decodeUtf8(bufferOf([0xE4, 0x42]))).assertEqual('');
      expect(decodeUtf8(bufferOf([0x41, 0xE4, 0x42])).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_1400
     * @tc.name testCodec0014
     * @tc.desc Verify an overlong two byte sequence decodes to U+0000 as the mask logic dictates.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCodec0014', 0, () => {
      // 实测行为：0xC0 0x80 是 U+0000 的超长编码，解码器只做位掩码，故得到 NUL 而不是丢弃
      const overlong = decodeUtf8(bufferOf([0xC0, 0x80]));
      expect(overlong.length).assertEqual(1);
      expect(overlong.charCodeAt(0)).assertEqual(0);
      expect(overlong === '').assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODEC_1500
     * @tc.name testCodec0015
     * @tc.desc Verify utf8Length always equals the encoded byte length for representative samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodec0015', 0, () => {
      const samples: string[] = ['', ' ', 'abc', '中文', '😀', 'a😀b中c', '\u007F\u0080\u0800'];
      for (let i = 0; i < samples.length; i++) {
        expect(utf8Length(samples[i])).assertEqual(encodeUtf8(samples[i]).byteLength);
      }
      expect(utf8Length('')).assertEqual(0);
      expect(utf8Length('\u007F\u0080\u0800')).assertEqual(6);
    });
  });
}
