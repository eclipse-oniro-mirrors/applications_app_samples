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
 * CJK 基本区前半段（U+4E00 起按步长 37 抽样 100 个汉字）：三字节编码、掩码与回环逐个钉住。
 * 页面上每条提示、每个服务名都有汉字，字节数算错会直接把 sendData 顶到 32390103。
 * 后半段见 DistributedUtf8CjkGridPart2.test.ets。
 */
export default function distributedUtf8CjkGridTest() {
  describe('DistributedUtf8CjkGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0001
     * @tc.name testCjk0001
     * @tc.desc Verify U+4E00 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0001', 0, () => {
      const text: string = '一';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,184,128');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0002
     * @tc.name testCjk0002
     * @tc.desc Verify U+4E25 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0002', 0, () => {
      const text: string = '严';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,184,165');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0003
     * @tc.name testCjk0003
     * @tc.desc Verify U+4E4A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0003', 0, () => {
      const text: string = '乊';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,185,138');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0004
     * @tc.name testCjk0004
     * @tc.desc Verify U+4E6F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0004', 0, () => {
      const text: string = '乯';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,185,175');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0005
     * @tc.name testCjk0005
     * @tc.desc Verify U+4E94 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0005', 0, () => {
      const text: string = '五';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,186,148');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0006
     * @tc.name testCjk0006
     * @tc.desc Verify U+4EB9 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0006', 0, () => {
      const text: string = '亹';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,186,185');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0007
     * @tc.name testCjk0007
     * @tc.desc Verify U+4EDE in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0007', 0, () => {
      const text: string = '仞';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,187,158');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0008
     * @tc.name testCjk0008
     * @tc.desc Verify U+4F03 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0008', 0, () => {
      const text: string = '伃';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,188,131');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0009
     * @tc.name testCjk0009
     * @tc.desc Verify U+4F28 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0009', 0, () => {
      const text: string = '伨';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,188,168');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0010
     * @tc.name testCjk0010
     * @tc.desc Verify U+4F4D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0010', 0, () => {
      const text: string = '位';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,189,141');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0011
     * @tc.name testCjk0011
     * @tc.desc Verify U+4F72 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0011', 0, () => {
      const text: string = '佲';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,189,178');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0012
     * @tc.name testCjk0012
     * @tc.desc Verify U+4F97 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0012', 0, () => {
      const text: string = '侗';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,190,151');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0013
     * @tc.name testCjk0013
     * @tc.desc Verify U+4FBC in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0013', 0, () => {
      const text: string = '侼';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,190,188');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0014
     * @tc.name testCjk0014
     * @tc.desc Verify U+4FE1 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0014', 0, () => {
      const text: string = '信';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('228,191,161');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0015
     * @tc.name testCjk0015
     * @tc.desc Verify U+5006 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0015', 0, () => {
      const text: string = '倆';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,128,134');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0016
     * @tc.name testCjk0016
     * @tc.desc Verify U+502B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0016', 0, () => {
      const text: string = '倫';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,128,171');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0017
     * @tc.name testCjk0017
     * @tc.desc Verify U+5050 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0017', 0, () => {
      const text: string = '偐';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,129,144');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0018
     * @tc.name testCjk0018
     * @tc.desc Verify U+5075 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0018', 0, () => {
      const text: string = '偵';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,129,181');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0019
     * @tc.name testCjk0019
     * @tc.desc Verify U+509A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0019', 0, () => {
      const text: string = '傚';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,130,154');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0020
     * @tc.name testCjk0020
     * @tc.desc Verify U+50BF in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0020', 0, () => {
      const text: string = '傿';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,130,191');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0021
     * @tc.name testCjk0021
     * @tc.desc Verify U+50E4 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0021', 0, () => {
      const text: string = '僤';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,131,164');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0022
     * @tc.name testCjk0022
     * @tc.desc Verify U+5109 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0022', 0, () => {
      const text: string = '儉';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,132,137');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0023
     * @tc.name testCjk0023
     * @tc.desc Verify U+512E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0023', 0, () => {
      const text: string = '儮';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,132,174');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0024
     * @tc.name testCjk0024
     * @tc.desc Verify U+5153 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0024', 0, () => {
      const text: string = '兓';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,133,147');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0025
     * @tc.name testCjk0025
     * @tc.desc Verify U+5178 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0025', 0, () => {
      const text: string = '典';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,133,184');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0026
     * @tc.name testCjk0026
     * @tc.desc Verify U+519D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0026', 0, () => {
      const text: string = '冝';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,134,157');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0027
     * @tc.name testCjk0027
     * @tc.desc Verify U+51C2 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0027', 0, () => {
      const text: string = '凂';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,135,130');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0028
     * @tc.name testCjk0028
     * @tc.desc Verify U+51E7 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0028', 0, () => {
      const text: string = '凧';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,135,167');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0029
     * @tc.name testCjk0029
     * @tc.desc Verify U+520C in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0029', 0, () => {
      const text: string = '刌';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,136,140');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0030
     * @tc.name testCjk0030
     * @tc.desc Verify U+5231 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0030', 0, () => {
      const text: string = '刱';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,136,177');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0031
     * @tc.name testCjk0031
     * @tc.desc Verify U+5256 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0031', 0, () => {
      const text: string = '剖';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,137,150');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0032
     * @tc.name testCjk0032
     * @tc.desc Verify U+527B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0032', 0, () => {
      const text: string = '剻';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,137,187');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0033
     * @tc.name testCjk0033
     * @tc.desc Verify U+52A0 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0033', 0, () => {
      const text: string = '加';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,138,160');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0034
     * @tc.name testCjk0034
     * @tc.desc Verify U+52C5 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0034', 0, () => {
      const text: string = '勅';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,139,133');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0035
     * @tc.name testCjk0035
     * @tc.desc Verify U+52EA in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0035', 0, () => {
      const text: string = '勪';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,139,170');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0036
     * @tc.name testCjk0036
     * @tc.desc Verify U+530F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0036', 0, () => {
      const text: string = '匏';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,140,143');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0037
     * @tc.name testCjk0037
     * @tc.desc Verify U+5334 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0037', 0, () => {
      const text: string = '匴';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,140,180');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0038
     * @tc.name testCjk0038
     * @tc.desc Verify U+5359 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0038', 0, () => {
      const text: string = '卙';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,141,153');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0039
     * @tc.name testCjk0039
     * @tc.desc Verify U+537E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0039', 0, () => {
      const text: string = '卾';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,141,190');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0040
     * @tc.name testCjk0040
     * @tc.desc Verify U+53A3 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0040', 0, () => {
      const text: string = '厣';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,142,163');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0041
     * @tc.name testCjk0041
     * @tc.desc Verify U+53C8 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0041', 0, () => {
      const text: string = '又';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,143,136');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0042
     * @tc.name testCjk0042
     * @tc.desc Verify U+53ED in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0042', 0, () => {
      const text: string = '叭';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,143,173');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0043
     * @tc.name testCjk0043
     * @tc.desc Verify U+5412 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0043', 0, () => {
      const text: string = '吒';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,144,146');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0044
     * @tc.name testCjk0044
     * @tc.desc Verify U+5437 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0044', 0, () => {
      const text: string = '吷';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,144,183');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0045
     * @tc.name testCjk0045
     * @tc.desc Verify U+545C in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0045', 0, () => {
      const text: string = '呜';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,145,156');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0046
     * @tc.name testCjk0046
     * @tc.desc Verify U+5481 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0046', 0, () => {
      const text: string = '咁';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,146,129');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0047
     * @tc.name testCjk0047
     * @tc.desc Verify U+54A6 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0047', 0, () => {
      const text: string = '咦';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,146,166');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0048
     * @tc.name testCjk0048
     * @tc.desc Verify U+54CB in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0048', 0, () => {
      const text: string = '哋';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,147,139');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0049
     * @tc.name testCjk0049
     * @tc.desc Verify U+54F0 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0049', 0, () => {
      const text: string = '哰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,147,176');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0050
     * @tc.name testCjk0050
     * @tc.desc Verify U+5515 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0050', 0, () => {
      const text: string = '唕';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,148,149');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0051
     * @tc.name testCjk0051
     * @tc.desc Verify U+553A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0051', 0, () => {
      const text: string = '唺';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,148,186');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0052
     * @tc.name testCjk0052
     * @tc.desc Verify U+555F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0052', 0, () => {
      const text: string = '啟';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,149,159');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0053
     * @tc.name testCjk0053
     * @tc.desc Verify U+5584 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0053', 0, () => {
      const text: string = '善';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,150,132');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0054
     * @tc.name testCjk0054
     * @tc.desc Verify U+55A9 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0054', 0, () => {
      const text: string = '喩';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,150,169');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0055
     * @tc.name testCjk0055
     * @tc.desc Verify U+55CE in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0055', 0, () => {
      const text: string = '嗎';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,151,142');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0056
     * @tc.name testCjk0056
     * @tc.desc Verify U+55F3 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0056', 0, () => {
      const text: string = '嗳';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,151,179');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0057
     * @tc.name testCjk0057
     * @tc.desc Verify U+5618 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0057', 0, () => {
      const text: string = '嘘';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,152,152');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0058
     * @tc.name testCjk0058
     * @tc.desc Verify U+563D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0058', 0, () => {
      const text: string = '嘽';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,152,189');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0059
     * @tc.name testCjk0059
     * @tc.desc Verify U+5662 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0059', 0, () => {
      const text: string = '噢';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,153,162');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0060
     * @tc.name testCjk0060
     * @tc.desc Verify U+5687 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0060', 0, () => {
      const text: string = '嚇';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,154,135');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0061
     * @tc.name testCjk0061
     * @tc.desc Verify U+56AC in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0061', 0, () => {
      const text: string = '嚬';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,154,172');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0062
     * @tc.name testCjk0062
     * @tc.desc Verify U+56D1 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0062', 0, () => {
      const text: string = '囑';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,155,145');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0063
     * @tc.name testCjk0063
     * @tc.desc Verify U+56F6 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0063', 0, () => {
      const text: string = '囶';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,155,182');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0064
     * @tc.name testCjk0064
     * @tc.desc Verify U+571B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0064', 0, () => {
      const text: string = '圛';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,156,155');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0065
     * @tc.name testCjk0065
     * @tc.desc Verify U+5740 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0065', 0, () => {
      const text: string = '址';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,157,128');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0066
     * @tc.name testCjk0066
     * @tc.desc Verify U+5765 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0066', 0, () => {
      const text: string = '坥';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,157,165');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0067
     * @tc.name testCjk0067
     * @tc.desc Verify U+578A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0067', 0, () => {
      const text: string = '垊';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,158,138');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0068
     * @tc.name testCjk0068
     * @tc.desc Verify U+57AF in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0068', 0, () => {
      const text: string = '垯';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,158,175');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0069
     * @tc.name testCjk0069
     * @tc.desc Verify U+57D4 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0069', 0, () => {
      const text: string = '埔';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,159,148');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0070
     * @tc.name testCjk0070
     * @tc.desc Verify U+57F9 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0070', 0, () => {
      const text: string = '培';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,159,185');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0071
     * @tc.name testCjk0071
     * @tc.desc Verify U+581E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0071', 0, () => {
      const text: string = '堞';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,160,158');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0072
     * @tc.name testCjk0072
     * @tc.desc Verify U+5843 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0072', 0, () => {
      const text: string = '塃';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,161,131');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0073
     * @tc.name testCjk0073
     * @tc.desc Verify U+5868 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0073', 0, () => {
      const text: string = '塨';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,161,168');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0074
     * @tc.name testCjk0074
     * @tc.desc Verify U+588D in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0074', 0, () => {
      const text: string = '墍';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,162,141');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0075
     * @tc.name testCjk0075
     * @tc.desc Verify U+58B2 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0075', 0, () => {
      const text: string = '墲';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,162,178');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0076
     * @tc.name testCjk0076
     * @tc.desc Verify U+58D7 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0076', 0, () => {
      const text: string = '壗';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,163,151');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0077
     * @tc.name testCjk0077
     * @tc.desc Verify U+58FC in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0077', 0, () => {
      const text: string = '壼';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,163,188');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0078
     * @tc.name testCjk0078
     * @tc.desc Verify U+5921 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0078', 0, () => {
      const text: string = '夡';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,164,161');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0079
     * @tc.name testCjk0079
     * @tc.desc Verify U+5946 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0079', 0, () => {
      const text: string = '奆';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,165,134');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0080
     * @tc.name testCjk0080
     * @tc.desc Verify U+596B in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0080', 0, () => {
      const text: string = '奫';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,165,171');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0081
     * @tc.name testCjk0081
     * @tc.desc Verify U+5990 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0081', 0, () => {
      const text: string = '妐';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,166,144');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0082
     * @tc.name testCjk0082
     * @tc.desc Verify U+59B5 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0082', 0, () => {
      const text: string = '妵';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,166,181');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0083
     * @tc.name testCjk0083
     * @tc.desc Verify U+59DA in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0083', 0, () => {
      const text: string = '姚';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,167,154');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0084
     * @tc.name testCjk0084
     * @tc.desc Verify U+59FF in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0084', 0, () => {
      const text: string = '姿';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,167,191');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0085
     * @tc.name testCjk0085
     * @tc.desc Verify U+5A24 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0085', 0, () => {
      const text: string = '娤';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,168,164');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0086
     * @tc.name testCjk0086
     * @tc.desc Verify U+5A49 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0086', 0, () => {
      const text: string = '婉';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,169,137');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0087
     * @tc.name testCjk0087
     * @tc.desc Verify U+5A6E in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0087', 0, () => {
      const text: string = '婮';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,169,174');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0088
     * @tc.name testCjk0088
     * @tc.desc Verify U+5A93 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0088', 0, () => {
      const text: string = '媓';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,170,147');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0089
     * @tc.name testCjk0089
     * @tc.desc Verify U+5AB8 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0089', 0, () => {
      const text: string = '媸';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,170,184');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0090
     * @tc.name testCjk0090
     * @tc.desc Verify U+5ADD in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0090', 0, () => {
      const text: string = '嫝';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,171,157');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0091
     * @tc.name testCjk0091
     * @tc.desc Verify U+5B02 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0091', 0, () => {
      const text: string = '嬂';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,172,130');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0092
     * @tc.name testCjk0092
     * @tc.desc Verify U+5B27 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0092', 0, () => {
      const text: string = '嬧';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,172,167');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0093
     * @tc.name testCjk0093
     * @tc.desc Verify U+5B4C in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0093', 0, () => {
      const text: string = '孌';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,173,140');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0094
     * @tc.name testCjk0094
     * @tc.desc Verify U+5B71 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0094', 0, () => {
      const text: string = '孱';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,173,177');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0095
     * @tc.name testCjk0095
     * @tc.desc Verify U+5B96 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0095', 0, () => {
      const text: string = '宖';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,174,150');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0096
     * @tc.name testCjk0096
     * @tc.desc Verify U+5BBB in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0096', 0, () => {
      const text: string = '宻';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,174,187');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0097
     * @tc.name testCjk0097
     * @tc.desc Verify U+5BE0 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0097', 0, () => {
      const text: string = '寠';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,175,160');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0098
     * @tc.name testCjk0098
     * @tc.desc Verify U+5C05 in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0098', 0, () => {
      const text: string = '尅';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,176,133');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0099
     * @tc.name testCjk0099
     * @tc.desc Verify U+5C2A in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0099', 0, () => {
      const text: string = '尪';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,176,170');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CJK_0100
     * @tc.name testCjk0100
     * @tc.desc Verify U+5C4F in CJK block weighs 3 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCjk0100', 0, () => {
      const text: string = '屏';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('229,177,143');
      expect(utf8Length(text)).assertEqual(3);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

  });
}
