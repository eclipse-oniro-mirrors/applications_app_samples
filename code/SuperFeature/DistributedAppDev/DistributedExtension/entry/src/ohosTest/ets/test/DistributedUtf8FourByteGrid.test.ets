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
 * 四字节区（U+10000–U+10FFFF）按步长 16384 抽样：覆盖代理对拼接与 0xF0–0xF4 首字节。
 * emoji 与生僻符号都走这条分支，代理对算错时页面看到的是乱码而不是报错，只能靠逐字节断言拦住。
 */
export default function distributedUtf8FourByteGridTest() {
  describe('DistributedUtf8FourByteGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0001
     * @tc.name testFourByte0001
     * @tc.desc Verify U+10000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0001', 0, () => {
      const text: string = '𐀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,144,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0002
     * @tc.name testFourByte0002
     * @tc.desc Verify U+14000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0002', 0, () => {
      const text: string = '𔀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,148,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0003
     * @tc.name testFourByte0003
     * @tc.desc Verify U+18000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0003', 0, () => {
      const text: string = '𘀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,152,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0004
     * @tc.name testFourByte0004
     * @tc.desc Verify U+1C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0004', 0, () => {
      const text: string = '𜀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,156,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0005
     * @tc.name testFourByte0005
     * @tc.desc Verify U+20000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0005', 0, () => {
      const text: string = '𠀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,160,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0006
     * @tc.name testFourByte0006
     * @tc.desc Verify U+24000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0006', 0, () => {
      const text: string = '𤀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,164,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0007
     * @tc.name testFourByte0007
     * @tc.desc Verify U+28000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0007', 0, () => {
      const text: string = '𨀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,168,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0008
     * @tc.name testFourByte0008
     * @tc.desc Verify U+2C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0008', 0, () => {
      const text: string = '𬀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,172,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0009
     * @tc.name testFourByte0009
     * @tc.desc Verify U+30000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0009', 0, () => {
      const text: string = '𰀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,176,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0010
     * @tc.name testFourByte0010
     * @tc.desc Verify U+34000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0010', 0, () => {
      const text: string = '𴀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,180,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0011
     * @tc.name testFourByte0011
     * @tc.desc Verify U+38000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0011', 0, () => {
      const text: string = '𸀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,184,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0012
     * @tc.name testFourByte0012
     * @tc.desc Verify U+3C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0012', 0, () => {
      const text: string = '𼀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('240,188,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0013
     * @tc.name testFourByte0013
     * @tc.desc Verify U+40000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0013', 0, () => {
      const text: string = '񀀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,128,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0014
     * @tc.name testFourByte0014
     * @tc.desc Verify U+44000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0014', 0, () => {
      const text: string = '񄀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,132,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0015
     * @tc.name testFourByte0015
     * @tc.desc Verify U+48000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0015', 0, () => {
      const text: string = '񈀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,136,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0016
     * @tc.name testFourByte0016
     * @tc.desc Verify U+4C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0016', 0, () => {
      const text: string = '񌀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,140,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0017
     * @tc.name testFourByte0017
     * @tc.desc Verify U+50000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0017', 0, () => {
      const text: string = '񐀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,144,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0018
     * @tc.name testFourByte0018
     * @tc.desc Verify U+54000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0018', 0, () => {
      const text: string = '񔀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,148,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0019
     * @tc.name testFourByte0019
     * @tc.desc Verify U+58000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0019', 0, () => {
      const text: string = '񘀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,152,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0020
     * @tc.name testFourByte0020
     * @tc.desc Verify U+5C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0020', 0, () => {
      const text: string = '񜀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,156,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0021
     * @tc.name testFourByte0021
     * @tc.desc Verify U+60000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0021', 0, () => {
      const text: string = '񠀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,160,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0022
     * @tc.name testFourByte0022
     * @tc.desc Verify U+64000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0022', 0, () => {
      const text: string = '񤀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,164,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0023
     * @tc.name testFourByte0023
     * @tc.desc Verify U+68000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0023', 0, () => {
      const text: string = '񨀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,168,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0024
     * @tc.name testFourByte0024
     * @tc.desc Verify U+6C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0024', 0, () => {
      const text: string = '񬀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,172,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0025
     * @tc.name testFourByte0025
     * @tc.desc Verify U+70000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0025', 0, () => {
      const text: string = '񰀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,176,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0026
     * @tc.name testFourByte0026
     * @tc.desc Verify U+74000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0026', 0, () => {
      const text: string = '񴀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,180,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0027
     * @tc.name testFourByte0027
     * @tc.desc Verify U+78000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0027', 0, () => {
      const text: string = '񸀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,184,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0028
     * @tc.name testFourByte0028
     * @tc.desc Verify U+7C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0028', 0, () => {
      const text: string = '񼀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('241,188,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0029
     * @tc.name testFourByte0029
     * @tc.desc Verify U+80000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0029', 0, () => {
      const text: string = '򀀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,128,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0030
     * @tc.name testFourByte0030
     * @tc.desc Verify U+84000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0030', 0, () => {
      const text: string = '򄀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,132,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0031
     * @tc.name testFourByte0031
     * @tc.desc Verify U+88000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0031', 0, () => {
      const text: string = '򈀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,136,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0032
     * @tc.name testFourByte0032
     * @tc.desc Verify U+8C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0032', 0, () => {
      const text: string = '򌀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,140,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0033
     * @tc.name testFourByte0033
     * @tc.desc Verify U+90000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0033', 0, () => {
      const text: string = '򐀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,144,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0034
     * @tc.name testFourByte0034
     * @tc.desc Verify U+94000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0034', 0, () => {
      const text: string = '򔀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,148,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0035
     * @tc.name testFourByte0035
     * @tc.desc Verify U+98000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0035', 0, () => {
      const text: string = '򘀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,152,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0036
     * @tc.name testFourByte0036
     * @tc.desc Verify U+9C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0036', 0, () => {
      const text: string = '򜀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,156,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0037
     * @tc.name testFourByte0037
     * @tc.desc Verify U+A0000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0037', 0, () => {
      const text: string = '򠀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,160,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0038
     * @tc.name testFourByte0038
     * @tc.desc Verify U+A4000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0038', 0, () => {
      const text: string = '򤀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,164,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0039
     * @tc.name testFourByte0039
     * @tc.desc Verify U+A8000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0039', 0, () => {
      const text: string = '򨀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,168,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0040
     * @tc.name testFourByte0040
     * @tc.desc Verify U+AC000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0040', 0, () => {
      const text: string = '򬀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,172,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0041
     * @tc.name testFourByte0041
     * @tc.desc Verify U+B0000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0041', 0, () => {
      const text: string = '򰀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,176,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0042
     * @tc.name testFourByte0042
     * @tc.desc Verify U+B4000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0042', 0, () => {
      const text: string = '򴀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,180,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0043
     * @tc.name testFourByte0043
     * @tc.desc Verify U+B8000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0043', 0, () => {
      const text: string = '򸀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,184,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0044
     * @tc.name testFourByte0044
     * @tc.desc Verify U+BC000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0044', 0, () => {
      const text: string = '򼀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('242,188,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0045
     * @tc.name testFourByte0045
     * @tc.desc Verify U+C0000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0045', 0, () => {
      const text: string = '󀀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,128,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0046
     * @tc.name testFourByte0046
     * @tc.desc Verify U+C4000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0046', 0, () => {
      const text: string = '󄀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,132,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0047
     * @tc.name testFourByte0047
     * @tc.desc Verify U+C8000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0047', 0, () => {
      const text: string = '󈀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,136,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0048
     * @tc.name testFourByte0048
     * @tc.desc Verify U+CC000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0048', 0, () => {
      const text: string = '󌀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,140,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0049
     * @tc.name testFourByte0049
     * @tc.desc Verify U+D0000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0049', 0, () => {
      const text: string = '󐀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,144,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0050
     * @tc.name testFourByte0050
     * @tc.desc Verify U+D4000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0050', 0, () => {
      const text: string = '󔀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,148,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0051
     * @tc.name testFourByte0051
     * @tc.desc Verify U+D8000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0051', 0, () => {
      const text: string = '󘀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,152,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0052
     * @tc.name testFourByte0052
     * @tc.desc Verify U+DC000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0052', 0, () => {
      const text: string = '󜀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,156,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0053
     * @tc.name testFourByte0053
     * @tc.desc Verify U+E0000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0053', 0, () => {
      const text: string = '󠀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,160,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0054
     * @tc.name testFourByte0054
     * @tc.desc Verify U+E4000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0054', 0, () => {
      const text: string = '󤀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,164,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0055
     * @tc.name testFourByte0055
     * @tc.desc Verify U+E8000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0055', 0, () => {
      const text: string = '󨀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,168,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0056
     * @tc.name testFourByte0056
     * @tc.desc Verify U+EC000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0056', 0, () => {
      const text: string = '󬀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,172,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0057
     * @tc.name testFourByte0057
     * @tc.desc Verify U+F0000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0057', 0, () => {
      const text: string = '󰀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,176,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0058
     * @tc.name testFourByte0058
     * @tc.desc Verify U+F4000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0058', 0, () => {
      const text: string = '󴀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,180,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0059
     * @tc.name testFourByte0059
     * @tc.desc Verify U+F8000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0059', 0, () => {
      const text: string = '󸀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,184,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0060
     * @tc.name testFourByte0060
     * @tc.desc Verify U+FC000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0060', 0, () => {
      const text: string = '󼀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('243,188,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0061
     * @tc.name testFourByte0061
     * @tc.desc Verify U+100000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0061', 0, () => {
      const text: string = '􀀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('244,128,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0062
     * @tc.name testFourByte0062
     * @tc.desc Verify U+104000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0062', 0, () => {
      const text: string = '􄀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('244,132,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0063
     * @tc.name testFourByte0063
     * @tc.desc Verify U+108000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0063', 0, () => {
      const text: string = '􈀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('244,136,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_FOURBYTE_0064
     * @tc.name testFourByte0064
     * @tc.desc Verify U+10C000 in astral planes weighs 4 bytes and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFourByte0064', 0, () => {
      const text: string = '􌀀';
      expect(bytesText(bytesOf(encodeUtf8(text)))).assertEqual('244,140,128,128');
      expect(utf8Length(text)).assertEqual(4);
      expect(decodeUtf8(encodeUtf8(text))).assertEqual(text);
    });

  });
}
