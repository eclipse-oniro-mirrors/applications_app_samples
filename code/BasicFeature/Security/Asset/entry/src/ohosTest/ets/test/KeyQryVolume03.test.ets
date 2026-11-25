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

export default function keyQryVolume03() {
  describe('KeyQryVolume03Test', () => {

    /**
     * @tc.name   testKeyQry030301
     * @tc.number SUB_ASSET_KEYQRY_0301
     * @tc.desc   多标签 AND 条件查询命中回读 secret，条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030301 begin');
      const alias: string = 'uQryAnchor01';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'anchorPwd', 'tagA;tagB');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, 'tagA;tagB');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual('anchorPwd');
      const rows2: Map<string, string>[] = await queryAssetPromise(alias, 'tagA;missing');
      expect(rows2.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030301 end');
    })

    /**
     * @tc.name   testKeyQry030302
     * @tc.number SUB_ASSET_KEYQRY_0302
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030302 begin');
      await removeAssetPromise('uQry030001', '');
      await addAssetPromise('uQry030001', 'password8', 'g1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030302 end');
    })

    /**
     * @tc.name   testKeyQry030303
     * @tc.number SUB_ASSET_KEYQRY_0303
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030303 begin');
      await removeAssetPromise('uQry030002', '');
      await addAssetPromise('uQry030002', 'pwd_16_chars_123', 'g2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030303 end');
    })

    /**
     * @tc.name   testKeyQry030304
     * @tc.number SUB_ASSET_KEYQRY_0304
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030304 begin');
      await removeAssetPromise('uQry030003', '');
      await addAssetPromise('uQry030003', '中文密码', 'g3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030304 end');
    })

    /**
     * @tc.name   testKeyQry030305
     * @tc.number SUB_ASSET_KEYQRY_0305
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030305 begin');
      await removeAssetPromise('uQry030004', '');
      await addAssetPromise('uQry030004', 'pwd@#$%^&*()', 'g4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030305 end');
    })

    /**
     * @tc.name   testKeyQry030306
     * @tc.number SUB_ASSET_KEYQRY_0306
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030306 begin');
      await removeAssetPromise('uQry030005', '');
      await addAssetPromise('uQry030005', '12345678', 'l5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030306 end');
    })

    /**
     * @tc.name   testKeyQry030307
     * @tc.number SUB_ASSET_KEYQRY_0307
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030307 begin');
      await removeAssetPromise('uQry030006', '');
      await addAssetPromise('uQry030006', 'p1', 'l6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030307 end');
    })

    /**
     * @tc.name   testKeyQry030308
     * @tc.number SUB_ASSET_KEYQRY_0308
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030308 begin');
      await removeAssetPromise('uQry030007', '');
      await addAssetPromise('uQry030007', 'password8', 'l7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030308 end');
    })

    /**
     * @tc.name   testKeyQry030309
     * @tc.number SUB_ASSET_KEYQRY_0309
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030309 begin');
      await removeAssetPromise('uQry030008', '');
      await addAssetPromise('uQry030008', 'pwd_16_chars_123', 'l8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030309 end');
    })

    /**
     * @tc.name   testKeyQry030310
     * @tc.number SUB_ASSET_KEYQRY_0310
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030310 begin');
      await removeAssetPromise('uQry030009', '');
      await addAssetPromise('uQry030009', '中文密码', 'l9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030310 end');
    })

    /**
     * @tc.name   testKeyQry030311
     * @tc.number SUB_ASSET_KEYQRY_0311
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030311 begin');
      await removeAssetPromise('uQry030010', '');
      await addAssetPromise('uQry030010', 'pwd@#$%^&*()', 'l10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030311 end');
    })

    /**
     * @tc.name   testKeyQry030312
     * @tc.number SUB_ASSET_KEYQRY_0312
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030312 begin');
      await removeAssetPromise('uQry030011', '');
      await addAssetPromise('uQry030011', '12345678', 'l11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030312 end');
    })

    /**
     * @tc.name   testKeyQry030313
     * @tc.number SUB_ASSET_KEYQRY_0313
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030313 begin');
      await removeAssetPromise('uQry030012', '');
      await addAssetPromise('uQry030012', 'p1', 'l12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030313 end');
    })

    /**
     * @tc.name   testKeyQry030314
     * @tc.number SUB_ASSET_KEYQRY_0314
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030314 begin');
      await removeAssetPromise('uQry030013', '');
      await addAssetPromise('uQry030013', 'password8', 'l13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030314 end');
    })

    /**
     * @tc.name   testKeyQry030315
     * @tc.number SUB_ASSET_KEYQRY_0315
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030315 begin');
      await removeAssetPromise('uQry030014', '');
      await addAssetPromise('uQry030014', 'pwd_16_chars_123', 'l14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030315 end');
    })

    /**
     * @tc.name   testKeyQry030316
     * @tc.number SUB_ASSET_KEYQRY_0316
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030316 begin');
      await removeAssetPromise('uQry030015', '');
      await addAssetPromise('uQry030015', '中文密码', 'l15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030316 end');
    })

    /**
     * @tc.name   testKeyQry030317
     * @tc.number SUB_ASSET_KEYQRY_0317
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030317 begin');
      await removeAssetPromise('uQry030016', '');
      await addAssetPromise('uQry030016', 'pwd@#$%^&*()', 'l16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030317 end');
    })

    /**
     * @tc.name   testKeyQry030318
     * @tc.number SUB_ASSET_KEYQRY_0318
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030318 begin');
      await removeAssetPromise('uQry030017', '');
      await addAssetPromise('uQry030017', '12345678', 'l17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030318 end');
    })

    /**
     * @tc.name   testKeyQry030319
     * @tc.number SUB_ASSET_KEYQRY_0319
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030319 begin');
      await removeAssetPromise('uQry030018', '');
      await addAssetPromise('uQry030018', 'p1', 'l18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030319 end');
    })

    /**
     * @tc.name   testKeyQry030320
     * @tc.number SUB_ASSET_KEYQRY_0320
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030320 begin');
      await removeAssetPromise('uQry030019', '');
      await addAssetPromise('uQry030019', 'password8', 'l19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030320 end');
    })

    /**
     * @tc.name   testKeyQry030321
     * @tc.number SUB_ASSET_KEYQRY_0321
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030321 begin');
      await removeAssetPromise('uQry030020', '');
      await addAssetPromise('uQry030020', 'pwd_16_chars_123', 'l20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030321 end');
    })

    /**
     * @tc.name   testKeyQry030322
     * @tc.number SUB_ASSET_KEYQRY_0322
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030322 begin');
      await removeAssetPromise('uQry030021', '');
      await addAssetPromise('uQry030021', '中文密码', 'l21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030322 end');
    })

    /**
     * @tc.name   testKeyQry030323
     * @tc.number SUB_ASSET_KEYQRY_0323
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030323 begin');
      await removeAssetPromise('uQry030022', '');
      await addAssetPromise('uQry030022', 'pwd@#$%^&*()', 'l22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030323 end');
    })

    /**
     * @tc.name   testKeyQry030324
     * @tc.number SUB_ASSET_KEYQRY_0324
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030324 begin');
      await removeAssetPromise('uQry030023', '');
      await addAssetPromise('uQry030023', '12345678', 'l23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030324 end');
    })

    /**
     * @tc.name   testKeyQry030325
     * @tc.number SUB_ASSET_KEYQRY_0325
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030325 begin');
      await removeAssetPromise('uQry030024', '');
      await addAssetPromise('uQry030024', 'p1', 'l24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030325 end');
    })

    /**
     * @tc.name   testKeyQry030326
     * @tc.number SUB_ASSET_KEYQRY_0326
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030326 begin');
      await removeAssetPromise('uQry030025', '');
      await addAssetPromise('uQry030025', 'password8', 'l25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030326 end');
    })

    /**
     * @tc.name   testKeyQry030327
     * @tc.number SUB_ASSET_KEYQRY_0327
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030327 begin');
      await removeAssetPromise('uQry030026', '');
      await addAssetPromise('uQry030026', 'pwd_16_chars_123', 'l26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030327 end');
    })

    /**
     * @tc.name   testKeyQry030328
     * @tc.number SUB_ASSET_KEYQRY_0328
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030328 begin');
      await removeAssetPromise('uQry030027', '');
      await addAssetPromise('uQry030027', '中文密码', 'l27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030328 end');
    })

    /**
     * @tc.name   testKeyQry030329
     * @tc.number SUB_ASSET_KEYQRY_0329
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030329 begin');
      await removeAssetPromise('uQry030028', '');
      await addAssetPromise('uQry030028', 'pwd@#$%^&*()', 'l28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030329 end');
    })

    /**
     * @tc.name   testKeyQry030330
     * @tc.number SUB_ASSET_KEYQRY_0330
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030330 begin');
      await removeAssetPromise('uQry030029', '');
      await addAssetPromise('uQry030029', '12345678', 'l29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030330 end');
    })

    /**
     * @tc.name   testKeyQry030331
     * @tc.number SUB_ASSET_KEYQRY_0331
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030331 begin');
      await removeAssetPromise('uQry030030', '');
      await addAssetPromise('uQry030030', 'p1', 't0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030030', 't0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030331 end');
    })

    /**
     * @tc.name   testKeyQry030332
     * @tc.number SUB_ASSET_KEYQRY_0332
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030332 begin');
      await removeAssetPromise('uQry030031', '');
      await addAssetPromise('uQry030031', 'password8', 't1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030031', 't1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030332 end');
    })

    /**
     * @tc.name   testKeyQry030333
     * @tc.number SUB_ASSET_KEYQRY_0333
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030333 begin');
      await removeAssetPromise('uQry030032', '');
      await addAssetPromise('uQry030032', 'pwd_16_chars_123', 't2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030032', 't2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030333 end');
    })

    /**
     * @tc.name   testKeyQry030334
     * @tc.number SUB_ASSET_KEYQRY_0334
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030334 begin');
      await removeAssetPromise('uQry030033', '');
      await addAssetPromise('uQry030033', '中文密码', 't3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030033', 't3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030334 end');
    })

    /**
     * @tc.name   testKeyQry030335
     * @tc.number SUB_ASSET_KEYQRY_0335
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030335 begin');
      await removeAssetPromise('uQry030034', '');
      await addAssetPromise('uQry030034', 'pwd@#$%^&*()', 't4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030034', 't4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030335 end');
    })

    /**
     * @tc.name   testKeyQry030336
     * @tc.number SUB_ASSET_KEYQRY_0336
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030336 begin');
      await removeAssetPromise('uQry030035', '');
      await addAssetPromise('uQry030035', '12345678', 't5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030035', 't5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030336 end');
    })

    /**
     * @tc.name   testKeyQry030337
     * @tc.number SUB_ASSET_KEYQRY_0337
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030337 begin');
      await removeAssetPromise('uQry030036', '');
      await addAssetPromise('uQry030036', 'p1', 't6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030036', 't6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030337 end');
    })

    /**
     * @tc.name   testKeyQry030338
     * @tc.number SUB_ASSET_KEYQRY_0338
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030338 begin');
      await removeAssetPromise('uQry030037', '');
      await addAssetPromise('uQry030037', 'password8', 't7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030037', 't7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030338 end');
    })

    /**
     * @tc.name   testKeyQry030339
     * @tc.number SUB_ASSET_KEYQRY_0339
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030339 begin');
      await removeAssetPromise('uQry030038', '');
      await addAssetPromise('uQry030038', 'pwd_16_chars_123', 't8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030038', 't8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030339 end');
    })

    /**
     * @tc.name   testKeyQry030340
     * @tc.number SUB_ASSET_KEYQRY_0340
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030340 begin');
      await removeAssetPromise('uQry030039', '');
      await addAssetPromise('uQry030039', '中文密码', 't9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030039', 't9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030340 end');
    })

    /**
     * @tc.name   testKeyQry030341
     * @tc.number SUB_ASSET_KEYQRY_0341
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030341 begin');
      await removeAssetPromise('uQry030040', '');
      await addAssetPromise('uQry030040', 'pwd@#$%^&*()', 't10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030040', 't10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030341 end');
    })

    /**
     * @tc.name   testKeyQry030342
     * @tc.number SUB_ASSET_KEYQRY_0342
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030342 begin');
      await removeAssetPromise('uQry030041', '');
      await addAssetPromise('uQry030041', '12345678', 't11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030041', 't11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030342 end');
    })

    /**
     * @tc.name   testKeyQry030343
     * @tc.number SUB_ASSET_KEYQRY_0343
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030343 begin');
      await removeAssetPromise('uQry030042', '');
      await addAssetPromise('uQry030042', 'p1', 't12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030042', 't12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030343 end');
    })

    /**
     * @tc.name   testKeyQry030344
     * @tc.number SUB_ASSET_KEYQRY_0344
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030344 begin');
      await removeAssetPromise('uQry030043', '');
      await addAssetPromise('uQry030043', 'password8', 't13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030043', 't13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030344 end');
    })

    /**
     * @tc.name   testKeyQry030345
     * @tc.number SUB_ASSET_KEYQRY_0345
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030345 begin');
      await removeAssetPromise('uQry030044', '');
      await addAssetPromise('uQry030044', 'pwd_16_chars_123', 't14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030044', 't14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030345 end');
    })

    /**
     * @tc.name   testKeyQry030346
     * @tc.number SUB_ASSET_KEYQRY_0346
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030346 begin');
      await removeAssetPromise('uQry030045', '');
      await addAssetPromise('uQry030045', '中文密码', 't15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030045', 't15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030346 end');
    })

    /**
     * @tc.name   testKeyQry030347
     * @tc.number SUB_ASSET_KEYQRY_0347
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030347 begin');
      await removeAssetPromise('uQry030046', '');
      await addAssetPromise('uQry030046', 'pwd@#$%^&*()', 't16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030046', 't16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030347 end');
    })

    /**
     * @tc.name   testKeyQry030348
     * @tc.number SUB_ASSET_KEYQRY_0348
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030348 begin');
      await removeAssetPromise('uQry030047', '');
      await addAssetPromise('uQry030047', '12345678', 't17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030047', 't17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030348 end');
    })

    /**
     * @tc.name   testKeyQry030349
     * @tc.number SUB_ASSET_KEYQRY_0349
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030349 begin');
      await removeAssetPromise('uQry030048', '');
      await addAssetPromise('uQry030048', 'p1', 't18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030048', 't18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030349 end');
    })

    /**
     * @tc.name   testKeyQry030350
     * @tc.number SUB_ASSET_KEYQRY_0350
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030350 begin');
      await removeAssetPromise('uQry030049', '');
      await addAssetPromise('uQry030049', 'password8', 't19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030049', 't19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030350 end');
    })

    /**
     * @tc.name   testKeyQry030351
     * @tc.number SUB_ASSET_KEYQRY_0351
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030351 begin');
      await removeAssetPromise('uQry030050', '');
      await addAssetPromise('uQry030050', 'pwd_16_chars_123', 't20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030050', 't20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030351 end');
    })

    /**
     * @tc.name   testKeyQry030352
     * @tc.number SUB_ASSET_KEYQRY_0352
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030352 begin');
      await removeAssetPromise('uQry030051', '');
      await addAssetPromise('uQry030051', '中文密码', 't21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030051', 't21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030352 end');
    })

    /**
     * @tc.name   testKeyQry030353
     * @tc.number SUB_ASSET_KEYQRY_0353
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030353 begin');
      await removeAssetPromise('uQry030052', '');
      await addAssetPromise('uQry030052', 'pwd@#$%^&*()', 't22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030052', 't22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030353 end');
    })

    /**
     * @tc.name   testKeyQry030354
     * @tc.number SUB_ASSET_KEYQRY_0354
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030354 begin');
      await removeAssetPromise('uQry030053', '');
      await addAssetPromise('uQry030053', '12345678', 't23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030053', 't23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030354 end');
    })

    /**
     * @tc.name   testKeyQry030355
     * @tc.number SUB_ASSET_KEYQRY_0355
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030355 begin');
      await removeAssetPromise('uQry030054', '');
      await addAssetPromise('uQry030054', 'p1', 't24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030054', 't24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030355 end');
    })

    /**
     * @tc.name   testKeyQry030356
     * @tc.number SUB_ASSET_KEYQRY_0356
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030356 begin');
      await removeAssetPromise('uQry030055', '');
      await addAssetPromise('uQry030055', 'password8', 't25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030055', 't25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030356 end');
    })

    /**
     * @tc.name   testKeyQry030357
     * @tc.number SUB_ASSET_KEYQRY_0357
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030357 begin');
      await removeAssetPromise('uQry030056', '');
      await addAssetPromise('uQry030056', 'pwd_16_chars_123', 't26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030056', 't26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030357 end');
    })

    /**
     * @tc.name   testKeyQry030358
     * @tc.number SUB_ASSET_KEYQRY_0358
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030358 begin');
      await removeAssetPromise('uQry030057', '');
      await addAssetPromise('uQry030057', '中文密码', 't27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030057', 't27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030358 end');
    })

    /**
     * @tc.name   testKeyQry030359
     * @tc.number SUB_ASSET_KEYQRY_0359
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030359 begin');
      await removeAssetPromise('uQry030058', '');
      await addAssetPromise('uQry030058', 'pwd@#$%^&*()', 't28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030058', 't28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030359 end');
    })

    /**
     * @tc.name   testKeyQry030360
     * @tc.number SUB_ASSET_KEYQRY_0360
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030360 begin');
      await removeAssetPromise('uQry030059', '');
      await addAssetPromise('uQry030059', '12345678', 't29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030059', 't29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030360 end');
    })

    /**
     * @tc.name   testKeyQry030361
     * @tc.number SUB_ASSET_KEYQRY_0361
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030361 begin');
      await removeAssetPromise('uQry030060', '');
      await addAssetPromise('uQry030060', 'p1', 'k0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030060', 'nomatch0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030361 end');
    })

    /**
     * @tc.name   testKeyQry030362
     * @tc.number SUB_ASSET_KEYQRY_0362
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030362 begin');
      await removeAssetPromise('uQry030061', '');
      await addAssetPromise('uQry030061', 'password8', 'k1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030061', 'nomatch1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030362 end');
    })

    /**
     * @tc.name   testKeyQry030363
     * @tc.number SUB_ASSET_KEYQRY_0363
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030363 begin');
      await removeAssetPromise('uQry030062', '');
      await addAssetPromise('uQry030062', 'pwd_16_chars_123', 'k2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030062', 'nomatch2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030363 end');
    })

    /**
     * @tc.name   testKeyQry030364
     * @tc.number SUB_ASSET_KEYQRY_0364
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030364 begin');
      await removeAssetPromise('uQry030063', '');
      await addAssetPromise('uQry030063', '中文密码', 'k3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030063', 'nomatch3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030364 end');
    })

    /**
     * @tc.name   testKeyQry030365
     * @tc.number SUB_ASSET_KEYQRY_0365
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030365 begin');
      await removeAssetPromise('uQry030064', '');
      await addAssetPromise('uQry030064', 'pwd@#$%^&*()', 'k4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030064', 'nomatch4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030365 end');
    })

    /**
     * @tc.name   testKeyQry030366
     * @tc.number SUB_ASSET_KEYQRY_0366
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030366 begin');
      await removeAssetPromise('uQry030065', '');
      await addAssetPromise('uQry030065', '12345678', 'k5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030065', 'nomatch5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030366 end');
    })

    /**
     * @tc.name   testKeyQry030367
     * @tc.number SUB_ASSET_KEYQRY_0367
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030367 begin');
      await removeAssetPromise('uQry030066', '');
      await addAssetPromise('uQry030066', 'p1', 'k6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030066', 'nomatch6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030367 end');
    })

    /**
     * @tc.name   testKeyQry030368
     * @tc.number SUB_ASSET_KEYQRY_0368
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030368 begin');
      await removeAssetPromise('uQry030067', '');
      await addAssetPromise('uQry030067', 'password8', 'k7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030067', 'nomatch7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030368 end');
    })

    /**
     * @tc.name   testKeyQry030369
     * @tc.number SUB_ASSET_KEYQRY_0369
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030369 begin');
      await removeAssetPromise('uQry030068', '');
      await addAssetPromise('uQry030068', 'pwd_16_chars_123', 'k8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030068', 'nomatch8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030369 end');
    })

    /**
     * @tc.name   testKeyQry030370
     * @tc.number SUB_ASSET_KEYQRY_0370
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030370 begin');
      await removeAssetPromise('uQry030069', '');
      await addAssetPromise('uQry030069', '中文密码', 'k9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030069', 'nomatch9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030370 end');
    })

    /**
     * @tc.name   testKeyQry030371
     * @tc.number SUB_ASSET_KEYQRY_0371
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030371 begin');
      await removeAssetPromise('uQry030070', '');
      await addAssetPromise('uQry030070', 'pwd@#$%^&*()', 'k10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030070', 'nomatch10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030371 end');
    })

    /**
     * @tc.name   testKeyQry030372
     * @tc.number SUB_ASSET_KEYQRY_0372
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030372 begin');
      await removeAssetPromise('uQry030071', '');
      await addAssetPromise('uQry030071', '12345678', 'k11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030071', 'nomatch11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030372 end');
    })

    /**
     * @tc.name   testKeyQry030373
     * @tc.number SUB_ASSET_KEYQRY_0373
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030373 begin');
      await removeAssetPromise('uQry030072', '');
      await addAssetPromise('uQry030072', 'p1', 'k12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030072', 'nomatch12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030373 end');
    })

    /**
     * @tc.name   testKeyQry030374
     * @tc.number SUB_ASSET_KEYQRY_0374
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030374 begin');
      await removeAssetPromise('uQry030073', '');
      await addAssetPromise('uQry030073', 'password8', 'k13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030073', 'nomatch13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030374 end');
    })

    /**
     * @tc.name   testKeyQry030375
     * @tc.number SUB_ASSET_KEYQRY_0375
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030375 begin');
      await removeAssetPromise('uQry030074', '');
      await addAssetPromise('uQry030074', 'pwd_16_chars_123', 'k14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030074', 'nomatch14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030375 end');
    })

    /**
     * @tc.name   testKeyQry030376
     * @tc.number SUB_ASSET_KEYQRY_0376
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030376 begin');
      await removeAssetPromise('uQry030075', '');
      await addAssetPromise('uQry030075', '中文密码', 'k15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030075', 'nomatch15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030376 end');
    })

    /**
     * @tc.name   testKeyQry030377
     * @tc.number SUB_ASSET_KEYQRY_0377
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030377 begin');
      await removeAssetPromise('uQry030076', '');
      await addAssetPromise('uQry030076', 'pwd@#$%^&*()', 'k16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030076', 'nomatch16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030377 end');
    })

    /**
     * @tc.name   testKeyQry030378
     * @tc.number SUB_ASSET_KEYQRY_0378
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030378 begin');
      await removeAssetPromise('uQry030077', '');
      await addAssetPromise('uQry030077', '12345678', 'k17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030077', 'nomatch17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030378 end');
    })

    /**
     * @tc.name   testKeyQry030379
     * @tc.number SUB_ASSET_KEYQRY_0379
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030379 begin');
      await removeAssetPromise('uQry030078', '');
      await addAssetPromise('uQry030078', 'p1', 'k18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030078', 'nomatch18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030379 end');
    })

    /**
     * @tc.name   testKeyQry030380
     * @tc.number SUB_ASSET_KEYQRY_0380
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030380 begin');
      await removeAssetPromise('uQry030079', '');
      await addAssetPromise('uQry030079', 'password8', 'k19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030079', 'nomatch19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030380 end');
    })

    /**
     * @tc.name   testKeyQry030381
     * @tc.number SUB_ASSET_KEYQRY_0381
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030381 begin');
      await removeAssetPromise('uQry030080', '');
      await addAssetPromise('uQry030080', 'pwd_16_chars_123', 'k20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030080', 'nomatch20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030381 end');
    })

    /**
     * @tc.name   testKeyQry030382
     * @tc.number SUB_ASSET_KEYQRY_0382
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030382 begin');
      await removeAssetPromise('uQry030081', '');
      await addAssetPromise('uQry030081', '中文密码', 'k21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030081', 'nomatch21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030382 end');
    })

    /**
     * @tc.name   testKeyQry030383
     * @tc.number SUB_ASSET_KEYQRY_0383
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030383 begin');
      await removeAssetPromise('uQry030082', '');
      await addAssetPromise('uQry030082', 'pwd@#$%^&*()', 'k22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030082', 'nomatch22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030383 end');
    })

    /**
     * @tc.name   testKeyQry030384
     * @tc.number SUB_ASSET_KEYQRY_0384
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030384 begin');
      await removeAssetPromise('uQry030083', '');
      await addAssetPromise('uQry030083', '12345678', 'k23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030083', 'nomatch23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030384 end');
    })

    /**
     * @tc.name   testKeyQry030385
     * @tc.number SUB_ASSET_KEYQRY_0385
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030385 begin');
      await removeAssetPromise('uQry030084', '');
      await addAssetPromise('uQry030084', 'p1', 'k24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030084', 'nomatch24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030385 end');
    })

    /**
     * @tc.name   testKeyQry030386
     * @tc.number SUB_ASSET_KEYQRY_0386
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030386 begin');
      await removeAssetPromise('uQry030085', '');
      await addAssetPromise('uQry030085', 'password8', 'k25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030085', 'nomatch25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030386 end');
    })

    /**
     * @tc.name   testKeyQry030387
     * @tc.number SUB_ASSET_KEYQRY_0387
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030387 begin');
      await removeAssetPromise('uQry030086', '');
      await addAssetPromise('uQry030086', 'pwd_16_chars_123', 'k26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030086', 'nomatch26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030387 end');
    })

    /**
     * @tc.name   testKeyQry030388
     * @tc.number SUB_ASSET_KEYQRY_0388
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030388 begin');
      await removeAssetPromise('uQry030087', '');
      await addAssetPromise('uQry030087', '中文密码', 'k27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030087', 'nomatch27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030388 end');
    })

    /**
     * @tc.name   testKeyQry030389
     * @tc.number SUB_ASSET_KEYQRY_0389
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030389 begin');
      await removeAssetPromise('uQry030088', '');
      await addAssetPromise('uQry030088', 'pwd@#$%^&*()', 'k28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030088', 'nomatch28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030389 end');
    })

    /**
     * @tc.name   testKeyQry030390
     * @tc.number SUB_ASSET_KEYQRY_0390
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030390 begin');
      await removeAssetPromise('uQry030089', '');
      await addAssetPromise('uQry030089', '12345678', 'k29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030089', 'nomatch29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030390 end');
    })

    /**
     * @tc.name   testKeyQry030391
     * @tc.number SUB_ASSET_KEYQRY_0391
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030391 begin');
      await removeAssetPromise('uQry030090', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030391 end');
    })

    /**
     * @tc.name   testKeyQry030392
     * @tc.number SUB_ASSET_KEYQRY_0392
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030392 begin');
      await removeAssetPromise('uQry030091', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030392 end');
    })

    /**
     * @tc.name   testKeyQry030393
     * @tc.number SUB_ASSET_KEYQRY_0393
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030393 begin');
      await removeAssetPromise('uQry030092', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030393 end');
    })

    /**
     * @tc.name   testKeyQry030394
     * @tc.number SUB_ASSET_KEYQRY_0394
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030394 begin');
      await removeAssetPromise('uQry030093', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030394 end');
    })

    /**
     * @tc.name   testKeyQry030395
     * @tc.number SUB_ASSET_KEYQRY_0395
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030395 begin');
      await removeAssetPromise('uQry030094', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030395 end');
    })

    /**
     * @tc.name   testKeyQry030396
     * @tc.number SUB_ASSET_KEYQRY_0396
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030396 begin');
      await removeAssetPromise('uQry030095', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030396 end');
    })

    /**
     * @tc.name   testKeyQry030397
     * @tc.number SUB_ASSET_KEYQRY_0397
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030397 begin');
      await removeAssetPromise('uQry030096', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030397 end');
    })

    /**
     * @tc.name   testKeyQry030398
     * @tc.number SUB_ASSET_KEYQRY_0398
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030398 begin');
      await removeAssetPromise('uQry030097', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030398 end');
    })

    /**
     * @tc.name   testKeyQry030399
     * @tc.number SUB_ASSET_KEYQRY_0399
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030399 begin');
      await removeAssetPromise('uQry030098', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030399 end');
    })

    /**
     * @tc.name   testKeyQry030400
     * @tc.number SUB_ASSET_KEYQRY_0400
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030400 begin');
      await removeAssetPromise('uQry030099', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030400 end');
    })

    /**
     * @tc.name   testKeyQry030401
     * @tc.number SUB_ASSET_KEYQRY_0401
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030401 begin');
      await removeAssetPromise('uQry030100', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030401 end');
    })

    /**
     * @tc.name   testKeyQry030402
     * @tc.number SUB_ASSET_KEYQRY_0402
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030402 begin');
      await removeAssetPromise('uQry030101', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030402 end');
    })

    /**
     * @tc.name   testKeyQry030403
     * @tc.number SUB_ASSET_KEYQRY_0403
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030403 begin');
      await removeAssetPromise('uQry030102', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030403 end');
    })

    /**
     * @tc.name   testKeyQry030404
     * @tc.number SUB_ASSET_KEYQRY_0404
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030404 begin');
      await removeAssetPromise('uQry030103', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030404 end');
    })

    /**
     * @tc.name   testKeyQry030405
     * @tc.number SUB_ASSET_KEYQRY_0405
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030405 begin');
      await removeAssetPromise('uQry030104', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030405 end');
    })

    /**
     * @tc.name   testKeyQry030406
     * @tc.number SUB_ASSET_KEYQRY_0406
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030406 begin');
      await removeAssetPromise('uQry030105', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030406 end');
    })

    /**
     * @tc.name   testKeyQry030407
     * @tc.number SUB_ASSET_KEYQRY_0407
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030407 begin');
      await removeAssetPromise('uQry030106', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030407 end');
    })

    /**
     * @tc.name   testKeyQry030408
     * @tc.number SUB_ASSET_KEYQRY_0408
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030408 begin');
      await removeAssetPromise('uQry030107', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030408 end');
    })

    /**
     * @tc.name   testKeyQry030409
     * @tc.number SUB_ASSET_KEYQRY_0409
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030409 begin');
      await removeAssetPromise('uQry030108', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030409 end');
    })

    /**
     * @tc.name   testKeyQry030410
     * @tc.number SUB_ASSET_KEYQRY_0410
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030410 begin');
      await removeAssetPromise('uQry030109', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030410 end');
    })

    /**
     * @tc.name   testKeyQry030411
     * @tc.number SUB_ASSET_KEYQRY_0411
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030411 begin');
      await removeAssetPromise('uQry030110', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030411 end');
    })

    /**
     * @tc.name   testKeyQry030412
     * @tc.number SUB_ASSET_KEYQRY_0412
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030412 begin');
      await removeAssetPromise('uQry030111', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030412 end');
    })

    /**
     * @tc.name   testKeyQry030413
     * @tc.number SUB_ASSET_KEYQRY_0413
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030413 begin');
      await removeAssetPromise('uQry030112', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030413 end');
    })

    /**
     * @tc.name   testKeyQry030414
     * @tc.number SUB_ASSET_KEYQRY_0414
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030414 begin');
      await removeAssetPromise('uQry030113', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030414 end');
    })

    /**
     * @tc.name   testKeyQry030415
     * @tc.number SUB_ASSET_KEYQRY_0415
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030415 begin');
      await removeAssetPromise('uQry030114', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030415 end');
    })

    /**
     * @tc.name   testKeyQry030416
     * @tc.number SUB_ASSET_KEYQRY_0416
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030416 begin');
      await removeAssetPromise('uQry030115', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030416 end');
    })

    /**
     * @tc.name   testKeyQry030417
     * @tc.number SUB_ASSET_KEYQRY_0417
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030417 begin');
      await removeAssetPromise('uQry030116', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030417 end');
    })

    /**
     * @tc.name   testKeyQry030418
     * @tc.number SUB_ASSET_KEYQRY_0418
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030418 begin');
      await removeAssetPromise('uQry030117', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030418 end');
    })

    /**
     * @tc.name   testKeyQry030419
     * @tc.number SUB_ASSET_KEYQRY_0419
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030419 begin');
      await removeAssetPromise('uQry030118', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030419 end');
    })

    /**
     * @tc.name   testKeyQry030420
     * @tc.number SUB_ASSET_KEYQRY_0420
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030420 begin');
      await removeAssetPromise('uQry030119', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry030119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry030119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030420 end');
    })

    /**
     * @tc.name   testKeyQry030421
     * @tc.number SUB_ASSET_KEYQRY_0421
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030421 begin');
      await removeAssetPromise('uQry030120', '');
      await addAssetPromise('uQry030120', 'p1', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030120', 'a0;b0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030421 end');
    })

    /**
     * @tc.name   testKeyQry030422
     * @tc.number SUB_ASSET_KEYQRY_0422
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030422 begin');
      await removeAssetPromise('uQry030121', '');
      await addAssetPromise('uQry030121', 'password8', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030121', 'a1;b1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030422 end');
    })

    /**
     * @tc.name   testKeyQry030423
     * @tc.number SUB_ASSET_KEYQRY_0423
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030423 begin');
      await removeAssetPromise('uQry030122', '');
      await addAssetPromise('uQry030122', 'pwd_16_chars_123', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030122', 'a2;b2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030423 end');
    })

    /**
     * @tc.name   testKeyQry030424
     * @tc.number SUB_ASSET_KEYQRY_0424
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030424 begin');
      await removeAssetPromise('uQry030123', '');
      await addAssetPromise('uQry030123', '中文密码', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030123', 'a3;b3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030424 end');
    })

    /**
     * @tc.name   testKeyQry030425
     * @tc.number SUB_ASSET_KEYQRY_0425
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030425 begin');
      await removeAssetPromise('uQry030124', '');
      await addAssetPromise('uQry030124', 'pwd@#$%^&*()', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030124', 'a4;b4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030425 end');
    })

    /**
     * @tc.name   testKeyQry030426
     * @tc.number SUB_ASSET_KEYQRY_0426
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030426 begin');
      await removeAssetPromise('uQry030125', '');
      await addAssetPromise('uQry030125', '12345678', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030125', 'a5;b5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030426 end');
    })

    /**
     * @tc.name   testKeyQry030427
     * @tc.number SUB_ASSET_KEYQRY_0427
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030427 begin');
      await removeAssetPromise('uQry030126', '');
      await addAssetPromise('uQry030126', 'p1', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030126', 'a6;b6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030427 end');
    })

    /**
     * @tc.name   testKeyQry030428
     * @tc.number SUB_ASSET_KEYQRY_0428
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030428 begin');
      await removeAssetPromise('uQry030127', '');
      await addAssetPromise('uQry030127', 'password8', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030127', 'a7;b7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030428 end');
    })

    /**
     * @tc.name   testKeyQry030429
     * @tc.number SUB_ASSET_KEYQRY_0429
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030429 begin');
      await removeAssetPromise('uQry030128', '');
      await addAssetPromise('uQry030128', 'pwd_16_chars_123', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030128', 'a8;b8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030429 end');
    })

    /**
     * @tc.name   testKeyQry030430
     * @tc.number SUB_ASSET_KEYQRY_0430
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030430 begin');
      await removeAssetPromise('uQry030129', '');
      await addAssetPromise('uQry030129', '中文密码', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030129', 'a9;b9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030430 end');
    })

    /**
     * @tc.name   testKeyQry030431
     * @tc.number SUB_ASSET_KEYQRY_0431
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030431 begin');
      await removeAssetPromise('uQry030130', '');
      await addAssetPromise('uQry030130', 'pwd@#$%^&*()', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030130', 'a10;b10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030431 end');
    })

    /**
     * @tc.name   testKeyQry030432
     * @tc.number SUB_ASSET_KEYQRY_0432
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030432 begin');
      await removeAssetPromise('uQry030131', '');
      await addAssetPromise('uQry030131', '12345678', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030131', 'a11;b11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030432 end');
    })

    /**
     * @tc.name   testKeyQry030433
     * @tc.number SUB_ASSET_KEYQRY_0433
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030433 begin');
      await removeAssetPromise('uQry030132', '');
      await addAssetPromise('uQry030132', 'p1', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030132', 'a12;b12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030433 end');
    })

    /**
     * @tc.name   testKeyQry030434
     * @tc.number SUB_ASSET_KEYQRY_0434
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030434 begin');
      await removeAssetPromise('uQry030133', '');
      await addAssetPromise('uQry030133', 'password8', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030133', 'a13;b13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030434 end');
    })

    /**
     * @tc.name   testKeyQry030435
     * @tc.number SUB_ASSET_KEYQRY_0435
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030435 begin');
      await removeAssetPromise('uQry030134', '');
      await addAssetPromise('uQry030134', 'pwd_16_chars_123', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030134', 'a14;b14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030435 end');
    })

    /**
     * @tc.name   testKeyQry030436
     * @tc.number SUB_ASSET_KEYQRY_0436
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030436 begin');
      await removeAssetPromise('uQry030135', '');
      await addAssetPromise('uQry030135', '中文密码', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030135', 'a15;b15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030436 end');
    })

    /**
     * @tc.name   testKeyQry030437
     * @tc.number SUB_ASSET_KEYQRY_0437
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030437 begin');
      await removeAssetPromise('uQry030136', '');
      await addAssetPromise('uQry030136', 'pwd@#$%^&*()', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030136', 'a16;b16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030437 end');
    })

    /**
     * @tc.name   testKeyQry030438
     * @tc.number SUB_ASSET_KEYQRY_0438
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030438 begin');
      await removeAssetPromise('uQry030137', '');
      await addAssetPromise('uQry030137', '12345678', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030137', 'a17;b17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030438 end');
    })

    /**
     * @tc.name   testKeyQry030439
     * @tc.number SUB_ASSET_KEYQRY_0439
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030439 begin');
      await removeAssetPromise('uQry030138', '');
      await addAssetPromise('uQry030138', 'p1', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030138', 'a18;b18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030439 end');
    })

    /**
     * @tc.name   testKeyQry030440
     * @tc.number SUB_ASSET_KEYQRY_0440
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030440 begin');
      await removeAssetPromise('uQry030139', '');
      await addAssetPromise('uQry030139', 'password8', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030139', 'a19;b19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030440 end');
    })

    /**
     * @tc.name   testKeyQry030441
     * @tc.number SUB_ASSET_KEYQRY_0441
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030441 begin');
      await removeAssetPromise('uQry030140', '');
      await addAssetPromise('uQry030140', 'pwd_16_chars_123', 'd0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030140', 'd0;d0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030441 end');
    })

    /**
     * @tc.name   testKeyQry030442
     * @tc.number SUB_ASSET_KEYQRY_0442
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030442 begin');
      await removeAssetPromise('uQry030141', '');
      await addAssetPromise('uQry030141', '中文密码', 'd1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030141', 'd1;d1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030442 end');
    })

    /**
     * @tc.name   testKeyQry030443
     * @tc.number SUB_ASSET_KEYQRY_0443
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030443 begin');
      await removeAssetPromise('uQry030142', '');
      await addAssetPromise('uQry030142', 'pwd@#$%^&*()', 'd2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030142', 'd2;d2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030443 end');
    })

    /**
     * @tc.name   testKeyQry030444
     * @tc.number SUB_ASSET_KEYQRY_0444
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030444 begin');
      await removeAssetPromise('uQry030143', '');
      await addAssetPromise('uQry030143', '12345678', 'd3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030143', 'd3;d3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030444 end');
    })

    /**
     * @tc.name   testKeyQry030445
     * @tc.number SUB_ASSET_KEYQRY_0445
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030445 begin');
      await removeAssetPromise('uQry030144', '');
      await addAssetPromise('uQry030144', 'p1', 'd4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030144', 'd4;d4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030445 end');
    })

    /**
     * @tc.name   testKeyQry030446
     * @tc.number SUB_ASSET_KEYQRY_0446
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030446 begin');
      await removeAssetPromise('uQry030145', '');
      await addAssetPromise('uQry030145', 'password8', 'd5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030145', 'd5;d5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030446 end');
    })

    /**
     * @tc.name   testKeyQry030447
     * @tc.number SUB_ASSET_KEYQRY_0447
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030447 begin');
      await removeAssetPromise('uQry030146', '');
      await addAssetPromise('uQry030146', 'pwd_16_chars_123', 'd6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030146', 'd6;d6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030447 end');
    })

    /**
     * @tc.name   testKeyQry030448
     * @tc.number SUB_ASSET_KEYQRY_0448
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030448 begin');
      await removeAssetPromise('uQry030147', '');
      await addAssetPromise('uQry030147', '中文密码', 'd7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030147', 'd7;d7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030448 end');
    })

    /**
     * @tc.name   testKeyQry030449
     * @tc.number SUB_ASSET_KEYQRY_0449
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030449 begin');
      await removeAssetPromise('uQry030148', '');
      await addAssetPromise('uQry030148', 'pwd@#$%^&*()', 'j8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030148', 'j8;j8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030449 end');
    })

    /**
     * @tc.name   testKeyQry030450
     * @tc.number SUB_ASSET_KEYQRY_0450
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry030450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030450 begin');
      await removeAssetPromise('uQry030149', '');
      await addAssetPromise('uQry030149', '12345678', 'd9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry030149', 'd9;d9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry030149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry030450 end');
    })

  })
}
