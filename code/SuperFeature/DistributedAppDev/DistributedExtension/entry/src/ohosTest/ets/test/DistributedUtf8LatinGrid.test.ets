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
 * Latin-1 补充区（U+00A0–U+00FF）逐码点网格：96 个字符全部落在两字节区间，
 * 用来钉住 0xC2 / 0xC3 两个首字节与低 6 位的拼接规则。
 * 这一区的字符在设备名、服务名里最常见（重音字母、度数符号、货币符号）。
 */
export default function distributedUtf8LatinGridTest() {
  describe('DistributedUtf8LatinGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0001
     * @tc.name testLatin0001
     * @tc.desc Verify U+00A0 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0001', 0, () => {
      const text: string = ' ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0002
     * @tc.name testLatin0002
     * @tc.desc Verify U+00A1 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0002', 0, () => {
      const text: string = '¡';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,161');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0003
     * @tc.name testLatin0003
     * @tc.desc Verify U+00A2 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0003', 0, () => {
      const text: string = '¢';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,162');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0004
     * @tc.name testLatin0004
     * @tc.desc Verify U+00A3 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0004', 0, () => {
      const text: string = '£';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,163');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0005
     * @tc.name testLatin0005
     * @tc.desc Verify U+00A4 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0005', 0, () => {
      const text: string = '¤';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,164');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0006
     * @tc.name testLatin0006
     * @tc.desc Verify U+00A5 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0006', 0, () => {
      const text: string = '¥';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,165');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0007
     * @tc.name testLatin0007
     * @tc.desc Verify U+00A6 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0007', 0, () => {
      const text: string = '¦';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,166');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0008
     * @tc.name testLatin0008
     * @tc.desc Verify U+00A7 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0008', 0, () => {
      const text: string = '§';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,167');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0009
     * @tc.name testLatin0009
     * @tc.desc Verify U+00A8 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0009', 0, () => {
      const text: string = '¨';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,168');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0010
     * @tc.name testLatin0010
     * @tc.desc Verify U+00A9 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0010', 0, () => {
      const text: string = '©';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,169');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0011
     * @tc.name testLatin0011
     * @tc.desc Verify U+00AA in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0011', 0, () => {
      const text: string = 'ª';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,170');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0012
     * @tc.name testLatin0012
     * @tc.desc Verify U+00AB in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0012', 0, () => {
      const text: string = '«';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,171');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0013
     * @tc.name testLatin0013
     * @tc.desc Verify U+00AC in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0013', 0, () => {
      const text: string = '¬';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,172');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0014
     * @tc.name testLatin0014
     * @tc.desc Verify U+00AD in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0014', 0, () => {
      const text: string = '­';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,173');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0015
     * @tc.name testLatin0015
     * @tc.desc Verify U+00AE in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0015', 0, () => {
      const text: string = '®';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,174');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0016
     * @tc.name testLatin0016
     * @tc.desc Verify U+00AF in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0016', 0, () => {
      const text: string = '¯';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,175');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0017
     * @tc.name testLatin0017
     * @tc.desc Verify U+00B0 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0017', 0, () => {
      const text: string = '°';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0018
     * @tc.name testLatin0018
     * @tc.desc Verify U+00B1 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0018', 0, () => {
      const text: string = '±';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,177');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0019
     * @tc.name testLatin0019
     * @tc.desc Verify U+00B2 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0019', 0, () => {
      const text: string = '²';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,178');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0020
     * @tc.name testLatin0020
     * @tc.desc Verify U+00B3 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0020', 0, () => {
      const text: string = '³';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,179');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0021
     * @tc.name testLatin0021
     * @tc.desc Verify U+00B4 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0021', 0, () => {
      const text: string = '´';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,180');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0022
     * @tc.name testLatin0022
     * @tc.desc Verify U+00B5 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0022', 0, () => {
      const text: string = 'µ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,181');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0023
     * @tc.name testLatin0023
     * @tc.desc Verify U+00B6 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0023', 0, () => {
      const text: string = '¶';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,182');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0024
     * @tc.name testLatin0024
     * @tc.desc Verify U+00B7 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0024', 0, () => {
      const text: string = '·';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,183');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0025
     * @tc.name testLatin0025
     * @tc.desc Verify U+00B8 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0025', 0, () => {
      const text: string = '¸';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,184');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0026
     * @tc.name testLatin0026
     * @tc.desc Verify U+00B9 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0026', 0, () => {
      const text: string = '¹';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,185');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0027
     * @tc.name testLatin0027
     * @tc.desc Verify U+00BA in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0027', 0, () => {
      const text: string = 'º';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,186');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0028
     * @tc.name testLatin0028
     * @tc.desc Verify U+00BB in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0028', 0, () => {
      const text: string = '»';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,187');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0029
     * @tc.name testLatin0029
     * @tc.desc Verify U+00BC in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0029', 0, () => {
      const text: string = '¼';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,188');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0030
     * @tc.name testLatin0030
     * @tc.desc Verify U+00BD in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0030', 0, () => {
      const text: string = '½';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,189');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0031
     * @tc.name testLatin0031
     * @tc.desc Verify U+00BE in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0031', 0, () => {
      const text: string = '¾';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,190');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0032
     * @tc.name testLatin0032
     * @tc.desc Verify U+00BF in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0032', 0, () => {
      const text: string = '¿';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('194,191');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0033
     * @tc.name testLatin0033
     * @tc.desc Verify U+00C0 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0033', 0, () => {
      const text: string = 'À';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,128');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0034
     * @tc.name testLatin0034
     * @tc.desc Verify U+00C1 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0034', 0, () => {
      const text: string = 'Á';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,129');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0035
     * @tc.name testLatin0035
     * @tc.desc Verify U+00C2 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0035', 0, () => {
      const text: string = 'Â';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,130');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0036
     * @tc.name testLatin0036
     * @tc.desc Verify U+00C3 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0036', 0, () => {
      const text: string = 'Ã';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,131');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0037
     * @tc.name testLatin0037
     * @tc.desc Verify U+00C4 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0037', 0, () => {
      const text: string = 'Ä';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,132');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0038
     * @tc.name testLatin0038
     * @tc.desc Verify U+00C5 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0038', 0, () => {
      const text: string = 'Å';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,133');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0039
     * @tc.name testLatin0039
     * @tc.desc Verify U+00C6 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0039', 0, () => {
      const text: string = 'Æ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,134');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0040
     * @tc.name testLatin0040
     * @tc.desc Verify U+00C7 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0040', 0, () => {
      const text: string = 'Ç';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,135');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0041
     * @tc.name testLatin0041
     * @tc.desc Verify U+00C8 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0041', 0, () => {
      const text: string = 'È';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,136');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0042
     * @tc.name testLatin0042
     * @tc.desc Verify U+00C9 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0042', 0, () => {
      const text: string = 'É';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,137');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0043
     * @tc.name testLatin0043
     * @tc.desc Verify U+00CA in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0043', 0, () => {
      const text: string = 'Ê';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,138');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0044
     * @tc.name testLatin0044
     * @tc.desc Verify U+00CB in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0044', 0, () => {
      const text: string = 'Ë';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,139');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0045
     * @tc.name testLatin0045
     * @tc.desc Verify U+00CC in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0045', 0, () => {
      const text: string = 'Ì';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,140');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0046
     * @tc.name testLatin0046
     * @tc.desc Verify U+00CD in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0046', 0, () => {
      const text: string = 'Í';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,141');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0047
     * @tc.name testLatin0047
     * @tc.desc Verify U+00CE in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0047', 0, () => {
      const text: string = 'Î';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,142');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0048
     * @tc.name testLatin0048
     * @tc.desc Verify U+00CF in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0048', 0, () => {
      const text: string = 'Ï';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,143');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0049
     * @tc.name testLatin0049
     * @tc.desc Verify U+00D0 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0049', 0, () => {
      const text: string = 'Ð';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,144');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0050
     * @tc.name testLatin0050
     * @tc.desc Verify U+00D1 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0050', 0, () => {
      const text: string = 'Ñ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,145');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0051
     * @tc.name testLatin0051
     * @tc.desc Verify U+00D2 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0051', 0, () => {
      const text: string = 'Ò';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,146');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0052
     * @tc.name testLatin0052
     * @tc.desc Verify U+00D3 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0052', 0, () => {
      const text: string = 'Ó';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,147');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0053
     * @tc.name testLatin0053
     * @tc.desc Verify U+00D4 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0053', 0, () => {
      const text: string = 'Ô';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,148');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0054
     * @tc.name testLatin0054
     * @tc.desc Verify U+00D5 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0054', 0, () => {
      const text: string = 'Õ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,149');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0055
     * @tc.name testLatin0055
     * @tc.desc Verify U+00D6 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0055', 0, () => {
      const text: string = 'Ö';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,150');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0056
     * @tc.name testLatin0056
     * @tc.desc Verify U+00D7 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0056', 0, () => {
      const text: string = '×';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,151');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0057
     * @tc.name testLatin0057
     * @tc.desc Verify U+00D8 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0057', 0, () => {
      const text: string = 'Ø';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,152');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0058
     * @tc.name testLatin0058
     * @tc.desc Verify U+00D9 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0058', 0, () => {
      const text: string = 'Ù';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,153');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0059
     * @tc.name testLatin0059
     * @tc.desc Verify U+00DA in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0059', 0, () => {
      const text: string = 'Ú';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,154');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0060
     * @tc.name testLatin0060
     * @tc.desc Verify U+00DB in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0060', 0, () => {
      const text: string = 'Û';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,155');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0061
     * @tc.name testLatin0061
     * @tc.desc Verify U+00DC in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0061', 0, () => {
      const text: string = 'Ü';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,156');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0062
     * @tc.name testLatin0062
     * @tc.desc Verify U+00DD in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0062', 0, () => {
      const text: string = 'Ý';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,157');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0063
     * @tc.name testLatin0063
     * @tc.desc Verify U+00DE in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0063', 0, () => {
      const text: string = 'Þ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,158');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0064
     * @tc.name testLatin0064
     * @tc.desc Verify U+00DF in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0064', 0, () => {
      const text: string = 'ß';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,159');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0065
     * @tc.name testLatin0065
     * @tc.desc Verify U+00E0 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0065', 0, () => {
      const text: string = 'à';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,160');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0066
     * @tc.name testLatin0066
     * @tc.desc Verify U+00E1 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0066', 0, () => {
      const text: string = 'á';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,161');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0067
     * @tc.name testLatin0067
     * @tc.desc Verify U+00E2 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0067', 0, () => {
      const text: string = 'â';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,162');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0068
     * @tc.name testLatin0068
     * @tc.desc Verify U+00E3 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0068', 0, () => {
      const text: string = 'ã';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,163');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0069
     * @tc.name testLatin0069
     * @tc.desc Verify U+00E4 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0069', 0, () => {
      const text: string = 'ä';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,164');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0070
     * @tc.name testLatin0070
     * @tc.desc Verify U+00E5 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0070', 0, () => {
      const text: string = 'å';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,165');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0071
     * @tc.name testLatin0071
     * @tc.desc Verify U+00E6 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0071', 0, () => {
      const text: string = 'æ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,166');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0072
     * @tc.name testLatin0072
     * @tc.desc Verify U+00E7 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0072', 0, () => {
      const text: string = 'ç';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,167');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0073
     * @tc.name testLatin0073
     * @tc.desc Verify U+00E8 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0073', 0, () => {
      const text: string = 'è';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,168');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0074
     * @tc.name testLatin0074
     * @tc.desc Verify U+00E9 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0074', 0, () => {
      const text: string = 'é';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,169');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0075
     * @tc.name testLatin0075
     * @tc.desc Verify U+00EA in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0075', 0, () => {
      const text: string = 'ê';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,170');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0076
     * @tc.name testLatin0076
     * @tc.desc Verify U+00EB in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0076', 0, () => {
      const text: string = 'ë';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,171');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0077
     * @tc.name testLatin0077
     * @tc.desc Verify U+00EC in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0077', 0, () => {
      const text: string = 'ì';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,172');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0078
     * @tc.name testLatin0078
     * @tc.desc Verify U+00ED in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0078', 0, () => {
      const text: string = 'í';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,173');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0079
     * @tc.name testLatin0079
     * @tc.desc Verify U+00EE in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0079', 0, () => {
      const text: string = 'î';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,174');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0080
     * @tc.name testLatin0080
     * @tc.desc Verify U+00EF in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0080', 0, () => {
      const text: string = 'ï';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,175');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0081
     * @tc.name testLatin0081
     * @tc.desc Verify U+00F0 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0081', 0, () => {
      const text: string = 'ð';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,176');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0082
     * @tc.name testLatin0082
     * @tc.desc Verify U+00F1 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0082', 0, () => {
      const text: string = 'ñ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,177');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0083
     * @tc.name testLatin0083
     * @tc.desc Verify U+00F2 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0083', 0, () => {
      const text: string = 'ò';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,178');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0084
     * @tc.name testLatin0084
     * @tc.desc Verify U+00F3 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0084', 0, () => {
      const text: string = 'ó';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,179');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0085
     * @tc.name testLatin0085
     * @tc.desc Verify U+00F4 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0085', 0, () => {
      const text: string = 'ô';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,180');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0086
     * @tc.name testLatin0086
     * @tc.desc Verify U+00F5 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0086', 0, () => {
      const text: string = 'õ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,181');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0087
     * @tc.name testLatin0087
     * @tc.desc Verify U+00F6 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0087', 0, () => {
      const text: string = 'ö';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,182');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0088
     * @tc.name testLatin0088
     * @tc.desc Verify U+00F7 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0088', 0, () => {
      const text: string = '÷';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,183');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0089
     * @tc.name testLatin0089
     * @tc.desc Verify U+00F8 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0089', 0, () => {
      const text: string = 'ø';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,184');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0090
     * @tc.name testLatin0090
     * @tc.desc Verify U+00F9 in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0090', 0, () => {
      const text: string = 'ù';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,185');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0091
     * @tc.name testLatin0091
     * @tc.desc Verify U+00FA in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0091', 0, () => {
      const text: string = 'ú';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,186');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0092
     * @tc.name testLatin0092
     * @tc.desc Verify U+00FB in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0092', 0, () => {
      const text: string = 'û';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,187');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0093
     * @tc.name testLatin0093
     * @tc.desc Verify U+00FC in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0093', 0, () => {
      const text: string = 'ü';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,188');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0094
     * @tc.name testLatin0094
     * @tc.desc Verify U+00FD in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0094', 0, () => {
      const text: string = 'ý';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,189');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0095
     * @tc.name testLatin0095
     * @tc.desc Verify U+00FE in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0095', 0, () => {
      const text: string = 'þ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,190');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_LATIN_0096
     * @tc.name testLatin0096
     * @tc.desc Verify U+00FF in Latin-1 weighs 2 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLatin0096', 0, () => {
      const text: string = 'ÿ';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('195,191');
      expect(utf8Length(text)).assertEqual(2);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

  });
}
