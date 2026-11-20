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

export default function keyRmVolume02() {
  describe('KeyRmVolume02Test', () => {

    /**
     * @tc.name   testKeyRm020151
     * @tc.number SUB_ASSET_KEYRM_0151
     * @tc.desc   标签匹配整体删除后查询 0 条，标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020151 begin');
      const alias: string = 'uRmAnchor01';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'anchorPwd', 'keep;drop');
      await removeAssetPromise(alias, 'drop');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(rows.length).assertEqual(0);
      const alias2: string = 'uRmAnchor02';
      await removeAssetPromise(alias2, '');
      await addAssetPromise(alias2, 'anchorPwd2', 'keep2');
      await removeAssetPromise(alias2, 'nomatch');
      const rows2: Map<string, string>[] = await queryAssetPromise(alias2, '');
      expect(rows2.length).assertEqual(1);
      expect(rows2[0].get('secret')).assertEqual('anchorPwd2');
      await removeAssetPromise(alias2, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020151 end');
    })

    /**
     * @tc.name   testKeyRm020152
     * @tc.number SUB_ASSET_KEYRM_0152
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020152 begin');
      await removeAssetPromise('uRm020001', '');
      await addAssetPromise('uRm020001', 'password8', 'g1');
      await removeAssetPromise('uRm020001', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020152 end');
    })

    /**
     * @tc.name   testKeyRm020153
     * @tc.number SUB_ASSET_KEYRM_0153
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020153 begin');
      await removeAssetPromise('uRm020002', '');
      await addAssetPromise('uRm020002', 'pwd_16_chars_123', 'g2');
      await removeAssetPromise('uRm020002', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020153 end');
    })

    /**
     * @tc.name   testKeyRm020154
     * @tc.number SUB_ASSET_KEYRM_0154
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020154 begin');
      await removeAssetPromise('uRm020003', '');
      await addAssetPromise('uRm020003', '中文密码', 'g3');
      await removeAssetPromise('uRm020003', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020154 end');
    })

    /**
     * @tc.name   testKeyRm020155
     * @tc.number SUB_ASSET_KEYRM_0155
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020155 begin');
      await removeAssetPromise('uRm020004', '');
      await addAssetPromise('uRm020004', 'pwd@#$%^&*()', 'g4');
      await removeAssetPromise('uRm020004', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020155 end');
    })

    /**
     * @tc.name   testKeyRm020156
     * @tc.number SUB_ASSET_KEYRM_0156
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020156 begin');
      await removeAssetPromise('uRm020005', '');
      await addAssetPromise('uRm020005', '12345678', 'l5');
      await removeAssetPromise('uRm020005', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020156 end');
    })

    /**
     * @tc.name   testKeyRm020157
     * @tc.number SUB_ASSET_KEYRM_0157
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020157 begin');
      await removeAssetPromise('uRm020006', '');
      await addAssetPromise('uRm020006', 'p1', 'l6');
      await removeAssetPromise('uRm020006', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020157 end');
    })

    /**
     * @tc.name   testKeyRm020158
     * @tc.number SUB_ASSET_KEYRM_0158
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020158 begin');
      await removeAssetPromise('uRm020007', '');
      await addAssetPromise('uRm020007', 'password8', 'l7');
      await removeAssetPromise('uRm020007', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020158 end');
    })

    /**
     * @tc.name   testKeyRm020159
     * @tc.number SUB_ASSET_KEYRM_0159
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020159 begin');
      await removeAssetPromise('uRm020008', '');
      await addAssetPromise('uRm020008', 'pwd_16_chars_123', 'l8');
      await removeAssetPromise('uRm020008', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020159 end');
    })

    /**
     * @tc.name   testKeyRm020160
     * @tc.number SUB_ASSET_KEYRM_0160
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020160 begin');
      await removeAssetPromise('uRm020009', '');
      await addAssetPromise('uRm020009', '中文密码', 'l9');
      await removeAssetPromise('uRm020009', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020160 end');
    })

    /**
     * @tc.name   testKeyRm020161
     * @tc.number SUB_ASSET_KEYRM_0161
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020161 begin');
      await removeAssetPromise('uRm020010', '');
      await addAssetPromise('uRm020010', 'pwd@#$%^&*()', 'l10');
      await removeAssetPromise('uRm020010', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020161 end');
    })

    /**
     * @tc.name   testKeyRm020162
     * @tc.number SUB_ASSET_KEYRM_0162
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020162 begin');
      await removeAssetPromise('uRm020011', '');
      await addAssetPromise('uRm020011', '12345678', 'l11');
      await removeAssetPromise('uRm020011', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020162 end');
    })

    /**
     * @tc.name   testKeyRm020163
     * @tc.number SUB_ASSET_KEYRM_0163
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020163 begin');
      await removeAssetPromise('uRm020012', '');
      await addAssetPromise('uRm020012', 'p1', 'l12');
      await removeAssetPromise('uRm020012', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020163 end');
    })

    /**
     * @tc.name   testKeyRm020164
     * @tc.number SUB_ASSET_KEYRM_0164
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020164 begin');
      await removeAssetPromise('uRm020013', '');
      await addAssetPromise('uRm020013', 'password8', 'l13');
      await removeAssetPromise('uRm020013', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020164 end');
    })

    /**
     * @tc.name   testKeyRm020165
     * @tc.number SUB_ASSET_KEYRM_0165
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020165 begin');
      await removeAssetPromise('uRm020014', '');
      await addAssetPromise('uRm020014', 'pwd_16_chars_123', 'l14');
      await removeAssetPromise('uRm020014', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020165 end');
    })

    /**
     * @tc.name   testKeyRm020166
     * @tc.number SUB_ASSET_KEYRM_0166
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020166 begin');
      await removeAssetPromise('uRm020015', '');
      await addAssetPromise('uRm020015', '中文密码', 'l15');
      await removeAssetPromise('uRm020015', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020166 end');
    })

    /**
     * @tc.name   testKeyRm020167
     * @tc.number SUB_ASSET_KEYRM_0167
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020167 begin');
      await removeAssetPromise('uRm020016', '');
      await addAssetPromise('uRm020016', 'pwd@#$%^&*()', 'l16');
      await removeAssetPromise('uRm020016', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020167 end');
    })

    /**
     * @tc.name   testKeyRm020168
     * @tc.number SUB_ASSET_KEYRM_0168
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020168 begin');
      await removeAssetPromise('uRm020017', '');
      await addAssetPromise('uRm020017', '12345678', 'l17');
      await removeAssetPromise('uRm020017', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020168 end');
    })

    /**
     * @tc.name   testKeyRm020169
     * @tc.number SUB_ASSET_KEYRM_0169
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020169 begin');
      await removeAssetPromise('uRm020018', '');
      await addAssetPromise('uRm020018', 'p1', 'l18');
      await removeAssetPromise('uRm020018', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020169 end');
    })

    /**
     * @tc.name   testKeyRm020170
     * @tc.number SUB_ASSET_KEYRM_0170
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020170 begin');
      await removeAssetPromise('uRm020019', '');
      await addAssetPromise('uRm020019', 'password8', 'l19');
      await removeAssetPromise('uRm020019', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020170 end');
    })

    /**
     * @tc.name   testKeyRm020171
     * @tc.number SUB_ASSET_KEYRM_0171
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020171 begin');
      await removeAssetPromise('uRm020020', '');
      await addAssetPromise('uRm020020', 'pwd_16_chars_123', 'l20');
      await removeAssetPromise('uRm020020', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020171 end');
    })

    /**
     * @tc.name   testKeyRm020172
     * @tc.number SUB_ASSET_KEYRM_0172
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020172 begin');
      await removeAssetPromise('uRm020021', '');
      await addAssetPromise('uRm020021', '中文密码', 'l21');
      await removeAssetPromise('uRm020021', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020172 end');
    })

    /**
     * @tc.name   testKeyRm020173
     * @tc.number SUB_ASSET_KEYRM_0173
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020173 begin');
      await removeAssetPromise('uRm020022', '');
      await addAssetPromise('uRm020022', 'pwd@#$%^&*()', 'l22');
      await removeAssetPromise('uRm020022', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020173 end');
    })

    /**
     * @tc.name   testKeyRm020174
     * @tc.number SUB_ASSET_KEYRM_0174
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020174 begin');
      await removeAssetPromise('uRm020023', '');
      await addAssetPromise('uRm020023', '12345678', 'l23');
      await removeAssetPromise('uRm020023', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020174 end');
    })

    /**
     * @tc.name   testKeyRm020175
     * @tc.number SUB_ASSET_KEYRM_0175
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020175 begin');
      await removeAssetPromise('uRm020024', '');
      await addAssetPromise('uRm020024', 'p1', 'l24');
      await removeAssetPromise('uRm020024', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020175 end');
    })

    /**
     * @tc.name   testKeyRm020176
     * @tc.number SUB_ASSET_KEYRM_0176
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020176 begin');
      await removeAssetPromise('uRm020025', '');
      await addAssetPromise('uRm020025', 'password8', 'l25');
      await removeAssetPromise('uRm020025', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020176 end');
    })

    /**
     * @tc.name   testKeyRm020177
     * @tc.number SUB_ASSET_KEYRM_0177
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020177 begin');
      await removeAssetPromise('uRm020026', '');
      await addAssetPromise('uRm020026', 'pwd_16_chars_123', 'l26');
      await removeAssetPromise('uRm020026', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020177 end');
    })

    /**
     * @tc.name   testKeyRm020178
     * @tc.number SUB_ASSET_KEYRM_0178
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020178 begin');
      await removeAssetPromise('uRm020027', '');
      await addAssetPromise('uRm020027', '中文密码', 'l27');
      await removeAssetPromise('uRm020027', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020178 end');
    })

    /**
     * @tc.name   testKeyRm020179
     * @tc.number SUB_ASSET_KEYRM_0179
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020179 begin');
      await removeAssetPromise('uRm020028', '');
      await addAssetPromise('uRm020028', 'pwd@#$%^&*()', 'l28');
      await removeAssetPromise('uRm020028', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020179 end');
    })

    /**
     * @tc.name   testKeyRm020180
     * @tc.number SUB_ASSET_KEYRM_0180
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020180 begin');
      await removeAssetPromise('uRm020029', '');
      await addAssetPromise('uRm020029', '12345678', 'l29');
      await removeAssetPromise('uRm020029', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020180 end');
    })

    /**
     * @tc.name   testKeyRm020181
     * @tc.number SUB_ASSET_KEYRM_0181
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020181 begin');
      await removeAssetPromise('uRm020030', '');
      await addAssetPromise('uRm020030', 'p1', 't0');
      await removeAssetPromise('uRm020030', 't0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020181 end');
    })

    /**
     * @tc.name   testKeyRm020182
     * @tc.number SUB_ASSET_KEYRM_0182
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020182 begin');
      await removeAssetPromise('uRm020031', '');
      await addAssetPromise('uRm020031', 'password8', 't1');
      await removeAssetPromise('uRm020031', 't1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020182 end');
    })

    /**
     * @tc.name   testKeyRm020183
     * @tc.number SUB_ASSET_KEYRM_0183
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020183 begin');
      await removeAssetPromise('uRm020032', '');
      await addAssetPromise('uRm020032', 'pwd_16_chars_123', 't2');
      await removeAssetPromise('uRm020032', 't2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020183 end');
    })

    /**
     * @tc.name   testKeyRm020184
     * @tc.number SUB_ASSET_KEYRM_0184
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020184 begin');
      await removeAssetPromise('uRm020033', '');
      await addAssetPromise('uRm020033', '中文密码', 't3');
      await removeAssetPromise('uRm020033', 't3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020184 end');
    })

    /**
     * @tc.name   testKeyRm020185
     * @tc.number SUB_ASSET_KEYRM_0185
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020185 begin');
      await removeAssetPromise('uRm020034', '');
      await addAssetPromise('uRm020034', 'pwd@#$%^&*()', 't4');
      await removeAssetPromise('uRm020034', 't4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020185 end');
    })

    /**
     * @tc.name   testKeyRm020186
     * @tc.number SUB_ASSET_KEYRM_0186
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020186 begin');
      await removeAssetPromise('uRm020035', '');
      await addAssetPromise('uRm020035', '12345678', 't5');
      await removeAssetPromise('uRm020035', 't5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020186 end');
    })

    /**
     * @tc.name   testKeyRm020187
     * @tc.number SUB_ASSET_KEYRM_0187
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020187 begin');
      await removeAssetPromise('uRm020036', '');
      await addAssetPromise('uRm020036', 'p1', 't6');
      await removeAssetPromise('uRm020036', 't6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020187 end');
    })

    /**
     * @tc.name   testKeyRm020188
     * @tc.number SUB_ASSET_KEYRM_0188
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020188 begin');
      await removeAssetPromise('uRm020037', '');
      await addAssetPromise('uRm020037', 'password8', 't7');
      await removeAssetPromise('uRm020037', 't7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020188 end');
    })

    /**
     * @tc.name   testKeyRm020189
     * @tc.number SUB_ASSET_KEYRM_0189
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020189 begin');
      await removeAssetPromise('uRm020038', '');
      await addAssetPromise('uRm020038', 'pwd_16_chars_123', 't8');
      await removeAssetPromise('uRm020038', 't8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020189 end');
    })

    /**
     * @tc.name   testKeyRm020190
     * @tc.number SUB_ASSET_KEYRM_0190
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020190 begin');
      await removeAssetPromise('uRm020039', '');
      await addAssetPromise('uRm020039', '中文密码', 't9');
      await removeAssetPromise('uRm020039', 't9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020190 end');
    })

    /**
     * @tc.name   testKeyRm020191
     * @tc.number SUB_ASSET_KEYRM_0191
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020191 begin');
      await removeAssetPromise('uRm020040', '');
      await addAssetPromise('uRm020040', 'pwd@#$%^&*()', 't10');
      await removeAssetPromise('uRm020040', 't10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020191 end');
    })

    /**
     * @tc.name   testKeyRm020192
     * @tc.number SUB_ASSET_KEYRM_0192
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020192 begin');
      await removeAssetPromise('uRm020041', '');
      await addAssetPromise('uRm020041', '12345678', 't11');
      await removeAssetPromise('uRm020041', 't11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020192 end');
    })

    /**
     * @tc.name   testKeyRm020193
     * @tc.number SUB_ASSET_KEYRM_0193
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020193 begin');
      await removeAssetPromise('uRm020042', '');
      await addAssetPromise('uRm020042', 'p1', 't12');
      await removeAssetPromise('uRm020042', 't12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020193 end');
    })

    /**
     * @tc.name   testKeyRm020194
     * @tc.number SUB_ASSET_KEYRM_0194
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020194 begin');
      await removeAssetPromise('uRm020043', '');
      await addAssetPromise('uRm020043', 'password8', 't13');
      await removeAssetPromise('uRm020043', 't13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020194 end');
    })

    /**
     * @tc.name   testKeyRm020195
     * @tc.number SUB_ASSET_KEYRM_0195
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020195 begin');
      await removeAssetPromise('uRm020044', '');
      await addAssetPromise('uRm020044', 'pwd_16_chars_123', 't14');
      await removeAssetPromise('uRm020044', 't14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020195 end');
    })

    /**
     * @tc.name   testKeyRm020196
     * @tc.number SUB_ASSET_KEYRM_0196
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020196 begin');
      await removeAssetPromise('uRm020045', '');
      await addAssetPromise('uRm020045', '中文密码', 't15');
      await removeAssetPromise('uRm020045', 't15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020196 end');
    })

    /**
     * @tc.name   testKeyRm020197
     * @tc.number SUB_ASSET_KEYRM_0197
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020197 begin');
      await removeAssetPromise('uRm020046', '');
      await addAssetPromise('uRm020046', 'pwd@#$%^&*()', 't16');
      await removeAssetPromise('uRm020046', 't16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020197 end');
    })

    /**
     * @tc.name   testKeyRm020198
     * @tc.number SUB_ASSET_KEYRM_0198
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020198 begin');
      await removeAssetPromise('uRm020047', '');
      await addAssetPromise('uRm020047', '12345678', 't17');
      await removeAssetPromise('uRm020047', 't17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020198 end');
    })

    /**
     * @tc.name   testKeyRm020199
     * @tc.number SUB_ASSET_KEYRM_0199
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020199 begin');
      await removeAssetPromise('uRm020048', '');
      await addAssetPromise('uRm020048', 'p1', 't18');
      await removeAssetPromise('uRm020048', 't18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020199 end');
    })

    /**
     * @tc.name   testKeyRm020200
     * @tc.number SUB_ASSET_KEYRM_0200
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020200 begin');
      await removeAssetPromise('uRm020049', '');
      await addAssetPromise('uRm020049', 'password8', 't19');
      await removeAssetPromise('uRm020049', 't19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020200 end');
    })

    /**
     * @tc.name   testKeyRm020201
     * @tc.number SUB_ASSET_KEYRM_0201
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020201 begin');
      await removeAssetPromise('uRm020050', '');
      await addAssetPromise('uRm020050', 'pwd_16_chars_123', 't20');
      await removeAssetPromise('uRm020050', 't20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020201 end');
    })

    /**
     * @tc.name   testKeyRm020202
     * @tc.number SUB_ASSET_KEYRM_0202
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020202 begin');
      await removeAssetPromise('uRm020051', '');
      await addAssetPromise('uRm020051', '中文密码', 't21');
      await removeAssetPromise('uRm020051', 't21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020202 end');
    })

    /**
     * @tc.name   testKeyRm020203
     * @tc.number SUB_ASSET_KEYRM_0203
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020203 begin');
      await removeAssetPromise('uRm020052', '');
      await addAssetPromise('uRm020052', 'pwd@#$%^&*()', 't22');
      await removeAssetPromise('uRm020052', 't22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020203 end');
    })

    /**
     * @tc.name   testKeyRm020204
     * @tc.number SUB_ASSET_KEYRM_0204
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020204 begin');
      await removeAssetPromise('uRm020053', '');
      await addAssetPromise('uRm020053', '12345678', 't23');
      await removeAssetPromise('uRm020053', 't23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020204 end');
    })

    /**
     * @tc.name   testKeyRm020205
     * @tc.number SUB_ASSET_KEYRM_0205
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020205 begin');
      await removeAssetPromise('uRm020054', '');
      await addAssetPromise('uRm020054', 'p1', 't24');
      await removeAssetPromise('uRm020054', 't24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020205 end');
    })

    /**
     * @tc.name   testKeyRm020206
     * @tc.number SUB_ASSET_KEYRM_0206
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020206 begin');
      await removeAssetPromise('uRm020055', '');
      await addAssetPromise('uRm020055', 'password8', 't25');
      await removeAssetPromise('uRm020055', 't25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020206 end');
    })

    /**
     * @tc.name   testKeyRm020207
     * @tc.number SUB_ASSET_KEYRM_0207
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020207 begin');
      await removeAssetPromise('uRm020056', '');
      await addAssetPromise('uRm020056', 'pwd_16_chars_123', 't26');
      await removeAssetPromise('uRm020056', 't26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020207 end');
    })

    /**
     * @tc.name   testKeyRm020208
     * @tc.number SUB_ASSET_KEYRM_0208
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020208 begin');
      await removeAssetPromise('uRm020057', '');
      await addAssetPromise('uRm020057', '中文密码', 't27');
      await removeAssetPromise('uRm020057', 't27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020208 end');
    })

    /**
     * @tc.name   testKeyRm020209
     * @tc.number SUB_ASSET_KEYRM_0209
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020209 begin');
      await removeAssetPromise('uRm020058', '');
      await addAssetPromise('uRm020058', 'pwd@#$%^&*()', 't28');
      await removeAssetPromise('uRm020058', 't28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020209 end');
    })

    /**
     * @tc.name   testKeyRm020210
     * @tc.number SUB_ASSET_KEYRM_0210
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020210 begin');
      await removeAssetPromise('uRm020059', '');
      await addAssetPromise('uRm020059', '12345678', 't29');
      await removeAssetPromise('uRm020059', 't29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020210 end');
    })

    /**
     * @tc.name   testKeyRm020211
     * @tc.number SUB_ASSET_KEYRM_0211
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020211 begin');
      await removeAssetPromise('uRm020060', '');
      await addAssetPromise('uRm020060', 'p1', 'm0;n0');
      await removeAssetPromise('uRm020060', 'n0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020211 end');
    })

    /**
     * @tc.name   testKeyRm020212
     * @tc.number SUB_ASSET_KEYRM_0212
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020212 begin');
      await removeAssetPromise('uRm020061', '');
      await addAssetPromise('uRm020061', 'password8', 'm1;n1');
      await removeAssetPromise('uRm020061', 'n1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020212 end');
    })

    /**
     * @tc.name   testKeyRm020213
     * @tc.number SUB_ASSET_KEYRM_0213
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020213 begin');
      await removeAssetPromise('uRm020062', '');
      await addAssetPromise('uRm020062', 'pwd_16_chars_123', 'm2;n2');
      await removeAssetPromise('uRm020062', 'n2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020213 end');
    })

    /**
     * @tc.name   testKeyRm020214
     * @tc.number SUB_ASSET_KEYRM_0214
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020214 begin');
      await removeAssetPromise('uRm020063', '');
      await addAssetPromise('uRm020063', '中文密码', 'm3;n3');
      await removeAssetPromise('uRm020063', 'n3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020214 end');
    })

    /**
     * @tc.name   testKeyRm020215
     * @tc.number SUB_ASSET_KEYRM_0215
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020215 begin');
      await removeAssetPromise('uRm020064', '');
      await addAssetPromise('uRm020064', 'pwd@#$%^&*()', 'm4;n4');
      await removeAssetPromise('uRm020064', 'n4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020215 end');
    })

    /**
     * @tc.name   testKeyRm020216
     * @tc.number SUB_ASSET_KEYRM_0216
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020216 begin');
      await removeAssetPromise('uRm020065', '');
      await addAssetPromise('uRm020065', '12345678', 'm5;n5');
      await removeAssetPromise('uRm020065', 'n5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020216 end');
    })

    /**
     * @tc.name   testKeyRm020217
     * @tc.number SUB_ASSET_KEYRM_0217
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020217 begin');
      await removeAssetPromise('uRm020066', '');
      await addAssetPromise('uRm020066', 'p1', 'm6;n6');
      await removeAssetPromise('uRm020066', 'n6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020217 end');
    })

    /**
     * @tc.name   testKeyRm020218
     * @tc.number SUB_ASSET_KEYRM_0218
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020218 begin');
      await removeAssetPromise('uRm020067', '');
      await addAssetPromise('uRm020067', 'password8', 'm7;n7');
      await removeAssetPromise('uRm020067', 'n7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020218 end');
    })

    /**
     * @tc.name   testKeyRm020219
     * @tc.number SUB_ASSET_KEYRM_0219
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020219 begin');
      await removeAssetPromise('uRm020068', '');
      await addAssetPromise('uRm020068', 'pwd_16_chars_123', 'm8;n8');
      await removeAssetPromise('uRm020068', 'n8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020219 end');
    })

    /**
     * @tc.name   testKeyRm020220
     * @tc.number SUB_ASSET_KEYRM_0220
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020220 begin');
      await removeAssetPromise('uRm020069', '');
      await addAssetPromise('uRm020069', '中文密码', 'm9;n9');
      await removeAssetPromise('uRm020069', 'n9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020220 end');
    })

    /**
     * @tc.name   testKeyRm020221
     * @tc.number SUB_ASSET_KEYRM_0221
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020221 begin');
      await removeAssetPromise('uRm020070', '');
      await addAssetPromise('uRm020070', 'pwd@#$%^&*()', 'm10;n10');
      await removeAssetPromise('uRm020070', 'n10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020221 end');
    })

    /**
     * @tc.name   testKeyRm020222
     * @tc.number SUB_ASSET_KEYRM_0222
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020222 begin');
      await removeAssetPromise('uRm020071', '');
      await addAssetPromise('uRm020071', '12345678', 'm11;n11');
      await removeAssetPromise('uRm020071', 'n11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020222 end');
    })

    /**
     * @tc.name   testKeyRm020223
     * @tc.number SUB_ASSET_KEYRM_0223
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020223 begin');
      await removeAssetPromise('uRm020072', '');
      await addAssetPromise('uRm020072', 'p1', 'm12;n12');
      await removeAssetPromise('uRm020072', 'n12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020223 end');
    })

    /**
     * @tc.name   testKeyRm020224
     * @tc.number SUB_ASSET_KEYRM_0224
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020224 begin');
      await removeAssetPromise('uRm020073', '');
      await addAssetPromise('uRm020073', 'password8', 'm13;n13');
      await removeAssetPromise('uRm020073', 'n13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020224 end');
    })

    /**
     * @tc.name   testKeyRm020225
     * @tc.number SUB_ASSET_KEYRM_0225
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020225 begin');
      await removeAssetPromise('uRm020074', '');
      await addAssetPromise('uRm020074', 'pwd_16_chars_123', 'm14;n14');
      await removeAssetPromise('uRm020074', 'n14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020225 end');
    })

    /**
     * @tc.name   testKeyRm020226
     * @tc.number SUB_ASSET_KEYRM_0226
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020226 begin');
      await removeAssetPromise('uRm020075', '');
      await addAssetPromise('uRm020075', '中文密码', 'm15;n15');
      await removeAssetPromise('uRm020075', 'n15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020226 end');
    })

    /**
     * @tc.name   testKeyRm020227
     * @tc.number SUB_ASSET_KEYRM_0227
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020227 begin');
      await removeAssetPromise('uRm020076', '');
      await addAssetPromise('uRm020076', 'pwd@#$%^&*()', 'm16;n16');
      await removeAssetPromise('uRm020076', 'n16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020227 end');
    })

    /**
     * @tc.name   testKeyRm020228
     * @tc.number SUB_ASSET_KEYRM_0228
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020228 begin');
      await removeAssetPromise('uRm020077', '');
      await addAssetPromise('uRm020077', '12345678', 'm17;n17');
      await removeAssetPromise('uRm020077', 'n17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020228 end');
    })

    /**
     * @tc.name   testKeyRm020229
     * @tc.number SUB_ASSET_KEYRM_0229
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020229 begin');
      await removeAssetPromise('uRm020078', '');
      await addAssetPromise('uRm020078', 'p1', 'm18;n18');
      await removeAssetPromise('uRm020078', 'n18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020229 end');
    })

    /**
     * @tc.name   testKeyRm020230
     * @tc.number SUB_ASSET_KEYRM_0230
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020230 begin');
      await removeAssetPromise('uRm020079', '');
      await addAssetPromise('uRm020079', 'password8', 'm19;n19');
      await removeAssetPromise('uRm020079', 'n19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020230 end');
    })

    /**
     * @tc.name   testKeyRm020231
     * @tc.number SUB_ASSET_KEYRM_0231
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020231 begin');
      await removeAssetPromise('uRm020080', '');
      await addAssetPromise('uRm020080', 'pwd_16_chars_123', 'm20;n20');
      await removeAssetPromise('uRm020080', 'n20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020231 end');
    })

    /**
     * @tc.name   testKeyRm020232
     * @tc.number SUB_ASSET_KEYRM_0232
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020232 begin');
      await removeAssetPromise('uRm020081', '');
      await addAssetPromise('uRm020081', '中文密码', 'm21;n21');
      await removeAssetPromise('uRm020081', 'n21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020232 end');
    })

    /**
     * @tc.name   testKeyRm020233
     * @tc.number SUB_ASSET_KEYRM_0233
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020233 begin');
      await removeAssetPromise('uRm020082', '');
      await addAssetPromise('uRm020082', 'pwd@#$%^&*()', 'm22;n22');
      await removeAssetPromise('uRm020082', 'n22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020233 end');
    })

    /**
     * @tc.name   testKeyRm020234
     * @tc.number SUB_ASSET_KEYRM_0234
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020234 begin');
      await removeAssetPromise('uRm020083', '');
      await addAssetPromise('uRm020083', '12345678', 'm23;n23');
      await removeAssetPromise('uRm020083', 'n23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020234 end');
    })

    /**
     * @tc.name   testKeyRm020235
     * @tc.number SUB_ASSET_KEYRM_0235
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020235 begin');
      await removeAssetPromise('uRm020084', '');
      await addAssetPromise('uRm020084', 'p1', 'm24;n24');
      await removeAssetPromise('uRm020084', 'n24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020235 end');
    })

    /**
     * @tc.name   testKeyRm020236
     * @tc.number SUB_ASSET_KEYRM_0236
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020236 begin');
      await removeAssetPromise('uRm020085', '');
      await addAssetPromise('uRm020085', 'password8', 'm25;n25');
      await removeAssetPromise('uRm020085', 'n25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020236 end');
    })

    /**
     * @tc.name   testKeyRm020237
     * @tc.number SUB_ASSET_KEYRM_0237
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020237 begin');
      await removeAssetPromise('uRm020086', '');
      await addAssetPromise('uRm020086', 'pwd_16_chars_123', 'm26;n26');
      await removeAssetPromise('uRm020086', 'n26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020237 end');
    })

    /**
     * @tc.name   testKeyRm020238
     * @tc.number SUB_ASSET_KEYRM_0238
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020238 begin');
      await removeAssetPromise('uRm020087', '');
      await addAssetPromise('uRm020087', '中文密码', 'm27;n27');
      await removeAssetPromise('uRm020087', 'n27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020238 end');
    })

    /**
     * @tc.name   testKeyRm020239
     * @tc.number SUB_ASSET_KEYRM_0239
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020239 begin');
      await removeAssetPromise('uRm020088', '');
      await addAssetPromise('uRm020088', 'pwd@#$%^&*()', 'm28;n28');
      await removeAssetPromise('uRm020088', 'n28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020239 end');
    })

    /**
     * @tc.name   testKeyRm020240
     * @tc.number SUB_ASSET_KEYRM_0240
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020240 begin');
      await removeAssetPromise('uRm020089', '');
      await addAssetPromise('uRm020089', '12345678', 'm29;n29');
      await removeAssetPromise('uRm020089', 'n29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020240 end');
    })

    /**
     * @tc.name   testKeyRm020241
     * @tc.number SUB_ASSET_KEYRM_0241
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020241 begin');
      await removeAssetPromise('uRm020090', '');
      await addAssetPromise('uRm020090', 'p1', 'k0');
      await removeAssetPromise('uRm020090', 'nomatch0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020241 end');
    })

    /**
     * @tc.name   testKeyRm020242
     * @tc.number SUB_ASSET_KEYRM_0242
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020242 begin');
      await removeAssetPromise('uRm020091', '');
      await addAssetPromise('uRm020091', 'password8', 'k1');
      await removeAssetPromise('uRm020091', 'nomatch1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020242 end');
    })

    /**
     * @tc.name   testKeyRm020243
     * @tc.number SUB_ASSET_KEYRM_0243
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020243 begin');
      await removeAssetPromise('uRm020092', '');
      await addAssetPromise('uRm020092', 'pwd_16_chars_123', 'k2');
      await removeAssetPromise('uRm020092', 'nomatch2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020243 end');
    })

    /**
     * @tc.name   testKeyRm020244
     * @tc.number SUB_ASSET_KEYRM_0244
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020244 begin');
      await removeAssetPromise('uRm020093', '');
      await addAssetPromise('uRm020093', '中文密码', 'k3');
      await removeAssetPromise('uRm020093', 'nomatch3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020244 end');
    })

    /**
     * @tc.name   testKeyRm020245
     * @tc.number SUB_ASSET_KEYRM_0245
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020245 begin');
      await removeAssetPromise('uRm020094', '');
      await addAssetPromise('uRm020094', 'pwd@#$%^&*()', 'k4');
      await removeAssetPromise('uRm020094', 'nomatch4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020245 end');
    })

    /**
     * @tc.name   testKeyRm020246
     * @tc.number SUB_ASSET_KEYRM_0246
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020246 begin');
      await removeAssetPromise('uRm020095', '');
      await addAssetPromise('uRm020095', '12345678', 'k5');
      await removeAssetPromise('uRm020095', 'nomatch5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020246 end');
    })

    /**
     * @tc.name   testKeyRm020247
     * @tc.number SUB_ASSET_KEYRM_0247
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020247 begin');
      await removeAssetPromise('uRm020096', '');
      await addAssetPromise('uRm020096', 'p1', 'k6');
      await removeAssetPromise('uRm020096', 'nomatch6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020247 end');
    })

    /**
     * @tc.name   testKeyRm020248
     * @tc.number SUB_ASSET_KEYRM_0248
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020248 begin');
      await removeAssetPromise('uRm020097', '');
      await addAssetPromise('uRm020097', 'password8', 'k7');
      await removeAssetPromise('uRm020097', 'nomatch7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020248 end');
    })

    /**
     * @tc.name   testKeyRm020249
     * @tc.number SUB_ASSET_KEYRM_0249
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020249 begin');
      await removeAssetPromise('uRm020098', '');
      await addAssetPromise('uRm020098', 'pwd_16_chars_123', 'k8');
      await removeAssetPromise('uRm020098', 'nomatch8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020249 end');
    })

    /**
     * @tc.name   testKeyRm020250
     * @tc.number SUB_ASSET_KEYRM_0250
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020250 begin');
      await removeAssetPromise('uRm020099', '');
      await addAssetPromise('uRm020099', '中文密码', 'k9');
      await removeAssetPromise('uRm020099', 'nomatch9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020250 end');
    })

    /**
     * @tc.name   testKeyRm020251
     * @tc.number SUB_ASSET_KEYRM_0251
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020251 begin');
      await removeAssetPromise('uRm020100', '');
      await addAssetPromise('uRm020100', 'pwd@#$%^&*()', 'k10');
      await removeAssetPromise('uRm020100', 'nomatch10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020251 end');
    })

    /**
     * @tc.name   testKeyRm020252
     * @tc.number SUB_ASSET_KEYRM_0252
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020252 begin');
      await removeAssetPromise('uRm020101', '');
      await addAssetPromise('uRm020101', '12345678', 'k11');
      await removeAssetPromise('uRm020101', 'nomatch11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020252 end');
    })

    /**
     * @tc.name   testKeyRm020253
     * @tc.number SUB_ASSET_KEYRM_0253
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020253 begin');
      await removeAssetPromise('uRm020102', '');
      await addAssetPromise('uRm020102', 'p1', 'k12');
      await removeAssetPromise('uRm020102', 'nomatch12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020253 end');
    })

    /**
     * @tc.name   testKeyRm020254
     * @tc.number SUB_ASSET_KEYRM_0254
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020254 begin');
      await removeAssetPromise('uRm020103', '');
      await addAssetPromise('uRm020103', 'password8', 'k13');
      await removeAssetPromise('uRm020103', 'nomatch13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020254 end');
    })

    /**
     * @tc.name   testKeyRm020255
     * @tc.number SUB_ASSET_KEYRM_0255
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020255 begin');
      await removeAssetPromise('uRm020104', '');
      await addAssetPromise('uRm020104', 'pwd_16_chars_123', 'k14');
      await removeAssetPromise('uRm020104', 'nomatch14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020255 end');
    })

    /**
     * @tc.name   testKeyRm020256
     * @tc.number SUB_ASSET_KEYRM_0256
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020256 begin');
      await removeAssetPromise('uRm020105', '');
      await addAssetPromise('uRm020105', '中文密码', 'k15');
      await removeAssetPromise('uRm020105', 'nomatch15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020256 end');
    })

    /**
     * @tc.name   testKeyRm020257
     * @tc.number SUB_ASSET_KEYRM_0257
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020257 begin');
      await removeAssetPromise('uRm020106', '');
      await addAssetPromise('uRm020106', 'pwd@#$%^&*()', 'k16');
      await removeAssetPromise('uRm020106', 'nomatch16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020257 end');
    })

    /**
     * @tc.name   testKeyRm020258
     * @tc.number SUB_ASSET_KEYRM_0258
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020258 begin');
      await removeAssetPromise('uRm020107', '');
      await addAssetPromise('uRm020107', '12345678', 'k17');
      await removeAssetPromise('uRm020107', 'nomatch17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020258 end');
    })

    /**
     * @tc.name   testKeyRm020259
     * @tc.number SUB_ASSET_KEYRM_0259
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020259 begin');
      await removeAssetPromise('uRm020108', '');
      await addAssetPromise('uRm020108', 'p1', 'k18');
      await removeAssetPromise('uRm020108', 'nomatch18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020259 end');
    })

    /**
     * @tc.name   testKeyRm020260
     * @tc.number SUB_ASSET_KEYRM_0260
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020260 begin');
      await removeAssetPromise('uRm020109', '');
      await addAssetPromise('uRm020109', 'password8', 'k19');
      await removeAssetPromise('uRm020109', 'nomatch19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020260 end');
    })

    /**
     * @tc.name   testKeyRm020261
     * @tc.number SUB_ASSET_KEYRM_0261
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020261 begin');
      await removeAssetPromise('uRm020110', '');
      await addAssetPromise('uRm020110', 'pwd_16_chars_123', 'k20');
      await removeAssetPromise('uRm020110', 'nomatch20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020261 end');
    })

    /**
     * @tc.name   testKeyRm020262
     * @tc.number SUB_ASSET_KEYRM_0262
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020262 begin');
      await removeAssetPromise('uRm020111', '');
      await addAssetPromise('uRm020111', '中文密码', 'k21');
      await removeAssetPromise('uRm020111', 'nomatch21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020262 end');
    })

    /**
     * @tc.name   testKeyRm020263
     * @tc.number SUB_ASSET_KEYRM_0263
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020263 begin');
      await removeAssetPromise('uRm020112', '');
      await addAssetPromise('uRm020112', 'pwd@#$%^&*()', 'k22');
      await removeAssetPromise('uRm020112', 'nomatch22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020263 end');
    })

    /**
     * @tc.name   testKeyRm020264
     * @tc.number SUB_ASSET_KEYRM_0264
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020264 begin');
      await removeAssetPromise('uRm020113', '');
      await addAssetPromise('uRm020113', '12345678', 'k23');
      await removeAssetPromise('uRm020113', 'nomatch23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020264 end');
    })

    /**
     * @tc.name   testKeyRm020265
     * @tc.number SUB_ASSET_KEYRM_0265
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020265 begin');
      await removeAssetPromise('uRm020114', '');
      await addAssetPromise('uRm020114', 'p1', 'k24');
      await removeAssetPromise('uRm020114', 'nomatch24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020265 end');
    })

    /**
     * @tc.name   testKeyRm020266
     * @tc.number SUB_ASSET_KEYRM_0266
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020266 begin');
      await removeAssetPromise('uRm020115', '');
      await addAssetPromise('uRm020115', 'password8', 'k25');
      await removeAssetPromise('uRm020115', 'nomatch25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020266 end');
    })

    /**
     * @tc.name   testKeyRm020267
     * @tc.number SUB_ASSET_KEYRM_0267
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020267 begin');
      await removeAssetPromise('uRm020116', '');
      await addAssetPromise('uRm020116', 'pwd_16_chars_123', 'k26');
      await removeAssetPromise('uRm020116', 'nomatch26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020267 end');
    })

    /**
     * @tc.name   testKeyRm020268
     * @tc.number SUB_ASSET_KEYRM_0268
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020268 begin');
      await removeAssetPromise('uRm020117', '');
      await addAssetPromise('uRm020117', '中文密码', 'k27');
      await removeAssetPromise('uRm020117', 'nomatch27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020268 end');
    })

    /**
     * @tc.name   testKeyRm020269
     * @tc.number SUB_ASSET_KEYRM_0269
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020269 begin');
      await removeAssetPromise('uRm020118', '');
      await addAssetPromise('uRm020118', 'pwd@#$%^&*()', 'k28');
      await removeAssetPromise('uRm020118', 'nomatch28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020269 end');
    })

    /**
     * @tc.name   testKeyRm020270
     * @tc.number SUB_ASSET_KEYRM_0270
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020270 begin');
      await removeAssetPromise('uRm020119', '');
      await addAssetPromise('uRm020119', '12345678', 'k29');
      await removeAssetPromise('uRm020119', 'nomatch29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020270 end');
    })

    /**
     * @tc.name   testKeyRm020271
     * @tc.number SUB_ASSET_KEYRM_0271
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020271 begin');
      await removeAssetPromise('uRm020120', '');
      await addAssetPromise('uRm020120', 'p1', 's0;t0');
      await removeAssetPromise('uRm020120', 's0;;t0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020271 end');
    })

    /**
     * @tc.name   testKeyRm020272
     * @tc.number SUB_ASSET_KEYRM_0272
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020272 begin');
      await removeAssetPromise('uRm020121', '');
      await addAssetPromise('uRm020121', 'password8', 's1;t1');
      await removeAssetPromise('uRm020121', 's1;;t1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020272 end');
    })

    /**
     * @tc.name   testKeyRm020273
     * @tc.number SUB_ASSET_KEYRM_0273
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020273 begin');
      await removeAssetPromise('uRm020122', '');
      await addAssetPromise('uRm020122', 'pwd_16_chars_123', 's2;t2');
      await removeAssetPromise('uRm020122', 's2;;t2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020273 end');
    })

    /**
     * @tc.name   testKeyRm020274
     * @tc.number SUB_ASSET_KEYRM_0274
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020274 begin');
      await removeAssetPromise('uRm020123', '');
      await addAssetPromise('uRm020123', '中文密码', 's3;t3');
      await removeAssetPromise('uRm020123', 's3;;t3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020274 end');
    })

    /**
     * @tc.name   testKeyRm020275
     * @tc.number SUB_ASSET_KEYRM_0275
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020275 begin');
      await removeAssetPromise('uRm020124', '');
      await addAssetPromise('uRm020124', 'pwd@#$%^&*()', 's4;t4');
      await removeAssetPromise('uRm020124', 's4;;t4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020275 end');
    })

    /**
     * @tc.name   testKeyRm020276
     * @tc.number SUB_ASSET_KEYRM_0276
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020276 begin');
      await removeAssetPromise('uRm020125', '');
      await addAssetPromise('uRm020125', '12345678', 's5;t5');
      await removeAssetPromise('uRm020125', 's5;;t5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020276 end');
    })

    /**
     * @tc.name   testKeyRm020277
     * @tc.number SUB_ASSET_KEYRM_0277
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020277 begin');
      await removeAssetPromise('uRm020126', '');
      await addAssetPromise('uRm020126', 'p1', 's6;t6');
      await removeAssetPromise('uRm020126', 's6;;t6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020277 end');
    })

    /**
     * @tc.name   testKeyRm020278
     * @tc.number SUB_ASSET_KEYRM_0278
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020278 begin');
      await removeAssetPromise('uRm020127', '');
      await addAssetPromise('uRm020127', 'password8', 's7;t7');
      await removeAssetPromise('uRm020127', 's7;;t7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020278 end');
    })

    /**
     * @tc.name   testKeyRm020279
     * @tc.number SUB_ASSET_KEYRM_0279
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020279 begin');
      await removeAssetPromise('uRm020128', '');
      await addAssetPromise('uRm020128', 'pwd_16_chars_123', 's8;t8');
      await removeAssetPromise('uRm020128', 's8;;t8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020279 end');
    })

    /**
     * @tc.name   testKeyRm020280
     * @tc.number SUB_ASSET_KEYRM_0280
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020280 begin');
      await removeAssetPromise('uRm020129', '');
      await addAssetPromise('uRm020129', '中文密码', 's9;t9');
      await removeAssetPromise('uRm020129', 's9;;t9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020280 end');
    })

    /**
     * @tc.name   testKeyRm020281
     * @tc.number SUB_ASSET_KEYRM_0281
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020281 begin');
      await removeAssetPromise('uRm020130', '');
      await addAssetPromise('uRm020130', 'pwd@#$%^&*()', 's10;t10');
      await removeAssetPromise('uRm020130', 's10;;t10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020281 end');
    })

    /**
     * @tc.name   testKeyRm020282
     * @tc.number SUB_ASSET_KEYRM_0282
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020282 begin');
      await removeAssetPromise('uRm020131', '');
      await addAssetPromise('uRm020131', '12345678', 's11;t11');
      await removeAssetPromise('uRm020131', 's11;;t11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020282 end');
    })

    /**
     * @tc.name   testKeyRm020283
     * @tc.number SUB_ASSET_KEYRM_0283
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020283 begin');
      await removeAssetPromise('uRm020132', '');
      await addAssetPromise('uRm020132', 'p1', 's12;t12');
      await removeAssetPromise('uRm020132', 's12;;t12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020283 end');
    })

    /**
     * @tc.name   testKeyRm020284
     * @tc.number SUB_ASSET_KEYRM_0284
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020284 begin');
      await removeAssetPromise('uRm020133', '');
      await addAssetPromise('uRm020133', 'password8', 's13;t13');
      await removeAssetPromise('uRm020133', 's13;;t13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020284 end');
    })

    /**
     * @tc.name   testKeyRm020285
     * @tc.number SUB_ASSET_KEYRM_0285
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020285 begin');
      await removeAssetPromise('uRm020134', '');
      await addAssetPromise('uRm020134', 'pwd_16_chars_123', 's14;t14');
      await removeAssetPromise('uRm020134', 's14;;t14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm020134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020285 end');
    })

    /**
     * @tc.name   testKeyRm020286
     * @tc.number SUB_ASSET_KEYRM_0286
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020286 begin');
      await removeAssetPromise('uRm020135', '');
      await addAssetPromise('uRm020135', '中文密码', 'q0');
      await removeAssetPromise('uRm020135', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020286 end');
    })

    /**
     * @tc.name   testKeyRm020287
     * @tc.number SUB_ASSET_KEYRM_0287
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020287 begin');
      await removeAssetPromise('uRm020136', '');
      await addAssetPromise('uRm020136', 'pwd@#$%^&*()', 'q1');
      await removeAssetPromise('uRm020136', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020287 end');
    })

    /**
     * @tc.name   testKeyRm020288
     * @tc.number SUB_ASSET_KEYRM_0288
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020288 begin');
      await removeAssetPromise('uRm020137', '');
      await addAssetPromise('uRm020137', '12345678', 'q2');
      await removeAssetPromise('uRm020137', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020288 end');
    })

    /**
     * @tc.name   testKeyRm020289
     * @tc.number SUB_ASSET_KEYRM_0289
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020289 begin');
      await removeAssetPromise('uRm020138', '');
      await addAssetPromise('uRm020138', 'p1', 'q3');
      await removeAssetPromise('uRm020138', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020289 end');
    })

    /**
     * @tc.name   testKeyRm020290
     * @tc.number SUB_ASSET_KEYRM_0290
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020290 begin');
      await removeAssetPromise('uRm020139', '');
      await addAssetPromise('uRm020139', 'password8', 'q4');
      await removeAssetPromise('uRm020139', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020290 end');
    })

    /**
     * @tc.name   testKeyRm020291
     * @tc.number SUB_ASSET_KEYRM_0291
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020291 begin');
      await removeAssetPromise('uRm020140', '');
      await addAssetPromise('uRm020140', 'pwd_16_chars_123', 'q5');
      await removeAssetPromise('uRm020140', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020291 end');
    })

    /**
     * @tc.name   testKeyRm020292
     * @tc.number SUB_ASSET_KEYRM_0292
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020292 begin');
      await removeAssetPromise('uRm020141', '');
      await addAssetPromise('uRm020141', '中文密码', 'q6');
      await removeAssetPromise('uRm020141', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020292 end');
    })

    /**
     * @tc.name   testKeyRm020293
     * @tc.number SUB_ASSET_KEYRM_0293
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020293 begin');
      await removeAssetPromise('uRm020142', '');
      await addAssetPromise('uRm020142', 'pwd@#$%^&*()', 'q7');
      await removeAssetPromise('uRm020142', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020293 end');
    })

    /**
     * @tc.name   testKeyRm020294
     * @tc.number SUB_ASSET_KEYRM_0294
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020294 begin');
      await removeAssetPromise('uRm020143', '');
      await addAssetPromise('uRm020143', '12345678', 'q8');
      await removeAssetPromise('uRm020143', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020294 end');
    })

    /**
     * @tc.name   testKeyRm020295
     * @tc.number SUB_ASSET_KEYRM_0295
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020295 begin');
      await removeAssetPromise('uRm020144', '');
      await addAssetPromise('uRm020144', 'p1', 'q9');
      await removeAssetPromise('uRm020144', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020295 end');
    })

    /**
     * @tc.name   testKeyRm020296
     * @tc.number SUB_ASSET_KEYRM_0296
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020296 begin');
      await removeAssetPromise('uRm020145', '');
      await addAssetPromise('uRm020145', 'password8', 'q10');
      await removeAssetPromise('uRm020145', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020296 end');
    })

    /**
     * @tc.name   testKeyRm020297
     * @tc.number SUB_ASSET_KEYRM_0297
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020297 begin');
      await removeAssetPromise('uRm020146', '');
      await addAssetPromise('uRm020146', 'pwd_16_chars_123', 'q11');
      await removeAssetPromise('uRm020146', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020297 end');
    })

    /**
     * @tc.name   testKeyRm020298
     * @tc.number SUB_ASSET_KEYRM_0298
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020298 begin');
      await removeAssetPromise('uRm020147', '');
      await addAssetPromise('uRm020147', '中文密码', 'q12');
      await removeAssetPromise('uRm020147', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020298 end');
    })

    /**
     * @tc.name   testKeyRm020299
     * @tc.number SUB_ASSET_KEYRM_0299
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020299 begin');
      await removeAssetPromise('uRm020148', '');
      await addAssetPromise('uRm020148', 'pwd@#$%^&*()', 'q13');
      await removeAssetPromise('uRm020148', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020299 end');
    })

    /**
     * @tc.name   testKeyRm020300
     * @tc.number SUB_ASSET_KEYRM_0300
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020300 begin');
      await removeAssetPromise('uRm020149', '');
      await addAssetPromise('uRm020149', '12345678', 'q14');
      await removeAssetPromise('uRm020149', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm020149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm020149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm020300 end');
    })

  })
}
