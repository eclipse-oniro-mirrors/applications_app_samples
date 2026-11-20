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
import { clampPayload, utf8Length } from '../../../main/ets/model/TextCodec';

/**
 * 字节裁剪网格：4 个字符串 × maxBytes 0–12，逐个核对裁剪结果与最终字节数不超过上限。
 * ASCII / CJK / 代理对三种字符宽度都覆盖到，代理对被裁成半个字符是真实存在的形态，这里如实钉住。
 */
export default function distributedClampGridTest() {
  describe('DistributedClampGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0001
     * @tc.name testClampByte0001
     * @tc.desc Verify three ASCII letters clamped to 0 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0001', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 0)).assertEqual('');
      expect(utf8Length(clampPayload(text, 0)) <= 0).assertTrue();
      expect(clampPayload(text, 0).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0002
     * @tc.name testClampByte0002
     * @tc.desc Verify three ASCII letters clamped to 1 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0002', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 1)).assertEqual('a');
      expect(utf8Length(clampPayload(text, 1)) <= 1).assertTrue();
      expect(clampPayload(text, 1).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0003
     * @tc.name testClampByte0003
     * @tc.desc Verify three ASCII letters clamped to 2 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0003', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 2)).assertEqual('ab');
      expect(utf8Length(clampPayload(text, 2)) <= 2).assertTrue();
      expect(clampPayload(text, 2).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0004
     * @tc.name testClampByte0004
     * @tc.desc Verify three ASCII letters clamped to 3 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0004', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 3)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 3)) <= 3).assertTrue();
      expect(clampPayload(text, 3).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0005
     * @tc.name testClampByte0005
     * @tc.desc Verify three ASCII letters clamped to 4 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0005', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 4)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 4)) <= 4).assertTrue();
      expect(clampPayload(text, 4).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0006
     * @tc.name testClampByte0006
     * @tc.desc Verify three ASCII letters clamped to 5 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0006', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 5)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 5)) <= 5).assertTrue();
      expect(clampPayload(text, 5).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0007
     * @tc.name testClampByte0007
     * @tc.desc Verify three ASCII letters clamped to 6 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0007', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 6)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 6)) <= 6).assertTrue();
      expect(clampPayload(text, 6).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0008
     * @tc.name testClampByte0008
     * @tc.desc Verify three ASCII letters clamped to 7 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0008', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 7)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 7)) <= 7).assertTrue();
      expect(clampPayload(text, 7).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0009
     * @tc.name testClampByte0009
     * @tc.desc Verify three ASCII letters clamped to 8 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0009', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 8)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 8)) <= 8).assertTrue();
      expect(clampPayload(text, 8).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0010
     * @tc.name testClampByte0010
     * @tc.desc Verify three ASCII letters clamped to 9 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0010', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 9)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 9)) <= 9).assertTrue();
      expect(clampPayload(text, 9).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0011
     * @tc.name testClampByte0011
     * @tc.desc Verify three ASCII letters clamped to 10 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0011', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 10)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 10)) <= 10).assertTrue();
      expect(clampPayload(text, 10).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0012
     * @tc.name testClampByte0012
     * @tc.desc Verify three ASCII letters clamped to 11 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0012', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 11)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 11)) <= 11).assertTrue();
      expect(clampPayload(text, 11).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0013
     * @tc.name testClampByte0013
     * @tc.desc Verify three ASCII letters clamped to 12 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0013', 0, () => {
      const text: string = 'abc';
      expect(clampPayload(text, 12)).assertEqual('abc');
      expect(utf8Length(clampPayload(text, 12)) <= 12).assertTrue();
      expect(clampPayload(text, 12).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0014
     * @tc.name testClampByte0014
     * @tc.desc Verify two CJK characters then ASCII clamped to 0 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0014', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 0)).assertEqual('');
      expect(utf8Length(clampPayload(text, 0)) <= 0).assertTrue();
      expect(clampPayload(text, 0).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0015
     * @tc.name testClampByte0015
     * @tc.desc Verify two CJK characters then ASCII clamped to 1 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0015', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 1)).assertEqual('');
      expect(utf8Length(clampPayload(text, 1)) <= 1).assertTrue();
      expect(clampPayload(text, 1).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0016
     * @tc.name testClampByte0016
     * @tc.desc Verify two CJK characters then ASCII clamped to 2 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0016', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 2)).assertEqual('');
      expect(utf8Length(clampPayload(text, 2)) <= 2).assertTrue();
      expect(clampPayload(text, 2).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0017
     * @tc.name testClampByte0017
     * @tc.desc Verify two CJK characters then ASCII clamped to 3 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0017', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 3)).assertEqual('中');
      expect(utf8Length(clampPayload(text, 3)) <= 3).assertTrue();
      expect(clampPayload(text, 3).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0018
     * @tc.name testClampByte0018
     * @tc.desc Verify two CJK characters then ASCII clamped to 4 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0018', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 4)).assertEqual('中');
      expect(utf8Length(clampPayload(text, 4)) <= 4).assertTrue();
      expect(clampPayload(text, 4).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0019
     * @tc.name testClampByte0019
     * @tc.desc Verify two CJK characters then ASCII clamped to 5 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0019', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 5)).assertEqual('中');
      expect(utf8Length(clampPayload(text, 5)) <= 5).assertTrue();
      expect(clampPayload(text, 5).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0020
     * @tc.name testClampByte0020
     * @tc.desc Verify two CJK characters then ASCII clamped to 6 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0020', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 6)).assertEqual('中文');
      expect(utf8Length(clampPayload(text, 6)) <= 6).assertTrue();
      expect(clampPayload(text, 6).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0021
     * @tc.name testClampByte0021
     * @tc.desc Verify two CJK characters then ASCII clamped to 7 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0021', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 7)).assertEqual('中文a');
      expect(utf8Length(clampPayload(text, 7)) <= 7).assertTrue();
      expect(clampPayload(text, 7).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0022
     * @tc.name testClampByte0022
     * @tc.desc Verify two CJK characters then ASCII clamped to 8 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0022', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 8)).assertEqual('中文ab');
      expect(utf8Length(clampPayload(text, 8)) <= 8).assertTrue();
      expect(clampPayload(text, 8).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0023
     * @tc.name testClampByte0023
     * @tc.desc Verify two CJK characters then ASCII clamped to 9 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0023', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 9)).assertEqual('中文abc');
      expect(utf8Length(clampPayload(text, 9)) <= 9).assertTrue();
      expect(clampPayload(text, 9).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0024
     * @tc.name testClampByte0024
     * @tc.desc Verify two CJK characters then ASCII clamped to 10 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0024', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 10)).assertEqual('中文abc');
      expect(utf8Length(clampPayload(text, 10)) <= 10).assertTrue();
      expect(clampPayload(text, 10).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0025
     * @tc.name testClampByte0025
     * @tc.desc Verify two CJK characters then ASCII clamped to 11 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0025', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 11)).assertEqual('中文abc');
      expect(utf8Length(clampPayload(text, 11)) <= 11).assertTrue();
      expect(clampPayload(text, 11).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0026
     * @tc.name testClampByte0026
     * @tc.desc Verify two CJK characters then ASCII clamped to 12 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0026', 0, () => {
      const text: string = '中文abc';
      expect(clampPayload(text, 12)).assertEqual('中文abc');
      expect(utf8Length(clampPayload(text, 12)) <= 12).assertTrue();
      expect(clampPayload(text, 12).length).assertEqual(5);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0027
     * @tc.name testClampByte0027
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 0 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0027', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 0)).assertEqual('');
      expect(utf8Length(clampPayload(text, 0)) <= 0).assertTrue();
      expect(clampPayload(text, 0).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0028
     * @tc.name testClampByte0028
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 1 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0028', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 1)).assertEqual('a');
      expect(utf8Length(clampPayload(text, 1)) <= 1).assertTrue();
      expect(clampPayload(text, 1).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0029
     * @tc.name testClampByte0029
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 2 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0029', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 2)).assertEqual('a');
      expect(utf8Length(clampPayload(text, 2)) <= 2).assertTrue();
      expect(clampPayload(text, 2).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0030
     * @tc.name testClampByte0030
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 3 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0030', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 3)).assertEqual('a');
      expect(utf8Length(clampPayload(text, 3)) <= 3).assertTrue();
      expect(clampPayload(text, 3).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0031
     * @tc.name testClampByte0031
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 4 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0031', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 4)).assertEqual('a\uD83D');
      expect(utf8Length(clampPayload(text, 4)) <= 4).assertTrue();
      expect(clampPayload(text, 4).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0032
     * @tc.name testClampByte0032
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 5 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0032', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 5)).assertEqual('a\uD83D');
      expect(utf8Length(clampPayload(text, 5)) <= 5).assertTrue();
      expect(clampPayload(text, 5).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0033
     * @tc.name testClampByte0033
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 6 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0033', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 6)).assertEqual('a\uD83D');
      expect(utf8Length(clampPayload(text, 6)) <= 6).assertTrue();
      expect(clampPayload(text, 6).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0034
     * @tc.name testClampByte0034
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 7 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0034', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 7)).assertEqual('a🐾');
      expect(utf8Length(clampPayload(text, 7)) <= 7).assertTrue();
      expect(clampPayload(text, 7).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0035
     * @tc.name testClampByte0035
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 8 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0035', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 8)).assertEqual('a🐾b');
      expect(utf8Length(clampPayload(text, 8)) <= 8).assertTrue();
      expect(clampPayload(text, 8).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0036
     * @tc.name testClampByte0036
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 9 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0036', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 9)).assertEqual('a🐾b');
      expect(utf8Length(clampPayload(text, 9)) <= 9).assertTrue();
      expect(clampPayload(text, 9).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0037
     * @tc.name testClampByte0037
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 10 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0037', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 10)).assertEqual('a🐾b');
      expect(utf8Length(clampPayload(text, 10)) <= 10).assertTrue();
      expect(clampPayload(text, 10).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0038
     * @tc.name testClampByte0038
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 11 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0038', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 11)).assertEqual('a🐾b');
      expect(utf8Length(clampPayload(text, 11)) <= 11).assertTrue();
      expect(clampPayload(text, 11).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0039
     * @tc.name testClampByte0039
     * @tc.desc Verify a surrogate pair between ASCII letters clamped to 12 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0039', 0, () => {
      const text: string = 'a🐾b';
      expect(clampPayload(text, 12)).assertEqual('a🐾b');
      expect(utf8Length(clampPayload(text, 12)) <= 12).assertTrue();
      expect(clampPayload(text, 12).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0040
     * @tc.name testClampByte0040
     * @tc.desc Verify three CJK characters clamped to 0 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0040', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 0)).assertEqual('');
      expect(utf8Length(clampPayload(text, 0)) <= 0).assertTrue();
      expect(clampPayload(text, 0).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0041
     * @tc.name testClampByte0041
     * @tc.desc Verify three CJK characters clamped to 1 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0041', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 1)).assertEqual('');
      expect(utf8Length(clampPayload(text, 1)) <= 1).assertTrue();
      expect(clampPayload(text, 1).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0042
     * @tc.name testClampByte0042
     * @tc.desc Verify three CJK characters clamped to 2 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0042', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 2)).assertEqual('');
      expect(utf8Length(clampPayload(text, 2)) <= 2).assertTrue();
      expect(clampPayload(text, 2).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0043
     * @tc.name testClampByte0043
     * @tc.desc Verify three CJK characters clamped to 3 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0043', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 3)).assertEqual('分');
      expect(utf8Length(clampPayload(text, 3)) <= 3).assertTrue();
      expect(clampPayload(text, 3).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0044
     * @tc.name testClampByte0044
     * @tc.desc Verify three CJK characters clamped to 4 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0044', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 4)).assertEqual('分');
      expect(utf8Length(clampPayload(text, 4)) <= 4).assertTrue();
      expect(clampPayload(text, 4).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0045
     * @tc.name testClampByte0045
     * @tc.desc Verify three CJK characters clamped to 5 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0045', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 5)).assertEqual('分');
      expect(utf8Length(clampPayload(text, 5)) <= 5).assertTrue();
      expect(clampPayload(text, 5).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0046
     * @tc.name testClampByte0046
     * @tc.desc Verify three CJK characters clamped to 6 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0046', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 6)).assertEqual('分布');
      expect(utf8Length(clampPayload(text, 6)) <= 6).assertTrue();
      expect(clampPayload(text, 6).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0047
     * @tc.name testClampByte0047
     * @tc.desc Verify three CJK characters clamped to 7 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0047', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 7)).assertEqual('分布');
      expect(utf8Length(clampPayload(text, 7)) <= 7).assertTrue();
      expect(clampPayload(text, 7).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0048
     * @tc.name testClampByte0048
     * @tc.desc Verify three CJK characters clamped to 8 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0048', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 8)).assertEqual('分布');
      expect(utf8Length(clampPayload(text, 8)) <= 8).assertTrue();
      expect(clampPayload(text, 8).length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0049
     * @tc.name testClampByte0049
     * @tc.desc Verify three CJK characters clamped to 9 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0049', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 9)).assertEqual('分布式');
      expect(utf8Length(clampPayload(text, 9)) <= 9).assertTrue();
      expect(clampPayload(text, 9).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0050
     * @tc.name testClampByte0050
     * @tc.desc Verify three CJK characters clamped to 10 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0050', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 10)).assertEqual('分布式');
      expect(utf8Length(clampPayload(text, 10)) <= 10).assertTrue();
      expect(clampPayload(text, 10).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0051
     * @tc.name testClampByte0051
     * @tc.desc Verify three CJK characters clamped to 11 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0051', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 11)).assertEqual('分布式');
      expect(utf8Length(clampPayload(text, 11)) <= 11).assertTrue();
      expect(clampPayload(text, 11).length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CLAMP_0052
     * @tc.name testClampByte0052
     * @tc.desc Verify three CJK characters clamped to 12 bytes never splits a code unit.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testClampByte0052', 0, () => {
      const text: string = '分布式';
      expect(clampPayload(text, 12)).assertEqual('分布式');
      expect(utf8Length(clampPayload(text, 12)) <= 12).assertTrue();
      expect(clampPayload(text, 12).length).assertEqual(3);
    });

  });
}
