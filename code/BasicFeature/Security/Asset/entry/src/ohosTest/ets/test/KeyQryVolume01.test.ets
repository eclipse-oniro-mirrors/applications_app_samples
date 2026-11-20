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

export default function keyQryVolume01() {
  describe('KeyQryVolume01Test', () => {

    /**
     * @tc.name   testKeyQry010001
     * @tc.number SUB_ASSET_KEYQRY_0001
     * @tc.desc   多标签 AND 条件查询命中回读 secret，条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010001 begin');
      const alias: string = 'uQryAnchor01';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'anchorPwd', 'tagA;tagB');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, 'tagA;tagB');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual('anchorPwd');
      const rows2: Map<string, string>[] = await queryAssetPromise(alias, 'tagA;missing');
      expect(rows2.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010001 end');
    })

    /**
     * @tc.name   testKeyQry010002
     * @tc.number SUB_ASSET_KEYQRY_0002
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010002 begin');
      await removeAssetPromise('uQry010001', '');
      await addAssetPromise('uQry010001', 'password8', 'g1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010002 end');
    })

    /**
     * @tc.name   testKeyQry010003
     * @tc.number SUB_ASSET_KEYQRY_0003
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010003 begin');
      await removeAssetPromise('uQry010002', '');
      await addAssetPromise('uQry010002', 'pwd_16_chars_123', 'g2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010003 end');
    })

    /**
     * @tc.name   testKeyQry010004
     * @tc.number SUB_ASSET_KEYQRY_0004
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010004 begin');
      await removeAssetPromise('uQry010003', '');
      await addAssetPromise('uQry010003', '中文密码', 'g3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010004 end');
    })

    /**
     * @tc.name   testKeyQry010005
     * @tc.number SUB_ASSET_KEYQRY_0005
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010005 begin');
      await removeAssetPromise('uQry010004', '');
      await addAssetPromise('uQry010004', 'pwd@#$%^&*()', 'g4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010005 end');
    })

    /**
     * @tc.name   testKeyQry010006
     * @tc.number SUB_ASSET_KEYQRY_0006
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010006 begin');
      await removeAssetPromise('uQry010005', '');
      await addAssetPromise('uQry010005', '12345678', 'l5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010006 end');
    })

    /**
     * @tc.name   testKeyQry010007
     * @tc.number SUB_ASSET_KEYQRY_0007
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010007 begin');
      await removeAssetPromise('uQry010006', '');
      await addAssetPromise('uQry010006', 'p1', 'l6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010007 end');
    })

    /**
     * @tc.name   testKeyQry010008
     * @tc.number SUB_ASSET_KEYQRY_0008
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010008 begin');
      await removeAssetPromise('uQry010007', '');
      await addAssetPromise('uQry010007', 'password8', 'l7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010008 end');
    })

    /**
     * @tc.name   testKeyQry010009
     * @tc.number SUB_ASSET_KEYQRY_0009
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010009 begin');
      await removeAssetPromise('uQry010008', '');
      await addAssetPromise('uQry010008', 'pwd_16_chars_123', 'l8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010009 end');
    })

    /**
     * @tc.name   testKeyQry010010
     * @tc.number SUB_ASSET_KEYQRY_0010
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010010 begin');
      await removeAssetPromise('uQry010009', '');
      await addAssetPromise('uQry010009', '中文密码', 'l9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010010 end');
    })

    /**
     * @tc.name   testKeyQry010011
     * @tc.number SUB_ASSET_KEYQRY_0011
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010011 begin');
      await removeAssetPromise('uQry010010', '');
      await addAssetPromise('uQry010010', 'pwd@#$%^&*()', 'l10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010011 end');
    })

    /**
     * @tc.name   testKeyQry010012
     * @tc.number SUB_ASSET_KEYQRY_0012
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010012 begin');
      await removeAssetPromise('uQry010011', '');
      await addAssetPromise('uQry010011', '12345678', 'l11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010012 end');
    })

    /**
     * @tc.name   testKeyQry010013
     * @tc.number SUB_ASSET_KEYQRY_0013
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010013 begin');
      await removeAssetPromise('uQry010012', '');
      await addAssetPromise('uQry010012', 'p1', 'l12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010013 end');
    })

    /**
     * @tc.name   testKeyQry010014
     * @tc.number SUB_ASSET_KEYQRY_0014
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010014 begin');
      await removeAssetPromise('uQry010013', '');
      await addAssetPromise('uQry010013', 'password8', 'l13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010014 end');
    })

    /**
     * @tc.name   testKeyQry010015
     * @tc.number SUB_ASSET_KEYQRY_0015
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010015 begin');
      await removeAssetPromise('uQry010014', '');
      await addAssetPromise('uQry010014', 'pwd_16_chars_123', 'l14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010015 end');
    })

    /**
     * @tc.name   testKeyQry010016
     * @tc.number SUB_ASSET_KEYQRY_0016
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010016 begin');
      await removeAssetPromise('uQry010015', '');
      await addAssetPromise('uQry010015', '中文密码', 'l15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010016 end');
    })

    /**
     * @tc.name   testKeyQry010017
     * @tc.number SUB_ASSET_KEYQRY_0017
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010017 begin');
      await removeAssetPromise('uQry010016', '');
      await addAssetPromise('uQry010016', 'pwd@#$%^&*()', 'l16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010017 end');
    })

    /**
     * @tc.name   testKeyQry010018
     * @tc.number SUB_ASSET_KEYQRY_0018
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010018 begin');
      await removeAssetPromise('uQry010017', '');
      await addAssetPromise('uQry010017', '12345678', 'l17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010018 end');
    })

    /**
     * @tc.name   testKeyQry010019
     * @tc.number SUB_ASSET_KEYQRY_0019
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010019 begin');
      await removeAssetPromise('uQry010018', '');
      await addAssetPromise('uQry010018', 'p1', 'l18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010019 end');
    })

    /**
     * @tc.name   testKeyQry010020
     * @tc.number SUB_ASSET_KEYQRY_0020
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010020 begin');
      await removeAssetPromise('uQry010019', '');
      await addAssetPromise('uQry010019', 'password8', 'l19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010020 end');
    })

    /**
     * @tc.name   testKeyQry010021
     * @tc.number SUB_ASSET_KEYQRY_0021
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010021 begin');
      await removeAssetPromise('uQry010020', '');
      await addAssetPromise('uQry010020', 'pwd_16_chars_123', 'l20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010021 end');
    })

    /**
     * @tc.name   testKeyQry010022
     * @tc.number SUB_ASSET_KEYQRY_0022
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010022 begin');
      await removeAssetPromise('uQry010021', '');
      await addAssetPromise('uQry010021', '中文密码', 'l21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010022 end');
    })

    /**
     * @tc.name   testKeyQry010023
     * @tc.number SUB_ASSET_KEYQRY_0023
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010023 begin');
      await removeAssetPromise('uQry010022', '');
      await addAssetPromise('uQry010022', 'pwd@#$%^&*()', 'l22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010023 end');
    })

    /**
     * @tc.name   testKeyQry010024
     * @tc.number SUB_ASSET_KEYQRY_0024
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010024 begin');
      await removeAssetPromise('uQry010023', '');
      await addAssetPromise('uQry010023', '12345678', 'l23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010024 end');
    })

    /**
     * @tc.name   testKeyQry010025
     * @tc.number SUB_ASSET_KEYQRY_0025
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010025 begin');
      await removeAssetPromise('uQry010024', '');
      await addAssetPromise('uQry010024', 'p1', 'l24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010025 end');
    })

    /**
     * @tc.name   testKeyQry010026
     * @tc.number SUB_ASSET_KEYQRY_0026
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010026 begin');
      await removeAssetPromise('uQry010025', '');
      await addAssetPromise('uQry010025', 'password8', 'l25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010026 end');
    })

    /**
     * @tc.name   testKeyQry010027
     * @tc.number SUB_ASSET_KEYQRY_0027
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010027 begin');
      await removeAssetPromise('uQry010026', '');
      await addAssetPromise('uQry010026', 'pwd_16_chars_123', 'l26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010027 end');
    })

    /**
     * @tc.name   testKeyQry010028
     * @tc.number SUB_ASSET_KEYQRY_0028
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010028 begin');
      await removeAssetPromise('uQry010027', '');
      await addAssetPromise('uQry010027', '中文密码', 'l27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010028 end');
    })

    /**
     * @tc.name   testKeyQry010029
     * @tc.number SUB_ASSET_KEYQRY_0029
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010029 begin');
      await removeAssetPromise('uQry010028', '');
      await addAssetPromise('uQry010028', 'pwd@#$%^&*()', 'l28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010029 end');
    })

    /**
     * @tc.name   testKeyQry010030
     * @tc.number SUB_ASSET_KEYQRY_0030
     * @tc.desc   合法值：已保存账号空标签条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010030 begin');
      await removeAssetPromise('uQry010029', '');
      await addAssetPromise('uQry010029', '12345678', 'l29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010030 end');
    })

    /**
     * @tc.name   testKeyQry010031
     * @tc.number SUB_ASSET_KEYQRY_0031
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010031 begin');
      await removeAssetPromise('uQry010030', '');
      await addAssetPromise('uQry010030', 'p1', 't0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010030', 't0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010031 end');
    })

    /**
     * @tc.name   testKeyQry010032
     * @tc.number SUB_ASSET_KEYQRY_0032
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010032 begin');
      await removeAssetPromise('uQry010031', '');
      await addAssetPromise('uQry010031', 'password8', 't1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010031', 't1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010032 end');
    })

    /**
     * @tc.name   testKeyQry010033
     * @tc.number SUB_ASSET_KEYQRY_0033
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010033 begin');
      await removeAssetPromise('uQry010032', '');
      await addAssetPromise('uQry010032', 'pwd_16_chars_123', 't2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010032', 't2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010033 end');
    })

    /**
     * @tc.name   testKeyQry010034
     * @tc.number SUB_ASSET_KEYQRY_0034
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010034 begin');
      await removeAssetPromise('uQry010033', '');
      await addAssetPromise('uQry010033', '中文密码', 't3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010033', 't3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010034 end');
    })

    /**
     * @tc.name   testKeyQry010035
     * @tc.number SUB_ASSET_KEYQRY_0035
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010035 begin');
      await removeAssetPromise('uQry010034', '');
      await addAssetPromise('uQry010034', 'pwd@#$%^&*()', 't4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010034', 't4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010035 end');
    })

    /**
     * @tc.name   testKeyQry010036
     * @tc.number SUB_ASSET_KEYQRY_0036
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010036 begin');
      await removeAssetPromise('uQry010035', '');
      await addAssetPromise('uQry010035', '12345678', 't5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010035', 't5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010036 end');
    })

    /**
     * @tc.name   testKeyQry010037
     * @tc.number SUB_ASSET_KEYQRY_0037
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010037 begin');
      await removeAssetPromise('uQry010036', '');
      await addAssetPromise('uQry010036', 'p1', 't6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010036', 't6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010037 end');
    })

    /**
     * @tc.name   testKeyQry010038
     * @tc.number SUB_ASSET_KEYQRY_0038
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010038 begin');
      await removeAssetPromise('uQry010037', '');
      await addAssetPromise('uQry010037', 'password8', 't7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010037', 't7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010038 end');
    })

    /**
     * @tc.name   testKeyQry010039
     * @tc.number SUB_ASSET_KEYQRY_0039
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010039 begin');
      await removeAssetPromise('uQry010038', '');
      await addAssetPromise('uQry010038', 'pwd_16_chars_123', 't8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010038', 't8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010039 end');
    })

    /**
     * @tc.name   testKeyQry010040
     * @tc.number SUB_ASSET_KEYQRY_0040
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010040 begin');
      await removeAssetPromise('uQry010039', '');
      await addAssetPromise('uQry010039', '中文密码', 't9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010039', 't9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010040 end');
    })

    /**
     * @tc.name   testKeyQry010041
     * @tc.number SUB_ASSET_KEYQRY_0041
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010041 begin');
      await removeAssetPromise('uQry010040', '');
      await addAssetPromise('uQry010040', 'pwd@#$%^&*()', 't10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010040', 't10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010041 end');
    })

    /**
     * @tc.name   testKeyQry010042
     * @tc.number SUB_ASSET_KEYQRY_0042
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010042 begin');
      await removeAssetPromise('uQry010041', '');
      await addAssetPromise('uQry010041', '12345678', 't11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010041', 't11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010042 end');
    })

    /**
     * @tc.name   testKeyQry010043
     * @tc.number SUB_ASSET_KEYQRY_0043
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010043 begin');
      await removeAssetPromise('uQry010042', '');
      await addAssetPromise('uQry010042', 'p1', 't12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010042', 't12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010043 end');
    })

    /**
     * @tc.name   testKeyQry010044
     * @tc.number SUB_ASSET_KEYQRY_0044
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010044 begin');
      await removeAssetPromise('uQry010043', '');
      await addAssetPromise('uQry010043', 'password8', 't13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010043', 't13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010044 end');
    })

    /**
     * @tc.name   testKeyQry010045
     * @tc.number SUB_ASSET_KEYQRY_0045
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010045 begin');
      await removeAssetPromise('uQry010044', '');
      await addAssetPromise('uQry010044', 'pwd_16_chars_123', 't14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010044', 't14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010045 end');
    })

    /**
     * @tc.name   testKeyQry010046
     * @tc.number SUB_ASSET_KEYQRY_0046
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010046 begin');
      await removeAssetPromise('uQry010045', '');
      await addAssetPromise('uQry010045', '中文密码', 't15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010045', 't15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010046 end');
    })

    /**
     * @tc.name   testKeyQry010047
     * @tc.number SUB_ASSET_KEYQRY_0047
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010047 begin');
      await removeAssetPromise('uQry010046', '');
      await addAssetPromise('uQry010046', 'pwd@#$%^&*()', 't16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010046', 't16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010047 end');
    })

    /**
     * @tc.name   testKeyQry010048
     * @tc.number SUB_ASSET_KEYQRY_0048
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010048 begin');
      await removeAssetPromise('uQry010047', '');
      await addAssetPromise('uQry010047', '12345678', 't17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010047', 't17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010048 end');
    })

    /**
     * @tc.name   testKeyQry010049
     * @tc.number SUB_ASSET_KEYQRY_0049
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010049 begin');
      await removeAssetPromise('uQry010048', '');
      await addAssetPromise('uQry010048', 'p1', 't18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010048', 't18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010049 end');
    })

    /**
     * @tc.name   testKeyQry010050
     * @tc.number SUB_ASSET_KEYQRY_0050
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010050 begin');
      await removeAssetPromise('uQry010049', '');
      await addAssetPromise('uQry010049', 'password8', 't19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010049', 't19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010050 end');
    })

    /**
     * @tc.name   testKeyQry010051
     * @tc.number SUB_ASSET_KEYQRY_0051
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010051 begin');
      await removeAssetPromise('uQry010050', '');
      await addAssetPromise('uQry010050', 'pwd_16_chars_123', 't20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010050', 't20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010051 end');
    })

    /**
     * @tc.name   testKeyQry010052
     * @tc.number SUB_ASSET_KEYQRY_0052
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010052 begin');
      await removeAssetPromise('uQry010051', '');
      await addAssetPromise('uQry010051', '中文密码', 't21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010051', 't21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010052 end');
    })

    /**
     * @tc.name   testKeyQry010053
     * @tc.number SUB_ASSET_KEYQRY_0053
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010053 begin');
      await removeAssetPromise('uQry010052', '');
      await addAssetPromise('uQry010052', 'pwd@#$%^&*()', 't22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010052', 't22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010053 end');
    })

    /**
     * @tc.name   testKeyQry010054
     * @tc.number SUB_ASSET_KEYQRY_0054
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010054 begin');
      await removeAssetPromise('uQry010053', '');
      await addAssetPromise('uQry010053', '12345678', 't23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010053', 't23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010054 end');
    })

    /**
     * @tc.name   testKeyQry010055
     * @tc.number SUB_ASSET_KEYQRY_0055
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010055 begin');
      await removeAssetPromise('uQry010054', '');
      await addAssetPromise('uQry010054', 'p1', 't24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010054', 't24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010055 end');
    })

    /**
     * @tc.name   testKeyQry010056
     * @tc.number SUB_ASSET_KEYQRY_0056
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010056 begin');
      await removeAssetPromise('uQry010055', '');
      await addAssetPromise('uQry010055', 'password8', 't25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010055', 't25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010056 end');
    })

    /**
     * @tc.name   testKeyQry010057
     * @tc.number SUB_ASSET_KEYQRY_0057
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010057 begin');
      await removeAssetPromise('uQry010056', '');
      await addAssetPromise('uQry010056', 'pwd_16_chars_123', 't26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010056', 't26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010057 end');
    })

    /**
     * @tc.name   testKeyQry010058
     * @tc.number SUB_ASSET_KEYQRY_0058
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010058 begin');
      await removeAssetPromise('uQry010057', '');
      await addAssetPromise('uQry010057', '中文密码', 't27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010057', 't27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010058 end');
    })

    /**
     * @tc.name   testKeyQry010059
     * @tc.number SUB_ASSET_KEYQRY_0059
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010059 begin');
      await removeAssetPromise('uQry010058', '');
      await addAssetPromise('uQry010058', 'pwd@#$%^&*()', 't28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010058', 't28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010059 end');
    })

    /**
     * @tc.name   testKeyQry010060
     * @tc.number SUB_ASSET_KEYQRY_0060
     * @tc.desc   合法值：已保存账号标签条件匹配查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010060 begin');
      await removeAssetPromise('uQry010059', '');
      await addAssetPromise('uQry010059', '12345678', 't29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010059', 't29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010060 end');
    })

    /**
     * @tc.name   testKeyQry010061
     * @tc.number SUB_ASSET_KEYQRY_0061
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010061 begin');
      await removeAssetPromise('uQry010060', '');
      await addAssetPromise('uQry010060', 'p1', 'k0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010060', 'nomatch0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010061 end');
    })

    /**
     * @tc.name   testKeyQry010062
     * @tc.number SUB_ASSET_KEYQRY_0062
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010062 begin');
      await removeAssetPromise('uQry010061', '');
      await addAssetPromise('uQry010061', 'password8', 'k1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010061', 'nomatch1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010062 end');
    })

    /**
     * @tc.name   testKeyQry010063
     * @tc.number SUB_ASSET_KEYQRY_0063
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010063 begin');
      await removeAssetPromise('uQry010062', '');
      await addAssetPromise('uQry010062', 'pwd_16_chars_123', 'k2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010062', 'nomatch2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010063 end');
    })

    /**
     * @tc.name   testKeyQry010064
     * @tc.number SUB_ASSET_KEYQRY_0064
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010064 begin');
      await removeAssetPromise('uQry010063', '');
      await addAssetPromise('uQry010063', '中文密码', 'k3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010063', 'nomatch3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010064 end');
    })

    /**
     * @tc.name   testKeyQry010065
     * @tc.number SUB_ASSET_KEYQRY_0065
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010065 begin');
      await removeAssetPromise('uQry010064', '');
      await addAssetPromise('uQry010064', 'pwd@#$%^&*()', 'k4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010064', 'nomatch4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010065 end');
    })

    /**
     * @tc.name   testKeyQry010066
     * @tc.number SUB_ASSET_KEYQRY_0066
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010066 begin');
      await removeAssetPromise('uQry010065', '');
      await addAssetPromise('uQry010065', '12345678', 'k5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010065', 'nomatch5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010066 end');
    })

    /**
     * @tc.name   testKeyQry010067
     * @tc.number SUB_ASSET_KEYQRY_0067
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010067 begin');
      await removeAssetPromise('uQry010066', '');
      await addAssetPromise('uQry010066', 'p1', 'k6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010066', 'nomatch6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010067 end');
    })

    /**
     * @tc.name   testKeyQry010068
     * @tc.number SUB_ASSET_KEYQRY_0068
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010068 begin');
      await removeAssetPromise('uQry010067', '');
      await addAssetPromise('uQry010067', 'password8', 'k7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010067', 'nomatch7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010068 end');
    })

    /**
     * @tc.name   testKeyQry010069
     * @tc.number SUB_ASSET_KEYQRY_0069
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010069 begin');
      await removeAssetPromise('uQry010068', '');
      await addAssetPromise('uQry010068', 'pwd_16_chars_123', 'k8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010068', 'nomatch8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010069 end');
    })

    /**
     * @tc.name   testKeyQry010070
     * @tc.number SUB_ASSET_KEYQRY_0070
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010070 begin');
      await removeAssetPromise('uQry010069', '');
      await addAssetPromise('uQry010069', '中文密码', 'k9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010069', 'nomatch9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010070 end');
    })

    /**
     * @tc.name   testKeyQry010071
     * @tc.number SUB_ASSET_KEYQRY_0071
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010071 begin');
      await removeAssetPromise('uQry010070', '');
      await addAssetPromise('uQry010070', 'pwd@#$%^&*()', 'k10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010070', 'nomatch10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010071 end');
    })

    /**
     * @tc.name   testKeyQry010072
     * @tc.number SUB_ASSET_KEYQRY_0072
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010072 begin');
      await removeAssetPromise('uQry010071', '');
      await addAssetPromise('uQry010071', '12345678', 'k11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010071', 'nomatch11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010072 end');
    })

    /**
     * @tc.name   testKeyQry010073
     * @tc.number SUB_ASSET_KEYQRY_0073
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010073 begin');
      await removeAssetPromise('uQry010072', '');
      await addAssetPromise('uQry010072', 'p1', 'k12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010072', 'nomatch12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010073 end');
    })

    /**
     * @tc.name   testKeyQry010074
     * @tc.number SUB_ASSET_KEYQRY_0074
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010074 begin');
      await removeAssetPromise('uQry010073', '');
      await addAssetPromise('uQry010073', 'password8', 'k13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010073', 'nomatch13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010074 end');
    })

    /**
     * @tc.name   testKeyQry010075
     * @tc.number SUB_ASSET_KEYQRY_0075
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010075 begin');
      await removeAssetPromise('uQry010074', '');
      await addAssetPromise('uQry010074', 'pwd_16_chars_123', 'k14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010074', 'nomatch14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010075 end');
    })

    /**
     * @tc.name   testKeyQry010076
     * @tc.number SUB_ASSET_KEYQRY_0076
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010076 begin');
      await removeAssetPromise('uQry010075', '');
      await addAssetPromise('uQry010075', '中文密码', 'k15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010075', 'nomatch15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010076 end');
    })

    /**
     * @tc.name   testKeyQry010077
     * @tc.number SUB_ASSET_KEYQRY_0077
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010077 begin');
      await removeAssetPromise('uQry010076', '');
      await addAssetPromise('uQry010076', 'pwd@#$%^&*()', 'k16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010076', 'nomatch16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010077 end');
    })

    /**
     * @tc.name   testKeyQry010078
     * @tc.number SUB_ASSET_KEYQRY_0078
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010078 begin');
      await removeAssetPromise('uQry010077', '');
      await addAssetPromise('uQry010077', '12345678', 'k17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010077', 'nomatch17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010078 end');
    })

    /**
     * @tc.name   testKeyQry010079
     * @tc.number SUB_ASSET_KEYQRY_0079
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010079 begin');
      await removeAssetPromise('uQry010078', '');
      await addAssetPromise('uQry010078', 'p1', 'k18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010078', 'nomatch18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010079 end');
    })

    /**
     * @tc.name   testKeyQry010080
     * @tc.number SUB_ASSET_KEYQRY_0080
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010080 begin');
      await removeAssetPromise('uQry010079', '');
      await addAssetPromise('uQry010079', 'password8', 'k19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010079', 'nomatch19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010080 end');
    })

    /**
     * @tc.name   testKeyQry010081
     * @tc.number SUB_ASSET_KEYQRY_0081
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010081 begin');
      await removeAssetPromise('uQry010080', '');
      await addAssetPromise('uQry010080', 'pwd_16_chars_123', 'k20');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010080', 'nomatch20');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010081 end');
    })

    /**
     * @tc.name   testKeyQry010082
     * @tc.number SUB_ASSET_KEYQRY_0082
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010082 begin');
      await removeAssetPromise('uQry010081', '');
      await addAssetPromise('uQry010081', '中文密码', 'k21');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010081', 'nomatch21');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010082 end');
    })

    /**
     * @tc.name   testKeyQry010083
     * @tc.number SUB_ASSET_KEYQRY_0083
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010083 begin');
      await removeAssetPromise('uQry010082', '');
      await addAssetPromise('uQry010082', 'pwd@#$%^&*()', 'k22');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010082', 'nomatch22');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010083 end');
    })

    /**
     * @tc.name   testKeyQry010084
     * @tc.number SUB_ASSET_KEYQRY_0084
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010084 begin');
      await removeAssetPromise('uQry010083', '');
      await addAssetPromise('uQry010083', '12345678', 'k23');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010083', 'nomatch23');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010084 end');
    })

    /**
     * @tc.name   testKeyQry010085
     * @tc.number SUB_ASSET_KEYQRY_0085
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010085 begin');
      await removeAssetPromise('uQry010084', '');
      await addAssetPromise('uQry010084', 'p1', 'k24');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010084', 'nomatch24');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010085 end');
    })

    /**
     * @tc.name   testKeyQry010086
     * @tc.number SUB_ASSET_KEYQRY_0086
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010086 begin');
      await removeAssetPromise('uQry010085', '');
      await addAssetPromise('uQry010085', 'password8', 'k25');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010085', 'nomatch25');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010086 end');
    })

    /**
     * @tc.name   testKeyQry010087
     * @tc.number SUB_ASSET_KEYQRY_0087
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010087 begin');
      await removeAssetPromise('uQry010086', '');
      await addAssetPromise('uQry010086', 'pwd_16_chars_123', 'k26');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010086', 'nomatch26');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010087 end');
    })

    /**
     * @tc.name   testKeyQry010088
     * @tc.number SUB_ASSET_KEYQRY_0088
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010088 begin');
      await removeAssetPromise('uQry010087', '');
      await addAssetPromise('uQry010087', '中文密码', 'k27');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010087', 'nomatch27');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010088 end');
    })

    /**
     * @tc.name   testKeyQry010089
     * @tc.number SUB_ASSET_KEYQRY_0089
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010089 begin');
      await removeAssetPromise('uQry010088', '');
      await addAssetPromise('uQry010088', 'pwd@#$%^&*()', 'k28');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010088', 'nomatch28');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010089 end');
    })

    /**
     * @tc.name   testKeyQry010090
     * @tc.number SUB_ASSET_KEYQRY_0090
     * @tc.desc   非法值：已保存账号标签条件不匹配返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010090 begin');
      await removeAssetPromise('uQry010089', '');
      await addAssetPromise('uQry010089', '12345678', 'k29');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010089', 'nomatch29');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010090 end');
    })

    /**
     * @tc.name   testKeyQry010091
     * @tc.number SUB_ASSET_KEYQRY_0091
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010091 begin');
      await removeAssetPromise('uQry010090', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010091 end');
    })

    /**
     * @tc.name   testKeyQry010092
     * @tc.number SUB_ASSET_KEYQRY_0092
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010092 begin');
      await removeAssetPromise('uQry010091', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010092 end');
    })

    /**
     * @tc.name   testKeyQry010093
     * @tc.number SUB_ASSET_KEYQRY_0093
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010093 begin');
      await removeAssetPromise('uQry010092', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010093 end');
    })

    /**
     * @tc.name   testKeyQry010094
     * @tc.number SUB_ASSET_KEYQRY_0094
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010094 begin');
      await removeAssetPromise('uQry010093', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010094 end');
    })

    /**
     * @tc.name   testKeyQry010095
     * @tc.number SUB_ASSET_KEYQRY_0095
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010095 begin');
      await removeAssetPromise('uQry010094', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010095 end');
    })

    /**
     * @tc.name   testKeyQry010096
     * @tc.number SUB_ASSET_KEYQRY_0096
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010096 begin');
      await removeAssetPromise('uQry010095', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010096 end');
    })

    /**
     * @tc.name   testKeyQry010097
     * @tc.number SUB_ASSET_KEYQRY_0097
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010097 begin');
      await removeAssetPromise('uQry010096', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010097 end');
    })

    /**
     * @tc.name   testKeyQry010098
     * @tc.number SUB_ASSET_KEYQRY_0098
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010098 begin');
      await removeAssetPromise('uQry010097', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010098 end');
    })

    /**
     * @tc.name   testKeyQry010099
     * @tc.number SUB_ASSET_KEYQRY_0099
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010099 begin');
      await removeAssetPromise('uQry010098', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010099 end');
    })

    /**
     * @tc.name   testKeyQry010100
     * @tc.number SUB_ASSET_KEYQRY_0100
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010100 begin');
      await removeAssetPromise('uQry010099', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010100 end');
    })

    /**
     * @tc.name   testKeyQry010101
     * @tc.number SUB_ASSET_KEYQRY_0101
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010101 begin');
      await removeAssetPromise('uQry010100', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010101 end');
    })

    /**
     * @tc.name   testKeyQry010102
     * @tc.number SUB_ASSET_KEYQRY_0102
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010102 begin');
      await removeAssetPromise('uQry010101', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010102 end');
    })

    /**
     * @tc.name   testKeyQry010103
     * @tc.number SUB_ASSET_KEYQRY_0103
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010103 begin');
      await removeAssetPromise('uQry010102', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010103 end');
    })

    /**
     * @tc.name   testKeyQry010104
     * @tc.number SUB_ASSET_KEYQRY_0104
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010104 begin');
      await removeAssetPromise('uQry010103', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010104 end');
    })

    /**
     * @tc.name   testKeyQry010105
     * @tc.number SUB_ASSET_KEYQRY_0105
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010105 begin');
      await removeAssetPromise('uQry010104', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010105 end');
    })

    /**
     * @tc.name   testKeyQry010106
     * @tc.number SUB_ASSET_KEYQRY_0106
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010106 begin');
      await removeAssetPromise('uQry010105', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010106 end');
    })

    /**
     * @tc.name   testKeyQry010107
     * @tc.number SUB_ASSET_KEYQRY_0107
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010107 begin');
      await removeAssetPromise('uQry010106', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010107 end');
    })

    /**
     * @tc.name   testKeyQry010108
     * @tc.number SUB_ASSET_KEYQRY_0108
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010108 begin');
      await removeAssetPromise('uQry010107', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010108 end');
    })

    /**
     * @tc.name   testKeyQry010109
     * @tc.number SUB_ASSET_KEYQRY_0109
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010109 begin');
      await removeAssetPromise('uQry010108', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010109 end');
    })

    /**
     * @tc.name   testKeyQry010110
     * @tc.number SUB_ASSET_KEYQRY_0110
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010110 begin');
      await removeAssetPromise('uQry010109', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010110 end');
    })

    /**
     * @tc.name   testKeyQry010111
     * @tc.number SUB_ASSET_KEYQRY_0111
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010111 begin');
      await removeAssetPromise('uQry010110', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010111 end');
    })

    /**
     * @tc.name   testKeyQry010112
     * @tc.number SUB_ASSET_KEYQRY_0112
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010112 begin');
      await removeAssetPromise('uQry010111', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010112 end');
    })

    /**
     * @tc.name   testKeyQry010113
     * @tc.number SUB_ASSET_KEYQRY_0113
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010113 begin');
      await removeAssetPromise('uQry010112', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010113 end');
    })

    /**
     * @tc.name   testKeyQry010114
     * @tc.number SUB_ASSET_KEYQRY_0114
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010114 begin');
      await removeAssetPromise('uQry010113', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010114 end');
    })

    /**
     * @tc.name   testKeyQry010115
     * @tc.number SUB_ASSET_KEYQRY_0115
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010115 begin');
      await removeAssetPromise('uQry010114', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010115 end');
    })

    /**
     * @tc.name   testKeyQry010116
     * @tc.number SUB_ASSET_KEYQRY_0116
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010116 begin');
      await removeAssetPromise('uQry010115', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010116 end');
    })

    /**
     * @tc.name   testKeyQry010117
     * @tc.number SUB_ASSET_KEYQRY_0117
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010117 begin');
      await removeAssetPromise('uQry010116', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010117 end');
    })

    /**
     * @tc.name   testKeyQry010118
     * @tc.number SUB_ASSET_KEYQRY_0118
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010118 begin');
      await removeAssetPromise('uQry010117', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010118 end');
    })

    /**
     * @tc.name   testKeyQry010119
     * @tc.number SUB_ASSET_KEYQRY_0119
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010119 begin');
      await removeAssetPromise('uQry010118', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010119 end');
    })

    /**
     * @tc.name   testKeyQry010120
     * @tc.number SUB_ASSET_KEYQRY_0120
     * @tc.desc   非法值：不存在账号查询返回 0 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010120 begin');
      await removeAssetPromise('uQry010119', '');
      // skip add: alias absent
      const result: Map<string, string>[] = await queryAssetPromise('uQry010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uQry010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010120 end');
    })

    /**
     * @tc.name   testKeyQry010121
     * @tc.number SUB_ASSET_KEYQRY_0121
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010121 begin');
      await removeAssetPromise('uQry010120', '');
      await addAssetPromise('uQry010120', 'p1', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010120', 'a0;b0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010121 end');
    })

    /**
     * @tc.name   testKeyQry010122
     * @tc.number SUB_ASSET_KEYQRY_0122
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010122 begin');
      await removeAssetPromise('uQry010121', '');
      await addAssetPromise('uQry010121', 'password8', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010121', 'a1;b1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010122 end');
    })

    /**
     * @tc.name   testKeyQry010123
     * @tc.number SUB_ASSET_KEYQRY_0123
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010123 begin');
      await removeAssetPromise('uQry010122', '');
      await addAssetPromise('uQry010122', 'pwd_16_chars_123', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010122', 'a2;b2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010123 end');
    })

    /**
     * @tc.name   testKeyQry010124
     * @tc.number SUB_ASSET_KEYQRY_0124
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010124 begin');
      await removeAssetPromise('uQry010123', '');
      await addAssetPromise('uQry010123', '中文密码', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010123', 'a3;b3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010124 end');
    })

    /**
     * @tc.name   testKeyQry010125
     * @tc.number SUB_ASSET_KEYQRY_0125
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010125 begin');
      await removeAssetPromise('uQry010124', '');
      await addAssetPromise('uQry010124', 'pwd@#$%^&*()', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010124', 'a4;b4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010125 end');
    })

    /**
     * @tc.name   testKeyQry010126
     * @tc.number SUB_ASSET_KEYQRY_0126
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010126 begin');
      await removeAssetPromise('uQry010125', '');
      await addAssetPromise('uQry010125', '12345678', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010125', 'a5;b5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010126 end');
    })

    /**
     * @tc.name   testKeyQry010127
     * @tc.number SUB_ASSET_KEYQRY_0127
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010127 begin');
      await removeAssetPromise('uQry010126', '');
      await addAssetPromise('uQry010126', 'p1', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010126', 'a6;b6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010127 end');
    })

    /**
     * @tc.name   testKeyQry010128
     * @tc.number SUB_ASSET_KEYQRY_0128
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010128 begin');
      await removeAssetPromise('uQry010127', '');
      await addAssetPromise('uQry010127', 'password8', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010127', 'a7;b7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010128 end');
    })

    /**
     * @tc.name   testKeyQry010129
     * @tc.number SUB_ASSET_KEYQRY_0129
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010129 begin');
      await removeAssetPromise('uQry010128', '');
      await addAssetPromise('uQry010128', 'pwd_16_chars_123', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010128', 'a8;b8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010129 end');
    })

    /**
     * @tc.name   testKeyQry010130
     * @tc.number SUB_ASSET_KEYQRY_0130
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010130 begin');
      await removeAssetPromise('uQry010129', '');
      await addAssetPromise('uQry010129', '中文密码', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010129', 'a9;b9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010130 end');
    })

    /**
     * @tc.name   testKeyQry010131
     * @tc.number SUB_ASSET_KEYQRY_0131
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010131 begin');
      await removeAssetPromise('uQry010130', '');
      await addAssetPromise('uQry010130', 'pwd@#$%^&*()', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010130', 'a10;b10');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010131 end');
    })

    /**
     * @tc.name   testKeyQry010132
     * @tc.number SUB_ASSET_KEYQRY_0132
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010132 begin');
      await removeAssetPromise('uQry010131', '');
      await addAssetPromise('uQry010131', '12345678', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010131', 'a11;b11');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010132 end');
    })

    /**
     * @tc.name   testKeyQry010133
     * @tc.number SUB_ASSET_KEYQRY_0133
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010133 begin');
      await removeAssetPromise('uQry010132', '');
      await addAssetPromise('uQry010132', 'p1', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010132', 'a12;b12');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010133 end');
    })

    /**
     * @tc.name   testKeyQry010134
     * @tc.number SUB_ASSET_KEYQRY_0134
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010134 begin');
      await removeAssetPromise('uQry010133', '');
      await addAssetPromise('uQry010133', 'password8', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010133', 'a13;b13');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010134 end');
    })

    /**
     * @tc.name   testKeyQry010135
     * @tc.number SUB_ASSET_KEYQRY_0135
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010135 begin');
      await removeAssetPromise('uQry010134', '');
      await addAssetPromise('uQry010134', 'pwd_16_chars_123', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010134', 'a14;b14');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010135 end');
    })

    /**
     * @tc.name   testKeyQry010136
     * @tc.number SUB_ASSET_KEYQRY_0136
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010136 begin');
      await removeAssetPromise('uQry010135', '');
      await addAssetPromise('uQry010135', '中文密码', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010135', 'a15;b15');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010136 end');
    })

    /**
     * @tc.name   testKeyQry010137
     * @tc.number SUB_ASSET_KEYQRY_0137
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010137 begin');
      await removeAssetPromise('uQry010136', '');
      await addAssetPromise('uQry010136', 'pwd@#$%^&*()', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010136', 'a16;b16');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010137 end');
    })

    /**
     * @tc.name   testKeyQry010138
     * @tc.number SUB_ASSET_KEYQRY_0138
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010138 begin');
      await removeAssetPromise('uQry010137', '');
      await addAssetPromise('uQry010137', '12345678', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010137', 'a17;b17');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010138 end');
    })

    /**
     * @tc.name   testKeyQry010139
     * @tc.number SUB_ASSET_KEYQRY_0139
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010139 begin');
      await removeAssetPromise('uQry010138', '');
      await addAssetPromise('uQry010138', 'p1', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010138', 'a18;b18');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010139 end');
    })

    /**
     * @tc.name   testKeyQry010140
     * @tc.number SUB_ASSET_KEYQRY_0140
     * @tc.desc   边界值：多标签 AND 条件查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010140 begin');
      await removeAssetPromise('uQry010139', '');
      await addAssetPromise('uQry010139', 'password8', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010139', 'a19;b19');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010140 end');
    })

    /**
     * @tc.name   testKeyQry010141
     * @tc.number SUB_ASSET_KEYQRY_0141
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010141 begin');
      await removeAssetPromise('uQry010140', '');
      await addAssetPromise('uQry010140', 'pwd_16_chars_123', 'd0');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010140', 'd0;d0');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010141 end');
    })

    /**
     * @tc.name   testKeyQry010142
     * @tc.number SUB_ASSET_KEYQRY_0142
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010142 begin');
      await removeAssetPromise('uQry010141', '');
      await addAssetPromise('uQry010141', '中文密码', 'd1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010141', 'd1;d1');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010142 end');
    })

    /**
     * @tc.name   testKeyQry010143
     * @tc.number SUB_ASSET_KEYQRY_0143
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010143 begin');
      await removeAssetPromise('uQry010142', '');
      await addAssetPromise('uQry010142', 'pwd@#$%^&*()', 'd2');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010142', 'd2;d2');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010143 end');
    })

    /**
     * @tc.name   testKeyQry010144
     * @tc.number SUB_ASSET_KEYQRY_0144
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010144 begin');
      await removeAssetPromise('uQry010143', '');
      await addAssetPromise('uQry010143', '12345678', 'd3');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010143', 'd3;d3');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010144 end');
    })

    /**
     * @tc.name   testKeyQry010145
     * @tc.number SUB_ASSET_KEYQRY_0145
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010145 begin');
      await removeAssetPromise('uQry010144', '');
      await addAssetPromise('uQry010144', 'p1', 'd4');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010144', 'd4;d4');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010145 end');
    })

    /**
     * @tc.name   testKeyQry010146
     * @tc.number SUB_ASSET_KEYQRY_0146
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010146 begin');
      await removeAssetPromise('uQry010145', '');
      await addAssetPromise('uQry010145', 'password8', 'd5');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010145', 'd5;d5');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010146 end');
    })

    /**
     * @tc.name   testKeyQry010147
     * @tc.number SUB_ASSET_KEYQRY_0147
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010147 begin');
      await removeAssetPromise('uQry010146', '');
      await addAssetPromise('uQry010146', 'pwd_16_chars_123', 'd6');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010146', 'd6;d6');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010147 end');
    })

    /**
     * @tc.name   testKeyQry010148
     * @tc.number SUB_ASSET_KEYQRY_0148
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010148 begin');
      await removeAssetPromise('uQry010147', '');
      await addAssetPromise('uQry010147', '中文密码', 'd7');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010147', 'd7;d7');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010148 end');
    })

    /**
     * @tc.name   testKeyQry010149
     * @tc.number SUB_ASSET_KEYQRY_0149
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010149 begin');
      await removeAssetPromise('uQry010148', '');
      await addAssetPromise('uQry010148', 'pwd@#$%^&*()', 'd8');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010148', 'd8;d8');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010149 end');
    })

    /**
     * @tc.name   testKeyQry010150
     * @tc.number SUB_ASSET_KEYQRY_0150
     * @tc.desc   边界值：重复标签条件去重后查询返回 1 条
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyQry010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010150 begin');
      await removeAssetPromise('uQry010149', '');
      await addAssetPromise('uQry010149', '12345678', 'd9');
      const result: Map<string, string>[] = await queryAssetPromise('uQry010149', 'd9;d9');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uQry010149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyQry010150 end');
    })

  })
}
