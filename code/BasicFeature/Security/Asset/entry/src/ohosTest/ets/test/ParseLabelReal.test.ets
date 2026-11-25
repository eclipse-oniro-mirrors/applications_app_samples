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
import { asset } from '@kit.AssetStoreKit';
import { getLabelList, stringToArray } from '../../../main/ets/model/AssetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

function makeLabelMap(labels: string[]): asset.AssetMap {
  const m: asset.AssetMap = new Map();
  const tags: asset.Tag[] = [
    asset.Tag.DATA_LABEL_NORMAL_1,
    asset.Tag.DATA_LABEL_NORMAL_2,
    asset.Tag.DATA_LABEL_NORMAL_3,
    asset.Tag.DATA_LABEL_NORMAL_4
  ];
  for (let i: number = 0; i < labels.length; i++) {
    m.set(tags[i], stringToArray(labels[i]));
  }
  return m;
}

export default function parseLabelReal() {
  describe('ParseLabelRealTest', () => {
    /**
     * @tc.number SUB_ASSET_PARSELBL_0301
     * @tc.name testParseLabel0301
     * @tc.desc 合法值：单标签 Map 解析返回单元素数组
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseLabel0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0301 begin');
      const input: asset.AssetMap = makeLabelMap(['L1']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('L1');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0301 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0302
     * @tc.name testParseLabel0302
     * @tc.desc 合法值：双标签 Map 解析按 NORMAL 顺序返回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseLabel0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0302 begin');
      const input: asset.AssetMap = makeLabelMap(['A2', 'B2']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'A2,B2');
      expect(result.join(',')).assertEqual('A2,B2');
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual('B2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0302 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0303
     * @tc.name testParseLabel0303
     * @tc.desc 合法值：三标签 Map 解析按序返回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseLabel0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0303 begin');
      const input: asset.AssetMap = makeLabelMap(['X3', 'Y3', 'Z3']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'X3,Y3,Z3');
      expect(result.join(',')).assertEqual('X3,Y3,Z3');
      expect(result.length).assertEqual(3);
      expect(result[2]).assertEqual('Z3');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0303 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0304
     * @tc.name testParseLabel0304
     * @tc.desc 边界值：四标签上界 Map 解析全部按序返回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testParseLabel0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0304 begin');
      const input: asset.AssetMap = makeLabelMap(['a4', 'b4', 'c4', 'd4']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'a4,b4,c4,d4');
      expect(result.join(',')).assertEqual('a4,b4,c4,d4');
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual('d4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0304 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0305
     * @tc.name testParseLabel0305
     * @tc.desc 边界值：空 Map 解析返回空数组
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0305 begin');
      const input: asset.AssetMap = new Map();
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      expect(result.join(',')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0305 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0306
     * @tc.name testParseLabel0306
     * @tc.desc 边界值：仅含 ALIAS 与 SECRET 的 Map 解析返回空数组
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0306 begin');
      const input: asset.AssetMap = new Map();
      input.set(asset.Tag.ALIAS, stringToArray('alias0306'));
      input.set(asset.Tag.SECRET, stringToArray('pwd0306'));
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result.join(',')).assertEqual('');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0306 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0307
     * @tc.name testParseLabel0307
     * @tc.desc 边界值：仅 NORMAL_2 存在时只返回该标签
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0307 begin');
      const input: asset.AssetMap = new Map();
      input.set(asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Only2'));
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'Only2');
      expect(result.join(',')).assertEqual('Only2');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('Only2');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0307 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0308
     * @tc.name testParseLabel0308
     * @tc.desc 组合值：中文标签经 UTF-8 编码解码后回读一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0308 begin');
      const input: asset.AssetMap = makeLabelMap(['中文标签']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0], '中文标签');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('中文标签');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0308 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0309
     * @tc.name testParseLabel0309
     * @tc.desc 组合值：emoji 标签解码后回读一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0309 begin');
      const input: asset.AssetMap = makeLabelMap(['😀', '🎉']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), '😀,🎉');
      expect(result.join(',')).assertEqual('😀,🎉');
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('😀');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0309 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0310
     * @tc.name testParseLabel0310
     * @tc.desc 状态值：解析后输入 Map 键数量不变
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0310 begin');
      const input: asset.AssetMap = makeLabelMap(['L10a', 'L10b']);
      const before: number = input.size;
      getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', input.size, before);
      expect(input.size).assertEqual(before);
      expect(input.has(asset.Tag.DATA_LABEL_NORMAL_1)).assertTrue();
      expect(input.has(asset.Tag.DATA_LABEL_NORMAL_2)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0310 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0311
     * @tc.name testParseLabel0311
     * @tc.desc 边界值：空字节数组标签解码为空串元素
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0311 begin');
      const input: asset.AssetMap = new Map();
      input.set(asset.Tag.DATA_LABEL_NORMAL_1, new Uint8Array([]));
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0311 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0312
     * @tc.name testParseLabel0312
     * @tc.desc 状态值：连续两次解析同一输入结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0312 begin');
      const input: asset.AssetMap = makeLabelMap(['A12', 'B12']);
      const first: string[] = getLabelList(input);
      const second: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', first.join(','), 'A12,B12');
      expect(first.join(',')).assertEqual('A12,B12');
      expect(second.join(',')).assertEqual(first.join(','));
      expect(first.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0312 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0313
     * @tc.name testParseLabel0313
     * @tc.desc 组合值：中文、数字、符号混合标签解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0313 begin');
      const input: asset.AssetMap = makeLabelMap(['标签13', '123', '@#$']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), '标签13,123,@#$');
      expect(result.join(',')).assertEqual('标签13,123,@#$');
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual('标签13');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0313 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0314
     * @tc.name testParseLabel0314
     * @tc.desc 极值：500 字符长标签解析后完整回读
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0314 begin');
      let longLabel: string = '';
      for (let i: number = 0; i < 500; i++) {
        longLabel += 'L';
      }
      const input: asset.AssetMap = makeLabelMap([longLabel]);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'labelLen=%{public}d, expected=%{public}d', result[0].length, 500);
      expect(result.length).assertEqual(1);
      expect(result[0].length).assertEqual(500);
      expect(result[0]).assertEqual(longLabel);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0314 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0315
     * @tc.name testParseLabel0315
     * @tc.desc 状态值：返回值是 Array 实例且元素为 string
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0315 begin');
      const input: asset.AssetMap = makeLabelMap(['L15']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'isArray=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      expect(typeof result[0] === 'string').assertTrue();
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0315 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0316
     * @tc.name testParseLabel0316
     * @tc.desc 组合值：四标签全中文解析按序返回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0316 begin');
      const input: asset.AssetMap = makeLabelMap(['甲', '乙', '丙', '丁']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), '甲,乙,丙,丁');
      expect(result.join(',')).assertEqual('甲,乙,丙,丁');
      expect(result.length).assertEqual(4);
      expect(result[3]).assertEqual('丁');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0316 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0317
     * @tc.name testParseLabel0317
     * @tc.desc 边界值：仅 NORMAL_4 存在时只返回该标签
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0317 begin');
      const input: asset.AssetMap = new Map();
      input.set(asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('Only4'));
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'Only4');
      expect(result.join(',')).assertEqual('Only4');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('Only4');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0317 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0318
     * @tc.name testParseLabel0318
     * @tc.desc 状态值：解析后 Map 大小与标签数一致不增不减
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0318 begin');
      const input: asset.AssetMap = makeLabelMap(['L18a', 'L18b', 'L18c']);
      const before: number = input.size;
      getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', input.size, before);
      expect(input.size).assertEqual(before);
      expect(input.size).assertEqual(3);
      expect(input.has(asset.Tag.DATA_LABEL_NORMAL_3)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0318 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0319
     * @tc.name testParseLabel0319
     * @tc.desc 组合值：含分号符号的标签按原样解码不拆分
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0319 begin');
      const input: asset.AssetMap = makeLabelMap(['a;b']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0], 'a;b');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('a;b');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0319 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0320
     * @tc.name testParseLabel0320
     * @tc.desc 边界值：NORMAL_1 与 NORMAL_3 存在时跳过 NORMAL_2 返回两元素
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0320 begin');
      const input: asset.AssetMap = new Map();
      input.set(asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('First'));
      input.set(asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Third'));
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'First,Third');
      expect(result.join(',')).assertEqual('First,Third');
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual('Third');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0320 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0321
     * @tc.name testParseLabel0321
     * @tc.desc 状态值：两次调用返回内容相同但引用不同的数组
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0321', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0321 begin');
      const input: asset.AssetMap = makeLabelMap(['L21']);
      const first: string[] = getLabelList(input);
      const second: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'sameRef=%{public}s', String(first === second));
      expect(first === second).assertFalse();
      expect(first.join(',')).assertEqual(second.join(','));
      expect(first.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0321 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0322
     * @tc.name testParseLabel0322
     * @tc.desc 组合值：纯数字标签解析为字符串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0322', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0322 begin');
      const input: asset.AssetMap = makeLabelMap(['12345']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0], '12345');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('12345');
      expect(typeof result[0] === 'string').assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0322 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0323
     * @tc.name testParseLabel0323
     * @tc.desc 边界值：空串标签解码为空串元素
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0323', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0323 begin');
      const input: asset.AssetMap = makeLabelMap(['']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0323 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0324
     * @tc.name testParseLabel0324
     * @tc.desc 状态值：修改返回数组不影响后续解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0324', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0324 begin');
      const input: asset.AssetMap = makeLabelMap(['L24']);
      const first: string[] = getLabelList(input);
      first.push('mutated');
      const second: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', second.length, 1);
      expect(second.length).assertEqual(1);
      expect(second[0]).assertEqual('L24');
      expect(first.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0324 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0325
     * @tc.name testParseLabel0325
     * @tc.desc 组合值：大小写混合标签按原样解码
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0325', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0325 begin');
      const input: asset.AssetMap = makeLabelMap(['Aa', 'bB']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'Aa,bB');
      expect(result.join(',')).assertEqual('Aa,bB');
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual('bB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0325 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0326
     * @tc.name testParseLabel0326
     * @tc.desc 极值：四个 100 字符标签解析后全部完整回读
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0326', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0326 begin');
      const labels: string[] = new Array<string>();
      for (let j: number = 0; j < 4; j++) {
        let label: string = '';
        for (let i: number = 0; i < 100; i++) {
          label += String.fromCharCode(65 + j);
        }
        labels.push(label);
      }
      const input: asset.AssetMap = makeLabelMap(labels);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 4);
      expect(result.length).assertEqual(4);
      expect(result[0].length).assertEqual(100);
      expect(result[3].length).assertEqual(100);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0326 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0327
     * @tc.name testParseLabel0327
     * @tc.desc 状态值：返回顺序严格为 NORMAL_1 到 NORMAL_4
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0327', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0327 begin');
      const input: asset.AssetMap = makeLabelMap(['First', 'Second', 'Third', 'Fourth']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'First,Second,Third,Fourth');
      expect(result.join(',')).assertEqual('First,Second,Third,Fourth');
      expect(result[0]).assertEqual('First');
      expect(result[3]).assertEqual('Fourth');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0327 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0328
     * @tc.name testParseLabel0328
     * @tc.desc 边界值：Map 含 ALIAS 与未知键不影响标签解析
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0328', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0328 begin');
      const input: asset.AssetMap = new Map();
      input.set(asset.Tag.ALIAS, stringToArray('alias0328'));
      input.set(asset.Tag.RETURN_TYPE, asset.ReturnType.ALL);
      input.set(asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L28'));
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result.join(','), 'L28');
      expect(result.join(',')).assertEqual('L28');
      expect(result.length).assertEqual(1);
      expect(input.size).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0328 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0329
     * @tc.name testParseLabel0329
     * @tc.desc 组合值：空串与实标签混合解析保留空串元素
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0329', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0329 begin');
      const input: asset.AssetMap = makeLabelMap(['Real', '']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 2);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual('Real');
      expect(result[1]).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0329 end');
    });

    /**
     * @tc.number SUB_ASSET_PARSELBL_0330
     * @tc.name testParseLabel0330
     * @tc.desc 组合值：标签含分隔符与空格的串按原样解码
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testParseLabel0330', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0330 begin');
      const input: asset.AssetMap = makeLabelMap(['a;b c']);
      const result: string[] = getLabelList(input);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0], 'a;b c');
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual('a;b c');
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testParseLabel0330 end');
    });
  });
}


