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
import { bytesOf, bytesText } from '../util/ByteText';

/**
 * CJK 基本区后半段（继续按步长 37 抽样到第 200 个汉字）：三字节编码、掩码与回环逐个钉住。
 * 前半段见 DistributedUtf8CjkGrid.test.ets。
 */
export default function distributedUtf8CjkGridPart2Test() {
  describe('DistributedUtf8CjkGridTestPart2', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0101
     * @tc.name testCjk0101
     * @tc.desc Verify U+5C74 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0101', 0, () => {
      const text: string = '屴';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,177,180');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0102
     * @tc.name testCjk0102
     * @tc.desc Verify U+5C99 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0102', 0, () => {
      const text: string = '岙';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,178,153');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0103
     * @tc.name testCjk0103
     * @tc.desc Verify U+5CBE in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0103', 0, () => {
      const text: string = '岾';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,178,190');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0104
     * @tc.name testCjk0104
     * @tc.desc Verify U+5CE3 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0104', 0, () => {
      const text: string = '峣';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,179,163');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0105
     * @tc.name testCjk0105
     * @tc.desc Verify U+5D08 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0105', 0, () => {
      const text: string = '崈';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,180,136');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0106
     * @tc.name testCjk0106
     * @tc.desc Verify U+5D2D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0106', 0, () => {
      const text: string = '崭';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,180,173');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0107
     * @tc.name testCjk0107
     * @tc.desc Verify U+5D52 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0107', 0, () => {
      const text: string = '嵒';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,181,146');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0108
     * @tc.name testCjk0108
     * @tc.desc Verify U+5D77 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0108', 0, () => {
      const text: string = '嵷';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,181,183');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0109
     * @tc.name testCjk0109
     * @tc.desc Verify U+5D9C in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0109', 0, () => {
      const text: string = '嶜';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,182,156');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0110
     * @tc.name testCjk0110
     * @tc.desc Verify U+5DC1 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0110', 0, () => {
      const text: string = '巁';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,183,129');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0111
     * @tc.name testCjk0111
     * @tc.desc Verify U+5DE6 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0111', 0, () => {
      const text: string = '左';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,183,166');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0112
     * @tc.name testCjk0112
     * @tc.desc Verify U+5E0B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0112', 0, () => {
      const text: string = '帋';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,184,139');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0113
     * @tc.name testCjk0113
     * @tc.desc Verify U+5E30 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0113', 0, () => {
      const text: string = '帰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,184,176');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0114
     * @tc.name testCjk0114
     * @tc.desc Verify U+5E55 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0114', 0, () => {
      const text: string = '幕';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,185,149');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0115
     * @tc.name testCjk0115
     * @tc.desc Verify U+5E7A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0115', 0, () => {
      const text: string = '幺';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,185,186');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0116
     * @tc.name testCjk0116
     * @tc.desc Verify U+5E9F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0116', 0, () => {
      const text: string = '废';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,186,159');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0117
     * @tc.name testCjk0117
     * @tc.desc Verify U+5EC4 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0117', 0, () => {
      const text: string = '廄';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,187,132');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0118
     * @tc.name testCjk0118
     * @tc.desc Verify U+5EE9 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0118', 0, () => {
      const text: string = '廩';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,187,169');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0119
     * @tc.name testCjk0119
     * @tc.desc Verify U+5F0E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0119', 0, () => {
      const text: string = '弎';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,188,142');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0120
     * @tc.name testCjk0120
     * @tc.desc Verify U+5F33 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0120', 0, () => {
      const text: string = '弳';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,188,179');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0121
     * @tc.name testCjk0121
     * @tc.desc Verify U+5F58 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0121', 0, () => {
      const text: string = '彘';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,189,152');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0122
     * @tc.name testCjk0122
     * @tc.desc Verify U+5F7D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0122', 0, () => {
      const text: string = '彽';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,189,189');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0123
     * @tc.name testCjk0123
     * @tc.desc Verify U+5FA2 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0123', 0, () => {
      const text: string = '徢';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,190,162');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0124
     * @tc.name testCjk0124
     * @tc.desc Verify U+5FC7 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0124', 0, () => {
      const text: string = '忇';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,191,135');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0125
     * @tc.name testCjk0125
     * @tc.desc Verify U+5FEC in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0125', 0, () => {
      const text: string = '忬';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,191,172');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0126
     * @tc.name testCjk0126
     * @tc.desc Verify U+6011 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0126', 0, () => {
      const text: string = '怑';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,128,145');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0127
     * @tc.name testCjk0127
     * @tc.desc Verify U+6036 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0127', 0, () => {
      const text: string = '怶';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,128,182');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0128
     * @tc.name testCjk0128
     * @tc.desc Verify U+605B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0128', 0, () => {
      const text: string = '恛';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,129,155');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0129
     * @tc.name testCjk0129
     * @tc.desc Verify U+6080 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0129', 0, () => {
      const text: string = '悀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,130,128');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0130
     * @tc.name testCjk0130
     * @tc.desc Verify U+60A5 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0130', 0, () => {
      const text: string = '悥';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,130,165');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0131
     * @tc.name testCjk0131
     * @tc.desc Verify U+60CA in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0131', 0, () => {
      const text: string = '惊';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,131,138');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0132
     * @tc.name testCjk0132
     * @tc.desc Verify U+60EF in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0132', 0, () => {
      const text: string = '惯';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,131,175');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0133
     * @tc.name testCjk0133
     * @tc.desc Verify U+6114 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0133', 0, () => {
      const text: string = '愔';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,132,148');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0134
     * @tc.name testCjk0134
     * @tc.desc Verify U+6139 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0134', 0, () => {
      const text: string = '愹';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,132,185');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0135
     * @tc.name testCjk0135
     * @tc.desc Verify U+615E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0135', 0, () => {
      const text: string = '慞';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,133,158');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0136
     * @tc.name testCjk0136
     * @tc.desc Verify U+6183 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0136', 0, () => {
      const text: string = '憃';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,134,131');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0137
     * @tc.name testCjk0137
     * @tc.desc Verify U+61A8 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0137', 0, () => {
      const text: string = '憨';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,134,168');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0138
     * @tc.name testCjk0138
     * @tc.desc Verify U+61CD in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0138', 0, () => {
      const text: string = '懍';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,135,141');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0139
     * @tc.name testCjk0139
     * @tc.desc Verify U+61F2 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0139', 0, () => {
      const text: string = '懲';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,135,178');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0140
     * @tc.name testCjk0140
     * @tc.desc Verify U+6217 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0140', 0, () => {
      const text: string = '戗';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,136,151');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0141
     * @tc.name testCjk0141
     * @tc.desc Verify U+623C in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0141', 0, () => {
      const text: string = '戼';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,136,188');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0142
     * @tc.name testCjk0142
     * @tc.desc Verify U+6261 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0142', 0, () => {
      const text: string = '扡';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,137,161');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0143
     * @tc.name testCjk0143
     * @tc.desc Verify U+6286 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0143', 0, () => {
      const text: string = '抆';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,138,134');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0144
     * @tc.name testCjk0144
     * @tc.desc Verify U+62AB in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0144', 0, () => {
      const text: string = '披';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,138,171');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0145
     * @tc.name testCjk0145
     * @tc.desc Verify U+62D0 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0145', 0, () => {
      const text: string = '拐';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,139,144');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0146
     * @tc.name testCjk0146
     * @tc.desc Verify U+62F5 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0146', 0, () => {
      const text: string = '拵';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,139,181');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0147
     * @tc.name testCjk0147
     * @tc.desc Verify U+631A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0147', 0, () => {
      const text: string = '挚';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,140,154');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0148
     * @tc.name testCjk0148
     * @tc.desc Verify U+633F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0148', 0, () => {
      const text: string = '挿';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,140,191');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0149
     * @tc.name testCjk0149
     * @tc.desc Verify U+6364 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0149', 0, () => {
      const text: string = '捤';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,141,164');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0150
     * @tc.name testCjk0150
     * @tc.desc Verify U+6389 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0150', 0, () => {
      const text: string = '掉';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,142,137');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0151
     * @tc.name testCjk0151
     * @tc.desc Verify U+63AE in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0151', 0, () => {
      const text: string = '掮';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,142,174');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0152
     * @tc.name testCjk0152
     * @tc.desc Verify U+63D3 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0152', 0, () => {
      const text: string = '揓';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,143,147');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0153
     * @tc.name testCjk0153
     * @tc.desc Verify U+63F8 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0153', 0, () => {
      const text: string = '揸';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,143,184');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0154
     * @tc.name testCjk0154
     * @tc.desc Verify U+641D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0154', 0, () => {
      const text: string = '搝';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,144,157');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0155
     * @tc.name testCjk0155
     * @tc.desc Verify U+6442 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0155', 0, () => {
      const text: string = '摂';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,145,130');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0156
     * @tc.name testCjk0156
     * @tc.desc Verify U+6467 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0156', 0, () => {
      const text: string = '摧';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,145,167');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0157
     * @tc.name testCjk0157
     * @tc.desc Verify U+648C in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0157', 0, () => {
      const text: string = '撌';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,146,140');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0158
     * @tc.name testCjk0158
     * @tc.desc Verify U+64B1 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0158', 0, () => {
      const text: string = '撱';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,146,177');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0159
     * @tc.name testCjk0159
     * @tc.desc Verify U+64D6 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0159', 0, () => {
      const text: string = '擖';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,147,150');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0160
     * @tc.name testCjk0160
     * @tc.desc Verify U+64FB in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0160', 0, () => {
      const text: string = '擻';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,147,187');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0161
     * @tc.name testCjk0161
     * @tc.desc Verify U+6520 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0161', 0, () => {
      const text: string = '攠';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,148,160');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0162
     * @tc.name testCjk0162
     * @tc.desc Verify U+6545 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0162', 0, () => {
      const text: string = '故';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,149,133');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0163
     * @tc.name testCjk0163
     * @tc.desc Verify U+656A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0163', 0, () => {
      const text: string = '敪';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,149,170');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0164
     * @tc.name testCjk0164
     * @tc.desc Verify U+658F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0164', 0, () => {
      const text: string = '斏';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,150,143');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0165
     * @tc.name testCjk0165
     * @tc.desc Verify U+65B4 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0165', 0, () => {
      const text: string = '斴';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,150,180');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0166
     * @tc.name testCjk0166
     * @tc.desc Verify U+65D9 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0166', 0, () => {
      const text: string = '旙';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,151,153');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0167
     * @tc.name testCjk0167
     * @tc.desc Verify U+65FE in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0167', 0, () => {
      const text: string = '旾';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,151,190');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0168
     * @tc.name testCjk0168
     * @tc.desc Verify U+6623 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0168', 0, () => {
      const text: string = '昣';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,152,163');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0169
     * @tc.name testCjk0169
     * @tc.desc Verify U+6648 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0169', 0, () => {
      const text: string = '晈';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,153,136');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0170
     * @tc.name testCjk0170
     * @tc.desc Verify U+666D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0170', 0, () => {
      const text: string = '晭';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,153,173');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0171
     * @tc.name testCjk0171
     * @tc.desc Verify U+6692 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0171', 0, () => {
      const text: string = '暒';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,154,146');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0172
     * @tc.name testCjk0172
     * @tc.desc Verify U+66B7 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0172', 0, () => {
      const text: string = '暷';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,154,183');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0173
     * @tc.name testCjk0173
     * @tc.desc Verify U+66DC in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0173', 0, () => {
      const text: string = '曜';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,155,156');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0174
     * @tc.name testCjk0174
     * @tc.desc Verify U+6701 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0174', 0, () => {
      const text: string = '朁';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,156,129');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0175
     * @tc.name testCjk0175
     * @tc.desc Verify U+6726 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0175', 0, () => {
      const text: string = '朦';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,156,166');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0176
     * @tc.name testCjk0176
     * @tc.desc Verify U+674B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0176', 0, () => {
      const text: string = '杋';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,157,139');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0177
     * @tc.name testCjk0177
     * @tc.desc Verify U+6770 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0177', 0, () => {
      const text: string = '杰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,157,176');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0178
     * @tc.name testCjk0178
     * @tc.desc Verify U+6795 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0178', 0, () => {
      const text: string = '枕';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,158,149');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0179
     * @tc.name testCjk0179
     * @tc.desc Verify U+67BA in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0179', 0, () => {
      const text: string = '枺';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,158,186');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0180
     * @tc.name testCjk0180
     * @tc.desc Verify U+67DF in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0180', 0, () => {
      const text: string = '柟';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,159,159');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0181
     * @tc.name testCjk0181
     * @tc.desc Verify U+6804 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0181', 0, () => {
      const text: string = '栄';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,160,132');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0182
     * @tc.name testCjk0182
     * @tc.desc Verify U+6829 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0182', 0, () => {
      const text: string = '栩';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,160,169');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0183
     * @tc.name testCjk0183
     * @tc.desc Verify U+684E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0183', 0, () => {
      const text: string = '桎';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,161,142');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0184
     * @tc.name testCjk0184
     * @tc.desc Verify U+6873 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0184', 0, () => {
      const text: string = '桳';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,161,179');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0185
     * @tc.name testCjk0185
     * @tc.desc Verify U+6898 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0185', 0, () => {
      const text: string = '梘';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,162,152');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0186
     * @tc.name testCjk0186
     * @tc.desc Verify U+68BD in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0186', 0, () => {
      const text: string = '梽';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,162,189');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0187
     * @tc.name testCjk0187
     * @tc.desc Verify U+68E2 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0187', 0, () => {
      const text: string = '棢';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,163,162');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0188
     * @tc.name testCjk0188
     * @tc.desc Verify U+6907 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0188', 0, () => {
      const text: string = '椇';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,164,135');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0189
     * @tc.name testCjk0189
     * @tc.desc Verify U+692C in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0189', 0, () => {
      const text: string = '椬';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,164,172');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0190
     * @tc.name testCjk0190
     * @tc.desc Verify U+6951 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0190', 0, () => {
      const text: string = '楑';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,165,145');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0191
     * @tc.name testCjk0191
     * @tc.desc Verify U+6976 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0191', 0, () => {
      const text: string = '楶';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,165,182');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0192
     * @tc.name testCjk0192
     * @tc.desc Verify U+699B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0192', 0, () => {
      const text: string = '榛';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,166,155');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0193
     * @tc.name testCjk0193
     * @tc.desc Verify U+69C0 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0193', 0, () => {
      const text: string = '槀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,167,128');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0194
     * @tc.name testCjk0194
     * @tc.desc Verify U+69E5 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0194', 0, () => {
      const text: string = '槥';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,167,165');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0195
     * @tc.name testCjk0195
     * @tc.desc Verify U+6A0A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0195', 0, () => {
      const text: string = '樊';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,168,138');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0196
     * @tc.name testCjk0196
     * @tc.desc Verify U+6A2F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0196', 0, () => {
      const text: string = '樯';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,168,175');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0197
     * @tc.name testCjk0197
     * @tc.desc Verify U+6A54 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0197', 0, () => {
      const text: string = '橔';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,169,148');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0198
     * @tc.name testCjk0198
     * @tc.desc Verify U+6A79 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0198', 0, () => {
      const text: string = '橹';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,169,185');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0199
     * @tc.name testCjk0199
     * @tc.desc Verify U+6A9E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0199', 0, () => {
      const text: string = '檞';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,170,158');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0200
     * @tc.name testCjk0200
     * @tc.desc Verify U+6AC3 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0200', 0, () => {
      const text: string = '櫃';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('230,171,131');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

  });
}
