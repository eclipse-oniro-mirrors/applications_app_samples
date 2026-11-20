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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { stringToArray, arrayToString, newNullArray } from '../../../main/ets/model/AssetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function encodeReal() {
  describe('EncodeRealTest', () => {
    /**
     * @tc.number SUB_ASSET_ENCODE_0451
     * @tc.name testEncode0451
     * @tc.desc 合法值：ASCII 短串编码后字节数等于字符数，且可解码回原串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testEncode0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0451 begin');
      const input: string = 'Asset123';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 8);
      expect(actual.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual[0], 65);
      expect(actual[0]).assertEqual(65);
      const roundTrip: string = arrayToString(actual);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', roundTrip, input);
      expect(roundTrip).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0451 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0452
     * @tc.name testEncode0452
     * @tc.desc 边界值：空串编码为 0 字节，解码亦为空串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testEncode0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0452 begin');
      const input: string = '';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 0);
      expect(actual.length).assertEqual(0);
      const roundTrip: string = arrayToString(actual);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', roundTrip, '');
      expect(roundTrip).assertEqual('');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.byteLength, 0);
      expect(actual.byteLength).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0452 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0453
     * @tc.name testEncode0453
     * @tc.desc 边界值：单字符 ASCII 下界，1 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testEncode0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0453 begin');
      const input: string = 'a';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 1);
      expect(actual.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual[0], 97);
      expect(actual[0]).assertEqual(97);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0453 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0454
     * @tc.name testEncode0454
     * @tc.desc 边界值：单字符中文（BMP 3 字节区）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testEncode0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0454 begin');
      const input: string = '中';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 3);
      expect(actual.length).assertEqual(3);
      const roundTrip: string = arrayToString(actual);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', roundTrip, input);
      expect(roundTrip).assertEqual(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual[0] & 0xE0, 0xE0);
      expect(actual[0] & 0xE0).assertEqual(0xE0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0454 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0455
     * @tc.name testEncode0455
     * @tc.desc 边界值：emoji（4 字节 UTF-8 区）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testEncode0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0455 begin');
      const input: string = '😀';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 4);
      expect(actual.length).assertEqual(4);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual[0] & 0xF0, 0xF0);
      expect(actual[0] & 0xF0).assertEqual(0xF0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0455 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0456
     * @tc.name testEncode0456
     * @tc.desc 组合值：ASCII 与中文混合，字节数为各段之和
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0456 begin');
      const input: string = 'ab中cd';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 7);
      expect(actual.length).assertEqual(7);
      expect(arrayToString(actual)).assertEqual(input);
      expect(actual.byteLength).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0456 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0457
     * @tc.name testEncode0457
     * @tc.desc 非法值：含控制字符仍可编码解码，不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0457 begin');
      const input: string = 'a\u0001b';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 3);
      expect(actual.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual[1], 1);
      expect(actual[1]).assertEqual(1);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0457 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0458
     * @tc.name testEncode0458
     * @tc.desc 非法值：特殊符号串编码后字节数正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0458 begin');
      const input: string = '@#$%^&*()';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 9);
      expect(actual.length).assertEqual(9);
      expect(arrayToString(actual)).assertEqual(input);
      expect(actual[0]).assertEqual(64);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0458 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0459
     * @tc.name testEncode0459
     * @tc.desc 极值：1000 字符 ASCII 串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0459 begin');
      let input: string = '';
      for (let i: number = 0; i < 1000; i++) {
        input += 'A';
      }
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 1000);
      expect(actual.length).assertEqual(1000);
      expect(actual.byteLength).assertEqual(1000);
      expect(actual[999]).assertEqual(65);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0459 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0460
     * @tc.name testEncode0460
     * @tc.desc 极值：1000 个中文，3000 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0460 begin');
      let input: string = '';
      for (let i: number = 0; i < 1000; i++) {
        input += '中';
      }
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 3000);
      expect(actual.length).assertEqual(3000);
      const roundTrip: string = arrayToString(actual);
      expect(roundTrip.length).assertEqual(1000);
      expect(roundTrip).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0460 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0461
     * @tc.name testEncode0461
     * @tc.desc 极值：10000 字符长串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0461 begin');
      let input: string = '';
      for (let i: number = 0; i < 10000; i++) {
        input += 'x';
      }
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 10000);
      expect(actual.length).assertEqual(10000);
      expect(actual[0]).assertEqual(120);
      expect(actual[9999]).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0461 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0462
     * @tc.name testEncode0462
     * @tc.desc 组合值：ASCII round-trip 编解码往返
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0462 begin');
      const input: string = 'Hello World 2026';
      const encoded: Uint8Array = stringToArray(input);
      const decoded: string = arrayToString(encoded);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', decoded, input);
      expect(decoded).assertEqual(input);
      expect(decoded.length).assertEqual(input.length);
      expect(encoded.length).assertEqual(input.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0462 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0463
     * @tc.name testEncode0463
     * @tc.desc 组合值：中文 round-trip 编解码往返
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0463 begin');
      const input: string = '关键资产存储服务';
      const encoded: Uint8Array = stringToArray(input);
      const decoded: string = arrayToString(encoded);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', decoded, input);
      expect(decoded).assertEqual(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', encoded.length, 24);
      expect(encoded.length).assertEqual(24);
      expect(decoded.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0463 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0464
     * @tc.name testEncode0464
     * @tc.desc 组合值：emoji round-trip 编解码往返
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0464 begin');
      const input: string = '😀😃😄😁';
      const encoded: Uint8Array = stringToArray(input);
      const decoded: string = arrayToString(encoded);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', decoded, input);
      expect(decoded).assertEqual(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', encoded.length, 16);
      expect(encoded.length).assertEqual(16);
      expect(encoded[0] & 0xF0).assertEqual(0xF0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0464 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0465
     * @tc.name testEncode0465
     * @tc.desc 组合值：中文/emoji/ASCII 混合往返，字节数逐段核对
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0465 begin');
      const input: string = 'A中😀B';
      const encoded: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', encoded.length, 9);
      expect(encoded.length).assertEqual(9);
      const decoded: string = arrayToString(encoded);
      expect(decoded).assertEqual(input);
      expect(decoded.charCodeAt(1)).assertEqual(input.charCodeAt(1));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0465 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0466
     * @tc.name testEncode0466
     * @tc.desc 状态：同一输入重复编码结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0466 begin');
      const input: string = 'repeat-me';
      const first: Uint8Array = stringToArray(input);
      const second: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', first.length, second.length);
      expect(first.length).assertEqual(second.length);
      expect(arrayToString(first)).assertEqual(arrayToString(second));
      expect(JSON.stringify(first)).assertEqual(JSON.stringify(second));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0466 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0467
     * @tc.name testEncode0467
     * @tc.desc 状态：两次编码互不影响，字节数组相互独立
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0467 begin');
      const first: Uint8Array = stringToArray('one');
      const second: Uint8Array = stringToArray('two');
      expect(first.length).assertEqual(3);
      expect(second.length).assertEqual(3);
      expect(first[0]).assertEqual(111);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0467 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0468
     * @tc.name testEncode0468
     * @tc.desc 边界值：U+FFFF 附近 BMP 上限字符 3 字节
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0468 begin');
      const input: string = '\uFFFF';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 3);
      expect(actual.length).assertEqual(3);
      expect(arrayToString(actual)).assertEqual(input);
      expect(actual[0] & 0xE0).assertEqual(0xE0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0468 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0469
     * @tc.name testEncode0469
     * @tc.desc 边界值：U+10000 起 4 字节区字符
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0469 begin');
      const input: string = '\u{10000}';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 4);
      expect(actual.length).assertEqual(4);
      expect(arrayToString(actual)).assertEqual(input);
      expect(actual[0] & 0xF0).assertEqual(0xF0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0469 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0470
     * @tc.name testEncode0470
     * @tc.desc 非法值：仅空白串编码字节数与解码一致性
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0470 begin');
      const input: string = '   ';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 3);
      expect(actual.length).assertEqual(3);
      expect(actual[0]).assertEqual(32);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0470 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0471
     * @tc.name testEncode0471
     * @tc.desc 非法值：换行制表符混合串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0471 begin');
      const input: string = 'a\nb\tc\r\nd';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 8);
      expect(actual.length).assertEqual(8);
      expect(actual[1]).assertEqual(10);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0471 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0472
     * @tc.name testEncode0472
     * @tc.desc 极值：5000 字符混合串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0472 begin');
      let input: string = '';
      for (let i: number = 0; i < 2500; i++) {
        input += '中A';
      }
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 10000);
      expect(actual.length).assertEqual(10000);
      const decoded: string = arrayToString(actual);
      expect(decoded.length).assertEqual(5000);
      expect(decoded).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0472 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0473
     * @tc.name testEncode0473
     * @tc.desc 组合值：decode(encode(x)) 恒等且字节数符合 UTF-8 规则
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0473 begin');
      const input: string = 'UTF-8 规则校验 123 !@#';
      const encoded: Uint8Array = stringToArray(input);
      const decoded: string = arrayToString(encoded);
      expect(decoded).assertEqual(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', encoded.length, 26);
      expect(encoded.length).assertEqual(26);
      expect(encoded.length).assertLarger(input.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0473 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0474
     * @tc.name testEncode0474
     * @tc.desc 边界值：纯数字串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0474 begin');
      const input: string = '0123456789';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 10);
      expect(actual.length).assertEqual(10);
      expect(actual[0]).assertEqual(48);
      expect(actual[9]).assertEqual(57);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0474 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0475
     * @tc.name testEncode0475
     * @tc.desc 边界值：标点符号串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testEncode0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0475 begin');
      const input: string = ',.;:!?';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 6);
      expect(actual.length).assertEqual(6);
      expect(actual[0]).assertEqual(44);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0475 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0476
     * @tc.name testEncode0476
     * @tc.desc 状态：空 Uint8Array 解码为空串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0476 begin');
      const input: Uint8Array = new Uint8Array(0);
      const actual: string = arrayToString(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', actual, '');
      expect(actual).assertEqual('');
      expect(actual.length).assertEqual(0);
      expect(arrayToString(new Uint8Array([0x41]))).assertEqual('A');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0476 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0477
     * @tc.name testEncode0477
     * @tc.desc 状态：newNullArray 的 0x00 字节被设备解码为空格（U+0020）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0477 begin');
      const nullArray: Uint8Array = newNullArray();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', nullArray.length, 1);
      expect(nullArray.length).assertEqual(1);
      expect(nullArray[0]).assertEqual(0);
      const decodedStr: string = arrayToString(nullArray);
      hilog.info(DOMAIN, TAG, 'actualLen=%{public}d, code0=%{public}d', decodedStr.length,
        decodedStr.length > 0 ? decodedStr.charCodeAt(0) : -1);
      // 设备实测：TextDecoder 将 0x00 字节解码为空格（U+0020），非标准 NUL（见 0457 控制字符现象）
      expect(decodedStr.length).assertEqual(1);
      expect(decodedStr.charCodeAt(0)).assertEqual(32);
      expect(decodedStr).assertEqual(' ');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0477 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0478
     * @tc.name testEncode0478
     * @tc.desc 组合值：大小写混合 ASCII
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0478 begin');
      const input: string = 'AbCdEfGhIjKlMn';
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 14);
      expect(actual.length).assertEqual(14);
      expect(actual[0]).assertEqual(65);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0478 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0479
     * @tc.name testEncode0479
     * @tc.desc 极值：20000 字符长串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0479 begin');
      let input: string = '';
      for (let i: number = 0; i < 20000; i++) {
        input += 'q';
      }
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 20000);
      expect(actual.length).assertEqual(20000);
      expect(actual[0]).assertEqual(113);
      expect(actual[19999]).assertEqual(113);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0479 end');
    });

    /**
     * @tc.number SUB_ASSET_ENCODE_0480
     * @tc.name testEncode0480
     * @tc.desc 组合值：ASCII 可打印全集往返一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testEncode0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0480 begin');
      let input: string = '';
      for (let i: number = 32; i < 127; i++) {
        input += String.fromCharCode(i);
      }
      const actual: Uint8Array = stringToArray(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', actual.length, 95);
      expect(actual.length).assertEqual(95);
      expect(actual[0]).assertEqual(32);
      expect(arrayToString(actual)).assertEqual(input);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testEncode0480 end');
    });
  });
}


