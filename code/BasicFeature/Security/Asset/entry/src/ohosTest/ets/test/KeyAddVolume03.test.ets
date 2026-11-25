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

export default function keyAddVolume03() {
  describe('KeyAddVolume03Test', () => {

    /**
     * @tc.name   testKeyAdd030301
     * @tc.number SUB_ASSET_KEYADD_0301
     * @tc.desc   addAssetPromise 保存后按账号查询回读 secret 与 label 一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030301', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030301 begin');
      const alias: string = 'uAddAnchor01';
      const secret: string = 'anchorSecret';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, secret, 'anchorLabel');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual(secret);
      expect(rows[0].get('label')).assertEqual('anchorLabel');
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030301 end');
    })

    /**
     * @tc.name   testKeyAdd030302
     * @tc.number SUB_ASSET_KEYADD_0302
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030302', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030302 begin');
      await removeAssetPromise('uAdd030001', '');
      await addAssetPromise('uAdd030001', 'password8', 'tagA1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030302 end');
    })

    /**
     * @tc.name   testKeyAdd030303
     * @tc.number SUB_ASSET_KEYADD_0303
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030303', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030303 begin');
      await removeAssetPromise('uAdd030002', '');
      await addAssetPromise('uAdd030002', 'pwd_16_chars_123', 'tagA2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030303 end');
    })

    /**
     * @tc.name   testKeyAdd030304
     * @tc.number SUB_ASSET_KEYADD_0304
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030304', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030304 begin');
      await removeAssetPromise('uAdd030003', '');
      await addAssetPromise('uAdd030003', '中文密码', 'tagA3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030304 end');
    })

    /**
     * @tc.name   testKeyAdd030305
     * @tc.number SUB_ASSET_KEYADD_0305
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030305', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030305 begin');
      await removeAssetPromise('uAdd030004', '');
      await addAssetPromise('uAdd030004', 'pwd@#$%^&*()', 'tagA4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030305 end');
    })

    /**
     * @tc.name   testKeyAdd030306
     * @tc.number SUB_ASSET_KEYADD_0306
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030306', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030306 begin');
      await removeAssetPromise('uAdd030005', '');
      await addAssetPromise('uAdd030005', '12345678', 'tagA5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030306 end');
    })

    /**
     * @tc.name   testKeyAdd030307
     * @tc.number SUB_ASSET_KEYADD_0307
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030307', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030307 begin');
      await removeAssetPromise('uAdd030006', '');
      await addAssetPromise('uAdd030006', 'p1', 'tagA6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030307 end');
    })

    /**
     * @tc.name   testKeyAdd030308
     * @tc.number SUB_ASSET_KEYADD_0308
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030308', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030308 begin');
      await removeAssetPromise('uAdd030007', '');
      await addAssetPromise('uAdd030007', 'password8', 'tagA7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030308 end');
    })

    /**
     * @tc.name   testKeyAdd030309
     * @tc.number SUB_ASSET_KEYADD_0309
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030309', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030309 begin');
      await removeAssetPromise('uAdd030008', '');
      await addAssetPromise('uAdd030008', 'pwd_16_chars_123', 'tagA8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030309 end');
    })

    /**
     * @tc.name   testKeyAdd030310
     * @tc.number SUB_ASSET_KEYADD_0310
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030310', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030310 begin');
      await removeAssetPromise('uAdd030009', '');
      await addAssetPromise('uAdd030009', '中文密码', 'tagA9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030310 end');
    })

    /**
     * @tc.name   testKeyAdd030311
     * @tc.number SUB_ASSET_KEYADD_0311
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030311', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030311 begin');
      await removeAssetPromise('uAdd030010', '');
      await addAssetPromise('uAdd030010', 'pwd@#$%^&*()', 'tagA10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030311 end');
    })

    /**
     * @tc.name   testKeyAdd030312
     * @tc.number SUB_ASSET_KEYADD_0312
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030312', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030312 begin');
      await removeAssetPromise('uAdd030011', '');
      await addAssetPromise('uAdd030011', '12345678', 'tagA11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030312 end');
    })

    /**
     * @tc.name   testKeyAdd030313
     * @tc.number SUB_ASSET_KEYADD_0313
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030313', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030313 begin');
      await removeAssetPromise('uAdd030012', '');
      await addAssetPromise('uAdd030012', 'p1', 'tagA12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030313 end');
    })

    /**
     * @tc.name   testKeyAdd030314
     * @tc.number SUB_ASSET_KEYADD_0314
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030314', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030314 begin');
      await removeAssetPromise('uAdd030013', '');
      await addAssetPromise('uAdd030013', 'password8', 'tagA13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030314 end');
    })

    /**
     * @tc.name   testKeyAdd030315
     * @tc.number SUB_ASSET_KEYADD_0315
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030315', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030315 begin');
      await removeAssetPromise('uAdd030014', '');
      await addAssetPromise('uAdd030014', 'pwd_16_chars_123', 'tagA14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030315 end');
    })

    /**
     * @tc.name   testKeyAdd030316
     * @tc.number SUB_ASSET_KEYADD_0316
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030316', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030316 begin');
      await removeAssetPromise('uAdd030015', '');
      await addAssetPromise('uAdd030015', '中文密码', 'tagA15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030316 end');
    })

    /**
     * @tc.name   testKeyAdd030317
     * @tc.number SUB_ASSET_KEYADD_0317
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030317', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030317 begin');
      await removeAssetPromise('uAdd030016', '');
      await addAssetPromise('uAdd030016', 'pwd@#$%^&*()', 'tagA16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030317 end');
    })

    /**
     * @tc.name   testKeyAdd030318
     * @tc.number SUB_ASSET_KEYADD_0318
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030318', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030318 begin');
      await removeAssetPromise('uAdd030017', '');
      await addAssetPromise('uAdd030017', '12345678', 'tagA17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030318 end');
    })

    /**
     * @tc.name   testKeyAdd030319
     * @tc.number SUB_ASSET_KEYADD_0319
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030319', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030319 begin');
      await removeAssetPromise('uAdd030018', '');
      await addAssetPromise('uAdd030018', 'p1', 'tagA18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030319 end');
    })

    /**
     * @tc.name   testKeyAdd030320
     * @tc.number SUB_ASSET_KEYADD_0320
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030320', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030320 begin');
      await removeAssetPromise('uAdd030019', '');
      await addAssetPromise('uAdd030019', 'password8', 'tagA19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030320 end');
    })

    /**
     * @tc.name   testKeyAdd030321
     * @tc.number SUB_ASSET_KEYADD_0321
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030321', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030321 begin');
      await removeAssetPromise('uAdd030020', '');
      await addAssetPromise('uAdd030020', 'pwd_16_chars_123', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030321 end');
    })

    /**
     * @tc.name   testKeyAdd030322
     * @tc.number SUB_ASSET_KEYADD_0322
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030322', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030322 begin');
      await removeAssetPromise('uAdd030021', '');
      await addAssetPromise('uAdd030021', '中文密码', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030322 end');
    })

    /**
     * @tc.name   testKeyAdd030323
     * @tc.number SUB_ASSET_KEYADD_0323
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030323', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030323 begin');
      await removeAssetPromise('uAdd030022', '');
      await addAssetPromise('uAdd030022', 'pwd@#$%^&*()', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030323 end');
    })

    /**
     * @tc.name   testKeyAdd030324
     * @tc.number SUB_ASSET_KEYADD_0324
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030324', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030324 begin');
      await removeAssetPromise('uAdd030023', '');
      await addAssetPromise('uAdd030023', '12345678', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030324 end');
    })

    /**
     * @tc.name   testKeyAdd030325
     * @tc.number SUB_ASSET_KEYADD_0325
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030325', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030325 begin');
      await removeAssetPromise('uAdd030024', '');
      await addAssetPromise('uAdd030024', 'p1', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030325 end');
    })

    /**
     * @tc.name   testKeyAdd030326
     * @tc.number SUB_ASSET_KEYADD_0326
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030326', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030326 begin');
      await removeAssetPromise('uAdd030025', '');
      await addAssetPromise('uAdd030025', 'password8', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030326 end');
    })

    /**
     * @tc.name   testKeyAdd030327
     * @tc.number SUB_ASSET_KEYADD_0327
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030327', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030327 begin');
      await removeAssetPromise('uAdd030026', '');
      await addAssetPromise('uAdd030026', 'pwd_16_chars_123', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030327 end');
    })

    /**
     * @tc.name   testKeyAdd030328
     * @tc.number SUB_ASSET_KEYADD_0328
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030328', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030328 begin');
      await removeAssetPromise('uAdd030027', '');
      await addAssetPromise('uAdd030027', '中文密码', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030328 end');
    })

    /**
     * @tc.name   testKeyAdd030329
     * @tc.number SUB_ASSET_KEYADD_0329
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030329', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030329 begin');
      await removeAssetPromise('uAdd030028', '');
      await addAssetPromise('uAdd030028', 'pwd@#$%^&*()', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030329 end');
    })

    /**
     * @tc.name   testKeyAdd030330
     * @tc.number SUB_ASSET_KEYADD_0330
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030330', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030330 begin');
      await removeAssetPromise('uAdd030029', '');
      await addAssetPromise('uAdd030029', '12345678', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030330 end');
    })

    /**
     * @tc.name   testKeyAdd030331
     * @tc.number SUB_ASSET_KEYADD_0331
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030331', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030331 begin');
      await removeAssetPromise('uAdd030030', '');
      await addAssetPromise('uAdd030030', 'p1', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030331 end');
    })

    /**
     * @tc.name   testKeyAdd030332
     * @tc.number SUB_ASSET_KEYADD_0332
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030332', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030332 begin');
      await removeAssetPromise('uAdd030031', '');
      await addAssetPromise('uAdd030031', 'password8', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030332 end');
    })

    /**
     * @tc.name   testKeyAdd030333
     * @tc.number SUB_ASSET_KEYADD_0333
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030333', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030333 begin');
      await removeAssetPromise('uAdd030032', '');
      await addAssetPromise('uAdd030032', 'pwd_16_chars_123', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030333 end');
    })

    /**
     * @tc.name   testKeyAdd030334
     * @tc.number SUB_ASSET_KEYADD_0334
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030334', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030334 begin');
      await removeAssetPromise('uAdd030033', '');
      await addAssetPromise('uAdd030033', '中文密码', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030334 end');
    })

    /**
     * @tc.name   testKeyAdd030335
     * @tc.number SUB_ASSET_KEYADD_0335
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030335', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030335 begin');
      await removeAssetPromise('uAdd030034', '');
      await addAssetPromise('uAdd030034', 'pwd@#$%^&*()', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030335 end');
    })

    /**
     * @tc.name   testKeyAdd030336
     * @tc.number SUB_ASSET_KEYADD_0336
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030336', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030336 begin');
      await removeAssetPromise('uAdd030035', '');
      await addAssetPromise('uAdd030035', '12345678', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030336 end');
    })

    /**
     * @tc.name   testKeyAdd030337
     * @tc.number SUB_ASSET_KEYADD_0337
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030337', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030337 begin');
      await removeAssetPromise('uAdd030036', '');
      await addAssetPromise('uAdd030036', 'p1', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030337 end');
    })

    /**
     * @tc.name   testKeyAdd030338
     * @tc.number SUB_ASSET_KEYADD_0338
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030338', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030338 begin');
      await removeAssetPromise('uAdd030037', '');
      await addAssetPromise('uAdd030037', 'password8', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030338 end');
    })

    /**
     * @tc.name   testKeyAdd030339
     * @tc.number SUB_ASSET_KEYADD_0339
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030339', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030339 begin');
      await removeAssetPromise('uAdd030038', '');
      await addAssetPromise('uAdd030038', 'pwd_16_chars_123', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030339 end');
    })

    /**
     * @tc.name   testKeyAdd030340
     * @tc.number SUB_ASSET_KEYADD_0340
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030340', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030340 begin');
      await removeAssetPromise('uAdd030039', '');
      await addAssetPromise('uAdd030039', '中文密码', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030340 end');
    })

    /**
     * @tc.name   testKeyAdd030341
     * @tc.number SUB_ASSET_KEYADD_0341
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030341', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030341 begin');
      await removeAssetPromise('uAdd030040', '');
      await addAssetPromise('uAdd030040', 'pwd@#$%^&*()', 'x0;y0;z0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030341 end');
    })

    /**
     * @tc.name   testKeyAdd030342
     * @tc.number SUB_ASSET_KEYADD_0342
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030342', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030342 begin');
      await removeAssetPromise('uAdd030041', '');
      await addAssetPromise('uAdd030041', '12345678', 'x1;y1;z1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030342 end');
    })

    /**
     * @tc.name   testKeyAdd030343
     * @tc.number SUB_ASSET_KEYADD_0343
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030343', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030343 begin');
      await removeAssetPromise('uAdd030042', '');
      await addAssetPromise('uAdd030042', 'p1', 'x2;y2;z2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030343 end');
    })

    /**
     * @tc.name   testKeyAdd030344
     * @tc.number SUB_ASSET_KEYADD_0344
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030344', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030344 begin');
      await removeAssetPromise('uAdd030043', '');
      await addAssetPromise('uAdd030043', 'password8', 'x3;y3;z3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030344 end');
    })

    /**
     * @tc.name   testKeyAdd030345
     * @tc.number SUB_ASSET_KEYADD_0345
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030345', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030345 begin');
      await removeAssetPromise('uAdd030044', '');
      await addAssetPromise('uAdd030044', 'pwd_16_chars_123', 'x4;y4;z4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030345 end');
    })

    /**
     * @tc.name   testKeyAdd030346
     * @tc.number SUB_ASSET_KEYADD_0346
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030346', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030346 begin');
      await removeAssetPromise('uAdd030045', '');
      await addAssetPromise('uAdd030045', '中文密码', 'x5;y5;z5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030346 end');
    })

    /**
     * @tc.name   testKeyAdd030347
     * @tc.number SUB_ASSET_KEYADD_0347
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030347', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030347 begin');
      await removeAssetPromise('uAdd030046', '');
      await addAssetPromise('uAdd030046', 'pwd@#$%^&*()', 'x6;y6;z6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030347 end');
    })

    /**
     * @tc.name   testKeyAdd030348
     * @tc.number SUB_ASSET_KEYADD_0348
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030348', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030348 begin');
      await removeAssetPromise('uAdd030047', '');
      await addAssetPromise('uAdd030047', '12345678', 'x7;y7;z7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030348 end');
    })

    /**
     * @tc.name   testKeyAdd030349
     * @tc.number SUB_ASSET_KEYADD_0349
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030349', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030349 begin');
      await removeAssetPromise('uAdd030048', '');
      await addAssetPromise('uAdd030048', 'p1', 'x8;y8;z8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030349 end');
    })

    /**
     * @tc.name   testKeyAdd030350
     * @tc.number SUB_ASSET_KEYADD_0350
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030350', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030350 begin');
      await removeAssetPromise('uAdd030049', '');
      await addAssetPromise('uAdd030049', 'password8', 'x9;y9;z9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030350 end');
    })

    /**
     * @tc.name   testKeyAdd030351
     * @tc.number SUB_ASSET_KEYADD_0351
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030351', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030351 begin');
      await removeAssetPromise('uAdd030050', '');
      await addAssetPromise('uAdd030050', 'pwd_16_chars_123', 'x10;y10;z10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030351 end');
    })

    /**
     * @tc.name   testKeyAdd030352
     * @tc.number SUB_ASSET_KEYADD_0352
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030352', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030352 begin');
      await removeAssetPromise('uAdd030051', '');
      await addAssetPromise('uAdd030051', '中文密码', 'x11;y11;z11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030352 end');
    })

    /**
     * @tc.name   testKeyAdd030353
     * @tc.number SUB_ASSET_KEYADD_0353
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030353', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030353 begin');
      await removeAssetPromise('uAdd030052', '');
      await addAssetPromise('uAdd030052', 'pwd@#$%^&*()', 'x12;y12;z12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030353 end');
    })

    /**
     * @tc.name   testKeyAdd030354
     * @tc.number SUB_ASSET_KEYADD_0354
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030354', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030354 begin');
      await removeAssetPromise('uAdd030053', '');
      await addAssetPromise('uAdd030053', '12345678', 'x13;y13;z13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030354 end');
    })

    /**
     * @tc.name   testKeyAdd030355
     * @tc.number SUB_ASSET_KEYADD_0355
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030355', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030355 begin');
      await removeAssetPromise('uAdd030054', '');
      await addAssetPromise('uAdd030054', 'p1', 'x14;y14;z14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030355 end');
    })

    /**
     * @tc.name   testKeyAdd030356
     * @tc.number SUB_ASSET_KEYADD_0356
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030356', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030356 begin');
      await removeAssetPromise('uAdd030055', '');
      await addAssetPromise('uAdd030055', 'password8', 'x15;y15;z15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030356 end');
    })

    /**
     * @tc.name   testKeyAdd030357
     * @tc.number SUB_ASSET_KEYADD_0357
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030357', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030357 begin');
      await removeAssetPromise('uAdd030056', '');
      await addAssetPromise('uAdd030056', 'pwd_16_chars_123', 'x16;y16;z16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030357 end');
    })

    /**
     * @tc.name   testKeyAdd030358
     * @tc.number SUB_ASSET_KEYADD_0358
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030358', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030358 begin');
      await removeAssetPromise('uAdd030057', '');
      await addAssetPromise('uAdd030057', '中文密码', 'x17;y17;z17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030358 end');
    })

    /**
     * @tc.name   testKeyAdd030359
     * @tc.number SUB_ASSET_KEYADD_0359
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030359', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030359 begin');
      await removeAssetPromise('uAdd030058', '');
      await addAssetPromise('uAdd030058', 'pwd@#$%^&*()', 'x18;y18;z18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030359 end');
    })

    /**
     * @tc.name   testKeyAdd030360
     * @tc.number SUB_ASSET_KEYADD_0360
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030360', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030360 begin');
      await removeAssetPromise('uAdd030059', '');
      await addAssetPromise('uAdd030059', '12345678', 'x19;y19;z19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030360 end');
    })

    /**
     * @tc.name   testKeyAdd030361
     * @tc.number SUB_ASSET_KEYADD_0361
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030361', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030361 begin');
      await removeAssetPromise('uAdd030060', '');
      await addAssetPromise('uAdd030060', 'p1', 'a0;b0;c0;d0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030361 end');
    })

    /**
     * @tc.name   testKeyAdd030362
     * @tc.number SUB_ASSET_KEYADD_0362
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030362', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030362 begin');
      await removeAssetPromise('uAdd030061', '');
      await addAssetPromise('uAdd030061', 'password8', 'a1;b1;c1;d1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030362 end');
    })

    /**
     * @tc.name   testKeyAdd030363
     * @tc.number SUB_ASSET_KEYADD_0363
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030363', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030363 begin');
      await removeAssetPromise('uAdd030062', '');
      await addAssetPromise('uAdd030062', 'pwd_16_chars_123', 'a2;b2;c2;d2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030363 end');
    })

    /**
     * @tc.name   testKeyAdd030364
     * @tc.number SUB_ASSET_KEYADD_0364
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030364', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030364 begin');
      await removeAssetPromise('uAdd030063', '');
      await addAssetPromise('uAdd030063', '中文密码', 'a3;b3;c3;d3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030364 end');
    })

    /**
     * @tc.name   testKeyAdd030365
     * @tc.number SUB_ASSET_KEYADD_0365
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030365', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030365 begin');
      await removeAssetPromise('uAdd030064', '');
      await addAssetPromise('uAdd030064', 'pwd@#$%^&*()', 'a4;b4;c4;d4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030365 end');
    })

    /**
     * @tc.name   testKeyAdd030366
     * @tc.number SUB_ASSET_KEYADD_0366
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030366', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030366 begin');
      await removeAssetPromise('uAdd030065', '');
      await addAssetPromise('uAdd030065', '12345678', 'a5;b5;c5;d5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030366 end');
    })

    /**
     * @tc.name   testKeyAdd030367
     * @tc.number SUB_ASSET_KEYADD_0367
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030367', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030367 begin');
      await removeAssetPromise('uAdd030066', '');
      await addAssetPromise('uAdd030066', 'p1', 'a6;b6;c6;d6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030367 end');
    })

    /**
     * @tc.name   testKeyAdd030368
     * @tc.number SUB_ASSET_KEYADD_0368
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030368', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030368 begin');
      await removeAssetPromise('uAdd030067', '');
      await addAssetPromise('uAdd030067', 'password8', 'a7;b7;c7;d7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030368 end');
    })

    /**
     * @tc.name   testKeyAdd030369
     * @tc.number SUB_ASSET_KEYADD_0369
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030369', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030369 begin');
      await removeAssetPromise('uAdd030068', '');
      await addAssetPromise('uAdd030068', 'pwd_16_chars_123', 'a8;b8;c8;j8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030369 end');
    })

    /**
     * @tc.name   testKeyAdd030370
     * @tc.number SUB_ASSET_KEYADD_0370
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030370', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030370 begin');
      await removeAssetPromise('uAdd030069', '');
      await addAssetPromise('uAdd030069', '中文密码', 'a9;b9;c9;d9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030370 end');
    })

    /**
     * @tc.name   testKeyAdd030371
     * @tc.number SUB_ASSET_KEYADD_0371
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030371', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030371 begin');
      await removeAssetPromise('uAdd030070', '');
      await addAssetPromise('uAdd030070', 'pwd@#$%^&*()', 'a10;b10;c10;d10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030371 end');
    })

    /**
     * @tc.name   testKeyAdd030372
     * @tc.number SUB_ASSET_KEYADD_0372
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030372', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030372 begin');
      await removeAssetPromise('uAdd030071', '');
      await addAssetPromise('uAdd030071', '12345678', 'a11;b11;c11;d11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030372 end');
    })

    /**
     * @tc.name   testKeyAdd030373
     * @tc.number SUB_ASSET_KEYADD_0373
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030373', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030373 begin');
      await removeAssetPromise('uAdd030072', '');
      await addAssetPromise('uAdd030072', 'p1', 'a12;b12;c12;d12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030373 end');
    })

    /**
     * @tc.name   testKeyAdd030374
     * @tc.number SUB_ASSET_KEYADD_0374
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030374', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030374 begin');
      await removeAssetPromise('uAdd030073', '');
      await addAssetPromise('uAdd030073', 'password8', 'a13;b13;c13;d13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030374 end');
    })

    /**
     * @tc.name   testKeyAdd030375
     * @tc.number SUB_ASSET_KEYADD_0375
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030375', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030375 begin');
      await removeAssetPromise('uAdd030074', '');
      await addAssetPromise('uAdd030074', 'pwd_16_chars_123', 'a14;b14;c14;d14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030375 end');
    })

    /**
     * @tc.name   testKeyAdd030376
     * @tc.number SUB_ASSET_KEYADD_0376
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030376', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030376 begin');
      await removeAssetPromise('uAdd030075', '');
      await addAssetPromise('uAdd030075', '中文密码', 'a15;b15;c15;d15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030376 end');
    })

    /**
     * @tc.name   testKeyAdd030377
     * @tc.number SUB_ASSET_KEYADD_0377
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030377', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030377 begin');
      await removeAssetPromise('uAdd030076', '');
      await addAssetPromise('uAdd030076', 'pwd@#$%^&*()', 'a16;b16;c16;d16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030377 end');
    })

    /**
     * @tc.name   testKeyAdd030378
     * @tc.number SUB_ASSET_KEYADD_0378
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030378', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030378 begin');
      await removeAssetPromise('uAdd030077', '');
      await addAssetPromise('uAdd030077', '12345678', 'a17;b17;c17;d17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030378 end');
    })

    /**
     * @tc.name   testKeyAdd030379
     * @tc.number SUB_ASSET_KEYADD_0379
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030379', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030379 begin');
      await removeAssetPromise('uAdd030078', '');
      await addAssetPromise('uAdd030078', 'p1', 'a18;b18;c18;d18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030379 end');
    })

    /**
     * @tc.name   testKeyAdd030380
     * @tc.number SUB_ASSET_KEYADD_0380
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030380', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030380 begin');
      await removeAssetPromise('uAdd030079', '');
      await addAssetPromise('uAdd030079', 'password8', 'a19;b19;c19;d19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030380 end');
    })

    /**
     * @tc.name   testKeyAdd030381
     * @tc.number SUB_ASSET_KEYADD_0381
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030381', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030381 begin');
      await removeAssetPromise('uAdd030080', '');
      await addAssetPromise('uAdd030080', 'pwd_16_chars_123', 'a0;b0;c0;d0;e0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030381 end');
    })

    /**
     * @tc.name   testKeyAdd030382
     * @tc.number SUB_ASSET_KEYADD_0382
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030382', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030382 begin');
      await removeAssetPromise('uAdd030081', '');
      await addAssetPromise('uAdd030081', '中文密码', 'a1;b1;c1;d1;e1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030382 end');
    })

    /**
     * @tc.name   testKeyAdd030383
     * @tc.number SUB_ASSET_KEYADD_0383
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030383', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030383 begin');
      await removeAssetPromise('uAdd030082', '');
      await addAssetPromise('uAdd030082', 'pwd@#$%^&*()', 'a2;b2;c2;d2;e2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030383 end');
    })

    /**
     * @tc.name   testKeyAdd030384
     * @tc.number SUB_ASSET_KEYADD_0384
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030384', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030384 begin');
      await removeAssetPromise('uAdd030083', '');
      await addAssetPromise('uAdd030083', '12345678', 'a3;b3;c3;d3;e3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030384 end');
    })

    /**
     * @tc.name   testKeyAdd030385
     * @tc.number SUB_ASSET_KEYADD_0385
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030385', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030385 begin');
      await removeAssetPromise('uAdd030084', '');
      await addAssetPromise('uAdd030084', 'p1', 'a4;b4;c4;d4;e4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030385 end');
    })

    /**
     * @tc.name   testKeyAdd030386
     * @tc.number SUB_ASSET_KEYADD_0386
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030386', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030386 begin');
      await removeAssetPromise('uAdd030085', '');
      await addAssetPromise('uAdd030085', 'password8', 'a5;b5;c5;d5;e5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030386 end');
    })

    /**
     * @tc.name   testKeyAdd030387
     * @tc.number SUB_ASSET_KEYADD_0387
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030387', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030387 begin');
      await removeAssetPromise('uAdd030086', '');
      await addAssetPromise('uAdd030086', 'pwd_16_chars_123', 'a6;b6;c6;d6;e6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030387 end');
    })

    /**
     * @tc.name   testKeyAdd030388
     * @tc.number SUB_ASSET_KEYADD_0388
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030388', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030388 begin');
      await removeAssetPromise('uAdd030087', '');
      await addAssetPromise('uAdd030087', '中文密码', 'a7;b7;c7;d7;e7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030388 end');
    })

    /**
     * @tc.name   testKeyAdd030389
     * @tc.number SUB_ASSET_KEYADD_0389
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030389', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030389 begin');
      await removeAssetPromise('uAdd030088', '');
      await addAssetPromise('uAdd030088', 'pwd@#$%^&*()', 'a8;b8;c8;j8;e8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030389 end');
    })

    /**
     * @tc.name   testKeyAdd030390
     * @tc.number SUB_ASSET_KEYADD_0390
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030390', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030390 begin');
      await removeAssetPromise('uAdd030089', '');
      await addAssetPromise('uAdd030089', '12345678', 'a9;b9;c9;d9;e9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030390 end');
    })

    /**
     * @tc.name   testKeyAdd030391
     * @tc.number SUB_ASSET_KEYADD_0391
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030391', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030391 begin');
      await removeAssetPromise('uAdd030090', '');
      await addAssetPromise('uAdd030090', 'p1', 'a10;b10;c10;d10;e10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030391 end');
    })

    /**
     * @tc.name   testKeyAdd030392
     * @tc.number SUB_ASSET_KEYADD_0392
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030392', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030392 begin');
      await removeAssetPromise('uAdd030091', '');
      await addAssetPromise('uAdd030091', 'password8', 'a11;b11;c11;d11;e11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030392 end');
    })

    /**
     * @tc.name   testKeyAdd030393
     * @tc.number SUB_ASSET_KEYADD_0393
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030393', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030393 begin');
      await removeAssetPromise('uAdd030092', '');
      await addAssetPromise('uAdd030092', 'pwd_16_chars_123', 'a12;b12;c12;d12;e12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030393 end');
    })

    /**
     * @tc.name   testKeyAdd030394
     * @tc.number SUB_ASSET_KEYADD_0394
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030394', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030394 begin');
      await removeAssetPromise('uAdd030093', '');
      await addAssetPromise('uAdd030093', '中文密码', 'a13;b13;c13;d13;e13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030394 end');
    })

    /**
     * @tc.name   testKeyAdd030395
     * @tc.number SUB_ASSET_KEYADD_0395
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030395', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030395 begin');
      await removeAssetPromise('uAdd030094', '');
      await addAssetPromise('uAdd030094', 'pwd@#$%^&*()', 'a14;b14;c14;d14;e14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030395 end');
    })

    /**
     * @tc.name   testKeyAdd030396
     * @tc.number SUB_ASSET_KEYADD_0396
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030396', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030396 begin');
      await removeAssetPromise('uAdd030095', '');
      await addAssetPromise('uAdd030095', '12345678', 'a15;b15;c15;d15;e15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030396 end');
    })

    /**
     * @tc.name   testKeyAdd030397
     * @tc.number SUB_ASSET_KEYADD_0397
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030397', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030397 begin');
      await removeAssetPromise('uAdd030096', '');
      await addAssetPromise('uAdd030096', 'p1', 'a16;b16;c16;d16;e16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030397 end');
    })

    /**
     * @tc.name   testKeyAdd030398
     * @tc.number SUB_ASSET_KEYADD_0398
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030398', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030398 begin');
      await removeAssetPromise('uAdd030097', '');
      await addAssetPromise('uAdd030097', 'password8', 'a17;b17;c17;d17;e17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030398 end');
    })

    /**
     * @tc.name   testKeyAdd030399
     * @tc.number SUB_ASSET_KEYADD_0399
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030399', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030399 begin');
      await removeAssetPromise('uAdd030098', '');
      await addAssetPromise('uAdd030098', 'pwd_16_chars_123', 'a18;b18;c18;d18;e18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030399 end');
    })

    /**
     * @tc.name   testKeyAdd030400
     * @tc.number SUB_ASSET_KEYADD_0400
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030400 begin');
      await removeAssetPromise('uAdd030099', '');
      await addAssetPromise('uAdd030099', '中文密码', 'a19;b19;c19;d19;e19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030400 end');
    })

    /**
     * @tc.name   testKeyAdd030401
     * @tc.number SUB_ASSET_KEYADD_0401
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030401 begin');
      await removeAssetPromise('uAdd030100', '');
      await addAssetPromise('uAdd030100', 'pwd@#$%^&*()', 'a0;b0;c0;d0;e0;f0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030401 end');
    })

    /**
     * @tc.name   testKeyAdd030402
     * @tc.number SUB_ASSET_KEYADD_0402
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030402', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030402 begin');
      await removeAssetPromise('uAdd030101', '');
      await addAssetPromise('uAdd030101', '12345678', 'a1;b1;c1;d1;e1;f1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030402 end');
    })

    /**
     * @tc.name   testKeyAdd030403
     * @tc.number SUB_ASSET_KEYADD_0403
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030403', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030403 begin');
      await removeAssetPromise('uAdd030102', '');
      await addAssetPromise('uAdd030102', 'p1', 'a2;b2;c2;d2;e2;f2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030403 end');
    })

    /**
     * @tc.name   testKeyAdd030404
     * @tc.number SUB_ASSET_KEYADD_0404
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030404', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030404 begin');
      await removeAssetPromise('uAdd030103', '');
      await addAssetPromise('uAdd030103', 'password8', 'a3;b3;c3;d3;e3;f3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030404 end');
    })

    /**
     * @tc.name   testKeyAdd030405
     * @tc.number SUB_ASSET_KEYADD_0405
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030405', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030405 begin');
      await removeAssetPromise('uAdd030104', '');
      await addAssetPromise('uAdd030104', 'pwd_16_chars_123', 'a4;b4;c4;d4;e4;f4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030405 end');
    })

    /**
     * @tc.name   testKeyAdd030406
     * @tc.number SUB_ASSET_KEYADD_0406
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030406', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030406 begin');
      await removeAssetPromise('uAdd030105', '');
      await addAssetPromise('uAdd030105', '中文密码', 'a5;b5;c5;d5;e5;f5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030406 end');
    })

    /**
     * @tc.name   testKeyAdd030407
     * @tc.number SUB_ASSET_KEYADD_0407
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030407', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030407 begin');
      await removeAssetPromise('uAdd030106', '');
      await addAssetPromise('uAdd030106', 'pwd@#$%^&*()', 'a6;b6;c6;d6;e6;f6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030407 end');
    })

    /**
     * @tc.name   testKeyAdd030408
     * @tc.number SUB_ASSET_KEYADD_0408
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030408', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030408 begin');
      await removeAssetPromise('uAdd030107', '');
      await addAssetPromise('uAdd030107', '12345678', 'a7;b7;c7;d7;e7;f7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030408 end');
    })

    /**
     * @tc.name   testKeyAdd030409
     * @tc.number SUB_ASSET_KEYADD_0409
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030409', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030409 begin');
      await removeAssetPromise('uAdd030108', '');
      await addAssetPromise('uAdd030108', 'p1', 'a8;b8;c8;j8;e8;f8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030409 end');
    })

    /**
     * @tc.name   testKeyAdd030410
     * @tc.number SUB_ASSET_KEYADD_0410
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030410', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030410 begin');
      await removeAssetPromise('uAdd030109', '');
      await addAssetPromise('uAdd030109', 'password8', 'a9;b9;c9;d9;e9;f9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd030109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030410 end');
    })

    /**
     * @tc.name   testKeyAdd030411
     * @tc.number SUB_ASSET_KEYADD_0411
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030411', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030411 begin');
      await removeAssetPromise('uAdd030110', '');
      await addAssetPromise('uAdd030110', 'pwd_16_chars_123', 'dup0;dup0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030411 end');
    })

    /**
     * @tc.name   testKeyAdd030412
     * @tc.number SUB_ASSET_KEYADD_0412
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030412', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030412 begin');
      await removeAssetPromise('uAdd030111', '');
      await addAssetPromise('uAdd030111', '中文密码', 'dup1;dup1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030412 end');
    })

    /**
     * @tc.name   testKeyAdd030413
     * @tc.number SUB_ASSET_KEYADD_0413
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030413', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030413 begin');
      await removeAssetPromise('uAdd030112', '');
      await addAssetPromise('uAdd030112', 'pwd@#$%^&*()', 'dup2;dup2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030413 end');
    })

    /**
     * @tc.name   testKeyAdd030414
     * @tc.number SUB_ASSET_KEYADD_0414
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030414', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030414 begin');
      await removeAssetPromise('uAdd030113', '');
      await addAssetPromise('uAdd030113', '12345678', 'dup3;dup3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030414 end');
    })

    /**
     * @tc.name   testKeyAdd030415
     * @tc.number SUB_ASSET_KEYADD_0415
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030415', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030415 begin');
      await removeAssetPromise('uAdd030114', '');
      await addAssetPromise('uAdd030114', 'p1', 'dup4;dup4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030415 end');
    })

    /**
     * @tc.name   testKeyAdd030416
     * @tc.number SUB_ASSET_KEYADD_0416
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030416', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030416 begin');
      await removeAssetPromise('uAdd030115', '');
      await addAssetPromise('uAdd030115', 'password8', 'dup5;dup5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030416 end');
    })

    /**
     * @tc.name   testKeyAdd030417
     * @tc.number SUB_ASSET_KEYADD_0417
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030417', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030417 begin');
      await removeAssetPromise('uAdd030116', '');
      await addAssetPromise('uAdd030116', 'pwd_16_chars_123', 'dup6;dup6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030417 end');
    })

    /**
     * @tc.name   testKeyAdd030418
     * @tc.number SUB_ASSET_KEYADD_0418
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030418', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030418 begin');
      await removeAssetPromise('uAdd030117', '');
      await addAssetPromise('uAdd030117', '中文密码', 'dup7;dup7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030418 end');
    })

    /**
     * @tc.name   testKeyAdd030419
     * @tc.number SUB_ASSET_KEYADD_0419
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030419', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030419 begin');
      await removeAssetPromise('uAdd030118', '');
      await addAssetPromise('uAdd030118', 'pwd@#$%^&*()', 'dup8;dup8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030419 end');
    })

    /**
     * @tc.name   testKeyAdd030420
     * @tc.number SUB_ASSET_KEYADD_0420
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030420', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030420 begin');
      await removeAssetPromise('uAdd030119', '');
      await addAssetPromise('uAdd030119', '12345678', 'dup9;dup9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030420 end');
    })

    /**
     * @tc.name   testKeyAdd030421
     * @tc.number SUB_ASSET_KEYADD_0421
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030421', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030421 begin');
      await removeAssetPromise('uAdd030120', '');
      await addAssetPromise('uAdd030120', 'p1', 'dup10;dup10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030421 end');
    })

    /**
     * @tc.name   testKeyAdd030422
     * @tc.number SUB_ASSET_KEYADD_0422
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030422', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030422 begin');
      await removeAssetPromise('uAdd030121', '');
      await addAssetPromise('uAdd030121', 'password8', 'dup11;dup11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030422 end');
    })

    /**
     * @tc.name   testKeyAdd030423
     * @tc.number SUB_ASSET_KEYADD_0423
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030423', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030423 begin');
      await removeAssetPromise('uAdd030122', '');
      await addAssetPromise('uAdd030122', 'pwd_16_chars_123', 'dup12;dup12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030423 end');
    })

    /**
     * @tc.name   testKeyAdd030424
     * @tc.number SUB_ASSET_KEYADD_0424
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030424', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030424 begin');
      await removeAssetPromise('uAdd030123', '');
      await addAssetPromise('uAdd030123', '中文密码', 'dup13;dup13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030424 end');
    })

    /**
     * @tc.name   testKeyAdd030425
     * @tc.number SUB_ASSET_KEYADD_0425
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030425', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030425 begin');
      await removeAssetPromise('uAdd030124', '');
      await addAssetPromise('uAdd030124', 'pwd@#$%^&*()', 'dup14;dup14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030425 end');
    })

    /**
     * @tc.name   testKeyAdd030426
     * @tc.number SUB_ASSET_KEYADD_0426
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030426', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030426 begin');
      await removeAssetPromise('uAdd030125', '');
      await addAssetPromise('uAdd030125', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030426 end');
    })

    /**
     * @tc.name   testKeyAdd030427
     * @tc.number SUB_ASSET_KEYADD_0427
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030427', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030427 begin');
      await removeAssetPromise('uAdd030126', '');
      await addAssetPromise('uAdd030126', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030427 end');
    })

    /**
     * @tc.name   testKeyAdd030428
     * @tc.number SUB_ASSET_KEYADD_0428
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030428', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030428 begin');
      await removeAssetPromise('uAdd030127', '');
      await addAssetPromise('uAdd030127', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030428 end');
    })

    /**
     * @tc.name   testKeyAdd030429
     * @tc.number SUB_ASSET_KEYADD_0429
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030429', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030429 begin');
      await removeAssetPromise('uAdd030128', '');
      await addAssetPromise('uAdd030128', 'pwd_16_chars_123', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030429 end');
    })

    /**
     * @tc.name   testKeyAdd030430
     * @tc.number SUB_ASSET_KEYADD_0430
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030430', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030430 begin');
      await removeAssetPromise('uAdd030129', '');
      await addAssetPromise('uAdd030129', '中文密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030430 end');
    })

    /**
     * @tc.name   testKeyAdd030431
     * @tc.number SUB_ASSET_KEYADD_0431
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030431', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030431 begin');
      await removeAssetPromise('uAdd030130', '');
      await addAssetPromise('uAdd030130', 'pwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030431 end');
    })

    /**
     * @tc.name   testKeyAdd030432
     * @tc.number SUB_ASSET_KEYADD_0432
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030432', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030432 begin');
      await removeAssetPromise('uAdd030131', '');
      await addAssetPromise('uAdd030131', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030432 end');
    })

    /**
     * @tc.name   testKeyAdd030433
     * @tc.number SUB_ASSET_KEYADD_0433
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030433', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030433 begin');
      await removeAssetPromise('uAdd030132', '');
      await addAssetPromise('uAdd030132', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030433 end');
    })

    /**
     * @tc.name   testKeyAdd030434
     * @tc.number SUB_ASSET_KEYADD_0434
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030434', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030434 begin');
      await removeAssetPromise('uAdd030133', '');
      await addAssetPromise('uAdd030133', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030434 end');
    })

    /**
     * @tc.name   testKeyAdd030435
     * @tc.number SUB_ASSET_KEYADD_0435
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030435', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030435 begin');
      await removeAssetPromise('uAdd030134', '');
      await addAssetPromise('uAdd030134', 'pwd_16_chars_123', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030435 end');
    })

    /**
     * @tc.name   testKeyAdd030436
     * @tc.number SUB_ASSET_KEYADD_0436
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030436', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030436 begin');
      await removeAssetPromise('uAdd030135', '');
      await addAssetPromise('uAdd030135', '中文密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030436 end');
    })

    /**
     * @tc.name   testKeyAdd030437
     * @tc.number SUB_ASSET_KEYADD_0437
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030437', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030437 begin');
      await removeAssetPromise('uAdd030136', '');
      await addAssetPromise('uAdd030136', 'pwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030437 end');
    })

    /**
     * @tc.name   testKeyAdd030438
     * @tc.number SUB_ASSET_KEYADD_0438
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030438', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030438 begin');
      await removeAssetPromise('uAdd030137', '');
      await addAssetPromise('uAdd030137', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030438 end');
    })

    /**
     * @tc.name   testKeyAdd030439
     * @tc.number SUB_ASSET_KEYADD_0439
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030439', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030439 begin');
      await removeAssetPromise('uAdd030138', '');
      await addAssetPromise('uAdd030138', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030439 end');
    })

    /**
     * @tc.name   testKeyAdd030440
     * @tc.number SUB_ASSET_KEYADD_0440
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030440', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030440 begin');
      await removeAssetPromise('uAdd030139', '');
      await addAssetPromise('uAdd030139', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030440 end');
    })

    /**
     * @tc.name   testKeyAdd030441
     * @tc.number SUB_ASSET_KEYADD_0441
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030441', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030441 begin');
      await removeAssetPromise('uAdd030140', '');
      await addAssetPromise('uAdd030140', 'pwd_16_chars_123', 'a0;;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030441 end');
    })

    /**
     * @tc.name   testKeyAdd030442
     * @tc.number SUB_ASSET_KEYADD_0442
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030442', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030442 begin');
      await removeAssetPromise('uAdd030141', '');
      await addAssetPromise('uAdd030141', '中文密码', 'a1;;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030442 end');
    })

    /**
     * @tc.name   testKeyAdd030443
     * @tc.number SUB_ASSET_KEYADD_0443
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030443', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030443 begin');
      await removeAssetPromise('uAdd030142', '');
      await addAssetPromise('uAdd030142', 'pwd@#$%^&*()', 'a2;;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030443 end');
    })

    /**
     * @tc.name   testKeyAdd030444
     * @tc.number SUB_ASSET_KEYADD_0444
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030444', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030444 begin');
      await removeAssetPromise('uAdd030143', '');
      await addAssetPromise('uAdd030143', '12345678', 'a3;;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030444 end');
    })

    /**
     * @tc.name   testKeyAdd030445
     * @tc.number SUB_ASSET_KEYADD_0445
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030445', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030445 begin');
      await removeAssetPromise('uAdd030144', '');
      await addAssetPromise('uAdd030144', 'p1', 'a4;;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030445 end');
    })

    /**
     * @tc.name   testKeyAdd030446
     * @tc.number SUB_ASSET_KEYADD_0446
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030446', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030446 begin');
      await removeAssetPromise('uAdd030145', '');
      await addAssetPromise('uAdd030145', 'password8', 'a5;;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030446 end');
    })

    /**
     * @tc.name   testKeyAdd030447
     * @tc.number SUB_ASSET_KEYADD_0447
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030447', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030447 begin');
      await removeAssetPromise('uAdd030146', '');
      await addAssetPromise('uAdd030146', 'pwd_16_chars_123', 'a6;;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030447 end');
    })

    /**
     * @tc.name   testKeyAdd030448
     * @tc.number SUB_ASSET_KEYADD_0448
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030448', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030448 begin');
      await removeAssetPromise('uAdd030147', '');
      await addAssetPromise('uAdd030147', '中文密码', 'a7;;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030448 end');
    })

    /**
     * @tc.name   testKeyAdd030449
     * @tc.number SUB_ASSET_KEYADD_0449
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030449', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030449 begin');
      await removeAssetPromise('uAdd030148', '');
      await addAssetPromise('uAdd030148', 'pwd@#$%^&*()', 'a8;;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030449 end');
    })

    /**
     * @tc.name   testKeyAdd030450
     * @tc.number SUB_ASSET_KEYADD_0450
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd030450', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030450 begin');
      await removeAssetPromise('uAdd030149', '');
      await addAssetPromise('uAdd030149', '12345678', 'a9;;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd030149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd030149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd030450 end');
    })

  })
}
