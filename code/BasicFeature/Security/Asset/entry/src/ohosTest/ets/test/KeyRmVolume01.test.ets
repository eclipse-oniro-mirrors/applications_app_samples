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

export default function keyRmVolume01() {
  describe('KeyRmVolume01Test', () => {

    /**
     * @tc.name   testKeyRm010001
     * @tc.number SUB_ASSET_KEYRM_0001
     * @tc.desc   标签匹配整体删除后查询 0 条，标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010001 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010001 end');
    })

    /**
     * @tc.name   testKeyRm010002
     * @tc.number SUB_ASSET_KEYRM_0002
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010002 begin');
      await removeAssetPromise('uRm010001', '');
      await addAssetPromise('uRm010001', 'password8', 'g1');
      await removeAssetPromise('uRm010001', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010002 end');
    })

    /**
     * @tc.name   testKeyRm010003
     * @tc.number SUB_ASSET_KEYRM_0003
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010003 begin');
      await removeAssetPromise('uRm010002', '');
      await addAssetPromise('uRm010002', 'pwd_16_chars_123', 'g2');
      await removeAssetPromise('uRm010002', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010003 end');
    })

    /**
     * @tc.name   testKeyRm010004
     * @tc.number SUB_ASSET_KEYRM_0004
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010004 begin');
      await removeAssetPromise('uRm010003', '');
      await addAssetPromise('uRm010003', '中文密码', 'g3');
      await removeAssetPromise('uRm010003', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010004 end');
    })

    /**
     * @tc.name   testKeyRm010005
     * @tc.number SUB_ASSET_KEYRM_0005
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010005 begin');
      await removeAssetPromise('uRm010004', '');
      await addAssetPromise('uRm010004', 'pwd@#$%^&*()', 'g4');
      await removeAssetPromise('uRm010004', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010005 end');
    })

    /**
     * @tc.name   testKeyRm010006
     * @tc.number SUB_ASSET_KEYRM_0006
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010006 begin');
      await removeAssetPromise('uRm010005', '');
      await addAssetPromise('uRm010005', '12345678', 'l5');
      await removeAssetPromise('uRm010005', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010006 end');
    })

    /**
     * @tc.name   testKeyRm010007
     * @tc.number SUB_ASSET_KEYRM_0007
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010007 begin');
      await removeAssetPromise('uRm010006', '');
      await addAssetPromise('uRm010006', 'p1', 'l6');
      await removeAssetPromise('uRm010006', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010007 end');
    })

    /**
     * @tc.name   testKeyRm010008
     * @tc.number SUB_ASSET_KEYRM_0008
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010008 begin');
      await removeAssetPromise('uRm010007', '');
      await addAssetPromise('uRm010007', 'password8', 'l7');
      await removeAssetPromise('uRm010007', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010008 end');
    })

    /**
     * @tc.name   testKeyRm010009
     * @tc.number SUB_ASSET_KEYRM_0009
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010009 begin');
      await removeAssetPromise('uRm010008', '');
      await addAssetPromise('uRm010008', 'pwd_16_chars_123', 'l8');
      await removeAssetPromise('uRm010008', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010009 end');
    })

    /**
     * @tc.name   testKeyRm010010
     * @tc.number SUB_ASSET_KEYRM_0010
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010010 begin');
      await removeAssetPromise('uRm010009', '');
      await addAssetPromise('uRm010009', '中文密码', 'l9');
      await removeAssetPromise('uRm010009', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010010 end');
    })

    /**
     * @tc.name   testKeyRm010011
     * @tc.number SUB_ASSET_KEYRM_0011
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010011 begin');
      await removeAssetPromise('uRm010010', '');
      await addAssetPromise('uRm010010', 'pwd@#$%^&*()', 'l10');
      await removeAssetPromise('uRm010010', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010011 end');
    })

    /**
     * @tc.name   testKeyRm010012
     * @tc.number SUB_ASSET_KEYRM_0012
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010012 begin');
      await removeAssetPromise('uRm010011', '');
      await addAssetPromise('uRm010011', '12345678', 'l11');
      await removeAssetPromise('uRm010011', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010012 end');
    })

    /**
     * @tc.name   testKeyRm010013
     * @tc.number SUB_ASSET_KEYRM_0013
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010013 begin');
      await removeAssetPromise('uRm010012', '');
      await addAssetPromise('uRm010012', 'p1', 'l12');
      await removeAssetPromise('uRm010012', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010013 end');
    })

    /**
     * @tc.name   testKeyRm010014
     * @tc.number SUB_ASSET_KEYRM_0014
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010014 begin');
      await removeAssetPromise('uRm010013', '');
      await addAssetPromise('uRm010013', 'password8', 'l13');
      await removeAssetPromise('uRm010013', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010014 end');
    })

    /**
     * @tc.name   testKeyRm010015
     * @tc.number SUB_ASSET_KEYRM_0015
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010015 begin');
      await removeAssetPromise('uRm010014', '');
      await addAssetPromise('uRm010014', 'pwd_16_chars_123', 'l14');
      await removeAssetPromise('uRm010014', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010015 end');
    })

    /**
     * @tc.name   testKeyRm010016
     * @tc.number SUB_ASSET_KEYRM_0016
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010016 begin');
      await removeAssetPromise('uRm010015', '');
      await addAssetPromise('uRm010015', '中文密码', 'l15');
      await removeAssetPromise('uRm010015', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010016 end');
    })

    /**
     * @tc.name   testKeyRm010017
     * @tc.number SUB_ASSET_KEYRM_0017
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010017 begin');
      await removeAssetPromise('uRm010016', '');
      await addAssetPromise('uRm010016', 'pwd@#$%^&*()', 'l16');
      await removeAssetPromise('uRm010016', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010017 end');
    })

    /**
     * @tc.name   testKeyRm010018
     * @tc.number SUB_ASSET_KEYRM_0018
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010018 begin');
      await removeAssetPromise('uRm010017', '');
      await addAssetPromise('uRm010017', '12345678', 'l17');
      await removeAssetPromise('uRm010017', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010018 end');
    })

    /**
     * @tc.name   testKeyRm010019
     * @tc.number SUB_ASSET_KEYRM_0019
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010019 begin');
      await removeAssetPromise('uRm010018', '');
      await addAssetPromise('uRm010018', 'p1', 'l18');
      await removeAssetPromise('uRm010018', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010019 end');
    })

    /**
     * @tc.name   testKeyRm010020
     * @tc.number SUB_ASSET_KEYRM_0020
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010020 begin');
      await removeAssetPromise('uRm010019', '');
      await addAssetPromise('uRm010019', 'password8', 'l19');
      await removeAssetPromise('uRm010019', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010020 end');
    })

    /**
     * @tc.name   testKeyRm010021
     * @tc.number SUB_ASSET_KEYRM_0021
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010021 begin');
      await removeAssetPromise('uRm010020', '');
      await addAssetPromise('uRm010020', 'pwd_16_chars_123', 'l20');
      await removeAssetPromise('uRm010020', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010021 end');
    })

    /**
     * @tc.name   testKeyRm010022
     * @tc.number SUB_ASSET_KEYRM_0022
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010022 begin');
      await removeAssetPromise('uRm010021', '');
      await addAssetPromise('uRm010021', '中文密码', 'l21');
      await removeAssetPromise('uRm010021', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010022 end');
    })

    /**
     * @tc.name   testKeyRm010023
     * @tc.number SUB_ASSET_KEYRM_0023
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010023 begin');
      await removeAssetPromise('uRm010022', '');
      await addAssetPromise('uRm010022', 'pwd@#$%^&*()', 'l22');
      await removeAssetPromise('uRm010022', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010023 end');
    })

    /**
     * @tc.name   testKeyRm010024
     * @tc.number SUB_ASSET_KEYRM_0024
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010024 begin');
      await removeAssetPromise('uRm010023', '');
      await addAssetPromise('uRm010023', '12345678', 'l23');
      await removeAssetPromise('uRm010023', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010024 end');
    })

    /**
     * @tc.name   testKeyRm010025
     * @tc.number SUB_ASSET_KEYRM_0025
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010025 begin');
      await removeAssetPromise('uRm010024', '');
      await addAssetPromise('uRm010024', 'p1', 'l24');
      await removeAssetPromise('uRm010024', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010025 end');
    })

    /**
     * @tc.name   testKeyRm010026
     * @tc.number SUB_ASSET_KEYRM_0026
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010026 begin');
      await removeAssetPromise('uRm010025', '');
      await addAssetPromise('uRm010025', 'password8', 'l25');
      await removeAssetPromise('uRm010025', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010026 end');
    })

    /**
     * @tc.name   testKeyRm010027
     * @tc.number SUB_ASSET_KEYRM_0027
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010027 begin');
      await removeAssetPromise('uRm010026', '');
      await addAssetPromise('uRm010026', 'pwd_16_chars_123', 'l26');
      await removeAssetPromise('uRm010026', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010027 end');
    })

    /**
     * @tc.name   testKeyRm010028
     * @tc.number SUB_ASSET_KEYRM_0028
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010028 begin');
      await removeAssetPromise('uRm010027', '');
      await addAssetPromise('uRm010027', '中文密码', 'l27');
      await removeAssetPromise('uRm010027', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010028 end');
    })

    /**
     * @tc.name   testKeyRm010029
     * @tc.number SUB_ASSET_KEYRM_0029
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010029 begin');
      await removeAssetPromise('uRm010028', '');
      await addAssetPromise('uRm010028', 'pwd@#$%^&*()', 'l28');
      await removeAssetPromise('uRm010028', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010029 end');
    })

    /**
     * @tc.name   testKeyRm010030
     * @tc.number SUB_ASSET_KEYRM_0030
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010030 begin');
      await removeAssetPromise('uRm010029', '');
      await addAssetPromise('uRm010029', '12345678', 'l29');
      await removeAssetPromise('uRm010029', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010030 end');
    })

    /**
     * @tc.name   testKeyRm010031
     * @tc.number SUB_ASSET_KEYRM_0031
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010031 begin');
      await removeAssetPromise('uRm010030', '');
      await addAssetPromise('uRm010030', 'p1', 't0');
      await removeAssetPromise('uRm010030', 't0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010031 end');
    })

    /**
     * @tc.name   testKeyRm010032
     * @tc.number SUB_ASSET_KEYRM_0032
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010032 begin');
      await removeAssetPromise('uRm010031', '');
      await addAssetPromise('uRm010031', 'password8', 't1');
      await removeAssetPromise('uRm010031', 't1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010032 end');
    })

    /**
     * @tc.name   testKeyRm010033
     * @tc.number SUB_ASSET_KEYRM_0033
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010033 begin');
      await removeAssetPromise('uRm010032', '');
      await addAssetPromise('uRm010032', 'pwd_16_chars_123', 't2');
      await removeAssetPromise('uRm010032', 't2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010033 end');
    })

    /**
     * @tc.name   testKeyRm010034
     * @tc.number SUB_ASSET_KEYRM_0034
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010034 begin');
      await removeAssetPromise('uRm010033', '');
      await addAssetPromise('uRm010033', '中文密码', 't3');
      await removeAssetPromise('uRm010033', 't3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010034 end');
    })

    /**
     * @tc.name   testKeyRm010035
     * @tc.number SUB_ASSET_KEYRM_0035
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010035 begin');
      await removeAssetPromise('uRm010034', '');
      await addAssetPromise('uRm010034', 'pwd@#$%^&*()', 't4');
      await removeAssetPromise('uRm010034', 't4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010035 end');
    })

    /**
     * @tc.name   testKeyRm010036
     * @tc.number SUB_ASSET_KEYRM_0036
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010036 begin');
      await removeAssetPromise('uRm010035', '');
      await addAssetPromise('uRm010035', '12345678', 't5');
      await removeAssetPromise('uRm010035', 't5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010036 end');
    })

    /**
     * @tc.name   testKeyRm010037
     * @tc.number SUB_ASSET_KEYRM_0037
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010037 begin');
      await removeAssetPromise('uRm010036', '');
      await addAssetPromise('uRm010036', 'p1', 't6');
      await removeAssetPromise('uRm010036', 't6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010037 end');
    })

    /**
     * @tc.name   testKeyRm010038
     * @tc.number SUB_ASSET_KEYRM_0038
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010038 begin');
      await removeAssetPromise('uRm010037', '');
      await addAssetPromise('uRm010037', 'password8', 't7');
      await removeAssetPromise('uRm010037', 't7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010038 end');
    })

    /**
     * @tc.name   testKeyRm010039
     * @tc.number SUB_ASSET_KEYRM_0039
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010039 begin');
      await removeAssetPromise('uRm010038', '');
      await addAssetPromise('uRm010038', 'pwd_16_chars_123', 't8');
      await removeAssetPromise('uRm010038', 't8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010039 end');
    })

    /**
     * @tc.name   testKeyRm010040
     * @tc.number SUB_ASSET_KEYRM_0040
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010040 begin');
      await removeAssetPromise('uRm010039', '');
      await addAssetPromise('uRm010039', '中文密码', 't9');
      await removeAssetPromise('uRm010039', 't9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010040 end');
    })

    /**
     * @tc.name   testKeyRm010041
     * @tc.number SUB_ASSET_KEYRM_0041
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010041 begin');
      await removeAssetPromise('uRm010040', '');
      await addAssetPromise('uRm010040', 'pwd@#$%^&*()', 't10');
      await removeAssetPromise('uRm010040', 't10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010041 end');
    })

    /**
     * @tc.name   testKeyRm010042
     * @tc.number SUB_ASSET_KEYRM_0042
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010042 begin');
      await removeAssetPromise('uRm010041', '');
      await addAssetPromise('uRm010041', '12345678', 't11');
      await removeAssetPromise('uRm010041', 't11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010042 end');
    })

    /**
     * @tc.name   testKeyRm010043
     * @tc.number SUB_ASSET_KEYRM_0043
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010043 begin');
      await removeAssetPromise('uRm010042', '');
      await addAssetPromise('uRm010042', 'p1', 't12');
      await removeAssetPromise('uRm010042', 't12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010043 end');
    })

    /**
     * @tc.name   testKeyRm010044
     * @tc.number SUB_ASSET_KEYRM_0044
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010044 begin');
      await removeAssetPromise('uRm010043', '');
      await addAssetPromise('uRm010043', 'password8', 't13');
      await removeAssetPromise('uRm010043', 't13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010044 end');
    })

    /**
     * @tc.name   testKeyRm010045
     * @tc.number SUB_ASSET_KEYRM_0045
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010045 begin');
      await removeAssetPromise('uRm010044', '');
      await addAssetPromise('uRm010044', 'pwd_16_chars_123', 't14');
      await removeAssetPromise('uRm010044', 't14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010045 end');
    })

    /**
     * @tc.name   testKeyRm010046
     * @tc.number SUB_ASSET_KEYRM_0046
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010046 begin');
      await removeAssetPromise('uRm010045', '');
      await addAssetPromise('uRm010045', '中文密码', 't15');
      await removeAssetPromise('uRm010045', 't15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010046 end');
    })

    /**
     * @tc.name   testKeyRm010047
     * @tc.number SUB_ASSET_KEYRM_0047
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010047 begin');
      await removeAssetPromise('uRm010046', '');
      await addAssetPromise('uRm010046', 'pwd@#$%^&*()', 't16');
      await removeAssetPromise('uRm010046', 't16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010047 end');
    })

    /**
     * @tc.name   testKeyRm010048
     * @tc.number SUB_ASSET_KEYRM_0048
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010048 begin');
      await removeAssetPromise('uRm010047', '');
      await addAssetPromise('uRm010047', '12345678', 't17');
      await removeAssetPromise('uRm010047', 't17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010048 end');
    })

    /**
     * @tc.name   testKeyRm010049
     * @tc.number SUB_ASSET_KEYRM_0049
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010049 begin');
      await removeAssetPromise('uRm010048', '');
      await addAssetPromise('uRm010048', 'p1', 't18');
      await removeAssetPromise('uRm010048', 't18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010049 end');
    })

    /**
     * @tc.name   testKeyRm010050
     * @tc.number SUB_ASSET_KEYRM_0050
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010050 begin');
      await removeAssetPromise('uRm010049', '');
      await addAssetPromise('uRm010049', 'password8', 't19');
      await removeAssetPromise('uRm010049', 't19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010050 end');
    })

    /**
     * @tc.name   testKeyRm010051
     * @tc.number SUB_ASSET_KEYRM_0051
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010051 begin');
      await removeAssetPromise('uRm010050', '');
      await addAssetPromise('uRm010050', 'pwd_16_chars_123', 't20');
      await removeAssetPromise('uRm010050', 't20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010051 end');
    })

    /**
     * @tc.name   testKeyRm010052
     * @tc.number SUB_ASSET_KEYRM_0052
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010052 begin');
      await removeAssetPromise('uRm010051', '');
      await addAssetPromise('uRm010051', '中文密码', 't21');
      await removeAssetPromise('uRm010051', 't21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010052 end');
    })

    /**
     * @tc.name   testKeyRm010053
     * @tc.number SUB_ASSET_KEYRM_0053
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010053 begin');
      await removeAssetPromise('uRm010052', '');
      await addAssetPromise('uRm010052', 'pwd@#$%^&*()', 't22');
      await removeAssetPromise('uRm010052', 't22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010053 end');
    })

    /**
     * @tc.name   testKeyRm010054
     * @tc.number SUB_ASSET_KEYRM_0054
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010054 begin');
      await removeAssetPromise('uRm010053', '');
      await addAssetPromise('uRm010053', '12345678', 't23');
      await removeAssetPromise('uRm010053', 't23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010054 end');
    })

    /**
     * @tc.name   testKeyRm010055
     * @tc.number SUB_ASSET_KEYRM_0055
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010055 begin');
      await removeAssetPromise('uRm010054', '');
      await addAssetPromise('uRm010054', 'p1', 't24');
      await removeAssetPromise('uRm010054', 't24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010055 end');
    })

    /**
     * @tc.name   testKeyRm010056
     * @tc.number SUB_ASSET_KEYRM_0056
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010056 begin');
      await removeAssetPromise('uRm010055', '');
      await addAssetPromise('uRm010055', 'password8', 't25');
      await removeAssetPromise('uRm010055', 't25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010056 end');
    })

    /**
     * @tc.name   testKeyRm010057
     * @tc.number SUB_ASSET_KEYRM_0057
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010057 begin');
      await removeAssetPromise('uRm010056', '');
      await addAssetPromise('uRm010056', 'pwd_16_chars_123', 't26');
      await removeAssetPromise('uRm010056', 't26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010057 end');
    })

    /**
     * @tc.name   testKeyRm010058
     * @tc.number SUB_ASSET_KEYRM_0058
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010058 begin');
      await removeAssetPromise('uRm010057', '');
      await addAssetPromise('uRm010057', '中文密码', 't27');
      await removeAssetPromise('uRm010057', 't27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010058 end');
    })

    /**
     * @tc.name   testKeyRm010059
     * @tc.number SUB_ASSET_KEYRM_0059
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010059 begin');
      await removeAssetPromise('uRm010058', '');
      await addAssetPromise('uRm010058', 'pwd@#$%^&*()', 't28');
      await removeAssetPromise('uRm010058', 't28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010059 end');
    })

    /**
     * @tc.name   testKeyRm010060
     * @tc.number SUB_ASSET_KEYRM_0060
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010060 begin');
      await removeAssetPromise('uRm010059', '');
      await addAssetPromise('uRm010059', '12345678', 't29');
      await removeAssetPromise('uRm010059', 't29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010060 end');
    })

    /**
     * @tc.name   testKeyRm010061
     * @tc.number SUB_ASSET_KEYRM_0061
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010061 begin');
      await removeAssetPromise('uRm010060', '');
      await addAssetPromise('uRm010060', 'p1', 'm0;n0');
      await removeAssetPromise('uRm010060', 'n0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010061 end');
    })

    /**
     * @tc.name   testKeyRm010062
     * @tc.number SUB_ASSET_KEYRM_0062
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010062 begin');
      await removeAssetPromise('uRm010061', '');
      await addAssetPromise('uRm010061', 'password8', 'm1;n1');
      await removeAssetPromise('uRm010061', 'n1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010062 end');
    })

    /**
     * @tc.name   testKeyRm010063
     * @tc.number SUB_ASSET_KEYRM_0063
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010063 begin');
      await removeAssetPromise('uRm010062', '');
      await addAssetPromise('uRm010062', 'pwd_16_chars_123', 'm2;n2');
      await removeAssetPromise('uRm010062', 'n2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010063 end');
    })

    /**
     * @tc.name   testKeyRm010064
     * @tc.number SUB_ASSET_KEYRM_0064
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010064 begin');
      await removeAssetPromise('uRm010063', '');
      await addAssetPromise('uRm010063', '中文密码', 'm3;n3');
      await removeAssetPromise('uRm010063', 'n3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010064 end');
    })

    /**
     * @tc.name   testKeyRm010065
     * @tc.number SUB_ASSET_KEYRM_0065
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010065 begin');
      await removeAssetPromise('uRm010064', '');
      await addAssetPromise('uRm010064', 'pwd@#$%^&*()', 'm4;n4');
      await removeAssetPromise('uRm010064', 'n4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010065 end');
    })

    /**
     * @tc.name   testKeyRm010066
     * @tc.number SUB_ASSET_KEYRM_0066
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010066 begin');
      await removeAssetPromise('uRm010065', '');
      await addAssetPromise('uRm010065', '12345678', 'm5;n5');
      await removeAssetPromise('uRm010065', 'n5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010066 end');
    })

    /**
     * @tc.name   testKeyRm010067
     * @tc.number SUB_ASSET_KEYRM_0067
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010067 begin');
      await removeAssetPromise('uRm010066', '');
      await addAssetPromise('uRm010066', 'p1', 'm6;n6');
      await removeAssetPromise('uRm010066', 'n6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010067 end');
    })

    /**
     * @tc.name   testKeyRm010068
     * @tc.number SUB_ASSET_KEYRM_0068
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010068 begin');
      await removeAssetPromise('uRm010067', '');
      await addAssetPromise('uRm010067', 'password8', 'm7;n7');
      await removeAssetPromise('uRm010067', 'n7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010068 end');
    })

    /**
     * @tc.name   testKeyRm010069
     * @tc.number SUB_ASSET_KEYRM_0069
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010069 begin');
      await removeAssetPromise('uRm010068', '');
      await addAssetPromise('uRm010068', 'pwd_16_chars_123', 'm8;n8');
      await removeAssetPromise('uRm010068', 'n8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010069 end');
    })

    /**
     * @tc.name   testKeyRm010070
     * @tc.number SUB_ASSET_KEYRM_0070
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010070 begin');
      await removeAssetPromise('uRm010069', '');
      await addAssetPromise('uRm010069', '中文密码', 'm9;n9');
      await removeAssetPromise('uRm010069', 'n9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010070 end');
    })

    /**
     * @tc.name   testKeyRm010071
     * @tc.number SUB_ASSET_KEYRM_0071
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010071 begin');
      await removeAssetPromise('uRm010070', '');
      await addAssetPromise('uRm010070', 'pwd@#$%^&*()', 'm10;n10');
      await removeAssetPromise('uRm010070', 'n10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010071 end');
    })

    /**
     * @tc.name   testKeyRm010072
     * @tc.number SUB_ASSET_KEYRM_0072
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010072 begin');
      await removeAssetPromise('uRm010071', '');
      await addAssetPromise('uRm010071', '12345678', 'm11;n11');
      await removeAssetPromise('uRm010071', 'n11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010072 end');
    })

    /**
     * @tc.name   testKeyRm010073
     * @tc.number SUB_ASSET_KEYRM_0073
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010073 begin');
      await removeAssetPromise('uRm010072', '');
      await addAssetPromise('uRm010072', 'p1', 'm12;n12');
      await removeAssetPromise('uRm010072', 'n12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010073 end');
    })

    /**
     * @tc.name   testKeyRm010074
     * @tc.number SUB_ASSET_KEYRM_0074
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010074 begin');
      await removeAssetPromise('uRm010073', '');
      await addAssetPromise('uRm010073', 'password8', 'm13;n13');
      await removeAssetPromise('uRm010073', 'n13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010074 end');
    })

    /**
     * @tc.name   testKeyRm010075
     * @tc.number SUB_ASSET_KEYRM_0075
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010075 begin');
      await removeAssetPromise('uRm010074', '');
      await addAssetPromise('uRm010074', 'pwd_16_chars_123', 'm14;n14');
      await removeAssetPromise('uRm010074', 'n14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010075 end');
    })

    /**
     * @tc.name   testKeyRm010076
     * @tc.number SUB_ASSET_KEYRM_0076
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010076 begin');
      await removeAssetPromise('uRm010075', '');
      await addAssetPromise('uRm010075', '中文密码', 'm15;n15');
      await removeAssetPromise('uRm010075', 'n15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010076 end');
    })

    /**
     * @tc.name   testKeyRm010077
     * @tc.number SUB_ASSET_KEYRM_0077
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010077 begin');
      await removeAssetPromise('uRm010076', '');
      await addAssetPromise('uRm010076', 'pwd@#$%^&*()', 'm16;n16');
      await removeAssetPromise('uRm010076', 'n16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010077 end');
    })

    /**
     * @tc.name   testKeyRm010078
     * @tc.number SUB_ASSET_KEYRM_0078
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010078 begin');
      await removeAssetPromise('uRm010077', '');
      await addAssetPromise('uRm010077', '12345678', 'm17;n17');
      await removeAssetPromise('uRm010077', 'n17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010078 end');
    })

    /**
     * @tc.name   testKeyRm010079
     * @tc.number SUB_ASSET_KEYRM_0079
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010079 begin');
      await removeAssetPromise('uRm010078', '');
      await addAssetPromise('uRm010078', 'p1', 'm18;n18');
      await removeAssetPromise('uRm010078', 'n18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010079 end');
    })

    /**
     * @tc.name   testKeyRm010080
     * @tc.number SUB_ASSET_KEYRM_0080
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010080 begin');
      await removeAssetPromise('uRm010079', '');
      await addAssetPromise('uRm010079', 'password8', 'm19;n19');
      await removeAssetPromise('uRm010079', 'n19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010080 end');
    })

    /**
     * @tc.name   testKeyRm010081
     * @tc.number SUB_ASSET_KEYRM_0081
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010081 begin');
      await removeAssetPromise('uRm010080', '');
      await addAssetPromise('uRm010080', 'pwd_16_chars_123', 'm20;n20');
      await removeAssetPromise('uRm010080', 'n20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010081 end');
    })

    /**
     * @tc.name   testKeyRm010082
     * @tc.number SUB_ASSET_KEYRM_0082
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010082 begin');
      await removeAssetPromise('uRm010081', '');
      await addAssetPromise('uRm010081', '中文密码', 'm21;n21');
      await removeAssetPromise('uRm010081', 'n21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010082 end');
    })

    /**
     * @tc.name   testKeyRm010083
     * @tc.number SUB_ASSET_KEYRM_0083
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010083 begin');
      await removeAssetPromise('uRm010082', '');
      await addAssetPromise('uRm010082', 'pwd@#$%^&*()', 'm22;n22');
      await removeAssetPromise('uRm010082', 'n22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010083 end');
    })

    /**
     * @tc.name   testKeyRm010084
     * @tc.number SUB_ASSET_KEYRM_0084
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010084 begin');
      await removeAssetPromise('uRm010083', '');
      await addAssetPromise('uRm010083', '12345678', 'm23;n23');
      await removeAssetPromise('uRm010083', 'n23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010084 end');
    })

    /**
     * @tc.name   testKeyRm010085
     * @tc.number SUB_ASSET_KEYRM_0085
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010085 begin');
      await removeAssetPromise('uRm010084', '');
      await addAssetPromise('uRm010084', 'p1', 'm24;n24');
      await removeAssetPromise('uRm010084', 'n24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010085 end');
    })

    /**
     * @tc.name   testKeyRm010086
     * @tc.number SUB_ASSET_KEYRM_0086
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010086 begin');
      await removeAssetPromise('uRm010085', '');
      await addAssetPromise('uRm010085', 'password8', 'm25;n25');
      await removeAssetPromise('uRm010085', 'n25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010086 end');
    })

    /**
     * @tc.name   testKeyRm010087
     * @tc.number SUB_ASSET_KEYRM_0087
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010087 begin');
      await removeAssetPromise('uRm010086', '');
      await addAssetPromise('uRm010086', 'pwd_16_chars_123', 'm26;n26');
      await removeAssetPromise('uRm010086', 'n26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010087 end');
    })

    /**
     * @tc.name   testKeyRm010088
     * @tc.number SUB_ASSET_KEYRM_0088
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010088 begin');
      await removeAssetPromise('uRm010087', '');
      await addAssetPromise('uRm010087', '中文密码', 'm27;n27');
      await removeAssetPromise('uRm010087', 'n27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010088 end');
    })

    /**
     * @tc.name   testKeyRm010089
     * @tc.number SUB_ASSET_KEYRM_0089
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010089 begin');
      await removeAssetPromise('uRm010088', '');
      await addAssetPromise('uRm010088', 'pwd@#$%^&*()', 'm28;n28');
      await removeAssetPromise('uRm010088', 'n28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010089 end');
    })

    /**
     * @tc.name   testKeyRm010090
     * @tc.number SUB_ASSET_KEYRM_0090
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010090 begin');
      await removeAssetPromise('uRm010089', '');
      await addAssetPromise('uRm010089', '12345678', 'm29;n29');
      await removeAssetPromise('uRm010089', 'n29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010090 end');
    })

    /**
     * @tc.name   testKeyRm010091
     * @tc.number SUB_ASSET_KEYRM_0091
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010091 begin');
      await removeAssetPromise('uRm010090', '');
      await addAssetPromise('uRm010090', 'p1', 'k0');
      await removeAssetPromise('uRm010090', 'nomatch0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010091 end');
    })

    /**
     * @tc.name   testKeyRm010092
     * @tc.number SUB_ASSET_KEYRM_0092
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010092 begin');
      await removeAssetPromise('uRm010091', '');
      await addAssetPromise('uRm010091', 'password8', 'k1');
      await removeAssetPromise('uRm010091', 'nomatch1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010092 end');
    })

    /**
     * @tc.name   testKeyRm010093
     * @tc.number SUB_ASSET_KEYRM_0093
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010093 begin');
      await removeAssetPromise('uRm010092', '');
      await addAssetPromise('uRm010092', 'pwd_16_chars_123', 'k2');
      await removeAssetPromise('uRm010092', 'nomatch2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010093 end');
    })

    /**
     * @tc.name   testKeyRm010094
     * @tc.number SUB_ASSET_KEYRM_0094
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010094 begin');
      await removeAssetPromise('uRm010093', '');
      await addAssetPromise('uRm010093', '中文密码', 'k3');
      await removeAssetPromise('uRm010093', 'nomatch3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010094 end');
    })

    /**
     * @tc.name   testKeyRm010095
     * @tc.number SUB_ASSET_KEYRM_0095
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010095 begin');
      await removeAssetPromise('uRm010094', '');
      await addAssetPromise('uRm010094', 'pwd@#$%^&*()', 'k4');
      await removeAssetPromise('uRm010094', 'nomatch4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010095 end');
    })

    /**
     * @tc.name   testKeyRm010096
     * @tc.number SUB_ASSET_KEYRM_0096
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010096 begin');
      await removeAssetPromise('uRm010095', '');
      await addAssetPromise('uRm010095', '12345678', 'k5');
      await removeAssetPromise('uRm010095', 'nomatch5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010096 end');
    })

    /**
     * @tc.name   testKeyRm010097
     * @tc.number SUB_ASSET_KEYRM_0097
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010097 begin');
      await removeAssetPromise('uRm010096', '');
      await addAssetPromise('uRm010096', 'p1', 'k6');
      await removeAssetPromise('uRm010096', 'nomatch6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010097 end');
    })

    /**
     * @tc.name   testKeyRm010098
     * @tc.number SUB_ASSET_KEYRM_0098
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010098 begin');
      await removeAssetPromise('uRm010097', '');
      await addAssetPromise('uRm010097', 'password8', 'k7');
      await removeAssetPromise('uRm010097', 'nomatch7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010098 end');
    })

    /**
     * @tc.name   testKeyRm010099
     * @tc.number SUB_ASSET_KEYRM_0099
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010099 begin');
      await removeAssetPromise('uRm010098', '');
      await addAssetPromise('uRm010098', 'pwd_16_chars_123', 'k8');
      await removeAssetPromise('uRm010098', 'nomatch8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010099 end');
    })

    /**
     * @tc.name   testKeyRm010100
     * @tc.number SUB_ASSET_KEYRM_0100
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010100 begin');
      await removeAssetPromise('uRm010099', '');
      await addAssetPromise('uRm010099', '中文密码', 'k9');
      await removeAssetPromise('uRm010099', 'nomatch9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010100 end');
    })

    /**
     * @tc.name   testKeyRm010101
     * @tc.number SUB_ASSET_KEYRM_0101
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010101 begin');
      await removeAssetPromise('uRm010100', '');
      await addAssetPromise('uRm010100', 'pwd@#$%^&*()', 'k10');
      await removeAssetPromise('uRm010100', 'nomatch10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010101 end');
    })

    /**
     * @tc.name   testKeyRm010102
     * @tc.number SUB_ASSET_KEYRM_0102
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010102 begin');
      await removeAssetPromise('uRm010101', '');
      await addAssetPromise('uRm010101', '12345678', 'k11');
      await removeAssetPromise('uRm010101', 'nomatch11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010102 end');
    })

    /**
     * @tc.name   testKeyRm010103
     * @tc.number SUB_ASSET_KEYRM_0103
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010103 begin');
      await removeAssetPromise('uRm010102', '');
      await addAssetPromise('uRm010102', 'p1', 'k12');
      await removeAssetPromise('uRm010102', 'nomatch12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010103 end');
    })

    /**
     * @tc.name   testKeyRm010104
     * @tc.number SUB_ASSET_KEYRM_0104
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010104 begin');
      await removeAssetPromise('uRm010103', '');
      await addAssetPromise('uRm010103', 'password8', 'k13');
      await removeAssetPromise('uRm010103', 'nomatch13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010104 end');
    })

    /**
     * @tc.name   testKeyRm010105
     * @tc.number SUB_ASSET_KEYRM_0105
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010105 begin');
      await removeAssetPromise('uRm010104', '');
      await addAssetPromise('uRm010104', 'pwd_16_chars_123', 'k14');
      await removeAssetPromise('uRm010104', 'nomatch14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010105 end');
    })

    /**
     * @tc.name   testKeyRm010106
     * @tc.number SUB_ASSET_KEYRM_0106
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010106 begin');
      await removeAssetPromise('uRm010105', '');
      await addAssetPromise('uRm010105', '中文密码', 'k15');
      await removeAssetPromise('uRm010105', 'nomatch15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010106 end');
    })

    /**
     * @tc.name   testKeyRm010107
     * @tc.number SUB_ASSET_KEYRM_0107
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010107 begin');
      await removeAssetPromise('uRm010106', '');
      await addAssetPromise('uRm010106', 'pwd@#$%^&*()', 'k16');
      await removeAssetPromise('uRm010106', 'nomatch16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010107 end');
    })

    /**
     * @tc.name   testKeyRm010108
     * @tc.number SUB_ASSET_KEYRM_0108
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010108 begin');
      await removeAssetPromise('uRm010107', '');
      await addAssetPromise('uRm010107', '12345678', 'k17');
      await removeAssetPromise('uRm010107', 'nomatch17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010108 end');
    })

    /**
     * @tc.name   testKeyRm010109
     * @tc.number SUB_ASSET_KEYRM_0109
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010109 begin');
      await removeAssetPromise('uRm010108', '');
      await addAssetPromise('uRm010108', 'p1', 'k18');
      await removeAssetPromise('uRm010108', 'nomatch18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010109 end');
    })

    /**
     * @tc.name   testKeyRm010110
     * @tc.number SUB_ASSET_KEYRM_0110
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010110 begin');
      await removeAssetPromise('uRm010109', '');
      await addAssetPromise('uRm010109', 'password8', 'k19');
      await removeAssetPromise('uRm010109', 'nomatch19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010110 end');
    })

    /**
     * @tc.name   testKeyRm010111
     * @tc.number SUB_ASSET_KEYRM_0111
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010111 begin');
      await removeAssetPromise('uRm010110', '');
      await addAssetPromise('uRm010110', 'pwd_16_chars_123', 'k20');
      await removeAssetPromise('uRm010110', 'nomatch20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010111 end');
    })

    /**
     * @tc.name   testKeyRm010112
     * @tc.number SUB_ASSET_KEYRM_0112
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010112 begin');
      await removeAssetPromise('uRm010111', '');
      await addAssetPromise('uRm010111', '中文密码', 'k21');
      await removeAssetPromise('uRm010111', 'nomatch21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010112 end');
    })

    /**
     * @tc.name   testKeyRm010113
     * @tc.number SUB_ASSET_KEYRM_0113
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010113 begin');
      await removeAssetPromise('uRm010112', '');
      await addAssetPromise('uRm010112', 'pwd@#$%^&*()', 'k22');
      await removeAssetPromise('uRm010112', 'nomatch22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010113 end');
    })

    /**
     * @tc.name   testKeyRm010114
     * @tc.number SUB_ASSET_KEYRM_0114
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010114 begin');
      await removeAssetPromise('uRm010113', '');
      await addAssetPromise('uRm010113', '12345678', 'k23');
      await removeAssetPromise('uRm010113', 'nomatch23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010114 end');
    })

    /**
     * @tc.name   testKeyRm010115
     * @tc.number SUB_ASSET_KEYRM_0115
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010115 begin');
      await removeAssetPromise('uRm010114', '');
      await addAssetPromise('uRm010114', 'p1', 'k24');
      await removeAssetPromise('uRm010114', 'nomatch24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010115 end');
    })

    /**
     * @tc.name   testKeyRm010116
     * @tc.number SUB_ASSET_KEYRM_0116
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010116 begin');
      await removeAssetPromise('uRm010115', '');
      await addAssetPromise('uRm010115', 'password8', 'k25');
      await removeAssetPromise('uRm010115', 'nomatch25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010116 end');
    })

    /**
     * @tc.name   testKeyRm010117
     * @tc.number SUB_ASSET_KEYRM_0117
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010117 begin');
      await removeAssetPromise('uRm010116', '');
      await addAssetPromise('uRm010116', 'pwd_16_chars_123', 'k26');
      await removeAssetPromise('uRm010116', 'nomatch26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010117 end');
    })

    /**
     * @tc.name   testKeyRm010118
     * @tc.number SUB_ASSET_KEYRM_0118
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010118 begin');
      await removeAssetPromise('uRm010117', '');
      await addAssetPromise('uRm010117', '中文密码', 'k27');
      await removeAssetPromise('uRm010117', 'nomatch27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010118 end');
    })

    /**
     * @tc.name   testKeyRm010119
     * @tc.number SUB_ASSET_KEYRM_0119
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010119 begin');
      await removeAssetPromise('uRm010118', '');
      await addAssetPromise('uRm010118', 'pwd@#$%^&*()', 'k28');
      await removeAssetPromise('uRm010118', 'nomatch28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010119 end');
    })

    /**
     * @tc.name   testKeyRm010120
     * @tc.number SUB_ASSET_KEYRM_0120
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010120 begin');
      await removeAssetPromise('uRm010119', '');
      await addAssetPromise('uRm010119', '12345678', 'k29');
      await removeAssetPromise('uRm010119', 'nomatch29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010120 end');
    })

    /**
     * @tc.name   testKeyRm010121
     * @tc.number SUB_ASSET_KEYRM_0121
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010121 begin');
      await removeAssetPromise('uRm010120', '');
      await addAssetPromise('uRm010120', 'p1', 's0;t0');
      await removeAssetPromise('uRm010120', 's0;;t0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010121 end');
    })

    /**
     * @tc.name   testKeyRm010122
     * @tc.number SUB_ASSET_KEYRM_0122
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010122 begin');
      await removeAssetPromise('uRm010121', '');
      await addAssetPromise('uRm010121', 'password8', 's1;t1');
      await removeAssetPromise('uRm010121', 's1;;t1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010122 end');
    })

    /**
     * @tc.name   testKeyRm010123
     * @tc.number SUB_ASSET_KEYRM_0123
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010123 begin');
      await removeAssetPromise('uRm010122', '');
      await addAssetPromise('uRm010122', 'pwd_16_chars_123', 's2;t2');
      await removeAssetPromise('uRm010122', 's2;;t2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010123 end');
    })

    /**
     * @tc.name   testKeyRm010124
     * @tc.number SUB_ASSET_KEYRM_0124
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010124 begin');
      await removeAssetPromise('uRm010123', '');
      await addAssetPromise('uRm010123', '中文密码', 's3;t3');
      await removeAssetPromise('uRm010123', 's3;;t3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010124 end');
    })

    /**
     * @tc.name   testKeyRm010125
     * @tc.number SUB_ASSET_KEYRM_0125
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010125 begin');
      await removeAssetPromise('uRm010124', '');
      await addAssetPromise('uRm010124', 'pwd@#$%^&*()', 's4;t4');
      await removeAssetPromise('uRm010124', 's4;;t4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010125 end');
    })

    /**
     * @tc.name   testKeyRm010126
     * @tc.number SUB_ASSET_KEYRM_0126
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010126 begin');
      await removeAssetPromise('uRm010125', '');
      await addAssetPromise('uRm010125', '12345678', 's5;t5');
      await removeAssetPromise('uRm010125', 's5;;t5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010126 end');
    })

    /**
     * @tc.name   testKeyRm010127
     * @tc.number SUB_ASSET_KEYRM_0127
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010127 begin');
      await removeAssetPromise('uRm010126', '');
      await addAssetPromise('uRm010126', 'p1', 's6;t6');
      await removeAssetPromise('uRm010126', 's6;;t6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010127 end');
    })

    /**
     * @tc.name   testKeyRm010128
     * @tc.number SUB_ASSET_KEYRM_0128
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010128 begin');
      await removeAssetPromise('uRm010127', '');
      await addAssetPromise('uRm010127', 'password8', 's7;t7');
      await removeAssetPromise('uRm010127', 's7;;t7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010128 end');
    })

    /**
     * @tc.name   testKeyRm010129
     * @tc.number SUB_ASSET_KEYRM_0129
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010129 begin');
      await removeAssetPromise('uRm010128', '');
      await addAssetPromise('uRm010128', 'pwd_16_chars_123', 's8;t8');
      await removeAssetPromise('uRm010128', 's8;;t8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010129 end');
    })

    /**
     * @tc.name   testKeyRm010130
     * @tc.number SUB_ASSET_KEYRM_0130
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010130 begin');
      await removeAssetPromise('uRm010129', '');
      await addAssetPromise('uRm010129', '中文密码', 's9;t9');
      await removeAssetPromise('uRm010129', 's9;;t9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010130 end');
    })

    /**
     * @tc.name   testKeyRm010131
     * @tc.number SUB_ASSET_KEYRM_0131
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010131 begin');
      await removeAssetPromise('uRm010130', '');
      await addAssetPromise('uRm010130', 'pwd@#$%^&*()', 's10;t10');
      await removeAssetPromise('uRm010130', 's10;;t10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010131 end');
    })

    /**
     * @tc.name   testKeyRm010132
     * @tc.number SUB_ASSET_KEYRM_0132
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010132 begin');
      await removeAssetPromise('uRm010131', '');
      await addAssetPromise('uRm010131', '12345678', 's11;t11');
      await removeAssetPromise('uRm010131', 's11;;t11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010132 end');
    })

    /**
     * @tc.name   testKeyRm010133
     * @tc.number SUB_ASSET_KEYRM_0133
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010133 begin');
      await removeAssetPromise('uRm010132', '');
      await addAssetPromise('uRm010132', 'p1', 's12;t12');
      await removeAssetPromise('uRm010132', 's12;;t12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010133 end');
    })

    /**
     * @tc.name   testKeyRm010134
     * @tc.number SUB_ASSET_KEYRM_0134
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010134 begin');
      await removeAssetPromise('uRm010133', '');
      await addAssetPromise('uRm010133', 'password8', 's13;t13');
      await removeAssetPromise('uRm010133', 's13;;t13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010134 end');
    })

    /**
     * @tc.name   testKeyRm010135
     * @tc.number SUB_ASSET_KEYRM_0135
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010135 begin');
      await removeAssetPromise('uRm010134', '');
      await addAssetPromise('uRm010134', 'pwd_16_chars_123', 's14;t14');
      await removeAssetPromise('uRm010134', 's14;;t14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm010134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010135 end');
    })

    /**
     * @tc.name   testKeyRm010136
     * @tc.number SUB_ASSET_KEYRM_0136
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010136 begin');
      await removeAssetPromise('uRm010135', '');
      await addAssetPromise('uRm010135', '中文密码', 'q0');
      await removeAssetPromise('uRm010135', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010136 end');
    })

    /**
     * @tc.name   testKeyRm010137
     * @tc.number SUB_ASSET_KEYRM_0137
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010137 begin');
      await removeAssetPromise('uRm010136', '');
      await addAssetPromise('uRm010136', 'pwd@#$%^&*()', 'q1');
      await removeAssetPromise('uRm010136', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010137 end');
    })

    /**
     * @tc.name   testKeyRm010138
     * @tc.number SUB_ASSET_KEYRM_0138
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010138 begin');
      await removeAssetPromise('uRm010137', '');
      await addAssetPromise('uRm010137', '12345678', 'q2');
      await removeAssetPromise('uRm010137', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010138 end');
    })

    /**
     * @tc.name   testKeyRm010139
     * @tc.number SUB_ASSET_KEYRM_0139
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010139 begin');
      await removeAssetPromise('uRm010138', '');
      await addAssetPromise('uRm010138', 'p1', 'q3');
      await removeAssetPromise('uRm010138', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010139 end');
    })

    /**
     * @tc.name   testKeyRm010140
     * @tc.number SUB_ASSET_KEYRM_0140
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010140 begin');
      await removeAssetPromise('uRm010139', '');
      await addAssetPromise('uRm010139', 'password8', 'q4');
      await removeAssetPromise('uRm010139', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010140 end');
    })

    /**
     * @tc.name   testKeyRm010141
     * @tc.number SUB_ASSET_KEYRM_0141
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010141 begin');
      await removeAssetPromise('uRm010140', '');
      await addAssetPromise('uRm010140', 'pwd_16_chars_123', 'q5');
      await removeAssetPromise('uRm010140', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010141 end');
    })

    /**
     * @tc.name   testKeyRm010142
     * @tc.number SUB_ASSET_KEYRM_0142
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010142 begin');
      await removeAssetPromise('uRm010141', '');
      await addAssetPromise('uRm010141', '中文密码', 'q6');
      await removeAssetPromise('uRm010141', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010142 end');
    })

    /**
     * @tc.name   testKeyRm010143
     * @tc.number SUB_ASSET_KEYRM_0143
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010143 begin');
      await removeAssetPromise('uRm010142', '');
      await addAssetPromise('uRm010142', 'pwd@#$%^&*()', 'q7');
      await removeAssetPromise('uRm010142', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010143 end');
    })

    /**
     * @tc.name   testKeyRm010144
     * @tc.number SUB_ASSET_KEYRM_0144
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010144 begin');
      await removeAssetPromise('uRm010143', '');
      await addAssetPromise('uRm010143', '12345678', 'q8');
      await removeAssetPromise('uRm010143', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010144 end');
    })

    /**
     * @tc.name   testKeyRm010145
     * @tc.number SUB_ASSET_KEYRM_0145
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010145 begin');
      await removeAssetPromise('uRm010144', '');
      await addAssetPromise('uRm010144', 'p1', 'q9');
      await removeAssetPromise('uRm010144', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010145 end');
    })

    /**
     * @tc.name   testKeyRm010146
     * @tc.number SUB_ASSET_KEYRM_0146
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010146 begin');
      await removeAssetPromise('uRm010145', '');
      await addAssetPromise('uRm010145', 'password8', 'q10');
      await removeAssetPromise('uRm010145', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010146 end');
    })

    /**
     * @tc.name   testKeyRm010147
     * @tc.number SUB_ASSET_KEYRM_0147
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010147 begin');
      await removeAssetPromise('uRm010146', '');
      await addAssetPromise('uRm010146', 'pwd_16_chars_123', 'q11');
      await removeAssetPromise('uRm010146', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010147 end');
    })

    /**
     * @tc.name   testKeyRm010148
     * @tc.number SUB_ASSET_KEYRM_0148
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010148 begin');
      await removeAssetPromise('uRm010147', '');
      await addAssetPromise('uRm010147', '中文密码', 'q12');
      await removeAssetPromise('uRm010147', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010148 end');
    })

    /**
     * @tc.name   testKeyRm010149
     * @tc.number SUB_ASSET_KEYRM_0149
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010149 begin');
      await removeAssetPromise('uRm010148', '');
      await addAssetPromise('uRm010148', 'pwd@#$%^&*()', 'q13');
      await removeAssetPromise('uRm010148', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010149 end');
    })

    /**
     * @tc.name   testKeyRm010150
     * @tc.number SUB_ASSET_KEYRM_0150
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010150 begin');
      await removeAssetPromise('uRm010149', '');
      await addAssetPromise('uRm010149', '12345678', 'q14');
      await removeAssetPromise('uRm010149', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm010149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm010149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm010150 end');
    })

  })
}
