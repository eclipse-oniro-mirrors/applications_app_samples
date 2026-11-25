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
import { convertAssetList, stringToArray, arrayToString } from '../../../main/ets/model/AssetModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

const LABEL_TAGS: asset.Tag[] = [
  asset.Tag.DATA_LABEL_NORMAL_1,
  asset.Tag.DATA_LABEL_NORMAL_2,
  asset.Tag.DATA_LABEL_NORMAL_3,
  asset.Tag.DATA_LABEL_NORMAL_4
];

function makeAsset(alias: string, withSecret: boolean, secret: string, labels: string[]): asset.AssetMap {
  const m: asset.AssetMap = new Map();
  m.set(asset.Tag.ALIAS, stringToArray(alias));
  if (withSecret) {
    m.set(asset.Tag.SECRET, stringToArray(secret));
  }
  for (let i: number = 0; i < labels.length; i++) {
    m.set(LABEL_TAGS[i], stringToArray(labels[i]));
  }
  return m;
}

export default function convReal() {
  describe('ConvRealTest', () => {
    /**
     * @tc.number SUB_ASSET_CONV_0451
     * @tc.name testConv0451
     * @tc.desc 合法值：单标签资产转换后 alias、secret、label 均回读正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testConv0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0451 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0451', true, 'secret0451', ['L1'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0].get('alias')).assertEqual('alias0451');
      expect(result[0].get('secret')).assertEqual('secret0451');
      expect(result[0].get('label')).assertEqual('L1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0451 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0452
     * @tc.name testConv0452
     * @tc.desc 合法值：双标签资产转换后标签按 NORMAL 顺序以分号连接
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testConv0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0452 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0452', true, 'pwd0452', ['A2', 'B2'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), 'A2;B2');
      expect(result[0].get('label')).assertEqual('A2;B2');
      expect(result[0].get('secret')).assertEqual('pwd0452');
      expect(result[0].get('alias')).assertEqual('alias0452');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0452 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0453
     * @tc.name testConv0453
     * @tc.desc 合法值：三标签资产转换后标签按序连接
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testConv0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0453 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0453', true, 'pwd0453', ['X3', 'Y3', 'Z3'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), 'X3;Y3;Z3');
      expect(result[0].get('label')).assertEqual('X3;Y3;Z3');
      expect(result[0].get('secret')).assertEqual('pwd0453');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0453 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0454
     * @tc.name testConv0454
     * @tc.desc 边界值：四标签上界资产转换后标签全部按序连接
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testConv0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0454 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0454', true, 'pwd0454', ['a4', 'b4', 'c4', 'd4'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), 'a4;b4;c4;d4');
      expect(result[0].get('label')).assertEqual('a4;b4;c4;d4');
      expect(result[0].get('alias')).assertEqual('alias0454');
      expect(result[0].get('secret')).assertEqual('pwd0454');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0454 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0455
     * @tc.name testConv0455
     * @tc.desc 边界值：无标签资产转换后 label 为空串但键存在
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testConv0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0455 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0455', true, 'pwd0455', [])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), '');
      expect(result[0].get('label')).assertEqual('');
      expect(result[0].has('label')).assertTrue();
      expect(result[0].get('secret')).assertEqual('pwd0455');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0455 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0456
     * @tc.name testConv0456
     * @tc.desc 边界值：空资产列表转换后返回空列表
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0456 begin');
      const assetList: asset.AssetMap[] = new Array<asset.AssetMap>();
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      expect(accountList.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0456 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0457
     * @tc.name testConv0457
     * @tc.desc 边界值：无 SECRET 键的资产转换后不产出 secret 键
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0457 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0457', false, '', ['L7'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'hasSecret=%{public}s', String(result[0].has('secret')));
      expect(result[0].has('secret')).assertFalse();
      expect(result[0].get('alias')).assertEqual('alias0457');
      expect(result[0].get('label')).assertEqual('L7');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0457 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0458
     * @tc.name testConv0458
     * @tc.desc 边界值：空串 alias 转换后回读为空串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0458 begin');
      const assetList: asset.AssetMap[] = [makeAsset('', true, 'pwd0458', [])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias'), '');
      expect(result[0].get('alias')).assertEqual('');
      expect(result[0].get('secret')).assertEqual('pwd0458');
      expect(result[0].get('label')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0458 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0459
     * @tc.name testConv0459
     * @tc.desc 组合值：中文标签与数字、符号混合后按序解码连接
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0459 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0459', true, '密码0459', ['标签9', '123', '@#$'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), '标签9;123;@#$');
      expect(result[0].get('label')).assertEqual('标签9;123;@#$');
      expect(result[0].get('secret')).assertEqual('密码0459');
      expect(result[0].get('alias')).assertEqual('alias0459');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0459 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0460
     * @tc.name testConv0460
     * @tc.desc 组合值：中文 secret 经 UTF-8 编码解码后回读一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0460 begin');
      const assetList: asset.AssetMap[] = [makeAsset('账号0460', true, '中文密码0460', [])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret'), '中文密码0460');
      expect(result[0].get('secret')).assertEqual('中文密码0460');
      expect(result[0].get('alias')).assertEqual('账号0460');
      expect(result[0].get('label')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0460 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0461
     * @tc.name testConv0461
     * @tc.desc 极值：500 字符长标签转换后完整回读
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0461 begin');
      let longLabel: string = '';
      for (let i: number = 0; i < 500; i++) {
        longLabel += 'L';
      }
      const assetList: asset.AssetMap[] = [makeAsset('alias0461', true, 'pwd0461', [longLabel])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'labelLen=%{public}d, expected=%{public}d', result[0].get('label')!.length, 500);
      expect(result[0].get('label')!.length).assertEqual(500);
      expect(result[0].get('label')).assertEqual(longLabel);
      expect(result[0].get('secret')).assertEqual('pwd0461');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0461 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0462
     * @tc.name testConv0462
     * @tc.desc 极值：100 条资产批量转换后行数一致且首尾正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0462 begin');
      const assetList: asset.AssetMap[] = new Array<asset.AssetMap>();
      for (let i: number = 0; i < 100; i++) {
        assetList.push(makeAsset('batch' + String(i), true, 'pwd' + String(i), ['L' + String(i)]));
      }
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 100);
      expect(result.length).assertEqual(100);
      expect(result[0].get('alias')).assertEqual('batch0');
      expect(result[99].get('alias')).assertEqual('batch99');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0462 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0463
     * @tc.name testConv0463
     * @tc.desc 状态值：非空 accountList 传入后结果追加到已有元素之后
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0463 begin');
      const existing: Map<string, string> = new Map<string, string>();
      existing.set('alias', 'preExisting');
      const accountList: Map<string, string>[] = [existing];
      const assetList: asset.AssetMap[] = [makeAsset('alias0463', true, 'pwd0463', ['L3'])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 2);
      expect(result.length).assertEqual(2);
      expect(result[0].get('alias')).assertEqual('preExisting');
      expect(result[1].get('alias')).assertEqual('alias0463');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0463 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0464
     * @tc.name testConv0464
     * @tc.desc 状态值：转换后输入资产 Map 的键数量不被修改
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0464 begin');
      const input: asset.AssetMap = makeAsset('alias0464', true, 'pwd0464', ['L4a', 'L4b']);
      const before: number = input.size;
      const assetList: asset.AssetMap[] = [input];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', input.size, before);
      expect(input.size).assertEqual(before);
      expect(input.has(asset.Tag.ALIAS)).assertTrue();
      expect(input.has(asset.Tag.SECRET)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0464 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0465
     * @tc.name testConv0465
     * @tc.desc 状态值：连续两次转换同一输入结果完全一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0465 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0465', true, 'pwd0465', ['L5'])];
      const first: Map<string, string>[] = new Array<Map<string, string>>();
      const second: Map<string, string>[] = new Array<Map<string, string>>();
      const r1: Map<string, string>[] = convertAssetList(assetList, first);
      const r2: Map<string, string>[] = convertAssetList(assetList, second);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', r1.length, 1);
      expect(r1.length).assertEqual(1);
      expect(r2.length).assertEqual(1);
      expect(r1[0].get('alias')).assertEqual(r2[0].get('alias'));
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0465 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0466
     * @tc.name testConv0466
     * @tc.desc 合法值：emoji 标签经编码解码后回读一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0466 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0466', true, 'pwd0466', ['😀', '🎉'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), '😀;🎉');
      expect(result[0].get('label')).assertEqual('😀;🎉');
      expect(result[0].get('secret')).assertEqual('pwd0466');
      expect(result[0].get('alias')).assertEqual('alias0466');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0466 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0467
     * @tc.name testConv0467
     * @tc.desc 边界值：标签值为空字节数组时不产出标签内容
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0467 begin');
      const m: asset.AssetMap = new Map();
      m.set(asset.Tag.ALIAS, stringToArray('alias0467'));
      m.set(asset.Tag.SECRET, stringToArray('pwd0467'));
      m.set(asset.Tag.DATA_LABEL_NORMAL_1, new Uint8Array([0]));
      const assetList: asset.AssetMap[] = [m];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), '');
      expect(result[0].get('label')).assertEqual('');
      expect(result[0].get('secret')).assertEqual('pwd0467');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0467 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0468
     * @tc.name testConv0468
     * @tc.desc 组合值：alias 与 secret 相同字符串转换后两者均回读正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0468 begin');
      const assetList: asset.AssetMap[] = [makeAsset('sameValue', true, 'sameValue', ['L8'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias'), 'sameValue');
      expect(result[0].get('alias')).assertEqual('sameValue');
      expect(result[0].get('secret')).assertEqual('sameValue');
      expect(result[0].get('label')).assertEqual('L8');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0468 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0469
     * @tc.name testConv0469
     * @tc.desc 组合值：两条资产转换后各行列对应正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0469 begin');
      const assetList: asset.AssetMap[] = [
        makeAsset('aliasA', true, 'pwdA', ['LA']),
        makeAsset('aliasB', true, 'pwdB', ['LB'])
      ];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 2);
      expect(result.length).assertEqual(2);
      expect(result[0].get('alias')).assertEqual('aliasA');
      expect(result[1].get('label')).assertEqual('LB');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0469 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0470
     * @tc.name testConv0470
     * @tc.desc 合法值：空串 secret 转换后回读为空串且键存在
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0470 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0470', true, '', ['L0'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret'), '');
      expect(result[0].get('secret')).assertEqual('');
      expect(result[0].has('secret')).assertTrue();
      expect(result[0].get('alias')).assertEqual('alias0470');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0470 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0471
     * @tc.name testConv0471
     * @tc.desc 边界值：标签值为空字节时该标签被过滤不参与连接
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0471 begin');
      const m: asset.AssetMap = new Map();
      m.set(asset.Tag.ALIAS, stringToArray('alias0471'));
      m.set(asset.Tag.DATA_LABEL_NORMAL_1, new Uint8Array([0]));
      m.set(asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Valid2'));
      const assetList: asset.AssetMap[] = [m];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), 'Valid2');
      expect(result[0].get('label')).assertEqual('Valid2');
      expect(result[0].has('secret')).assertFalse();
      expect(result[0].get('alias')).assertEqual('alias0471');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0471 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0472
     * @tc.name testConv0472
     * @tc.desc 状态值：转换结果与传入 accountList 为同一引用
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0472 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0472', true, 'pwd0472', ['L2'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'sameRef=%{public}s', String(result === accountList));
      expect(result === accountList).assertTrue();
      expect(accountList.length).assertEqual(1);
      expect(accountList[0].get('alias')).assertEqual('alias0472');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0472 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0473
     * @tc.name testConv0473
     * @tc.desc 组合值：四标签全中文转换后按序连接
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0473 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0473', true, 'pwd0473', ['甲', '乙', '丙', '丁'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), '甲;乙;丙;丁');
      expect(result[0].get('label')).assertEqual('甲;乙;丙;丁');
      expect(result[0].get('secret')).assertEqual('pwd0473');
      expect(result[0].get('alias')).assertEqual('alias0473');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0473 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0474
     * @tc.name testConv0474
     * @tc.desc 极值：1000 字符标签转换后完整回读
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0474 begin');
      let longLabel: string = '';
      for (let i: number = 0; i < 1000; i++) {
        longLabel += 'X';
      }
      const assetList: asset.AssetMap[] = [makeAsset('alias0474', true, 'pwd0474', [longLabel])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'labelLen=%{public}d, expected=%{public}d', result[0].get('label')!.length, 1000);
      expect(result[0].get('label')!.length).assertEqual(1000);
      expect(result[0].get('label')).assertEqual(longLabel);
      expect(result[0].get('alias')).assertEqual('alias0474');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0474 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0475
     * @tc.name testConv0475
     * @tc.desc 合法值：无标签时 label 键存在且值为空串
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0475 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0475', true, 'pwd0475', [])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'hasLabel=%{public}s', String(result[0].has('label')));
      expect(result[0].has('label')).assertTrue();
      expect(result[0].get('label')).assertEqual('');
      expect(result[0].get('secret')).assertEqual('pwd0475');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0475 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0476
     * @tc.name testConv0476
     * @tc.desc 组合值：大小写混合标签按原样回读不排序
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0476 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0476', true, 'pwd0476', ['Aa', 'bB'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label'), 'Aa;bB');
      expect(result[0].get('label')).assertEqual('Aa;bB');
      expect(result[0].get('alias')).assertEqual('alias0476');
      expect(result[0].get('secret')).assertEqual('pwd0476');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0476 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0477
     * @tc.name testConv0477
     * @tc.desc 状态值：结果 Map 键集合固定为 alias、label 与可选 secret
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0477 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0477', true, 'pwd0477', ['L7'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'size=%{public}d, expected=%{public}d', result[0].size, 3);
      expect(result[0].size).assertEqual(3);
      expect(result[0].has('alias')).assertTrue();
      expect(result[0].has('label')).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0477 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0478
     * @tc.name testConv0478
     * @tc.desc 组合值：三条资产中一条无 SECRET 时各行独立转换
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0478 begin');
      const assetList: asset.AssetMap[] = [
        makeAsset('a1', true, 'p1', ['L1']),
        makeAsset('a2', false, '', ['L2']),
        makeAsset('a3', true, 'p3', ['L3'])
      ];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 3);
      expect(result.length).assertEqual(3);
      expect(result[0].has('secret')).assertTrue();
      expect(result[1].has('secret')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0478 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0479
     * @tc.name testConv0479
     * @tc.desc 边界值：空串 alias 与空串 secret 组合转换
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0479 begin');
      const assetList: asset.AssetMap[] = [makeAsset('', true, '', [])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias'), '');
      expect(result[0].get('alias')).assertEqual('');
      expect(result[0].get('secret')).assertEqual('');
      expect(result[0].get('label')).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0479 end');
    });

    /**
     * @tc.number SUB_ASSET_CONV_0480
     * @tc.name testConv0480
     * @tc.desc 状态值：转换后输入资产列表长度不变
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testConv0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0480 begin');
      const assetList: asset.AssetMap[] = [makeAsset('alias0480', true, 'pwd0480', ['L8'])];
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      convertAssetList(assetList, accountList);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', assetList.length, 1);
      expect(assetList.length).assertEqual(1);
      expect(assetList[0].size).assertEqual(3);
      expect(accountList.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testConv0480 end');
    });
  });
}


