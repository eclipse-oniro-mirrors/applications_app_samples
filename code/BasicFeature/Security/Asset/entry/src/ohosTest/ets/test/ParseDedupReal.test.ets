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
import { removeDuplicateAndSort } from '../../../main/ets/model/AssetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function parseDedupReal() {
  describe('ParseDedupRealTest', () => {
    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0451
     * @tc.name testParseDedup0451
     * @tc.desc 合法值：乱序字母数组去重排序后按字典序返回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseDedup0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0451 begin');
      const input: string[] = ['c', 'a', 'b'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a,b,c');
      expect(result.join(',')).assertEqual('a,b,c');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0451 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0452
     * @tc.name testParseDedup0452
     * @tc.desc 合法值：重复元素去重后仅保留一次
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseDedup0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0452 begin');
      const input: string[] = ['x', 'x', 'x', 'y'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'x,y');
      expect(result.join(',')).assertEqual('x,y');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0452 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0453
     * @tc.name testParseDedup0453
     * @tc.desc 边界值：空数组返回空数组
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseDedup0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0453 begin');
      const input: string[] = [];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      expect(result.join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0453 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0454
     * @tc.name testParseDedup0454
     * @tc.desc 边界值：全空串数组过滤后为空数组
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseDedup0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0454 begin');
      const input: string[] = ['', '', ''];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result.join(',')).assertEqual('');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0454 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0455
     * @tc.name testParseDedup0455
     * @tc.desc 边界值：单元素数组返回同值单元素数组
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseDedup0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0455 begin');
      const input: string[] = ['solo'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0], 'solo');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('solo');
      expect(result.join(',')).assertEqual('solo');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0455 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0456
     * @tc.name testParseDedup0456
     * @tc.desc 合法值：数字字符串按字典序而非数值序排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0456 begin');
      const input: string[] = ['10', '2', '1'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), '1,10,2');
      expect(result.join(',')).assertEqual('1,10,2');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0456 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0457
     * @tc.name testParseDedup0457
     * @tc.desc 组合值：中英混合数组按 UTF-16 码点字典序排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0457 begin');
      const input: string[] = ['zh', '中', 'EN'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'EN,zh,中');
      expect(result.join(',')).assertEqual('EN,zh,中');
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual('中');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0457 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0458
     * @tc.name testParseDedup0458
     * @tc.desc 组合值：大小写混合按字典序排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0458 begin');
      const input: string[] = ['Ab', 'aB', 'ab'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'Ab,aB,ab');
      expect(result.join(',')).assertEqual('Ab,aB,ab');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('Ab');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0458 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0459
     * @tc.name testParseDedup0459
     * @tc.desc 极值：100 元素全不同数组排序后首尾正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0459 begin');
      const input: string[] = new Array<string>();
      for (let i: number = 0; i < 100; i++) {
        input.push('e' + String(99 - i));
      }
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 100);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual('e0');
      expect(result[99]).assertEqual('e99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0459 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0460
     * @tc.name testParseDedup0460
     * @tc.desc 极值：1000 字符长串去重排序后完整保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0460 begin');
      let longStr: string = '';
      for (let i: number = 0; i < 1000; i++) {
        longStr += 'L';
      }
      const input: string[] = [longStr, longStr];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0].length).assertEqual(1000);
      expect(result[0]).assertEqual(longStr);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0460 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0461
     * @tc.name testParseDedup0461
     * @tc.desc 状态值：原数组不被排序修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0461 begin');
      const input: string[] = ['z', 'a', 'm'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', input.join(','), 'z,a,m');
      expect(input.join(',')).assertEqual('z,a,m');
      expect(result.join(',')).assertEqual('a,m,z');
      expect(input.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0461 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0462
     * @tc.name testParseDedup0462
     * @tc.desc 状态值：连续两次调用同一输入结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0462 begin');
      const input: string[] = ['b', 'a', 'b', 'c'];
      const first: string[] = removeDuplicateAndSort(input);
      const second: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', first.join(','), 'a,b,c');
      expect(first.join(',')).assertEqual('a,b,c');
      expect(second.join(',')).assertEqual(first.join(','));
      expect(first.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0462 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0463
     * @tc.name testParseDedup0463
     * @tc.desc 合法值：符号串数组去重排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0463 begin');
      const input: string[] = ['@', '#', '!'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), '!,#,@');
      expect(result.join(',')).assertEqual('!,#,@');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('!');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0463 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0464
     * @tc.name testParseDedup0464
     * @tc.desc 组合值：emoji 标签数组去重排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0464 begin');
      const input: string[] = ['😀', '🎉', '😀'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('🎉');
      expect(result[1]).assertEqual('😀');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0464 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0465
     * @tc.name testParseDedup0465
     * @tc.desc 边界值：重复与空串混合输入后仅保留非空去重结果
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0465 begin');
      const input: string[] = ['a', '', 'a', '', 'b'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a,b');
      expect(result.join(',')).assertEqual('a,b');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0465 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0466
     * @tc.name testParseDedup0466
     * @tc.desc 非法值：含控制字符的标签仍参与去重排序不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0466 begin');
      const input: string[] = ['a\u0000b', 'a\u0000b', 'c'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('a\u0000b');
      expect(result[1]).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0466 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0467
     * @tc.name testParseDedup0467
     * @tc.desc 组合值：数字与字母混合按字典序排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0467 begin');
      const input: string[] = ['a2', 'a10', 'a1'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a1,a10,a2');
      expect(result.join(',')).assertEqual('a1,a10,a2');
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual('a2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0467 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0468
     * @tc.name testParseDedup0468
     * @tc.desc 边界值：两元素完全相同时去重后仅剩一个
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0468 begin');
      const input: string[] = ['dup', 'dup'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('dup');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0468 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0469
     * @tc.name testParseDedup0469
     * @tc.desc 合法值：已排序输入保持不变
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0469 begin');
      const input: string[] = ['a', 'b', 'c'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a,b,c');
      expect(result.join(',')).assertEqual('a,b,c');
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0469 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0470
     * @tc.name testParseDedup0470
     * @tc.desc 合法值：逆序输入排序后转正序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0470 begin');
      const input: string[] = ['z', 'y', 'x', 'w'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'w,x,y,z');
      expect(result.join(',')).assertEqual('w,x,y,z');
      expect(result.length).assertEqual(4);
      expect(result[0]).assertEqual('w');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0470 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0471
     * @tc.name testParseDedup0471
     * @tc.desc 组合值：中文与数字混合排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0471 begin');
      const input: string[] = ['9', '八', '7'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), '7,9,八');
      expect(result.join(',')).assertEqual('7,9,八');
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual('八');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0471 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0472
     * @tc.name testParseDedup0472
     * @tc.desc 状态值：处理前后输入数组长度不变
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0472 begin');
      const input: string[] = ['a', 'a', 'b', 'b'];
      removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', input.length, 4);
      expect(input.length).assertEqual(4);
      expect(input[0]).assertEqual('a');
      expect(input[3]).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0472 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0473
     * @tc.name testParseDedup0473
     * @tc.desc 边界值：中间位置空串被过滤后剩余元素排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0473 begin');
      const input: string[] = ['b', '', 'a'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a,b');
      expect(result.join(',')).assertEqual('a,b');
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0473 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0474
     * @tc.name testParseDedup0474
     * @tc.desc 合法值：多组重复元素各自去重
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0474 begin');
      const input: string[] = ['a', 'a', 'b', 'b', 'c', 'c'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a,b,c');
      expect(result.join(',')).assertEqual('a,b,c');
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual('c');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0474 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0475
     * @tc.name testParseDedup0475
     * @tc.desc 极值：500 元素全不同数组排序后首尾正确（字典序）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0475 begin');
      const input: string[] = new Array<string>();
      for (let i: number = 0; i < 500; i++) {
        input.push('n' + String(499 - i));
      }
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 500);
      expect(result.length).assertEqual(500);
      expect(result[0]).assertEqual('n0');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[499], 'n99');
      expect(result[499]).assertEqual('n99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0475 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0476
     * @tc.name testParseDedup0476
     * @tc.desc 组合值：前缀关系字符串按字典序排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0476 begin');
      const input: string[] = ['ab', 'abc', 'a'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a,ab,abc');
      expect(result.join(',')).assertEqual('a,ab,abc');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0476 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0477
     * @tc.name testParseDedup0477
     * @tc.desc 状态值：返回值是 Array 实例
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0477 begin');
      const input: string[] = ['x', 'y'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'isArray=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('x');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0477 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0478
     * @tc.name testParseDedup0478
     * @tc.desc 组合值：空串与重复元素混合输入结果正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0478 begin');
      const input: string[] = ['', 'k', '', 'k', 'j'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'j,k');
      expect(result.join(',')).assertEqual('j,k');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('j');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0478 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0479
     * @tc.name testParseDedup0479
     * @tc.desc 边界值：0 与 00 按字典序排序且不去重
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0479 begin');
      const input: string[] = ['00', '0'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), '0,00');
      expect(result.join(',')).assertEqual('0,00');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('0');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0479 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSEDEDUP_0480
     * @tc.name testParseDedup0480
     * @tc.desc 状态值：返回值与输入数组不是同一引用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseDedup0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0480 begin');
      const input: string[] = ['a', 'b'];
      const result: string[] = removeDuplicateAndSort(input);
      hilog.info(DOMAIN, TAG, 'sameRef=%{public}s', String(result === input));
      expect(result === input).assertFalse();
      expect(result.length).assertEqual(2);
      expect(result.join(',')).assertEqual('a,b');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseDedup0480 end');
    });
  });
}


