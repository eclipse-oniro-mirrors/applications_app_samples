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
import { clampPayload, encodeUtf8, toHexPreview, utf8Length } from '../../../main/ets/model/TextCodec';

/** 按字节序列构造 ArrayBuffer，用来固定十六进制预览的期望值 */
function bufferOf(values: number[]): ArrayBuffer {
  const buffer = new ArrayBuffer(values.length);
  const view = new Uint8Array(buffer);
  for (let i = 0; i < values.length; i++) {
    view[i] = values[i];
  }
  return buffer;
}

/** 生成 0..count-1 递增的字节缓冲，用来验证 16 字节默认上限 */
function rangeBuffer(count: number): ArrayBuffer {
  const values: number[] = [];
  for (let i = 0; i < count; i++) {
    values.push(i);
  }
  return bufferOf(values);
}

/**
 * 发送前的十六进制预览与按字节裁剪：日志里展示的就是这两个函数的返回值，
 * 预览漏掉字节会让读者误判实际发出的内容，裁剪多留一个字节会直接触发上限错误码。
 */
export default function distributedPayloadPreviewMatrixTest() {
  describe('DistributedPayloadPreviewMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0100
     * @tc.name testPreview0001
     * @tc.desc Verify every byte is rendered as two uppercase hex digits.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreview0001', 0, () => {
      expect(toHexPreview(bufferOf([0]))).assertEqual('00');
      expect(toHexPreview(bufferOf([15]))).assertEqual('0F');
      expect(toHexPreview(bufferOf([16]))).assertEqual('10');
      expect(toHexPreview(bufferOf([255]))).assertEqual('FF');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0200
     * @tc.name testPreview0002
     * @tc.desc Verify multiple bytes are separated by one space.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreview0002', 0, () => {
      expect(toHexPreview(bufferOf([0, 1, 15, 16, 255]))).assertEqual('00 01 0F 10 FF');
      expect(toHexPreview(bufferOf([0x41, 0x42]))).assertEqual('41 42');
      expect(toHexPreview(encodeUtf8('中'))).assertEqual('E4 B8 AD');
      expect(toHexPreview(encodeUtf8('中文'))).assertEqual('E4 B8 AD E6 96 87');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0300
     * @tc.name testPreview0003
     * @tc.desc Verify an empty buffer previews as an empty string with no ellipsis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPreview0003', 0, () => {
      expect(toHexPreview(bufferOf([]))).assertEqual('');
      expect(toHexPreview(bufferOf([]), 0)).assertEqual('');
      expect(toHexPreview(bufferOf([])).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0400
     * @tc.name testPreview0004
     * @tc.desc Verify exactly sixteen bytes are shown in full with no ellipsis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreview0004', 0, () => {
      const preview = toHexPreview(rangeBuffer(16));
      expect(preview.endsWith('…')).assertFalse();
      // 16 组两位十六进制 + 15 个分隔空格
      expect(preview.length).assertEqual(47);
      expect(preview.startsWith('00 01 02')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0500
     * @tc.name testPreview0005
     * @tc.desc Verify a seventeenth byte is replaced by the ellipsis marker.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreview0005', 0, () => {
      const preview = toHexPreview(rangeBuffer(17));
      expect(preview.endsWith(' …')).assertTrue();
      expect(preview.includes('10')).assertFalse();
      expect(preview.length).assertEqual(49);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0600
     * @tc.name testPreview0006
     * @tc.desc Verify the limit argument truncates the preview at the requested byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testPreview0006', 0, () => {
      const three = bufferOf([0x0A, 0x0B, 0x0C]);
      expect(toHexPreview(three, 1)).assertEqual('0A …');
      expect(toHexPreview(three, 0)).assertEqual(' …');
      expect(toHexPreview(three, 2)).assertEqual('0A 0B …');
      expect(toHexPreview(three, 3)).assertEqual('0A 0B 0C');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0700
     * @tc.name testPreview0007
     * @tc.desc Verify a limit larger than the buffer does not append the ellipsis.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPreview0007', 0, () => {
      const five = bufferOf([1, 2, 3, 4, 5]);
      expect(toHexPreview(five, 5)).assertEqual('01 02 03 04 05');
      expect(toHexPreview(five, 100)).assertEqual('01 02 03 04 05');
      expect(toHexPreview(five, 4)).assertEqual('01 02 03 04 …');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0800
     * @tc.name testPreview0008
     * @tc.desc Verify the default limit equals sixteen bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPreview0008', 0, () => {
      const twenty = rangeBuffer(20);
      expect(toHexPreview(twenty)).assertEqual(toHexPreview(twenty, 16));
      expect(toHexPreview(twenty) === toHexPreview(twenty, 17)).assertFalse();
      expect(toHexPreview(twenty, 20).endsWith('…')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_PREVIEW_0900
     * @tc.name testPreview0009
     * @tc.desc Verify a non positive limit keeps the ellipsis so the preview is never silently complete.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testPreview0009', 0, () => {
      const two = bufferOf([1, 2]);
      expect(toHexPreview(two, -1)).assertEqual(' …');
      expect(toHexPreview(two, -1).includes('01')).assertFalse();
      expect(toHexPreview(two, -1) === toHexPreview(two, 0)).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0100
     * @tc.name testClamp0001
     * @tc.desc Verify a non positive byte budget yields an empty payload.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClamp0001', 0, () => {
      expect(clampPayload('abc', 0)).assertEqual('');
      expect(clampPayload('abc', -1)).assertEqual('');
      expect(clampPayload('', 10)).assertEqual('');
      expect(utf8Length(clampPayload('中文', -100))).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0200
     * @tc.name testClamp0002
     * @tc.desc Verify ASCII text is trimmed at the exact byte boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClamp0002', 0, () => {
      expect(clampPayload('abc', 1)).assertEqual('a');
      expect(clampPayload('abc', 3)).assertEqual('abc');
      expect(clampPayload('abcd', 3)).assertEqual('abc');
      expect(clampPayload('abcdef', 100)).assertEqual('abcdef');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0300
     * @tc.name testClamp0003
     * @tc.desc Verify a three byte CJK character is dropped whole instead of being cut in half.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClamp0003', 0, () => {
      expect(clampPayload('中文', 2)).assertEqual('');
      expect(clampPayload('中文', 3)).assertEqual('中');
      expect(clampPayload('中文', 5)).assertEqual('中');
      expect(clampPayload('中文', 6)).assertEqual('中文');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0400
     * @tc.name testClamp0004
     * @tc.desc Verify mixed ASCII and CJK text keeps the prefix that fits the budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClamp0004', 0, () => {
      const mixed = 'a中b';
      expect(utf8Length(mixed)).assertEqual(5);
      expect(clampPayload(mixed, 4)).assertEqual('a中');
      expect(clampPayload(mixed, 1)).assertEqual('a');
      expect(clampPayload(mixed, 2)).assertEqual('a');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0500
     * @tc.name testClamp0005
     * @tc.desc Verify the clamp counts UTF-16 code units so a surrogate pair needs six bytes to survive.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testClamp0005', 0, () => {
      // 实测行为：循环按 charAt 逐码元取长度，一个 emoji 被算成 3+3 字节，
      // 因此 4 或 5 字节预算都会切出孤立高代理，只有 6 字节才留下完整字符
      const emoji = '😀';
      expect(utf8Length(emoji)).assertEqual(4);
      expect(clampPayload(emoji, 4).length).assertEqual(1);
      expect(clampPayload(emoji, 5).charCodeAt(0)).assertEqual(0xD83D);
      expect(clampPayload(emoji, 6)).assertEqual(emoji);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0600
     * @tc.name testClamp0006
     * @tc.desc Verify two consecutive emoji are trimmed one code point at a time under a six byte budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testClamp0006', 0, () => {
      const pairs = '😀😀';
      expect(utf8Length(pairs)).assertEqual(8);
      expect(clampPayload(pairs, 6)).assertEqual('😀');
      expect(clampPayload(pairs, 5).length).assertEqual(1);
      expect(utf8Length(clampPayload(pairs, 6))).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0700
     * @tc.name testClamp0007
     * @tc.desc Verify the clamped result never exceeds the requested byte budget.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClamp0007', 0, () => {
      const text = '分布式扩展与链路示例 abc 😀';
      const limits: number[] = [0, 1, 3, 4, 7, 12, 30];
      for (let i = 0; i < limits.length; i++) {
        expect(utf8Length(clampPayload(text, limits[i])) <= limits[i]).assertTrue();
      }
      expect(clampPayload(text, 1000)).assertEqual(text);
      // 4 字节只装得下一个 3 字节汉字，剩下 1 字节放不下第二个字，不能硬塞成半个字符
      expect(clampPayload(text, 4)).assertEqual('分');
      expect(utf8Length(clampPayload(text, 4))).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0800
     * @tc.name testClamp0008
     * @tc.desc Verify the clamped text is always a prefix of the original text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClamp0008', 0, () => {
      const text = 'abcdef';
      const clamped = clampPayload(text, 4);
      expect(clamped).assertEqual('abcd');
      expect(text.startsWith(clamped)).assertTrue();
      expect(clamped.length < text.length).assertTrue();
      expect(clampPayload(text, text.length)).assertEqual(text);
    });
  });
}
