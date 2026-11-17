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

/**
 * 编解码仿射网格的 CJK 与 emoji 段：每个字符 × 前缀 / 后缀 / 两侧包裹 3 种形态。
 * 要求 decode(encode(x)) 与原文完全相等，emoji 的代理对也在其中。
 * ASCII 与 Latin-1 段见 DistributedCodecAffixGrid.test.ets。
 */
export default function distributedCodecAffixGridPart2Test() {
  describe('DistributedCodecAffixGridTestPart2', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0082
     * @tc.name testAffix0082
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0082', 0, () => {
      const text: string = 'a伣';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0083
     * @tc.name testAffix0083
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0083', 0, () => {
      const text: string = '伣a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0084
     * @tc.name testAffix0084
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0084', 0, () => {
      const text: string = 'a伣b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0085
     * @tc.name testAffix0085
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0085', 0, () => {
      const text: string = 'a侄';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0086
     * @tc.name testAffix0086
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0086', 0, () => {
      const text: string = '侄a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0087
     * @tc.name testAffix0087
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0087', 0, () => {
      const text: string = 'a侄b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0088
     * @tc.name testAffix0088
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0088', 0, () => {
      const text: string = 'a俥';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0089
     * @tc.name testAffix0089
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0089', 0, () => {
      const text: string = '俥a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0090
     * @tc.name testAffix0090
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0090', 0, () => {
      const text: string = 'a俥b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0091
     * @tc.name testAffix0091
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0091', 0, () => {
      const text: string = 'a偆';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0092
     * @tc.name testAffix0092
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0092', 0, () => {
      const text: string = '偆a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0093
     * @tc.name testAffix0093
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0093', 0, () => {
      const text: string = 'a偆b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0094
     * @tc.name testAffix0094
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0094', 0, () => {
      const text: string = 'a傧';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0095
     * @tc.name testAffix0095
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0095', 0, () => {
      const text: string = '傧a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0096
     * @tc.name testAffix0096
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0096', 0, () => {
      const text: string = 'a傧b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0097
     * @tc.name testAffix0097
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0097', 0, () => {
      const text: string = 'a儈';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0098
     * @tc.name testAffix0098
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0098', 0, () => {
      const text: string = '儈a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0099
     * @tc.name testAffix0099
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0099', 0, () => {
      const text: string = 'a儈b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0100
     * @tc.name testAffix0100
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0100', 0, () => {
      const text: string = 'a兩';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0101
     * @tc.name testAffix0101
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0101', 0, () => {
      const text: string = '兩a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0102
     * @tc.name testAffix0102
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0102', 0, () => {
      const text: string = 'a兩b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0103
     * @tc.name testAffix0103
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0103', 0, () => {
      const text: string = 'a凊';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0104
     * @tc.name testAffix0104
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0104', 0, () => {
      const text: string = '凊a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0105
     * @tc.name testAffix0105
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0105', 0, () => {
      const text: string = 'a凊b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0106
     * @tc.name testAffix0106
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0106', 0, () => {
      const text: string = 'a别';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0107
     * @tc.name testAffix0107
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0107', 0, () => {
      const text: string = '别a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0108
     * @tc.name testAffix0108
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0108', 0, () => {
      const text: string = 'a别b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0109
     * @tc.name testAffix0109
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0109', 0, () => {
      const text: string = 'a劌';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0110
     * @tc.name testAffix0110
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0110', 0, () => {
      const text: string = '劌a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0111
     * @tc.name testAffix0111
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0111', 0, () => {
      const text: string = 'a劌b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0112
     * @tc.name testAffix0112
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0112', 0, () => {
      const text: string = 'a勭';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0113
     * @tc.name testAffix0113
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0113', 0, () => {
      const text: string = '勭a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0114
     * @tc.name testAffix0114
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0114', 0, () => {
      const text: string = 'a勭b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0115
     * @tc.name testAffix0115
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0115', 0, () => {
      const text: string = 'a华';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0116
     * @tc.name testAffix0116
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0116', 0, () => {
      const text: string = '华a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0117
     * @tc.name testAffix0117
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0117', 0, () => {
      const text: string = 'a华b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0118
     * @tc.name testAffix0118
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0118', 0, () => {
      const text: string = 'a厯';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0119
     * @tc.name testAffix0119
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0119', 0, () => {
      const text: string = '厯a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0120
     * @tc.name testAffix0120
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0120', 0, () => {
      const text: string = 'a厯b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0121
     * @tc.name testAffix0121
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0121', 0, () => {
      const text: string = 'a吐';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0122
     * @tc.name testAffix0122
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0122', 0, () => {
      const text: string = '吐a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0123
     * @tc.name testAffix0123
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0123', 0, () => {
      const text: string = 'a吐b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0124
     * @tc.name testAffix0124
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0124', 0, () => {
      const text: string = 'a呱';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0125
     * @tc.name testAffix0125
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0125', 0, () => {
      const text: string = '呱a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0126
     * @tc.name testAffix0126
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0126', 0, () => {
      const text: string = 'a呱b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0127
     * @tc.name testAffix0127
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0127', 0, () => {
      const text: string = 'a哒';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0128
     * @tc.name testAffix0128
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0128', 0, () => {
      const text: string = '哒a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0129
     * @tc.name testAffix0129
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0129', 0, () => {
      const text: string = 'a哒b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0130
     * @tc.name testAffix0130
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0130', 0, () => {
      const text: string = 'a唳';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0131
     * @tc.name testAffix0131
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0131', 0, () => {
      const text: string = '唳a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0132
     * @tc.name testAffix0132
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0132', 0, () => {
      const text: string = 'a唳b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0133
     * @tc.name testAffix0133
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0133', 0, () => {
      const text: string = 'a喔';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0134
     * @tc.name testAffix0134
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0134', 0, () => {
      const text: string = '喔a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0135
     * @tc.name testAffix0135
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0135', 0, () => {
      const text: string = 'a喔b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0136
     * @tc.name testAffix0136
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0136', 0, () => {
      const text: string = 'a🌀';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0137
     * @tc.name testAffix0137
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0137', 0, () => {
      const text: string = '🌀a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0138
     * @tc.name testAffix0138
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0138', 0, () => {
      const text: string = 'a🌀b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0139
     * @tc.name testAffix0139
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0139', 0, () => {
      const text: string = 'a🍠';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0140
     * @tc.name testAffix0140
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0140', 0, () => {
      const text: string = '🍠a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0141
     * @tc.name testAffix0141
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0141', 0, () => {
      const text: string = 'a🍠b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0142
     * @tc.name testAffix0142
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0142', 0, () => {
      const text: string = 'a🏀';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0143
     * @tc.name testAffix0143
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0143', 0, () => {
      const text: string = '🏀a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0144
     * @tc.name testAffix0144
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0144', 0, () => {
      const text: string = 'a🏀b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0145
     * @tc.name testAffix0145
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0145', 0, () => {
      const text: string = 'a🐠';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0146
     * @tc.name testAffix0146
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0146', 0, () => {
      const text: string = '🐠a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0147
     * @tc.name testAffix0147
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0147', 0, () => {
      const text: string = 'a🐠b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0148
     * @tc.name testAffix0148
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0148', 0, () => {
      const text: string = 'a💀';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0149
     * @tc.name testAffix0149
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0149', 0, () => {
      const text: string = '💀a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0150
     * @tc.name testAffix0150
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0150', 0, () => {
      const text: string = 'a💀b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0151
     * @tc.name testAffix0151
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0151', 0, () => {
      const text: string = 'a📠';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0152
     * @tc.name testAffix0152
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0152', 0, () => {
      const text: string = '📠a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0153
     * @tc.name testAffix0153
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0153', 0, () => {
      const text: string = 'a📠b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0154
     * @tc.name testAffix0154
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0154', 0, () => {
      const text: string = 'a🕀';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0155
     * @tc.name testAffix0155
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0155', 0, () => {
      const text: string = '🕀a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0156
     * @tc.name testAffix0156
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0156', 0, () => {
      const text: string = 'a🕀b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0157
     * @tc.name testAffix0157
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0157', 0, () => {
      const text: string = 'a🖠';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0158
     * @tc.name testAffix0158
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0158', 0, () => {
      const text: string = '🖠a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0159
     * @tc.name testAffix0159
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0159', 0, () => {
      const text: string = 'a🖠b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0160
     * @tc.name testAffix0160
     * @tc.desc Verify the prefixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0160', 0, () => {
      const text: string = 'a😀';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0161
     * @tc.name testAffix0161
     * @tc.desc Verify the suffixed form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0161', 0, () => {
      const text: string = '😀a';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0162
     * @tc.name testAffix0162
     * @tc.desc Verify the wrapped form weighs 6 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0162', 0, () => {
      const text: string = 'a😀b';
      expect(utf8Length(text)).assertEqual(6);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 4).assertEqual(2);
    });

  });
}
