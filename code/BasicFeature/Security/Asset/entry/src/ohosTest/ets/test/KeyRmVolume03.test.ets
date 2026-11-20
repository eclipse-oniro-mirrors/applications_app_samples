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

export default function keyRmVolume03() {
  describe('KeyRmVolume03Test', () => {

    /**
     * @tc.name   testKeyRm030301
     * @tc.number SUB_ASSET_KEYRM_0301
     * @tc.desc   标签匹配整体删除后查询 0 条，标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030301 begin');
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
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030301 end');
    })

    /**
     * @tc.name   testKeyRm030302
     * @tc.number SUB_ASSET_KEYRM_0302
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030302 begin');
      await removeAssetPromise('uRm030001', '');
      await addAssetPromise('uRm030001', 'password8', 'g1');
      await removeAssetPromise('uRm030001', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030302 end');
    })

    /**
     * @tc.name   testKeyRm030303
     * @tc.number SUB_ASSET_KEYRM_0303
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030303 begin');
      await removeAssetPromise('uRm030002', '');
      await addAssetPromise('uRm030002', 'pwd_16_chars_123', 'g2');
      await removeAssetPromise('uRm030002', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030303 end');
    })

    /**
     * @tc.name   testKeyRm030304
     * @tc.number SUB_ASSET_KEYRM_0304
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030304 begin');
      await removeAssetPromise('uRm030003', '');
      await addAssetPromise('uRm030003', '中文密码', 'g3');
      await removeAssetPromise('uRm030003', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030304 end');
    })

    /**
     * @tc.name   testKeyRm030305
     * @tc.number SUB_ASSET_KEYRM_0305
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030305 begin');
      await removeAssetPromise('uRm030004', '');
      await addAssetPromise('uRm030004', 'pwd@#$%^&*()', 'g4');
      await removeAssetPromise('uRm030004', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030305 end');
    })

    /**
     * @tc.name   testKeyRm030306
     * @tc.number SUB_ASSET_KEYRM_0306
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030306 begin');
      await removeAssetPromise('uRm030005', '');
      await addAssetPromise('uRm030005', '12345678', 'l5');
      await removeAssetPromise('uRm030005', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030306 end');
    })

    /**
     * @tc.name   testKeyRm030307
     * @tc.number SUB_ASSET_KEYRM_0307
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030307 begin');
      await removeAssetPromise('uRm030006', '');
      await addAssetPromise('uRm030006', 'p1', 'l6');
      await removeAssetPromise('uRm030006', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030307 end');
    })

    /**
     * @tc.name   testKeyRm030308
     * @tc.number SUB_ASSET_KEYRM_0308
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030308 begin');
      await removeAssetPromise('uRm030007', '');
      await addAssetPromise('uRm030007', 'password8', 'l7');
      await removeAssetPromise('uRm030007', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030308 end');
    })

    /**
     * @tc.name   testKeyRm030309
     * @tc.number SUB_ASSET_KEYRM_0309
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030309 begin');
      await removeAssetPromise('uRm030008', '');
      await addAssetPromise('uRm030008', 'pwd_16_chars_123', 'l8');
      await removeAssetPromise('uRm030008', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030309 end');
    })

    /**
     * @tc.name   testKeyRm030310
     * @tc.number SUB_ASSET_KEYRM_0310
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030310 begin');
      await removeAssetPromise('uRm030009', '');
      await addAssetPromise('uRm030009', '中文密码', 'l9');
      await removeAssetPromise('uRm030009', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030310 end');
    })

    /**
     * @tc.name   testKeyRm030311
     * @tc.number SUB_ASSET_KEYRM_0311
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030311 begin');
      await removeAssetPromise('uRm030010', '');
      await addAssetPromise('uRm030010', 'pwd@#$%^&*()', 'l10');
      await removeAssetPromise('uRm030010', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030311 end');
    })

    /**
     * @tc.name   testKeyRm030312
     * @tc.number SUB_ASSET_KEYRM_0312
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030312 begin');
      await removeAssetPromise('uRm030011', '');
      await addAssetPromise('uRm030011', '12345678', 'l11');
      await removeAssetPromise('uRm030011', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030312 end');
    })

    /**
     * @tc.name   testKeyRm030313
     * @tc.number SUB_ASSET_KEYRM_0313
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030313 begin');
      await removeAssetPromise('uRm030012', '');
      await addAssetPromise('uRm030012', 'p1', 'l12');
      await removeAssetPromise('uRm030012', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030313 end');
    })

    /**
     * @tc.name   testKeyRm030314
     * @tc.number SUB_ASSET_KEYRM_0314
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030314 begin');
      await removeAssetPromise('uRm030013', '');
      await addAssetPromise('uRm030013', 'password8', 'l13');
      await removeAssetPromise('uRm030013', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030314 end');
    })

    /**
     * @tc.name   testKeyRm030315
     * @tc.number SUB_ASSET_KEYRM_0315
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030315 begin');
      await removeAssetPromise('uRm030014', '');
      await addAssetPromise('uRm030014', 'pwd_16_chars_123', 'l14');
      await removeAssetPromise('uRm030014', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030315 end');
    })

    /**
     * @tc.name   testKeyRm030316
     * @tc.number SUB_ASSET_KEYRM_0316
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030316 begin');
      await removeAssetPromise('uRm030015', '');
      await addAssetPromise('uRm030015', '中文密码', 'l15');
      await removeAssetPromise('uRm030015', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030316 end');
    })

    /**
     * @tc.name   testKeyRm030317
     * @tc.number SUB_ASSET_KEYRM_0317
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030317 begin');
      await removeAssetPromise('uRm030016', '');
      await addAssetPromise('uRm030016', 'pwd@#$%^&*()', 'l16');
      await removeAssetPromise('uRm030016', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030317 end');
    })

    /**
     * @tc.name   testKeyRm030318
     * @tc.number SUB_ASSET_KEYRM_0318
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030318 begin');
      await removeAssetPromise('uRm030017', '');
      await addAssetPromise('uRm030017', '12345678', 'l17');
      await removeAssetPromise('uRm030017', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030318 end');
    })

    /**
     * @tc.name   testKeyRm030319
     * @tc.number SUB_ASSET_KEYRM_0319
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030319 begin');
      await removeAssetPromise('uRm030018', '');
      await addAssetPromise('uRm030018', 'p1', 'l18');
      await removeAssetPromise('uRm030018', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030319 end');
    })

    /**
     * @tc.name   testKeyRm030320
     * @tc.number SUB_ASSET_KEYRM_0320
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030320 begin');
      await removeAssetPromise('uRm030019', '');
      await addAssetPromise('uRm030019', 'password8', 'l19');
      await removeAssetPromise('uRm030019', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030320 end');
    })

    /**
     * @tc.name   testKeyRm030321
     * @tc.number SUB_ASSET_KEYRM_0321
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030321 begin');
      await removeAssetPromise('uRm030020', '');
      await addAssetPromise('uRm030020', 'pwd_16_chars_123', 'l20');
      await removeAssetPromise('uRm030020', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030321 end');
    })

    /**
     * @tc.name   testKeyRm030322
     * @tc.number SUB_ASSET_KEYRM_0322
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030322 begin');
      await removeAssetPromise('uRm030021', '');
      await addAssetPromise('uRm030021', '中文密码', 'l21');
      await removeAssetPromise('uRm030021', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030322 end');
    })

    /**
     * @tc.name   testKeyRm030323
     * @tc.number SUB_ASSET_KEYRM_0323
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030323 begin');
      await removeAssetPromise('uRm030022', '');
      await addAssetPromise('uRm030022', 'pwd@#$%^&*()', 'l22');
      await removeAssetPromise('uRm030022', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030323 end');
    })

    /**
     * @tc.name   testKeyRm030324
     * @tc.number SUB_ASSET_KEYRM_0324
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030324 begin');
      await removeAssetPromise('uRm030023', '');
      await addAssetPromise('uRm030023', '12345678', 'l23');
      await removeAssetPromise('uRm030023', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030324 end');
    })

    /**
     * @tc.name   testKeyRm030325
     * @tc.number SUB_ASSET_KEYRM_0325
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030325 begin');
      await removeAssetPromise('uRm030024', '');
      await addAssetPromise('uRm030024', 'p1', 'l24');
      await removeAssetPromise('uRm030024', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030325 end');
    })

    /**
     * @tc.name   testKeyRm030326
     * @tc.number SUB_ASSET_KEYRM_0326
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030326 begin');
      await removeAssetPromise('uRm030025', '');
      await addAssetPromise('uRm030025', 'password8', 'l25');
      await removeAssetPromise('uRm030025', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030326 end');
    })

    /**
     * @tc.name   testKeyRm030327
     * @tc.number SUB_ASSET_KEYRM_0327
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030327 begin');
      await removeAssetPromise('uRm030026', '');
      await addAssetPromise('uRm030026', 'pwd_16_chars_123', 'l26');
      await removeAssetPromise('uRm030026', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030327 end');
    })

    /**
     * @tc.name   testKeyRm030328
     * @tc.number SUB_ASSET_KEYRM_0328
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030328 begin');
      await removeAssetPromise('uRm030027', '');
      await addAssetPromise('uRm030027', '中文密码', 'l27');
      await removeAssetPromise('uRm030027', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030328 end');
    })

    /**
     * @tc.name   testKeyRm030329
     * @tc.number SUB_ASSET_KEYRM_0329
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030329 begin');
      await removeAssetPromise('uRm030028', '');
      await addAssetPromise('uRm030028', 'pwd@#$%^&*()', 'l28');
      await removeAssetPromise('uRm030028', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030329 end');
    })

    /**
     * @tc.name   testKeyRm030330
     * @tc.number SUB_ASSET_KEYRM_0330
     * @tc.desc   合法值：空标签条件整体删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030330 begin');
      await removeAssetPromise('uRm030029', '');
      await addAssetPromise('uRm030029', '12345678', 'l29');
      await removeAssetPromise('uRm030029', '');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030330 end');
    })

    /**
     * @tc.name   testKeyRm030331
     * @tc.number SUB_ASSET_KEYRM_0331
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030331 begin');
      await removeAssetPromise('uRm030030', '');
      await addAssetPromise('uRm030030', 'p1', 't0');
      await removeAssetPromise('uRm030030', 't0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030331 end');
    })

    /**
     * @tc.name   testKeyRm030332
     * @tc.number SUB_ASSET_KEYRM_0332
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030332 begin');
      await removeAssetPromise('uRm030031', '');
      await addAssetPromise('uRm030031', 'password8', 't1');
      await removeAssetPromise('uRm030031', 't1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030332 end');
    })

    /**
     * @tc.name   testKeyRm030333
     * @tc.number SUB_ASSET_KEYRM_0333
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030333 begin');
      await removeAssetPromise('uRm030032', '');
      await addAssetPromise('uRm030032', 'pwd_16_chars_123', 't2');
      await removeAssetPromise('uRm030032', 't2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030333 end');
    })

    /**
     * @tc.name   testKeyRm030334
     * @tc.number SUB_ASSET_KEYRM_0334
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030334 begin');
      await removeAssetPromise('uRm030033', '');
      await addAssetPromise('uRm030033', '中文密码', 't3');
      await removeAssetPromise('uRm030033', 't3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030334 end');
    })

    /**
     * @tc.name   testKeyRm030335
     * @tc.number SUB_ASSET_KEYRM_0335
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030335 begin');
      await removeAssetPromise('uRm030034', '');
      await addAssetPromise('uRm030034', 'pwd@#$%^&*()', 't4');
      await removeAssetPromise('uRm030034', 't4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030335 end');
    })

    /**
     * @tc.name   testKeyRm030336
     * @tc.number SUB_ASSET_KEYRM_0336
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030336 begin');
      await removeAssetPromise('uRm030035', '');
      await addAssetPromise('uRm030035', '12345678', 't5');
      await removeAssetPromise('uRm030035', 't5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030336 end');
    })

    /**
     * @tc.name   testKeyRm030337
     * @tc.number SUB_ASSET_KEYRM_0337
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030337 begin');
      await removeAssetPromise('uRm030036', '');
      await addAssetPromise('uRm030036', 'p1', 't6');
      await removeAssetPromise('uRm030036', 't6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030337 end');
    })

    /**
     * @tc.name   testKeyRm030338
     * @tc.number SUB_ASSET_KEYRM_0338
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030338 begin');
      await removeAssetPromise('uRm030037', '');
      await addAssetPromise('uRm030037', 'password8', 't7');
      await removeAssetPromise('uRm030037', 't7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030338 end');
    })

    /**
     * @tc.name   testKeyRm030339
     * @tc.number SUB_ASSET_KEYRM_0339
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030339 begin');
      await removeAssetPromise('uRm030038', '');
      await addAssetPromise('uRm030038', 'pwd_16_chars_123', 't8');
      await removeAssetPromise('uRm030038', 't8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030339 end');
    })

    /**
     * @tc.name   testKeyRm030340
     * @tc.number SUB_ASSET_KEYRM_0340
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030340 begin');
      await removeAssetPromise('uRm030039', '');
      await addAssetPromise('uRm030039', '中文密码', 't9');
      await removeAssetPromise('uRm030039', 't9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030340 end');
    })

    /**
     * @tc.name   testKeyRm030341
     * @tc.number SUB_ASSET_KEYRM_0341
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030341 begin');
      await removeAssetPromise('uRm030040', '');
      await addAssetPromise('uRm030040', 'pwd@#$%^&*()', 't10');
      await removeAssetPromise('uRm030040', 't10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030341 end');
    })

    /**
     * @tc.name   testKeyRm030342
     * @tc.number SUB_ASSET_KEYRM_0342
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030342 begin');
      await removeAssetPromise('uRm030041', '');
      await addAssetPromise('uRm030041', '12345678', 't11');
      await removeAssetPromise('uRm030041', 't11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030342 end');
    })

    /**
     * @tc.name   testKeyRm030343
     * @tc.number SUB_ASSET_KEYRM_0343
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030343 begin');
      await removeAssetPromise('uRm030042', '');
      await addAssetPromise('uRm030042', 'p1', 't12');
      await removeAssetPromise('uRm030042', 't12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030343 end');
    })

    /**
     * @tc.name   testKeyRm030344
     * @tc.number SUB_ASSET_KEYRM_0344
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030344 begin');
      await removeAssetPromise('uRm030043', '');
      await addAssetPromise('uRm030043', 'password8', 't13');
      await removeAssetPromise('uRm030043', 't13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030344 end');
    })

    /**
     * @tc.name   testKeyRm030345
     * @tc.number SUB_ASSET_KEYRM_0345
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030345 begin');
      await removeAssetPromise('uRm030044', '');
      await addAssetPromise('uRm030044', 'pwd_16_chars_123', 't14');
      await removeAssetPromise('uRm030044', 't14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030345 end');
    })

    /**
     * @tc.name   testKeyRm030346
     * @tc.number SUB_ASSET_KEYRM_0346
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030346 begin');
      await removeAssetPromise('uRm030045', '');
      await addAssetPromise('uRm030045', '中文密码', 't15');
      await removeAssetPromise('uRm030045', 't15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030346 end');
    })

    /**
     * @tc.name   testKeyRm030347
     * @tc.number SUB_ASSET_KEYRM_0347
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030347 begin');
      await removeAssetPromise('uRm030046', '');
      await addAssetPromise('uRm030046', 'pwd@#$%^&*()', 't16');
      await removeAssetPromise('uRm030046', 't16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030347 end');
    })

    /**
     * @tc.name   testKeyRm030348
     * @tc.number SUB_ASSET_KEYRM_0348
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030348 begin');
      await removeAssetPromise('uRm030047', '');
      await addAssetPromise('uRm030047', '12345678', 't17');
      await removeAssetPromise('uRm030047', 't17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030348 end');
    })

    /**
     * @tc.name   testKeyRm030349
     * @tc.number SUB_ASSET_KEYRM_0349
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030349 begin');
      await removeAssetPromise('uRm030048', '');
      await addAssetPromise('uRm030048', 'p1', 't18');
      await removeAssetPromise('uRm030048', 't18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030349 end');
    })

    /**
     * @tc.name   testKeyRm030350
     * @tc.number SUB_ASSET_KEYRM_0350
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030350 begin');
      await removeAssetPromise('uRm030049', '');
      await addAssetPromise('uRm030049', 'password8', 't19');
      await removeAssetPromise('uRm030049', 't19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030350 end');
    })

    /**
     * @tc.name   testKeyRm030351
     * @tc.number SUB_ASSET_KEYRM_0351
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030351 begin');
      await removeAssetPromise('uRm030050', '');
      await addAssetPromise('uRm030050', 'pwd_16_chars_123', 't20');
      await removeAssetPromise('uRm030050', 't20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030351 end');
    })

    /**
     * @tc.name   testKeyRm030352
     * @tc.number SUB_ASSET_KEYRM_0352
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030352 begin');
      await removeAssetPromise('uRm030051', '');
      await addAssetPromise('uRm030051', '中文密码', 't21');
      await removeAssetPromise('uRm030051', 't21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030352 end');
    })

    /**
     * @tc.name   testKeyRm030353
     * @tc.number SUB_ASSET_KEYRM_0353
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030353 begin');
      await removeAssetPromise('uRm030052', '');
      await addAssetPromise('uRm030052', 'pwd@#$%^&*()', 't22');
      await removeAssetPromise('uRm030052', 't22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030353 end');
    })

    /**
     * @tc.name   testKeyRm030354
     * @tc.number SUB_ASSET_KEYRM_0354
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030354 begin');
      await removeAssetPromise('uRm030053', '');
      await addAssetPromise('uRm030053', '12345678', 't23');
      await removeAssetPromise('uRm030053', 't23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030354 end');
    })

    /**
     * @tc.name   testKeyRm030355
     * @tc.number SUB_ASSET_KEYRM_0355
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030355 begin');
      await removeAssetPromise('uRm030054', '');
      await addAssetPromise('uRm030054', 'p1', 't24');
      await removeAssetPromise('uRm030054', 't24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030355 end');
    })

    /**
     * @tc.name   testKeyRm030356
     * @tc.number SUB_ASSET_KEYRM_0356
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030356 begin');
      await removeAssetPromise('uRm030055', '');
      await addAssetPromise('uRm030055', 'password8', 't25');
      await removeAssetPromise('uRm030055', 't25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030356 end');
    })

    /**
     * @tc.name   testKeyRm030357
     * @tc.number SUB_ASSET_KEYRM_0357
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030357 begin');
      await removeAssetPromise('uRm030056', '');
      await addAssetPromise('uRm030056', 'pwd_16_chars_123', 't26');
      await removeAssetPromise('uRm030056', 't26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030357 end');
    })

    /**
     * @tc.name   testKeyRm030358
     * @tc.number SUB_ASSET_KEYRM_0358
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030358 begin');
      await removeAssetPromise('uRm030057', '');
      await addAssetPromise('uRm030057', '中文密码', 't27');
      await removeAssetPromise('uRm030057', 't27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030358 end');
    })

    /**
     * @tc.name   testKeyRm030359
     * @tc.number SUB_ASSET_KEYRM_0359
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030359 begin');
      await removeAssetPromise('uRm030058', '');
      await addAssetPromise('uRm030058', 'pwd@#$%^&*()', 't28');
      await removeAssetPromise('uRm030058', 't28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030359 end');
    })

    /**
     * @tc.name   testKeyRm030360
     * @tc.number SUB_ASSET_KEYRM_0360
     * @tc.desc   合法值：单标签条件匹配删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030360 begin');
      await removeAssetPromise('uRm030059', '');
      await addAssetPromise('uRm030059', '12345678', 't29');
      await removeAssetPromise('uRm030059', 't29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030360 end');
    })

    /**
     * @tc.name   testKeyRm030361
     * @tc.number SUB_ASSET_KEYRM_0361
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030361 begin');
      await removeAssetPromise('uRm030060', '');
      await addAssetPromise('uRm030060', 'p1', 'm0;n0');
      await removeAssetPromise('uRm030060', 'n0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030361 end');
    })

    /**
     * @tc.name   testKeyRm030362
     * @tc.number SUB_ASSET_KEYRM_0362
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030362 begin');
      await removeAssetPromise('uRm030061', '');
      await addAssetPromise('uRm030061', 'password8', 'm1;n1');
      await removeAssetPromise('uRm030061', 'n1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030362 end');
    })

    /**
     * @tc.name   testKeyRm030363
     * @tc.number SUB_ASSET_KEYRM_0363
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030363 begin');
      await removeAssetPromise('uRm030062', '');
      await addAssetPromise('uRm030062', 'pwd_16_chars_123', 'm2;n2');
      await removeAssetPromise('uRm030062', 'n2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030363 end');
    })

    /**
     * @tc.name   testKeyRm030364
     * @tc.number SUB_ASSET_KEYRM_0364
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030364 begin');
      await removeAssetPromise('uRm030063', '');
      await addAssetPromise('uRm030063', '中文密码', 'm3;n3');
      await removeAssetPromise('uRm030063', 'n3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030364 end');
    })

    /**
     * @tc.name   testKeyRm030365
     * @tc.number SUB_ASSET_KEYRM_0365
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030365 begin');
      await removeAssetPromise('uRm030064', '');
      await addAssetPromise('uRm030064', 'pwd@#$%^&*()', 'm4;n4');
      await removeAssetPromise('uRm030064', 'n4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030365 end');
    })

    /**
     * @tc.name   testKeyRm030366
     * @tc.number SUB_ASSET_KEYRM_0366
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030366 begin');
      await removeAssetPromise('uRm030065', '');
      await addAssetPromise('uRm030065', '12345678', 'm5;n5');
      await removeAssetPromise('uRm030065', 'n5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030366 end');
    })

    /**
     * @tc.name   testKeyRm030367
     * @tc.number SUB_ASSET_KEYRM_0367
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030367 begin');
      await removeAssetPromise('uRm030066', '');
      await addAssetPromise('uRm030066', 'p1', 'm6;n6');
      await removeAssetPromise('uRm030066', 'n6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030367 end');
    })

    /**
     * @tc.name   testKeyRm030368
     * @tc.number SUB_ASSET_KEYRM_0368
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030368 begin');
      await removeAssetPromise('uRm030067', '');
      await addAssetPromise('uRm030067', 'password8', 'm7;n7');
      await removeAssetPromise('uRm030067', 'n7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030368 end');
    })

    /**
     * @tc.name   testKeyRm030369
     * @tc.number SUB_ASSET_KEYRM_0369
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030369 begin');
      await removeAssetPromise('uRm030068', '');
      await addAssetPromise('uRm030068', 'pwd_16_chars_123', 'm8;n8');
      await removeAssetPromise('uRm030068', 'n8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030369 end');
    })

    /**
     * @tc.name   testKeyRm030370
     * @tc.number SUB_ASSET_KEYRM_0370
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030370 begin');
      await removeAssetPromise('uRm030069', '');
      await addAssetPromise('uRm030069', '中文密码', 'm9;n9');
      await removeAssetPromise('uRm030069', 'n9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030370 end');
    })

    /**
     * @tc.name   testKeyRm030371
     * @tc.number SUB_ASSET_KEYRM_0371
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030371 begin');
      await removeAssetPromise('uRm030070', '');
      await addAssetPromise('uRm030070', 'pwd@#$%^&*()', 'm10;n10');
      await removeAssetPromise('uRm030070', 'n10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030371 end');
    })

    /**
     * @tc.name   testKeyRm030372
     * @tc.number SUB_ASSET_KEYRM_0372
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030372 begin');
      await removeAssetPromise('uRm030071', '');
      await addAssetPromise('uRm030071', '12345678', 'm11;n11');
      await removeAssetPromise('uRm030071', 'n11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030372 end');
    })

    /**
     * @tc.name   testKeyRm030373
     * @tc.number SUB_ASSET_KEYRM_0373
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030373 begin');
      await removeAssetPromise('uRm030072', '');
      await addAssetPromise('uRm030072', 'p1', 'm12;n12');
      await removeAssetPromise('uRm030072', 'n12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030373 end');
    })

    /**
     * @tc.name   testKeyRm030374
     * @tc.number SUB_ASSET_KEYRM_0374
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030374 begin');
      await removeAssetPromise('uRm030073', '');
      await addAssetPromise('uRm030073', 'password8', 'm13;n13');
      await removeAssetPromise('uRm030073', 'n13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030374 end');
    })

    /**
     * @tc.name   testKeyRm030375
     * @tc.number SUB_ASSET_KEYRM_0375
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030375 begin');
      await removeAssetPromise('uRm030074', '');
      await addAssetPromise('uRm030074', 'pwd_16_chars_123', 'm14;n14');
      await removeAssetPromise('uRm030074', 'n14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030375 end');
    })

    /**
     * @tc.name   testKeyRm030376
     * @tc.number SUB_ASSET_KEYRM_0376
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030376 begin');
      await removeAssetPromise('uRm030075', '');
      await addAssetPromise('uRm030075', '中文密码', 'm15;n15');
      await removeAssetPromise('uRm030075', 'n15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030376 end');
    })

    /**
     * @tc.name   testKeyRm030377
     * @tc.number SUB_ASSET_KEYRM_0377
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030377 begin');
      await removeAssetPromise('uRm030076', '');
      await addAssetPromise('uRm030076', 'pwd@#$%^&*()', 'm16;n16');
      await removeAssetPromise('uRm030076', 'n16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030377 end');
    })

    /**
     * @tc.name   testKeyRm030378
     * @tc.number SUB_ASSET_KEYRM_0378
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030378 begin');
      await removeAssetPromise('uRm030077', '');
      await addAssetPromise('uRm030077', '12345678', 'm17;n17');
      await removeAssetPromise('uRm030077', 'n17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030378 end');
    })

    /**
     * @tc.name   testKeyRm030379
     * @tc.number SUB_ASSET_KEYRM_0379
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030379 begin');
      await removeAssetPromise('uRm030078', '');
      await addAssetPromise('uRm030078', 'p1', 'm18;n18');
      await removeAssetPromise('uRm030078', 'n18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030379 end');
    })

    /**
     * @tc.name   testKeyRm030380
     * @tc.number SUB_ASSET_KEYRM_0380
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030380 begin');
      await removeAssetPromise('uRm030079', '');
      await addAssetPromise('uRm030079', 'password8', 'm19;n19');
      await removeAssetPromise('uRm030079', 'n19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030380 end');
    })

    /**
     * @tc.name   testKeyRm030381
     * @tc.number SUB_ASSET_KEYRM_0381
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030381 begin');
      await removeAssetPromise('uRm030080', '');
      await addAssetPromise('uRm030080', 'pwd_16_chars_123', 'm20;n20');
      await removeAssetPromise('uRm030080', 'n20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030381 end');
    })

    /**
     * @tc.name   testKeyRm030382
     * @tc.number SUB_ASSET_KEYRM_0382
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030382 begin');
      await removeAssetPromise('uRm030081', '');
      await addAssetPromise('uRm030081', '中文密码', 'm21;n21');
      await removeAssetPromise('uRm030081', 'n21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030382 end');
    })

    /**
     * @tc.name   testKeyRm030383
     * @tc.number SUB_ASSET_KEYRM_0383
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030383 begin');
      await removeAssetPromise('uRm030082', '');
      await addAssetPromise('uRm030082', 'pwd@#$%^&*()', 'm22;n22');
      await removeAssetPromise('uRm030082', 'n22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030383 end');
    })

    /**
     * @tc.name   testKeyRm030384
     * @tc.number SUB_ASSET_KEYRM_0384
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030384 begin');
      await removeAssetPromise('uRm030083', '');
      await addAssetPromise('uRm030083', '12345678', 'm23;n23');
      await removeAssetPromise('uRm030083', 'n23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030384 end');
    })

    /**
     * @tc.name   testKeyRm030385
     * @tc.number SUB_ASSET_KEYRM_0385
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030385 begin');
      await removeAssetPromise('uRm030084', '');
      await addAssetPromise('uRm030084', 'p1', 'm24;n24');
      await removeAssetPromise('uRm030084', 'n24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030385 end');
    })

    /**
     * @tc.name   testKeyRm030386
     * @tc.number SUB_ASSET_KEYRM_0386
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030386 begin');
      await removeAssetPromise('uRm030085', '');
      await addAssetPromise('uRm030085', 'password8', 'm25;n25');
      await removeAssetPromise('uRm030085', 'n25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030386 end');
    })

    /**
     * @tc.name   testKeyRm030387
     * @tc.number SUB_ASSET_KEYRM_0387
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030387 begin');
      await removeAssetPromise('uRm030086', '');
      await addAssetPromise('uRm030086', 'pwd_16_chars_123', 'm26;n26');
      await removeAssetPromise('uRm030086', 'n26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030387 end');
    })

    /**
     * @tc.name   testKeyRm030388
     * @tc.number SUB_ASSET_KEYRM_0388
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030388 begin');
      await removeAssetPromise('uRm030087', '');
      await addAssetPromise('uRm030087', '中文密码', 'm27;n27');
      await removeAssetPromise('uRm030087', 'n27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030388 end');
    })

    /**
     * @tc.name   testKeyRm030389
     * @tc.number SUB_ASSET_KEYRM_0389
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030389 begin');
      await removeAssetPromise('uRm030088', '');
      await addAssetPromise('uRm030088', 'pwd@#$%^&*()', 'm28;n28');
      await removeAssetPromise('uRm030088', 'n28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030389 end');
    })

    /**
     * @tc.name   testKeyRm030390
     * @tc.number SUB_ASSET_KEYRM_0390
     * @tc.desc   合法值：多标签条件命中其一删除后查询不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030390 begin');
      await removeAssetPromise('uRm030089', '');
      await addAssetPromise('uRm030089', '12345678', 'm29;n29');
      await removeAssetPromise('uRm030089', 'n29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030390 end');
    })

    /**
     * @tc.name   testKeyRm030391
     * @tc.number SUB_ASSET_KEYRM_0391
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030391 begin');
      await removeAssetPromise('uRm030090', '');
      await addAssetPromise('uRm030090', 'p1', 'k0');
      await removeAssetPromise('uRm030090', 'nomatch0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030391 end');
    })

    /**
     * @tc.name   testKeyRm030392
     * @tc.number SUB_ASSET_KEYRM_0392
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030392 begin');
      await removeAssetPromise('uRm030091', '');
      await addAssetPromise('uRm030091', 'password8', 'k1');
      await removeAssetPromise('uRm030091', 'nomatch1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030392 end');
    })

    /**
     * @tc.name   testKeyRm030393
     * @tc.number SUB_ASSET_KEYRM_0393
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030393 begin');
      await removeAssetPromise('uRm030092', '');
      await addAssetPromise('uRm030092', 'pwd_16_chars_123', 'k2');
      await removeAssetPromise('uRm030092', 'nomatch2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030393 end');
    })

    /**
     * @tc.name   testKeyRm030394
     * @tc.number SUB_ASSET_KEYRM_0394
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030394 begin');
      await removeAssetPromise('uRm030093', '');
      await addAssetPromise('uRm030093', '中文密码', 'k3');
      await removeAssetPromise('uRm030093', 'nomatch3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030394 end');
    })

    /**
     * @tc.name   testKeyRm030395
     * @tc.number SUB_ASSET_KEYRM_0395
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030395 begin');
      await removeAssetPromise('uRm030094', '');
      await addAssetPromise('uRm030094', 'pwd@#$%^&*()', 'k4');
      await removeAssetPromise('uRm030094', 'nomatch4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030395 end');
    })

    /**
     * @tc.name   testKeyRm030396
     * @tc.number SUB_ASSET_KEYRM_0396
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030396 begin');
      await removeAssetPromise('uRm030095', '');
      await addAssetPromise('uRm030095', '12345678', 'k5');
      await removeAssetPromise('uRm030095', 'nomatch5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030396 end');
    })

    /**
     * @tc.name   testKeyRm030397
     * @tc.number SUB_ASSET_KEYRM_0397
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030397 begin');
      await removeAssetPromise('uRm030096', '');
      await addAssetPromise('uRm030096', 'p1', 'k6');
      await removeAssetPromise('uRm030096', 'nomatch6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030397 end');
    })

    /**
     * @tc.name   testKeyRm030398
     * @tc.number SUB_ASSET_KEYRM_0398
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030398 begin');
      await removeAssetPromise('uRm030097', '');
      await addAssetPromise('uRm030097', 'password8', 'k7');
      await removeAssetPromise('uRm030097', 'nomatch7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030398 end');
    })

    /**
     * @tc.name   testKeyRm030399
     * @tc.number SUB_ASSET_KEYRM_0399
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030399 begin');
      await removeAssetPromise('uRm030098', '');
      await addAssetPromise('uRm030098', 'pwd_16_chars_123', 'k8');
      await removeAssetPromise('uRm030098', 'nomatch8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030399 end');
    })

    /**
     * @tc.name   testKeyRm030400
     * @tc.number SUB_ASSET_KEYRM_0400
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030400 begin');
      await removeAssetPromise('uRm030099', '');
      await addAssetPromise('uRm030099', '中文密码', 'k9');
      await removeAssetPromise('uRm030099', 'nomatch9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030400 end');
    })

    /**
     * @tc.name   testKeyRm030401
     * @tc.number SUB_ASSET_KEYRM_0401
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030401 begin');
      await removeAssetPromise('uRm030100', '');
      await addAssetPromise('uRm030100', 'pwd@#$%^&*()', 'k10');
      await removeAssetPromise('uRm030100', 'nomatch10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030401 end');
    })

    /**
     * @tc.name   testKeyRm030402
     * @tc.number SUB_ASSET_KEYRM_0402
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030402 begin');
      await removeAssetPromise('uRm030101', '');
      await addAssetPromise('uRm030101', '12345678', 'k11');
      await removeAssetPromise('uRm030101', 'nomatch11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030402 end');
    })

    /**
     * @tc.name   testKeyRm030403
     * @tc.number SUB_ASSET_KEYRM_0403
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030403 begin');
      await removeAssetPromise('uRm030102', '');
      await addAssetPromise('uRm030102', 'p1', 'k12');
      await removeAssetPromise('uRm030102', 'nomatch12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030403 end');
    })

    /**
     * @tc.name   testKeyRm030404
     * @tc.number SUB_ASSET_KEYRM_0404
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030404 begin');
      await removeAssetPromise('uRm030103', '');
      await addAssetPromise('uRm030103', 'password8', 'k13');
      await removeAssetPromise('uRm030103', 'nomatch13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030404 end');
    })

    /**
     * @tc.name   testKeyRm030405
     * @tc.number SUB_ASSET_KEYRM_0405
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030405 begin');
      await removeAssetPromise('uRm030104', '');
      await addAssetPromise('uRm030104', 'pwd_16_chars_123', 'k14');
      await removeAssetPromise('uRm030104', 'nomatch14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030405 end');
    })

    /**
     * @tc.name   testKeyRm030406
     * @tc.number SUB_ASSET_KEYRM_0406
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030406 begin');
      await removeAssetPromise('uRm030105', '');
      await addAssetPromise('uRm030105', '中文密码', 'k15');
      await removeAssetPromise('uRm030105', 'nomatch15');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030406 end');
    })

    /**
     * @tc.name   testKeyRm030407
     * @tc.number SUB_ASSET_KEYRM_0407
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030407 begin');
      await removeAssetPromise('uRm030106', '');
      await addAssetPromise('uRm030106', 'pwd@#$%^&*()', 'k16');
      await removeAssetPromise('uRm030106', 'nomatch16');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030407 end');
    })

    /**
     * @tc.name   testKeyRm030408
     * @tc.number SUB_ASSET_KEYRM_0408
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030408 begin');
      await removeAssetPromise('uRm030107', '');
      await addAssetPromise('uRm030107', '12345678', 'k17');
      await removeAssetPromise('uRm030107', 'nomatch17');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030408 end');
    })

    /**
     * @tc.name   testKeyRm030409
     * @tc.number SUB_ASSET_KEYRM_0409
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030409 begin');
      await removeAssetPromise('uRm030108', '');
      await addAssetPromise('uRm030108', 'p1', 'k18');
      await removeAssetPromise('uRm030108', 'nomatch18');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030409 end');
    })

    /**
     * @tc.name   testKeyRm030410
     * @tc.number SUB_ASSET_KEYRM_0410
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030410 begin');
      await removeAssetPromise('uRm030109', '');
      await addAssetPromise('uRm030109', 'password8', 'k19');
      await removeAssetPromise('uRm030109', 'nomatch19');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030410 end');
    })

    /**
     * @tc.name   testKeyRm030411
     * @tc.number SUB_ASSET_KEYRM_0411
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030411 begin');
      await removeAssetPromise('uRm030110', '');
      await addAssetPromise('uRm030110', 'pwd_16_chars_123', 'k20');
      await removeAssetPromise('uRm030110', 'nomatch20');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030411 end');
    })

    /**
     * @tc.name   testKeyRm030412
     * @tc.number SUB_ASSET_KEYRM_0412
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030412 begin');
      await removeAssetPromise('uRm030111', '');
      await addAssetPromise('uRm030111', '中文密码', 'k21');
      await removeAssetPromise('uRm030111', 'nomatch21');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030412 end');
    })

    /**
     * @tc.name   testKeyRm030413
     * @tc.number SUB_ASSET_KEYRM_0413
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030413 begin');
      await removeAssetPromise('uRm030112', '');
      await addAssetPromise('uRm030112', 'pwd@#$%^&*()', 'k22');
      await removeAssetPromise('uRm030112', 'nomatch22');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030413 end');
    })

    /**
     * @tc.name   testKeyRm030414
     * @tc.number SUB_ASSET_KEYRM_0414
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030414 begin');
      await removeAssetPromise('uRm030113', '');
      await addAssetPromise('uRm030113', '12345678', 'k23');
      await removeAssetPromise('uRm030113', 'nomatch23');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030414 end');
    })

    /**
     * @tc.name   testKeyRm030415
     * @tc.number SUB_ASSET_KEYRM_0415
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030415 begin');
      await removeAssetPromise('uRm030114', '');
      await addAssetPromise('uRm030114', 'p1', 'k24');
      await removeAssetPromise('uRm030114', 'nomatch24');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030415 end');
    })

    /**
     * @tc.name   testKeyRm030416
     * @tc.number SUB_ASSET_KEYRM_0416
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030416 begin');
      await removeAssetPromise('uRm030115', '');
      await addAssetPromise('uRm030115', 'password8', 'k25');
      await removeAssetPromise('uRm030115', 'nomatch25');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030416 end');
    })

    /**
     * @tc.name   testKeyRm030417
     * @tc.number SUB_ASSET_KEYRM_0417
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030417 begin');
      await removeAssetPromise('uRm030116', '');
      await addAssetPromise('uRm030116', 'pwd_16_chars_123', 'k26');
      await removeAssetPromise('uRm030116', 'nomatch26');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030417 end');
    })

    /**
     * @tc.name   testKeyRm030418
     * @tc.number SUB_ASSET_KEYRM_0418
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030418 begin');
      await removeAssetPromise('uRm030117', '');
      await addAssetPromise('uRm030117', '中文密码', 'k27');
      await removeAssetPromise('uRm030117', 'nomatch27');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030418 end');
    })

    /**
     * @tc.name   testKeyRm030419
     * @tc.number SUB_ASSET_KEYRM_0419
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030419 begin');
      await removeAssetPromise('uRm030118', '');
      await addAssetPromise('uRm030118', 'pwd@#$%^&*()', 'k28');
      await removeAssetPromise('uRm030118', 'nomatch28');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030419 end');
    })

    /**
     * @tc.name   testKeyRm030420
     * @tc.number SUB_ASSET_KEYRM_0420
     * @tc.desc   非法值：标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030420 begin');
      await removeAssetPromise('uRm030119', '');
      await addAssetPromise('uRm030119', '12345678', 'k29');
      await removeAssetPromise('uRm030119', 'nomatch29');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030420 end');
    })

    /**
     * @tc.name   testKeyRm030421
     * @tc.number SUB_ASSET_KEYRM_0421
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030421 begin');
      await removeAssetPromise('uRm030120', '');
      await addAssetPromise('uRm030120', 'p1', 's0;t0');
      await removeAssetPromise('uRm030120', 's0;;t0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030421 end');
    })

    /**
     * @tc.name   testKeyRm030422
     * @tc.number SUB_ASSET_KEYRM_0422
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030422 begin');
      await removeAssetPromise('uRm030121', '');
      await addAssetPromise('uRm030121', 'password8', 's1;t1');
      await removeAssetPromise('uRm030121', 's1;;t1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030422 end');
    })

    /**
     * @tc.name   testKeyRm030423
     * @tc.number SUB_ASSET_KEYRM_0423
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030423 begin');
      await removeAssetPromise('uRm030122', '');
      await addAssetPromise('uRm030122', 'pwd_16_chars_123', 's2;t2');
      await removeAssetPromise('uRm030122', 's2;;t2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030423 end');
    })

    /**
     * @tc.name   testKeyRm030424
     * @tc.number SUB_ASSET_KEYRM_0424
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030424 begin');
      await removeAssetPromise('uRm030123', '');
      await addAssetPromise('uRm030123', '中文密码', 's3;t3');
      await removeAssetPromise('uRm030123', 's3;;t3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030424 end');
    })

    /**
     * @tc.name   testKeyRm030425
     * @tc.number SUB_ASSET_KEYRM_0425
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030425 begin');
      await removeAssetPromise('uRm030124', '');
      await addAssetPromise('uRm030124', 'pwd@#$%^&*()', 's4;t4');
      await removeAssetPromise('uRm030124', 's4;;t4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030425 end');
    })

    /**
     * @tc.name   testKeyRm030426
     * @tc.number SUB_ASSET_KEYRM_0426
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030426 begin');
      await removeAssetPromise('uRm030125', '');
      await addAssetPromise('uRm030125', '12345678', 's5;t5');
      await removeAssetPromise('uRm030125', 's5;;t5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030426 end');
    })

    /**
     * @tc.name   testKeyRm030427
     * @tc.number SUB_ASSET_KEYRM_0427
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030427 begin');
      await removeAssetPromise('uRm030126', '');
      await addAssetPromise('uRm030126', 'p1', 's6;t6');
      await removeAssetPromise('uRm030126', 's6;;t6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030427 end');
    })

    /**
     * @tc.name   testKeyRm030428
     * @tc.number SUB_ASSET_KEYRM_0428
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030428 begin');
      await removeAssetPromise('uRm030127', '');
      await addAssetPromise('uRm030127', 'password8', 's7;t7');
      await removeAssetPromise('uRm030127', 's7;;t7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030428 end');
    })

    /**
     * @tc.name   testKeyRm030429
     * @tc.number SUB_ASSET_KEYRM_0429
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030429 begin');
      await removeAssetPromise('uRm030128', '');
      await addAssetPromise('uRm030128', 'pwd_16_chars_123', 's8;t8');
      await removeAssetPromise('uRm030128', 's8;;t8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030429 end');
    })

    /**
     * @tc.name   testKeyRm030430
     * @tc.number SUB_ASSET_KEYRM_0430
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030430 begin');
      await removeAssetPromise('uRm030129', '');
      await addAssetPromise('uRm030129', '中文密码', 's9;t9');
      await removeAssetPromise('uRm030129', 's9;;t9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030430 end');
    })

    /**
     * @tc.name   testKeyRm030431
     * @tc.number SUB_ASSET_KEYRM_0431
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030431 begin');
      await removeAssetPromise('uRm030130', '');
      await addAssetPromise('uRm030130', 'pwd@#$%^&*()', 's10;t10');
      await removeAssetPromise('uRm030130', 's10;;t10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030431 end');
    })

    /**
     * @tc.name   testKeyRm030432
     * @tc.number SUB_ASSET_KEYRM_0432
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030432 begin');
      await removeAssetPromise('uRm030131', '');
      await addAssetPromise('uRm030131', '12345678', 's11;t11');
      await removeAssetPromise('uRm030131', 's11;;t11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030432 end');
    })

    /**
     * @tc.name   testKeyRm030433
     * @tc.number SUB_ASSET_KEYRM_0433
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030433 begin');
      await removeAssetPromise('uRm030132', '');
      await addAssetPromise('uRm030132', 'p1', 's12;t12');
      await removeAssetPromise('uRm030132', 's12;;t12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030433 end');
    })

    /**
     * @tc.name   testKeyRm030434
     * @tc.number SUB_ASSET_KEYRM_0434
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030434 begin');
      await removeAssetPromise('uRm030133', '');
      await addAssetPromise('uRm030133', 'password8', 's13;t13');
      await removeAssetPromise('uRm030133', 's13;;t13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030434 end');
    })

    /**
     * @tc.name   testKeyRm030435
     * @tc.number SUB_ASSET_KEYRM_0435
     * @tc.desc   边界值：空段标签过滤后匹配删除
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030435 begin');
      await removeAssetPromise('uRm030134', '');
      await addAssetPromise('uRm030134', 'pwd_16_chars_123', 's14;t14');
      await removeAssetPromise('uRm030134', 's14;;t14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uRm030134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030435 end');
    })

    /**
     * @tc.name   testKeyRm030436
     * @tc.number SUB_ASSET_KEYRM_0436
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030436 begin');
      await removeAssetPromise('uRm030135', '');
      await addAssetPromise('uRm030135', '中文密码', 'q0');
      await removeAssetPromise('uRm030135', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx0');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030436 end');
    })

    /**
     * @tc.name   testKeyRm030437
     * @tc.number SUB_ASSET_KEYRM_0437
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030437 begin');
      await removeAssetPromise('uRm030136', '');
      await addAssetPromise('uRm030136', 'pwd@#$%^&*()', 'q1');
      await removeAssetPromise('uRm030136', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx1');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030437 end');
    })

    /**
     * @tc.name   testKeyRm030438
     * @tc.number SUB_ASSET_KEYRM_0438
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030438 begin');
      await removeAssetPromise('uRm030137', '');
      await addAssetPromise('uRm030137', '12345678', 'q2');
      await removeAssetPromise('uRm030137', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx2');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030438 end');
    })

    /**
     * @tc.name   testKeyRm030439
     * @tc.number SUB_ASSET_KEYRM_0439
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030439 begin');
      await removeAssetPromise('uRm030138', '');
      await addAssetPromise('uRm030138', 'p1', 'q3');
      await removeAssetPromise('uRm030138', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx3');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030439 end');
    })

    /**
     * @tc.name   testKeyRm030440
     * @tc.number SUB_ASSET_KEYRM_0440
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030440 begin');
      await removeAssetPromise('uRm030139', '');
      await addAssetPromise('uRm030139', 'password8', 'q4');
      await removeAssetPromise('uRm030139', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx4');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030440 end');
    })

    /**
     * @tc.name   testKeyRm030441
     * @tc.number SUB_ASSET_KEYRM_0441
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030441 begin');
      await removeAssetPromise('uRm030140', '');
      await addAssetPromise('uRm030140', 'pwd_16_chars_123', 'q5');
      await removeAssetPromise('uRm030140', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx5');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030441 end');
    })

    /**
     * @tc.name   testKeyRm030442
     * @tc.number SUB_ASSET_KEYRM_0442
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030442 begin');
      await removeAssetPromise('uRm030141', '');
      await addAssetPromise('uRm030141', '中文密码', 'q6');
      await removeAssetPromise('uRm030141', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx6');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030442 end');
    })

    /**
     * @tc.name   testKeyRm030443
     * @tc.number SUB_ASSET_KEYRM_0443
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030443 begin');
      await removeAssetPromise('uRm030142', '');
      await addAssetPromise('uRm030142', 'pwd@#$%^&*()', 'q7');
      await removeAssetPromise('uRm030142', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx7');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030443 end');
    })

    /**
     * @tc.name   testKeyRm030444
     * @tc.number SUB_ASSET_KEYRM_0444
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030444 begin');
      await removeAssetPromise('uRm030143', '');
      await addAssetPromise('uRm030143', '12345678', 'q8');
      await removeAssetPromise('uRm030143', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx8');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030444 end');
    })

    /**
     * @tc.name   testKeyRm030445
     * @tc.number SUB_ASSET_KEYRM_0445
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030445 begin');
      await removeAssetPromise('uRm030144', '');
      await addAssetPromise('uRm030144', 'p1', 'q9');
      await removeAssetPromise('uRm030144', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx9');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030445 end');
    })

    /**
     * @tc.name   testKeyRm030446
     * @tc.number SUB_ASSET_KEYRM_0446
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030446 begin');
      await removeAssetPromise('uRm030145', '');
      await addAssetPromise('uRm030145', 'password8', 'q10');
      await removeAssetPromise('uRm030145', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx10');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030446 end');
    })

    /**
     * @tc.name   testKeyRm030447
     * @tc.number SUB_ASSET_KEYRM_0447
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030447 begin');
      await removeAssetPromise('uRm030146', '');
      await addAssetPromise('uRm030146', 'pwd_16_chars_123', 'q11');
      await removeAssetPromise('uRm030146', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx11');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030447 end');
    })

    /**
     * @tc.name   testKeyRm030448
     * @tc.number SUB_ASSET_KEYRM_0448
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030448 begin');
      await removeAssetPromise('uRm030147', '');
      await addAssetPromise('uRm030147', '中文密码', 'q12');
      await removeAssetPromise('uRm030147', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx12');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030448 end');
    })

    /**
     * @tc.name   testKeyRm030449
     * @tc.number SUB_ASSET_KEYRM_0449
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030449 begin');
      await removeAssetPromise('uRm030148', '');
      await addAssetPromise('uRm030148', 'pwd@#$%^&*()', 'q13');
      await removeAssetPromise('uRm030148', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx13');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030449 end');
    })

    /**
     * @tc.name   testKeyRm030450
     * @tc.number SUB_ASSET_KEYRM_0450
     * @tc.desc   非法值：超长标签不匹配删除后资产保留
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyRm030450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030450 begin');
      await removeAssetPromise('uRm030149', '');
      await addAssetPromise('uRm030149', '12345678', 'q14');
      await removeAssetPromise('uRm030149', 
'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx' +
        'xxxxxxxx14');
      const result: Map<string, string>[] = await queryAssetPromise('uRm030149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uRm030149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyRm030450 end');
    })

  })
}
