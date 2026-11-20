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
import { convertAssetList, stringToArray } from '../../../main/ets/model/AssetModel';
import { asset } from '@kit.AssetStoreKit';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function convVolume02() {
  describe('ConvVolume02Test', () => {

    /**
     * @tc.name   testConv020151
     * @tc.number SUB_ASSET_CONV_0151
     * @tc.desc   双标签资产转换后 secret 解码回读且标签按序连接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020151 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const anchorAsset: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('anchorAlias')],
        [asset.Tag.SECRET, stringToArray('anchorSecret')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('AnchorL1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('AnchorL2')]
      ])];
      const rows: Map<string, string>[] = convertAssetList(anchorAsset, accountList);
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual('anchorSecret');
      expect(rows[0].get('label')).assertEqual('AnchorL1;AnchorL2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020151 end');
    })

    /**
     * @tc.name   testConv020152
     * @tc.number SUB_ASSET_CONV_0152
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020152 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020001')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020152 end');
    })

    /**
     * @tc.name   testConv020153
     * @tc.number SUB_ASSET_CONV_0153
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020153 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020002')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020153 end');
    })

    /**
     * @tc.name   testConv020154
     * @tc.number SUB_ASSET_CONV_0154
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020154 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020003')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020154 end');
    })

    /**
     * @tc.name   testConv020155
     * @tc.number SUB_ASSET_CONV_0155
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020155 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020004')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020155 end');
    })

    /**
     * @tc.name   testConv020156
     * @tc.number SUB_ASSET_CONV_0156
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020156 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020005')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020156 end');
    })

    /**
     * @tc.name   testConv020157
     * @tc.number SUB_ASSET_CONV_0157
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020157 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020006')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020157 end');
    })

    /**
     * @tc.name   testConv020158
     * @tc.number SUB_ASSET_CONV_0158
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020158 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020007')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020158 end');
    })

    /**
     * @tc.name   testConv020159
     * @tc.number SUB_ASSET_CONV_0159
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020159 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020008')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020159 end');
    })

    /**
     * @tc.name   testConv020160
     * @tc.number SUB_ASSET_CONV_0160
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020160 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020009')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020160 end');
    })

    /**
     * @tc.name   testConv020161
     * @tc.number SUB_ASSET_CONV_0161
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020161 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020010')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020161 end');
    })

    /**
     * @tc.name   testConv020162
     * @tc.number SUB_ASSET_CONV_0162
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020162 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020011')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020162 end');
    })

    /**
     * @tc.name   testConv020163
     * @tc.number SUB_ASSET_CONV_0163
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020163 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020012')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020163 end');
    })

    /**
     * @tc.name   testConv020164
     * @tc.number SUB_ASSET_CONV_0164
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020164 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020013')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020164 end');
    })

    /**
     * @tc.name   testConv020165
     * @tc.number SUB_ASSET_CONV_0165
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020165 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020014')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020165 end');
    })

    /**
     * @tc.name   testConv020166
     * @tc.number SUB_ASSET_CONV_0166
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020166 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020015')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020166 end');
    })

    /**
     * @tc.name   testConv020167
     * @tc.number SUB_ASSET_CONV_0167
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020167 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020016')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020167 end');
    })

    /**
     * @tc.name   testConv020168
     * @tc.number SUB_ASSET_CONV_0168
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020168 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020017')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020168 end');
    })

    /**
     * @tc.name   testConv020169
     * @tc.number SUB_ASSET_CONV_0169
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020169 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020018')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020169 end');
    })

    /**
     * @tc.name   testConv020170
     * @tc.number SUB_ASSET_CONV_0170
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020170 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020019')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String(''));
      expect(result[0].get('label')).assertEqual('');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020170 end');
    })

    /**
     * @tc.name   testConv020171
     * @tc.number SUB_ASSET_CONV_0171
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020171 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020020')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G0')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('G0'));
      expect(result[0].get('label')).assertEqual('G0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020171 end');
    })

    /**
     * @tc.name   testConv020172
     * @tc.number SUB_ASSET_CONV_0172
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020172 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020021')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G1')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('G1'));
      expect(result[0].get('label')).assertEqual('G1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020172 end');
    })

    /**
     * @tc.name   testConv020173
     * @tc.number SUB_ASSET_CONV_0173
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020173 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020022')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G2')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('G2'));
      expect(result[0].get('label')).assertEqual('G2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020173 end');
    })

    /**
     * @tc.name   testConv020174
     * @tc.number SUB_ASSET_CONV_0174
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020174 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020023')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G3')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('G3'));
      expect(result[0].get('label')).assertEqual('G3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020174 end');
    })

    /**
     * @tc.name   testConv020175
     * @tc.number SUB_ASSET_CONV_0175
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020175 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020024')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('G4')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('G4'));
      expect(result[0].get('label')).assertEqual('G4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020175 end');
    })

    /**
     * @tc.name   testConv020176
     * @tc.number SUB_ASSET_CONV_0176
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020176 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020025')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L5')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L5'));
      expect(result[0].get('label')).assertEqual('L5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020176 end');
    })

    /**
     * @tc.name   testConv020177
     * @tc.number SUB_ASSET_CONV_0177
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020177 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020026')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L6')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L6'));
      expect(result[0].get('label')).assertEqual('L6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020177 end');
    })

    /**
     * @tc.name   testConv020178
     * @tc.number SUB_ASSET_CONV_0178
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020178 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020027')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L7')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L7'));
      expect(result[0].get('label')).assertEqual('L7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020178 end');
    })

    /**
     * @tc.name   testConv020179
     * @tc.number SUB_ASSET_CONV_0179
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020179 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020028')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L8')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L8'));
      expect(result[0].get('label')).assertEqual('L8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020179 end');
    })

    /**
     * @tc.name   testConv020180
     * @tc.number SUB_ASSET_CONV_0180
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020180 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020029')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L9')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L9'));
      expect(result[0].get('label')).assertEqual('L9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020180 end');
    })

    /**
     * @tc.name   testConv020181
     * @tc.number SUB_ASSET_CONV_0181
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020181 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020030')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L10')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L10'));
      expect(result[0].get('label')).assertEqual('L10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020181 end');
    })

    /**
     * @tc.name   testConv020182
     * @tc.number SUB_ASSET_CONV_0182
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020182 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020031')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L11')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L11'));
      expect(result[0].get('label')).assertEqual('L11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020182 end');
    })

    /**
     * @tc.name   testConv020183
     * @tc.number SUB_ASSET_CONV_0183
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020183 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020032')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L12')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L12'));
      expect(result[0].get('label')).assertEqual('L12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020183 end');
    })

    /**
     * @tc.name   testConv020184
     * @tc.number SUB_ASSET_CONV_0184
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020184 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020033')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L13')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L13'));
      expect(result[0].get('label')).assertEqual('L13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020184 end');
    })

    /**
     * @tc.name   testConv020185
     * @tc.number SUB_ASSET_CONV_0185
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020185 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020034')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L14')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L14'));
      expect(result[0].get('label')).assertEqual('L14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020185 end');
    })

    /**
     * @tc.name   testConv020186
     * @tc.number SUB_ASSET_CONV_0186
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020186 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020035')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L15')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L15'));
      expect(result[0].get('label')).assertEqual('L15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020186 end');
    })

    /**
     * @tc.name   testConv020187
     * @tc.number SUB_ASSET_CONV_0187
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020187 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020036')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L16')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L16'));
      expect(result[0].get('label')).assertEqual('L16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020187 end');
    })

    /**
     * @tc.name   testConv020188
     * @tc.number SUB_ASSET_CONV_0188
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020188 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020037')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L17')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L17'));
      expect(result[0].get('label')).assertEqual('L17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020188 end');
    })

    /**
     * @tc.name   testConv020189
     * @tc.number SUB_ASSET_CONV_0189
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020189 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020038')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L18')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L18'));
      expect(result[0].get('label')).assertEqual('L18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020189 end');
    })

    /**
     * @tc.name   testConv020190
     * @tc.number SUB_ASSET_CONV_0190
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020190 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020039')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L19')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L19'));
      expect(result[0].get('label')).assertEqual('L19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020190 end');
    })

    /**
     * @tc.name   testConv020191
     * @tc.number SUB_ASSET_CONV_0191
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020191 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020040')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L20')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L20'));
      expect(result[0].get('label')).assertEqual('L20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020191 end');
    })

    /**
     * @tc.name   testConv020192
     * @tc.number SUB_ASSET_CONV_0192
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020192 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020041')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L21')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L21'));
      expect(result[0].get('label')).assertEqual('L21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020192 end');
    })

    /**
     * @tc.name   testConv020193
     * @tc.number SUB_ASSET_CONV_0193
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020193 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020042')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L22')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L22'));
      expect(result[0].get('label')).assertEqual('L22');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020193 end');
    })

    /**
     * @tc.name   testConv020194
     * @tc.number SUB_ASSET_CONV_0194
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020194 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020043')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L23')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L23'));
      expect(result[0].get('label')).assertEqual('L23');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020194 end');
    })

    /**
     * @tc.name   testConv020195
     * @tc.number SUB_ASSET_CONV_0195
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020195 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020044')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L24')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L24'));
      expect(result[0].get('label')).assertEqual('L24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020195 end');
    })

    /**
     * @tc.name   testConv020196
     * @tc.number SUB_ASSET_CONV_0196
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020196 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020045')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L25')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L25'));
      expect(result[0].get('label')).assertEqual('L25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020196 end');
    })

    /**
     * @tc.name   testConv020197
     * @tc.number SUB_ASSET_CONV_0197
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020197 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020046')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L26')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L26'));
      expect(result[0].get('label')).assertEqual('L26');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020197 end');
    })

    /**
     * @tc.name   testConv020198
     * @tc.number SUB_ASSET_CONV_0198
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020198 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020047')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L27')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L27'));
      expect(result[0].get('label')).assertEqual('L27');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020198 end');
    })

    /**
     * @tc.name   testConv020199
     * @tc.number SUB_ASSET_CONV_0199
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020199 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020048')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L28')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L28'));
      expect(result[0].get('label')).assertEqual('L28');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020199 end');
    })

    /**
     * @tc.name   testConv020200
     * @tc.number SUB_ASSET_CONV_0200
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020200 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020049')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('L29')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('L29'));
      expect(result[0].get('label')).assertEqual('L29');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020200 end');
    })

    /**
     * @tc.name   testConv020201
     * @tc.number SUB_ASSET_CONV_0201
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020201 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020050')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A0')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B0')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A0;B0'));
      expect(result[0].get('label')).assertEqual('A0;B0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020201 end');
    })

    /**
     * @tc.name   testConv020202
     * @tc.number SUB_ASSET_CONV_0202
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020202 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020051')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B1')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A1;B1'));
      expect(result[0].get('label')).assertEqual('A1;B1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020202 end');
    })

    /**
     * @tc.name   testConv020203
     * @tc.number SUB_ASSET_CONV_0203
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020203 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020052')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A2')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B2')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A2;B2'));
      expect(result[0].get('label')).assertEqual('A2;B2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020203 end');
    })

    /**
     * @tc.name   testConv020204
     * @tc.number SUB_ASSET_CONV_0204
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020204 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020053')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A3')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B3')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A3;B3'));
      expect(result[0].get('label')).assertEqual('A3;B3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020204 end');
    })

    /**
     * @tc.name   testConv020205
     * @tc.number SUB_ASSET_CONV_0205
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020205 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020054')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A4')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B4')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A4;B4'));
      expect(result[0].get('label')).assertEqual('A4;B4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020205 end');
    })

    /**
     * @tc.name   testConv020206
     * @tc.number SUB_ASSET_CONV_0206
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020206 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020055')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A5')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B5')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A5;B5'));
      expect(result[0].get('label')).assertEqual('A5;B5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020206 end');
    })

    /**
     * @tc.name   testConv020207
     * @tc.number SUB_ASSET_CONV_0207
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020207 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020056')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A6')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B6')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A6;B6'));
      expect(result[0].get('label')).assertEqual('A6;B6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020207 end');
    })

    /**
     * @tc.name   testConv020208
     * @tc.number SUB_ASSET_CONV_0208
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020208 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020057')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A7')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B7')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A7;B7'));
      expect(result[0].get('label')).assertEqual('A7;B7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020208 end');
    })

    /**
     * @tc.name   testConv020209
     * @tc.number SUB_ASSET_CONV_0209
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020209 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020058')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B8')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A8;B8'));
      expect(result[0].get('label')).assertEqual('A8;B8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020209 end');
    })

    /**
     * @tc.name   testConv020210
     * @tc.number SUB_ASSET_CONV_0210
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020210 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020059')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A9')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B9')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A9;B9'));
      expect(result[0].get('label')).assertEqual('A9;B9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020210 end');
    })

    /**
     * @tc.name   testConv020211
     * @tc.number SUB_ASSET_CONV_0211
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020211 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020060')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A10')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B10')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A10;B10'));
      expect(result[0].get('label')).assertEqual('A10;B10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020211 end');
    })

    /**
     * @tc.name   testConv020212
     * @tc.number SUB_ASSET_CONV_0212
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020212 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020061')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A11')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B11')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A11;B11'));
      expect(result[0].get('label')).assertEqual('A11;B11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020212 end');
    })

    /**
     * @tc.name   testConv020213
     * @tc.number SUB_ASSET_CONV_0213
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020213 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020062')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A12')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B12')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A12;B12'));
      expect(result[0].get('label')).assertEqual('A12;B12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020213 end');
    })

    /**
     * @tc.name   testConv020214
     * @tc.number SUB_ASSET_CONV_0214
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020214 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020063')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A13')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B13')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A13;B13'));
      expect(result[0].get('label')).assertEqual('A13;B13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020214 end');
    })

    /**
     * @tc.name   testConv020215
     * @tc.number SUB_ASSET_CONV_0215
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020215 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020064')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A14')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B14')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A14;B14'));
      expect(result[0].get('label')).assertEqual('A14;B14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020215 end');
    })

    /**
     * @tc.name   testConv020216
     * @tc.number SUB_ASSET_CONV_0216
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020216 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020065')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A15')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B15')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A15;B15'));
      expect(result[0].get('label')).assertEqual('A15;B15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020216 end');
    })

    /**
     * @tc.name   testConv020217
     * @tc.number SUB_ASSET_CONV_0217
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020217 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020066')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A16')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B16')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A16;B16'));
      expect(result[0].get('label')).assertEqual('A16;B16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020217 end');
    })

    /**
     * @tc.name   testConv020218
     * @tc.number SUB_ASSET_CONV_0218
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020218 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020067')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A17')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B17')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A17;B17'));
      expect(result[0].get('label')).assertEqual('A17;B17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020218 end');
    })

    /**
     * @tc.name   testConv020219
     * @tc.number SUB_ASSET_CONV_0219
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020219 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020068')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A18')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B18')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A18;B18'));
      expect(result[0].get('label')).assertEqual('A18;B18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020219 end');
    })

    /**
     * @tc.name   testConv020220
     * @tc.number SUB_ASSET_CONV_0220
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020220 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020069')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A19')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B19')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A19;B19'));
      expect(result[0].get('label')).assertEqual('A19;B19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020220 end');
    })

    /**
     * @tc.name   testConv020221
     * @tc.number SUB_ASSET_CONV_0221
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020221 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020070')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A20')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B20')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A20;B20'));
      expect(result[0].get('label')).assertEqual('A20;B20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020221 end');
    })

    /**
     * @tc.name   testConv020222
     * @tc.number SUB_ASSET_CONV_0222
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020222 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020071')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A21')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B21')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A21;B21'));
      expect(result[0].get('label')).assertEqual('A21;B21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020222 end');
    })

    /**
     * @tc.name   testConv020223
     * @tc.number SUB_ASSET_CONV_0223
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020223 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020072')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A22')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B22')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A22;B22'));
      expect(result[0].get('label')).assertEqual('A22;B22');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020223 end');
    })

    /**
     * @tc.name   testConv020224
     * @tc.number SUB_ASSET_CONV_0224
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020224 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020073')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A23')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B23')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A23;B23'));
      expect(result[0].get('label')).assertEqual('A23;B23');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020224 end');
    })

    /**
     * @tc.name   testConv020225
     * @tc.number SUB_ASSET_CONV_0225
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020225 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020074')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A24')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B24')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A24;B24'));
      expect(result[0].get('label')).assertEqual('A24;B24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020225 end');
    })

    /**
     * @tc.name   testConv020226
     * @tc.number SUB_ASSET_CONV_0226
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020226 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020075')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A25')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B25')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A25;B25'));
      expect(result[0].get('label')).assertEqual('A25;B25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020226 end');
    })

    /**
     * @tc.name   testConv020227
     * @tc.number SUB_ASSET_CONV_0227
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020227 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020076')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A26')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B26')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A26;B26'));
      expect(result[0].get('label')).assertEqual('A26;B26');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020227 end');
    })

    /**
     * @tc.name   testConv020228
     * @tc.number SUB_ASSET_CONV_0228
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020228 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020077')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A27')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B27')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A27;B27'));
      expect(result[0].get('label')).assertEqual('A27;B27');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020228 end');
    })

    /**
     * @tc.name   testConv020229
     * @tc.number SUB_ASSET_CONV_0229
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020229 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020078')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A28')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B28')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A28;B28'));
      expect(result[0].get('label')).assertEqual('A28;B28');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020229 end');
    })

    /**
     * @tc.name   testConv020230
     * @tc.number SUB_ASSET_CONV_0230
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020230 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020079')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('A29')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('B29')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('A29;B29'));
      expect(result[0].get('label')).assertEqual('A29;B29');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020230 end');
    })

    /**
     * @tc.name   testConv020231
     * @tc.number SUB_ASSET_CONV_0231
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020231 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020080')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X0')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y0')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z0')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X0;Y0;Z0'));
      expect(result[0].get('label')).assertEqual('X0;Y0;Z0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020231 end');
    })

    /**
     * @tc.name   testConv020232
     * @tc.number SUB_ASSET_CONV_0232
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020232 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020081')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y1')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z1')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X1;Y1;Z1'));
      expect(result[0].get('label')).assertEqual('X1;Y1;Z1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020232 end');
    })

    /**
     * @tc.name   testConv020233
     * @tc.number SUB_ASSET_CONV_0233
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020233 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020082')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X2')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y2')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z2')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X2;Y2;Z2'));
      expect(result[0].get('label')).assertEqual('X2;Y2;Z2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020233 end');
    })

    /**
     * @tc.name   testConv020234
     * @tc.number SUB_ASSET_CONV_0234
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020234 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020083')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X3')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y3')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z3')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X3;Y3;Z3'));
      expect(result[0].get('label')).assertEqual('X3;Y3;Z3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020234 end');
    })

    /**
     * @tc.name   testConv020235
     * @tc.number SUB_ASSET_CONV_0235
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020235 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020084')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X4')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y4')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z4')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X4;Y4;Z4'));
      expect(result[0].get('label')).assertEqual('X4;Y4;Z4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020235 end');
    })

    /**
     * @tc.name   testConv020236
     * @tc.number SUB_ASSET_CONV_0236
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020236 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020085')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X5')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y5')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z5')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X5;Y5;Z5'));
      expect(result[0].get('label')).assertEqual('X5;Y5;Z5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020236 end');
    })

    /**
     * @tc.name   testConv020237
     * @tc.number SUB_ASSET_CONV_0237
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020237 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020086')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X6')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y6')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z6')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X6;Y6;Z6'));
      expect(result[0].get('label')).assertEqual('X6;Y6;Z6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020237 end');
    })

    /**
     * @tc.name   testConv020238
     * @tc.number SUB_ASSET_CONV_0238
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020238 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020087')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X7')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y7')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z7')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X7;Y7;Z7'));
      expect(result[0].get('label')).assertEqual('X7;Y7;Z7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020238 end');
    })

    /**
     * @tc.name   testConv020239
     * @tc.number SUB_ASSET_CONV_0239
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020239 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020088')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y8')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z8')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X8;Y8;Z8'));
      expect(result[0].get('label')).assertEqual('X8;Y8;Z8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020239 end');
    })

    /**
     * @tc.name   testConv020240
     * @tc.number SUB_ASSET_CONV_0240
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020240 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020089')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X9')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y9')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z9')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X9;Y9;Z9'));
      expect(result[0].get('label')).assertEqual('X9;Y9;Z9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020240 end');
    })

    /**
     * @tc.name   testConv020241
     * @tc.number SUB_ASSET_CONV_0241
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020241 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020090')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X10')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y10')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z10')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X10;Y10;Z10'));
      expect(result[0].get('label')).assertEqual('X10;Y10;Z10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020241 end');
    })

    /**
     * @tc.name   testConv020242
     * @tc.number SUB_ASSET_CONV_0242
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020242 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020091')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X11')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y11')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z11')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X11;Y11;Z11'));
      expect(result[0].get('label')).assertEqual('X11;Y11;Z11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020242 end');
    })

    /**
     * @tc.name   testConv020243
     * @tc.number SUB_ASSET_CONV_0243
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020243 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020092')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X12')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y12')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z12')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X12;Y12;Z12'));
      expect(result[0].get('label')).assertEqual('X12;Y12;Z12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020243 end');
    })

    /**
     * @tc.name   testConv020244
     * @tc.number SUB_ASSET_CONV_0244
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020244 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020093')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X13')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y13')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z13')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X13;Y13;Z13'));
      expect(result[0].get('label')).assertEqual('X13;Y13;Z13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020244 end');
    })

    /**
     * @tc.name   testConv020245
     * @tc.number SUB_ASSET_CONV_0245
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020245 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020094')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X14')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y14')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z14')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X14;Y14;Z14'));
      expect(result[0].get('label')).assertEqual('X14;Y14;Z14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020245 end');
    })

    /**
     * @tc.name   testConv020246
     * @tc.number SUB_ASSET_CONV_0246
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020246 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020095')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X15')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y15')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z15')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X15;Y15;Z15'));
      expect(result[0].get('label')).assertEqual('X15;Y15;Z15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020246 end');
    })

    /**
     * @tc.name   testConv020247
     * @tc.number SUB_ASSET_CONV_0247
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020247 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020096')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X16')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y16')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z16')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X16;Y16;Z16'));
      expect(result[0].get('label')).assertEqual('X16;Y16;Z16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020247 end');
    })

    /**
     * @tc.name   testConv020248
     * @tc.number SUB_ASSET_CONV_0248
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020248 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020097')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X17')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y17')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z17')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X17;Y17;Z17'));
      expect(result[0].get('label')).assertEqual('X17;Y17;Z17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020248 end');
    })

    /**
     * @tc.name   testConv020249
     * @tc.number SUB_ASSET_CONV_0249
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020249 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020098')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X18')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y18')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z18')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X18;Y18;Z18'));
      expect(result[0].get('label')).assertEqual('X18;Y18;Z18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020249 end');
    })

    /**
     * @tc.name   testConv020250
     * @tc.number SUB_ASSET_CONV_0250
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020250 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020099')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X19')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y19')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z19')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X19;Y19;Z19'));
      expect(result[0].get('label')).assertEqual('X19;Y19;Z19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020250 end');
    })

    /**
     * @tc.name   testConv020251
     * @tc.number SUB_ASSET_CONV_0251
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020251 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020100')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X20')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y20')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z20')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X20;Y20;Z20'));
      expect(result[0].get('label')).assertEqual('X20;Y20;Z20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020251 end');
    })

    /**
     * @tc.name   testConv020252
     * @tc.number SUB_ASSET_CONV_0252
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020252 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020101')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X21')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y21')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z21')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X21;Y21;Z21'));
      expect(result[0].get('label')).assertEqual('X21;Y21;Z21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020252 end');
    })

    /**
     * @tc.name   testConv020253
     * @tc.number SUB_ASSET_CONV_0253
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020253 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020102')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X22')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y22')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z22')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X22;Y22;Z22'));
      expect(result[0].get('label')).assertEqual('X22;Y22;Z22');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020253 end');
    })

    /**
     * @tc.name   testConv020254
     * @tc.number SUB_ASSET_CONV_0254
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020254 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020103')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X23')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y23')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z23')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X23;Y23;Z23'));
      expect(result[0].get('label')).assertEqual('X23;Y23;Z23');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020254 end');
    })

    /**
     * @tc.name   testConv020255
     * @tc.number SUB_ASSET_CONV_0255
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020255 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020104')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X24')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y24')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z24')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X24;Y24;Z24'));
      expect(result[0].get('label')).assertEqual('X24;Y24;Z24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020255 end');
    })

    /**
     * @tc.name   testConv020256
     * @tc.number SUB_ASSET_CONV_0256
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020256 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020105')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X25')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y25')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z25')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X25;Y25;Z25'));
      expect(result[0].get('label')).assertEqual('X25;Y25;Z25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020256 end');
    })

    /**
     * @tc.name   testConv020257
     * @tc.number SUB_ASSET_CONV_0257
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020257 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020106')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X26')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y26')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z26')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X26;Y26;Z26'));
      expect(result[0].get('label')).assertEqual('X26;Y26;Z26');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020257 end');
    })

    /**
     * @tc.name   testConv020258
     * @tc.number SUB_ASSET_CONV_0258
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020258 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020107')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X27')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y27')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z27')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X27;Y27;Z27'));
      expect(result[0].get('label')).assertEqual('X27;Y27;Z27');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020258 end');
    })

    /**
     * @tc.name   testConv020259
     * @tc.number SUB_ASSET_CONV_0259
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020259 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020108')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X28')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y28')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z28')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X28;Y28;Z28'));
      expect(result[0].get('label')).assertEqual('X28;Y28;Z28');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020259 end');
    })

    /**
     * @tc.name   testConv020260
     * @tc.number SUB_ASSET_CONV_0260
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020260 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020109')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('X29')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('Y29')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('Z29')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('X29;Y29;Z29'));
      expect(result[0].get('label')).assertEqual('X29;Y29;Z29');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020260 end');
    })

    /**
     * @tc.name   testConv020261
     * @tc.number SUB_ASSET_CONV_0261
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020261 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020110')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a0')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b0')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c0')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d0')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a0;b0;c0;d0'));
      expect(result[0].get('label')).assertEqual('a0;b0;c0;d0');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020261 end');
    })

    /**
     * @tc.name   testConv020262
     * @tc.number SUB_ASSET_CONV_0262
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020262 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020111')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b1')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c1')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d1')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a1;b1;c1;d1'));
      expect(result[0].get('label')).assertEqual('a1;b1;c1;d1');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020262 end');
    })

    /**
     * @tc.name   testConv020263
     * @tc.number SUB_ASSET_CONV_0263
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020263 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020112')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a2')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b2')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c2')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d2')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a2;b2;c2;d2'));
      expect(result[0].get('label')).assertEqual('a2;b2;c2;d2');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020263 end');
    })

    /**
     * @tc.name   testConv020264
     * @tc.number SUB_ASSET_CONV_0264
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020264 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020113')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a3')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b3')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c3')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d3')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a3;b3;c3;d3'));
      expect(result[0].get('label')).assertEqual('a3;b3;c3;d3');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020264 end');
    })

    /**
     * @tc.name   testConv020265
     * @tc.number SUB_ASSET_CONV_0265
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020265 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020114')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a4')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b4')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c4')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d4')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a4;b4;c4;d4'));
      expect(result[0].get('label')).assertEqual('a4;b4;c4;d4');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020265 end');
    })

    /**
     * @tc.name   testConv020266
     * @tc.number SUB_ASSET_CONV_0266
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020266 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020115')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a5')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b5')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c5')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d5')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a5;b5;c5;d5'));
      expect(result[0].get('label')).assertEqual('a5;b5;c5;d5');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020266 end');
    })

    /**
     * @tc.name   testConv020267
     * @tc.number SUB_ASSET_CONV_0267
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020267 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020116')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a6')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b6')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c6')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d6')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a6;b6;c6;d6'));
      expect(result[0].get('label')).assertEqual('a6;b6;c6;d6');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020267 end');
    })

    /**
     * @tc.name   testConv020268
     * @tc.number SUB_ASSET_CONV_0268
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020268 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020117')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a7')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b7')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c7')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d7')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a7;b7;c7;d7'));
      expect(result[0].get('label')).assertEqual('a7;b7;c7;d7');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020268 end');
    })

    /**
     * @tc.name   testConv020269
     * @tc.number SUB_ASSET_CONV_0269
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020269 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020118')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b8')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c8')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d8')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a8;b8;c8;d8'));
      expect(result[0].get('label')).assertEqual('a8;b8;c8;d8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020269 end');
    })

    /**
     * @tc.name   testConv020270
     * @tc.number SUB_ASSET_CONV_0270
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020270 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020119')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a9')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b9')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c9')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d9')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a9;b9;c9;d9'));
      expect(result[0].get('label')).assertEqual('a9;b9;c9;d9');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020270 end');
    })

    /**
     * @tc.name   testConv020271
     * @tc.number SUB_ASSET_CONV_0271
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020271 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020120')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a10')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b10')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c10')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d10')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a10;b10;c10;d10'));
      expect(result[0].get('label')).assertEqual('a10;b10;c10;d10');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020271 end');
    })

    /**
     * @tc.name   testConv020272
     * @tc.number SUB_ASSET_CONV_0272
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020272 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020121')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a11')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b11')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c11')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d11')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a11;b11;c11;d11'));
      expect(result[0].get('label')).assertEqual('a11;b11;c11;d11');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020272 end');
    })

    /**
     * @tc.name   testConv020273
     * @tc.number SUB_ASSET_CONV_0273
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020273 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020122')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a12')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b12')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c12')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d12')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a12;b12;c12;d12'));
      expect(result[0].get('label')).assertEqual('a12;b12;c12;d12');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020273 end');
    })

    /**
     * @tc.name   testConv020274
     * @tc.number SUB_ASSET_CONV_0274
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020274 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020123')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a13')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b13')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c13')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d13')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a13;b13;c13;d13'));
      expect(result[0].get('label')).assertEqual('a13;b13;c13;d13');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020274 end');
    })

    /**
     * @tc.name   testConv020275
     * @tc.number SUB_ASSET_CONV_0275
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020275 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020124')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a14')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b14')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c14')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d14')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a14;b14;c14;d14'));
      expect(result[0].get('label')).assertEqual('a14;b14;c14;d14');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020275 end');
    })

    /**
     * @tc.name   testConv020276
     * @tc.number SUB_ASSET_CONV_0276
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020276 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020125')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a15')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b15')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c15')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d15')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a15;b15;c15;d15'));
      expect(result[0].get('label')).assertEqual('a15;b15;c15;d15');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020276 end');
    })

    /**
     * @tc.name   testConv020277
     * @tc.number SUB_ASSET_CONV_0277
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020277 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020126')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a16')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b16')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c16')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d16')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a16;b16;c16;d16'));
      expect(result[0].get('label')).assertEqual('a16;b16;c16;d16');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020277 end');
    })

    /**
     * @tc.name   testConv020278
     * @tc.number SUB_ASSET_CONV_0278
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020278 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020127')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a17')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b17')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c17')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d17')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a17;b17;c17;d17'));
      expect(result[0].get('label')).assertEqual('a17;b17;c17;d17');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020278 end');
    })

    /**
     * @tc.name   testConv020279
     * @tc.number SUB_ASSET_CONV_0279
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020279 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020128')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a18')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b18')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c18')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d18')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a18;b18;c18;d18'));
      expect(result[0].get('label')).assertEqual('a18;b18;c18;d18');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020279 end');
    })

    /**
     * @tc.name   testConv020280
     * @tc.number SUB_ASSET_CONV_0280
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020280 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020129')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a19')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b19')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c19')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d19')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a19;b19;c19;d19'));
      expect(result[0].get('label')).assertEqual('a19;b19;c19;d19');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020280 end');
    })

    /**
     * @tc.name   testConv020281
     * @tc.number SUB_ASSET_CONV_0281
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020281 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020130')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a20')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b20')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c20')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d20')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a20;b20;c20;d20'));
      expect(result[0].get('label')).assertEqual('a20;b20;c20;d20');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020281 end');
    })

    /**
     * @tc.name   testConv020282
     * @tc.number SUB_ASSET_CONV_0282
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020282 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020131')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a21')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b21')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c21')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d21')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a21;b21;c21;d21'));
      expect(result[0].get('label')).assertEqual('a21;b21;c21;d21');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020282 end');
    })

    /**
     * @tc.name   testConv020283
     * @tc.number SUB_ASSET_CONV_0283
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020283 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020132')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a22')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b22')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c22')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d22')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a22;b22;c22;d22'));
      expect(result[0].get('label')).assertEqual('a22;b22;c22;d22');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020283 end');
    })

    /**
     * @tc.name   testConv020284
     * @tc.number SUB_ASSET_CONV_0284
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020284 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020133')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a23')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b23')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c23')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d23')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a23;b23;c23;d23'));
      expect(result[0].get('label')).assertEqual('a23;b23;c23;d23');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020284 end');
    })

    /**
     * @tc.name   testConv020285
     * @tc.number SUB_ASSET_CONV_0285
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020285 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020134')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a24')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b24')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c24')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d24')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a24;b24;c24;d24'));
      expect(result[0].get('label')).assertEqual('a24;b24;c24;d24');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020285 end');
    })

    /**
     * @tc.name   testConv020286
     * @tc.number SUB_ASSET_CONV_0286
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020286 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020135')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a25')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b25')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c25')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d25')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a25;b25;c25;d25'));
      expect(result[0].get('label')).assertEqual('a25;b25;c25;d25');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020286 end');
    })

    /**
     * @tc.name   testConv020287
     * @tc.number SUB_ASSET_CONV_0287
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020287 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020136')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a26')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b26')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c26')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d26')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a26;b26;c26;d26'));
      expect(result[0].get('label')).assertEqual('a26;b26;c26;d26');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020287 end');
    })

    /**
     * @tc.name   testConv020288
     * @tc.number SUB_ASSET_CONV_0288
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020288 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020137')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a27')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b27')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c27')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d27')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a27;b27;c27;d27'));
      expect(result[0].get('label')).assertEqual('a27;b27;c27;d27');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020288 end');
    })

    /**
     * @tc.name   testConv020289
     * @tc.number SUB_ASSET_CONV_0289
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020289 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020138')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a28')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b28')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c28')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d28')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a28;b28;c28;d28'));
      expect(result[0].get('label')).assertEqual('a28;b28;c28;d28');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020289 end');
    })

    /**
     * @tc.name   testConv020290
     * @tc.number SUB_ASSET_CONV_0290
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020290 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020139')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a29')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b29')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c29')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('d29')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('a29;b29;c29;d29'));
      expect(result[0].get('label')).assertEqual('a29;b29;c29;d29');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020290 end');
    })

    /**
     * @tc.name   testConv020291
     * @tc.number SUB_ASSET_CONV_0291
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020291 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020140')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签0')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签0;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签0;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020291 end');
    })

    /**
     * @tc.name   testConv020292
     * @tc.number SUB_ASSET_CONV_0292
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020292 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020141')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签1')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签1;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签1;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020292 end');
    })

    /**
     * @tc.name   testConv020293
     * @tc.number SUB_ASSET_CONV_0293
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020293 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020142')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签2')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签2;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签2;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020293 end');
    })

    /**
     * @tc.name   testConv020294
     * @tc.number SUB_ASSET_CONV_0294
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020294 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020143')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签3')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签3;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签3;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020294 end');
    })

    /**
     * @tc.name   testConv020295
     * @tc.number SUB_ASSET_CONV_0295
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020295 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020144')],
        [asset.Tag.SECRET, stringToArray('p1')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签4')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('p1'));
      expect(result[0].get('secret')).assertEqual('p1');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签4;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签4;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020295 end');
    })

    /**
     * @tc.name   testConv020296
     * @tc.number SUB_ASSET_CONV_0296
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020296 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020145')],
        [asset.Tag.SECRET, stringToArray('password8')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签5')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('password8'));
      expect(result[0].get('secret')).assertEqual('password8');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签5;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签5;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020296 end');
    })

    /**
     * @tc.name   testConv020297
     * @tc.number SUB_ASSET_CONV_0297
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020297 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020146')],
        [asset.Tag.SECRET, stringToArray('pwd_16_chars_123')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签6')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd_16_chars_123'));
      expect(result[0].get('secret')).assertEqual('pwd_16_chars_123');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签6;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签6;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020297 end');
    })

    /**
     * @tc.name   testConv020298
     * @tc.number SUB_ASSET_CONV_0298
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020298 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020147')],
        [asset.Tag.SECRET, stringToArray('中文密码')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签7')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('中文密码'));
      expect(result[0].get('secret')).assertEqual('中文密码');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签7;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签7;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020298 end');
    })

    /**
     * @tc.name   testConv020299
     * @tc.number SUB_ASSET_CONV_0299
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020299 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020148')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('pwd@#$%^&*()'));
      expect(result[0].get('secret')).assertEqual('pwd@#$%^&*()');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签8;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签8;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020299 end');
    })

    /**
     * @tc.name   testConv020300
     * @tc.number SUB_ASSET_CONV_0300
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020300 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv020149')],
        [asset.Tag.SECRET, stringToArray('12345678')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('标签9')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('123')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('@#$')]
      ])];
      const result: Map<string, string>[] = convertAssetList(assetList, accountList);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('secret')),
        String('12345678'));
      expect(result[0].get('secret')).assertEqual('12345678');
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(result[0].get('label')),
        String('标签9;123;@#$'));
      expect(result[0].get('label')).assertEqual('标签9;123;@#$');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv020300 end');
    })

  })
}
