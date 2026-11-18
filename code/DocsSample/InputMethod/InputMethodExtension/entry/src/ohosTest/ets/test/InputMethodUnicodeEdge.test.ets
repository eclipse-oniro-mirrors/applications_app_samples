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

import { describe, expect, it } from '@ohos/hypium';
import { utf8Bytes } from '../../../main/ets/model/ExtraConfigModel';
import {
  appendChar,
  candidatesFor,
  charCount,
  deleteLast
} from '../../../main/ets/model/KeyboardModel';
import { truncateMiddle } from '../../../main/ets/utils/FormatUtil';

/** UTF-8 四个字节档位的分界码点：左右各取一个，用来卡住 "<" 与 "<=" 的选择 */
const ASCII_MAX: string = String.fromCharCode(0x7F);
const TWO_BYTE_MIN: string = String.fromCharCode(0x80);
const TWO_BYTE_MAX: string = String.fromCharCode(0x7FF);
const THREE_BYTE_MIN: string = String.fromCharCode(0x800);
const BMP_MAX: string = String.fromCharCode(0xFFFF);
/** U+10000 及以上必须用代理对表示，这里是最小的四字节字符 */
const FOUR_BYTE_MIN: string = String.fromCharCode(0xD800, 0xDC00);

/** 高代理与低代理各取一个孤立值，两个都不构成合法字符 */
const LONE_HIGH: string = String.fromCharCode(0xD800);
const LONE_LOW: string = String.fromCharCode(0xDC00);
const EMOJI: string = String.fromCharCode(0xD83D, 0xDE00);

/**
 * Unicode 码点边界：UTF-8 字节档位的分界、代理对与孤立代理。
 *
 * 这一层用的是"逐个 code unit 判断"的估算，不是标准编码器：高代理一律记 4 字节并顺手跳过
 * 后一个 code unit，低代理单独出现记 3 字节。能不能对上标准编码，取决于后面那个 code unit
 * 到底是不是低代理。此前的用例只取了 ASCII/拉丁/CJK/emoji 四类代表值，恰好都落在正确的一侧，
 * 分界点和孤立代理这两类情况一条都没测。
 */
export default function inputMethodUnicodeEdgeTest() {
  describe('InputMethodUnicodeEdgeTest', () => {
    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0100
     * @tc.name testUnicodeEdge0001
     * @tc.desc Verify 0x7F stays in the one byte range while 0x80 steps up to two bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0001', 0, () => {
      expect(utf8Bytes(ASCII_MAX)).assertEqual(1);
      expect(utf8Bytes(TWO_BYTE_MIN)).assertEqual(2);
      // 分界点两侧只差 1 个码点，字节数却差一倍
      expect(utf8Bytes(TWO_BYTE_MIN) - utf8Bytes(ASCII_MAX)).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0200
     * @tc.name testUnicodeEdge0002
     * @tc.desc Verify 0x7FF stays at two bytes while 0x800 steps up to three bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0002', 0, () => {
      expect(utf8Bytes(TWO_BYTE_MAX)).assertEqual(2);
      expect(utf8Bytes(THREE_BYTE_MIN)).assertEqual(3);
      // 拉丁补充区与中日韩区之间的分界：拉丁带音符号仍在两字节档
      expect(utf8Bytes('é')).assertEqual(2);
      expect(utf8Bytes('中')).assertEqual(3);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0300
     * @tc.name testUnicodeEdge0003
     * @tc.desc Verify the last BMP code unit costs three bytes and the first astral character costs four.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0003', 0, () => {
      expect(utf8Bytes(BMP_MAX)).assertEqual(3);
      expect(utf8Bytes(FOUR_BYTE_MIN)).assertEqual(4);
      expect(utf8Bytes(EMOJI)).assertEqual(4);
      // 代理对是两个 code unit，但只算 4 字节，不是 3+3
      expect(FOUR_BYTE_MIN.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0400
     * @tc.name testUnicodeEdge0004
     * @tc.desc Verify a lone low surrogate is not caught by the surrogate branch and costs three bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0004', 0, () => {
      // 判断条件只认高代理 0xD800-0xDBFF，低代理单独出现会落到最后的 else 分支
      expect(utf8Bytes(LONE_LOW)).assertEqual(3);
      expect(utf8Bytes(LONE_LOW + LONE_LOW)).assertEqual(6);
      // 同为孤立代理，高代理被当成一整个字符计 4 字节，低代理只计 3 字节
      expect(utf8Bytes(LONE_LOW) < utf8Bytes(LONE_HIGH)).assertTrue();
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0500
     * @tc.name testUnicodeEdge0005
     * @tc.desc Verify the second lone high surrogate is swallowed by the index increment of the first.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0005', 0, () => {
      // 两个孤立高代理本该各记 4 字节，实际只记了 4，因为第二个被 i++ 跳过了
      expect(utf8Bytes(LONE_HIGH + LONE_HIGH)).assertEqual(4);
      expect(utf8Bytes(LONE_HIGH)).assertEqual(4);
      // 与真正的代理对同价：两者都是 4，所以只看字节数发现不了“被吞了一个”
      expect(utf8Bytes(LONE_HIGH + LONE_HIGH)).assertEqual(utf8Bytes(EMOJI));
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0600
     * @tc.name testUnicodeEdge0006
     * @tc.desc Verify an ASCII letter right after a lone high surrogate is skipped entirely by the byte count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0006', 0, () => {
      // 高代理记 4 字节并把后面的 'a' 一起跳过
      expect(utf8Bytes(LONE_HIGH + 'a')).assertEqual(4);
      // 反过来先有 'a' 再遇到高代理，就变成 1 + 4
      expect(utf8Bytes('a' + LONE_HIGH)).assertEqual(5);
      // 两者字符数相同，字节数却不同，说明它是按 code unit 顺序扫的
      expect((LONE_HIGH + 'a').length).assertEqual(('a' + LONE_HIGH).length);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0700
     * @tc.name testUnicodeEdge0007
     * @tc.desc Verify code point counting also merges two adjacent lone high surrogates into one.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0007', 0, () => {
      // 与 utf8Bytes 同一套"遇高代理跳一格"的规则，所以两个孤立高代理算 1 个字符
      expect(charCount(LONE_HIGH + LONE_HIGH)).assertEqual(1);
      expect(charCount(LONE_HIGH)).assertEqual(1);
      expect(charCount(EMOJI)).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0800
     * @tc.name testUnicodeEdge0008
     * @tc.desc Verify two lone low surrogates are counted separately because no index skip happens.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0008', 0, () => {
      expect(charCount(LONE_LOW + LONE_LOW)).assertEqual(2);
      // 两个孤立高代理只算一个：第一个把第二个当成低位跳过了
      expect(charCount(LONE_HIGH + LONE_HIGH)).assertEqual(1);
      // 同样两个 code unit，低代理各算一个、高代理并成一个，直方图不对称
      expect(charCount(LONE_LOW + LONE_LOW) - charCount(LONE_HIGH + LONE_HIGH)).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_0900
     * @tc.name testUnicodeEdge0009
     * @tc.desc Verify a lone high surrogate at the end of the buffer still counts as one character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0009', 0, () => {
      expect(charCount('a' + LONE_HIGH)).assertEqual(2);
      // 跳过一位后越界，循环自然结束，计数不会少加
      expect(charCount('ab' + LONE_HIGH)).assertEqual(3);
      // 高代理后面的真实字符也会被当成低位跳过，'b' 不计入
      expect(charCount('a' + LONE_HIGH + 'b')).assertEqual(2);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_1000
     * @tc.name testUnicodeEdge0010
     * @tc.desc Verify deleting a trailing lone low surrogate also removes the character before it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0010', 0, () => {
      // 末位是低代理且长度足够，就按代理对处理删两位，普通字符被连坐删掉
      expect(deleteLast('a' + LONE_LOW)).assertEqual('');
      expect(deleteLast('a' + LONE_LOW).length).assertEqual(0);
      // 反过来末位是高代理，只看一位
      expect(deleteLast('a' + LONE_HIGH)).assertEqual('a');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_1100
     * @tc.name testUnicodeEdge0011
     * @tc.desc Verify single lone surrogates are removed one code unit at a time at the buffer edge.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0011', 0, () => {
      // 长度不足两位时，低代理也只会删一位，不会越界
      expect(deleteLast(LONE_LOW)).assertEqual('');
      expect(deleteLast(LONE_HIGH)).assertEqual('');
      expect(deleteLast('')).assertEqual('');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_1200
     * @tc.name testUnicodeEdge0012
     * @tc.desc Verify deleting a real surrogate pair removes exactly the emoji and keeps the preceding text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0012', 0, () => {
      expect(deleteLast('a' + EMOJI)).assertEqual('a');
      expect(deleteLast(EMOJI + 'b')).assertEqual(EMOJI);
      expect(charCount(deleteLast('a' + EMOJI))).assertEqual(1);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_1300
     * @tc.name testUnicodeEdge0013
     * @tc.desc Verify the limit only checks the current buffer, so a multi character insertion can overshoot it.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0013', 0, () => {
      // 只判断"当前已用额度"，不判断"加完会不会超"，所以一次就能塞进 6 个字符
      expect(appendChar('', 'abcdef', 2)).assertEqual('abcdef');
      expect(charCount(appendChar('', 'abcdef', 2))).assertEqual(6);
      // 当前额度已到上限时才真正拒绝
      expect(appendChar('ab', 'c', 2)).assertEqual('ab');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_1400
     * @tc.name testUnicodeEdge0014
     * @tc.desc Verify NaN and Infinity limits both fail the greater-or-equal check and therefore never block.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0014', 0, () => {
      // count >= NaN 与 count >= Infinity 都是 false，于是任何输入都会被接受
      expect(appendChar('abc', 'd', NaN)).assertEqual('abcd');
      expect(appendChar('abc', 'd', Infinity)).assertEqual('abcd');
      // 正常上限仍然拦得住，说明上面不是"函数始终放行"
      expect(appendChar('abc', 'd', 3)).assertEqual('abc');
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_1500
     * @tc.name testUnicodeEdge0015
     * @tc.desc Verify a one character space buffer still produces candidates rather than an empty bar.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0015', 0, () => {
      // 判空用的是 length，空格长度是 1，所以不算空
      const candidates: string[] = candidatesFor(' ');
      expect(candidates.length).assertEqual(3);
      expect(candidates[0]).assertEqual(' ');
      expect(candidates[1]).assertEqual(' 好');
      // 真正空的缓冲才没有候选
      expect(candidatesFor('').length).assertEqual(0);
    });

    /**
     * @tc.number SUB_INPUT_METHOD_UNI_1600
     * @tc.name testUnicodeEdge0016
     * @tc.desc Verify a truncated preview can cut through a surrogate pair and leave a lone low surrogate.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUnicodeEdge0016', 0, () => {
      // 三个 emoji 共 6 个 code unit，预算 4：head 取 2 位刚好是一个完整 emoji，
      // tail 只取 1 位，落在一个 emoji 的低代理上，输出里就留下半个字符
      const text: string = EMOJI + EMOJI + EMOJI;
      const preview: string = truncateMiddle(text, 4);
      expect(preview.length).assertEqual(4);
      expect(preview.charCodeAt(0)).assertEqual(0xD83D);
      expect(preview.charCodeAt(3) >= 0xDC00).assertTrue();
      expect(preview.charCodeAt(3) <= 0xDFFF).assertTrue();
      // 按码点计仍是 3：一个 emoji、一个省略号、一个孤立低代理
      expect(charCount(preview)).assertEqual(3);
      // 同样的预算给纯 ASCII，裁出来的预览恰好也是 4 个字符
      expect(truncateMiddle('abcdefgh', 4).length).assertEqual(preview.length);
    });
  });
}
