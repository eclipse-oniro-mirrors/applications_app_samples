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
import {
  CHANNEL_API_PAYLOAD_LIMIT, CHANNEL_PAYLOAD_LIMIT, LINK_PAYLOAD_LIMIT
} from '../../../main/ets/common/AppConstants';
import { clampPayload, decodeUtf8, encodeUtf8, toHexPreview, utf8Length } from '../../../main/ets/model/TextCodec';

/** 把字节数组装成 ArrayBuffer，用来构造截断、非法首字节等系统不会主动给出的输入 */
function bytesOf(values: number[]): ArrayBuffer {
  const buffer = new ArrayBuffer(values.length);
  const view = new Uint8Array(buffer);
  for (let i = 0; i < values.length; i++) {
    view[i] = values[i];
  }
  return buffer;
}

/** 完整十六进制：limit 放大到 64，避免短样本被 … 截断 */
function hexOf(text: string): string {
  return toHexPreview(encodeUtf8(text), 64);
}

function roundTrip(text: string): string {
  return decodeUtf8(encodeUtf8(text));
}

function repeatText(unit: string, count: number): string {
  const parts: string[] = [];
  for (let i = 0; i < count; i++) {
    parts.push(unit);
  }
  return parts.join('');
}

/** UTF-8 规则：独立于被测实现，按码点区间算出期望字节数 */
function expectedBytes(code: number): number {
  if (code < 0x80) {
    return 1;
  }
  if (code < 0x800) {
    return 2;
  }
  return code < 0x10000 ? 3 : 4;
}

/**
 * UTF-8 编解码边界（分）：按 1/2/3/4 字节区间的上下界、孤立代理、截断尾字节、非法首字节、
 * 十六进制预览的 limit 边界与 clampPayload 的整字符裁剪逐一断言，再用码点扫描做大样本往返。
 */
export default function distributedCodecBoundaryMatrixTest() {
  describe('DistributedCodecBoundaryMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0100
     * @tc.name testCodecBound0001
     * @tc.desc Verify U+0000 and U+007F stay single bytes and round trip unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0001', 0, () => {
      expect(hexOf('\u0000')).assertEqual('00');
      expect(hexOf('\u007F')).assertEqual('7F');
      expect(utf8Length('\u0000')).assertEqual(1);
      expect(utf8Length('\u007F')).assertEqual(1);
      expect(roundTrip('\u0000')).assertEqual('\u0000');
      expect(roundTrip('\u007F')).assertEqual('\u007F');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0200
     * @tc.name testCodecBound0002
     * @tc.desc Verify U+0080 and U+07FF are the lower and upper bounds of the two byte form.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0002', 0, () => {
      expect(hexOf('\u0080')).assertEqual('C2 80');
      expect(hexOf('\u07FF')).assertEqual('DF BF');
      expect(utf8Length('\u0080')).assertEqual(2);
      expect(utf8Length('\u07FF')).assertEqual(2);
      expect(roundTrip('\u0080')).assertEqual('\u0080');
      expect(roundTrip('\u07FF')).assertEqual('\u07FF');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0300
     * @tc.name testCodecBound0003
     * @tc.desc Verify U+0800 and U+FFFF are the lower and upper bounds of the three byte form.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0003', 0, () => {
      expect(hexOf('\u0800')).assertEqual('E0 A0 80');
      expect(hexOf('\uFFFF')).assertEqual('EF BF BF');
      expect(utf8Length('\u0800')).assertEqual(3);
      expect(utf8Length('\uFFFF')).assertEqual(3);
      expect(roundTrip('\u0800')).assertEqual('\u0800');
      expect(roundTrip('\uFFFF')).assertEqual('\uFFFF');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0400
     * @tc.name testCodecBound0004
     * @tc.desc Verify U+10000 and U+10FFFF become four bytes from a surrogate pair and back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0004', 0, () => {
      const lowest = '\uD800\uDC00';
      const highest = '\uDBFF\uDFFF';
      expect(hexOf(lowest)).assertEqual('F0 90 80 80');
      expect(hexOf(highest)).assertEqual('F4 8F BF BF');
      expect(utf8Length(lowest)).assertEqual(4);
      expect(lowest.length).assertEqual(2);
      expect(roundTrip(lowest)).assertEqual(lowest);
      expect(roundTrip(highest)).assertEqual(highest);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0500
     * @tc.name testCodecBound0005
     * @tc.desc Verify common Latin, CJK, currency and emoji characters encode to their reference bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0005', 0, () => {
      expect(hexOf('é')).assertEqual('C3 A9');
      expect(hexOf('中')).assertEqual('E4 B8 AD');
      expect(hexOf('€')).assertEqual('E2 82 AC');
      expect(hexOf('😀')).assertEqual('F0 9F 98 80');
      expect(roundTrip('é中€😀')).assertEqual('é中€😀');
      expect(utf8Length('é中€😀')).assertEqual(12);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0600
     * @tc.name testCodecBound0006
     * @tc.desc Verify lone surrogates are written as their raw three byte value and decode back.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0006', 0, () => {
      expect(hexOf('\uD800')).assertEqual('ED A0 80');
      expect(hexOf('\uDC00')).assertEqual('ED B0 80');
      expect(hexOf('\uDFFF')).assertEqual('ED BF BF');
      expect(roundTrip('\uD800')).assertEqual('\uD800');
      expect(roundTrip('\uDC00')).assertEqual('\uDC00');
      expect(utf8Length('\uDFFF')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0700
     * @tc.name testCodecBound0007
     * @tc.desc Verify a high surrogate at the end, before a letter or after a low one is not paired.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0007', 0, () => {
      expect(hexOf('a\uD800')).assertEqual('61 ED A0 80');
      expect(hexOf('\uD800A')).assertEqual('ED A0 80 41');
      expect(hexOf('\uDC00\uD800')).assertEqual('ED B0 80 ED A0 80');
      expect(utf8Length('\uDC00\uD800')).assertEqual(6);
      expect(roundTrip('\uD800A')).assertEqual('\uD800A');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0800
     * @tc.name testCodecBound0008
     * @tc.desc Verify the decoder skips stray continuation bytes and lead bytes from F8 upward.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0008', 0, () => {
      expect(decodeUtf8(bytesOf([0x80, 0x41]))).assertEqual('A');
      expect(decodeUtf8(bytesOf([0xFF, 0x42]))).assertEqual('B');
      expect(decodeUtf8(bytesOf([0xF8, 0x43]))).assertEqual('C');
      expect(decodeUtf8(bytesOf([0xBF]))).assertEqual('');
      expect(decodeUtf8(bytesOf([0x80, 0x80, 0x80, 0x44]))).assertEqual('D');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_0900
     * @tc.name testCodecBound0009
     * @tc.desc Verify a truncated multi byte tail stops decoding and keeps the complete prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0009', 0, () => {
      expect(decodeUtf8(bytesOf([0xC3]))).assertEqual('');
      expect(decodeUtf8(bytesOf([0x41, 0xE4, 0xB8]))).assertEqual('A');
      expect(decodeUtf8(bytesOf([0xF0, 0x9F, 0x98]))).assertEqual('');
      expect(decodeUtf8(bytesOf([0x41, 0x42, 0xF0]))).assertEqual('AB');
      expect(decodeUtf8(bytesOf([0xE4, 0xB8, 0xAD, 0xE4]))).assertEqual('中');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1000
     * @tc.name testCodecBound0010
     * @tc.desc Verify overlong forms and unchecked continuation bytes are decoded without validation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0010', 0, () => {
      const overlong2 = decodeUtf8(bytesOf([0xC0, 0x80]));
      const overlong3 = decodeUtf8(bytesOf([0xE0, 0x80, 0x80]));
      const loose = decodeUtf8(bytesOf([0xC3, 0x41]));
      expect(overlong2.length).assertEqual(1);
      expect(overlong2.charCodeAt(0)).assertEqual(0);
      expect(overlong3.charCodeAt(0)).assertEqual(0);
      expect(loose.length).assertEqual(1);
      expect(loose.charCodeAt(0)).assertEqual(0xC1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1100
     * @tc.name testCodecBound0011
     * @tc.desc Verify a four byte value above U+10FFFF still splits into two UTF-16 units.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0011', 0, () => {
      const text = decodeUtf8(bytesOf([0xF7, 0xBF, 0xBF, 0xBF]));
      expect(text.length).assertEqual(2);
      expect(text.charCodeAt(0)).assertEqual(0xDFBF);
      expect(text.charCodeAt(1)).assertEqual(0xDFFF);
      expect(decodeUtf8(bytesOf([0xF4, 0x8F, 0xBF, 0xBF]))).assertEqual('\uDBFF\uDFFF');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1200
     * @tc.name testCodecBound0012
     * @tc.desc Verify all ninety five printable ASCII characters round trip one byte each.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0012', 0, () => {
      let text = '';
      for (let code = 0x20; code <= 0x7E; code++) {
        text += String.fromCharCode(code);
      }
      expect(text.length).assertEqual(95);
      expect(utf8Length(text)).assertEqual(95);
      expect(roundTrip(text)).assertEqual(text);
      expect(toHexPreview(encodeUtf8(text))).assertEqual('20 21 22 23 24 25 26 27 28 29 2A 2B 2C 2D 2E 2F …');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1300
     * @tc.name testCodecBound0013
     * @tc.desc Verify a 256 point sweep across the BMP matches the reference byte length and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0013', 0, () => {
      let checked = 0;
      let mismatched = 0;
      let totalBytes = 0;
      for (let code = 0; code <= 0xFFFF; code += 257) {
        const ch = String.fromCharCode(code);
        const size = utf8Length(ch);
        mismatched += size === expectedBytes(code) && roundTrip(ch) === ch ? 0 : 1;
        totalBytes += size;
        checked++;
      }
      expect(checked).assertEqual(256);
      expect(mismatched).assertEqual(0);
      expect(totalBytes > checked * 2).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1400
     * @tc.name testCodecBound0014
     * @tc.desc Verify a 241 point sweep across the supplementary planes is four bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0014', 0, () => {
      let checked = 0;
      let mismatched = 0;
      for (let code = 0x10000; code <= 0x10FFFF; code += 0x1111) {
        const offset = code - 0x10000;
        const ch = String.fromCharCode(0xD800 + (offset >> 10), 0xDC00 + (offset & 0x3FF));
        mismatched += utf8Length(ch) === 4 && roundTrip(ch) === ch ? 0 : 1;
        checked++;
      }
      expect(checked).assertEqual(241);
      expect(mismatched).assertEqual(0);
      expect(expectedBytes(0x10FFFF)).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1500
     * @tc.name testCodecBound0015
     * @tc.desc Verify a mixed one to four byte string reports bytes, UTF-16 length and hex together.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0015', 0, () => {
      const text = 'a中😀é';
      expect(text.length).assertEqual(5);
      expect(utf8Length(text)).assertEqual(10);
      expect(hexOf(text)).assertEqual('61 E4 B8 AD F0 9F 98 80 C3 A9');
      expect(roundTrip(text)).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1600
     * @tc.name testCodecBound0016
     * @tc.desc Verify the hex preview limit for a 20 byte payload across default, exact, larger and tiny limits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0016', 0, () => {
      const payload = encodeUtf8('abcdefghijklmnopqrst');
      expect(toHexPreview(payload)).assertEqual('61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F 70 …');
      expect(toHexPreview(payload, 20)).assertEqual('61 62 63 64 65 66 67 68 69 6A 6B 6C 6D 6E 6F 70 71 72 73 74');
      expect(toHexPreview(payload, 100)).assertEqual(toHexPreview(payload, 20));
      expect(toHexPreview(payload, 1)).assertEqual('61 …');
      expect(toHexPreview(payload, 0)).assertEqual(' …');
      expect(toHexPreview(payload, -1)).assertEqual(' …');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1700
     * @tc.name testCodecBound0017
     * @tc.desc Verify an empty payload previews as empty unless the limit is negative.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0017', 0, () => {
      const empty = new ArrayBuffer(0);
      expect(toHexPreview(empty)).assertEqual('');
      expect(toHexPreview(empty, 0)).assertEqual('');
      expect(toHexPreview(empty, -1)).assertEqual(' …');
      expect(decodeUtf8(empty)).assertEqual('');
      expect(encodeUtf8('').byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1800
     * @tc.name testCodecBound0018
     * @tc.desc Verify hex preview pads single digit bytes and upper cases letters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0018', 0, () => {
      expect(toHexPreview(bytesOf([0, 1, 15, 16, 255]))).assertEqual('00 01 0F 10 FF');
      expect(toHexPreview(bytesOf([0x0A, 0x0B, 0xC0, 0xDE]))).assertEqual('0A 0B C0 DE');
      expect(toHexPreview(bytesOf([0x7F]))).assertEqual('7F');
      expect(toHexPreview(bytesOf([0x80, 0x81]), 1)).assertEqual('80 …');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_1900
     * @tc.name testCodecBound0019
     * @tc.desc Verify clampPayload returns empty for non positive budgets and keeps short ASCII intact.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0019', 0, () => {
      expect(clampPayload('abc', 0)).assertEqual('');
      expect(clampPayload('abc', -5)).assertEqual('');
      expect(clampPayload('abc', 2)).assertEqual('ab');
      expect(clampPayload('abc', 3)).assertEqual('abc');
      expect(clampPayload('abc', 10)).assertEqual('abc');
      expect(clampPayload('', 10)).assertEqual('');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_2000
     * @tc.name testCodecBound0020
     * @tc.desc Verify clampPayload drops a whole CJK character instead of cutting it in half.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0020', 0, () => {
      expect(clampPayload('a中b', 1)).assertEqual('a');
      expect(clampPayload('a中b', 2)).assertEqual('a');
      expect(clampPayload('a中b', 3)).assertEqual('a');
      expect(clampPayload('a中b', 4)).assertEqual('a中');
      expect(clampPayload('a中b', 5)).assertEqual('a中b');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_2100
     * @tc.name testCodecBound0021
     * @tc.desc Verify clampPayload charges each UTF-16 unit of an emoji three bytes on its own.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0021', 0, () => {
      // clampPayload 逐个 UTF-16 单元计费：单独的代理按 3 字节算，所以一对代理需要 6 字节预算
      expect(clampPayload('😀', 2)).assertEqual('');
      expect(clampPayload('😀', 3)).assertEqual('\uD83D');
      expect(clampPayload('😀', 5)).assertEqual('\uD83D');
      expect(clampPayload('😀', 6)).assertEqual('😀');
      expect(utf8Length(clampPayload('😀', 6))).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_2200
     * @tc.name testCodecBound0022
     * @tc.desc Verify the 1024 byte link limit fits 1024 ASCII bytes but only 341 CJK characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0022', 0, () => {
      const ascii = repeatText('a', LINK_PAYLOAD_LIMIT);
      const cjk = repeatText('中', 342);
      expect(utf8Length(ascii)).assertEqual(LINK_PAYLOAD_LIMIT);
      expect(clampPayload(ascii, LINK_PAYLOAD_LIMIT)).assertEqual(ascii);
      expect(utf8Length(cjk)).assertEqual(1026);
      expect(clampPayload(cjk, LINK_PAYLOAD_LIMIT).length).assertEqual(341);
      expect(utf8Length(clampPayload(cjk, LINK_PAYLOAD_LIMIT))).assertEqual(1023);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_2300
     * @tc.name testCodecBound0023
     * @tc.desc Verify the demo and API channel limits clamp CJK and ASCII payloads on whole characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0023', 0, () => {
      const cjk = repeatText('中', 86);
      const ascii = repeatText('ab', 2048);
      expect(utf8Length(cjk)).assertEqual(258);
      expect(clampPayload(cjk, CHANNEL_PAYLOAD_LIMIT).length).assertEqual(85);
      expect(utf8Length(clampPayload(cjk, CHANNEL_PAYLOAD_LIMIT))).assertEqual(255);
      expect(utf8Length(ascii)).assertEqual(CHANNEL_API_PAYLOAD_LIMIT);
      expect(clampPayload(ascii + 'c', CHANNEL_API_PAYLOAD_LIMIT)).assertEqual(ascii);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_2400
     * @tc.name testCodecBound0024
     * @tc.desc Verify a 4 by 6 grid of texts and budgets always clamps to a byte bounded round trippable prefix.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0024', 0, () => {
      const texts: string[] = ['hello', '中文载荷', 'a中😀é', 'mixed 混合 😀😀'];
      const budgets: number[] = [1, 3, 4, 7, 12, 64];
      let combos = 0;
      let broken = 0;
      for (const text of texts) {
        for (const budget of budgets) {
          const clamped = clampPayload(text, budget);
          const ok = utf8Length(clamped) <= budget && text.startsWith(clamped) && roundTrip(clamped) === clamped;
          broken += ok ? 0 : 1;
          combos++;
        }
      }
      expect(combos).assertEqual(24);
      expect(broken).assertEqual(0);
      expect(clampPayload('mixed 混合 😀😀', 64)).assertEqual('mixed 混合 😀😀');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CODECB_2500
     * @tc.name testCodecBound0025
     * @tc.desc Verify utf8Length always equals the encoded byteLength for a set of mixed samples.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCodecBound0025', 0, () => {
      const samples: string[] = ['', ' ', 'abc', 'é', '中', '😀', '\uD800', 'a中😀é', repeatText('中😀', 50)];
      let mismatched = 0;
      for (const sample of samples) {
        mismatched += utf8Length(sample) === encodeUtf8(sample).byteLength ? 0 : 1;
      }
      expect(mismatched).assertEqual(0);
      expect(utf8Length(repeatText('中😀', 50))).assertEqual(350);
      expect(samples.length).assertEqual(9);
    });
  });
}
