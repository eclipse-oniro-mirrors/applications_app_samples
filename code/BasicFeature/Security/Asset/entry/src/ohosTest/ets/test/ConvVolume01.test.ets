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

export default function convVolume01() {
  describe('ConvVolume01Test', () => {

    /**
     * @tc.name   testConv010001
     * @tc.number SUB_ASSET_CONV_0001
     * @tc.desc   双标签资产转换后 secret 解码回读且标签按序连接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010001 end');
    })

    /**
     * @tc.name   testConv010002
     * @tc.number SUB_ASSET_CONV_0002
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010002 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010001')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010002 end');
    })

    /**
     * @tc.name   testConv010003
     * @tc.number SUB_ASSET_CONV_0003
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010003 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010002')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010003 end');
    })

    /**
     * @tc.name   testConv010004
     * @tc.number SUB_ASSET_CONV_0004
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010004 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010003')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010004 end');
    })

    /**
     * @tc.name   testConv010005
     * @tc.number SUB_ASSET_CONV_0005
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010005 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010004')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010005 end');
    })

    /**
     * @tc.name   testConv010006
     * @tc.number SUB_ASSET_CONV_0006
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010006 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010005')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010006 end');
    })

    /**
     * @tc.name   testConv010007
     * @tc.number SUB_ASSET_CONV_0007
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010007 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010006')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010007 end');
    })

    /**
     * @tc.name   testConv010008
     * @tc.number SUB_ASSET_CONV_0008
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010008 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010007')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010008 end');
    })

    /**
     * @tc.name   testConv010009
     * @tc.number SUB_ASSET_CONV_0009
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010009 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010008')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010009 end');
    })

    /**
     * @tc.name   testConv010010
     * @tc.number SUB_ASSET_CONV_0010
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010010 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010009')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010010 end');
    })

    /**
     * @tc.name   testConv010011
     * @tc.number SUB_ASSET_CONV_0011
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010011 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010010')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010011 end');
    })

    /**
     * @tc.name   testConv010012
     * @tc.number SUB_ASSET_CONV_0012
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010012 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010011')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010012 end');
    })

    /**
     * @tc.name   testConv010013
     * @tc.number SUB_ASSET_CONV_0013
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010013 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010012')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010013 end');
    })

    /**
     * @tc.name   testConv010014
     * @tc.number SUB_ASSET_CONV_0014
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010014 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010013')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010014 end');
    })

    /**
     * @tc.name   testConv010015
     * @tc.number SUB_ASSET_CONV_0015
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010015 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010014')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010015 end');
    })

    /**
     * @tc.name   testConv010016
     * @tc.number SUB_ASSET_CONV_0016
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010016 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010015')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010016 end');
    })

    /**
     * @tc.name   testConv010017
     * @tc.number SUB_ASSET_CONV_0017
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010017 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010016')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010017 end');
    })

    /**
     * @tc.name   testConv010018
     * @tc.number SUB_ASSET_CONV_0018
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010018 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010017')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010018 end');
    })

    /**
     * @tc.name   testConv010019
     * @tc.number SUB_ASSET_CONV_0019
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010019 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010018')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010019 end');
    })

    /**
     * @tc.name   testConv010020
     * @tc.number SUB_ASSET_CONV_0020
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010020 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010019')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010020 end');
    })

    /**
     * @tc.name   testConv010021
     * @tc.number SUB_ASSET_CONV_0021
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010021 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010020')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010021 end');
    })

    /**
     * @tc.name   testConv010022
     * @tc.number SUB_ASSET_CONV_0022
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010022 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010021')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010022 end');
    })

    /**
     * @tc.name   testConv010023
     * @tc.number SUB_ASSET_CONV_0023
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010023 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010022')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010023 end');
    })

    /**
     * @tc.name   testConv010024
     * @tc.number SUB_ASSET_CONV_0024
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010024 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010023')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010024 end');
    })

    /**
     * @tc.name   testConv010025
     * @tc.number SUB_ASSET_CONV_0025
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010025 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010024')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010025 end');
    })

    /**
     * @tc.name   testConv010026
     * @tc.number SUB_ASSET_CONV_0026
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010026 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010025')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010026 end');
    })

    /**
     * @tc.name   testConv010027
     * @tc.number SUB_ASSET_CONV_0027
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010027 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010026')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010027 end');
    })

    /**
     * @tc.name   testConv010028
     * @tc.number SUB_ASSET_CONV_0028
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010028 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010027')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010028 end');
    })

    /**
     * @tc.name   testConv010029
     * @tc.number SUB_ASSET_CONV_0029
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010029 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010028')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010029 end');
    })

    /**
     * @tc.name   testConv010030
     * @tc.number SUB_ASSET_CONV_0030
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010030 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010029')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010030 end');
    })

    /**
     * @tc.name   testConv010031
     * @tc.number SUB_ASSET_CONV_0031
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010031 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010030')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010031 end');
    })

    /**
     * @tc.name   testConv010032
     * @tc.number SUB_ASSET_CONV_0032
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010032 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010031')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010032 end');
    })

    /**
     * @tc.name   testConv010033
     * @tc.number SUB_ASSET_CONV_0033
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010033 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010032')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010033 end');
    })

    /**
     * @tc.name   testConv010034
     * @tc.number SUB_ASSET_CONV_0034
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010034 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010033')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010034 end');
    })

    /**
     * @tc.name   testConv010035
     * @tc.number SUB_ASSET_CONV_0035
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010035 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010034')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010035 end');
    })

    /**
     * @tc.name   testConv010036
     * @tc.number SUB_ASSET_CONV_0036
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010036 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010035')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010036 end');
    })

    /**
     * @tc.name   testConv010037
     * @tc.number SUB_ASSET_CONV_0037
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010037 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010036')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010037 end');
    })

    /**
     * @tc.name   testConv010038
     * @tc.number SUB_ASSET_CONV_0038
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010038 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010037')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010038 end');
    })

    /**
     * @tc.name   testConv010039
     * @tc.number SUB_ASSET_CONV_0039
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010039 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010038')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010039 end');
    })

    /**
     * @tc.name   testConv010040
     * @tc.number SUB_ASSET_CONV_0040
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010040 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010039')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010040 end');
    })

    /**
     * @tc.name   testConv010041
     * @tc.number SUB_ASSET_CONV_0041
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010041 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010040')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010041 end');
    })

    /**
     * @tc.name   testConv010042
     * @tc.number SUB_ASSET_CONV_0042
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010042 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010041')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010042 end');
    })

    /**
     * @tc.name   testConv010043
     * @tc.number SUB_ASSET_CONV_0043
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010043 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010042')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010043 end');
    })

    /**
     * @tc.name   testConv010044
     * @tc.number SUB_ASSET_CONV_0044
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010044 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010043')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010044 end');
    })

    /**
     * @tc.name   testConv010045
     * @tc.number SUB_ASSET_CONV_0045
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010045 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010044')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010045 end');
    })

    /**
     * @tc.name   testConv010046
     * @tc.number SUB_ASSET_CONV_0046
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010046 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010045')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010046 end');
    })

    /**
     * @tc.name   testConv010047
     * @tc.number SUB_ASSET_CONV_0047
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010047 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010046')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010047 end');
    })

    /**
     * @tc.name   testConv010048
     * @tc.number SUB_ASSET_CONV_0048
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010048 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010047')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010048 end');
    })

    /**
     * @tc.name   testConv010049
     * @tc.number SUB_ASSET_CONV_0049
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010049 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010048')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010049 end');
    })

    /**
     * @tc.name   testConv010050
     * @tc.number SUB_ASSET_CONV_0050
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010050 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010049')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010050 end');
    })

    /**
     * @tc.name   testConv010051
     * @tc.number SUB_ASSET_CONV_0051
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010051 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010050')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010051 end');
    })

    /**
     * @tc.name   testConv010052
     * @tc.number SUB_ASSET_CONV_0052
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010052 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010051')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010052 end');
    })

    /**
     * @tc.name   testConv010053
     * @tc.number SUB_ASSET_CONV_0053
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010053 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010052')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010053 end');
    })

    /**
     * @tc.name   testConv010054
     * @tc.number SUB_ASSET_CONV_0054
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010054 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010053')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010054 end');
    })

    /**
     * @tc.name   testConv010055
     * @tc.number SUB_ASSET_CONV_0055
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010055 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010054')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010055 end');
    })

    /**
     * @tc.name   testConv010056
     * @tc.number SUB_ASSET_CONV_0056
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010056 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010055')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010056 end');
    })

    /**
     * @tc.name   testConv010057
     * @tc.number SUB_ASSET_CONV_0057
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010057 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010056')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010057 end');
    })

    /**
     * @tc.name   testConv010058
     * @tc.number SUB_ASSET_CONV_0058
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010058 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010057')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010058 end');
    })

    /**
     * @tc.name   testConv010059
     * @tc.number SUB_ASSET_CONV_0059
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010059 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010058')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010059 end');
    })

    /**
     * @tc.name   testConv010060
     * @tc.number SUB_ASSET_CONV_0060
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010060 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010059')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010060 end');
    })

    /**
     * @tc.name   testConv010061
     * @tc.number SUB_ASSET_CONV_0061
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010061 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010060')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010061 end');
    })

    /**
     * @tc.name   testConv010062
     * @tc.number SUB_ASSET_CONV_0062
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010062 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010061')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010062 end');
    })

    /**
     * @tc.name   testConv010063
     * @tc.number SUB_ASSET_CONV_0063
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010063 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010062')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010063 end');
    })

    /**
     * @tc.name   testConv010064
     * @tc.number SUB_ASSET_CONV_0064
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010064 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010063')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010064 end');
    })

    /**
     * @tc.name   testConv010065
     * @tc.number SUB_ASSET_CONV_0065
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010065 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010064')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010065 end');
    })

    /**
     * @tc.name   testConv010066
     * @tc.number SUB_ASSET_CONV_0066
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010066 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010065')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010066 end');
    })

    /**
     * @tc.name   testConv010067
     * @tc.number SUB_ASSET_CONV_0067
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010067 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010066')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010067 end');
    })

    /**
     * @tc.name   testConv010068
     * @tc.number SUB_ASSET_CONV_0068
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010068 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010067')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010068 end');
    })

    /**
     * @tc.name   testConv010069
     * @tc.number SUB_ASSET_CONV_0069
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010069 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010068')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010069 end');
    })

    /**
     * @tc.name   testConv010070
     * @tc.number SUB_ASSET_CONV_0070
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010070 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010069')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010070 end');
    })

    /**
     * @tc.name   testConv010071
     * @tc.number SUB_ASSET_CONV_0071
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010071 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010070')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010071 end');
    })

    /**
     * @tc.name   testConv010072
     * @tc.number SUB_ASSET_CONV_0072
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010072 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010071')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010072 end');
    })

    /**
     * @tc.name   testConv010073
     * @tc.number SUB_ASSET_CONV_0073
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010073 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010072')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010073 end');
    })

    /**
     * @tc.name   testConv010074
     * @tc.number SUB_ASSET_CONV_0074
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010074 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010073')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010074 end');
    })

    /**
     * @tc.name   testConv010075
     * @tc.number SUB_ASSET_CONV_0075
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010075 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010074')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010075 end');
    })

    /**
     * @tc.name   testConv010076
     * @tc.number SUB_ASSET_CONV_0076
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010076 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010075')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010076 end');
    })

    /**
     * @tc.name   testConv010077
     * @tc.number SUB_ASSET_CONV_0077
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010077 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010076')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010077 end');
    })

    /**
     * @tc.name   testConv010078
     * @tc.number SUB_ASSET_CONV_0078
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010078 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010077')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010078 end');
    })

    /**
     * @tc.name   testConv010079
     * @tc.number SUB_ASSET_CONV_0079
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010079 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010078')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010079 end');
    })

    /**
     * @tc.name   testConv010080
     * @tc.number SUB_ASSET_CONV_0080
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010080 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010079')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010080 end');
    })

    /**
     * @tc.name   testConv010081
     * @tc.number SUB_ASSET_CONV_0081
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010081 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010080')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010081 end');
    })

    /**
     * @tc.name   testConv010082
     * @tc.number SUB_ASSET_CONV_0082
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010082 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010081')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010082 end');
    })

    /**
     * @tc.name   testConv010083
     * @tc.number SUB_ASSET_CONV_0083
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010083 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010082')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010083 end');
    })

    /**
     * @tc.name   testConv010084
     * @tc.number SUB_ASSET_CONV_0084
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010084 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010083')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010084 end');
    })

    /**
     * @tc.name   testConv010085
     * @tc.number SUB_ASSET_CONV_0085
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010085 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010084')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010085 end');
    })

    /**
     * @tc.name   testConv010086
     * @tc.number SUB_ASSET_CONV_0086
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010086 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010085')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010086 end');
    })

    /**
     * @tc.name   testConv010087
     * @tc.number SUB_ASSET_CONV_0087
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010087 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010086')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010087 end');
    })

    /**
     * @tc.name   testConv010088
     * @tc.number SUB_ASSET_CONV_0088
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010088 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010087')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010088 end');
    })

    /**
     * @tc.name   testConv010089
     * @tc.number SUB_ASSET_CONV_0089
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010089 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010088')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010089 end');
    })

    /**
     * @tc.name   testConv010090
     * @tc.number SUB_ASSET_CONV_0090
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010090 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010089')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010090 end');
    })

    /**
     * @tc.name   testConv010091
     * @tc.number SUB_ASSET_CONV_0091
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010091 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010090')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010091 end');
    })

    /**
     * @tc.name   testConv010092
     * @tc.number SUB_ASSET_CONV_0092
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010092 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010091')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010092 end');
    })

    /**
     * @tc.name   testConv010093
     * @tc.number SUB_ASSET_CONV_0093
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010093 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010092')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010093 end');
    })

    /**
     * @tc.name   testConv010094
     * @tc.number SUB_ASSET_CONV_0094
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010094 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010093')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010094 end');
    })

    /**
     * @tc.name   testConv010095
     * @tc.number SUB_ASSET_CONV_0095
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010095 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010094')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010095 end');
    })

    /**
     * @tc.name   testConv010096
     * @tc.number SUB_ASSET_CONV_0096
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010096 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010095')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010096 end');
    })

    /**
     * @tc.name   testConv010097
     * @tc.number SUB_ASSET_CONV_0097
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010097 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010096')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010097 end');
    })

    /**
     * @tc.name   testConv010098
     * @tc.number SUB_ASSET_CONV_0098
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010098 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010097')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010098 end');
    })

    /**
     * @tc.name   testConv010099
     * @tc.number SUB_ASSET_CONV_0099
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010099 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010098')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010099 end');
    })

    /**
     * @tc.name   testConv010100
     * @tc.number SUB_ASSET_CONV_0100
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010100 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010099')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010100 end');
    })

    /**
     * @tc.name   testConv010101
     * @tc.number SUB_ASSET_CONV_0101
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010101 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010100')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010101 end');
    })

    /**
     * @tc.name   testConv010102
     * @tc.number SUB_ASSET_CONV_0102
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010102 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010101')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010102 end');
    })

    /**
     * @tc.name   testConv010103
     * @tc.number SUB_ASSET_CONV_0103
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010103 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010102')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010103 end');
    })

    /**
     * @tc.name   testConv010104
     * @tc.number SUB_ASSET_CONV_0104
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010104 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010103')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010104 end');
    })

    /**
     * @tc.name   testConv010105
     * @tc.number SUB_ASSET_CONV_0105
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010105 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010104')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010105 end');
    })

    /**
     * @tc.name   testConv010106
     * @tc.number SUB_ASSET_CONV_0106
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010106 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010105')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010106 end');
    })

    /**
     * @tc.name   testConv010107
     * @tc.number SUB_ASSET_CONV_0107
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010107 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010106')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010107 end');
    })

    /**
     * @tc.name   testConv010108
     * @tc.number SUB_ASSET_CONV_0108
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010108 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010107')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010108 end');
    })

    /**
     * @tc.name   testConv010109
     * @tc.number SUB_ASSET_CONV_0109
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010109 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010108')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010109 end');
    })

    /**
     * @tc.name   testConv010110
     * @tc.number SUB_ASSET_CONV_0110
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010110 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010109')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010110 end');
    })

    /**
     * @tc.name   testConv010111
     * @tc.number SUB_ASSET_CONV_0111
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010111 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010110')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010111 end');
    })

    /**
     * @tc.name   testConv010112
     * @tc.number SUB_ASSET_CONV_0112
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010112 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010111')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010112 end');
    })

    /**
     * @tc.name   testConv010113
     * @tc.number SUB_ASSET_CONV_0113
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010113 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010112')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010113 end');
    })

    /**
     * @tc.name   testConv010114
     * @tc.number SUB_ASSET_CONV_0114
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010114 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010113')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010114 end');
    })

    /**
     * @tc.name   testConv010115
     * @tc.number SUB_ASSET_CONV_0115
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010115 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010114')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010115 end');
    })

    /**
     * @tc.name   testConv010116
     * @tc.number SUB_ASSET_CONV_0116
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010116 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010115')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010116 end');
    })

    /**
     * @tc.name   testConv010117
     * @tc.number SUB_ASSET_CONV_0117
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010117 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010116')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010117 end');
    })

    /**
     * @tc.name   testConv010118
     * @tc.number SUB_ASSET_CONV_0118
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010118 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010117')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010118 end');
    })

    /**
     * @tc.name   testConv010119
     * @tc.number SUB_ASSET_CONV_0119
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010119 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010118')],
        [asset.Tag.SECRET, stringToArray('pwd@#$%^&*()')],
        [asset.Tag.DATA_LABEL_NORMAL_1, stringToArray('a8')],
        [asset.Tag.DATA_LABEL_NORMAL_2, stringToArray('b8')],
        [asset.Tag.DATA_LABEL_NORMAL_3, stringToArray('c8')],
        [asset.Tag.DATA_LABEL_NORMAL_4, stringToArray('j8')]
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
        String('a8;b8;c8;j8'));
      expect(result[0].get('label')).assertEqual('a8;b8;c8;j8');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010119 end');
    })

    /**
     * @tc.name   testConv010120
     * @tc.number SUB_ASSET_CONV_0120
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010120 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010119')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010120 end');
    })

    /**
     * @tc.name   testConv010121
     * @tc.number SUB_ASSET_CONV_0121
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010121 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010120')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010121 end');
    })

    /**
     * @tc.name   testConv010122
     * @tc.number SUB_ASSET_CONV_0122
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010122 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010121')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010122 end');
    })

    /**
     * @tc.name   testConv010123
     * @tc.number SUB_ASSET_CONV_0123
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010123 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010122')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010123 end');
    })

    /**
     * @tc.name   testConv010124
     * @tc.number SUB_ASSET_CONV_0124
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010124 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010123')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010124 end');
    })

    /**
     * @tc.name   testConv010125
     * @tc.number SUB_ASSET_CONV_0125
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010125 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010124')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010125 end');
    })

    /**
     * @tc.name   testConv010126
     * @tc.number SUB_ASSET_CONV_0126
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010126 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010125')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010126 end');
    })

    /**
     * @tc.name   testConv010127
     * @tc.number SUB_ASSET_CONV_0127
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010127 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010126')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010127 end');
    })

    /**
     * @tc.name   testConv010128
     * @tc.number SUB_ASSET_CONV_0128
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010128 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010127')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010128 end');
    })

    /**
     * @tc.name   testConv010129
     * @tc.number SUB_ASSET_CONV_0129
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010129 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010128')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010129 end');
    })

    /**
     * @tc.name   testConv010130
     * @tc.number SUB_ASSET_CONV_0130
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010130 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010129')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010130 end');
    })

    /**
     * @tc.name   testConv010131
     * @tc.number SUB_ASSET_CONV_0131
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010131 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010130')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010131 end');
    })

    /**
     * @tc.name   testConv010132
     * @tc.number SUB_ASSET_CONV_0132
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010132 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010131')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010132 end');
    })

    /**
     * @tc.name   testConv010133
     * @tc.number SUB_ASSET_CONV_0133
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010133 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010132')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010133 end');
    })

    /**
     * @tc.name   testConv010134
     * @tc.number SUB_ASSET_CONV_0134
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010134 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010133')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010134 end');
    })

    /**
     * @tc.name   testConv010135
     * @tc.number SUB_ASSET_CONV_0135
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010135 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010134')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010135 end');
    })

    /**
     * @tc.name   testConv010136
     * @tc.number SUB_ASSET_CONV_0136
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010136 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010135')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010136 end');
    })

    /**
     * @tc.name   testConv010137
     * @tc.number SUB_ASSET_CONV_0137
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010137 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010136')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010137 end');
    })

    /**
     * @tc.name   testConv010138
     * @tc.number SUB_ASSET_CONV_0138
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010138 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010137')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010138 end');
    })

    /**
     * @tc.name   testConv010139
     * @tc.number SUB_ASSET_CONV_0139
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010139 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010138')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010139 end');
    })

    /**
     * @tc.name   testConv010140
     * @tc.number SUB_ASSET_CONV_0140
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010140 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010139')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010140 end');
    })

    /**
     * @tc.name   testConv010141
     * @tc.number SUB_ASSET_CONV_0141
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010141 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010140')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010141 end');
    })

    /**
     * @tc.name   testConv010142
     * @tc.number SUB_ASSET_CONV_0142
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010142 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010141')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010142 end');
    })

    /**
     * @tc.name   testConv010143
     * @tc.number SUB_ASSET_CONV_0143
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010143 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010142')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010143 end');
    })

    /**
     * @tc.name   testConv010144
     * @tc.number SUB_ASSET_CONV_0144
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010144 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010143')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010144 end');
    })

    /**
     * @tc.name   testConv010145
     * @tc.number SUB_ASSET_CONV_0145
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010145 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010144')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010145 end');
    })

    /**
     * @tc.name   testConv010146
     * @tc.number SUB_ASSET_CONV_0146
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010146 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010145')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010146 end');
    })

    /**
     * @tc.name   testConv010147
     * @tc.number SUB_ASSET_CONV_0147
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010147 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010146')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010147 end');
    })

    /**
     * @tc.name   testConv010148
     * @tc.number SUB_ASSET_CONV_0148
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010148 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010147')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010148 end');
    })

    /**
     * @tc.name   testConv010149
     * @tc.number SUB_ASSET_CONV_0149
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010149 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010148')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010149 end');
    })

    /**
     * @tc.name   testConv010150
     * @tc.number SUB_ASSET_CONV_0150
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010150 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv010149')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv010150 end');
    })

  })
}
