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
import {
  addAssetPromise,
  queryAssetPromise,
  removeAssetPromise,
  updateAssetPromise
} from '../../../main/ets/model/AssetModel';
const LOG_DOMAIN: number = 0xF811;
const LOG_TAG: string = '[Sample_Asset]';

export default function keyUpdVolume02() {
  describe('KeyUpdVolume02Test', () => {

    /**
     * @tc.name   testKeyUpd020151
     * @tc.number SUB_ASSET_KEYUPD_0151
     * @tc.desc   更新密码与标签后查询回读新值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020151', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020151 begin');
      const alias: string = 'uUpdAnchor01';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'oldPwd', 'oldLabel');
      await updateAssetPromise(alias, 'newPwd', 'newLabel');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual('newPwd');
      expect(rows[0].get('label')).assertEqual('newLabel');
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020151 end');
    })

    /**
     * @tc.name   testKeyUpd020152
     * @tc.number SUB_ASSET_KEYUPD_0152
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020152', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020152 begin');
      await removeAssetPromise('uUpd020001', '');
      await addAssetPromise('uUpd020001', 'password8', 'g1');
      await updateAssetPromise('uUpd020001', 'newPassword', 'n1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020152 end');
    })

    /**
     * @tc.name   testKeyUpd020153
     * @tc.number SUB_ASSET_KEYUPD_0153
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020153', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020153 begin');
      await removeAssetPromise('uUpd020002', '');
      await addAssetPromise('uUpd020002', 'pwd_16_chars_123', 'g2');
      await updateAssetPromise('uUpd020002', 'npwd_16_chars_456', 'n2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020153 end');
    })

    /**
     * @tc.name   testKeyUpd020154
     * @tc.number SUB_ASSET_KEYUPD_0154
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020154', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020154 begin');
      await removeAssetPromise('uUpd020003', '');
      await addAssetPromise('uUpd020003', '中文密码', 'g3');
      await updateAssetPromise('uUpd020003', '新密码', 'n3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020154 end');
    })

    /**
     * @tc.name   testKeyUpd020155
     * @tc.number SUB_ASSET_KEYUPD_0155
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020155', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020155 begin');
      await removeAssetPromise('uUpd020004', '');
      await addAssetPromise('uUpd020004', 'pwd@#$%^&*()', 'g4');
      await updateAssetPromise('uUpd020004', 'npwd@#$%^&*()', 'n4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020155 end');
    })

    /**
     * @tc.name   testKeyUpd020156
     * @tc.number SUB_ASSET_KEYUPD_0156
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020156', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020156 begin');
      await removeAssetPromise('uUpd020005', '');
      await addAssetPromise('uUpd020005', '12345678', 'l5');
      await updateAssetPromise('uUpd020005', '87654321', 'n5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020156 end');
    })

    /**
     * @tc.name   testKeyUpd020157
     * @tc.number SUB_ASSET_KEYUPD_0157
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020157', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020157 begin');
      await removeAssetPromise('uUpd020006', '');
      await addAssetPromise('uUpd020006', 'p1', 'l6');
      await updateAssetPromise('uUpd020006', 'np1', 'n6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020157 end');
    })

    /**
     * @tc.name   testKeyUpd020158
     * @tc.number SUB_ASSET_KEYUPD_0158
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020158', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020158 begin');
      await removeAssetPromise('uUpd020007', '');
      await addAssetPromise('uUpd020007', 'password8', 'l7');
      await updateAssetPromise('uUpd020007', 'newPassword', 'n7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020158 end');
    })

    /**
     * @tc.name   testKeyUpd020159
     * @tc.number SUB_ASSET_KEYUPD_0159
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020159', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020159 begin');
      await removeAssetPromise('uUpd020008', '');
      await addAssetPromise('uUpd020008', 'pwd_16_chars_123', 'l8');
      await updateAssetPromise('uUpd020008', 'npwd_16_chars_456', 'n8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020159 end');
    })

    /**
     * @tc.name   testKeyUpd020160
     * @tc.number SUB_ASSET_KEYUPD_0160
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020160', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020160 begin');
      await removeAssetPromise('uUpd020009', '');
      await addAssetPromise('uUpd020009', '中文密码', 'l9');
      await updateAssetPromise('uUpd020009', '新密码', 'n9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020160 end');
    })

    /**
     * @tc.name   testKeyUpd020161
     * @tc.number SUB_ASSET_KEYUPD_0161
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020161', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020161 begin');
      await removeAssetPromise('uUpd020010', '');
      await addAssetPromise('uUpd020010', 'pwd@#$%^&*()', 'l10');
      await updateAssetPromise('uUpd020010', 'npwd@#$%^&*()', 'n10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020161 end');
    })

    /**
     * @tc.name   testKeyUpd020162
     * @tc.number SUB_ASSET_KEYUPD_0162
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020162', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020162 begin');
      await removeAssetPromise('uUpd020011', '');
      await addAssetPromise('uUpd020011', '12345678', 'l11');
      await updateAssetPromise('uUpd020011', '87654321', 'n11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020162 end');
    })

    /**
     * @tc.name   testKeyUpd020163
     * @tc.number SUB_ASSET_KEYUPD_0163
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020163', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020163 begin');
      await removeAssetPromise('uUpd020012', '');
      await addAssetPromise('uUpd020012', 'p1', 'l12');
      await updateAssetPromise('uUpd020012', 'np1', 'n12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020163 end');
    })

    /**
     * @tc.name   testKeyUpd020164
     * @tc.number SUB_ASSET_KEYUPD_0164
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020164', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020164 begin');
      await removeAssetPromise('uUpd020013', '');
      await addAssetPromise('uUpd020013', 'password8', 'l13');
      await updateAssetPromise('uUpd020013', 'newPassword', 'n13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020164 end');
    })

    /**
     * @tc.name   testKeyUpd020165
     * @tc.number SUB_ASSET_KEYUPD_0165
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020165', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020165 begin');
      await removeAssetPromise('uUpd020014', '');
      await addAssetPromise('uUpd020014', 'pwd_16_chars_123', 'l14');
      await updateAssetPromise('uUpd020014', 'npwd_16_chars_456', 'n14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020165 end');
    })

    /**
     * @tc.name   testKeyUpd020166
     * @tc.number SUB_ASSET_KEYUPD_0166
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020166', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020166 begin');
      await removeAssetPromise('uUpd020015', '');
      await addAssetPromise('uUpd020015', '中文密码', 'l15');
      await updateAssetPromise('uUpd020015', '新密码', 'n15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020166 end');
    })

    /**
     * @tc.name   testKeyUpd020167
     * @tc.number SUB_ASSET_KEYUPD_0167
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020167', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020167 begin');
      await removeAssetPromise('uUpd020016', '');
      await addAssetPromise('uUpd020016', 'pwd@#$%^&*()', 'l16');
      await updateAssetPromise('uUpd020016', 'npwd@#$%^&*()', 'n16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020167 end');
    })

    /**
     * @tc.name   testKeyUpd020168
     * @tc.number SUB_ASSET_KEYUPD_0168
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020168', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020168 begin');
      await removeAssetPromise('uUpd020017', '');
      await addAssetPromise('uUpd020017', '12345678', 'l17');
      await updateAssetPromise('uUpd020017', '87654321', 'n17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020168 end');
    })

    /**
     * @tc.name   testKeyUpd020169
     * @tc.number SUB_ASSET_KEYUPD_0169
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020169', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020169 begin');
      await removeAssetPromise('uUpd020018', '');
      await addAssetPromise('uUpd020018', 'p1', 'l18');
      await updateAssetPromise('uUpd020018', 'np1', 'n18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020169 end');
    })

    /**
     * @tc.name   testKeyUpd020170
     * @tc.number SUB_ASSET_KEYUPD_0170
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020170', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020170 begin');
      await removeAssetPromise('uUpd020019', '');
      await addAssetPromise('uUpd020019', 'password8', 'l19');
      await updateAssetPromise('uUpd020019', 'newPassword', 'n19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020170 end');
    })

    /**
     * @tc.name   testKeyUpd020171
     * @tc.number SUB_ASSET_KEYUPD_0171
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020171', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020171 begin');
      await removeAssetPromise('uUpd020020', '');
      await addAssetPromise('uUpd020020', 'pwd_16_chars_123', 'l20');
      await updateAssetPromise('uUpd020020', 'npwd_16_chars_456', 'n20');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020171 end');
    })

    /**
     * @tc.name   testKeyUpd020172
     * @tc.number SUB_ASSET_KEYUPD_0172
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020172', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020172 begin');
      await removeAssetPromise('uUpd020021', '');
      await addAssetPromise('uUpd020021', '中文密码', 'l21');
      await updateAssetPromise('uUpd020021', '新密码', 'n21');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020172 end');
    })

    /**
     * @tc.name   testKeyUpd020173
     * @tc.number SUB_ASSET_KEYUPD_0173
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020173', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020173 begin');
      await removeAssetPromise('uUpd020022', '');
      await addAssetPromise('uUpd020022', 'pwd@#$%^&*()', 'l22');
      await updateAssetPromise('uUpd020022', 'npwd@#$%^&*()', 'n22');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020173 end');
    })

    /**
     * @tc.name   testKeyUpd020174
     * @tc.number SUB_ASSET_KEYUPD_0174
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020174', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020174 begin');
      await removeAssetPromise('uUpd020023', '');
      await addAssetPromise('uUpd020023', '12345678', 'l23');
      await updateAssetPromise('uUpd020023', '87654321', 'n23');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020174 end');
    })

    /**
     * @tc.name   testKeyUpd020175
     * @tc.number SUB_ASSET_KEYUPD_0175
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020175', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020175 begin');
      await removeAssetPromise('uUpd020024', '');
      await addAssetPromise('uUpd020024', 'p1', 'l24');
      await updateAssetPromise('uUpd020024', 'np1', 'n24');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020175 end');
    })

    /**
     * @tc.name   testKeyUpd020176
     * @tc.number SUB_ASSET_KEYUPD_0176
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020176', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020176 begin');
      await removeAssetPromise('uUpd020025', '');
      await addAssetPromise('uUpd020025', 'password8', 'l25');
      await updateAssetPromise('uUpd020025', 'newPassword', 'n25');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020176 end');
    })

    /**
     * @tc.name   testKeyUpd020177
     * @tc.number SUB_ASSET_KEYUPD_0177
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020177', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020177 begin');
      await removeAssetPromise('uUpd020026', '');
      await addAssetPromise('uUpd020026', 'pwd_16_chars_123', 'l26');
      await updateAssetPromise('uUpd020026', 'npwd_16_chars_456', 'n26');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020177 end');
    })

    /**
     * @tc.name   testKeyUpd020178
     * @tc.number SUB_ASSET_KEYUPD_0178
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020178', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020178 begin');
      await removeAssetPromise('uUpd020027', '');
      await addAssetPromise('uUpd020027', '中文密码', 'l27');
      await updateAssetPromise('uUpd020027', '新密码', 'n27');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020178 end');
    })

    /**
     * @tc.name   testKeyUpd020179
     * @tc.number SUB_ASSET_KEYUPD_0179
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020179', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020179 begin');
      await removeAssetPromise('uUpd020028', '');
      await addAssetPromise('uUpd020028', 'pwd@#$%^&*()', 'l28');
      await updateAssetPromise('uUpd020028', 'npwd@#$%^&*()', 'n28');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020179 end');
    })

    /**
     * @tc.name   testKeyUpd020180
     * @tc.number SUB_ASSET_KEYUPD_0180
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020180', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020180 begin');
      await removeAssetPromise('uUpd020029', '');
      await addAssetPromise('uUpd020029', '12345678', 'l29');
      await updateAssetPromise('uUpd020029', '87654321', 'n29');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020180 end');
    })

    /**
     * @tc.name   testKeyUpd020181
     * @tc.number SUB_ASSET_KEYUPD_0181
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020181', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020181 begin');
      await removeAssetPromise('uUpd020030', '');
      await addAssetPromise('uUpd020030', 'p1', 'g0');
      await updateAssetPromise('uUpd020030', 'np1', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020181 end');
    })

    /**
     * @tc.name   testKeyUpd020182
     * @tc.number SUB_ASSET_KEYUPD_0182
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020182', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020182 begin');
      await removeAssetPromise('uUpd020031', '');
      await addAssetPromise('uUpd020031', 'password8', 'g1');
      await updateAssetPromise('uUpd020031', 'newPassword', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020182 end');
    })

    /**
     * @tc.name   testKeyUpd020183
     * @tc.number SUB_ASSET_KEYUPD_0183
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020183', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020183 begin');
      await removeAssetPromise('uUpd020032', '');
      await addAssetPromise('uUpd020032', 'pwd_16_chars_123', 'g2');
      await updateAssetPromise('uUpd020032', 'npwd_16_chars_456', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020183 end');
    })

    /**
     * @tc.name   testKeyUpd020184
     * @tc.number SUB_ASSET_KEYUPD_0184
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020184', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020184 begin');
      await removeAssetPromise('uUpd020033', '');
      await addAssetPromise('uUpd020033', '中文密码', 'g3');
      await updateAssetPromise('uUpd020033', '新密码', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020184 end');
    })

    /**
     * @tc.name   testKeyUpd020185
     * @tc.number SUB_ASSET_KEYUPD_0185
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020185', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020185 begin');
      await removeAssetPromise('uUpd020034', '');
      await addAssetPromise('uUpd020034', 'pwd@#$%^&*()', 'g4');
      await updateAssetPromise('uUpd020034', 'npwd@#$%^&*()', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020185 end');
    })

    /**
     * @tc.name   testKeyUpd020186
     * @tc.number SUB_ASSET_KEYUPD_0186
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020186', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020186 begin');
      await removeAssetPromise('uUpd020035', '');
      await addAssetPromise('uUpd020035', '12345678', 'l5');
      await updateAssetPromise('uUpd020035', '87654321', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020186 end');
    })

    /**
     * @tc.name   testKeyUpd020187
     * @tc.number SUB_ASSET_KEYUPD_0187
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020187', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020187 begin');
      await removeAssetPromise('uUpd020036', '');
      await addAssetPromise('uUpd020036', 'p1', 'l6');
      await updateAssetPromise('uUpd020036', 'np1', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020187 end');
    })

    /**
     * @tc.name   testKeyUpd020188
     * @tc.number SUB_ASSET_KEYUPD_0188
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020188', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020188 begin');
      await removeAssetPromise('uUpd020037', '');
      await addAssetPromise('uUpd020037', 'password8', 'l7');
      await updateAssetPromise('uUpd020037', 'newPassword', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020188 end');
    })

    /**
     * @tc.name   testKeyUpd020189
     * @tc.number SUB_ASSET_KEYUPD_0189
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020189', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020189 begin');
      await removeAssetPromise('uUpd020038', '');
      await addAssetPromise('uUpd020038', 'pwd_16_chars_123', 'l8');
      await updateAssetPromise('uUpd020038', 'npwd_16_chars_456', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020189 end');
    })

    /**
     * @tc.name   testKeyUpd020190
     * @tc.number SUB_ASSET_KEYUPD_0190
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020190', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020190 begin');
      await removeAssetPromise('uUpd020039', '');
      await addAssetPromise('uUpd020039', '中文密码', 'l9');
      await updateAssetPromise('uUpd020039', '新密码', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020190 end');
    })

    /**
     * @tc.name   testKeyUpd020191
     * @tc.number SUB_ASSET_KEYUPD_0191
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020191', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020191 begin');
      await removeAssetPromise('uUpd020040', '');
      await addAssetPromise('uUpd020040', 'pwd@#$%^&*()', 'l10');
      await updateAssetPromise('uUpd020040', 'npwd@#$%^&*()', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020191 end');
    })

    /**
     * @tc.name   testKeyUpd020192
     * @tc.number SUB_ASSET_KEYUPD_0192
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020192', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020192 begin');
      await removeAssetPromise('uUpd020041', '');
      await addAssetPromise('uUpd020041', '12345678', 'l11');
      await updateAssetPromise('uUpd020041', '87654321', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020192 end');
    })

    /**
     * @tc.name   testKeyUpd020193
     * @tc.number SUB_ASSET_KEYUPD_0193
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020193', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020193 begin');
      await removeAssetPromise('uUpd020042', '');
      await addAssetPromise('uUpd020042', 'p1', 'l12');
      await updateAssetPromise('uUpd020042', 'np1', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020193 end');
    })

    /**
     * @tc.name   testKeyUpd020194
     * @tc.number SUB_ASSET_KEYUPD_0194
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020194', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020194 begin');
      await removeAssetPromise('uUpd020043', '');
      await addAssetPromise('uUpd020043', 'password8', 'l13');
      await updateAssetPromise('uUpd020043', 'newPassword', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020194 end');
    })

    /**
     * @tc.name   testKeyUpd020195
     * @tc.number SUB_ASSET_KEYUPD_0195
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020195', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020195 begin');
      await removeAssetPromise('uUpd020044', '');
      await addAssetPromise('uUpd020044', 'pwd_16_chars_123', 'l14');
      await updateAssetPromise('uUpd020044', 'npwd_16_chars_456', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020195 end');
    })

    /**
     * @tc.name   testKeyUpd020196
     * @tc.number SUB_ASSET_KEYUPD_0196
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020196', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020196 begin');
      await removeAssetPromise('uUpd020045', '');
      await addAssetPromise('uUpd020045', '中文密码', 'l15');
      await updateAssetPromise('uUpd020045', '新密码', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020196 end');
    })

    /**
     * @tc.name   testKeyUpd020197
     * @tc.number SUB_ASSET_KEYUPD_0197
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020197', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020197 begin');
      await removeAssetPromise('uUpd020046', '');
      await addAssetPromise('uUpd020046', 'pwd@#$%^&*()', 'l16');
      await updateAssetPromise('uUpd020046', 'npwd@#$%^&*()', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020197 end');
    })

    /**
     * @tc.name   testKeyUpd020198
     * @tc.number SUB_ASSET_KEYUPD_0198
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020198', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020198 begin');
      await removeAssetPromise('uUpd020047', '');
      await addAssetPromise('uUpd020047', '12345678', 'l17');
      await updateAssetPromise('uUpd020047', '87654321', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020198 end');
    })

    /**
     * @tc.name   testKeyUpd020199
     * @tc.number SUB_ASSET_KEYUPD_0199
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020199', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020199 begin');
      await removeAssetPromise('uUpd020048', '');
      await addAssetPromise('uUpd020048', 'p1', 'l18');
      await updateAssetPromise('uUpd020048', 'np1', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020199 end');
    })

    /**
     * @tc.name   testKeyUpd020200
     * @tc.number SUB_ASSET_KEYUPD_0200
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020200 begin');
      await removeAssetPromise('uUpd020049', '');
      await addAssetPromise('uUpd020049', 'password8', 'l19');
      await updateAssetPromise('uUpd020049', 'newPassword', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020200 end');
    })

    /**
     * @tc.name   testKeyUpd020201
     * @tc.number SUB_ASSET_KEYUPD_0201
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020201 begin');
      await removeAssetPromise('uUpd020050', '');
      await addAssetPromise('uUpd020050', 'pwd_16_chars_123', 'l20');
      await updateAssetPromise('uUpd020050', 'npwd_16_chars_456', 'a20;b20');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020201 end');
    })

    /**
     * @tc.name   testKeyUpd020202
     * @tc.number SUB_ASSET_KEYUPD_0202
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020202', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020202 begin');
      await removeAssetPromise('uUpd020051', '');
      await addAssetPromise('uUpd020051', '中文密码', 'l21');
      await updateAssetPromise('uUpd020051', '新密码', 'a21;b21');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020202 end');
    })

    /**
     * @tc.name   testKeyUpd020203
     * @tc.number SUB_ASSET_KEYUPD_0203
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020203', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020203 begin');
      await removeAssetPromise('uUpd020052', '');
      await addAssetPromise('uUpd020052', 'pwd@#$%^&*()', 'l22');
      await updateAssetPromise('uUpd020052', 'npwd@#$%^&*()', 'a22;b22');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020203 end');
    })

    /**
     * @tc.name   testKeyUpd020204
     * @tc.number SUB_ASSET_KEYUPD_0204
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020204', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020204 begin');
      await removeAssetPromise('uUpd020053', '');
      await addAssetPromise('uUpd020053', '12345678', 'l23');
      await updateAssetPromise('uUpd020053', '87654321', 'a23;b23');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020204 end');
    })

    /**
     * @tc.name   testKeyUpd020205
     * @tc.number SUB_ASSET_KEYUPD_0205
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020205', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020205 begin');
      await removeAssetPromise('uUpd020054', '');
      await addAssetPromise('uUpd020054', 'p1', 'l24');
      await updateAssetPromise('uUpd020054', 'np1', 'a24;b24');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020205 end');
    })

    /**
     * @tc.name   testKeyUpd020206
     * @tc.number SUB_ASSET_KEYUPD_0206
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020206', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020206 begin');
      await removeAssetPromise('uUpd020055', '');
      await addAssetPromise('uUpd020055', 'password8', 'l25');
      await updateAssetPromise('uUpd020055', 'newPassword', 'a25;b25');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020206 end');
    })

    /**
     * @tc.name   testKeyUpd020207
     * @tc.number SUB_ASSET_KEYUPD_0207
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020207', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020207 begin');
      await removeAssetPromise('uUpd020056', '');
      await addAssetPromise('uUpd020056', 'pwd_16_chars_123', 'l26');
      await updateAssetPromise('uUpd020056', 'npwd_16_chars_456', 'a26;b26');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020207 end');
    })

    /**
     * @tc.name   testKeyUpd020208
     * @tc.number SUB_ASSET_KEYUPD_0208
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020208', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020208 begin');
      await removeAssetPromise('uUpd020057', '');
      await addAssetPromise('uUpd020057', '中文密码', 'l27');
      await updateAssetPromise('uUpd020057', '新密码', 'a27;b27');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020208 end');
    })

    /**
     * @tc.name   testKeyUpd020209
     * @tc.number SUB_ASSET_KEYUPD_0209
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020209', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020209 begin');
      await removeAssetPromise('uUpd020058', '');
      await addAssetPromise('uUpd020058', 'pwd@#$%^&*()', 'l28');
      await updateAssetPromise('uUpd020058', 'npwd@#$%^&*()', 'a28;b28');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020209 end');
    })

    /**
     * @tc.name   testKeyUpd020210
     * @tc.number SUB_ASSET_KEYUPD_0210
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020210', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020210 begin');
      await removeAssetPromise('uUpd020059', '');
      await addAssetPromise('uUpd020059', '12345678', 'l29');
      await updateAssetPromise('uUpd020059', '87654321', 'a29;b29');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020210 end');
    })

    /**
     * @tc.name   testKeyUpd020211
     * @tc.number SUB_ASSET_KEYUPD_0211
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020211', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020211 begin');
      await removeAssetPromise('uUpd020060', '');
      await addAssetPromise('uUpd020060', 'p1', 'g0');
      await updateAssetPromise('uUpd020060', 'np1', 'x0;y0;z0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020211 end');
    })

    /**
     * @tc.name   testKeyUpd020212
     * @tc.number SUB_ASSET_KEYUPD_0212
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020212', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020212 begin');
      await removeAssetPromise('uUpd020061', '');
      await addAssetPromise('uUpd020061', 'password8', 'g1');
      await updateAssetPromise('uUpd020061', 'newPassword', 'x1;y1;z1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020212 end');
    })

    /**
     * @tc.name   testKeyUpd020213
     * @tc.number SUB_ASSET_KEYUPD_0213
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020213', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020213 begin');
      await removeAssetPromise('uUpd020062', '');
      await addAssetPromise('uUpd020062', 'pwd_16_chars_123', 'g2');
      await updateAssetPromise('uUpd020062', 'npwd_16_chars_456', 'x2;y2;z2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020213 end');
    })

    /**
     * @tc.name   testKeyUpd020214
     * @tc.number SUB_ASSET_KEYUPD_0214
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020214', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020214 begin');
      await removeAssetPromise('uUpd020063', '');
      await addAssetPromise('uUpd020063', '中文密码', 'g3');
      await updateAssetPromise('uUpd020063', '新密码', 'x3;y3;z3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020214 end');
    })

    /**
     * @tc.name   testKeyUpd020215
     * @tc.number SUB_ASSET_KEYUPD_0215
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020215', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020215 begin');
      await removeAssetPromise('uUpd020064', '');
      await addAssetPromise('uUpd020064', 'pwd@#$%^&*()', 'g4');
      await updateAssetPromise('uUpd020064', 'npwd@#$%^&*()', 'x4;y4;z4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020215 end');
    })

    /**
     * @tc.name   testKeyUpd020216
     * @tc.number SUB_ASSET_KEYUPD_0216
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020216', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020216 begin');
      await removeAssetPromise('uUpd020065', '');
      await addAssetPromise('uUpd020065', '12345678', 'l5');
      await updateAssetPromise('uUpd020065', '87654321', 'x5;y5;z5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020216 end');
    })

    /**
     * @tc.name   testKeyUpd020217
     * @tc.number SUB_ASSET_KEYUPD_0217
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020217', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020217 begin');
      await removeAssetPromise('uUpd020066', '');
      await addAssetPromise('uUpd020066', 'p1', 'l6');
      await updateAssetPromise('uUpd020066', 'np1', 'x6;y6;z6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020217 end');
    })

    /**
     * @tc.name   testKeyUpd020218
     * @tc.number SUB_ASSET_KEYUPD_0218
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020218', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020218 begin');
      await removeAssetPromise('uUpd020067', '');
      await addAssetPromise('uUpd020067', 'password8', 'l7');
      await updateAssetPromise('uUpd020067', 'newPassword', 'x7;y7;z7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020218 end');
    })

    /**
     * @tc.name   testKeyUpd020219
     * @tc.number SUB_ASSET_KEYUPD_0219
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020219', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020219 begin');
      await removeAssetPromise('uUpd020068', '');
      await addAssetPromise('uUpd020068', 'pwd_16_chars_123', 'l8');
      await updateAssetPromise('uUpd020068', 'npwd_16_chars_456', 'x8;y8;z8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020219 end');
    })

    /**
     * @tc.name   testKeyUpd020220
     * @tc.number SUB_ASSET_KEYUPD_0220
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020220', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020220 begin');
      await removeAssetPromise('uUpd020069', '');
      await addAssetPromise('uUpd020069', '中文密码', 'l9');
      await updateAssetPromise('uUpd020069', '新密码', 'x9;y9;z9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020220 end');
    })

    /**
     * @tc.name   testKeyUpd020221
     * @tc.number SUB_ASSET_KEYUPD_0221
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020221', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020221 begin');
      await removeAssetPromise('uUpd020070', '');
      await addAssetPromise('uUpd020070', 'pwd@#$%^&*()', 'l10');
      await updateAssetPromise('uUpd020070', 'npwd@#$%^&*()', 'x10;y10;z10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020221 end');
    })

    /**
     * @tc.name   testKeyUpd020222
     * @tc.number SUB_ASSET_KEYUPD_0222
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020222', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020222 begin');
      await removeAssetPromise('uUpd020071', '');
      await addAssetPromise('uUpd020071', '12345678', 'l11');
      await updateAssetPromise('uUpd020071', '87654321', 'x11;y11;z11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020222 end');
    })

    /**
     * @tc.name   testKeyUpd020223
     * @tc.number SUB_ASSET_KEYUPD_0223
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020223', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020223 begin');
      await removeAssetPromise('uUpd020072', '');
      await addAssetPromise('uUpd020072', 'p1', 'l12');
      await updateAssetPromise('uUpd020072', 'np1', 'x12;y12;z12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020223 end');
    })

    /**
     * @tc.name   testKeyUpd020224
     * @tc.number SUB_ASSET_KEYUPD_0224
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020224', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020224 begin');
      await removeAssetPromise('uUpd020073', '');
      await addAssetPromise('uUpd020073', 'password8', 'l13');
      await updateAssetPromise('uUpd020073', 'newPassword', 'x13;y13;z13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020224 end');
    })

    /**
     * @tc.name   testKeyUpd020225
     * @tc.number SUB_ASSET_KEYUPD_0225
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020225', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020225 begin');
      await removeAssetPromise('uUpd020074', '');
      await addAssetPromise('uUpd020074', 'pwd_16_chars_123', 'l14');
      await updateAssetPromise('uUpd020074', 'npwd_16_chars_456', 'x14;y14;z14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020225 end');
    })

    /**
     * @tc.name   testKeyUpd020226
     * @tc.number SUB_ASSET_KEYUPD_0226
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020226', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020226 begin');
      await removeAssetPromise('uUpd020075', '');
      await addAssetPromise('uUpd020075', '中文密码', 'l15');
      await updateAssetPromise('uUpd020075', '新密码', 'x15;y15;z15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020226 end');
    })

    /**
     * @tc.name   testKeyUpd020227
     * @tc.number SUB_ASSET_KEYUPD_0227
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020227', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020227 begin');
      await removeAssetPromise('uUpd020076', '');
      await addAssetPromise('uUpd020076', 'pwd@#$%^&*()', 'l16');
      await updateAssetPromise('uUpd020076', 'npwd@#$%^&*()', 'x16;y16;z16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020227 end');
    })

    /**
     * @tc.name   testKeyUpd020228
     * @tc.number SUB_ASSET_KEYUPD_0228
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020228', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020228 begin');
      await removeAssetPromise('uUpd020077', '');
      await addAssetPromise('uUpd020077', '12345678', 'l17');
      await updateAssetPromise('uUpd020077', '87654321', 'x17;y17;z17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020228 end');
    })

    /**
     * @tc.name   testKeyUpd020229
     * @tc.number SUB_ASSET_KEYUPD_0229
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020229', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020229 begin');
      await removeAssetPromise('uUpd020078', '');
      await addAssetPromise('uUpd020078', 'p1', 'l18');
      await updateAssetPromise('uUpd020078', 'np1', 'x18;y18;z18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020229 end');
    })

    /**
     * @tc.name   testKeyUpd020230
     * @tc.number SUB_ASSET_KEYUPD_0230
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020230', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020230 begin');
      await removeAssetPromise('uUpd020079', '');
      await addAssetPromise('uUpd020079', 'password8', 'l19');
      await updateAssetPromise('uUpd020079', 'newPassword', 'x19;y19;z19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020230 end');
    })

    /**
     * @tc.name   testKeyUpd020231
     * @tc.number SUB_ASSET_KEYUPD_0231
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020231', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020231 begin');
      await removeAssetPromise('uUpd020080', '');
      await addAssetPromise('uUpd020080', 'pwd_16_chars_123', 'g0');
      await updateAssetPromise('uUpd020080', 'npwd_16_chars_456', 'a0;b0;c0;d0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020231 end');
    })

    /**
     * @tc.name   testKeyUpd020232
     * @tc.number SUB_ASSET_KEYUPD_0232
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020232', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020232 begin');
      await removeAssetPromise('uUpd020081', '');
      await addAssetPromise('uUpd020081', '中文密码', 'g1');
      await updateAssetPromise('uUpd020081', '新密码', 'a1;b1;c1;d1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020232 end');
    })

    /**
     * @tc.name   testKeyUpd020233
     * @tc.number SUB_ASSET_KEYUPD_0233
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020233', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020233 begin');
      await removeAssetPromise('uUpd020082', '');
      await addAssetPromise('uUpd020082', 'pwd@#$%^&*()', 'g2');
      await updateAssetPromise('uUpd020082', 'npwd@#$%^&*()', 'a2;b2;c2;d2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020233 end');
    })

    /**
     * @tc.name   testKeyUpd020234
     * @tc.number SUB_ASSET_KEYUPD_0234
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020234', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020234 begin');
      await removeAssetPromise('uUpd020083', '');
      await addAssetPromise('uUpd020083', '12345678', 'g3');
      await updateAssetPromise('uUpd020083', '87654321', 'a3;b3;c3;d3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020234 end');
    })

    /**
     * @tc.name   testKeyUpd020235
     * @tc.number SUB_ASSET_KEYUPD_0235
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020235', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020235 begin');
      await removeAssetPromise('uUpd020084', '');
      await addAssetPromise('uUpd020084', 'p1', 'g4');
      await updateAssetPromise('uUpd020084', 'np1', 'a4;b4;c4;d4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020235 end');
    })

    /**
     * @tc.name   testKeyUpd020236
     * @tc.number SUB_ASSET_KEYUPD_0236
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020236', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020236 begin');
      await removeAssetPromise('uUpd020085', '');
      await addAssetPromise('uUpd020085', 'password8', 'l5');
      await updateAssetPromise('uUpd020085', 'newPassword', 'a5;b5;c5;d5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020236 end');
    })

    /**
     * @tc.name   testKeyUpd020237
     * @tc.number SUB_ASSET_KEYUPD_0237
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020237', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020237 begin');
      await removeAssetPromise('uUpd020086', '');
      await addAssetPromise('uUpd020086', 'pwd_16_chars_123', 'l6');
      await updateAssetPromise('uUpd020086', 'npwd_16_chars_456', 'a6;b6;c6;d6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020237 end');
    })

    /**
     * @tc.name   testKeyUpd020238
     * @tc.number SUB_ASSET_KEYUPD_0238
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020238', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020238 begin');
      await removeAssetPromise('uUpd020087', '');
      await addAssetPromise('uUpd020087', '中文密码', 'l7');
      await updateAssetPromise('uUpd020087', '新密码', 'a7;b7;c7;d7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020238 end');
    })

    /**
     * @tc.name   testKeyUpd020239
     * @tc.number SUB_ASSET_KEYUPD_0239
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020239', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020239 begin');
      await removeAssetPromise('uUpd020088', '');
      await addAssetPromise('uUpd020088', 'pwd@#$%^&*()', 'l8');
      await updateAssetPromise('uUpd020088', 'npwd@#$%^&*()', 'a8;b8;c8;d8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020239 end');
    })

    /**
     * @tc.name   testKeyUpd020240
     * @tc.number SUB_ASSET_KEYUPD_0240
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020240', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020240 begin');
      await removeAssetPromise('uUpd020089', '');
      await addAssetPromise('uUpd020089', '12345678', 'l9');
      await updateAssetPromise('uUpd020089', '87654321', 'a9;b9;c9;d9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020240 end');
    })

    /**
     * @tc.name   testKeyUpd020241
     * @tc.number SUB_ASSET_KEYUPD_0241
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020241', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020241 begin');
      await removeAssetPromise('uUpd020090', '');
      await addAssetPromise('uUpd020090', 'p1', 'l10');
      await updateAssetPromise('uUpd020090', 'np1', 'a10;b10;c10;d10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020241 end');
    })

    /**
     * @tc.name   testKeyUpd020242
     * @tc.number SUB_ASSET_KEYUPD_0242
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020242', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020242 begin');
      await removeAssetPromise('uUpd020091', '');
      await addAssetPromise('uUpd020091', 'password8', 'l11');
      await updateAssetPromise('uUpd020091', 'newPassword', 'a11;b11;c11;d11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020242 end');
    })

    /**
     * @tc.name   testKeyUpd020243
     * @tc.number SUB_ASSET_KEYUPD_0243
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020243', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020243 begin');
      await removeAssetPromise('uUpd020092', '');
      await addAssetPromise('uUpd020092', 'pwd_16_chars_123', 'l12');
      await updateAssetPromise('uUpd020092', 'npwd_16_chars_456', 'a12;b12;c12;d12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020243 end');
    })

    /**
     * @tc.name   testKeyUpd020244
     * @tc.number SUB_ASSET_KEYUPD_0244
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020244', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020244 begin');
      await removeAssetPromise('uUpd020093', '');
      await addAssetPromise('uUpd020093', '中文密码', 'l13');
      await updateAssetPromise('uUpd020093', '新密码', 'a13;b13;c13;d13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020244 end');
    })

    /**
     * @tc.name   testKeyUpd020245
     * @tc.number SUB_ASSET_KEYUPD_0245
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020245', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020245 begin');
      await removeAssetPromise('uUpd020094', '');
      await addAssetPromise('uUpd020094', 'pwd@#$%^&*()', 'l14');
      await updateAssetPromise('uUpd020094', 'npwd@#$%^&*()', 'a14;b14;c14;d14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020245 end');
    })

    /**
     * @tc.name   testKeyUpd020246
     * @tc.number SUB_ASSET_KEYUPD_0246
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020246', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020246 begin');
      await removeAssetPromise('uUpd020095', '');
      await addAssetPromise('uUpd020095', '12345678', 'l15');
      await updateAssetPromise('uUpd020095', '87654321', 'a15;b15;c15;d15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020246 end');
    })

    /**
     * @tc.name   testKeyUpd020247
     * @tc.number SUB_ASSET_KEYUPD_0247
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020247', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020247 begin');
      await removeAssetPromise('uUpd020096', '');
      await addAssetPromise('uUpd020096', 'p1', 'l16');
      await updateAssetPromise('uUpd020096', 'np1', 'a16;b16;c16;d16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020247 end');
    })

    /**
     * @tc.name   testKeyUpd020248
     * @tc.number SUB_ASSET_KEYUPD_0248
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020248', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020248 begin');
      await removeAssetPromise('uUpd020097', '');
      await addAssetPromise('uUpd020097', 'password8', 'l17');
      await updateAssetPromise('uUpd020097', 'newPassword', 'a17;b17;c17;d17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020248 end');
    })

    /**
     * @tc.name   testKeyUpd020249
     * @tc.number SUB_ASSET_KEYUPD_0249
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020249', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020249 begin');
      await removeAssetPromise('uUpd020098', '');
      await addAssetPromise('uUpd020098', 'pwd_16_chars_123', 'l18');
      await updateAssetPromise('uUpd020098', 'npwd_16_chars_456', 'a18;b18;c18;d18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020249 end');
    })

    /**
     * @tc.name   testKeyUpd020250
     * @tc.number SUB_ASSET_KEYUPD_0250
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020250', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020250 begin');
      await removeAssetPromise('uUpd020099', '');
      await addAssetPromise('uUpd020099', '中文密码', 'l19');
      await updateAssetPromise('uUpd020099', '新密码', 'a19;b19;c19;d19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020250 end');
    })

    /**
     * @tc.name   testKeyUpd020251
     * @tc.number SUB_ASSET_KEYUPD_0251
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020251', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020251 begin');
      await removeAssetPromise('uUpd020100', '');
      await addAssetPromise('uUpd020100', 'pwd@#$%^&*()', 'g0');
      await updateAssetPromise('uUpd020100', 'npwd@#$%^&*()', 'a0;b0;c0;d0;e0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020251 end');
    })

    /**
     * @tc.name   testKeyUpd020252
     * @tc.number SUB_ASSET_KEYUPD_0252
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020252', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020252 begin');
      await removeAssetPromise('uUpd020101', '');
      await addAssetPromise('uUpd020101', '12345678', 'g1');
      await updateAssetPromise('uUpd020101', '87654321', 'a1;b1;c1;d1;e1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020252 end');
    })

    /**
     * @tc.name   testKeyUpd020253
     * @tc.number SUB_ASSET_KEYUPD_0253
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020253', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020253 begin');
      await removeAssetPromise('uUpd020102', '');
      await addAssetPromise('uUpd020102', 'p1', 'g2');
      await updateAssetPromise('uUpd020102', 'np1', 'a2;b2;c2;d2;e2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020253 end');
    })

    /**
     * @tc.name   testKeyUpd020254
     * @tc.number SUB_ASSET_KEYUPD_0254
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020254', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020254 begin');
      await removeAssetPromise('uUpd020103', '');
      await addAssetPromise('uUpd020103', 'password8', 'g3');
      await updateAssetPromise('uUpd020103', 'newPassword', 'a3;b3;c3;d3;e3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020254 end');
    })

    /**
     * @tc.name   testKeyUpd020255
     * @tc.number SUB_ASSET_KEYUPD_0255
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020255', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020255 begin');
      await removeAssetPromise('uUpd020104', '');
      await addAssetPromise('uUpd020104', 'pwd_16_chars_123', 'g4');
      await updateAssetPromise('uUpd020104', 'npwd_16_chars_456', 'a4;b4;c4;d4;e4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020255 end');
    })

    /**
     * @tc.name   testKeyUpd020256
     * @tc.number SUB_ASSET_KEYUPD_0256
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020256', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020256 begin');
      await removeAssetPromise('uUpd020105', '');
      await addAssetPromise('uUpd020105', '中文密码', 'l5');
      await updateAssetPromise('uUpd020105', '新密码', 'a5;b5;c5;d5;e5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020256 end');
    })

    /**
     * @tc.name   testKeyUpd020257
     * @tc.number SUB_ASSET_KEYUPD_0257
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020257', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020257 begin');
      await removeAssetPromise('uUpd020106', '');
      await addAssetPromise('uUpd020106', 'pwd@#$%^&*()', 'l6');
      await updateAssetPromise('uUpd020106', 'npwd@#$%^&*()', 'a6;b6;c6;d6;e6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020257 end');
    })

    /**
     * @tc.name   testKeyUpd020258
     * @tc.number SUB_ASSET_KEYUPD_0258
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020258', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020258 begin');
      await removeAssetPromise('uUpd020107', '');
      await addAssetPromise('uUpd020107', '12345678', 'l7');
      await updateAssetPromise('uUpd020107', '87654321', 'a7;b7;c7;d7;e7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020258 end');
    })

    /**
     * @tc.name   testKeyUpd020259
     * @tc.number SUB_ASSET_KEYUPD_0259
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020259', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020259 begin');
      await removeAssetPromise('uUpd020108', '');
      await addAssetPromise('uUpd020108', 'p1', 'l8');
      await updateAssetPromise('uUpd020108', 'np1', 'a8;b8;c8;d8;e8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020259 end');
    })

    /**
     * @tc.name   testKeyUpd020260
     * @tc.number SUB_ASSET_KEYUPD_0260
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020260', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020260 begin');
      await removeAssetPromise('uUpd020109', '');
      await addAssetPromise('uUpd020109', 'password8', 'l9');
      await updateAssetPromise('uUpd020109', 'newPassword', 'a9;b9;c9;d9;e9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020260 end');
    })

    /**
     * @tc.name   testKeyUpd020261
     * @tc.number SUB_ASSET_KEYUPD_0261
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020261', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020261 begin');
      await removeAssetPromise('uUpd020110', '');
      await addAssetPromise('uUpd020110', 'pwd_16_chars_123', 'l10');
      await updateAssetPromise('uUpd020110', 'npwd_16_chars_456', 'a10;b10;c10;d10;e10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020261 end');
    })

    /**
     * @tc.name   testKeyUpd020262
     * @tc.number SUB_ASSET_KEYUPD_0262
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020262', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020262 begin');
      await removeAssetPromise('uUpd020111', '');
      await addAssetPromise('uUpd020111', '中文密码', 'l11');
      await updateAssetPromise('uUpd020111', '新密码', 'a11;b11;c11;d11;e11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020262 end');
    })

    /**
     * @tc.name   testKeyUpd020263
     * @tc.number SUB_ASSET_KEYUPD_0263
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020263', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020263 begin');
      await removeAssetPromise('uUpd020112', '');
      await addAssetPromise('uUpd020112', 'pwd@#$%^&*()', 'l12');
      await updateAssetPromise('uUpd020112', 'npwd@#$%^&*()', 'a12;b12;c12;d12;e12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020263 end');
    })

    /**
     * @tc.name   testKeyUpd020264
     * @tc.number SUB_ASSET_KEYUPD_0264
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020264', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020264 begin');
      await removeAssetPromise('uUpd020113', '');
      await addAssetPromise('uUpd020113', '12345678', 'l13');
      await updateAssetPromise('uUpd020113', '87654321', 'a13;b13;c13;d13;e13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020264 end');
    })

    /**
     * @tc.name   testKeyUpd020265
     * @tc.number SUB_ASSET_KEYUPD_0265
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020265', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020265 begin');
      await removeAssetPromise('uUpd020114', '');
      await addAssetPromise('uUpd020114', 'p1', 'l14');
      await updateAssetPromise('uUpd020114', 'np1', 'a14;b14;c14;d14;e14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020265 end');
    })

    /**
     * @tc.name   testKeyUpd020266
     * @tc.number SUB_ASSET_KEYUPD_0266
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020266', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020266 begin');
      await removeAssetPromise('uUpd020115', '');
      await addAssetPromise('uUpd020115', 'password8', 'l15');
      await updateAssetPromise('uUpd020115', 'newPassword', 'a15;b15;c15;d15;e15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020266 end');
    })

    /**
     * @tc.name   testKeyUpd020267
     * @tc.number SUB_ASSET_KEYUPD_0267
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020267', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020267 begin');
      await removeAssetPromise('uUpd020116', '');
      await addAssetPromise('uUpd020116', 'pwd_16_chars_123', 'l16');
      await updateAssetPromise('uUpd020116', 'npwd_16_chars_456', 'a16;b16;c16;d16;e16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020267 end');
    })

    /**
     * @tc.name   testKeyUpd020268
     * @tc.number SUB_ASSET_KEYUPD_0268
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020268', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020268 begin');
      await removeAssetPromise('uUpd020117', '');
      await addAssetPromise('uUpd020117', '中文密码', 'l17');
      await updateAssetPromise('uUpd020117', '新密码', 'a17;b17;c17;d17;e17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020268 end');
    })

    /**
     * @tc.name   testKeyUpd020269
     * @tc.number SUB_ASSET_KEYUPD_0269
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020269', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020269 begin');
      await removeAssetPromise('uUpd020118', '');
      await addAssetPromise('uUpd020118', 'pwd@#$%^&*()', 'l18');
      await updateAssetPromise('uUpd020118', 'npwd@#$%^&*()', 'a18;b18;c18;d18;e18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020269 end');
    })

    /**
     * @tc.name   testKeyUpd020270
     * @tc.number SUB_ASSET_KEYUPD_0270
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020270', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020270 begin');
      await removeAssetPromise('uUpd020119', '');
      await addAssetPromise('uUpd020119', '12345678', 'l19');
      await updateAssetPromise('uUpd020119', '87654321', 'a19;b19;c19;d19;e19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020270 end');
    })

    /**
     * @tc.name   testKeyUpd020271
     * @tc.number SUB_ASSET_KEYUPD_0271
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020271', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020271 begin');
      await removeAssetPromise('uUpd020120', '');
      await addAssetPromise('uUpd020120', 'p1', 'l20');
      await updateAssetPromise('uUpd020120', 'np1', 'a20;b20;c20;d20;e20');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020271 end');
    })

    /**
     * @tc.name   testKeyUpd020272
     * @tc.number SUB_ASSET_KEYUPD_0272
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020272', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020272 begin');
      await removeAssetPromise('uUpd020121', '');
      await addAssetPromise('uUpd020121', 'password8', 'l21');
      await updateAssetPromise('uUpd020121', 'newPassword', 'a21;b21;c21;d21;e21');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020272 end');
    })

    /**
     * @tc.name   testKeyUpd020273
     * @tc.number SUB_ASSET_KEYUPD_0273
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020273', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020273 begin');
      await removeAssetPromise('uUpd020122', '');
      await addAssetPromise('uUpd020122', 'pwd_16_chars_123', 'l22');
      await updateAssetPromise('uUpd020122', 'npwd_16_chars_456', 'a22;b22;c22;d22;e22');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020273 end');
    })

    /**
     * @tc.name   testKeyUpd020274
     * @tc.number SUB_ASSET_KEYUPD_0274
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020274', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020274 begin');
      await removeAssetPromise('uUpd020123', '');
      await addAssetPromise('uUpd020123', '中文密码', 'l23');
      await updateAssetPromise('uUpd020123', '新密码', 'a23;b23;c23;d23;e23');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020274 end');
    })

    /**
     * @tc.name   testKeyUpd020275
     * @tc.number SUB_ASSET_KEYUPD_0275
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020275', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020275 begin');
      await removeAssetPromise('uUpd020124', '');
      await addAssetPromise('uUpd020124', 'pwd@#$%^&*()', 'l24');
      await updateAssetPromise('uUpd020124', 'npwd@#$%^&*()', 'a24;b24;c24;d24;e24');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020275 end');
    })

    /**
     * @tc.name   testKeyUpd020276
     * @tc.number SUB_ASSET_KEYUPD_0276
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020276', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020276 begin');
      await removeAssetPromise('uUpd020125', '');
      await addAssetPromise('uUpd020125', '12345678', 'g0');
      await updateAssetPromise('uUpd020125', '87654321', 'a0;b0;c0;d0;e0;f0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020276 end');
    })

    /**
     * @tc.name   testKeyUpd020277
     * @tc.number SUB_ASSET_KEYUPD_0277
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020277', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020277 begin');
      await removeAssetPromise('uUpd020126', '');
      await addAssetPromise('uUpd020126', 'p1', 'g1');
      await updateAssetPromise('uUpd020126', 'np1', 'a1;b1;c1;d1;e1;f1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020277 end');
    })

    /**
     * @tc.name   testKeyUpd020278
     * @tc.number SUB_ASSET_KEYUPD_0278
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020278', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020278 begin');
      await removeAssetPromise('uUpd020127', '');
      await addAssetPromise('uUpd020127', 'password8', 'g2');
      await updateAssetPromise('uUpd020127', 'newPassword', 'a2;b2;c2;d2;e2;f2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020278 end');
    })

    /**
     * @tc.name   testKeyUpd020279
     * @tc.number SUB_ASSET_KEYUPD_0279
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020279', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020279 begin');
      await removeAssetPromise('uUpd020128', '');
      await addAssetPromise('uUpd020128', 'pwd_16_chars_123', 'g3');
      await updateAssetPromise('uUpd020128', 'npwd_16_chars_456', 'a3;b3;c3;d3;e3;f3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020279 end');
    })

    /**
     * @tc.name   testKeyUpd020280
     * @tc.number SUB_ASSET_KEYUPD_0280
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020280', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020280 begin');
      await removeAssetPromise('uUpd020129', '');
      await addAssetPromise('uUpd020129', '中文密码', 'g4');
      await updateAssetPromise('uUpd020129', '新密码', 'a4;b4;c4;d4;e4;f4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020280 end');
    })

    /**
     * @tc.name   testKeyUpd020281
     * @tc.number SUB_ASSET_KEYUPD_0281
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020281', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020281 begin');
      await removeAssetPromise('uUpd020130', '');
      await addAssetPromise('uUpd020130', 'pwd@#$%^&*()', 'l5');
      await updateAssetPromise('uUpd020130', 'npwd@#$%^&*()', 'a5;b5;c5;d5;e5;f5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020281 end');
    })

    /**
     * @tc.name   testKeyUpd020282
     * @tc.number SUB_ASSET_KEYUPD_0282
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020282', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020282 begin');
      await removeAssetPromise('uUpd020131', '');
      await addAssetPromise('uUpd020131', '12345678', 'l6');
      await updateAssetPromise('uUpd020131', '87654321', 'a6;b6;c6;d6;e6;f6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020282 end');
    })

    /**
     * @tc.name   testKeyUpd020283
     * @tc.number SUB_ASSET_KEYUPD_0283
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020283', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020283 begin');
      await removeAssetPromise('uUpd020132', '');
      await addAssetPromise('uUpd020132', 'p1', 'l7');
      await updateAssetPromise('uUpd020132', 'np1', 'a7;b7;c7;d7;e7;f7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020283 end');
    })

    /**
     * @tc.name   testKeyUpd020284
     * @tc.number SUB_ASSET_KEYUPD_0284
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020284', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020284 begin');
      await removeAssetPromise('uUpd020133', '');
      await addAssetPromise('uUpd020133', 'password8', 'l8');
      await updateAssetPromise('uUpd020133', 'newPassword', 'a8;b8;c8;d8;e8;f8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020284 end');
    })

    /**
     * @tc.name   testKeyUpd020285
     * @tc.number SUB_ASSET_KEYUPD_0285
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020285', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020285 begin');
      await removeAssetPromise('uUpd020134', '');
      await addAssetPromise('uUpd020134', 'pwd_16_chars_123', 'l9');
      await updateAssetPromise('uUpd020134', 'npwd_16_chars_456', 'a9;b9;c9;d9;e9;f9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020285 end');
    })

    /**
     * @tc.name   testKeyUpd020286
     * @tc.number SUB_ASSET_KEYUPD_0286
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020286', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020286 begin');
      await removeAssetPromise('uUpd020135', '');
      await addAssetPromise('uUpd020135', '中文密码', 'g0');
      await updateAssetPromise('uUpd020135', '新密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020286 end');
    })

    /**
     * @tc.name   testKeyUpd020287
     * @tc.number SUB_ASSET_KEYUPD_0287
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020287', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020287 begin');
      await removeAssetPromise('uUpd020136', '');
      await addAssetPromise('uUpd020136', 'pwd@#$%^&*()', 'g1');
      await updateAssetPromise('uUpd020136', 'npwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020287 end');
    })

    /**
     * @tc.name   testKeyUpd020288
     * @tc.number SUB_ASSET_KEYUPD_0288
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020288', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020288 begin');
      await removeAssetPromise('uUpd020137', '');
      await addAssetPromise('uUpd020137', '12345678', 'g2');
      await updateAssetPromise('uUpd020137', '87654321', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020288 end');
    })

    /**
     * @tc.name   testKeyUpd020289
     * @tc.number SUB_ASSET_KEYUPD_0289
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020289', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020289 begin');
      await removeAssetPromise('uUpd020138', '');
      await addAssetPromise('uUpd020138', 'p1', 'g3');
      await updateAssetPromise('uUpd020138', 'np1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020289 end');
    })

    /**
     * @tc.name   testKeyUpd020290
     * @tc.number SUB_ASSET_KEYUPD_0290
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020290', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020290 begin');
      await removeAssetPromise('uUpd020139', '');
      await addAssetPromise('uUpd020139', 'password8', 'g4');
      await updateAssetPromise('uUpd020139', 'newPassword', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020290 end');
    })

    /**
     * @tc.name   testKeyUpd020291
     * @tc.number SUB_ASSET_KEYUPD_0291
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020291', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020291 begin');
      await removeAssetPromise('uUpd020140', '');
      await addAssetPromise('uUpd020140', 'pwd_16_chars_123', 'l5');
      await updateAssetPromise('uUpd020140', 'npwd_16_chars_456', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020291 end');
    })

    /**
     * @tc.name   testKeyUpd020292
     * @tc.number SUB_ASSET_KEYUPD_0292
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020292', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020292 begin');
      await removeAssetPromise('uUpd020141', '');
      await addAssetPromise('uUpd020141', '中文密码', 'l6');
      await updateAssetPromise('uUpd020141', '新密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020292 end');
    })

    /**
     * @tc.name   testKeyUpd020293
     * @tc.number SUB_ASSET_KEYUPD_0293
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020293', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020293 begin');
      await removeAssetPromise('uUpd020142', '');
      await addAssetPromise('uUpd020142', 'pwd@#$%^&*()', 'l7');
      await updateAssetPromise('uUpd020142', 'npwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020293 end');
    })

    /**
     * @tc.name   testKeyUpd020294
     * @tc.number SUB_ASSET_KEYUPD_0294
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020294', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020294 begin');
      await removeAssetPromise('uUpd020143', '');
      await addAssetPromise('uUpd020143', '12345678', 'l8');
      await updateAssetPromise('uUpd020143', '87654321', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020294 end');
    })

    /**
     * @tc.name   testKeyUpd020295
     * @tc.number SUB_ASSET_KEYUPD_0295
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020295', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020295 begin');
      await removeAssetPromise('uUpd020144', '');
      await addAssetPromise('uUpd020144', 'p1', 'l9');
      await updateAssetPromise('uUpd020144', 'np1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020295 end');
    })

    /**
     * @tc.name   testKeyUpd020296
     * @tc.number SUB_ASSET_KEYUPD_0296
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020296', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020296 begin');
      await removeAssetPromise('uUpd020145', '');
      await addAssetPromise('uUpd020145', 'password8', 'l10');
      await updateAssetPromise('uUpd020145', 'newPassword', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020296 end');
    })

    /**
     * @tc.name   testKeyUpd020297
     * @tc.number SUB_ASSET_KEYUPD_0297
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020297', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020297 begin');
      await removeAssetPromise('uUpd020146', '');
      await addAssetPromise('uUpd020146', 'pwd_16_chars_123', 'l11');
      await updateAssetPromise('uUpd020146', 'npwd_16_chars_456', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020297 end');
    })

    /**
     * @tc.name   testKeyUpd020298
     * @tc.number SUB_ASSET_KEYUPD_0298
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020298', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020298 begin');
      await removeAssetPromise('uUpd020147', '');
      await addAssetPromise('uUpd020147', '中文密码', 'l12');
      await updateAssetPromise('uUpd020147', '新密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020298 end');
    })

    /**
     * @tc.name   testKeyUpd020299
     * @tc.number SUB_ASSET_KEYUPD_0299
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020299', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020299 begin');
      await removeAssetPromise('uUpd020148', '');
      await addAssetPromise('uUpd020148', 'pwd@#$%^&*()', 'l13');
      await updateAssetPromise('uUpd020148', 'npwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020299 end');
    })

    /**
     * @tc.name   testKeyUpd020300
     * @tc.number SUB_ASSET_KEYUPD_0300
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd020300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020300 begin');
      await removeAssetPromise('uUpd020149', '');
      await addAssetPromise('uUpd020149', '12345678', 'l14');
      await updateAssetPromise('uUpd020149', '87654321', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd020149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd020149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd020300 end');
    })

  })
}
