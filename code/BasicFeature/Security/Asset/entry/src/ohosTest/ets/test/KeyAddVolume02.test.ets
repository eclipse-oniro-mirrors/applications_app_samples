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

export default function keyAddVolume02() {
  describe('KeyAddVolume02Test', () => {

    /**
     * @tc.name   testKeyAdd020151
     * @tc.number SUB_ASSET_KEYADD_0151
     * @tc.desc   addAssetPromise 保存后按账号查询回读 secret 与 label 一致
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020151 begin');
      const alias: string = 'uAddAnchor01';
      const secret: string = 'anchorSecret';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, secret, 'anchorLabel');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual(secret);
      expect(rows[0].get('label')).assertEqual('anchorLabel');
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020151 end');
    })

    /**
     * @tc.name   testKeyAdd020152
     * @tc.number SUB_ASSET_KEYADD_0152
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020152 begin');
      await removeAssetPromise('uAdd020001', '');
      await addAssetPromise('uAdd020001', 'password8', 'tagA1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020152 end');
    })

    /**
     * @tc.name   testKeyAdd020153
     * @tc.number SUB_ASSET_KEYADD_0153
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020153 begin');
      await removeAssetPromise('uAdd020002', '');
      await addAssetPromise('uAdd020002', 'pwd_16_chars_123', 'tagA2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020153 end');
    })

    /**
     * @tc.name   testKeyAdd020154
     * @tc.number SUB_ASSET_KEYADD_0154
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020154 begin');
      await removeAssetPromise('uAdd020003', '');
      await addAssetPromise('uAdd020003', '中文密码', 'tagA3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020154 end');
    })

    /**
     * @tc.name   testKeyAdd020155
     * @tc.number SUB_ASSET_KEYADD_0155
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020155 begin');
      await removeAssetPromise('uAdd020004', '');
      await addAssetPromise('uAdd020004', 'pwd@#$%^&*()', 'tagA4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020155 end');
    })

    /**
     * @tc.name   testKeyAdd020156
     * @tc.number SUB_ASSET_KEYADD_0156
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020156 begin');
      await removeAssetPromise('uAdd020005', '');
      await addAssetPromise('uAdd020005', '12345678', 'tagA5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020156 end');
    })

    /**
     * @tc.name   testKeyAdd020157
     * @tc.number SUB_ASSET_KEYADD_0157
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020157 begin');
      await removeAssetPromise('uAdd020006', '');
      await addAssetPromise('uAdd020006', 'p1', 'tagA6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020157 end');
    })

    /**
     * @tc.name   testKeyAdd020158
     * @tc.number SUB_ASSET_KEYADD_0158
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020158 begin');
      await removeAssetPromise('uAdd020007', '');
      await addAssetPromise('uAdd020007', 'password8', 'tagA7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020158 end');
    })

    /**
     * @tc.name   testKeyAdd020159
     * @tc.number SUB_ASSET_KEYADD_0159
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020159 begin');
      await removeAssetPromise('uAdd020008', '');
      await addAssetPromise('uAdd020008', 'pwd_16_chars_123', 'tagA8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020159 end');
    })

    /**
     * @tc.name   testKeyAdd020160
     * @tc.number SUB_ASSET_KEYADD_0160
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020160 begin');
      await removeAssetPromise('uAdd020009', '');
      await addAssetPromise('uAdd020009', '中文密码', 'tagA9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020160 end');
    })

    /**
     * @tc.name   testKeyAdd020161
     * @tc.number SUB_ASSET_KEYADD_0161
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020161 begin');
      await removeAssetPromise('uAdd020010', '');
      await addAssetPromise('uAdd020010', 'pwd@#$%^&*()', 'tagA10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020161 end');
    })

    /**
     * @tc.name   testKeyAdd020162
     * @tc.number SUB_ASSET_KEYADD_0162
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020162 begin');
      await removeAssetPromise('uAdd020011', '');
      await addAssetPromise('uAdd020011', '12345678', 'tagA11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020162 end');
    })

    /**
     * @tc.name   testKeyAdd020163
     * @tc.number SUB_ASSET_KEYADD_0163
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020163 begin');
      await removeAssetPromise('uAdd020012', '');
      await addAssetPromise('uAdd020012', 'p1', 'tagA12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020163 end');
    })

    /**
     * @tc.name   testKeyAdd020164
     * @tc.number SUB_ASSET_KEYADD_0164
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020164 begin');
      await removeAssetPromise('uAdd020013', '');
      await addAssetPromise('uAdd020013', 'password8', 'tagA13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020164 end');
    })

    /**
     * @tc.name   testKeyAdd020165
     * @tc.number SUB_ASSET_KEYADD_0165
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020165 begin');
      await removeAssetPromise('uAdd020014', '');
      await addAssetPromise('uAdd020014', 'pwd_16_chars_123', 'tagA14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020165 end');
    })

    /**
     * @tc.name   testKeyAdd020166
     * @tc.number SUB_ASSET_KEYADD_0166
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020166 begin');
      await removeAssetPromise('uAdd020015', '');
      await addAssetPromise('uAdd020015', '中文密码', 'tagA15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020166 end');
    })

    /**
     * @tc.name   testKeyAdd020167
     * @tc.number SUB_ASSET_KEYADD_0167
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020167 begin');
      await removeAssetPromise('uAdd020016', '');
      await addAssetPromise('uAdd020016', 'pwd@#$%^&*()', 'tagA16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020167 end');
    })

    /**
     * @tc.name   testKeyAdd020168
     * @tc.number SUB_ASSET_KEYADD_0168
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020168 begin');
      await removeAssetPromise('uAdd020017', '');
      await addAssetPromise('uAdd020017', '12345678', 'tagA17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020168 end');
    })

    /**
     * @tc.name   testKeyAdd020169
     * @tc.number SUB_ASSET_KEYADD_0169
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020169 begin');
      await removeAssetPromise('uAdd020018', '');
      await addAssetPromise('uAdd020018', 'p1', 'tagA18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020169 end');
    })

    /**
     * @tc.name   testKeyAdd020170
     * @tc.number SUB_ASSET_KEYADD_0170
     * @tc.desc   合法值：单标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020170 begin');
      await removeAssetPromise('uAdd020019', '');
      await addAssetPromise('uAdd020019', 'password8', 'tagA19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020170 end');
    })

    /**
     * @tc.name   testKeyAdd020171
     * @tc.number SUB_ASSET_KEYADD_0171
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020171 begin');
      await removeAssetPromise('uAdd020020', '');
      await addAssetPromise('uAdd020020', 'pwd_16_chars_123', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020171 end');
    })

    /**
     * @tc.name   testKeyAdd020172
     * @tc.number SUB_ASSET_KEYADD_0172
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020172 begin');
      await removeAssetPromise('uAdd020021', '');
      await addAssetPromise('uAdd020021', '中文密码', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020172 end');
    })

    /**
     * @tc.name   testKeyAdd020173
     * @tc.number SUB_ASSET_KEYADD_0173
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020173 begin');
      await removeAssetPromise('uAdd020022', '');
      await addAssetPromise('uAdd020022', 'pwd@#$%^&*()', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020173 end');
    })

    /**
     * @tc.name   testKeyAdd020174
     * @tc.number SUB_ASSET_KEYADD_0174
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020174 begin');
      await removeAssetPromise('uAdd020023', '');
      await addAssetPromise('uAdd020023', '12345678', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020174 end');
    })

    /**
     * @tc.name   testKeyAdd020175
     * @tc.number SUB_ASSET_KEYADD_0175
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020175 begin');
      await removeAssetPromise('uAdd020024', '');
      await addAssetPromise('uAdd020024', 'p1', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020175 end');
    })

    /**
     * @tc.name   testKeyAdd020176
     * @tc.number SUB_ASSET_KEYADD_0176
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020176 begin');
      await removeAssetPromise('uAdd020025', '');
      await addAssetPromise('uAdd020025', 'password8', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020176 end');
    })

    /**
     * @tc.name   testKeyAdd020177
     * @tc.number SUB_ASSET_KEYADD_0177
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020177 begin');
      await removeAssetPromise('uAdd020026', '');
      await addAssetPromise('uAdd020026', 'pwd_16_chars_123', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020177 end');
    })

    /**
     * @tc.name   testKeyAdd020178
     * @tc.number SUB_ASSET_KEYADD_0178
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020178 begin');
      await removeAssetPromise('uAdd020027', '');
      await addAssetPromise('uAdd020027', '中文密码', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020178 end');
    })

    /**
     * @tc.name   testKeyAdd020179
     * @tc.number SUB_ASSET_KEYADD_0179
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020179 begin');
      await removeAssetPromise('uAdd020028', '');
      await addAssetPromise('uAdd020028', 'pwd@#$%^&*()', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020179 end');
    })

    /**
     * @tc.name   testKeyAdd020180
     * @tc.number SUB_ASSET_KEYADD_0180
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020180 begin');
      await removeAssetPromise('uAdd020029', '');
      await addAssetPromise('uAdd020029', '12345678', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020180 end');
    })

    /**
     * @tc.name   testKeyAdd020181
     * @tc.number SUB_ASSET_KEYADD_0181
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020181 begin');
      await removeAssetPromise('uAdd020030', '');
      await addAssetPromise('uAdd020030', 'p1', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020181 end');
    })

    /**
     * @tc.name   testKeyAdd020182
     * @tc.number SUB_ASSET_KEYADD_0182
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020182 begin');
      await removeAssetPromise('uAdd020031', '');
      await addAssetPromise('uAdd020031', 'password8', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020182 end');
    })

    /**
     * @tc.name   testKeyAdd020183
     * @tc.number SUB_ASSET_KEYADD_0183
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020183 begin');
      await removeAssetPromise('uAdd020032', '');
      await addAssetPromise('uAdd020032', 'pwd_16_chars_123', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020183 end');
    })

    /**
     * @tc.name   testKeyAdd020184
     * @tc.number SUB_ASSET_KEYADD_0184
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020184 begin');
      await removeAssetPromise('uAdd020033', '');
      await addAssetPromise('uAdd020033', '中文密码', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020184 end');
    })

    /**
     * @tc.name   testKeyAdd020185
     * @tc.number SUB_ASSET_KEYADD_0185
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020185 begin');
      await removeAssetPromise('uAdd020034', '');
      await addAssetPromise('uAdd020034', 'pwd@#$%^&*()', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020185 end');
    })

    /**
     * @tc.name   testKeyAdd020186
     * @tc.number SUB_ASSET_KEYADD_0186
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020186 begin');
      await removeAssetPromise('uAdd020035', '');
      await addAssetPromise('uAdd020035', '12345678', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020186 end');
    })

    /**
     * @tc.name   testKeyAdd020187
     * @tc.number SUB_ASSET_KEYADD_0187
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020187 begin');
      await removeAssetPromise('uAdd020036', '');
      await addAssetPromise('uAdd020036', 'p1', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020187 end');
    })

    /**
     * @tc.name   testKeyAdd020188
     * @tc.number SUB_ASSET_KEYADD_0188
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020188 begin');
      await removeAssetPromise('uAdd020037', '');
      await addAssetPromise('uAdd020037', 'password8', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020188 end');
    })

    /**
     * @tc.name   testKeyAdd020189
     * @tc.number SUB_ASSET_KEYADD_0189
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020189 begin');
      await removeAssetPromise('uAdd020038', '');
      await addAssetPromise('uAdd020038', 'pwd_16_chars_123', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020189 end');
    })

    /**
     * @tc.name   testKeyAdd020190
     * @tc.number SUB_ASSET_KEYADD_0190
     * @tc.desc   合法值：两个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020190 begin');
      await removeAssetPromise('uAdd020039', '');
      await addAssetPromise('uAdd020039', '中文密码', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020190 end');
    })

    /**
     * @tc.name   testKeyAdd020191
     * @tc.number SUB_ASSET_KEYADD_0191
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020191 begin');
      await removeAssetPromise('uAdd020040', '');
      await addAssetPromise('uAdd020040', 'pwd@#$%^&*()', 'x0;y0;z0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020191 end');
    })

    /**
     * @tc.name   testKeyAdd020192
     * @tc.number SUB_ASSET_KEYADD_0192
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020192 begin');
      await removeAssetPromise('uAdd020041', '');
      await addAssetPromise('uAdd020041', '12345678', 'x1;y1;z1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020192 end');
    })

    /**
     * @tc.name   testKeyAdd020193
     * @tc.number SUB_ASSET_KEYADD_0193
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020193 begin');
      await removeAssetPromise('uAdd020042', '');
      await addAssetPromise('uAdd020042', 'p1', 'x2;y2;z2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020193 end');
    })

    /**
     * @tc.name   testKeyAdd020194
     * @tc.number SUB_ASSET_KEYADD_0194
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020194 begin');
      await removeAssetPromise('uAdd020043', '');
      await addAssetPromise('uAdd020043', 'password8', 'x3;y3;z3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020194 end');
    })

    /**
     * @tc.name   testKeyAdd020195
     * @tc.number SUB_ASSET_KEYADD_0195
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020195 begin');
      await removeAssetPromise('uAdd020044', '');
      await addAssetPromise('uAdd020044', 'pwd_16_chars_123', 'x4;y4;z4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020195 end');
    })

    /**
     * @tc.name   testKeyAdd020196
     * @tc.number SUB_ASSET_KEYADD_0196
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020196 begin');
      await removeAssetPromise('uAdd020045', '');
      await addAssetPromise('uAdd020045', '中文密码', 'x5;y5;z5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020196 end');
    })

    /**
     * @tc.name   testKeyAdd020197
     * @tc.number SUB_ASSET_KEYADD_0197
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020197 begin');
      await removeAssetPromise('uAdd020046', '');
      await addAssetPromise('uAdd020046', 'pwd@#$%^&*()', 'x6;y6;z6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020197 end');
    })

    /**
     * @tc.name   testKeyAdd020198
     * @tc.number SUB_ASSET_KEYADD_0198
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020198 begin');
      await removeAssetPromise('uAdd020047', '');
      await addAssetPromise('uAdd020047', '12345678', 'x7;y7;z7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020198 end');
    })

    /**
     * @tc.name   testKeyAdd020199
     * @tc.number SUB_ASSET_KEYADD_0199
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020199 begin');
      await removeAssetPromise('uAdd020048', '');
      await addAssetPromise('uAdd020048', 'p1', 'x8;y8;z8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020199 end');
    })

    /**
     * @tc.name   testKeyAdd020200
     * @tc.number SUB_ASSET_KEYADD_0200
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020200 begin');
      await removeAssetPromise('uAdd020049', '');
      await addAssetPromise('uAdd020049', 'password8', 'x9;y9;z9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020200 end');
    })

    /**
     * @tc.name   testKeyAdd020201
     * @tc.number SUB_ASSET_KEYADD_0201
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020201 begin');
      await removeAssetPromise('uAdd020050', '');
      await addAssetPromise('uAdd020050', 'pwd_16_chars_123', 'x10;y10;z10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020201 end');
    })

    /**
     * @tc.name   testKeyAdd020202
     * @tc.number SUB_ASSET_KEYADD_0202
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020202 begin');
      await removeAssetPromise('uAdd020051', '');
      await addAssetPromise('uAdd020051', '中文密码', 'x11;y11;z11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020202 end');
    })

    /**
     * @tc.name   testKeyAdd020203
     * @tc.number SUB_ASSET_KEYADD_0203
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020203 begin');
      await removeAssetPromise('uAdd020052', '');
      await addAssetPromise('uAdd020052', 'pwd@#$%^&*()', 'x12;y12;z12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020203 end');
    })

    /**
     * @tc.name   testKeyAdd020204
     * @tc.number SUB_ASSET_KEYADD_0204
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020204 begin');
      await removeAssetPromise('uAdd020053', '');
      await addAssetPromise('uAdd020053', '12345678', 'x13;y13;z13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020204 end');
    })

    /**
     * @tc.name   testKeyAdd020205
     * @tc.number SUB_ASSET_KEYADD_0205
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020205 begin');
      await removeAssetPromise('uAdd020054', '');
      await addAssetPromise('uAdd020054', 'p1', 'x14;y14;z14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020205 end');
    })

    /**
     * @tc.name   testKeyAdd020206
     * @tc.number SUB_ASSET_KEYADD_0206
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020206 begin');
      await removeAssetPromise('uAdd020055', '');
      await addAssetPromise('uAdd020055', 'password8', 'x15;y15;z15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020206 end');
    })

    /**
     * @tc.name   testKeyAdd020207
     * @tc.number SUB_ASSET_KEYADD_0207
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020207 begin');
      await removeAssetPromise('uAdd020056', '');
      await addAssetPromise('uAdd020056', 'pwd_16_chars_123', 'x16;y16;z16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020207 end');
    })

    /**
     * @tc.name   testKeyAdd020208
     * @tc.number SUB_ASSET_KEYADD_0208
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020208 begin');
      await removeAssetPromise('uAdd020057', '');
      await addAssetPromise('uAdd020057', '中文密码', 'x17;y17;z17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020208 end');
    })

    /**
     * @tc.name   testKeyAdd020209
     * @tc.number SUB_ASSET_KEYADD_0209
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020209 begin');
      await removeAssetPromise('uAdd020058', '');
      await addAssetPromise('uAdd020058', 'pwd@#$%^&*()', 'x18;y18;z18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020209 end');
    })

    /**
     * @tc.name   testKeyAdd020210
     * @tc.number SUB_ASSET_KEYADD_0210
     * @tc.desc   合法值：三个标签保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020210 begin');
      await removeAssetPromise('uAdd020059', '');
      await addAssetPromise('uAdd020059', '12345678', 'x19;y19;z19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020210 end');
    })

    /**
     * @tc.name   testKeyAdd020211
     * @tc.number SUB_ASSET_KEYADD_0211
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020211 begin');
      await removeAssetPromise('uAdd020060', '');
      await addAssetPromise('uAdd020060', 'p1', 'a0;b0;c0;d0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020211 end');
    })

    /**
     * @tc.name   testKeyAdd020212
     * @tc.number SUB_ASSET_KEYADD_0212
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020212 begin');
      await removeAssetPromise('uAdd020061', '');
      await addAssetPromise('uAdd020061', 'password8', 'a1;b1;c1;d1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020212 end');
    })

    /**
     * @tc.name   testKeyAdd020213
     * @tc.number SUB_ASSET_KEYADD_0213
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020213 begin');
      await removeAssetPromise('uAdd020062', '');
      await addAssetPromise('uAdd020062', 'pwd_16_chars_123', 'a2;b2;c2;d2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020213 end');
    })

    /**
     * @tc.name   testKeyAdd020214
     * @tc.number SUB_ASSET_KEYADD_0214
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020214 begin');
      await removeAssetPromise('uAdd020063', '');
      await addAssetPromise('uAdd020063', '中文密码', 'a3;b3;c3;d3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020214 end');
    })

    /**
     * @tc.name   testKeyAdd020215
     * @tc.number SUB_ASSET_KEYADD_0215
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020215 begin');
      await removeAssetPromise('uAdd020064', '');
      await addAssetPromise('uAdd020064', 'pwd@#$%^&*()', 'a4;b4;c4;d4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020215 end');
    })

    /**
     * @tc.name   testKeyAdd020216
     * @tc.number SUB_ASSET_KEYADD_0216
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020216 begin');
      await removeAssetPromise('uAdd020065', '');
      await addAssetPromise('uAdd020065', '12345678', 'a5;b5;c5;d5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020216 end');
    })

    /**
     * @tc.name   testKeyAdd020217
     * @tc.number SUB_ASSET_KEYADD_0217
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020217 begin');
      await removeAssetPromise('uAdd020066', '');
      await addAssetPromise('uAdd020066', 'p1', 'a6;b6;c6;d6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020217 end');
    })

    /**
     * @tc.name   testKeyAdd020218
     * @tc.number SUB_ASSET_KEYADD_0218
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020218 begin');
      await removeAssetPromise('uAdd020067', '');
      await addAssetPromise('uAdd020067', 'password8', 'a7;b7;c7;d7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020218 end');
    })

    /**
     * @tc.name   testKeyAdd020219
     * @tc.number SUB_ASSET_KEYADD_0219
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020219 begin');
      await removeAssetPromise('uAdd020068', '');
      await addAssetPromise('uAdd020068', 'pwd_16_chars_123', 'a8;b8;c8;j8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020219 end');
    })

    /**
     * @tc.name   testKeyAdd020220
     * @tc.number SUB_ASSET_KEYADD_0220
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020220 begin');
      await removeAssetPromise('uAdd020069', '');
      await addAssetPromise('uAdd020069', '中文密码', 'a9;b9;c9;d9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020220 end');
    })

    /**
     * @tc.name   testKeyAdd020221
     * @tc.number SUB_ASSET_KEYADD_0221
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020221 begin');
      await removeAssetPromise('uAdd020070', '');
      await addAssetPromise('uAdd020070', 'pwd@#$%^&*()', 'a10;b10;c10;d10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020221 end');
    })

    /**
     * @tc.name   testKeyAdd020222
     * @tc.number SUB_ASSET_KEYADD_0222
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020222 begin');
      await removeAssetPromise('uAdd020071', '');
      await addAssetPromise('uAdd020071', '12345678', 'a11;b11;c11;d11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020222 end');
    })

    /**
     * @tc.name   testKeyAdd020223
     * @tc.number SUB_ASSET_KEYADD_0223
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020223 begin');
      await removeAssetPromise('uAdd020072', '');
      await addAssetPromise('uAdd020072', 'p1', 'a12;b12;c12;d12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020223 end');
    })

    /**
     * @tc.name   testKeyAdd020224
     * @tc.number SUB_ASSET_KEYADD_0224
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020224 begin');
      await removeAssetPromise('uAdd020073', '');
      await addAssetPromise('uAdd020073', 'password8', 'a13;b13;c13;d13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020224 end');
    })

    /**
     * @tc.name   testKeyAdd020225
     * @tc.number SUB_ASSET_KEYADD_0225
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020225 begin');
      await removeAssetPromise('uAdd020074', '');
      await addAssetPromise('uAdd020074', 'pwd_16_chars_123', 'a14;b14;c14;d14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020225 end');
    })

    /**
     * @tc.name   testKeyAdd020226
     * @tc.number SUB_ASSET_KEYADD_0226
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020226 begin');
      await removeAssetPromise('uAdd020075', '');
      await addAssetPromise('uAdd020075', '中文密码', 'a15;b15;c15;d15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020226 end');
    })

    /**
     * @tc.name   testKeyAdd020227
     * @tc.number SUB_ASSET_KEYADD_0227
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020227 begin');
      await removeAssetPromise('uAdd020076', '');
      await addAssetPromise('uAdd020076', 'pwd@#$%^&*()', 'a16;b16;c16;d16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020227 end');
    })

    /**
     * @tc.name   testKeyAdd020228
     * @tc.number SUB_ASSET_KEYADD_0228
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020228 begin');
      await removeAssetPromise('uAdd020077', '');
      await addAssetPromise('uAdd020077', '12345678', 'a17;b17;c17;d17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020228 end');
    })

    /**
     * @tc.name   testKeyAdd020229
     * @tc.number SUB_ASSET_KEYADD_0229
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020229 begin');
      await removeAssetPromise('uAdd020078', '');
      await addAssetPromise('uAdd020078', 'p1', 'a18;b18;c18;d18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020229 end');
    })

    /**
     * @tc.name   testKeyAdd020230
     * @tc.number SUB_ASSET_KEYADD_0230
     * @tc.desc   边界值：四个标签上界保存后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020230 begin');
      await removeAssetPromise('uAdd020079', '');
      await addAssetPromise('uAdd020079', 'password8', 'a19;b19;c19;d19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020230 end');
    })

    /**
     * @tc.name   testKeyAdd020231
     * @tc.number SUB_ASSET_KEYADD_0231
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020231 begin');
      await removeAssetPromise('uAdd020080', '');
      await addAssetPromise('uAdd020080', 'pwd_16_chars_123', 'a0;b0;c0;d0;e0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020231 end');
    })

    /**
     * @tc.name   testKeyAdd020232
     * @tc.number SUB_ASSET_KEYADD_0232
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020232 begin');
      await removeAssetPromise('uAdd020081', '');
      await addAssetPromise('uAdd020081', '中文密码', 'a1;b1;c1;d1;e1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020232 end');
    })

    /**
     * @tc.name   testKeyAdd020233
     * @tc.number SUB_ASSET_KEYADD_0233
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020233 begin');
      await removeAssetPromise('uAdd020082', '');
      await addAssetPromise('uAdd020082', 'pwd@#$%^&*()', 'a2;b2;c2;d2;e2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020233 end');
    })

    /**
     * @tc.name   testKeyAdd020234
     * @tc.number SUB_ASSET_KEYADD_0234
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020234 begin');
      await removeAssetPromise('uAdd020083', '');
      await addAssetPromise('uAdd020083', '12345678', 'a3;b3;c3;d3;e3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020234 end');
    })

    /**
     * @tc.name   testKeyAdd020235
     * @tc.number SUB_ASSET_KEYADD_0235
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020235 begin');
      await removeAssetPromise('uAdd020084', '');
      await addAssetPromise('uAdd020084', 'p1', 'a4;b4;c4;d4;e4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020235 end');
    })

    /**
     * @tc.name   testKeyAdd020236
     * @tc.number SUB_ASSET_KEYADD_0236
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020236 begin');
      await removeAssetPromise('uAdd020085', '');
      await addAssetPromise('uAdd020085', 'password8', 'a5;b5;c5;d5;e5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020236 end');
    })

    /**
     * @tc.name   testKeyAdd020237
     * @tc.number SUB_ASSET_KEYADD_0237
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020237 begin');
      await removeAssetPromise('uAdd020086', '');
      await addAssetPromise('uAdd020086', 'pwd_16_chars_123', 'a6;b6;c6;d6;e6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020237 end');
    })

    /**
     * @tc.name   testKeyAdd020238
     * @tc.number SUB_ASSET_KEYADD_0238
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020238 begin');
      await removeAssetPromise('uAdd020087', '');
      await addAssetPromise('uAdd020087', '中文密码', 'a7;b7;c7;d7;e7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020238 end');
    })

    /**
     * @tc.name   testKeyAdd020239
     * @tc.number SUB_ASSET_KEYADD_0239
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020239 begin');
      await removeAssetPromise('uAdd020088', '');
      await addAssetPromise('uAdd020088', 'pwd@#$%^&*()', 'a8;b8;c8;j8;e8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020239 end');
    })

    /**
     * @tc.name   testKeyAdd020240
     * @tc.number SUB_ASSET_KEYADD_0240
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020240 begin');
      await removeAssetPromise('uAdd020089', '');
      await addAssetPromise('uAdd020089', '12345678', 'a9;b9;c9;d9;e9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020240 end');
    })

    /**
     * @tc.name   testKeyAdd020241
     * @tc.number SUB_ASSET_KEYADD_0241
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020241 begin');
      await removeAssetPromise('uAdd020090', '');
      await addAssetPromise('uAdd020090', 'p1', 'a10;b10;c10;d10;e10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020241 end');
    })

    /**
     * @tc.name   testKeyAdd020242
     * @tc.number SUB_ASSET_KEYADD_0242
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020242 begin');
      await removeAssetPromise('uAdd020091', '');
      await addAssetPromise('uAdd020091', 'password8', 'a11;b11;c11;d11;e11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020242 end');
    })

    /**
     * @tc.name   testKeyAdd020243
     * @tc.number SUB_ASSET_KEYADD_0243
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020243 begin');
      await removeAssetPromise('uAdd020092', '');
      await addAssetPromise('uAdd020092', 'pwd_16_chars_123', 'a12;b12;c12;d12;e12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020243 end');
    })

    /**
     * @tc.name   testKeyAdd020244
     * @tc.number SUB_ASSET_KEYADD_0244
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020244 begin');
      await removeAssetPromise('uAdd020093', '');
      await addAssetPromise('uAdd020093', '中文密码', 'a13;b13;c13;d13;e13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020244 end');
    })

    /**
     * @tc.name   testKeyAdd020245
     * @tc.number SUB_ASSET_KEYADD_0245
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020245 begin');
      await removeAssetPromise('uAdd020094', '');
      await addAssetPromise('uAdd020094', 'pwd@#$%^&*()', 'a14;b14;c14;d14;e14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020245 end');
    })

    /**
     * @tc.name   testKeyAdd020246
     * @tc.number SUB_ASSET_KEYADD_0246
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020246 begin');
      await removeAssetPromise('uAdd020095', '');
      await addAssetPromise('uAdd020095', '12345678', 'a15;b15;c15;d15;e15');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020246 end');
    })

    /**
     * @tc.name   testKeyAdd020247
     * @tc.number SUB_ASSET_KEYADD_0247
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020247 begin');
      await removeAssetPromise('uAdd020096', '');
      await addAssetPromise('uAdd020096', 'p1', 'a16;b16;c16;d16;e16');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020247 end');
    })

    /**
     * @tc.name   testKeyAdd020248
     * @tc.number SUB_ASSET_KEYADD_0248
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020248 begin');
      await removeAssetPromise('uAdd020097', '');
      await addAssetPromise('uAdd020097', 'password8', 'a17;b17;c17;d17;e17');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020248 end');
    })

    /**
     * @tc.name   testKeyAdd020249
     * @tc.number SUB_ASSET_KEYADD_0249
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020249 begin');
      await removeAssetPromise('uAdd020098', '');
      await addAssetPromise('uAdd020098', 'pwd_16_chars_123', 'a18;b18;c18;d18;e18');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020249 end');
    })

    /**
     * @tc.name   testKeyAdd020250
     * @tc.number SUB_ASSET_KEYADD_0250
     * @tc.desc   非法值：五个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020250 begin');
      await removeAssetPromise('uAdd020099', '');
      await addAssetPromise('uAdd020099', '中文密码', 'a19;b19;c19;d19;e19');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020250 end');
    })

    /**
     * @tc.name   testKeyAdd020251
     * @tc.number SUB_ASSET_KEYADD_0251
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020251 begin');
      await removeAssetPromise('uAdd020100', '');
      await addAssetPromise('uAdd020100', 'pwd@#$%^&*()', 'a0;b0;c0;d0;e0;f0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020251 end');
    })

    /**
     * @tc.name   testKeyAdd020252
     * @tc.number SUB_ASSET_KEYADD_0252
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020252 begin');
      await removeAssetPromise('uAdd020101', '');
      await addAssetPromise('uAdd020101', '12345678', 'a1;b1;c1;d1;e1;f1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020252 end');
    })

    /**
     * @tc.name   testKeyAdd020253
     * @tc.number SUB_ASSET_KEYADD_0253
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020253 begin');
      await removeAssetPromise('uAdd020102', '');
      await addAssetPromise('uAdd020102', 'p1', 'a2;b2;c2;d2;e2;f2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020253 end');
    })

    /**
     * @tc.name   testKeyAdd020254
     * @tc.number SUB_ASSET_KEYADD_0254
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020254 begin');
      await removeAssetPromise('uAdd020103', '');
      await addAssetPromise('uAdd020103', 'password8', 'a3;b3;c3;d3;e3;f3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020254 end');
    })

    /**
     * @tc.name   testKeyAdd020255
     * @tc.number SUB_ASSET_KEYADD_0255
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020255 begin');
      await removeAssetPromise('uAdd020104', '');
      await addAssetPromise('uAdd020104', 'pwd_16_chars_123', 'a4;b4;c4;d4;e4;f4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020255 end');
    })

    /**
     * @tc.name   testKeyAdd020256
     * @tc.number SUB_ASSET_KEYADD_0256
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020256 begin');
      await removeAssetPromise('uAdd020105', '');
      await addAssetPromise('uAdd020105', '中文密码', 'a5;b5;c5;d5;e5;f5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020256 end');
    })

    /**
     * @tc.name   testKeyAdd020257
     * @tc.number SUB_ASSET_KEYADD_0257
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020257 begin');
      await removeAssetPromise('uAdd020106', '');
      await addAssetPromise('uAdd020106', 'pwd@#$%^&*()', 'a6;b6;c6;d6;e6;f6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020257 end');
    })

    /**
     * @tc.name   testKeyAdd020258
     * @tc.number SUB_ASSET_KEYADD_0258
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020258 begin');
      await removeAssetPromise('uAdd020107', '');
      await addAssetPromise('uAdd020107', '12345678', 'a7;b7;c7;d7;e7;f7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020258 end');
    })

    /**
     * @tc.name   testKeyAdd020259
     * @tc.number SUB_ASSET_KEYADD_0259
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020259 begin');
      await removeAssetPromise('uAdd020108', '');
      await addAssetPromise('uAdd020108', 'p1', 'a8;b8;c8;j8;e8;f8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020259 end');
    })

    /**
     * @tc.name   testKeyAdd020260
     * @tc.number SUB_ASSET_KEYADD_0260
     * @tc.desc   非法值：六个标签超上界提前返回不落库
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020260 begin');
      await removeAssetPromise('uAdd020109', '');
      await addAssetPromise('uAdd020109', 'password8', 'a9;b9;c9;d9;e9;f9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(0));
      expect(result.length).assertEqual(0);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('0'));
      expect(String(result.length)).assertEqual('0');
      await removeAssetPromise('uAdd020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020260 end');
    })

    /**
     * @tc.name   testKeyAdd020261
     * @tc.number SUB_ASSET_KEYADD_0261
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020261 begin');
      await removeAssetPromise('uAdd020110', '');
      await addAssetPromise('uAdd020110', 'pwd_16_chars_123', 'dup0;dup0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020261 end');
    })

    /**
     * @tc.name   testKeyAdd020262
     * @tc.number SUB_ASSET_KEYADD_0262
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020262 begin');
      await removeAssetPromise('uAdd020111', '');
      await addAssetPromise('uAdd020111', '中文密码', 'dup1;dup1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020262 end');
    })

    /**
     * @tc.name   testKeyAdd020263
     * @tc.number SUB_ASSET_KEYADD_0263
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020263 begin');
      await removeAssetPromise('uAdd020112', '');
      await addAssetPromise('uAdd020112', 'pwd@#$%^&*()', 'dup2;dup2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020263 end');
    })

    /**
     * @tc.name   testKeyAdd020264
     * @tc.number SUB_ASSET_KEYADD_0264
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020264 begin');
      await removeAssetPromise('uAdd020113', '');
      await addAssetPromise('uAdd020113', '12345678', 'dup3;dup3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020264 end');
    })

    /**
     * @tc.name   testKeyAdd020265
     * @tc.number SUB_ASSET_KEYADD_0265
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020265 begin');
      await removeAssetPromise('uAdd020114', '');
      await addAssetPromise('uAdd020114', 'p1', 'dup4;dup4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020265 end');
    })

    /**
     * @tc.name   testKeyAdd020266
     * @tc.number SUB_ASSET_KEYADD_0266
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020266 begin');
      await removeAssetPromise('uAdd020115', '');
      await addAssetPromise('uAdd020115', 'password8', 'dup5;dup5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020266 end');
    })

    /**
     * @tc.name   testKeyAdd020267
     * @tc.number SUB_ASSET_KEYADD_0267
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020267 begin');
      await removeAssetPromise('uAdd020116', '');
      await addAssetPromise('uAdd020116', 'pwd_16_chars_123', 'dup6;dup6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020267 end');
    })

    /**
     * @tc.name   testKeyAdd020268
     * @tc.number SUB_ASSET_KEYADD_0268
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020268 begin');
      await removeAssetPromise('uAdd020117', '');
      await addAssetPromise('uAdd020117', '中文密码', 'dup7;dup7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020268 end');
    })

    /**
     * @tc.name   testKeyAdd020269
     * @tc.number SUB_ASSET_KEYADD_0269
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020269 begin');
      await removeAssetPromise('uAdd020118', '');
      await addAssetPromise('uAdd020118', 'pwd@#$%^&*()', 'dup8;dup8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020269 end');
    })

    /**
     * @tc.name   testKeyAdd020270
     * @tc.number SUB_ASSET_KEYADD_0270
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020270 begin');
      await removeAssetPromise('uAdd020119', '');
      await addAssetPromise('uAdd020119', '12345678', 'dup9;dup9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020270 end');
    })

    /**
     * @tc.name   testKeyAdd020271
     * @tc.number SUB_ASSET_KEYADD_0271
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020271 begin');
      await removeAssetPromise('uAdd020120', '');
      await addAssetPromise('uAdd020120', 'p1', 'dup10;dup10');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020271 end');
    })

    /**
     * @tc.name   testKeyAdd020272
     * @tc.number SUB_ASSET_KEYADD_0272
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020272 begin');
      await removeAssetPromise('uAdd020121', '');
      await addAssetPromise('uAdd020121', 'password8', 'dup11;dup11');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020272 end');
    })

    /**
     * @tc.name   testKeyAdd020273
     * @tc.number SUB_ASSET_KEYADD_0273
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020273 begin');
      await removeAssetPromise('uAdd020122', '');
      await addAssetPromise('uAdd020122', 'pwd_16_chars_123', 'dup12;dup12');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020273 end');
    })

    /**
     * @tc.name   testKeyAdd020274
     * @tc.number SUB_ASSET_KEYADD_0274
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020274 begin');
      await removeAssetPromise('uAdd020123', '');
      await addAssetPromise('uAdd020123', '中文密码', 'dup13;dup13');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020274 end');
    })

    /**
     * @tc.name   testKeyAdd020275
     * @tc.number SUB_ASSET_KEYADD_0275
     * @tc.desc   边界值：重复标签去重后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020275 begin');
      await removeAssetPromise('uAdd020124', '');
      await addAssetPromise('uAdd020124', 'pwd@#$%^&*()', 'dup14;dup14');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020275 end');
    })

    /**
     * @tc.name   testKeyAdd020276
     * @tc.number SUB_ASSET_KEYADD_0276
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020276 begin');
      await removeAssetPromise('uAdd020125', '');
      await addAssetPromise('uAdd020125', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020276 end');
    })

    /**
     * @tc.name   testKeyAdd020277
     * @tc.number SUB_ASSET_KEYADD_0277
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020277 begin');
      await removeAssetPromise('uAdd020126', '');
      await addAssetPromise('uAdd020126', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020277 end');
    })

    /**
     * @tc.name   testKeyAdd020278
     * @tc.number SUB_ASSET_KEYADD_0278
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020278 begin');
      await removeAssetPromise('uAdd020127', '');
      await addAssetPromise('uAdd020127', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020278 end');
    })

    /**
     * @tc.name   testKeyAdd020279
     * @tc.number SUB_ASSET_KEYADD_0279
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020279 begin');
      await removeAssetPromise('uAdd020128', '');
      await addAssetPromise('uAdd020128', 'pwd_16_chars_123', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020279 end');
    })

    /**
     * @tc.name   testKeyAdd020280
     * @tc.number SUB_ASSET_KEYADD_0280
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020280 begin');
      await removeAssetPromise('uAdd020129', '');
      await addAssetPromise('uAdd020129', '中文密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020280 end');
    })

    /**
     * @tc.name   testKeyAdd020281
     * @tc.number SUB_ASSET_KEYADD_0281
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020281 begin');
      await removeAssetPromise('uAdd020130', '');
      await addAssetPromise('uAdd020130', 'pwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020281 end');
    })

    /**
     * @tc.name   testKeyAdd020282
     * @tc.number SUB_ASSET_KEYADD_0282
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020282 begin');
      await removeAssetPromise('uAdd020131', '');
      await addAssetPromise('uAdd020131', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020282 end');
    })

    /**
     * @tc.name   testKeyAdd020283
     * @tc.number SUB_ASSET_KEYADD_0283
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020283 begin');
      await removeAssetPromise('uAdd020132', '');
      await addAssetPromise('uAdd020132', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020283 end');
    })

    /**
     * @tc.name   testKeyAdd020284
     * @tc.number SUB_ASSET_KEYADD_0284
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020284 begin');
      await removeAssetPromise('uAdd020133', '');
      await addAssetPromise('uAdd020133', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020284 end');
    })

    /**
     * @tc.name   testKeyAdd020285
     * @tc.number SUB_ASSET_KEYADD_0285
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020285 begin');
      await removeAssetPromise('uAdd020134', '');
      await addAssetPromise('uAdd020134', 'pwd_16_chars_123', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020285 end');
    })

    /**
     * @tc.name   testKeyAdd020286
     * @tc.number SUB_ASSET_KEYADD_0286
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020286 begin');
      await removeAssetPromise('uAdd020135', '');
      await addAssetPromise('uAdd020135', '中文密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020286 end');
    })

    /**
     * @tc.name   testKeyAdd020287
     * @tc.number SUB_ASSET_KEYADD_0287
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020287 begin');
      await removeAssetPromise('uAdd020136', '');
      await addAssetPromise('uAdd020136', 'pwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020287 end');
    })

    /**
     * @tc.name   testKeyAdd020288
     * @tc.number SUB_ASSET_KEYADD_0288
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020288 begin');
      await removeAssetPromise('uAdd020137', '');
      await addAssetPromise('uAdd020137', '12345678', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020288 end');
    })

    /**
     * @tc.name   testKeyAdd020289
     * @tc.number SUB_ASSET_KEYADD_0289
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020289 begin');
      await removeAssetPromise('uAdd020138', '');
      await addAssetPromise('uAdd020138', 'p1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020289 end');
    })

    /**
     * @tc.name   testKeyAdd020290
     * @tc.number SUB_ASSET_KEYADD_0290
     * @tc.desc   边界值：空标签串保存成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020290 begin');
      await removeAssetPromise('uAdd020139', '');
      await addAssetPromise('uAdd020139', 'password8', '');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020290 end');
    })

    /**
     * @tc.name   testKeyAdd020291
     * @tc.number SUB_ASSET_KEYADD_0291
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020291 begin');
      await removeAssetPromise('uAdd020140', '');
      await addAssetPromise('uAdd020140', 'pwd_16_chars_123', 'a0;;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020291 end');
    })

    /**
     * @tc.name   testKeyAdd020292
     * @tc.number SUB_ASSET_KEYADD_0292
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020292 begin');
      await removeAssetPromise('uAdd020141', '');
      await addAssetPromise('uAdd020141', '中文密码', 'a1;;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020292 end');
    })

    /**
     * @tc.name   testKeyAdd020293
     * @tc.number SUB_ASSET_KEYADD_0293
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020293 begin');
      await removeAssetPromise('uAdd020142', '');
      await addAssetPromise('uAdd020142', 'pwd@#$%^&*()', 'a2;;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020293 end');
    })

    /**
     * @tc.name   testKeyAdd020294
     * @tc.number SUB_ASSET_KEYADD_0294
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020294 begin');
      await removeAssetPromise('uAdd020143', '');
      await addAssetPromise('uAdd020143', '12345678', 'a3;;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020294 end');
    })

    /**
     * @tc.name   testKeyAdd020295
     * @tc.number SUB_ASSET_KEYADD_0295
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020295 begin');
      await removeAssetPromise('uAdd020144', '');
      await addAssetPromise('uAdd020144', 'p1', 'a4;;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020295 end');
    })

    /**
     * @tc.name   testKeyAdd020296
     * @tc.number SUB_ASSET_KEYADD_0296
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020296 begin');
      await removeAssetPromise('uAdd020145', '');
      await addAssetPromise('uAdd020145', 'password8', 'a5;;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020296 end');
    })

    /**
     * @tc.name   testKeyAdd020297
     * @tc.number SUB_ASSET_KEYADD_0297
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020297 begin');
      await removeAssetPromise('uAdd020146', '');
      await addAssetPromise('uAdd020146', 'pwd_16_chars_123', 'a6;;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020297 end');
    })

    /**
     * @tc.name   testKeyAdd020298
     * @tc.number SUB_ASSET_KEYADD_0298
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020298 begin');
      await removeAssetPromise('uAdd020147', '');
      await addAssetPromise('uAdd020147', '中文密码', 'a7;;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020298 end');
    })

    /**
     * @tc.name   testKeyAdd020299
     * @tc.number SUB_ASSET_KEYADD_0299
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020299 begin');
      await removeAssetPromise('uAdd020148', '');
      await addAssetPromise('uAdd020148', 'pwd@#$%^&*()', 'a8;;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020299 end');
    })

    /**
     * @tc.name   testKeyAdd020300
     * @tc.number SUB_ASSET_KEYADD_0300
     * @tc.desc   边界值：含空段标签过滤后保存
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyAdd020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020300 begin');
      await removeAssetPromise('uAdd020149', '');
      await addAssetPromise('uAdd020149', '12345678', 'a9;;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uAdd020149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uAdd020149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyAdd020300 end');
    })

  })
}
