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

export default function convVolume03() {
  describe('ConvVolume03Test', () => {

    /**
     * @tc.name   testConv030301
     * @tc.number SUB_ASSET_CONV_0301
     * @tc.desc   双标签资产转换后 secret 解码回读且标签按序连接
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030301 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030301 end');
    })

    /**
     * @tc.name   testConv030302
     * @tc.number SUB_ASSET_CONV_0302
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030302 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030001')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030302 end');
    })

    /**
     * @tc.name   testConv030303
     * @tc.number SUB_ASSET_CONV_0303
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030303 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030002')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030303 end');
    })

    /**
     * @tc.name   testConv030304
     * @tc.number SUB_ASSET_CONV_0304
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030304 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030003')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030304 end');
    })

    /**
     * @tc.name   testConv030305
     * @tc.number SUB_ASSET_CONV_0305
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030305 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030004')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030305 end');
    })

    /**
     * @tc.name   testConv030306
     * @tc.number SUB_ASSET_CONV_0306
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030306 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030005')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030306 end');
    })

    /**
     * @tc.name   testConv030307
     * @tc.number SUB_ASSET_CONV_0307
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030307 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030006')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030307 end');
    })

    /**
     * @tc.name   testConv030308
     * @tc.number SUB_ASSET_CONV_0308
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030308 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030007')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030308 end');
    })

    /**
     * @tc.name   testConv030309
     * @tc.number SUB_ASSET_CONV_0309
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030309 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030008')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030309 end');
    })

    /**
     * @tc.name   testConv030310
     * @tc.number SUB_ASSET_CONV_0310
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030310 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030009')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030310 end');
    })

    /**
     * @tc.name   testConv030311
     * @tc.number SUB_ASSET_CONV_0311
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030311 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030010')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030311 end');
    })

    /**
     * @tc.name   testConv030312
     * @tc.number SUB_ASSET_CONV_0312
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030312 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030011')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030312 end');
    })

    /**
     * @tc.name   testConv030313
     * @tc.number SUB_ASSET_CONV_0313
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030313 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030012')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030313 end');
    })

    /**
     * @tc.name   testConv030314
     * @tc.number SUB_ASSET_CONV_0314
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030314 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030013')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030314 end');
    })

    /**
     * @tc.name   testConv030315
     * @tc.number SUB_ASSET_CONV_0315
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030315 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030014')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030315 end');
    })

    /**
     * @tc.name   testConv030316
     * @tc.number SUB_ASSET_CONV_0316
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030316 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030015')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030316 end');
    })

    /**
     * @tc.name   testConv030317
     * @tc.number SUB_ASSET_CONV_0317
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030317 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030016')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030317 end');
    })

    /**
     * @tc.name   testConv030318
     * @tc.number SUB_ASSET_CONV_0318
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030318 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030017')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030318 end');
    })

    /**
     * @tc.name   testConv030319
     * @tc.number SUB_ASSET_CONV_0319
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030319 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030018')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030319 end');
    })

    /**
     * @tc.name   testConv030320
     * @tc.number SUB_ASSET_CONV_0320
     * @tc.desc   边界值：无标签资产转换后标签为空
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030320 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030019')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030320 end');
    })

    /**
     * @tc.name   testConv030321
     * @tc.number SUB_ASSET_CONV_0321
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030321 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030020')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030321 end');
    })

    /**
     * @tc.name   testConv030322
     * @tc.number SUB_ASSET_CONV_0322
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030322 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030021')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030322 end');
    })

    /**
     * @tc.name   testConv030323
     * @tc.number SUB_ASSET_CONV_0323
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030323 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030022')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030323 end');
    })

    /**
     * @tc.name   testConv030324
     * @tc.number SUB_ASSET_CONV_0324
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030324 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030023')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030324 end');
    })

    /**
     * @tc.name   testConv030325
     * @tc.number SUB_ASSET_CONV_0325
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030325 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030024')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030325 end');
    })

    /**
     * @tc.name   testConv030326
     * @tc.number SUB_ASSET_CONV_0326
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030326 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030025')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030326 end');
    })

    /**
     * @tc.name   testConv030327
     * @tc.number SUB_ASSET_CONV_0327
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030327 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030026')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030327 end');
    })

    /**
     * @tc.name   testConv030328
     * @tc.number SUB_ASSET_CONV_0328
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030328 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030027')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030328 end');
    })

    /**
     * @tc.name   testConv030329
     * @tc.number SUB_ASSET_CONV_0329
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030329 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030028')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030329 end');
    })

    /**
     * @tc.name   testConv030330
     * @tc.number SUB_ASSET_CONV_0330
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030330 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030029')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030330 end');
    })

    /**
     * @tc.name   testConv030331
     * @tc.number SUB_ASSET_CONV_0331
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030331 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030030')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030331 end');
    })

    /**
     * @tc.name   testConv030332
     * @tc.number SUB_ASSET_CONV_0332
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030332 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030031')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030332 end');
    })

    /**
     * @tc.name   testConv030333
     * @tc.number SUB_ASSET_CONV_0333
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030333 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030032')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030333 end');
    })

    /**
     * @tc.name   testConv030334
     * @tc.number SUB_ASSET_CONV_0334
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030334 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030033')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030334 end');
    })

    /**
     * @tc.name   testConv030335
     * @tc.number SUB_ASSET_CONV_0335
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030335 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030034')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030335 end');
    })

    /**
     * @tc.name   testConv030336
     * @tc.number SUB_ASSET_CONV_0336
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030336 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030035')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030336 end');
    })

    /**
     * @tc.name   testConv030337
     * @tc.number SUB_ASSET_CONV_0337
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030337 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030036')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030337 end');
    })

    /**
     * @tc.name   testConv030338
     * @tc.number SUB_ASSET_CONV_0338
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030338 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030037')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030338 end');
    })

    /**
     * @tc.name   testConv030339
     * @tc.number SUB_ASSET_CONV_0339
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030339 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030038')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030339 end');
    })

    /**
     * @tc.name   testConv030340
     * @tc.number SUB_ASSET_CONV_0340
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030340 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030039')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030340 end');
    })

    /**
     * @tc.name   testConv030341
     * @tc.number SUB_ASSET_CONV_0341
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030341 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030040')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030341 end');
    })

    /**
     * @tc.name   testConv030342
     * @tc.number SUB_ASSET_CONV_0342
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030342 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030041')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030342 end');
    })

    /**
     * @tc.name   testConv030343
     * @tc.number SUB_ASSET_CONV_0343
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030343 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030042')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030343 end');
    })

    /**
     * @tc.name   testConv030344
     * @tc.number SUB_ASSET_CONV_0344
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030344 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030043')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030344 end');
    })

    /**
     * @tc.name   testConv030345
     * @tc.number SUB_ASSET_CONV_0345
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030345 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030044')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030345 end');
    })

    /**
     * @tc.name   testConv030346
     * @tc.number SUB_ASSET_CONV_0346
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030346 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030045')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030346 end');
    })

    /**
     * @tc.name   testConv030347
     * @tc.number SUB_ASSET_CONV_0347
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030347 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030046')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030347 end');
    })

    /**
     * @tc.name   testConv030348
     * @tc.number SUB_ASSET_CONV_0348
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030348 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030047')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030348 end');
    })

    /**
     * @tc.name   testConv030349
     * @tc.number SUB_ASSET_CONV_0349
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030349 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030048')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030349 end');
    })

    /**
     * @tc.name   testConv030350
     * @tc.number SUB_ASSET_CONV_0350
     * @tc.desc   合法值：单标签资产转换后标签回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030350 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030049')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030350 end');
    })

    /**
     * @tc.name   testConv030351
     * @tc.number SUB_ASSET_CONV_0351
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030351 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030050')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030351 end');
    })

    /**
     * @tc.name   testConv030352
     * @tc.number SUB_ASSET_CONV_0352
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030352 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030051')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030352 end');
    })

    /**
     * @tc.name   testConv030353
     * @tc.number SUB_ASSET_CONV_0353
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030353 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030052')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030353 end');
    })

    /**
     * @tc.name   testConv030354
     * @tc.number SUB_ASSET_CONV_0354
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030354 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030053')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030354 end');
    })

    /**
     * @tc.name   testConv030355
     * @tc.number SUB_ASSET_CONV_0355
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030355 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030054')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030355 end');
    })

    /**
     * @tc.name   testConv030356
     * @tc.number SUB_ASSET_CONV_0356
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030356 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030055')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030356 end');
    })

    /**
     * @tc.name   testConv030357
     * @tc.number SUB_ASSET_CONV_0357
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030357 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030056')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030357 end');
    })

    /**
     * @tc.name   testConv030358
     * @tc.number SUB_ASSET_CONV_0358
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030358 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030057')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030358 end');
    })

    /**
     * @tc.name   testConv030359
     * @tc.number SUB_ASSET_CONV_0359
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030359 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030058')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030359 end');
    })

    /**
     * @tc.name   testConv030360
     * @tc.number SUB_ASSET_CONV_0360
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030360 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030059')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030360 end');
    })

    /**
     * @tc.name   testConv030361
     * @tc.number SUB_ASSET_CONV_0361
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030361 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030060')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030361 end');
    })

    /**
     * @tc.name   testConv030362
     * @tc.number SUB_ASSET_CONV_0362
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030362 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030061')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030362 end');
    })

    /**
     * @tc.name   testConv030363
     * @tc.number SUB_ASSET_CONV_0363
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030363 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030062')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030363 end');
    })

    /**
     * @tc.name   testConv030364
     * @tc.number SUB_ASSET_CONV_0364
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030364 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030063')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030364 end');
    })

    /**
     * @tc.name   testConv030365
     * @tc.number SUB_ASSET_CONV_0365
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030365 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030064')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030365 end');
    })

    /**
     * @tc.name   testConv030366
     * @tc.number SUB_ASSET_CONV_0366
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030366 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030065')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030366 end');
    })

    /**
     * @tc.name   testConv030367
     * @tc.number SUB_ASSET_CONV_0367
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030367 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030066')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030367 end');
    })

    /**
     * @tc.name   testConv030368
     * @tc.number SUB_ASSET_CONV_0368
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030368 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030067')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030368 end');
    })

    /**
     * @tc.name   testConv030369
     * @tc.number SUB_ASSET_CONV_0369
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030369 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030068')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030369 end');
    })

    /**
     * @tc.name   testConv030370
     * @tc.number SUB_ASSET_CONV_0370
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030370 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030069')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030370 end');
    })

    /**
     * @tc.name   testConv030371
     * @tc.number SUB_ASSET_CONV_0371
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030371 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030070')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030371 end');
    })

    /**
     * @tc.name   testConv030372
     * @tc.number SUB_ASSET_CONV_0372
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030372 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030071')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030372 end');
    })

    /**
     * @tc.name   testConv030373
     * @tc.number SUB_ASSET_CONV_0373
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030373 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030072')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030373 end');
    })

    /**
     * @tc.name   testConv030374
     * @tc.number SUB_ASSET_CONV_0374
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030374 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030073')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030374 end');
    })

    /**
     * @tc.name   testConv030375
     * @tc.number SUB_ASSET_CONV_0375
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030375 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030074')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030375 end');
    })

    /**
     * @tc.name   testConv030376
     * @tc.number SUB_ASSET_CONV_0376
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030376 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030075')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030376 end');
    })

    /**
     * @tc.name   testConv030377
     * @tc.number SUB_ASSET_CONV_0377
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030377 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030076')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030377 end');
    })

    /**
     * @tc.name   testConv030378
     * @tc.number SUB_ASSET_CONV_0378
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030378 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030077')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030378 end');
    })

    /**
     * @tc.name   testConv030379
     * @tc.number SUB_ASSET_CONV_0379
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030379 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030078')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030379 end');
    })

    /**
     * @tc.name   testConv030380
     * @tc.number SUB_ASSET_CONV_0380
     * @tc.desc   合法值：双标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030380 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030079')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030380 end');
    })

    /**
     * @tc.name   testConv030381
     * @tc.number SUB_ASSET_CONV_0381
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030381 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030080')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030381 end');
    })

    /**
     * @tc.name   testConv030382
     * @tc.number SUB_ASSET_CONV_0382
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030382 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030081')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030382 end');
    })

    /**
     * @tc.name   testConv030383
     * @tc.number SUB_ASSET_CONV_0383
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030383 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030082')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030383 end');
    })

    /**
     * @tc.name   testConv030384
     * @tc.number SUB_ASSET_CONV_0384
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030384 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030083')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030384 end');
    })

    /**
     * @tc.name   testConv030385
     * @tc.number SUB_ASSET_CONV_0385
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030385 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030084')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030385 end');
    })

    /**
     * @tc.name   testConv030386
     * @tc.number SUB_ASSET_CONV_0386
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030386 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030085')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030386 end');
    })

    /**
     * @tc.name   testConv030387
     * @tc.number SUB_ASSET_CONV_0387
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030387 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030086')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030387 end');
    })

    /**
     * @tc.name   testConv030388
     * @tc.number SUB_ASSET_CONV_0388
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030388 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030087')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030388 end');
    })

    /**
     * @tc.name   testConv030389
     * @tc.number SUB_ASSET_CONV_0389
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030389 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030088')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030389 end');
    })

    /**
     * @tc.name   testConv030390
     * @tc.number SUB_ASSET_CONV_0390
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030390 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030089')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030390 end');
    })

    /**
     * @tc.name   testConv030391
     * @tc.number SUB_ASSET_CONV_0391
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030391 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030090')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030391 end');
    })

    /**
     * @tc.name   testConv030392
     * @tc.number SUB_ASSET_CONV_0392
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030392 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030091')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030392 end');
    })

    /**
     * @tc.name   testConv030393
     * @tc.number SUB_ASSET_CONV_0393
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030393 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030092')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030393 end');
    })

    /**
     * @tc.name   testConv030394
     * @tc.number SUB_ASSET_CONV_0394
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030394 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030093')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030394 end');
    })

    /**
     * @tc.name   testConv030395
     * @tc.number SUB_ASSET_CONV_0395
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030395 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030094')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030395 end');
    })

    /**
     * @tc.name   testConv030396
     * @tc.number SUB_ASSET_CONV_0396
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030396 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030095')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030396 end');
    })

    /**
     * @tc.name   testConv030397
     * @tc.number SUB_ASSET_CONV_0397
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030397 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030096')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030397 end');
    })

    /**
     * @tc.name   testConv030398
     * @tc.number SUB_ASSET_CONV_0398
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030398 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030097')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030398 end');
    })

    /**
     * @tc.name   testConv030399
     * @tc.number SUB_ASSET_CONV_0399
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030399 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030098')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030399 end');
    })

    /**
     * @tc.name   testConv030400
     * @tc.number SUB_ASSET_CONV_0400
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030400 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030099')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030400 end');
    })

    /**
     * @tc.name   testConv030401
     * @tc.number SUB_ASSET_CONV_0401
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030401 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030100')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030401 end');
    })

    /**
     * @tc.name   testConv030402
     * @tc.number SUB_ASSET_CONV_0402
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030402 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030101')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030402 end');
    })

    /**
     * @tc.name   testConv030403
     * @tc.number SUB_ASSET_CONV_0403
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030403 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030102')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030403 end');
    })

    /**
     * @tc.name   testConv030404
     * @tc.number SUB_ASSET_CONV_0404
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030404 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030103')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030404 end');
    })

    /**
     * @tc.name   testConv030405
     * @tc.number SUB_ASSET_CONV_0405
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030405 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030104')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030405 end');
    })

    /**
     * @tc.name   testConv030406
     * @tc.number SUB_ASSET_CONV_0406
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030406 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030105')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030406 end');
    })

    /**
     * @tc.name   testConv030407
     * @tc.number SUB_ASSET_CONV_0407
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030407 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030106')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030407 end');
    })

    /**
     * @tc.name   testConv030408
     * @tc.number SUB_ASSET_CONV_0408
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030408 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030107')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030408 end');
    })

    /**
     * @tc.name   testConv030409
     * @tc.number SUB_ASSET_CONV_0409
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030409 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030108')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030409 end');
    })

    /**
     * @tc.name   testConv030410
     * @tc.number SUB_ASSET_CONV_0410
     * @tc.desc   合法值：三标签资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030410 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030109')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030410 end');
    })

    /**
     * @tc.name   testConv030411
     * @tc.number SUB_ASSET_CONV_0411
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030411 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030110')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030411 end');
    })

    /**
     * @tc.name   testConv030412
     * @tc.number SUB_ASSET_CONV_0412
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030412 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030111')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030412 end');
    })

    /**
     * @tc.name   testConv030413
     * @tc.number SUB_ASSET_CONV_0413
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030413 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030112')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030413 end');
    })

    /**
     * @tc.name   testConv030414
     * @tc.number SUB_ASSET_CONV_0414
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030414 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030113')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030414 end');
    })

    /**
     * @tc.name   testConv030415
     * @tc.number SUB_ASSET_CONV_0415
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030415 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030114')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030415 end');
    })

    /**
     * @tc.name   testConv030416
     * @tc.number SUB_ASSET_CONV_0416
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030416 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030115')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030416 end');
    })

    /**
     * @tc.name   testConv030417
     * @tc.number SUB_ASSET_CONV_0417
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030417 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030116')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030417 end');
    })

    /**
     * @tc.name   testConv030418
     * @tc.number SUB_ASSET_CONV_0418
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030418 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030117')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030418 end');
    })

    /**
     * @tc.name   testConv030419
     * @tc.number SUB_ASSET_CONV_0419
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030419 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030118')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030419 end');
    })

    /**
     * @tc.name   testConv030420
     * @tc.number SUB_ASSET_CONV_0420
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030420 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030119')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030420 end');
    })

    /**
     * @tc.name   testConv030421
     * @tc.number SUB_ASSET_CONV_0421
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030421 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030120')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030421 end');
    })

    /**
     * @tc.name   testConv030422
     * @tc.number SUB_ASSET_CONV_0422
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030422 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030121')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030422 end');
    })

    /**
     * @tc.name   testConv030423
     * @tc.number SUB_ASSET_CONV_0423
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030423 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030122')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030423 end');
    })

    /**
     * @tc.name   testConv030424
     * @tc.number SUB_ASSET_CONV_0424
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030424 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030123')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030424 end');
    })

    /**
     * @tc.name   testConv030425
     * @tc.number SUB_ASSET_CONV_0425
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030425 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030124')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030425 end');
    })

    /**
     * @tc.name   testConv030426
     * @tc.number SUB_ASSET_CONV_0426
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030426 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030125')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030426 end');
    })

    /**
     * @tc.name   testConv030427
     * @tc.number SUB_ASSET_CONV_0427
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030427 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030126')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030427 end');
    })

    /**
     * @tc.name   testConv030428
     * @tc.number SUB_ASSET_CONV_0428
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030428 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030127')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030428 end');
    })

    /**
     * @tc.name   testConv030429
     * @tc.number SUB_ASSET_CONV_0429
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030429 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030128')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030429 end');
    })

    /**
     * @tc.name   testConv030430
     * @tc.number SUB_ASSET_CONV_0430
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030430 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030129')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030430 end');
    })

    /**
     * @tc.name   testConv030431
     * @tc.number SUB_ASSET_CONV_0431
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030431 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030130')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030431 end');
    })

    /**
     * @tc.name   testConv030432
     * @tc.number SUB_ASSET_CONV_0432
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030432 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030131')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030432 end');
    })

    /**
     * @tc.name   testConv030433
     * @tc.number SUB_ASSET_CONV_0433
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030433 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030132')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030433 end');
    })

    /**
     * @tc.name   testConv030434
     * @tc.number SUB_ASSET_CONV_0434
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030434 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030133')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030434 end');
    })

    /**
     * @tc.name   testConv030435
     * @tc.number SUB_ASSET_CONV_0435
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030435 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030134')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030435 end');
    })

    /**
     * @tc.name   testConv030436
     * @tc.number SUB_ASSET_CONV_0436
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030436 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030135')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030436 end');
    })

    /**
     * @tc.name   testConv030437
     * @tc.number SUB_ASSET_CONV_0437
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030437 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030136')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030437 end');
    })

    /**
     * @tc.name   testConv030438
     * @tc.number SUB_ASSET_CONV_0438
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030438 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030137')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030438 end');
    })

    /**
     * @tc.name   testConv030439
     * @tc.number SUB_ASSET_CONV_0439
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030439 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030138')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030439 end');
    })

    /**
     * @tc.name   testConv030440
     * @tc.number SUB_ASSET_CONV_0440
     * @tc.desc   边界值：四标签上界资产转换后标签按序回读
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030440 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030139')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030440 end');
    })

    /**
     * @tc.name   testConv030441
     * @tc.number SUB_ASSET_CONV_0441
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030441 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030140')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030441 end');
    })

    /**
     * @tc.name   testConv030442
     * @tc.number SUB_ASSET_CONV_0442
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030442 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030141')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030442 end');
    })

    /**
     * @tc.name   testConv030443
     * @tc.number SUB_ASSET_CONV_0443
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030443 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030142')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030443 end');
    })

    /**
     * @tc.name   testConv030444
     * @tc.number SUB_ASSET_CONV_0444
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030444 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030143')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030444 end');
    })

    /**
     * @tc.name   testConv030445
     * @tc.number SUB_ASSET_CONV_0445
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030445 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030144')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030445 end');
    })

    /**
     * @tc.name   testConv030446
     * @tc.number SUB_ASSET_CONV_0446
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030446 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030145')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030446 end');
    })

    /**
     * @tc.name   testConv030447
     * @tc.number SUB_ASSET_CONV_0447
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030447 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030146')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030447 end');
    })

    /**
     * @tc.name   testConv030448
     * @tc.number SUB_ASSET_CONV_0448
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030448 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030147')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030448 end');
    })

    /**
     * @tc.name   testConv030449
     * @tc.number SUB_ASSET_CONV_0449
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030449 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030148')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030449 end');
    })

    /**
     * @tc.name   testConv030450
     * @tc.number SUB_ASSET_CONV_0450
     * @tc.desc   组合值：中文数字符号混合标签转换
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testConv030450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030450 begin');
      const accountList: Map<string, string>[] = new Array<Map<string, string>>();
      const assetList: asset.AssetMap[] = [new Map([
        [asset.Tag.ALIAS, stringToArray('uCv030149')],
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testConv030450 end');
    })

  })
}
