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

export default function keyAddVolume01() {
  describe('KeyAddVolume01Test', () => {

    /**
     * @tc.name   testKeyAdd010001
     * @tc.number SUB_ASSET_KEYADD_0001
     * @tc.desc   addAssetPromise 保存后按账号查询回读 secret 与 label 一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010001 begin');
      const alias: string = 'uAddAnchor01';
      const secret: string = 'anchorSecret';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, secret, 'anchorLabel');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual(secret);
      expect(rows[0].get('label')).assertEqual('anchorLabel');
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010001 end');
    })

    /**
     * @tc.name   testKeyAdd010002
     * @tc.number SUB_ASSET_KEYADD_0002
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010002 begin');
      await removeAssetPromise('uAdd010001', '');
      await addAssetPromise('uAdd010001', 'password8', 'tagA1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010002 end');
    })

    /**
     * @tc.name   testKeyAdd010003
     * @tc.number SUB_ASSET_KEYADD_0003
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010003 begin');
      await removeAssetPromise('uAdd010002', '');
      await addAssetPromise('uAdd010002', 'pwd_16_chars_123', 'tagA2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010003 end');
    })

    /**
     * @tc.name   testKeyAdd010004
     * @tc.number SUB_ASSET_KEYADD_0004
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010004 begin');
      await removeAssetPromise('uAdd010003', '');
      await addAssetPromise('uAdd010003', '中文密码', 'tagA3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010004 end');
    })

    /**
     * @tc.name   testKeyAdd010005
     * @tc.number SUB_ASSET_KEYADD_0005
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010005 begin');
      await removeAssetPromise('uAdd010004', '');
      await addAssetPromise('uAdd010004', 'pwd@#$%^&*()', 'tagA4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010005 end');
    })

    /**
     * @tc.name   testKeyAdd010006
     * @tc.number SUB_ASSET_KEYADD_0006
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010006 begin');
      await removeAssetPromise('uAdd010005', '');
      await addAssetPromise('uAdd010005', '12345678', 'tagA5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010006 end');
    })

    /**
     * @tc.name   testKeyAdd010007
     * @tc.number SUB_ASSET_KEYADD_0007
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010007 begin');
      await removeAssetPromise('uAdd010006', '');
      await addAssetPromise('uAdd010006', 'p1', 'tagA6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010007 end');
    })

    /**
     * @tc.name   testKeyAdd010008
     * @tc.number SUB_ASSET_KEYADD_0008
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010008 begin');
      await removeAssetPromise('uAdd010007', '');
      await addAssetPromise('uAdd010007', 'password8', 'tagA7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010008 end');
    })

    /**
     * @tc.name   testKeyAdd010009
     * @tc.number SUB_ASSET_KEYADD_0009
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010009 begin');
      await removeAssetPromise('uAdd010008', '');
      await addAssetPromise('uAdd010008', 'pwd_16_chars_123', 'tagA8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010009 end');
    })

    /**
     * @tc.name   testKeyAdd010010
     * @tc.number SUB_ASSET_KEYADD_0010
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010010 begin');
      await removeAssetPromise('uAdd010009', '');
      await addAssetPromise('uAdd010009', '中文密码', 'tagA9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010010 end');
    })

    /**
     * @tc.name   testKeyAdd010011
     * @tc.number SUB_ASSET_KEYADD_0011
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010011 begin');
      await removeAssetPromise('uAdd010010', '');
      await addAssetPromise('uAdd010010', 'pwd@#$%^&*()', 'tagA10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010011 end');
    })

    /**
     * @tc.name   testKeyAdd010012
     * @tc.number SUB_ASSET_KEYADD_0012
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010012 begin');
      await removeAssetPromise('uAdd010011', '');
      await addAssetPromise('uAdd010011', '12345678', 'tagA11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010012 end');
    })

    /**
     * @tc.name   testKeyAdd010013
     * @tc.number SUB_ASSET_KEYADD_0013
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010013 begin');
      await removeAssetPromise('uAdd010012', '');
      await addAssetPromise('uAdd010012', 'p1', 'tagA12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010013 end');
    })

    /**
     * @tc.name   testKeyAdd010014
     * @tc.number SUB_ASSET_KEYADD_0014
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010014 begin');
      await removeAssetPromise('uAdd010013', '');
      await addAssetPromise('uAdd010013', 'password8', 'tagA13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010014 end');
    })

    /**
     * @tc.name   testKeyAdd010015
     * @tc.number SUB_ASSET_KEYADD_0015
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010015 begin');
      await removeAssetPromise('uAdd010014', '');
      await addAssetPromise('uAdd010014', 'pwd_16_chars_123', 'tagA14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010015 end');
    })

    /**
     * @tc.name   testKeyAdd010016
     * @tc.number SUB_ASSET_KEYADD_0016
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010016 begin');
      await removeAssetPromise('uAdd010015', '');
      await addAssetPromise('uAdd010015', '中文密码', 'tagA15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010016 end');
    })

    /**
     * @tc.name   testKeyAdd010017
     * @tc.number SUB_ASSET_KEYADD_0017
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010017 begin');
      await removeAssetPromise('uAdd010016', '');
      await addAssetPromise('uAdd010016', 'pwd@#$%^&*()', 'tagA16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010017 end');
    })

    /**
     * @tc.name   testKeyAdd010018
     * @tc.number SUB_ASSET_KEYADD_0018
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010018 begin');
      await removeAssetPromise('uAdd010017', '');
      await addAssetPromise('uAdd010017', '12345678', 'tagA17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010018 end');
    })

    /**
     * @tc.name   testKeyAdd010019
     * @tc.number SUB_ASSET_KEYADD_0019
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010019 begin');
      await removeAssetPromise('uAdd010018', '');
      await addAssetPromise('uAdd010018', 'p1', 'tagA18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010019 end');
    })

    /**
     * @tc.name   testKeyAdd010020
     * @tc.number SUB_ASSET_KEYADD_0020
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010020 begin');
      await removeAssetPromise('uAdd010019', '');
      await addAssetPromise('uAdd010019', 'password8', 'tagA19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010020 end');
    })

    /**
     * @tc.name   testKeyAdd010021
     * @tc.number SUB_ASSET_KEYADD_0021
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010021 begin');
      await removeAssetPromise('uAdd010020', '');
      await addAssetPromise('uAdd010020', 'pwd_16_chars_123', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010021 end');
    })

    /**
     * @tc.name   testKeyAdd010022
     * @tc.number SUB_ASSET_KEYADD_0022
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010022 begin');
      await removeAssetPromise('uAdd010021', '');
      await addAssetPromise('uAdd010021', '中文密码', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010022 end');
    })

    /**
     * @tc.name   testKeyAdd010023
     * @tc.number SUB_ASSET_KEYADD_0023
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010023 begin');
      await removeAssetPromise('uAdd010022', '');
      await addAssetPromise('uAdd010022', 'pwd@#$%^&*()', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010023 end');
    })

    /**
     * @tc.name   testKeyAdd010024
     * @tc.number SUB_ASSET_KEYADD_0024
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010024 begin');
      await removeAssetPromise('uAdd010023', '');
      await addAssetPromise('uAdd010023', '12345678', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010024 end');
    })

    /**
     * @tc.name   testKeyAdd010025
     * @tc.number SUB_ASSET_KEYADD_0025
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010025 begin');
      await removeAssetPromise('uAdd010024', '');
      await addAssetPromise('uAdd010024', 'p1', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010025 end');
    })

    /**
     * @tc.name   testKeyAdd010026
     * @tc.number SUB_ASSET_KEYADD_0026
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010026 begin');
      await removeAssetPromise('uAdd010025', '');
      await addAssetPromise('uAdd010025', 'password8', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010026 end');
    })

    /**
     * @tc.name   testKeyAdd010027
     * @tc.number SUB_ASSET_KEYADD_0027
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010027 begin');
      await removeAssetPromise('uAdd010026', '');
      await addAssetPromise('uAdd010026', 'pwd_16_chars_123', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010027 end');
    })

    /**
     * @tc.name   testKeyAdd010028
     * @tc.number SUB_ASSET_KEYADD_0028
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010028 begin');
      await removeAssetPromise('uAdd010027', '');
      await addAssetPromise('uAdd010027', '中文密码', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010028 end');
    })

    /**
     * @tc.name   testKeyAdd010029
     * @tc.number SUB_ASSET_KEYADD_0029
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010029 begin');
      await removeAssetPromise('uAdd010028', '');
      await addAssetPromise('uAdd010028', 'pwd@#$%^&*()', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010029 end');
    })

    /**
     * @tc.name   testKeyAdd010030
     * @tc.number SUB_ASSET_KEYADD_0030
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010030 begin');
      await removeAssetPromise('uAdd010029', '');
      await addAssetPromise('uAdd010029', '12345678', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010030 end');
    })

    /**
     * @tc.name   testKeyAdd010031
     * @tc.number SUB_ASSET_KEYADD_0031
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010031 begin');
      await removeAssetPromise('uAdd010030', '');
      await addAssetPromise('uAdd010030', 'p1', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010031 end');
    })

    /**
     * @tc.name   testKeyAdd010032
     * @tc.number SUB_ASSET_KEYADD_0032
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010032 begin');
      await removeAssetPromise('uAdd010031', '');
      await addAssetPromise('uAdd010031', 'password8', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010032 end');
    })

    /**
     * @tc.name   testKeyAdd010033
     * @tc.number SUB_ASSET_KEYADD_0033
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010033 begin');
      await removeAssetPromise('uAdd010032', '');
      await addAssetPromise('uAdd010032', 'pwd_16_chars_123', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010033 end');
    })

    /**
     * @tc.name   testKeyAdd010034
     * @tc.number SUB_ASSET_KEYADD_0034
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010034 begin');
      await removeAssetPromise('uAdd010033', '');
      await addAssetPromise('uAdd010033', '中文密码', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010034 end');
    })

    /**
     * @tc.name   testKeyAdd010035
     * @tc.number SUB_ASSET_KEYADD_0035
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010035 begin');
      await removeAssetPromise('uAdd010034', '');
      await addAssetPromise('uAdd010034', 'pwd@#$%^&*()', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010035 end');
    })

    /**
     * @tc.name   testKeyAdd010036
     * @tc.number SUB_ASSET_KEYADD_0036
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010036 begin');
      await removeAssetPromise('uAdd010035', '');
      await addAssetPromise('uAdd010035', '12345678', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010036 end');
    })

    /**
     * @tc.name   testKeyAdd010037
     * @tc.number SUB_ASSET_KEYADD_0037
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010037 begin');
      await removeAssetPromise('uAdd010036', '');
      await addAssetPromise('uAdd010036', 'p1', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010037 end');
    })

    /**
     * @tc.name   testKeyAdd010038
     * @tc.number SUB_ASSET_KEYADD_0038
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010038 begin');
      await removeAssetPromise('uAdd010037', '');
      await addAssetPromise('uAdd010037', 'password8', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010038 end');
    })

    /**
     * @tc.name   testKeyAdd010039
     * @tc.number SUB_ASSET_KEYADD_0039
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010039 begin');
      await removeAssetPromise('uAdd010038', '');
      await addAssetPromise('uAdd010038', 'pwd_16_chars_123', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010039 end');
    })

    /**
     * @tc.name   testKeyAdd010040
     * @tc.number SUB_ASSET_KEYADD_0040
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010040 begin');
      await removeAssetPromise('uAdd010039', '');
      await addAssetPromise('uAdd010039', '中文密码', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010040 end');
    })

    /**
     * @tc.name   testKeyAdd010041
     * @tc.number SUB_ASSET_KEYADD_0041
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010041 begin');
      await removeAssetPromise('uAdd010040', '');
      await addAssetPromise('uAdd010040', 'pwd@#$%^&*()', 'x0;y0;z0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010041 end');
    })

    /**
     * @tc.name   testKeyAdd010042
     * @tc.number SUB_ASSET_KEYADD_0042
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010042 begin');
      await removeAssetPromise('uAdd010041', '');
      await addAssetPromise('uAdd010041', '12345678', 'x1;y1;z1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010042 end');
    })

    /**
     * @tc.name   testKeyAdd010043
     * @tc.number SUB_ASSET_KEYADD_0043
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010043 begin');
      await removeAssetPromise('uAdd010042', '');
      await addAssetPromise('uAdd010042', 'p1', 'x2;y2;z2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010043 end');
    })

    /**
     * @tc.name   testKeyAdd010044
     * @tc.number SUB_ASSET_KEYADD_0044
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010044 begin');
      await removeAssetPromise('uAdd010043', '');
      await addAssetPromise('uAdd010043', 'password8', 'x3;y3;z3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010044 end');
    })

    /**
     * @tc.name   testKeyAdd010045
     * @tc.number SUB_ASSET_KEYADD_0045
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010045 begin');
      await removeAssetPromise('uAdd010044', '');
      await addAssetPromise('uAdd010044', 'pwd_16_chars_123', 'x4;y4;z4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010045 end');
    })

    /**
     * @tc.name   testKeyAdd010046
     * @tc.number SUB_ASSET_KEYADD_0046
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010046 begin');
      await removeAssetPromise('uAdd010045', '');
      await addAssetPromise('uAdd010045', '中文密码', 'x5;y5;z5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010046 end');
    })

    /**
     * @tc.name   testKeyAdd010047
     * @tc.number SUB_ASSET_KEYADD_0047
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010047 begin');
      await removeAssetPromise('uAdd010046', '');
      await addAssetPromise('uAdd010046', 'pwd@#$%^&*()', 'x6;y6;z6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010047 end');
    })

    /**
     * @tc.name   testKeyAdd010048
     * @tc.number SUB_ASSET_KEYADD_0048
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010048 begin');
      await removeAssetPromise('uAdd010047', '');
      await addAssetPromise('uAdd010047', '12345678', 'x7;y7;z7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010048 end');
    })

    /**
     * @tc.name   testKeyAdd010049
     * @tc.number SUB_ASSET_KEYADD_0049
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010049 begin');
      await removeAssetPromise('uAdd010048', '');
      await addAssetPromise('uAdd010048', 'p1', 'x8;y8;z8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010049 end');
    })

    /**
     * @tc.name   testKeyAdd010050
     * @tc.number SUB_ASSET_KEYADD_0050
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010050 begin');
      await removeAssetPromise('uAdd010049', '');
      await addAssetPromise('uAdd010049', 'password8', 'x9;y9;z9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010050 end');
    })

    /**
     * @tc.name   testKeyAdd010051
     * @tc.number SUB_ASSET_KEYADD_0051
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010051 begin');
      await removeAssetPromise('uAdd010050', '');
      await addAssetPromise('uAdd010050', 'pwd_16_chars_123', 'x10;y10;z10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010051 end');
    })

    /**
     * @tc.name   testKeyAdd010052
     * @tc.number SUB_ASSET_KEYADD_0052
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010052 begin');
      await removeAssetPromise('uAdd010051', '');
      await addAssetPromise('uAdd010051', '中文密码', 'x11;y11;z11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010052 end');
    })

    /**
     * @tc.name   testKeyAdd010053
     * @tc.number SUB_ASSET_KEYADD_0053
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010053 begin');
      await removeAssetPromise('uAdd010052', '');
      await addAssetPromise('uAdd010052', 'pwd@#$%^&*()', 'x12;y12;z12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010053 end');
    })

    /**
     * @tc.name   testKeyAdd010054
     * @tc.number SUB_ASSET_KEYADD_0054
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010054 begin');
      await removeAssetPromise('uAdd010053', '');
      await addAssetPromise('uAdd010053', '12345678', 'x13;y13;z13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010054 end');
    })

    /**
     * @tc.name   testKeyAdd010055
     * @tc.number SUB_ASSET_KEYADD_0055
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010055 begin');
      await removeAssetPromise('uAdd010054', '');
      await addAssetPromise('uAdd010054', 'p1', 'x14;y14;z14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010055 end');
    })

    /**
     * @tc.name   testKeyAdd010056
     * @tc.number SUB_ASSET_KEYADD_0056
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010056 begin');
      await removeAssetPromise('uAdd010055', '');
      await addAssetPromise('uAdd010055', 'password8', 'x15;y15;z15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010056 end');
    })

    /**
     * @tc.name   testKeyAdd010057
     * @tc.number SUB_ASSET_KEYADD_0057
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010057 begin');
      await removeAssetPromise('uAdd010056', '');
      await addAssetPromise('uAdd010056', 'pwd_16_chars_123', 'x16;y16;z16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010057 end');
    })

    /**
     * @tc.name   testKeyAdd010058
     * @tc.number SUB_ASSET_KEYADD_0058
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010058 begin');
      await removeAssetPromise('uAdd010057', '');
      await addAssetPromise('uAdd010057', '中文密码', 'x17;y17;z17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010058 end');
    })

    /**
     * @tc.name   testKeyAdd010059
     * @tc.number SUB_ASSET_KEYADD_0059
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010059 begin');
      await removeAssetPromise('uAdd010058', '');
      await addAssetPromise('uAdd010058', 'pwd@#$%^&*()', 'x18;y18;z18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010059 end');
    })

    /**
     * @tc.name   testKeyAdd010060
     * @tc.number SUB_ASSET_KEYADD_0060
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010060 begin');
      await removeAssetPromise('uAdd010059', '');
      await addAssetPromise('uAdd010059', '12345678', 'x19;y19;z19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010060 end');
    })

    /**
     * @tc.name   testKeyAdd010061
     * @tc.number SUB_ASSET_KEYADD_0061
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010061 begin');
      await removeAssetPromise('uAdd010060', '');
      await addAssetPromise('uAdd010060', 'p1', 'a0;b0;c0;d0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010061 end');
    })

    /**
     * @tc.name   testKeyAdd010062
     * @tc.number SUB_ASSET_KEYADD_0062
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010062 begin');
      await removeAssetPromise('uAdd010061', '');
      await addAssetPromise('uAdd010061', 'password8', 'a1;b1;c1;d1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010062 end');
    })

    /**
     * @tc.name   testKeyAdd010063
     * @tc.number SUB_ASSET_KEYADD_0063
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010063 begin');
      await removeAssetPromise('uAdd010062', '');
      await addAssetPromise('uAdd010062', 'pwd_16_chars_123', 'a2;b2;c2;d2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010063 end');
    })

    /**
     * @tc.name   testKeyAdd010064
     * @tc.number SUB_ASSET_KEYADD_0064
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010064 begin');
      await removeAssetPromise('uAdd010063', '');
      await addAssetPromise('uAdd010063', '中文密码', 'a3;b3;c3;d3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010064 end');
    })

    /**
     * @tc.name   testKeyAdd010065
     * @tc.number SUB_ASSET_KEYADD_0065
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010065 begin');
      await removeAssetPromise('uAdd010064', '');
      await addAssetPromise('uAdd010064', 'pwd@#$%^&*()', 'a4;b4;c4;d4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010065 end');
    })

    /**
     * @tc.name   testKeyAdd010066
     * @tc.number SUB_ASSET_KEYADD_0066
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010066 begin');
      await removeAssetPromise('uAdd010065', '');
      await addAssetPromise('uAdd010065', '12345678', 'a5;b5;c5;d5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010066 end');
    })

    /**
     * @tc.name   testKeyAdd010067
     * @tc.number SUB_ASSET_KEYADD_0067
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010067 begin');
      await removeAssetPromise('uAdd010066', '');
      await addAssetPromise('uAdd010066', 'p1', 'a6;b6;c6;d6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010067 end');
    })

    /**
     * @tc.name   testKeyAdd010068
     * @tc.number SUB_ASSET_KEYADD_0068
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010068 begin');
      await removeAssetPromise('uAdd010067', '');
      await addAssetPromise('uAdd010067', 'password8', 'a7;b7;c7;d7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010068 end');
    })

    /**
     * @tc.name   testKeyAdd010069
     * @tc.number SUB_ASSET_KEYADD_0069
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010069 begin');
      await removeAssetPromise('uAdd010068', '');
      await addAssetPromise('uAdd010068', 'pwd_16_chars_123', 'a8;b8;c8;d8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010069 end');
    })

    /**
     * @tc.name   testKeyAdd010070
     * @tc.number SUB_ASSET_KEYADD_0070
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010070 begin');
      await removeAssetPromise('uAdd010069', '');
      await addAssetPromise('uAdd010069', '中文密码', 'a9;b9;c9;d9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010070 end');
    })

    /**
     * @tc.name   testKeyAdd010071
     * @tc.number SUB_ASSET_KEYADD_0071
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010071 begin');
      await removeAssetPromise('uAdd010070', '');
      await addAssetPromise('uAdd010070', 'pwd@#$%^&*()', 'a10;b10;c10;d10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010071 end');
    })

    /**
     * @tc.name   testKeyAdd010072
     * @tc.number SUB_ASSET_KEYADD_0072
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010072 begin');
      await removeAssetPromise('uAdd010071', '');
      await addAssetPromise('uAdd010071', '12345678', 'a11;b11;c11;d11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010072 end');
    })

    /**
     * @tc.name   testKeyAdd010073
     * @tc.number SUB_ASSET_KEYADD_0073
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010073 begin');
      await removeAssetPromise('uAdd010072', '');
      await addAssetPromise('uAdd010072', 'p1', 'a12;b12;c12;d12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010073 end');
    })

    /**
     * @tc.name   testKeyAdd010074
     * @tc.number SUB_ASSET_KEYADD_0074
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010074 begin');
      await removeAssetPromise('uAdd010073', '');
      await addAssetPromise('uAdd010073', 'password8', 'a13;b13;c13;d13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010074 end');
    })

    /**
     * @tc.name   testKeyAdd010075
     * @tc.number SUB_ASSET_KEYADD_0075
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010075 begin');
      await removeAssetPromise('uAdd010074', '');
      await addAssetPromise('uAdd010074', 'pwd_16_chars_123', 'a14;b14;c14;d14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010075 end');
    })

    /**
     * @tc.name   testKeyAdd010076
     * @tc.number SUB_ASSET_KEYADD_0076
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010076 begin');
      await removeAssetPromise('uAdd010075', '');
      await addAssetPromise('uAdd010075', '中文密码', 'a15;b15;c15;d15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010076 end');
    })

    /**
     * @tc.name   testKeyAdd010077
     * @tc.number SUB_ASSET_KEYADD_0077
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010077 begin');
      await removeAssetPromise('uAdd010076', '');
      await addAssetPromise('uAdd010076', 'pwd@#$%^&*()', 'a16;b16;c16;d16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010077 end');
    })

    /**
     * @tc.name   testKeyAdd010078
     * @tc.number SUB_ASSET_KEYADD_0078
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010078 begin');
      await removeAssetPromise('uAdd010077', '');
      await addAssetPromise('uAdd010077', '12345678', 'a17;b17;c17;d17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010078 end');
    })

    /**
     * @tc.name   testKeyAdd010079
     * @tc.number SUB_ASSET_KEYADD_0079
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010079 begin');
      await removeAssetPromise('uAdd010078', '');
      await addAssetPromise('uAdd010078', 'p1', 'a18;b18;c18;d18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010079 end');
    })

    /**
     * @tc.name   testKeyAdd010080
     * @tc.number SUB_ASSET_KEYADD_0080
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010080 begin');
      await removeAssetPromise('uAdd010079', '');
      await addAssetPromise('uAdd010079', 'password8', 'a19;b19;c19;d19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010080 end');
    })

    /**
     * @tc.name   testKeyAdd010081
     * @tc.number SUB_ASSET_KEYADD_0081
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010081 begin');
      await removeAssetPromise('uAdd010080', '');
      await addAssetPromise('uAdd010080', 'pwd_16_chars_123', 'a0;b0;c0;d0;e0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010081 end');
    })

    /**
     * @tc.name   testKeyAdd010082
     * @tc.number SUB_ASSET_KEYADD_0082
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010082 begin');
      await removeAssetPromise('uAdd010081', '');
      await addAssetPromise('uAdd010081', '中文密码', 'a1;b1;c1;d1;e1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010082 end');
    })

    /**
     * @tc.name   testKeyAdd010083
     * @tc.number SUB_ASSET_KEYADD_0083
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010083 begin');
      await removeAssetPromise('uAdd010082', '');
      await addAssetPromise('uAdd010082', 'pwd@#$%^&*()', 'a2;b2;c2;d2;e2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010083 end');
    })

    /**
     * @tc.name   testKeyAdd010084
     * @tc.number SUB_ASSET_KEYADD_0084
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010084 begin');
      await removeAssetPromise('uAdd010083', '');
      await addAssetPromise('uAdd010083', '12345678', 'a3;b3;c3;d3;e3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010084 end');
    })

    /**
     * @tc.name   testKeyAdd010085
     * @tc.number SUB_ASSET_KEYADD_0085
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010085 begin');
      await removeAssetPromise('uAdd010084', '');
      await addAssetPromise('uAdd010084', 'p1', 'a4;b4;c4;d4;e4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010085 end');
    })

    /**
     * @tc.name   testKeyAdd010086
     * @tc.number SUB_ASSET_KEYADD_0086
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010086 begin');
      await removeAssetPromise('uAdd010085', '');
      await addAssetPromise('uAdd010085', 'password8', 'a5;b5;c5;d5;e5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010086 end');
    })

    /**
     * @tc.name   testKeyAdd010087
     * @tc.number SUB_ASSET_KEYADD_0087
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010087 begin');
      await removeAssetPromise('uAdd010086', '');
      await addAssetPromise('uAdd010086', 'pwd_16_chars_123', 'a6;b6;c6;d6;e6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010087 end');
    })

    /**
     * @tc.name   testKeyAdd010088
     * @tc.number SUB_ASSET_KEYADD_0088
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010088 begin');
      await removeAssetPromise('uAdd010087', '');
      await addAssetPromise('uAdd010087', '中文密码', 'a7;b7;c7;d7;e7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010088 end');
    })

    /**
     * @tc.name   testKeyAdd010089
     * @tc.number SUB_ASSET_KEYADD_0089
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010089 begin');
      await removeAssetPromise('uAdd010088', '');
      await addAssetPromise('uAdd010088', 'pwd@#$%^&*()', 'a8;b8;c8;d8;e8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010089 end');
    })

    /**
     * @tc.name   testKeyAdd010090
     * @tc.number SUB_ASSET_KEYADD_0090
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010090 begin');
      await removeAssetPromise('uAdd010089', '');
      await addAssetPromise('uAdd010089', '12345678', 'a9;b9;c9;d9;e9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010090 end');
    })

    /**
     * @tc.name   testKeyAdd010091
     * @tc.number SUB_ASSET_KEYADD_0091
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010091 begin');
      await removeAssetPromise('uAdd010090', '');
      await addAssetPromise('uAdd010090', 'p1', 'a10;b10;c10;d10;e10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010091 end');
    })

    /**
     * @tc.name   testKeyAdd010092
     * @tc.number SUB_ASSET_KEYADD_0092
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010092 begin');
      await removeAssetPromise('uAdd010091', '');
      await addAssetPromise('uAdd010091', 'password8', 'a11;b11;c11;d11;e11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010092 end');
    })

    /**
     * @tc.name   testKeyAdd010093
     * @tc.number SUB_ASSET_KEYADD_0093
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010093 begin');
      await removeAssetPromise('uAdd010092', '');
      await addAssetPromise('uAdd010092', 'pwd_16_chars_123', 'a12;b12;c12;d12;e12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010093 end');
    })

    /**
     * @tc.name   testKeyAdd010094
     * @tc.number SUB_ASSET_KEYADD_0094
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010094 begin');
      await removeAssetPromise('uAdd010093', '');
      await addAssetPromise('uAdd010093', '中文密码', 'a13;b13;c13;d13;e13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010094 end');
    })

    /**
     * @tc.name   testKeyAdd010095
     * @tc.number SUB_ASSET_KEYADD_0095
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010095 begin');
      await removeAssetPromise('uAdd010094', '');
      await addAssetPromise('uAdd010094', 'pwd@#$%^&*()', 'a14;b14;c14;d14;e14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010095 end');
    })

    /**
     * @tc.name   testKeyAdd010096
     * @tc.number SUB_ASSET_KEYADD_0096
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010096 begin');
      await removeAssetPromise('uAdd010095', '');
      await addAssetPromise('uAdd010095', '12345678', 'a15;b15;c15;d15;e15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010096 end');
    })

    /**
     * @tc.name   testKeyAdd010097
     * @tc.number SUB_ASSET_KEYADD_0097
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010097 begin');
      await removeAssetPromise('uAdd010096', '');
      await addAssetPromise('uAdd010096', 'p1', 'a16;b16;c16;d16;e16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010097 end');
    })

    /**
     * @tc.name   testKeyAdd010098
     * @tc.number SUB_ASSET_KEYADD_0098
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010098 begin');
      await removeAssetPromise('uAdd010097', '');
      await addAssetPromise('uAdd010097', 'password8', 'a17;b17;c17;d17;e17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010098 end');
    })

    /**
     * @tc.name   testKeyAdd010099
     * @tc.number SUB_ASSET_KEYADD_0099
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010099 begin');
      await removeAssetPromise('uAdd010098', '');
      await addAssetPromise('uAdd010098', 'pwd_16_chars_123', 'a18;b18;c18;d18;e18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010099 end');
    })

    /**
     * @tc.name   testKeyAdd010100
     * @tc.number SUB_ASSET_KEYADD_0100
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010100 begin');
      await removeAssetPromise('uAdd010099', '');
      await addAssetPromise('uAdd010099', '中文密码', 'a19;b19;c19;d19;e19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010100 end');
    })

    /**
     * @tc.name   testKeyAdd010101
     * @tc.number SUB_ASSET_KEYADD_0101
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010101 begin');
      await removeAssetPromise('uAdd010100', '');
      await addAssetPromise('uAdd010100', 'pwd@#$%^&*()', 'a0;b0;c0;d0;e0;f0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010101 end');
    })

    /**
     * @tc.name   testKeyAdd010102
     * @tc.number SUB_ASSET_KEYADD_0102
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010102 begin');
      await removeAssetPromise('uAdd010101', '');
      await addAssetPromise('uAdd010101', '12345678', 'a1;b1;c1;d1;e1;f1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010102 end');
    })

    /**
     * @tc.name   testKeyAdd010103
     * @tc.number SUB_ASSET_KEYADD_0103
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010103 begin');
      await removeAssetPromise('uAdd010102', '');
      await addAssetPromise('uAdd010102', 'p1', 'a2;b2;c2;d2;e2;f2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010103 end');
    })

    /**
     * @tc.name   testKeyAdd010104
     * @tc.number SUB_ASSET_KEYADD_0104
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010104 begin');
      await removeAssetPromise('uAdd010103', '');
      await addAssetPromise('uAdd010103', 'password8', 'a3;b3;c3;d3;e3;f3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010104 end');
    })

    /**
     * @tc.name   testKeyAdd010105
     * @tc.number SUB_ASSET_KEYADD_0105
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010105 begin');
      await removeAssetPromise('uAdd010104', '');
      await addAssetPromise('uAdd010104', 'pwd_16_chars_123', 'a4;b4;c4;d4;e4;f4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010105 end');
    })

    /**
     * @tc.name   testKeyAdd010106
     * @tc.number SUB_ASSET_KEYADD_0106
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010106 begin');
      await removeAssetPromise('uAdd010105', '');
      await addAssetPromise('uAdd010105', '中文密码', 'a5;b5;c5;d5;e5;f5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010106 end');
    })

    /**
     * @tc.name   testKeyAdd010107
     * @tc.number SUB_ASSET_KEYADD_0107
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010107 begin');
      await removeAssetPromise('uAdd010106', '');
      await addAssetPromise('uAdd010106', 'pwd@#$%^&*()', 'a6;b6;c6;d6;e6;f6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010107 end');
    })

    /**
     * @tc.name   testKeyAdd010108
     * @tc.number SUB_ASSET_KEYADD_0108
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010108 begin');
      await removeAssetPromise('uAdd010107', '');
      await addAssetPromise('uAdd010107', '12345678', 'a7;b7;c7;d7;e7;f7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010108 end');
    })

    /**
     * @tc.name   testKeyAdd010109
     * @tc.number SUB_ASSET_KEYADD_0109
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010109 begin');
      await removeAssetPromise('uAdd010108', '');
      await addAssetPromise('uAdd010108', 'p1', 'a8;b8;c8;d8;e8;f8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010109 end');
    })

    /**
     * @tc.name   testKeyAdd010110
     * @tc.number SUB_ASSET_KEYADD_0110
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010110 begin');
      await removeAssetPromise('uAdd010109', '');
      await addAssetPromise('uAdd010109', 'password8', 'a9;b9;c9;d9;e9;f9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010110 end');
    })

    /**
     * @tc.name   testKeyAdd010111
     * @tc.number SUB_ASSET_KEYADD_0111
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010111 begin');
      await removeAssetPromise('uAdd010110', '');
      await addAssetPromise('uAdd010110', 'pwd_16_chars_123', 'dup0;dup0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010111 end');
    })

    /**
     * @tc.name   testKeyAdd010112
     * @tc.number SUB_ASSET_KEYADD_0112
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010112 begin');
      await removeAssetPromise('uAdd010111', '');
      await addAssetPromise('uAdd010111', '中文密码', 'dup1;dup1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010112 end');
    })

    /**
     * @tc.name   testKeyAdd010113
     * @tc.number SUB_ASSET_KEYADD_0113
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010113 begin');
      await removeAssetPromise('uAdd010112', '');
      await addAssetPromise('uAdd010112', 'pwd@#$%^&*()', 'dup2;dup2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010113 end');
    })

    /**
     * @tc.name   testKeyAdd010114
     * @tc.number SUB_ASSET_KEYADD_0114
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010114 begin');
      await removeAssetPromise('uAdd010113', '');
      await addAssetPromise('uAdd010113', '12345678', 'dup3;dup3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010114 end');
    })

    /**
     * @tc.name   testKeyAdd010115
     * @tc.number SUB_ASSET_KEYADD_0115
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010115 begin');
      await removeAssetPromise('uAdd010114', '');
      await addAssetPromise('uAdd010114', 'p1', 'dup4;dup4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010115 end');
    })

    /**
     * @tc.name   testKeyAdd010116
     * @tc.number SUB_ASSET_KEYADD_0116
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010116 begin');
      await removeAssetPromise('uAdd010115', '');
      await addAssetPromise('uAdd010115', 'password8', 'dup5;dup5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010116 end');
    })

    /**
     * @tc.name   testKeyAdd010117
     * @tc.number SUB_ASSET_KEYADD_0117
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010117 begin');
      await removeAssetPromise('uAdd010116', '');
      await addAssetPromise('uAdd010116', 'pwd_16_chars_123', 'dup6;dup6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010117 end');
    })

    /**
     * @tc.name   testKeyAdd010118
     * @tc.number SUB_ASSET_KEYADD_0118
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010118 begin');
      await removeAssetPromise('uAdd010117', '');
      await addAssetPromise('uAdd010117', '中文密码', 'dup7;dup7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010118 end');
    })

    /**
     * @tc.name   testKeyAdd010119
     * @tc.number SUB_ASSET_KEYADD_0119
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010119 begin');
      await removeAssetPromise('uAdd010118', '');
      await addAssetPromise('uAdd010118', 'pwd@#$%^&*()', 'dup8;dup8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010119 end');
    })

    /**
     * @tc.name   testKeyAdd010120
     * @tc.number SUB_ASSET_KEYADD_0120
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010120 begin');
      await removeAssetPromise('uAdd010119', '');
      await addAssetPromise('uAdd010119', '12345678', 'dup9;dup9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010120 end');
    })

    /**
     * @tc.name   testKeyAdd010121
     * @tc.number SUB_ASSET_KEYADD_0121
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010121 begin');
      await removeAssetPromise('uAdd010120', '');
      await addAssetPromise('uAdd010120', 'p1', 'dup10;dup10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010121 end');
    })

    /**
     * @tc.name   testKeyAdd010122
     * @tc.number SUB_ASSET_KEYADD_0122
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010122 begin');
      await removeAssetPromise('uAdd010121', '');
      await addAssetPromise('uAdd010121', 'password8', 'dup11;dup11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010122 end');
    })

    /**
     * @tc.name   testKeyAdd010123
     * @tc.number SUB_ASSET_KEYADD_0123
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010123 begin');
      await removeAssetPromise('uAdd010122', '');
      await addAssetPromise('uAdd010122', 'pwd_16_chars_123', 'dup12;dup12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010123 end');
    })

    /**
     * @tc.name   testKeyAdd010124
     * @tc.number SUB_ASSET_KEYADD_0124
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010124 begin');
      await removeAssetPromise('uAdd010123', '');
      await addAssetPromise('uAdd010123', '中文密码', 'dup13;dup13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010124 end');
    })

    /**
     * @tc.name   testKeyAdd010125
     * @tc.number SUB_ASSET_KEYADD_0125
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010125 begin');
      await removeAssetPromise('uAdd010124', '');
      await addAssetPromise('uAdd010124', 'pwd@#$%^&*()', 'dup14;dup14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010125 end');
    })

    /**
     * @tc.name   testKeyAdd010126
     * @tc.number SUB_ASSET_KEYADD_0126
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010126 begin');
      await removeAssetPromise('uAdd010125', '');
      await addAssetPromise('uAdd010125', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010126 end');
    })

    /**
     * @tc.name   testKeyAdd010127
     * @tc.number SUB_ASSET_KEYADD_0127
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010127 begin');
      await removeAssetPromise('uAdd010126', '');
      await addAssetPromise('uAdd010126', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010127 end');
    })

    /**
     * @tc.name   testKeyAdd010128
     * @tc.number SUB_ASSET_KEYADD_0128
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010128 begin');
      await removeAssetPromise('uAdd010127', '');
      await addAssetPromise('uAdd010127', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010128 end');
    })

    /**
     * @tc.name   testKeyAdd010129
     * @tc.number SUB_ASSET_KEYADD_0129
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010129 begin');
      await removeAssetPromise('uAdd010128', '');
      await addAssetPromise('uAdd010128', 'pwd_16_chars_123', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010129 end');
    })

    /**
     * @tc.name   testKeyAdd010130
     * @tc.number SUB_ASSET_KEYADD_0130
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010130 begin');
      await removeAssetPromise('uAdd010129', '');
      await addAssetPromise('uAdd010129', '中文密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010130 end');
    })

    /**
     * @tc.name   testKeyAdd010131
     * @tc.number SUB_ASSET_KEYADD_0131
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010131 begin');
      await removeAssetPromise('uAdd010130', '');
      await addAssetPromise('uAdd010130', 'pwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010131 end');
    })

    /**
     * @tc.name   testKeyAdd010132
     * @tc.number SUB_ASSET_KEYADD_0132
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010132 begin');
      await removeAssetPromise('uAdd010131', '');
      await addAssetPromise('uAdd010131', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010132 end');
    })

    /**
     * @tc.name   testKeyAdd010133
     * @tc.number SUB_ASSET_KEYADD_0133
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010133 begin');
      await removeAssetPromise('uAdd010132', '');
      await addAssetPromise('uAdd010132', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010133 end');
    })

    /**
     * @tc.name   testKeyAdd010134
     * @tc.number SUB_ASSET_KEYADD_0134
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010134 begin');
      await removeAssetPromise('uAdd010133', '');
      await addAssetPromise('uAdd010133', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010134 end');
    })

    /**
     * @tc.name   testKeyAdd010135
     * @tc.number SUB_ASSET_KEYADD_0135
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010135 begin');
      await removeAssetPromise('uAdd010134', '');
      await addAssetPromise('uAdd010134', 'pwd_16_chars_123', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010135 end');
    })

    /**
     * @tc.name   testKeyAdd010136
     * @tc.number SUB_ASSET_KEYADD_0136
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010136 begin');
      await removeAssetPromise('uAdd010135', '');
      await addAssetPromise('uAdd010135', '中文密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010136 end');
    })

    /**
     * @tc.name   testKeyAdd010137
     * @tc.number SUB_ASSET_KEYADD_0137
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010137 begin');
      await removeAssetPromise('uAdd010136', '');
      await addAssetPromise('uAdd010136', 'pwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010137 end');
    })

    /**
     * @tc.name   testKeyAdd010138
     * @tc.number SUB_ASSET_KEYADD_0138
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010138 begin');
      await removeAssetPromise('uAdd010137', '');
      await addAssetPromise('uAdd010137', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010138 end');
    })

    /**
     * @tc.name   testKeyAdd010139
     * @tc.number SUB_ASSET_KEYADD_0139
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010139 begin');
      await removeAssetPromise('uAdd010138', '');
      await addAssetPromise('uAdd010138', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010139 end');
    })

    /**
     * @tc.name   testKeyAdd010140
     * @tc.number SUB_ASSET_KEYADD_0140
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010140 begin');
      await removeAssetPromise('uAdd010139', '');
      await addAssetPromise('uAdd010139', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010140 end');
    })

    /**
     * @tc.name   testKeyAdd010141
     * @tc.number SUB_ASSET_KEYADD_0141
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010141 begin');
      await removeAssetPromise('uAdd010140', '');
      await addAssetPromise('uAdd010140', 'pwd_16_chars_123', 'a0;;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010141 end');
    })

    /**
     * @tc.name   testKeyAdd010142
     * @tc.number SUB_ASSET_KEYADD_0142
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010142 begin');
      await removeAssetPromise('uAdd010141', '');
      await addAssetPromise('uAdd010141', '中文密码', 'a1;;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010142 end');
    })

    /**
     * @tc.name   testKeyAdd010143
     * @tc.number SUB_ASSET_KEYADD_0143
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010143 begin');
      await removeAssetPromise('uAdd010142', '');
      await addAssetPromise('uAdd010142', 'pwd@#$%^&*()', 'a2;;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010143 end');
    })

    /**
     * @tc.name   testKeyAdd010144
     * @tc.number SUB_ASSET_KEYADD_0144
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010144 begin');
      await removeAssetPromise('uAdd010143', '');
      await addAssetPromise('uAdd010143', '12345678', 'a3;;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010144 end');
    })

    /**
     * @tc.name   testKeyAdd010145
     * @tc.number SUB_ASSET_KEYADD_0145
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010145 begin');
      await removeAssetPromise('uAdd010144', '');
      await addAssetPromise('uAdd010144', 'p1', 'a4;;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010145 end');
    })

    /**
     * @tc.name   testKeyAdd010146
     * @tc.number SUB_ASSET_KEYADD_0146
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010146 begin');
      await removeAssetPromise('uAdd010145', '');
      await addAssetPromise('uAdd010145', 'password8', 'a5;;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010146 end');
    })

    /**
     * @tc.name   testKeyAdd010147
     * @tc.number SUB_ASSET_KEYADD_0147
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010147 begin');
      await removeAssetPromise('uAdd010146', '');
      await addAssetPromise('uAdd010146', 'pwd_16_chars_123', 'a6;;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010147 end');
    })

    /**
     * @tc.name   testKeyAdd010148
     * @tc.number SUB_ASSET_KEYADD_0148
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010148 begin');
      await removeAssetPromise('uAdd010147', '');
      await addAssetPromise('uAdd010147', '中文密码', 'a7;;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010148 end');
    })

    /**
     * @tc.name   testKeyAdd010149
     * @tc.number SUB_ASSET_KEYADD_0149
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010149 begin');
      await removeAssetPromise('uAdd010148', '');
      await addAssetPromise('uAdd010148', 'pwd@#$%^&*()', 'a8;;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010149 end');
    })

    /**
     * @tc.name   testKeyAdd010150
     * @tc.number SUB_ASSET_KEYADD_0150
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010150 begin');
      await removeAssetPromise('uAdd010149', '');
      await addAssetPromise('uAdd010149', '12345678', 'a9;;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd010149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd010149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd010150 end');
    })

  })
}
