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
 * 编解码仿射网格的 ASCII 与 Latin-1 段：每个字符 × 前缀 / 后缀 / 两侧包裹 3 种形态。
 * 同一条断言里把总字节数减去字符自身字节数，验证首尾 ASCII 只贡献 1 字节。
 * CJK 与 emoji 段见 DistributedCodecAffixGridPart2.test.ets。
 */
export default function distributedCodecAffixGridTest() {
  describe('DistributedCodecAffixGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0001
     * @tc.name testAffix0001
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0001', 0, () => {
      const text: string = 'a ';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0002
     * @tc.name testAffix0002
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0002', 0, () => {
      const text: string = ' a';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0003
     * @tc.name testAffix0003
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0003', 0, () => {
      const text: string = 'a b';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0004
     * @tc.name testAffix0004
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0004', 0, () => {
      const text: string = 'a&';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0005
     * @tc.name testAffix0005
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0005', 0, () => {
      const text: string = '&a';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0006
     * @tc.name testAffix0006
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0006', 0, () => {
      const text: string = 'a&b';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0007
     * @tc.name testAffix0007
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0007', 0, () => {
      const text: string = 'a,';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0008
     * @tc.name testAffix0008
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0008', 0, () => {
      const text: string = ',a';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0009
     * @tc.name testAffix0009
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0009', 0, () => {
      const text: string = 'a,b';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0010
     * @tc.name testAffix0010
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0010', 0, () => {
      const text: string = 'a2';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0011
     * @tc.name testAffix0011
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0011', 0, () => {
      const text: string = '2a';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0012
     * @tc.name testAffix0012
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0012', 0, () => {
      const text: string = 'a2b';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0013
     * @tc.name testAffix0013
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0013', 0, () => {
      const text: string = 'a8';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0014
     * @tc.name testAffix0014
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0014', 0, () => {
      const text: string = '8a';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0015
     * @tc.name testAffix0015
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0015', 0, () => {
      const text: string = 'a8b';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0016
     * @tc.name testAffix0016
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0016', 0, () => {
      const text: string = 'a>';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0017
     * @tc.name testAffix0017
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0017', 0, () => {
      const text: string = '>a';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0018
     * @tc.name testAffix0018
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0018', 0, () => {
      const text: string = 'a>b';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0019
     * @tc.name testAffix0019
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0019', 0, () => {
      const text: string = 'aD';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0020
     * @tc.name testAffix0020
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0020', 0, () => {
      const text: string = 'Da';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0021
     * @tc.name testAffix0021
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0021', 0, () => {
      const text: string = 'aDb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0022
     * @tc.name testAffix0022
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0022', 0, () => {
      const text: string = 'aJ';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0023
     * @tc.name testAffix0023
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0023', 0, () => {
      const text: string = 'Ja';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0024
     * @tc.name testAffix0024
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0024', 0, () => {
      const text: string = 'aJb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0025
     * @tc.name testAffix0025
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0025', 0, () => {
      const text: string = 'aP';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0026
     * @tc.name testAffix0026
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0026', 0, () => {
      const text: string = 'Pa';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0027
     * @tc.name testAffix0027
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0027', 0, () => {
      const text: string = 'aPb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0028
     * @tc.name testAffix0028
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0028', 0, () => {
      const text: string = 'aV';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0029
     * @tc.name testAffix0029
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0029', 0, () => {
      const text: string = 'Va';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0030
     * @tc.name testAffix0030
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0030', 0, () => {
      const text: string = 'aVb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0031
     * @tc.name testAffix0031
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0031', 0, () => {
      const text: string = 'a\\';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0032
     * @tc.name testAffix0032
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0032', 0, () => {
      const text: string = '\\a';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0033
     * @tc.name testAffix0033
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0033', 0, () => {
      const text: string = 'a\\b';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0034
     * @tc.name testAffix0034
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0034', 0, () => {
      const text: string = 'ab';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0035
     * @tc.name testAffix0035
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0035', 0, () => {
      const text: string = 'ba';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0036
     * @tc.name testAffix0036
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0036', 0, () => {
      const text: string = 'abb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0037
     * @tc.name testAffix0037
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0037', 0, () => {
      const text: string = 'ah';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0038
     * @tc.name testAffix0038
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0038', 0, () => {
      const text: string = 'ha';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0039
     * @tc.name testAffix0039
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0039', 0, () => {
      const text: string = 'ahb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0040
     * @tc.name testAffix0040
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0040', 0, () => {
      const text: string = 'an';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0041
     * @tc.name testAffix0041
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0041', 0, () => {
      const text: string = 'na';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0042
     * @tc.name testAffix0042
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0042', 0, () => {
      const text: string = 'anb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0043
     * @tc.name testAffix0043
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0043', 0, () => {
      const text: string = 'at';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0044
     * @tc.name testAffix0044
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0044', 0, () => {
      const text: string = 'ta';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0045
     * @tc.name testAffix0045
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0045', 0, () => {
      const text: string = 'atb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0046
     * @tc.name testAffix0046
     * @tc.desc Verify the prefixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0046', 0, () => {
      const text: string = 'az';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0047
     * @tc.name testAffix0047
     * @tc.desc Verify the suffixed form weighs 2 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0047', 0, () => {
      const text: string = 'za';
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0048
     * @tc.name testAffix0048
     * @tc.desc Verify the wrapped form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0048', 0, () => {
      const text: string = 'azb';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 1).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0049
     * @tc.name testAffix0049
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0049', 0, () => {
      const text: string = 'a ';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0050
     * @tc.name testAffix0050
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0050', 0, () => {
      const text: string = ' a';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0051
     * @tc.name testAffix0051
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0051', 0, () => {
      const text: string = 'a b';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0052
     * @tc.name testAffix0052
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0052', 0, () => {
      const text: string = 'a¬';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0053
     * @tc.name testAffix0053
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0053', 0, () => {
      const text: string = '¬a';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0054
     * @tc.name testAffix0054
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0054', 0, () => {
      const text: string = 'a¬b';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0055
     * @tc.name testAffix0055
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0055', 0, () => {
      const text: string = 'a¸';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0056
     * @tc.name testAffix0056
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0056', 0, () => {
      const text: string = '¸a';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0057
     * @tc.name testAffix0057
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0057', 0, () => {
      const text: string = 'a¸b';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0058
     * @tc.name testAffix0058
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0058', 0, () => {
      const text: string = 'aÄ';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0059
     * @tc.name testAffix0059
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0059', 0, () => {
      const text: string = 'Äa';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0060
     * @tc.name testAffix0060
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0060', 0, () => {
      const text: string = 'aÄb';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0061
     * @tc.name testAffix0061
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0061', 0, () => {
      const text: string = 'aÐ';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0062
     * @tc.name testAffix0062
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0062', 0, () => {
      const text: string = 'Ða';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0063
     * @tc.name testAffix0063
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0063', 0, () => {
      const text: string = 'aÐb';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0064
     * @tc.name testAffix0064
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0064', 0, () => {
      const text: string = 'aÜ';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0065
     * @tc.name testAffix0065
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0065', 0, () => {
      const text: string = 'Üa';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0066
     * @tc.name testAffix0066
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0066', 0, () => {
      const text: string = 'aÜb';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0067
     * @tc.name testAffix0067
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0067', 0, () => {
      const text: string = 'aè';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0068
     * @tc.name testAffix0068
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0068', 0, () => {
      const text: string = 'èa';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0069
     * @tc.name testAffix0069
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0069', 0, () => {
      const text: string = 'aèb';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0070
     * @tc.name testAffix0070
     * @tc.desc Verify the prefixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0070', 0, () => {
      const text: string = 'aô';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0071
     * @tc.name testAffix0071
     * @tc.desc Verify the suffixed form weighs 3 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0071', 0, () => {
      const text: string = 'ôa';
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0072
     * @tc.name testAffix0072
     * @tc.desc Verify the wrapped form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0072', 0, () => {
      const text: string = 'aôb';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 2).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0073
     * @tc.name testAffix0073
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0073', 0, () => {
      const text: string = 'a一';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0074
     * @tc.name testAffix0074
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0074', 0, () => {
      const text: string = '一a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0075
     * @tc.name testAffix0075
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0075', 0, () => {
      const text: string = 'a一b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0076
     * @tc.name testAffix0076
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0076', 0, () => {
      const text: string = 'a乡';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0077
     * @tc.name testAffix0077
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0077', 0, () => {
      const text: string = '乡a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0078
     * @tc.name testAffix0078
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0078', 0, () => {
      const text: string = 'a乡b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0079
     * @tc.name testAffix0079
     * @tc.desc Verify the prefixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0079', 0, () => {
      const text: string = 'a仂';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0080
     * @tc.name testAffix0080
     * @tc.desc Verify the suffixed form weighs 4 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0080', 0, () => {
      const text: string = '仂a';
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_AFFIX_0081
     * @tc.name testAffix0081
     * @tc.desc Verify the wrapped form weighs 5 bytes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAffix0081', 0, () => {
      const text: string = 'a仂b';
      expect(utf8Length(text)).assertEqual(5);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
      expect(utf8Length(text) - 3).assertEqual(2);
    });

  });
}
