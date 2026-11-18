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
 * 可打印 ASCII（0x20–0x7E）逐字符网格。
 * 现有用例只抽查了 A / ab / 换行等少数几个值，这里把 95 个可打印码点一个个钉住：
 * 任何一处编码分支退化（比如把单字节字符写成两字节）都会立刻掉在这一层。
 */
export default function distributedUtf8AsciiGridTest() {
  describe('DistributedUtf8AsciiGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0100
     * @tc.name testAscii0001
     * @tc.desc Verify ASCII U+0020 encodes to the single byte 0x20 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0001', 0, () => {
      expect(encodeUtf8(' ').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8(' ')))).assertEqual('32');
      expect(utf8Length(' ')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8(' '))).assertEqual(' ');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0200
     * @tc.name testAscii0002
     * @tc.desc Verify ASCII U+0021 encodes to the single byte 0x21 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0002', 0, () => {
      expect(encodeUtf8('!').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('!')))).assertEqual('33');
      expect(utf8Length('!')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('!'))).assertEqual('!');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0300
     * @tc.name testAscii0003
     * @tc.desc Verify ASCII U+0022 encodes to the single byte 0x22 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0003', 0, () => {
      expect(encodeUtf8('"').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('"')))).assertEqual('34');
      expect(utf8Length('"')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('"'))).assertEqual('"');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0400
     * @tc.name testAscii0004
     * @tc.desc Verify ASCII U+0023 encodes to the single byte 0x23 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0004', 0, () => {
      expect(encodeUtf8('#').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('#')))).assertEqual('35');
      expect(utf8Length('#')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('#'))).assertEqual('#');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0500
     * @tc.name testAscii0005
     * @tc.desc Verify ASCII U+0024 encodes to the single byte 0x24 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0005', 0, () => {
      expect(encodeUtf8('$').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('$')))).assertEqual('36');
      expect(utf8Length('$')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('$'))).assertEqual('$');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0600
     * @tc.name testAscii0006
     * @tc.desc Verify ASCII U+0025 encodes to the single byte 0x25 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0006', 0, () => {
      expect(encodeUtf8('%').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('%')))).assertEqual('37');
      expect(utf8Length('%')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('%'))).assertEqual('%');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0700
     * @tc.name testAscii0007
     * @tc.desc Verify ASCII U+0026 encodes to the single byte 0x26 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0007', 0, () => {
      expect(encodeUtf8('&').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('&')))).assertEqual('38');
      expect(utf8Length('&')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('&'))).assertEqual('&');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0800
     * @tc.name testAscii0008
     * @tc.desc Verify ASCII U+0027 encodes to the single byte 0x27 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0008', 0, () => {
      expect(encodeUtf8('\u0027').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('\u0027')))).assertEqual('39');
      expect(utf8Length('\u0027')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('\u0027'))).assertEqual('\u0027');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_0900
     * @tc.name testAscii0009
     * @tc.desc Verify ASCII U+0028 encodes to the single byte 0x28 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0009', 0, () => {
      expect(encodeUtf8('(').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('(')))).assertEqual('40');
      expect(utf8Length('(')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('('))).assertEqual('(');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1000
     * @tc.name testAscii0010
     * @tc.desc Verify ASCII U+0029 encodes to the single byte 0x29 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0010', 0, () => {
      expect(encodeUtf8(')').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8(')')))).assertEqual('41');
      expect(utf8Length(')')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8(')'))).assertEqual(')');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1100
     * @tc.name testAscii0011
     * @tc.desc Verify ASCII U+002A encodes to the single byte 0x2A and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0011', 0, () => {
      expect(encodeUtf8('*').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('*')))).assertEqual('42');
      expect(utf8Length('*')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('*'))).assertEqual('*');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1200
     * @tc.name testAscii0012
     * @tc.desc Verify ASCII U+002B encodes to the single byte 0x2B and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0012', 0, () => {
      expect(encodeUtf8('+').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('+')))).assertEqual('43');
      expect(utf8Length('+')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('+'))).assertEqual('+');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1300
     * @tc.name testAscii0013
     * @tc.desc Verify ASCII U+002C encodes to the single byte 0x2C and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0013', 0, () => {
      expect(encodeUtf8(',').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8(',')))).assertEqual('44');
      expect(utf8Length(',')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8(','))).assertEqual(',');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1400
     * @tc.name testAscii0014
     * @tc.desc Verify ASCII U+002D encodes to the single byte 0x2D and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0014', 0, () => {
      expect(encodeUtf8('-').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('-')))).assertEqual('45');
      expect(utf8Length('-')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('-'))).assertEqual('-');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1500
     * @tc.name testAscii0015
     * @tc.desc Verify ASCII U+002E encodes to the single byte 0x2E and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0015', 0, () => {
      expect(encodeUtf8('.').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('.')))).assertEqual('46');
      expect(utf8Length('.')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('.'))).assertEqual('.');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1600
     * @tc.name testAscii0016
     * @tc.desc Verify ASCII U+002F encodes to the single byte 0x2F and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0016', 0, () => {
      expect(encodeUtf8('/').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('/')))).assertEqual('47');
      expect(utf8Length('/')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('/'))).assertEqual('/');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1700
     * @tc.name testAscii0017
     * @tc.desc Verify ASCII U+0030 encodes to the single byte 0x30 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0017', 0, () => {
      expect(encodeUtf8('0').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('0')))).assertEqual('48');
      expect(utf8Length('0')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('0'))).assertEqual('0');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1800
     * @tc.name testAscii0018
     * @tc.desc Verify ASCII U+0031 encodes to the single byte 0x31 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0018', 0, () => {
      expect(encodeUtf8('1').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('1')))).assertEqual('49');
      expect(utf8Length('1')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('1'))).assertEqual('1');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_1900
     * @tc.name testAscii0019
     * @tc.desc Verify ASCII U+0032 encodes to the single byte 0x32 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0019', 0, () => {
      expect(encodeUtf8('2').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('2')))).assertEqual('50');
      expect(utf8Length('2')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('2'))).assertEqual('2');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2000
     * @tc.name testAscii0020
     * @tc.desc Verify ASCII U+0033 encodes to the single byte 0x33 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0020', 0, () => {
      expect(encodeUtf8('3').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('3')))).assertEqual('51');
      expect(utf8Length('3')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('3'))).assertEqual('3');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2100
     * @tc.name testAscii0021
     * @tc.desc Verify ASCII U+0034 encodes to the single byte 0x34 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0021', 0, () => {
      expect(encodeUtf8('4').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('4')))).assertEqual('52');
      expect(utf8Length('4')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('4'))).assertEqual('4');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2200
     * @tc.name testAscii0022
     * @tc.desc Verify ASCII U+0035 encodes to the single byte 0x35 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0022', 0, () => {
      expect(encodeUtf8('5').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('5')))).assertEqual('53');
      expect(utf8Length('5')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('5'))).assertEqual('5');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2300
     * @tc.name testAscii0023
     * @tc.desc Verify ASCII U+0036 encodes to the single byte 0x36 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0023', 0, () => {
      expect(encodeUtf8('6').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('6')))).assertEqual('54');
      expect(utf8Length('6')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('6'))).assertEqual('6');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2400
     * @tc.name testAscii0024
     * @tc.desc Verify ASCII U+0037 encodes to the single byte 0x37 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0024', 0, () => {
      expect(encodeUtf8('7').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('7')))).assertEqual('55');
      expect(utf8Length('7')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('7'))).assertEqual('7');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2500
     * @tc.name testAscii0025
     * @tc.desc Verify ASCII U+0038 encodes to the single byte 0x38 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0025', 0, () => {
      expect(encodeUtf8('8').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('8')))).assertEqual('56');
      expect(utf8Length('8')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('8'))).assertEqual('8');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2600
     * @tc.name testAscii0026
     * @tc.desc Verify ASCII U+0039 encodes to the single byte 0x39 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0026', 0, () => {
      expect(encodeUtf8('9').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('9')))).assertEqual('57');
      expect(utf8Length('9')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('9'))).assertEqual('9');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2700
     * @tc.name testAscii0027
     * @tc.desc Verify ASCII U+003A encodes to the single byte 0x3A and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0027', 0, () => {
      expect(encodeUtf8(':').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8(':')))).assertEqual('58');
      expect(utf8Length(':')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8(':'))).assertEqual(':');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2800
     * @tc.name testAscii0028
     * @tc.desc Verify ASCII U+003B encodes to the single byte 0x3B and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0028', 0, () => {
      expect(encodeUtf8(';').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8(';')))).assertEqual('59');
      expect(utf8Length(';')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8(';'))).assertEqual(';');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_2900
     * @tc.name testAscii0029
     * @tc.desc Verify ASCII U+003C encodes to the single byte 0x3C and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0029', 0, () => {
      expect(encodeUtf8('<').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('<')))).assertEqual('60');
      expect(utf8Length('<')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('<'))).assertEqual('<');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3000
     * @tc.name testAscii0030
     * @tc.desc Verify ASCII U+003D encodes to the single byte 0x3D and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0030', 0, () => {
      expect(encodeUtf8('=').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('=')))).assertEqual('61');
      expect(utf8Length('=')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('='))).assertEqual('=');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3100
     * @tc.name testAscii0031
     * @tc.desc Verify ASCII U+003E encodes to the single byte 0x3E and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0031', 0, () => {
      expect(encodeUtf8('>').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('>')))).assertEqual('62');
      expect(utf8Length('>')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('>'))).assertEqual('>');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3200
     * @tc.name testAscii0032
     * @tc.desc Verify ASCII U+003F encodes to the single byte 0x3F and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0032', 0, () => {
      expect(encodeUtf8('?').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('?')))).assertEqual('63');
      expect(utf8Length('?')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('?'))).assertEqual('?');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3300
     * @tc.name testAscii0033
     * @tc.desc Verify ASCII U+0040 encodes to the single byte 0x40 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0033', 0, () => {
      expect(encodeUtf8('@').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('@')))).assertEqual('64');
      expect(utf8Length('@')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('@'))).assertEqual('@');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3400
     * @tc.name testAscii0034
     * @tc.desc Verify ASCII U+0041 encodes to the single byte 0x41 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0034', 0, () => {
      expect(encodeUtf8('A').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('A')))).assertEqual('65');
      expect(utf8Length('A')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('A'))).assertEqual('A');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3500
     * @tc.name testAscii0035
     * @tc.desc Verify ASCII U+0042 encodes to the single byte 0x42 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0035', 0, () => {
      expect(encodeUtf8('B').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('B')))).assertEqual('66');
      expect(utf8Length('B')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('B'))).assertEqual('B');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3600
     * @tc.name testAscii0036
     * @tc.desc Verify ASCII U+0043 encodes to the single byte 0x43 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0036', 0, () => {
      expect(encodeUtf8('C').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('C')))).assertEqual('67');
      expect(utf8Length('C')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('C'))).assertEqual('C');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3700
     * @tc.name testAscii0037
     * @tc.desc Verify ASCII U+0044 encodes to the single byte 0x44 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0037', 0, () => {
      expect(encodeUtf8('D').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('D')))).assertEqual('68');
      expect(utf8Length('D')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('D'))).assertEqual('D');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3800
     * @tc.name testAscii0038
     * @tc.desc Verify ASCII U+0045 encodes to the single byte 0x45 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0038', 0, () => {
      expect(encodeUtf8('E').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('E')))).assertEqual('69');
      expect(utf8Length('E')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('E'))).assertEqual('E');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_3900
     * @tc.name testAscii0039
     * @tc.desc Verify ASCII U+0046 encodes to the single byte 0x46 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0039', 0, () => {
      expect(encodeUtf8('F').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('F')))).assertEqual('70');
      expect(utf8Length('F')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('F'))).assertEqual('F');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4000
     * @tc.name testAscii0040
     * @tc.desc Verify ASCII U+0047 encodes to the single byte 0x47 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0040', 0, () => {
      expect(encodeUtf8('G').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('G')))).assertEqual('71');
      expect(utf8Length('G')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('G'))).assertEqual('G');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4100
     * @tc.name testAscii0041
     * @tc.desc Verify ASCII U+0048 encodes to the single byte 0x48 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0041', 0, () => {
      expect(encodeUtf8('H').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('H')))).assertEqual('72');
      expect(utf8Length('H')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('H'))).assertEqual('H');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4200
     * @tc.name testAscii0042
     * @tc.desc Verify ASCII U+0049 encodes to the single byte 0x49 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0042', 0, () => {
      expect(encodeUtf8('I').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('I')))).assertEqual('73');
      expect(utf8Length('I')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('I'))).assertEqual('I');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4300
     * @tc.name testAscii0043
     * @tc.desc Verify ASCII U+004A encodes to the single byte 0x4A and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0043', 0, () => {
      expect(encodeUtf8('J').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('J')))).assertEqual('74');
      expect(utf8Length('J')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('J'))).assertEqual('J');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4400
     * @tc.name testAscii0044
     * @tc.desc Verify ASCII U+004B encodes to the single byte 0x4B and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0044', 0, () => {
      expect(encodeUtf8('K').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('K')))).assertEqual('75');
      expect(utf8Length('K')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('K'))).assertEqual('K');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4500
     * @tc.name testAscii0045
     * @tc.desc Verify ASCII U+004C encodes to the single byte 0x4C and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0045', 0, () => {
      expect(encodeUtf8('L').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('L')))).assertEqual('76');
      expect(utf8Length('L')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('L'))).assertEqual('L');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4600
     * @tc.name testAscii0046
     * @tc.desc Verify ASCII U+004D encodes to the single byte 0x4D and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0046', 0, () => {
      expect(encodeUtf8('M').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('M')))).assertEqual('77');
      expect(utf8Length('M')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('M'))).assertEqual('M');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4700
     * @tc.name testAscii0047
     * @tc.desc Verify ASCII U+004E encodes to the single byte 0x4E and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0047', 0, () => {
      expect(encodeUtf8('N').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('N')))).assertEqual('78');
      expect(utf8Length('N')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('N'))).assertEqual('N');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4800
     * @tc.name testAscii0048
     * @tc.desc Verify ASCII U+004F encodes to the single byte 0x4F and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0048', 0, () => {
      expect(encodeUtf8('O').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('O')))).assertEqual('79');
      expect(utf8Length('O')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('O'))).assertEqual('O');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_4900
     * @tc.name testAscii0049
     * @tc.desc Verify ASCII U+0050 encodes to the single byte 0x50 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0049', 0, () => {
      expect(encodeUtf8('P').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('P')))).assertEqual('80');
      expect(utf8Length('P')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('P'))).assertEqual('P');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5000
     * @tc.name testAscii0050
     * @tc.desc Verify ASCII U+0051 encodes to the single byte 0x51 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0050', 0, () => {
      expect(encodeUtf8('Q').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('Q')))).assertEqual('81');
      expect(utf8Length('Q')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('Q'))).assertEqual('Q');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5100
     * @tc.name testAscii0051
     * @tc.desc Verify ASCII U+0052 encodes to the single byte 0x52 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0051', 0, () => {
      expect(encodeUtf8('R').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('R')))).assertEqual('82');
      expect(utf8Length('R')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('R'))).assertEqual('R');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5200
     * @tc.name testAscii0052
     * @tc.desc Verify ASCII U+0053 encodes to the single byte 0x53 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0052', 0, () => {
      expect(encodeUtf8('S').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('S')))).assertEqual('83');
      expect(utf8Length('S')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('S'))).assertEqual('S');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5300
     * @tc.name testAscii0053
     * @tc.desc Verify ASCII U+0054 encodes to the single byte 0x54 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0053', 0, () => {
      expect(encodeUtf8('T').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('T')))).assertEqual('84');
      expect(utf8Length('T')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('T'))).assertEqual('T');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5400
     * @tc.name testAscii0054
     * @tc.desc Verify ASCII U+0055 encodes to the single byte 0x55 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0054', 0, () => {
      expect(encodeUtf8('U').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('U')))).assertEqual('85');
      expect(utf8Length('U')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('U'))).assertEqual('U');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5500
     * @tc.name testAscii0055
     * @tc.desc Verify ASCII U+0056 encodes to the single byte 0x56 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0055', 0, () => {
      expect(encodeUtf8('V').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('V')))).assertEqual('86');
      expect(utf8Length('V')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('V'))).assertEqual('V');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5600
     * @tc.name testAscii0056
     * @tc.desc Verify ASCII U+0057 encodes to the single byte 0x57 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0056', 0, () => {
      expect(encodeUtf8('W').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('W')))).assertEqual('87');
      expect(utf8Length('W')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('W'))).assertEqual('W');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5700
     * @tc.name testAscii0057
     * @tc.desc Verify ASCII U+0058 encodes to the single byte 0x58 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0057', 0, () => {
      expect(encodeUtf8('X').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('X')))).assertEqual('88');
      expect(utf8Length('X')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('X'))).assertEqual('X');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5800
     * @tc.name testAscii0058
     * @tc.desc Verify ASCII U+0059 encodes to the single byte 0x59 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0058', 0, () => {
      expect(encodeUtf8('Y').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('Y')))).assertEqual('89');
      expect(utf8Length('Y')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('Y'))).assertEqual('Y');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_5900
     * @tc.name testAscii0059
     * @tc.desc Verify ASCII U+005A encodes to the single byte 0x5A and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0059', 0, () => {
      expect(encodeUtf8('Z').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('Z')))).assertEqual('90');
      expect(utf8Length('Z')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('Z'))).assertEqual('Z');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6000
     * @tc.name testAscii0060
     * @tc.desc Verify ASCII U+005B encodes to the single byte 0x5B and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0060', 0, () => {
      expect(encodeUtf8('[').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('[')))).assertEqual('91');
      expect(utf8Length('[')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('['))).assertEqual('[');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6100
     * @tc.name testAscii0061
     * @tc.desc Verify ASCII U+005C encodes to the single byte 0x5C and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0061', 0, () => {
      expect(encodeUtf8('\\').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('\\')))).assertEqual('92');
      expect(utf8Length('\\')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('\\'))).assertEqual('\\');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6200
     * @tc.name testAscii0062
     * @tc.desc Verify ASCII U+005D encodes to the single byte 0x5D and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0062', 0, () => {
      expect(encodeUtf8(']').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8(']')))).assertEqual('93');
      expect(utf8Length(']')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8(']'))).assertEqual(']');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6300
     * @tc.name testAscii0063
     * @tc.desc Verify ASCII U+005E encodes to the single byte 0x5E and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0063', 0, () => {
      expect(encodeUtf8('^').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('^')))).assertEqual('94');
      expect(utf8Length('^')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('^'))).assertEqual('^');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6400
     * @tc.name testAscii0064
     * @tc.desc Verify ASCII U+005F encodes to the single byte 0x5F and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0064', 0, () => {
      expect(encodeUtf8('_').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('_')))).assertEqual('95');
      expect(utf8Length('_')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('_'))).assertEqual('_');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6500
     * @tc.name testAscii0065
     * @tc.desc Verify ASCII U+0060 encodes to the single byte 0x60 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0065', 0, () => {
      expect(encodeUtf8('`').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('`')))).assertEqual('96');
      expect(utf8Length('`')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('`'))).assertEqual('`');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6600
     * @tc.name testAscii0066
     * @tc.desc Verify ASCII U+0061 encodes to the single byte 0x61 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0066', 0, () => {
      expect(encodeUtf8('a').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('a')))).assertEqual('97');
      expect(utf8Length('a')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('a'))).assertEqual('a');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6700
     * @tc.name testAscii0067
     * @tc.desc Verify ASCII U+0062 encodes to the single byte 0x62 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0067', 0, () => {
      expect(encodeUtf8('b').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('b')))).assertEqual('98');
      expect(utf8Length('b')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('b'))).assertEqual('b');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6800
     * @tc.name testAscii0068
     * @tc.desc Verify ASCII U+0063 encodes to the single byte 0x63 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0068', 0, () => {
      expect(encodeUtf8('c').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('c')))).assertEqual('99');
      expect(utf8Length('c')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('c'))).assertEqual('c');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_6900
     * @tc.name testAscii0069
     * @tc.desc Verify ASCII U+0064 encodes to the single byte 0x64 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0069', 0, () => {
      expect(encodeUtf8('d').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('d')))).assertEqual('100');
      expect(utf8Length('d')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('d'))).assertEqual('d');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7000
     * @tc.name testAscii0070
     * @tc.desc Verify ASCII U+0065 encodes to the single byte 0x65 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0070', 0, () => {
      expect(encodeUtf8('e').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('e')))).assertEqual('101');
      expect(utf8Length('e')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('e'))).assertEqual('e');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7100
     * @tc.name testAscii0071
     * @tc.desc Verify ASCII U+0066 encodes to the single byte 0x66 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0071', 0, () => {
      expect(encodeUtf8('f').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('f')))).assertEqual('102');
      expect(utf8Length('f')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('f'))).assertEqual('f');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7200
     * @tc.name testAscii0072
     * @tc.desc Verify ASCII U+0067 encodes to the single byte 0x67 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0072', 0, () => {
      expect(encodeUtf8('g').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('g')))).assertEqual('103');
      expect(utf8Length('g')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('g'))).assertEqual('g');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7300
     * @tc.name testAscii0073
     * @tc.desc Verify ASCII U+0068 encodes to the single byte 0x68 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0073', 0, () => {
      expect(encodeUtf8('h').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('h')))).assertEqual('104');
      expect(utf8Length('h')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('h'))).assertEqual('h');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7400
     * @tc.name testAscii0074
     * @tc.desc Verify ASCII U+0069 encodes to the single byte 0x69 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0074', 0, () => {
      expect(encodeUtf8('i').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('i')))).assertEqual('105');
      expect(utf8Length('i')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('i'))).assertEqual('i');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7500
     * @tc.name testAscii0075
     * @tc.desc Verify ASCII U+006A encodes to the single byte 0x6A and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0075', 0, () => {
      expect(encodeUtf8('j').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('j')))).assertEqual('106');
      expect(utf8Length('j')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('j'))).assertEqual('j');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7600
     * @tc.name testAscii0076
     * @tc.desc Verify ASCII U+006B encodes to the single byte 0x6B and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0076', 0, () => {
      expect(encodeUtf8('k').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('k')))).assertEqual('107');
      expect(utf8Length('k')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('k'))).assertEqual('k');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7700
     * @tc.name testAscii0077
     * @tc.desc Verify ASCII U+006C encodes to the single byte 0x6C and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0077', 0, () => {
      expect(encodeUtf8('l').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('l')))).assertEqual('108');
      expect(utf8Length('l')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('l'))).assertEqual('l');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7800
     * @tc.name testAscii0078
     * @tc.desc Verify ASCII U+006D encodes to the single byte 0x6D and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0078', 0, () => {
      expect(encodeUtf8('m').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('m')))).assertEqual('109');
      expect(utf8Length('m')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('m'))).assertEqual('m');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_7900
     * @tc.name testAscii0079
     * @tc.desc Verify ASCII U+006E encodes to the single byte 0x6E and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0079', 0, () => {
      expect(encodeUtf8('n').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('n')))).assertEqual('110');
      expect(utf8Length('n')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('n'))).assertEqual('n');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8000
     * @tc.name testAscii0080
     * @tc.desc Verify ASCII U+006F encodes to the single byte 0x6F and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0080', 0, () => {
      expect(encodeUtf8('o').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('o')))).assertEqual('111');
      expect(utf8Length('o')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('o'))).assertEqual('o');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8100
     * @tc.name testAscii0081
     * @tc.desc Verify ASCII U+0070 encodes to the single byte 0x70 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0081', 0, () => {
      expect(encodeUtf8('p').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('p')))).assertEqual('112');
      expect(utf8Length('p')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('p'))).assertEqual('p');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8200
     * @tc.name testAscii0082
     * @tc.desc Verify ASCII U+0071 encodes to the single byte 0x71 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0082', 0, () => {
      expect(encodeUtf8('q').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('q')))).assertEqual('113');
      expect(utf8Length('q')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('q'))).assertEqual('q');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8300
     * @tc.name testAscii0083
     * @tc.desc Verify ASCII U+0072 encodes to the single byte 0x72 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0083', 0, () => {
      expect(encodeUtf8('r').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('r')))).assertEqual('114');
      expect(utf8Length('r')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('r'))).assertEqual('r');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8400
     * @tc.name testAscii0084
     * @tc.desc Verify ASCII U+0073 encodes to the single byte 0x73 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0084', 0, () => {
      expect(encodeUtf8('s').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('s')))).assertEqual('115');
      expect(utf8Length('s')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('s'))).assertEqual('s');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8500
     * @tc.name testAscii0085
     * @tc.desc Verify ASCII U+0074 encodes to the single byte 0x74 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0085', 0, () => {
      expect(encodeUtf8('t').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('t')))).assertEqual('116');
      expect(utf8Length('t')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('t'))).assertEqual('t');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8600
     * @tc.name testAscii0086
     * @tc.desc Verify ASCII U+0075 encodes to the single byte 0x75 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0086', 0, () => {
      expect(encodeUtf8('u').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('u')))).assertEqual('117');
      expect(utf8Length('u')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('u'))).assertEqual('u');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8700
     * @tc.name testAscii0087
     * @tc.desc Verify ASCII U+0076 encodes to the single byte 0x76 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0087', 0, () => {
      expect(encodeUtf8('v').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('v')))).assertEqual('118');
      expect(utf8Length('v')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('v'))).assertEqual('v');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8800
     * @tc.name testAscii0088
     * @tc.desc Verify ASCII U+0077 encodes to the single byte 0x77 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0088', 0, () => {
      expect(encodeUtf8('w').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('w')))).assertEqual('119');
      expect(utf8Length('w')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('w'))).assertEqual('w');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_8900
     * @tc.name testAscii0089
     * @tc.desc Verify ASCII U+0078 encodes to the single byte 0x78 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0089', 0, () => {
      expect(encodeUtf8('x').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('x')))).assertEqual('120');
      expect(utf8Length('x')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('x'))).assertEqual('x');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_9000
     * @tc.name testAscii0090
     * @tc.desc Verify ASCII U+0079 encodes to the single byte 0x79 and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0090', 0, () => {
      expect(encodeUtf8('y').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('y')))).assertEqual('121');
      expect(utf8Length('y')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('y'))).assertEqual('y');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_9100
     * @tc.name testAscii0091
     * @tc.desc Verify ASCII U+007A encodes to the single byte 0x7A and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0091', 0, () => {
      expect(encodeUtf8('z').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('z')))).assertEqual('122');
      expect(utf8Length('z')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('z'))).assertEqual('z');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_9200
     * @tc.name testAscii0092
     * @tc.desc Verify ASCII U+007B encodes to the single byte 0x7B and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0092', 0, () => {
      expect(encodeUtf8('\u007B').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('\u007B')))).assertEqual('123');
      expect(utf8Length('\u007B')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('\u007B'))).assertEqual('\u007B');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_9300
     * @tc.name testAscii0093
     * @tc.desc Verify ASCII U+007C encodes to the single byte 0x7C and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0093', 0, () => {
      expect(encodeUtf8('|').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('|')))).assertEqual('124');
      expect(utf8Length('|')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('|'))).assertEqual('|');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_9400
     * @tc.name testAscii0094
     * @tc.desc Verify ASCII U+007D encodes to the single byte 0x7D and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0094', 0, () => {
      expect(encodeUtf8('\u007D').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('\u007D')))).assertEqual('125');
      expect(utf8Length('\u007D')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('\u007D'))).assertEqual('\u007D');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_ASCII_9500
     * @tc.name testAscii0095
     * @tc.desc Verify ASCII U+007E encodes to the single byte 0x7E and round trips.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testAscii0095', 0, () => {
      expect(encodeUtf8('~').byteLength).assertEqual(1);
      expect(bytesText(bytesOf(encodeUtf8('~')))).assertEqual('126');
      expect(utf8Length('~')).assertEqual(1);
      expect(decodeUtf8(encodeUtf8('~'))).assertEqual('~');
    });

  });
}
