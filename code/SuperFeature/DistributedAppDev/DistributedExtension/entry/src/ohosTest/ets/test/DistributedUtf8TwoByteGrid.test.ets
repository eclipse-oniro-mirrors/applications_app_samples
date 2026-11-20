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

/** 取字节序列，便于把期望值写成可读的十进制串 */
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
 * 两字节区间（U+0080–U+07FF）按步长 16 抽样 120 个码点：
 * 首字节落在 0xC2–0xDF，第二字节的 10xxxxxx 前缀必须始终成立。
 * 抽样而不是穷举，是因为这一区的失败模式只有两种：首字节算错、或漏掉掩码。
 */
export default function distributedUtf8TwoByteGridTest() {
  describe('DistributedUtf8TwoByteGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0001
     * @tc.name testTwoByte0001
     * @tc.desc Verify U+0080 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0001', 0, () => {
      const text: string = '';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0002
     * @tc.name testTwoByte0002
     * @tc.desc Verify U+0090 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0002', 0, () => {
      const text: string = '';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0003
     * @tc.name testTwoByte0003
     * @tc.desc Verify U+00A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0003', 0, () => {
      const text: string = ' ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0004
     * @tc.name testTwoByte0004
     * @tc.desc Verify U+00B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0004', 0, () => {
      const text: string = '°';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0005
     * @tc.name testTwoByte0005
     * @tc.desc Verify U+00C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0005', 0, () => {
      const text: string = 'À';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0006
     * @tc.name testTwoByte0006
     * @tc.desc Verify U+00D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0006', 0, () => {
      const text: string = 'Ð';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0007
     * @tc.name testTwoByte0007
     * @tc.desc Verify U+00E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0007', 0, () => {
      const text: string = 'à';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0008
     * @tc.name testTwoByte0008
     * @tc.desc Verify U+00F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0008', 0, () => {
      const text: string = 'ð';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0009
     * @tc.name testTwoByte0009
     * @tc.desc Verify U+0100 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0009', 0, () => {
      const text: string = 'Ā';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('196,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0010
     * @tc.name testTwoByte0010
     * @tc.desc Verify U+0110 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0010', 0, () => {
      const text: string = 'Đ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('196,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0011
     * @tc.name testTwoByte0011
     * @tc.desc Verify U+0120 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0011', 0, () => {
      const text: string = 'Ġ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('196,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0012
     * @tc.name testTwoByte0012
     * @tc.desc Verify U+0130 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0012', 0, () => {
      const text: string = 'İ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('196,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0013
     * @tc.name testTwoByte0013
     * @tc.desc Verify U+0140 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0013', 0, () => {
      const text: string = 'ŀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('197,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0014
     * @tc.name testTwoByte0014
     * @tc.desc Verify U+0150 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0014', 0, () => {
      const text: string = 'Ő';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('197,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0015
     * @tc.name testTwoByte0015
     * @tc.desc Verify U+0160 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0015', 0, () => {
      const text: string = 'Š';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('197,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0016
     * @tc.name testTwoByte0016
     * @tc.desc Verify U+0170 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0016', 0, () => {
      const text: string = 'Ű';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('197,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0017
     * @tc.name testTwoByte0017
     * @tc.desc Verify U+0180 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0017', 0, () => {
      const text: string = 'ƀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('198,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0018
     * @tc.name testTwoByte0018
     * @tc.desc Verify U+0190 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0018', 0, () => {
      const text: string = 'Ɛ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('198,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0019
     * @tc.name testTwoByte0019
     * @tc.desc Verify U+01A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0019', 0, () => {
      const text: string = 'Ơ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('198,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0020
     * @tc.name testTwoByte0020
     * @tc.desc Verify U+01B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0020', 0, () => {
      const text: string = 'ư';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('198,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0021
     * @tc.name testTwoByte0021
     * @tc.desc Verify U+01C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0021', 0, () => {
      const text: string = 'ǀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('199,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0022
     * @tc.name testTwoByte0022
     * @tc.desc Verify U+01D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0022', 0, () => {
      const text: string = 'ǐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('199,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0023
     * @tc.name testTwoByte0023
     * @tc.desc Verify U+01E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0023', 0, () => {
      const text: string = 'Ǡ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('199,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0024
     * @tc.name testTwoByte0024
     * @tc.desc Verify U+01F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0024', 0, () => {
      const text: string = 'ǰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('199,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0025
     * @tc.name testTwoByte0025
     * @tc.desc Verify U+0200 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0025', 0, () => {
      const text: string = 'Ȁ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('200,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0026
     * @tc.name testTwoByte0026
     * @tc.desc Verify U+0210 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0026', 0, () => {
      const text: string = 'Ȑ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('200,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0027
     * @tc.name testTwoByte0027
     * @tc.desc Verify U+0220 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0027', 0, () => {
      const text: string = 'Ƞ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('200,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0028
     * @tc.name testTwoByte0028
     * @tc.desc Verify U+0230 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0028', 0, () => {
      const text: string = 'Ȱ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('200,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0029
     * @tc.name testTwoByte0029
     * @tc.desc Verify U+0240 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0029', 0, () => {
      const text: string = 'ɀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('201,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0030
     * @tc.name testTwoByte0030
     * @tc.desc Verify U+0250 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0030', 0, () => {
      const text: string = 'ɐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('201,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0031
     * @tc.name testTwoByte0031
     * @tc.desc Verify U+0260 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0031', 0, () => {
      const text: string = 'ɠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('201,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0032
     * @tc.name testTwoByte0032
     * @tc.desc Verify U+0270 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0032', 0, () => {
      const text: string = 'ɰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('201,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0033
     * @tc.name testTwoByte0033
     * @tc.desc Verify U+0280 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0033', 0, () => {
      const text: string = 'ʀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('202,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0034
     * @tc.name testTwoByte0034
     * @tc.desc Verify U+0290 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0034', 0, () => {
      const text: string = 'ʐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('202,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0035
     * @tc.name testTwoByte0035
     * @tc.desc Verify U+02A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0035', 0, () => {
      const text: string = 'ʠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('202,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0036
     * @tc.name testTwoByte0036
     * @tc.desc Verify U+02B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0036', 0, () => {
      const text: string = 'ʰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('202,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0037
     * @tc.name testTwoByte0037
     * @tc.desc Verify U+02C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0037', 0, () => {
      const text: string = 'ˀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('203,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0038
     * @tc.name testTwoByte0038
     * @tc.desc Verify U+02D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0038', 0, () => {
      const text: string = 'ː';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('203,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0039
     * @tc.name testTwoByte0039
     * @tc.desc Verify U+02E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0039', 0, () => {
      const text: string = 'ˠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('203,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0040
     * @tc.name testTwoByte0040
     * @tc.desc Verify U+02F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0040', 0, () => {
      const text: string = '˰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('203,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0041
     * @tc.name testTwoByte0041
     * @tc.desc Verify U+0300 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0041', 0, () => {
      const text: string = '̀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('204,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0042
     * @tc.name testTwoByte0042
     * @tc.desc Verify U+0310 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0042', 0, () => {
      const text: string = '̐';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('204,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0043
     * @tc.name testTwoByte0043
     * @tc.desc Verify U+0320 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0043', 0, () => {
      const text: string = '̠';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('204,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0044
     * @tc.name testTwoByte0044
     * @tc.desc Verify U+0330 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0044', 0, () => {
      const text: string = '̰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('204,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0045
     * @tc.name testTwoByte0045
     * @tc.desc Verify U+0340 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0045', 0, () => {
      const text: string = '̀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('205,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0046
     * @tc.name testTwoByte0046
     * @tc.desc Verify U+0350 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0046', 0, () => {
      const text: string = '͐';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('205,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0047
     * @tc.name testTwoByte0047
     * @tc.desc Verify U+0360 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0047', 0, () => {
      const text: string = '͠';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('205,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0048
     * @tc.name testTwoByte0048
     * @tc.desc Verify U+0370 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0048', 0, () => {
      const text: string = 'Ͱ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('205,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0049
     * @tc.name testTwoByte0049
     * @tc.desc Verify U+0380 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0049', 0, () => {
      const text: string = '΀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('206,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0050
     * @tc.name testTwoByte0050
     * @tc.desc Verify U+0390 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0050', 0, () => {
      const text: string = 'ΐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('206,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0051
     * @tc.name testTwoByte0051
     * @tc.desc Verify U+03A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0051', 0, () => {
      const text: string = 'Π';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('206,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0052
     * @tc.name testTwoByte0052
     * @tc.desc Verify U+03B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0052', 0, () => {
      const text: string = 'ΰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('206,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0053
     * @tc.name testTwoByte0053
     * @tc.desc Verify U+03C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0053', 0, () => {
      const text: string = 'π';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('207,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0054
     * @tc.name testTwoByte0054
     * @tc.desc Verify U+03D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0054', 0, () => {
      const text: string = 'ϐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('207,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0055
     * @tc.name testTwoByte0055
     * @tc.desc Verify U+03E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0055', 0, () => {
      const text: string = 'Ϡ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('207,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0056
     * @tc.name testTwoByte0056
     * @tc.desc Verify U+03F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0056', 0, () => {
      const text: string = 'ϰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('207,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0057
     * @tc.name testTwoByte0057
     * @tc.desc Verify U+0400 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0057', 0, () => {
      const text: string = 'Ѐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('208,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0058
     * @tc.name testTwoByte0058
     * @tc.desc Verify U+0410 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0058', 0, () => {
      const text: string = 'А';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('208,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0059
     * @tc.name testTwoByte0059
     * @tc.desc Verify U+0420 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0059', 0, () => {
      const text: string = 'Р';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('208,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0060
     * @tc.name testTwoByte0060
     * @tc.desc Verify U+0430 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0060', 0, () => {
      const text: string = 'а';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('208,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0061
     * @tc.name testTwoByte0061
     * @tc.desc Verify U+0440 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0061', 0, () => {
      const text: string = 'р';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('209,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0062
     * @tc.name testTwoByte0062
     * @tc.desc Verify U+0450 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0062', 0, () => {
      const text: string = 'ѐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('209,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0063
     * @tc.name testTwoByte0063
     * @tc.desc Verify U+0460 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0063', 0, () => {
      const text: string = 'Ѡ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('209,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0064
     * @tc.name testTwoByte0064
     * @tc.desc Verify U+0470 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0064', 0, () => {
      const text: string = 'Ѱ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('209,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0065
     * @tc.name testTwoByte0065
     * @tc.desc Verify U+0480 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0065', 0, () => {
      const text: string = 'Ҁ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('210,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0066
     * @tc.name testTwoByte0066
     * @tc.desc Verify U+0490 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0066', 0, () => {
      const text: string = 'Ґ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('210,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0067
     * @tc.name testTwoByte0067
     * @tc.desc Verify U+04A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0067', 0, () => {
      const text: string = 'Ҡ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('210,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0068
     * @tc.name testTwoByte0068
     * @tc.desc Verify U+04B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0068', 0, () => {
      const text: string = 'Ұ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('210,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0069
     * @tc.name testTwoByte0069
     * @tc.desc Verify U+04C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0069', 0, () => {
      const text: string = 'Ӏ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('211,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0070
     * @tc.name testTwoByte0070
     * @tc.desc Verify U+04D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0070', 0, () => {
      const text: string = 'Ӑ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('211,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0071
     * @tc.name testTwoByte0071
     * @tc.desc Verify U+04E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0071', 0, () => {
      const text: string = 'Ӡ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('211,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0072
     * @tc.name testTwoByte0072
     * @tc.desc Verify U+04F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0072', 0, () => {
      const text: string = 'Ӱ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('211,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0073
     * @tc.name testTwoByte0073
     * @tc.desc Verify U+0500 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0073', 0, () => {
      const text: string = 'Ԁ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('212,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0074
     * @tc.name testTwoByte0074
     * @tc.desc Verify U+0510 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0074', 0, () => {
      const text: string = 'Ԑ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('212,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0075
     * @tc.name testTwoByte0075
     * @tc.desc Verify U+0520 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0075', 0, () => {
      const text: string = 'Ԡ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('212,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0076
     * @tc.name testTwoByte0076
     * @tc.desc Verify U+0530 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0076', 0, () => {
      const text: string = '԰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('212,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0077
     * @tc.name testTwoByte0077
     * @tc.desc Verify U+0540 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0077', 0, () => {
      const text: string = 'Հ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('213,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0078
     * @tc.name testTwoByte0078
     * @tc.desc Verify U+0550 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0078', 0, () => {
      const text: string = 'Ր';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('213,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0079
     * @tc.name testTwoByte0079
     * @tc.desc Verify U+0560 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0079', 0, () => {
      const text: string = 'ՠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('213,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0080
     * @tc.name testTwoByte0080
     * @tc.desc Verify U+0570 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0080', 0, () => {
      const text: string = 'հ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('213,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0081
     * @tc.name testTwoByte0081
     * @tc.desc Verify U+0580 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0081', 0, () => {
      const text: string = 'ր';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('214,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0082
     * @tc.name testTwoByte0082
     * @tc.desc Verify U+0590 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0082', 0, () => {
      const text: string = '֐';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('214,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0083
     * @tc.name testTwoByte0083
     * @tc.desc Verify U+05A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0083', 0, () => {
      const text: string = '֠';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('214,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0084
     * @tc.name testTwoByte0084
     * @tc.desc Verify U+05B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0084', 0, () => {
      const text: string = 'ְ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('214,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0085
     * @tc.name testTwoByte0085
     * @tc.desc Verify U+05C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0085', 0, () => {
      const text: string = '׀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('215,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0086
     * @tc.name testTwoByte0086
     * @tc.desc Verify U+05D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0086', 0, () => {
      const text: string = 'א';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('215,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0087
     * @tc.name testTwoByte0087
     * @tc.desc Verify U+05E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0087', 0, () => {
      const text: string = 'נ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('215,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0088
     * @tc.name testTwoByte0088
     * @tc.desc Verify U+05F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0088', 0, () => {
      const text: string = 'װ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('215,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0089
     * @tc.name testTwoByte0089
     * @tc.desc Verify U+0600 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0089', 0, () => {
      const text: string = '؀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('216,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0090
     * @tc.name testTwoByte0090
     * @tc.desc Verify U+0610 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0090', 0, () => {
      const text: string = 'ؐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('216,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0091
     * @tc.name testTwoByte0091
     * @tc.desc Verify U+0620 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0091', 0, () => {
      const text: string = 'ؠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('216,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0092
     * @tc.name testTwoByte0092
     * @tc.desc Verify U+0630 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0092', 0, () => {
      const text: string = 'ذ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('216,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0093
     * @tc.name testTwoByte0093
     * @tc.desc Verify U+0640 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0093', 0, () => {
      const text: string = 'ـ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('217,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0094
     * @tc.name testTwoByte0094
     * @tc.desc Verify U+0650 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0094', 0, () => {
      const text: string = 'ِ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('217,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0095
     * @tc.name testTwoByte0095
     * @tc.desc Verify U+0660 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0095', 0, () => {
      const text: string = '٠';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('217,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0096
     * @tc.name testTwoByte0096
     * @tc.desc Verify U+0670 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0096', 0, () => {
      const text: string = 'ٰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('217,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0097
     * @tc.name testTwoByte0097
     * @tc.desc Verify U+0680 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0097', 0, () => {
      const text: string = 'ڀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('218,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0098
     * @tc.name testTwoByte0098
     * @tc.desc Verify U+0690 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0098', 0, () => {
      const text: string = 'ڐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('218,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0099
     * @tc.name testTwoByte0099
     * @tc.desc Verify U+06A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0099', 0, () => {
      const text: string = 'ڠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('218,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0100
     * @tc.name testTwoByte0100
     * @tc.desc Verify U+06B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0100', 0, () => {
      const text: string = 'ڰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('218,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0101
     * @tc.name testTwoByte0101
     * @tc.desc Verify U+06C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0101', 0, () => {
      const text: string = 'ۀ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('219,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0102
     * @tc.name testTwoByte0102
     * @tc.desc Verify U+06D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0102', 0, () => {
      const text: string = 'ې';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('219,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0103
     * @tc.name testTwoByte0103
     * @tc.desc Verify U+06E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0103', 0, () => {
      const text: string = '۠';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('219,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0104
     * @tc.name testTwoByte0104
     * @tc.desc Verify U+06F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0104', 0, () => {
      const text: string = '۰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('219,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0105
     * @tc.name testTwoByte0105
     * @tc.desc Verify U+0700 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0105', 0, () => {
      const text: string = '܀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('220,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0106
     * @tc.name testTwoByte0106
     * @tc.desc Verify U+0710 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0106', 0, () => {
      const text: string = 'ܐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('220,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0107
     * @tc.name testTwoByte0107
     * @tc.desc Verify U+0720 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0107', 0, () => {
      const text: string = 'ܠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('220,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0108
     * @tc.name testTwoByte0108
     * @tc.desc Verify U+0730 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0108', 0, () => {
      const text: string = 'ܰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('220,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0109
     * @tc.name testTwoByte0109
     * @tc.desc Verify U+0740 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0109', 0, () => {
      const text: string = '݀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('221,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0110
     * @tc.name testTwoByte0110
     * @tc.desc Verify U+0750 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0110', 0, () => {
      const text: string = 'ݐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('221,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0111
     * @tc.name testTwoByte0111
     * @tc.desc Verify U+0760 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0111', 0, () => {
      const text: string = 'ݠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('221,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0112
     * @tc.name testTwoByte0112
     * @tc.desc Verify U+0770 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0112', 0, () => {
      const text: string = 'ݰ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('221,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0113
     * @tc.name testTwoByte0113
     * @tc.desc Verify U+0780 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0113', 0, () => {
      const text: string = 'ހ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('222,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0114
     * @tc.name testTwoByte0114
     * @tc.desc Verify U+0790 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0114', 0, () => {
      const text: string = 'ސ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('222,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0115
     * @tc.name testTwoByte0115
     * @tc.desc Verify U+07A0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0115', 0, () => {
      const text: string = 'ޠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('222,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0116
     * @tc.name testTwoByte0116
     * @tc.desc Verify U+07B0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0116', 0, () => {
      const text: string = 'ް';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('222,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0117
     * @tc.name testTwoByte0117
     * @tc.desc Verify U+07C0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0117', 0, () => {
      const text: string = '߀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('223,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0118
     * @tc.name testTwoByte0118
     * @tc.desc Verify U+07D0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0118', 0, () => {
      const text: string = 'ߐ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('223,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0119
     * @tc.name testTwoByte0119
     * @tc.desc Verify U+07E0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0119', 0, () => {
      const text: string = 'ߠ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('223,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_TWOBYTE_0120
     * @tc.name testTwoByte0120
     * @tc.desc Verify U+07F0 in two byte range weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testTwoByte0120', 0, () => {
      const text: string = '߰';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('223,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

  });
}
