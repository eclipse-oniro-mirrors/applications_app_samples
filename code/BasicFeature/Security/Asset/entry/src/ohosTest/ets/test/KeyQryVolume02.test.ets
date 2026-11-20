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
import { addAssetPromise, queryAssetPromise, removeAssetPromise } from '../../../main/ets/model/AssetModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function keyQryVolume02() {
  describe('KeyQryVolume02Test', () => {

    /**
     * @tc.name   testKeyQry020151
     * @tc.number SUB_ASSET_KEYQRY_0151
     * @tc.desc   多标签 AND 条件查询命中回读 secret，条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020151 begin');
      const alias: string = 'uQryAnchor01';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'anchorPwd', 'tagA;tagB');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, 'tagA;tagB');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual('anchorPwd');
      const rows2: Map<string, string>[] = await queryAssetPromise(alias, 'tagA;missing');
      expect(rows2.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020151 end');
    })

    /**
     * @tc.name   testKeyQry020152
     * @tc.number SUB_ASSET_KEYQRY_0152
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020152 begin');
      await removeAssetPromise('uQry020001', '');
      await addAssetPromise('uQry020001', 'password8', 'g1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020152 end');
    })

    /**
     * @tc.name   testKeyQry020153
     * @tc.number SUB_ASSET_KEYQRY_0153
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020153 begin');
      await removeAssetPromise('uQry020002', '');
      await addAssetPromise('uQry020002', 'pwd_16_chars_123', 'g2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020153 end');
    })

    /**
     * @tc.name   testKeyQry020154
     * @tc.number SUB_ASSET_KEYQRY_0154
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020154 begin');
      await removeAssetPromise('uQry020003', '');
      await addAssetPromise('uQry020003', '中文密码', 'g3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020154 end');
    })

    /**
     * @tc.name   testKeyQry020155
     * @tc.number SUB_ASSET_KEYQRY_0155
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020155 begin');
      await removeAssetPromise('uQry020004', '');
      await addAssetPromise('uQry020004', 'pwd@#$%^&*()', 'g4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020155 end');
    })

    /**
     * @tc.name   testKeyQry020156
     * @tc.number SUB_ASSET_KEYQRY_0156
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020156 begin');
      await removeAssetPromise('uQry020005', '');
      await addAssetPromise('uQry020005', '12345678', 'l5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020156 end');
    })

    /**
     * @tc.name   testKeyQry020157
     * @tc.number SUB_ASSET_KEYQRY_0157
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020157 begin');
      await removeAssetPromise('uQry020006', '');
      await addAssetPromise('uQry020006', 'p1', 'l6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020157 end');
    })

    /**
     * @tc.name   testKeyQry020158
     * @tc.number SUB_ASSET_KEYQRY_0158
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020158 begin');
      await removeAssetPromise('uQry020007', '');
      await addAssetPromise('uQry020007', 'password8', 'l7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020158 end');
    })

    /**
     * @tc.name   testKeyQry020159
     * @tc.number SUB_ASSET_KEYQRY_0159
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020159 begin');
      await removeAssetPromise('uQry020008', '');
      await addAssetPromise('uQry020008', 'pwd_16_chars_123', 'l8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020159 end');
    })

    /**
     * @tc.name   testKeyQry020160
     * @tc.number SUB_ASSET_KEYQRY_0160
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020160 begin');
      await removeAssetPromise('uQry020009', '');
      await addAssetPromise('uQry020009', '中文密码', 'l9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020160 end');
    })

    /**
     * @tc.name   testKeyQry020161
     * @tc.number SUB_ASSET_KEYQRY_0161
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020161 begin');
      await removeAssetPromise('uQry020010', '');
      await addAssetPromise('uQry020010', 'pwd@#$%^&*()', 'l10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020161 end');
    })

    /**
     * @tc.name   testKeyQry020162
     * @tc.number SUB_ASSET_KEYQRY_0162
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020162 begin');
      await removeAssetPromise('uQry020011', '');
      await addAssetPromise('uQry020011', '12345678', 'l11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020162 end');
    })

    /**
     * @tc.name   testKeyQry020163
     * @tc.number SUB_ASSET_KEYQRY_0163
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020163 begin');
      await removeAssetPromise('uQry020012', '');
      await addAssetPromise('uQry020012', 'p1', 'l12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020163 end');
    })

    /**
     * @tc.name   testKeyQry020164
     * @tc.number SUB_ASSET_KEYQRY_0164
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020164 begin');
      await removeAssetPromise('uQry020013', '');
      await addAssetPromise('uQry020013', 'password8', 'l13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020164 end');
    })

    /**
     * @tc.name   testKeyQry020165
     * @tc.number SUB_ASSET_KEYQRY_0165
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020165 begin');
      await removeAssetPromise('uQry020014', '');
      await addAssetPromise('uQry020014', 'pwd_16_chars_123', 'l14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020165 end');
    })

    /**
     * @tc.name   testKeyQry020166
     * @tc.number SUB_ASSET_KEYQRY_0166
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020166 begin');
      await removeAssetPromise('uQry020015', '');
      await addAssetPromise('uQry020015', '中文密码', 'l15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020166 end');
    })

    /**
     * @tc.name   testKeyQry020167
     * @tc.number SUB_ASSET_KEYQRY_0167
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020167 begin');
      await removeAssetPromise('uQry020016', '');
      await addAssetPromise('uQry020016', 'pwd@#$%^&*()', 'l16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020167 end');
    })

    /**
     * @tc.name   testKeyQry020168
     * @tc.number SUB_ASSET_KEYQRY_0168
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020168 begin');
      await removeAssetPromise('uQry020017', '');
      await addAssetPromise('uQry020017', '12345678', 'l17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020168 end');
    })

    /**
     * @tc.name   testKeyQry020169
     * @tc.number SUB_ASSET_KEYQRY_0169
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020169 begin');
      await removeAssetPromise('uQry020018', '');
      await addAssetPromise('uQry020018', 'p1', 'l18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020169 end');
    })

    /**
     * @tc.name   testKeyQry020170
     * @tc.number SUB_ASSET_KEYQRY_0170
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020170 begin');
      await removeAssetPromise('uQry020019', '');
      await addAssetPromise('uQry020019', 'password8', 'l19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020170 end');
    })

    /**
     * @tc.name   testKeyQry020171
     * @tc.number SUB_ASSET_KEYQRY_0171
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020171 begin');
      await removeAssetPromise('uQry020020', '');
      await addAssetPromise('uQry020020', 'pwd_16_chars_123', 'l20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020171 end');
    })

    /**
     * @tc.name   testKeyQry020172
     * @tc.number SUB_ASSET_KEYQRY_0172
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020172 begin');
      await removeAssetPromise('uQry020021', '');
      await addAssetPromise('uQry020021', '中文密码', 'l21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020172 end');
    })

    /**
     * @tc.name   testKeyQry020173
     * @tc.number SUB_ASSET_KEYQRY_0173
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020173 begin');
      await removeAssetPromise('uQry020022', '');
      await addAssetPromise('uQry020022', 'pwd@#$%^&*()', 'l22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020173 end');
    })

    /**
     * @tc.name   testKeyQry020174
     * @tc.number SUB_ASSET_KEYQRY_0174
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020174 begin');
      await removeAssetPromise('uQry020023', '');
      await addAssetPromise('uQry020023', '12345678', 'l23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020174 end');
    })

    /**
     * @tc.name   testKeyQry020175
     * @tc.number SUB_ASSET_KEYQRY_0175
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020175 begin');
      await removeAssetPromise('uQry020024', '');
      await addAssetPromise('uQry020024', 'p1', 'l24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020175 end');
    })

    /**
     * @tc.name   testKeyQry020176
     * @tc.number SUB_ASSET_KEYQRY_0176
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020176 begin');
      await removeAssetPromise('uQry020025', '');
      await addAssetPromise('uQry020025', 'password8', 'l25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020176 end');
    })

    /**
     * @tc.name   testKeyQry020177
     * @tc.number SUB_ASSET_KEYQRY_0177
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020177 begin');
      await removeAssetPromise('uQry020026', '');
      await addAssetPromise('uQry020026', 'pwd_16_chars_123', 'l26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020177 end');
    })

    /**
     * @tc.name   testKeyQry020178
     * @tc.number SUB_ASSET_KEYQRY_0178
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020178 begin');
      await removeAssetPromise('uQry020027', '');
      await addAssetPromise('uQry020027', '中文密码', 'l27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020178 end');
    })

    /**
     * @tc.name   testKeyQry020179
     * @tc.number SUB_ASSET_KEYQRY_0179
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020179 begin');
      await removeAssetPromise('uQry020028', '');
      await addAssetPromise('uQry020028', 'pwd@#$%^&*()', 'l28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020179 end');
    })

    /**
     * @tc.name   testKeyQry020180
     * @tc.number SUB_ASSET_KEYQRY_0180
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020180 begin');
      await removeAssetPromise('uQry020029', '');
      await addAssetPromise('uQry020029', '12345678', 'l29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020180 end');
    })

    /**
     * @tc.name   testKeyQry020181
     * @tc.number SUB_ASSET_KEYQRY_0181
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020181 begin');
      await removeAssetPromise('uQry020030', '');
      await addAssetPromise('uQry020030', 'p1', 't0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020030', 't0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020181 end');
    })

    /**
     * @tc.name   testKeyQry020182
     * @tc.number SUB_ASSET_KEYQRY_0182
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020182 begin');
      await removeAssetPromise('uQry020031', '');
      await addAssetPromise('uQry020031', 'password8', 't1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020031', 't1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020182 end');
    })

    /**
     * @tc.name   testKeyQry020183
     * @tc.number SUB_ASSET_KEYQRY_0183
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020183 begin');
      await removeAssetPromise('uQry020032', '');
      await addAssetPromise('uQry020032', 'pwd_16_chars_123', 't2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020032', 't2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020183 end');
    })

    /**
     * @tc.name   testKeyQry020184
     * @tc.number SUB_ASSET_KEYQRY_0184
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020184 begin');
      await removeAssetPromise('uQry020033', '');
      await addAssetPromise('uQry020033', '中文密码', 't3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020033', 't3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020184 end');
    })

    /**
     * @tc.name   testKeyQry020185
     * @tc.number SUB_ASSET_KEYQRY_0185
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020185 begin');
      await removeAssetPromise('uQry020034', '');
      await addAssetPromise('uQry020034', 'pwd@#$%^&*()', 't4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020034', 't4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020185 end');
    })

    /**
     * @tc.name   testKeyQry020186
     * @tc.number SUB_ASSET_KEYQRY_0186
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020186 begin');
      await removeAssetPromise('uQry020035', '');
      await addAssetPromise('uQry020035', '12345678', 't5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020035', 't5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020186 end');
    })

    /**
     * @tc.name   testKeyQry020187
     * @tc.number SUB_ASSET_KEYQRY_0187
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020187 begin');
      await removeAssetPromise('uQry020036', '');
      await addAssetPromise('uQry020036', 'p1', 't6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020036', 't6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020187 end');
    })

    /**
     * @tc.name   testKeyQry020188
     * @tc.number SUB_ASSET_KEYQRY_0188
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020188 begin');
      await removeAssetPromise('uQry020037', '');
      await addAssetPromise('uQry020037', 'password8', 't7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020037', 't7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020188 end');
    })

    /**
     * @tc.name   testKeyQry020189
     * @tc.number SUB_ASSET_KEYQRY_0189
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020189 begin');
      await removeAssetPromise('uQry020038', '');
      await addAssetPromise('uQry020038', 'pwd_16_chars_123', 't8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020038', 't8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020189 end');
    })

    /**
     * @tc.name   testKeyQry020190
     * @tc.number SUB_ASSET_KEYQRY_0190
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020190 begin');
      await removeAssetPromise('uQry020039', '');
      await addAssetPromise('uQry020039', '中文密码', 't9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020039', 't9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020190 end');
    })

    /**
     * @tc.name   testKeyQry020191
     * @tc.number SUB_ASSET_KEYQRY_0191
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020191 begin');
      await removeAssetPromise('uQry020040', '');
      await addAssetPromise('uQry020040', 'pwd@#$%^&*()', 't10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020040', 't10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020191 end');
    })

    /**
     * @tc.name   testKeyQry020192
     * @tc.number SUB_ASSET_KEYQRY_0192
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020192 begin');
      await removeAssetPromise('uQry020041', '');
      await addAssetPromise('uQry020041', '12345678', 't11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020041', 't11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020192 end');
    })

    /**
     * @tc.name   testKeyQry020193
     * @tc.number SUB_ASSET_KEYQRY_0193
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020193 begin');
      await removeAssetPromise('uQry020042', '');
      await addAssetPromise('uQry020042', 'p1', 't12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020042', 't12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020193 end');
    })

    /**
     * @tc.name   testKeyQry020194
     * @tc.number SUB_ASSET_KEYQRY_0194
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020194 begin');
      await removeAssetPromise('uQry020043', '');
      await addAssetPromise('uQry020043', 'password8', 't13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020043', 't13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020194 end');
    })

    /**
     * @tc.name   testKeyQry020195
     * @tc.number SUB_ASSET_KEYQRY_0195
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020195 begin');
      await removeAssetPromise('uQry020044', '');
      await addAssetPromise('uQry020044', 'pwd_16_chars_123', 't14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020044', 't14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020195 end');
    })

    /**
     * @tc.name   testKeyQry020196
     * @tc.number SUB_ASSET_KEYQRY_0196
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020196 begin');
      await removeAssetPromise('uQry020045', '');
      await addAssetPromise('uQry020045', '中文密码', 't15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020045', 't15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020196 end');
    })

    /**
     * @tc.name   testKeyQry020197
     * @tc.number SUB_ASSET_KEYQRY_0197
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020197 begin');
      await removeAssetPromise('uQry020046', '');
      await addAssetPromise('uQry020046', 'pwd@#$%^&*()', 't16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020046', 't16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020197 end');
    })

    /**
     * @tc.name   testKeyQry020198
     * @tc.number SUB_ASSET_KEYQRY_0198
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020198 begin');
      await removeAssetPromise('uQry020047', '');
      await addAssetPromise('uQry020047', '12345678', 't17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020047', 't17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020198 end');
    })

    /**
     * @tc.name   testKeyQry020199
     * @tc.number SUB_ASSET_KEYQRY_0199
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020199 begin');
      await removeAssetPromise('uQry020048', '');
      await addAssetPromise('uQry020048', 'p1', 't18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020048', 't18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020199 end');
    })

    /**
     * @tc.name   testKeyQry020200
     * @tc.number SUB_ASSET_KEYQRY_0200
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020200 begin');
      await removeAssetPromise('uQry020049', '');
      await addAssetPromise('uQry020049', 'password8', 't19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020049', 't19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020200 end');
    })

    /**
     * @tc.name   testKeyQry020201
     * @tc.number SUB_ASSET_KEYQRY_0201
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020201 begin');
      await removeAssetPromise('uQry020050', '');
      await addAssetPromise('uQry020050', 'pwd_16_chars_123', 't20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020050', 't20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020201 end');
    })

    /**
     * @tc.name   testKeyQry020202
     * @tc.number SUB_ASSET_KEYQRY_0202
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020202 begin');
      await removeAssetPromise('uQry020051', '');
      await addAssetPromise('uQry020051', '中文密码', 't21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020051', 't21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020202 end');
    })

    /**
     * @tc.name   testKeyQry020203
     * @tc.number SUB_ASSET_KEYQRY_0203
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020203 begin');
      await removeAssetPromise('uQry020052', '');
      await addAssetPromise('uQry020052', 'pwd@#$%^&*()', 't22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020052', 't22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020203 end');
    })

    /**
     * @tc.name   testKeyQry020204
     * @tc.number SUB_ASSET_KEYQRY_0204
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020204 begin');
      await removeAssetPromise('uQry020053', '');
      await addAssetPromise('uQry020053', '12345678', 't23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020053', 't23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020204 end');
    })

    /**
     * @tc.name   testKeyQry020205
     * @tc.number SUB_ASSET_KEYQRY_0205
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020205 begin');
      await removeAssetPromise('uQry020054', '');
      await addAssetPromise('uQry020054', 'p1', 't24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020054', 't24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020205 end');
    })

    /**
     * @tc.name   testKeyQry020206
     * @tc.number SUB_ASSET_KEYQRY_0206
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020206 begin');
      await removeAssetPromise('uQry020055', '');
      await addAssetPromise('uQry020055', 'password8', 't25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020055', 't25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020206 end');
    })

    /**
     * @tc.name   testKeyQry020207
     * @tc.number SUB_ASSET_KEYQRY_0207
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020207 begin');
      await removeAssetPromise('uQry020056', '');
      await addAssetPromise('uQry020056', 'pwd_16_chars_123', 't26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020056', 't26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020207 end');
    })

    /**
     * @tc.name   testKeyQry020208
     * @tc.number SUB_ASSET_KEYQRY_0208
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020208 begin');
      await removeAssetPromise('uQry020057', '');
      await addAssetPromise('uQry020057', '中文密码', 't27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020057', 't27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020208 end');
    })

    /**
     * @tc.name   testKeyQry020209
     * @tc.number SUB_ASSET_KEYQRY_0209
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020209 begin');
      await removeAssetPromise('uQry020058', '');
      await addAssetPromise('uQry020058', 'pwd@#$%^&*()', 't28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020058', 't28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020209 end');
    })

    /**
     * @tc.name   testKeyQry020210
     * @tc.number SUB_ASSET_KEYQRY_0210
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020210 begin');
      await removeAssetPromise('uQry020059', '');
      await addAssetPromise('uQry020059', '12345678', 't29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020059', 't29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020210 end');
    })

    /**
     * @tc.name   testKeyQry020211
     * @tc.number SUB_ASSET_KEYQRY_0211
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020211 begin');
      await removeAssetPromise('uQry020060', '');
      await addAssetPromise('uQry020060', 'p1', 'k0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020060', 'nomatch0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020211 end');
    })

    /**
     * @tc.name   testKeyQry020212
     * @tc.number SUB_ASSET_KEYQRY_0212
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020212 begin');
      await removeAssetPromise('uQry020061', '');
      await addAssetPromise('uQry020061', 'password8', 'k1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020061', 'nomatch1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020212 end');
    })

    /**
     * @tc.name   testKeyQry020213
     * @tc.number SUB_ASSET_KEYQRY_0213
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020213 begin');
      await removeAssetPromise('uQry020062', '');
      await addAssetPromise('uQry020062', 'pwd_16_chars_123', 'k2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020062', 'nomatch2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020213 end');
    })

    /**
     * @tc.name   testKeyQry020214
     * @tc.number SUB_ASSET_KEYQRY_0214
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020214 begin');
      await removeAssetPromise('uQry020063', '');
      await addAssetPromise('uQry020063', '中文密码', 'k3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020063', 'nomatch3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020214 end');
    })

    /**
     * @tc.name   testKeyQry020215
     * @tc.number SUB_ASSET_KEYQRY_0215
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020215 begin');
      await removeAssetPromise('uQry020064', '');
      await addAssetPromise('uQry020064', 'pwd@#$%^&*()', 'k4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020064', 'nomatch4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020215 end');
    })

    /**
     * @tc.name   testKeyQry020216
     * @tc.number SUB_ASSET_KEYQRY_0216
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020216 begin');
      await removeAssetPromise('uQry020065', '');
      await addAssetPromise('uQry020065', '12345678', 'k5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020065', 'nomatch5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020216 end');
    })

    /**
     * @tc.name   testKeyQry020217
     * @tc.number SUB_ASSET_KEYQRY_0217
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020217 begin');
      await removeAssetPromise('uQry020066', '');
      await addAssetPromise('uQry020066', 'p1', 'k6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020066', 'nomatch6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020217 end');
    })

    /**
     * @tc.name   testKeyQry020218
     * @tc.number SUB_ASSET_KEYQRY_0218
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020218 begin');
      await removeAssetPromise('uQry020067', '');
      await addAssetPromise('uQry020067', 'password8', 'k7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020067', 'nomatch7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020218 end');
    })

    /**
     * @tc.name   testKeyQry020219
     * @tc.number SUB_ASSET_KEYQRY_0219
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020219 begin');
      await removeAssetPromise('uQry020068', '');
      await addAssetPromise('uQry020068', 'pwd_16_chars_123', 'k8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020068', 'nomatch8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020219 end');
    })

    /**
     * @tc.name   testKeyQry020220
     * @tc.number SUB_ASSET_KEYQRY_0220
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020220 begin');
      await removeAssetPromise('uQry020069', '');
      await addAssetPromise('uQry020069', '中文密码', 'k9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020069', 'nomatch9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020220 end');
    })

    /**
     * @tc.name   testKeyQry020221
     * @tc.number SUB_ASSET_KEYQRY_0221
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020221 begin');
      await removeAssetPromise('uQry020070', '');
      await addAssetPromise('uQry020070', 'pwd@#$%^&*()', 'k10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020070', 'nomatch10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020221 end');
    })

    /**
     * @tc.name   testKeyQry020222
     * @tc.number SUB_ASSET_KEYQRY_0222
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020222 begin');
      await removeAssetPromise('uQry020071', '');
      await addAssetPromise('uQry020071', '12345678', 'k11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020071', 'nomatch11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020222 end');
    })

    /**
     * @tc.name   testKeyQry020223
     * @tc.number SUB_ASSET_KEYQRY_0223
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020223 begin');
      await removeAssetPromise('uQry020072', '');
      await addAssetPromise('uQry020072', 'p1', 'k12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020072', 'nomatch12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020223 end');
    })

    /**
     * @tc.name   testKeyQry020224
     * @tc.number SUB_ASSET_KEYQRY_0224
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020224 begin');
      await removeAssetPromise('uQry020073', '');
      await addAssetPromise('uQry020073', 'password8', 'k13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020073', 'nomatch13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020224 end');
    })

    /**
     * @tc.name   testKeyQry020225
     * @tc.number SUB_ASSET_KEYQRY_0225
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020225 begin');
      await removeAssetPromise('uQry020074', '');
      await addAssetPromise('uQry020074', 'pwd_16_chars_123', 'k14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020074', 'nomatch14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020225 end');
    })

    /**
     * @tc.name   testKeyQry020226
     * @tc.number SUB_ASSET_KEYQRY_0226
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020226 begin');
      await removeAssetPromise('uQry020075', '');
      await addAssetPromise('uQry020075', '中文密码', 'k15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020075', 'nomatch15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020226 end');
    })

    /**
     * @tc.name   testKeyQry020227
     * @tc.number SUB_ASSET_KEYQRY_0227
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020227 begin');
      await removeAssetPromise('uQry020076', '');
      await addAssetPromise('uQry020076', 'pwd@#$%^&*()', 'k16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020076', 'nomatch16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020227 end');
    })

    /**
     * @tc.name   testKeyQry020228
     * @tc.number SUB_ASSET_KEYQRY_0228
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020228 begin');
      await removeAssetPromise('uQry020077', '');
      await addAssetPromise('uQry020077', '12345678', 'k17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020077', 'nomatch17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020228 end');
    })

    /**
     * @tc.name   testKeyQry020229
     * @tc.number SUB_ASSET_KEYQRY_0229
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020229 begin');
      await removeAssetPromise('uQry020078', '');
      await addAssetPromise('uQry020078', 'p1', 'k18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020078', 'nomatch18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020229 end');
    })

    /**
     * @tc.name   testKeyQry020230
     * @tc.number SUB_ASSET_KEYQRY_0230
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020230 begin');
      await removeAssetPromise('uQry020079', '');
      await addAssetPromise('uQry020079', 'password8', 'k19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020079', 'nomatch19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020230 end');
    })

    /**
     * @tc.name   testKeyQry020231
     * @tc.number SUB_ASSET_KEYQRY_0231
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020231 begin');
      await removeAssetPromise('uQry020080', '');
      await addAssetPromise('uQry020080', 'pwd_16_chars_123', 'k20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020080', 'nomatch20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020231 end');
    })

    /**
     * @tc.name   testKeyQry020232
     * @tc.number SUB_ASSET_KEYQRY_0232
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020232 begin');
      await removeAssetPromise('uQry020081', '');
      await addAssetPromise('uQry020081', '中文密码', 'k21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020081', 'nomatch21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020232 end');
    })

    /**
     * @tc.name   testKeyQry020233
     * @tc.number SUB_ASSET_KEYQRY_0233
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020233 begin');
      await removeAssetPromise('uQry020082', '');
      await addAssetPromise('uQry020082', 'pwd@#$%^&*()', 'k22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020082', 'nomatch22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020233 end');
    })

    /**
     * @tc.name   testKeyQry020234
     * @tc.number SUB_ASSET_KEYQRY_0234
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020234 begin');
      await removeAssetPromise('uQry020083', '');
      await addAssetPromise('uQry020083', '12345678', 'k23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020083', 'nomatch23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020234 end');
    })

    /**
     * @tc.name   testKeyQry020235
     * @tc.number SUB_ASSET_KEYQRY_0235
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020235 begin');
      await removeAssetPromise('uQry020084', '');
      await addAssetPromise('uQry020084', 'p1', 'k24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020084', 'nomatch24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020235 end');
    })

    /**
     * @tc.name   testKeyQry020236
     * @tc.number SUB_ASSET_KEYQRY_0236
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020236 begin');
      await removeAssetPromise('uQry020085', '');
      await addAssetPromise('uQry020085', 'password8', 'k25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020085', 'nomatch25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020236 end');
    })

    /**
     * @tc.name   testKeyQry020237
     * @tc.number SUB_ASSET_KEYQRY_0237
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020237 begin');
      await removeAssetPromise('uQry020086', '');
      await addAssetPromise('uQry020086', 'pwd_16_chars_123', 'k26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020086', 'nomatch26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020237 end');
    })

    /**
     * @tc.name   testKeyQry020238
     * @tc.number SUB_ASSET_KEYQRY_0238
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020238 begin');
      await removeAssetPromise('uQry020087', '');
      await addAssetPromise('uQry020087', '中文密码', 'k27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020087', 'nomatch27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020238 end');
    })

    /**
     * @tc.name   testKeyQry020239
     * @tc.number SUB_ASSET_KEYQRY_0239
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020239 begin');
      await removeAssetPromise('uQry020088', '');
      await addAssetPromise('uQry020088', 'pwd@#$%^&*()', 'k28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020088', 'nomatch28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020239 end');
    })

    /**
     * @tc.name   testKeyQry020240
     * @tc.number SUB_ASSET_KEYQRY_0240
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020240 begin');
      await removeAssetPromise('uQry020089', '');
      await addAssetPromise('uQry020089', '12345678', 'k29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020089', 'nomatch29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020240 end');
    })

    /**
     * @tc.name   testKeyQry020241
     * @tc.number SUB_ASSET_KEYQRY_0241
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020241 begin');
      await removeAssetPromise('uQry020090', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020241 end');
    })

    /**
     * @tc.name   testKeyQry020242
     * @tc.number SUB_ASSET_KEYQRY_0242
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020242 begin');
      await removeAssetPromise('uQry020091', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020242 end');
    })

    /**
     * @tc.name   testKeyQry020243
     * @tc.number SUB_ASSET_KEYQRY_0243
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020243 begin');
      await removeAssetPromise('uQry020092', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020243 end');
    })

    /**
     * @tc.name   testKeyQry020244
     * @tc.number SUB_ASSET_KEYQRY_0244
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020244 begin');
      await removeAssetPromise('uQry020093', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020244 end');
    })

    /**
     * @tc.name   testKeyQry020245
     * @tc.number SUB_ASSET_KEYQRY_0245
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020245 begin');
      await removeAssetPromise('uQry020094', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020245 end');
    })

    /**
     * @tc.name   testKeyQry020246
     * @tc.number SUB_ASSET_KEYQRY_0246
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020246 begin');
      await removeAssetPromise('uQry020095', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020246 end');
    })

    /**
     * @tc.name   testKeyQry020247
     * @tc.number SUB_ASSET_KEYQRY_0247
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020247 begin');
      await removeAssetPromise('uQry020096', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020247 end');
    })

    /**
     * @tc.name   testKeyQry020248
     * @tc.number SUB_ASSET_KEYQRY_0248
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020248 begin');
      await removeAssetPromise('uQry020097', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020248 end');
    })

    /**
     * @tc.name   testKeyQry020249
     * @tc.number SUB_ASSET_KEYQRY_0249
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020249 begin');
      await removeAssetPromise('uQry020098', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020249 end');
    })

    /**
     * @tc.name   testKeyQry020250
     * @tc.number SUB_ASSET_KEYQRY_0250
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020250 begin');
      await removeAssetPromise('uQry020099', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020250 end');
    })

    /**
     * @tc.name   testKeyQry020251
     * @tc.number SUB_ASSET_KEYQRY_0251
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020251 begin');
      await removeAssetPromise('uQry020100', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020251 end');
    })

    /**
     * @tc.name   testKeyQry020252
     * @tc.number SUB_ASSET_KEYQRY_0252
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020252 begin');
      await removeAssetPromise('uQry020101', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020252 end');
    })

    /**
     * @tc.name   testKeyQry020253
     * @tc.number SUB_ASSET_KEYQRY_0253
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020253 begin');
      await removeAssetPromise('uQry020102', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020253 end');
    })

    /**
     * @tc.name   testKeyQry020254
     * @tc.number SUB_ASSET_KEYQRY_0254
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020254 begin');
      await removeAssetPromise('uQry020103', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020254 end');
    })

    /**
     * @tc.name   testKeyQry020255
     * @tc.number SUB_ASSET_KEYQRY_0255
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020255 begin');
      await removeAssetPromise('uQry020104', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020255 end');
    })

    /**
     * @tc.name   testKeyQry020256
     * @tc.number SUB_ASSET_KEYQRY_0256
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020256 begin');
      await removeAssetPromise('uQry020105', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020256 end');
    })

    /**
     * @tc.name   testKeyQry020257
     * @tc.number SUB_ASSET_KEYQRY_0257
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020257 begin');
      await removeAssetPromise('uQry020106', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020257 end');
    })

    /**
     * @tc.name   testKeyQry020258
     * @tc.number SUB_ASSET_KEYQRY_0258
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020258 begin');
      await removeAssetPromise('uQry020107', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020258 end');
    })

    /**
     * @tc.name   testKeyQry020259
     * @tc.number SUB_ASSET_KEYQRY_0259
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020259 begin');
      await removeAssetPromise('uQry020108', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020259 end');
    })

    /**
     * @tc.name   testKeyQry020260
     * @tc.number SUB_ASSET_KEYQRY_0260
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020260 begin');
      await removeAssetPromise('uQry020109', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020260 end');
    })

    /**
     * @tc.name   testKeyQry020261
     * @tc.number SUB_ASSET_KEYQRY_0261
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020261 begin');
      await removeAssetPromise('uQry020110', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020261 end');
    })

    /**
     * @tc.name   testKeyQry020262
     * @tc.number SUB_ASSET_KEYQRY_0262
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020262 begin');
      await removeAssetPromise('uQry020111', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020262 end');
    })

    /**
     * @tc.name   testKeyQry020263
     * @tc.number SUB_ASSET_KEYQRY_0263
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020263 begin');
      await removeAssetPromise('uQry020112', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020263 end');
    })

    /**
     * @tc.name   testKeyQry020264
     * @tc.number SUB_ASSET_KEYQRY_0264
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020264 begin');
      await removeAssetPromise('uQry020113', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020264 end');
    })

    /**
     * @tc.name   testKeyQry020265
     * @tc.number SUB_ASSET_KEYQRY_0265
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020265 begin');
      await removeAssetPromise('uQry020114', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020265 end');
    })

    /**
     * @tc.name   testKeyQry020266
     * @tc.number SUB_ASSET_KEYQRY_0266
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020266 begin');
      await removeAssetPromise('uQry020115', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020266 end');
    })

    /**
     * @tc.name   testKeyQry020267
     * @tc.number SUB_ASSET_KEYQRY_0267
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020267 begin');
      await removeAssetPromise('uQry020116', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020267 end');
    })

    /**
     * @tc.name   testKeyQry020268
     * @tc.number SUB_ASSET_KEYQRY_0268
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020268 begin');
      await removeAssetPromise('uQry020117', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020268 end');
    })

    /**
     * @tc.name   testKeyQry020269
     * @tc.number SUB_ASSET_KEYQRY_0269
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020269 begin');
      await removeAssetPromise('uQry020118', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020269 end');
    })

    /**
     * @tc.name   testKeyQry020270
     * @tc.number SUB_ASSET_KEYQRY_0270
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020270 begin');
      await removeAssetPromise('uQry020119', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020270 end');
    })

    /**
     * @tc.name   testKeyQry020271
     * @tc.number SUB_ASSET_KEYQRY_0271
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020271 begin');
      await removeAssetPromise('uQry020120', '');
      await addAssetPromise('uQry020120', 'p1', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020120', 'a0;b0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020271 end');
    })

    /**
     * @tc.name   testKeyQry020272
     * @tc.number SUB_ASSET_KEYQRY_0272
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020272 begin');
      await removeAssetPromise('uQry020121', '');
      await addAssetPromise('uQry020121', 'password8', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020121', 'a1;b1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020272 end');
    })

    /**
     * @tc.name   testKeyQry020273
     * @tc.number SUB_ASSET_KEYQRY_0273
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020273 begin');
      await removeAssetPromise('uQry020122', '');
      await addAssetPromise('uQry020122', 'pwd_16_chars_123', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020122', 'a2;b2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020273 end');
    })

    /**
     * @tc.name   testKeyQry020274
     * @tc.number SUB_ASSET_KEYQRY_0274
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020274 begin');
      await removeAssetPromise('uQry020123', '');
      await addAssetPromise('uQry020123', '中文密码', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020123', 'a3;b3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020274 end');
    })

    /**
     * @tc.name   testKeyQry020275
     * @tc.number SUB_ASSET_KEYQRY_0275
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020275 begin');
      await removeAssetPromise('uQry020124', '');
      await addAssetPromise('uQry020124', 'pwd@#$%^&*()', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020124', 'a4;b4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020275 end');
    })

    /**
     * @tc.name   testKeyQry020276
     * @tc.number SUB_ASSET_KEYQRY_0276
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020276 begin');
      await removeAssetPromise('uQry020125', '');
      await addAssetPromise('uQry020125', '12345678', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020125', 'a5;b5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020276 end');
    })

    /**
     * @tc.name   testKeyQry020277
     * @tc.number SUB_ASSET_KEYQRY_0277
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020277 begin');
      await removeAssetPromise('uQry020126', '');
      await addAssetPromise('uQry020126', 'p1', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020126', 'a6;b6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020277 end');
    })

    /**
     * @tc.name   testKeyQry020278
     * @tc.number SUB_ASSET_KEYQRY_0278
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020278 begin');
      await removeAssetPromise('uQry020127', '');
      await addAssetPromise('uQry020127', 'password8', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020127', 'a7;b7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020278 end');
    })

    /**
     * @tc.name   testKeyQry020279
     * @tc.number SUB_ASSET_KEYQRY_0279
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020279 begin');
      await removeAssetPromise('uQry020128', '');
      await addAssetPromise('uQry020128', 'pwd_16_chars_123', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020128', 'a8;b8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020279 end');
    })

    /**
     * @tc.name   testKeyQry020280
     * @tc.number SUB_ASSET_KEYQRY_0280
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020280 begin');
      await removeAssetPromise('uQry020129', '');
      await addAssetPromise('uQry020129', '中文密码', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020129', 'a9;b9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020280 end');
    })

    /**
     * @tc.name   testKeyQry020281
     * @tc.number SUB_ASSET_KEYQRY_0281
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020281 begin');
      await removeAssetPromise('uQry020130', '');
      await addAssetPromise('uQry020130', 'pwd@#$%^&*()', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020130', 'a10;b10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020281 end');
    })

    /**
     * @tc.name   testKeyQry020282
     * @tc.number SUB_ASSET_KEYQRY_0282
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020282 begin');
      await removeAssetPromise('uQry020131', '');
      await addAssetPromise('uQry020131', '12345678', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020131', 'a11;b11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020282 end');
    })

    /**
     * @tc.name   testKeyQry020283
     * @tc.number SUB_ASSET_KEYQRY_0283
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020283 begin');
      await removeAssetPromise('uQry020132', '');
      await addAssetPromise('uQry020132', 'p1', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020132', 'a12;b12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020283 end');
    })

    /**
     * @tc.name   testKeyQry020284
     * @tc.number SUB_ASSET_KEYQRY_0284
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020284 begin');
      await removeAssetPromise('uQry020133', '');
      await addAssetPromise('uQry020133', 'password8', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020133', 'a13;b13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020284 end');
    })

    /**
     * @tc.name   testKeyQry020285
     * @tc.number SUB_ASSET_KEYQRY_0285
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020285 begin');
      await removeAssetPromise('uQry020134', '');
      await addAssetPromise('uQry020134', 'pwd_16_chars_123', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020134', 'a14;b14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020285 end');
    })

    /**
     * @tc.name   testKeyQry020286
     * @tc.number SUB_ASSET_KEYQRY_0286
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020286 begin');
      await removeAssetPromise('uQry020135', '');
      await addAssetPromise('uQry020135', '中文密码', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020135', 'a15;b15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020286 end');
    })

    /**
     * @tc.name   testKeyQry020287
     * @tc.number SUB_ASSET_KEYQRY_0287
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020287 begin');
      await removeAssetPromise('uQry020136', '');
      await addAssetPromise('uQry020136', 'pwd@#$%^&*()', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020136', 'a16;b16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020287 end');
    })

    /**
     * @tc.name   testKeyQry020288
     * @tc.number SUB_ASSET_KEYQRY_0288
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020288 begin');
      await removeAssetPromise('uQry020137', '');
      await addAssetPromise('uQry020137', '12345678', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020137', 'a17;b17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020288 end');
    })

    /**
     * @tc.name   testKeyQry020289
     * @tc.number SUB_ASSET_KEYQRY_0289
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020289 begin');
      await removeAssetPromise('uQry020138', '');
      await addAssetPromise('uQry020138', 'p1', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020138', 'a18;b18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020289 end');
    })

    /**
     * @tc.name   testKeyQry020290
     * @tc.number SUB_ASSET_KEYQRY_0290
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020290 begin');
      await removeAssetPromise('uQry020139', '');
      await addAssetPromise('uQry020139', 'password8', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020139', 'a19;b19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020290 end');
    })

    /**
     * @tc.name   testKeyQry020291
     * @tc.number SUB_ASSET_KEYQRY_0291
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020291 begin');
      await removeAssetPromise('uQry020140', '');
      await addAssetPromise('uQry020140', 'pwd_16_chars_123', 'd0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020140', 'd0;d0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020291 end');
    })

    /**
     * @tc.name   testKeyQry020292
     * @tc.number SUB_ASSET_KEYQRY_0292
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020292 begin');
      await removeAssetPromise('uQry020141', '');
      await addAssetPromise('uQry020141', '中文密码', 'd1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020141', 'd1;d1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020292 end');
    })

    /**
     * @tc.name   testKeyQry020293
     * @tc.number SUB_ASSET_KEYQRY_0293
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020293 begin');
      await removeAssetPromise('uQry020142', '');
      await addAssetPromise('uQry020142', 'pwd@#$%^&*()', 'd2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020142', 'd2;d2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020293 end');
    })

    /**
     * @tc.name   testKeyQry020294
     * @tc.number SUB_ASSET_KEYQRY_0294
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020294 begin');
      await removeAssetPromise('uQry020143', '');
      await addAssetPromise('uQry020143', '12345678', 'd3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020143', 'd3;d3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020294 end');
    })

    /**
     * @tc.name   testKeyQry020295
     * @tc.number SUB_ASSET_KEYQRY_0295
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020295 begin');
      await removeAssetPromise('uQry020144', '');
      await addAssetPromise('uQry020144', 'p1', 'd4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020144', 'd4;d4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020295 end');
    })

    /**
     * @tc.name   testKeyQry020296
     * @tc.number SUB_ASSET_KEYQRY_0296
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020296 begin');
      await removeAssetPromise('uQry020145', '');
      await addAssetPromise('uQry020145', 'password8', 'd5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020145', 'd5;d5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020296 end');
    })

    /**
     * @tc.name   testKeyQry020297
     * @tc.number SUB_ASSET_KEYQRY_0297
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020297 begin');
      await removeAssetPromise('uQry020146', '');
      await addAssetPromise('uQry020146', 'pwd_16_chars_123', 'd6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020146', 'd6;d6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020297 end');
    })

    /**
     * @tc.name   testKeyQry020298
     * @tc.number SUB_ASSET_KEYQRY_0298
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020298 begin');
      await removeAssetPromise('uQry020147', '');
      await addAssetPromise('uQry020147', '中文密码', 'd7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020147', 'd7;d7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020298 end');
    })

    /**
     * @tc.name   testKeyQry020299
     * @tc.number SUB_ASSET_KEYQRY_0299
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020299 begin');
      await removeAssetPromise('uQry020148', '');
      await addAssetPromise('uQry020148', 'pwd@#$%^&*()', 'd8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020148', 'd8;d8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020299 end');
    })

    /**
     * @tc.name   testKeyQry020300
     * @tc.number SUB_ASSET_KEYQRY_0300
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020300 begin');
      await removeAssetPromise('uQry020149', '');
      await addAssetPromise('uQry020149', '12345678', 'd9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry020149', 'd9;d9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry020149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry020300 end');
    })

  })
}
