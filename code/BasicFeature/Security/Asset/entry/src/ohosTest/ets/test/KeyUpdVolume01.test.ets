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

export default function keyUpdVolume01() {
  describe('KeyUpdVolume01Test', () => {

    /**
     * @tc.name   testKeyUpd010001
     * @tc.number SUB_ASSET_KEYUPD_0001
     * @tc.desc   更新密码与标签后查询回读新值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010001 begin');
      const alias: string = 'uUpdAnchor01';
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'oldPwd', 'oldLabel');
      await updateAssetPromise(alias, 'newPwd', 'newLabel');
      const rows: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(rows.length).assertEqual(1);
      expect(rows[0].get('secret')).assertEqual('newPwd');
      expect(rows[0].get('label')).assertEqual('newLabel');
      await removeAssetPromise(alias, '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010001 end');
    })

    /**
     * @tc.name   testKeyUpd010002
     * @tc.number SUB_ASSET_KEYUPD_0002
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010002 begin');
      await removeAssetPromise('uUpd010001', '');
      await addAssetPromise('uUpd010001', 'password8', 'g1');
      await updateAssetPromise('uUpd010001', 'newPassword', 'n1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010001', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010002 end');
    })

    /**
     * @tc.name   testKeyUpd010003
     * @tc.number SUB_ASSET_KEYUPD_0003
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010003 begin');
      await removeAssetPromise('uUpd010002', '');
      await addAssetPromise('uUpd010002', 'pwd_16_chars_123', 'g2');
      await updateAssetPromise('uUpd010002', 'npwd_16_chars_456', 'n2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010002', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010003 end');
    })

    /**
     * @tc.name   testKeyUpd010004
     * @tc.number SUB_ASSET_KEYUPD_0004
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010004 begin');
      await removeAssetPromise('uUpd010003', '');
      await addAssetPromise('uUpd010003', '中文密码', 'g3');
      await updateAssetPromise('uUpd010003', '新密码', 'n3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010003', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010004 end');
    })

    /**
     * @tc.name   testKeyUpd010005
     * @tc.number SUB_ASSET_KEYUPD_0005
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010005 begin');
      await removeAssetPromise('uUpd010004', '');
      await addAssetPromise('uUpd010004', 'pwd@#$%^&*()', 'g4');
      await updateAssetPromise('uUpd010004', 'npwd@#$%^&*()', 'n4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010004', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010005 end');
    })

    /**
     * @tc.name   testKeyUpd010006
     * @tc.number SUB_ASSET_KEYUPD_0006
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010006 begin');
      await removeAssetPromise('uUpd010005', '');
      await addAssetPromise('uUpd010005', '12345678', 'l5');
      await updateAssetPromise('uUpd010005', '87654321', 'n5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010005', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010006 end');
    })

    /**
     * @tc.name   testKeyUpd010007
     * @tc.number SUB_ASSET_KEYUPD_0007
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010007 begin');
      await removeAssetPromise('uUpd010006', '');
      await addAssetPromise('uUpd010006', 'p1', 'l6');
      await updateAssetPromise('uUpd010006', 'np1', 'n6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010006', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010007 end');
    })

    /**
     * @tc.name   testKeyUpd010008
     * @tc.number SUB_ASSET_KEYUPD_0008
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010008 begin');
      await removeAssetPromise('uUpd010007', '');
      await addAssetPromise('uUpd010007', 'password8', 'l7');
      await updateAssetPromise('uUpd010007', 'newPassword', 'n7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010007', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010008 end');
    })

    /**
     * @tc.name   testKeyUpd010009
     * @tc.number SUB_ASSET_KEYUPD_0009
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010009 begin');
      await removeAssetPromise('uUpd010008', '');
      await addAssetPromise('uUpd010008', 'pwd_16_chars_123', 'l8');
      await updateAssetPromise('uUpd010008', 'npwd_16_chars_456', 'n8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010008', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010009 end');
    })

    /**
     * @tc.name   testKeyUpd010010
     * @tc.number SUB_ASSET_KEYUPD_0010
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010010 begin');
      await removeAssetPromise('uUpd010009', '');
      await addAssetPromise('uUpd010009', '中文密码', 'l9');
      await updateAssetPromise('uUpd010009', '新密码', 'n9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010009', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010010 end');
    })

    /**
     * @tc.name   testKeyUpd010011
     * @tc.number SUB_ASSET_KEYUPD_0011
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010011 begin');
      await removeAssetPromise('uUpd010010', '');
      await addAssetPromise('uUpd010010', 'pwd@#$%^&*()', 'l10');
      await updateAssetPromise('uUpd010010', 'npwd@#$%^&*()', 'n10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010010', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010011 end');
    })

    /**
     * @tc.name   testKeyUpd010012
     * @tc.number SUB_ASSET_KEYUPD_0012
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010012 begin');
      await removeAssetPromise('uUpd010011', '');
      await addAssetPromise('uUpd010011', '12345678', 'l11');
      await updateAssetPromise('uUpd010011', '87654321', 'n11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010011', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010012 end');
    })

    /**
     * @tc.name   testKeyUpd010013
     * @tc.number SUB_ASSET_KEYUPD_0013
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010013 begin');
      await removeAssetPromise('uUpd010012', '');
      await addAssetPromise('uUpd010012', 'p1', 'l12');
      await updateAssetPromise('uUpd010012', 'np1', 'n12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010012', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010013 end');
    })

    /**
     * @tc.name   testKeyUpd010014
     * @tc.number SUB_ASSET_KEYUPD_0014
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010014 begin');
      await removeAssetPromise('uUpd010013', '');
      await addAssetPromise('uUpd010013', 'password8', 'l13');
      await updateAssetPromise('uUpd010013', 'newPassword', 'n13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010013', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010014 end');
    })

    /**
     * @tc.name   testKeyUpd010015
     * @tc.number SUB_ASSET_KEYUPD_0015
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010015 begin');
      await removeAssetPromise('uUpd010014', '');
      await addAssetPromise('uUpd010014', 'pwd_16_chars_123', 'l14');
      await updateAssetPromise('uUpd010014', 'npwd_16_chars_456', 'n14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010014', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010015 end');
    })

    /**
     * @tc.name   testKeyUpd010016
     * @tc.number SUB_ASSET_KEYUPD_0016
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010016 begin');
      await removeAssetPromise('uUpd010015', '');
      await addAssetPromise('uUpd010015', '中文密码', 'l15');
      await updateAssetPromise('uUpd010015', '新密码', 'n15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010015', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010016 end');
    })

    /**
     * @tc.name   testKeyUpd010017
     * @tc.number SUB_ASSET_KEYUPD_0017
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010017 begin');
      await removeAssetPromise('uUpd010016', '');
      await addAssetPromise('uUpd010016', 'pwd@#$%^&*()', 'l16');
      await updateAssetPromise('uUpd010016', 'npwd@#$%^&*()', 'n16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010016', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010017 end');
    })

    /**
     * @tc.name   testKeyUpd010018
     * @tc.number SUB_ASSET_KEYUPD_0018
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010018 begin');
      await removeAssetPromise('uUpd010017', '');
      await addAssetPromise('uUpd010017', '12345678', 'l17');
      await updateAssetPromise('uUpd010017', '87654321', 'n17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010017', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010018 end');
    })

    /**
     * @tc.name   testKeyUpd010019
     * @tc.number SUB_ASSET_KEYUPD_0019
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010019 begin');
      await removeAssetPromise('uUpd010018', '');
      await addAssetPromise('uUpd010018', 'p1', 'l18');
      await updateAssetPromise('uUpd010018', 'np1', 'n18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010018', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010019 end');
    })

    /**
     * @tc.name   testKeyUpd010020
     * @tc.number SUB_ASSET_KEYUPD_0020
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010020 begin');
      await removeAssetPromise('uUpd010019', '');
      await addAssetPromise('uUpd010019', 'password8', 'l19');
      await updateAssetPromise('uUpd010019', 'newPassword', 'n19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010019', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010020 end');
    })

    /**
     * @tc.name   testKeyUpd010021
     * @tc.number SUB_ASSET_KEYUPD_0021
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010021 begin');
      await removeAssetPromise('uUpd010020', '');
      await addAssetPromise('uUpd010020', 'pwd_16_chars_123', 'l20');
      await updateAssetPromise('uUpd010020', 'npwd_16_chars_456', 'n20');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010020', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010021 end');
    })

    /**
     * @tc.name   testKeyUpd010022
     * @tc.number SUB_ASSET_KEYUPD_0022
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010022 begin');
      await removeAssetPromise('uUpd010021', '');
      await addAssetPromise('uUpd010021', '中文密码', 'l21');
      await updateAssetPromise('uUpd010021', '新密码', 'n21');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010021', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010022 end');
    })

    /**
     * @tc.name   testKeyUpd010023
     * @tc.number SUB_ASSET_KEYUPD_0023
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010023 begin');
      await removeAssetPromise('uUpd010022', '');
      await addAssetPromise('uUpd010022', 'pwd@#$%^&*()', 'l22');
      await updateAssetPromise('uUpd010022', 'npwd@#$%^&*()', 'n22');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010022', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010023 end');
    })

    /**
     * @tc.name   testKeyUpd010024
     * @tc.number SUB_ASSET_KEYUPD_0024
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010024 begin');
      await removeAssetPromise('uUpd010023', '');
      await addAssetPromise('uUpd010023', '12345678', 'l23');
      await updateAssetPromise('uUpd010023', '87654321', 'n23');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010023', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010024 end');
    })

    /**
     * @tc.name   testKeyUpd010025
     * @tc.number SUB_ASSET_KEYUPD_0025
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010025 begin');
      await removeAssetPromise('uUpd010024', '');
      await addAssetPromise('uUpd010024', 'p1', 'l24');
      await updateAssetPromise('uUpd010024', 'np1', 'n24');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010024', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010025 end');
    })

    /**
     * @tc.name   testKeyUpd010026
     * @tc.number SUB_ASSET_KEYUPD_0026
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010026 begin');
      await removeAssetPromise('uUpd010025', '');
      await addAssetPromise('uUpd010025', 'password8', 'l25');
      await updateAssetPromise('uUpd010025', 'newPassword', 'n25');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010025', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010026 end');
    })

    /**
     * @tc.name   testKeyUpd010027
     * @tc.number SUB_ASSET_KEYUPD_0027
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010027 begin');
      await removeAssetPromise('uUpd010026', '');
      await addAssetPromise('uUpd010026', 'pwd_16_chars_123', 'l26');
      await updateAssetPromise('uUpd010026', 'npwd_16_chars_456', 'n26');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010026', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010027 end');
    })

    /**
     * @tc.name   testKeyUpd010028
     * @tc.number SUB_ASSET_KEYUPD_0028
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010028 begin');
      await removeAssetPromise('uUpd010027', '');
      await addAssetPromise('uUpd010027', '中文密码', 'l27');
      await updateAssetPromise('uUpd010027', '新密码', 'n27');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010027', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010028 end');
    })

    /**
     * @tc.name   testKeyUpd010029
     * @tc.number SUB_ASSET_KEYUPD_0029
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010029 begin');
      await removeAssetPromise('uUpd010028', '');
      await addAssetPromise('uUpd010028', 'pwd@#$%^&*()', 'l28');
      await updateAssetPromise('uUpd010028', 'npwd@#$%^&*()', 'n28');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010028', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010029 end');
    })

    /**
     * @tc.name   testKeyUpd010030
     * @tc.number SUB_ASSET_KEYUPD_0030
     * @tc.desc   合法值：更新单标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010030 begin');
      await removeAssetPromise('uUpd010029', '');
      await addAssetPromise('uUpd010029', '12345678', 'l29');
      await updateAssetPromise('uUpd010029', '87654321', 'n29');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010029', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010030 end');
    })

    /**
     * @tc.name   testKeyUpd010031
     * @tc.number SUB_ASSET_KEYUPD_0031
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010031 begin');
      await removeAssetPromise('uUpd010030', '');
      await addAssetPromise('uUpd010030', 'p1', 'g0');
      await updateAssetPromise('uUpd010030', 'np1', 'a0;b0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010030', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010031 end');
    })

    /**
     * @tc.name   testKeyUpd010032
     * @tc.number SUB_ASSET_KEYUPD_0032
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010032 begin');
      await removeAssetPromise('uUpd010031', '');
      await addAssetPromise('uUpd010031', 'password8', 'g1');
      await updateAssetPromise('uUpd010031', 'newPassword', 'a1;b1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010031', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010032 end');
    })

    /**
     * @tc.name   testKeyUpd010033
     * @tc.number SUB_ASSET_KEYUPD_0033
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010033 begin');
      await removeAssetPromise('uUpd010032', '');
      await addAssetPromise('uUpd010032', 'pwd_16_chars_123', 'g2');
      await updateAssetPromise('uUpd010032', 'npwd_16_chars_456', 'a2;b2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010032', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010033 end');
    })

    /**
     * @tc.name   testKeyUpd010034
     * @tc.number SUB_ASSET_KEYUPD_0034
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010034 begin');
      await removeAssetPromise('uUpd010033', '');
      await addAssetPromise('uUpd010033', '中文密码', 'g3');
      await updateAssetPromise('uUpd010033', '新密码', 'a3;b3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010033', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010034 end');
    })

    /**
     * @tc.name   testKeyUpd010035
     * @tc.number SUB_ASSET_KEYUPD_0035
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010035 begin');
      await removeAssetPromise('uUpd010034', '');
      await addAssetPromise('uUpd010034', 'pwd@#$%^&*()', 'g4');
      await updateAssetPromise('uUpd010034', 'npwd@#$%^&*()', 'a4;b4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010034', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010035 end');
    })

    /**
     * @tc.name   testKeyUpd010036
     * @tc.number SUB_ASSET_KEYUPD_0036
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010036 begin');
      await removeAssetPromise('uUpd010035', '');
      await addAssetPromise('uUpd010035', '12345678', 'l5');
      await updateAssetPromise('uUpd010035', '87654321', 'a5;b5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010035', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010036 end');
    })

    /**
     * @tc.name   testKeyUpd010037
     * @tc.number SUB_ASSET_KEYUPD_0037
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010037 begin');
      await removeAssetPromise('uUpd010036', '');
      await addAssetPromise('uUpd010036', 'p1', 'l6');
      await updateAssetPromise('uUpd010036', 'np1', 'a6;b6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010036', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010037 end');
    })

    /**
     * @tc.name   testKeyUpd010038
     * @tc.number SUB_ASSET_KEYUPD_0038
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010038 begin');
      await removeAssetPromise('uUpd010037', '');
      await addAssetPromise('uUpd010037', 'password8', 'l7');
      await updateAssetPromise('uUpd010037', 'newPassword', 'a7;b7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010037', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010038 end');
    })

    /**
     * @tc.name   testKeyUpd010039
     * @tc.number SUB_ASSET_KEYUPD_0039
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010039 begin');
      await removeAssetPromise('uUpd010038', '');
      await addAssetPromise('uUpd010038', 'pwd_16_chars_123', 'l8');
      await updateAssetPromise('uUpd010038', 'npwd_16_chars_456', 'a8;b8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010038', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010039 end');
    })

    /**
     * @tc.name   testKeyUpd010040
     * @tc.number SUB_ASSET_KEYUPD_0040
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010040 begin');
      await removeAssetPromise('uUpd010039', '');
      await addAssetPromise('uUpd010039', '中文密码', 'l9');
      await updateAssetPromise('uUpd010039', '新密码', 'a9;b9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010039', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010040 end');
    })

    /**
     * @tc.name   testKeyUpd010041
     * @tc.number SUB_ASSET_KEYUPD_0041
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010041 begin');
      await removeAssetPromise('uUpd010040', '');
      await addAssetPromise('uUpd010040', 'pwd@#$%^&*()', 'l10');
      await updateAssetPromise('uUpd010040', 'npwd@#$%^&*()', 'a10;b10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010040', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010041 end');
    })

    /**
     * @tc.name   testKeyUpd010042
     * @tc.number SUB_ASSET_KEYUPD_0042
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010042 begin');
      await removeAssetPromise('uUpd010041', '');
      await addAssetPromise('uUpd010041', '12345678', 'l11');
      await updateAssetPromise('uUpd010041', '87654321', 'a11;b11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010041', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010042 end');
    })

    /**
     * @tc.name   testKeyUpd010043
     * @tc.number SUB_ASSET_KEYUPD_0043
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010043 begin');
      await removeAssetPromise('uUpd010042', '');
      await addAssetPromise('uUpd010042', 'p1', 'l12');
      await updateAssetPromise('uUpd010042', 'np1', 'a12;b12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010042', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010043 end');
    })

    /**
     * @tc.name   testKeyUpd010044
     * @tc.number SUB_ASSET_KEYUPD_0044
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010044 begin');
      await removeAssetPromise('uUpd010043', '');
      await addAssetPromise('uUpd010043', 'password8', 'l13');
      await updateAssetPromise('uUpd010043', 'newPassword', 'a13;b13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010043', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010044 end');
    })

    /**
     * @tc.name   testKeyUpd010045
     * @tc.number SUB_ASSET_KEYUPD_0045
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010045 begin');
      await removeAssetPromise('uUpd010044', '');
      await addAssetPromise('uUpd010044', 'pwd_16_chars_123', 'l14');
      await updateAssetPromise('uUpd010044', 'npwd_16_chars_456', 'a14;b14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010044', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010045 end');
    })

    /**
     * @tc.name   testKeyUpd010046
     * @tc.number SUB_ASSET_KEYUPD_0046
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010046 begin');
      await removeAssetPromise('uUpd010045', '');
      await addAssetPromise('uUpd010045', '中文密码', 'l15');
      await updateAssetPromise('uUpd010045', '新密码', 'a15;b15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010045', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010046 end');
    })

    /**
     * @tc.name   testKeyUpd010047
     * @tc.number SUB_ASSET_KEYUPD_0047
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010047 begin');
      await removeAssetPromise('uUpd010046', '');
      await addAssetPromise('uUpd010046', 'pwd@#$%^&*()', 'l16');
      await updateAssetPromise('uUpd010046', 'npwd@#$%^&*()', 'a16;b16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010046', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010047 end');
    })

    /**
     * @tc.name   testKeyUpd010048
     * @tc.number SUB_ASSET_KEYUPD_0048
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010048 begin');
      await removeAssetPromise('uUpd010047', '');
      await addAssetPromise('uUpd010047', '12345678', 'l17');
      await updateAssetPromise('uUpd010047', '87654321', 'a17;b17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010047', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010048 end');
    })

    /**
     * @tc.name   testKeyUpd010049
     * @tc.number SUB_ASSET_KEYUPD_0049
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010049 begin');
      await removeAssetPromise('uUpd010048', '');
      await addAssetPromise('uUpd010048', 'p1', 'l18');
      await updateAssetPromise('uUpd010048', 'np1', 'a18;b18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010048', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010049 end');
    })

    /**
     * @tc.name   testKeyUpd010050
     * @tc.number SUB_ASSET_KEYUPD_0050
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010050 begin');
      await removeAssetPromise('uUpd010049', '');
      await addAssetPromise('uUpd010049', 'password8', 'l19');
      await updateAssetPromise('uUpd010049', 'newPassword', 'a19;b19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010049', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010050 end');
    })

    /**
     * @tc.name   testKeyUpd010051
     * @tc.number SUB_ASSET_KEYUPD_0051
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010051 begin');
      await removeAssetPromise('uUpd010050', '');
      await addAssetPromise('uUpd010050', 'pwd_16_chars_123', 'l20');
      await updateAssetPromise('uUpd010050', 'npwd_16_chars_456', 'a20;b20');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010050', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010051 end');
    })

    /**
     * @tc.name   testKeyUpd010052
     * @tc.number SUB_ASSET_KEYUPD_0052
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010052 begin');
      await removeAssetPromise('uUpd010051', '');
      await addAssetPromise('uUpd010051', '中文密码', 'l21');
      await updateAssetPromise('uUpd010051', '新密码', 'a21;b21');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010051', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010052 end');
    })

    /**
     * @tc.name   testKeyUpd010053
     * @tc.number SUB_ASSET_KEYUPD_0053
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010053 begin');
      await removeAssetPromise('uUpd010052', '');
      await addAssetPromise('uUpd010052', 'pwd@#$%^&*()', 'l22');
      await updateAssetPromise('uUpd010052', 'npwd@#$%^&*()', 'a22;b22');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010052', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010053 end');
    })

    /**
     * @tc.name   testKeyUpd010054
     * @tc.number SUB_ASSET_KEYUPD_0054
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010054 begin');
      await removeAssetPromise('uUpd010053', '');
      await addAssetPromise('uUpd010053', '12345678', 'l23');
      await updateAssetPromise('uUpd010053', '87654321', 'a23;b23');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010053', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010054 end');
    })

    /**
     * @tc.name   testKeyUpd010055
     * @tc.number SUB_ASSET_KEYUPD_0055
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010055 begin');
      await removeAssetPromise('uUpd010054', '');
      await addAssetPromise('uUpd010054', 'p1', 'l24');
      await updateAssetPromise('uUpd010054', 'np1', 'a24;b24');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010054', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010055 end');
    })

    /**
     * @tc.name   testKeyUpd010056
     * @tc.number SUB_ASSET_KEYUPD_0056
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010056 begin');
      await removeAssetPromise('uUpd010055', '');
      await addAssetPromise('uUpd010055', 'password8', 'l25');
      await updateAssetPromise('uUpd010055', 'newPassword', 'a25;b25');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010055', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010056 end');
    })

    /**
     * @tc.name   testKeyUpd010057
     * @tc.number SUB_ASSET_KEYUPD_0057
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010057 begin');
      await removeAssetPromise('uUpd010056', '');
      await addAssetPromise('uUpd010056', 'pwd_16_chars_123', 'l26');
      await updateAssetPromise('uUpd010056', 'npwd_16_chars_456', 'a26;b26');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010056', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010057 end');
    })

    /**
     * @tc.name   testKeyUpd010058
     * @tc.number SUB_ASSET_KEYUPD_0058
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010058 begin');
      await removeAssetPromise('uUpd010057', '');
      await addAssetPromise('uUpd010057', '中文密码', 'l27');
      await updateAssetPromise('uUpd010057', '新密码', 'a27;b27');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010057', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010058 end');
    })

    /**
     * @tc.name   testKeyUpd010059
     * @tc.number SUB_ASSET_KEYUPD_0059
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010059 begin');
      await removeAssetPromise('uUpd010058', '');
      await addAssetPromise('uUpd010058', 'pwd@#$%^&*()', 'l28');
      await updateAssetPromise('uUpd010058', 'npwd@#$%^&*()', 'a28;b28');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010058', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010059 end');
    })

    /**
     * @tc.name   testKeyUpd010060
     * @tc.number SUB_ASSET_KEYUPD_0060
     * @tc.desc   合法值：更新双标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010060 begin');
      await removeAssetPromise('uUpd010059', '');
      await addAssetPromise('uUpd010059', '12345678', 'l29');
      await updateAssetPromise('uUpd010059', '87654321', 'a29;b29');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010059', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010060 end');
    })

    /**
     * @tc.name   testKeyUpd010061
     * @tc.number SUB_ASSET_KEYUPD_0061
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010061 begin');
      await removeAssetPromise('uUpd010060', '');
      await addAssetPromise('uUpd010060', 'p1', 'g0');
      await updateAssetPromise('uUpd010060', 'np1', 'x0;y0;z0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010060', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010061 end');
    })

    /**
     * @tc.name   testKeyUpd010062
     * @tc.number SUB_ASSET_KEYUPD_0062
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010062 begin');
      await removeAssetPromise('uUpd010061', '');
      await addAssetPromise('uUpd010061', 'password8', 'g1');
      await updateAssetPromise('uUpd010061', 'newPassword', 'x1;y1;z1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010061', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010062 end');
    })

    /**
     * @tc.name   testKeyUpd010063
     * @tc.number SUB_ASSET_KEYUPD_0063
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010063 begin');
      await removeAssetPromise('uUpd010062', '');
      await addAssetPromise('uUpd010062', 'pwd_16_chars_123', 'g2');
      await updateAssetPromise('uUpd010062', 'npwd_16_chars_456', 'x2;y2;z2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010062', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010063 end');
    })

    /**
     * @tc.name   testKeyUpd010064
     * @tc.number SUB_ASSET_KEYUPD_0064
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010064 begin');
      await removeAssetPromise('uUpd010063', '');
      await addAssetPromise('uUpd010063', '中文密码', 'g3');
      await updateAssetPromise('uUpd010063', '新密码', 'x3;y3;z3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010063', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010064 end');
    })

    /**
     * @tc.name   testKeyUpd010065
     * @tc.number SUB_ASSET_KEYUPD_0065
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010065 begin');
      await removeAssetPromise('uUpd010064', '');
      await addAssetPromise('uUpd010064', 'pwd@#$%^&*()', 'g4');
      await updateAssetPromise('uUpd010064', 'npwd@#$%^&*()', 'x4;y4;z4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010064', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010065 end');
    })

    /**
     * @tc.name   testKeyUpd010066
     * @tc.number SUB_ASSET_KEYUPD_0066
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010066 begin');
      await removeAssetPromise('uUpd010065', '');
      await addAssetPromise('uUpd010065', '12345678', 'l5');
      await updateAssetPromise('uUpd010065', '87654321', 'x5;y5;z5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010065', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010066 end');
    })

    /**
     * @tc.name   testKeyUpd010067
     * @tc.number SUB_ASSET_KEYUPD_0067
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010067 begin');
      await removeAssetPromise('uUpd010066', '');
      await addAssetPromise('uUpd010066', 'p1', 'l6');
      await updateAssetPromise('uUpd010066', 'np1', 'x6;y6;z6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010066', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010067 end');
    })

    /**
     * @tc.name   testKeyUpd010068
     * @tc.number SUB_ASSET_KEYUPD_0068
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010068 begin');
      await removeAssetPromise('uUpd010067', '');
      await addAssetPromise('uUpd010067', 'password8', 'l7');
      await updateAssetPromise('uUpd010067', 'newPassword', 'x7;y7;z7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010067', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010068 end');
    })

    /**
     * @tc.name   testKeyUpd010069
     * @tc.number SUB_ASSET_KEYUPD_0069
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010069 begin');
      await removeAssetPromise('uUpd010068', '');
      await addAssetPromise('uUpd010068', 'pwd_16_chars_123', 'l8');
      await updateAssetPromise('uUpd010068', 'npwd_16_chars_456', 'x8;y8;z8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010068', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010069 end');
    })

    /**
     * @tc.name   testKeyUpd010070
     * @tc.number SUB_ASSET_KEYUPD_0070
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010070 begin');
      await removeAssetPromise('uUpd010069', '');
      await addAssetPromise('uUpd010069', '中文密码', 'l9');
      await updateAssetPromise('uUpd010069', '新密码', 'x9;y9;z9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010069', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010070 end');
    })

    /**
     * @tc.name   testKeyUpd010071
     * @tc.number SUB_ASSET_KEYUPD_0071
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010071 begin');
      await removeAssetPromise('uUpd010070', '');
      await addAssetPromise('uUpd010070', 'pwd@#$%^&*()', 'l10');
      await updateAssetPromise('uUpd010070', 'npwd@#$%^&*()', 'x10;y10;z10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010070', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010071 end');
    })

    /**
     * @tc.name   testKeyUpd010072
     * @tc.number SUB_ASSET_KEYUPD_0072
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010072 begin');
      await removeAssetPromise('uUpd010071', '');
      await addAssetPromise('uUpd010071', '12345678', 'l11');
      await updateAssetPromise('uUpd010071', '87654321', 'x11;y11;z11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010071', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010072 end');
    })

    /**
     * @tc.name   testKeyUpd010073
     * @tc.number SUB_ASSET_KEYUPD_0073
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010073 begin');
      await removeAssetPromise('uUpd010072', '');
      await addAssetPromise('uUpd010072', 'p1', 'l12');
      await updateAssetPromise('uUpd010072', 'np1', 'x12;y12;z12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010072', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010073 end');
    })

    /**
     * @tc.name   testKeyUpd010074
     * @tc.number SUB_ASSET_KEYUPD_0074
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010074 begin');
      await removeAssetPromise('uUpd010073', '');
      await addAssetPromise('uUpd010073', 'password8', 'l13');
      await updateAssetPromise('uUpd010073', 'newPassword', 'x13;y13;z13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010073', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010074 end');
    })

    /**
     * @tc.name   testKeyUpd010075
     * @tc.number SUB_ASSET_KEYUPD_0075
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010075 begin');
      await removeAssetPromise('uUpd010074', '');
      await addAssetPromise('uUpd010074', 'pwd_16_chars_123', 'l14');
      await updateAssetPromise('uUpd010074', 'npwd_16_chars_456', 'x14;y14;z14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010074', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010075 end');
    })

    /**
     * @tc.name   testKeyUpd010076
     * @tc.number SUB_ASSET_KEYUPD_0076
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010076 begin');
      await removeAssetPromise('uUpd010075', '');
      await addAssetPromise('uUpd010075', '中文密码', 'l15');
      await updateAssetPromise('uUpd010075', '新密码', 'x15;y15;z15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010075', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010076 end');
    })

    /**
     * @tc.name   testKeyUpd010077
     * @tc.number SUB_ASSET_KEYUPD_0077
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010077 begin');
      await removeAssetPromise('uUpd010076', '');
      await addAssetPromise('uUpd010076', 'pwd@#$%^&*()', 'l16');
      await updateAssetPromise('uUpd010076', 'npwd@#$%^&*()', 'x16;y16;z16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010076', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010077 end');
    })

    /**
     * @tc.name   testKeyUpd010078
     * @tc.number SUB_ASSET_KEYUPD_0078
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010078 begin');
      await removeAssetPromise('uUpd010077', '');
      await addAssetPromise('uUpd010077', '12345678', 'l17');
      await updateAssetPromise('uUpd010077', '87654321', 'x17;y17;z17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010077', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010078 end');
    })

    /**
     * @tc.name   testKeyUpd010079
     * @tc.number SUB_ASSET_KEYUPD_0079
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010079 begin');
      await removeAssetPromise('uUpd010078', '');
      await addAssetPromise('uUpd010078', 'p1', 'l18');
      await updateAssetPromise('uUpd010078', 'np1', 'x18;y18;z18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010078', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010079 end');
    })

    /**
     * @tc.name   testKeyUpd010080
     * @tc.number SUB_ASSET_KEYUPD_0080
     * @tc.desc   合法值：更新三标签后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010080 begin');
      await removeAssetPromise('uUpd010079', '');
      await addAssetPromise('uUpd010079', 'password8', 'l19');
      await updateAssetPromise('uUpd010079', 'newPassword', 'x19;y19;z19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010079', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010080 end');
    })

    /**
     * @tc.name   testKeyUpd010081
     * @tc.number SUB_ASSET_KEYUPD_0081
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010081 begin');
      await removeAssetPromise('uUpd010080', '');
      await addAssetPromise('uUpd010080', 'pwd_16_chars_123', 'g0');
      await updateAssetPromise('uUpd010080', 'npwd_16_chars_456', 'a0;b0;c0;d0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010080', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010081 end');
    })

    /**
     * @tc.name   testKeyUpd010082
     * @tc.number SUB_ASSET_KEYUPD_0082
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010082 begin');
      await removeAssetPromise('uUpd010081', '');
      await addAssetPromise('uUpd010081', '中文密码', 'g1');
      await updateAssetPromise('uUpd010081', '新密码', 'a1;b1;c1;d1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010081', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010082 end');
    })

    /**
     * @tc.name   testKeyUpd010083
     * @tc.number SUB_ASSET_KEYUPD_0083
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010083 begin');
      await removeAssetPromise('uUpd010082', '');
      await addAssetPromise('uUpd010082', 'pwd@#$%^&*()', 'g2');
      await updateAssetPromise('uUpd010082', 'npwd@#$%^&*()', 'a2;b2;c2;d2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010082', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010083 end');
    })

    /**
     * @tc.name   testKeyUpd010084
     * @tc.number SUB_ASSET_KEYUPD_0084
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010084 begin');
      await removeAssetPromise('uUpd010083', '');
      await addAssetPromise('uUpd010083', '12345678', 'g3');
      await updateAssetPromise('uUpd010083', '87654321', 'a3;b3;c3;d3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010083', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010084 end');
    })

    /**
     * @tc.name   testKeyUpd010085
     * @tc.number SUB_ASSET_KEYUPD_0085
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010085 begin');
      await removeAssetPromise('uUpd010084', '');
      await addAssetPromise('uUpd010084', 'p1', 'g4');
      await updateAssetPromise('uUpd010084', 'np1', 'a4;b4;c4;d4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010084', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010085 end');
    })

    /**
     * @tc.name   testKeyUpd010086
     * @tc.number SUB_ASSET_KEYUPD_0086
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010086 begin');
      await removeAssetPromise('uUpd010085', '');
      await addAssetPromise('uUpd010085', 'password8', 'l5');
      await updateAssetPromise('uUpd010085', 'newPassword', 'a5;b5;c5;d5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010085', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010086 end');
    })

    /**
     * @tc.name   testKeyUpd010087
     * @tc.number SUB_ASSET_KEYUPD_0087
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010087 begin');
      await removeAssetPromise('uUpd010086', '');
      await addAssetPromise('uUpd010086', 'pwd_16_chars_123', 'l6');
      await updateAssetPromise('uUpd010086', 'npwd_16_chars_456', 'a6;b6;c6;d6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010086', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010087 end');
    })

    /**
     * @tc.name   testKeyUpd010088
     * @tc.number SUB_ASSET_KEYUPD_0088
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010088 begin');
      await removeAssetPromise('uUpd010087', '');
      await addAssetPromise('uUpd010087', '中文密码', 'l7');
      await updateAssetPromise('uUpd010087', '新密码', 'a7;b7;c7;d7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010087', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010088 end');
    })

    /**
     * @tc.name   testKeyUpd010089
     * @tc.number SUB_ASSET_KEYUPD_0089
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010089 begin');
      await removeAssetPromise('uUpd010088', '');
      await addAssetPromise('uUpd010088', 'pwd@#$%^&*()', 'l8');
      await updateAssetPromise('uUpd010088', 'npwd@#$%^&*()', 'a8;b8;c8;d8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010088', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010089 end');
    })

    /**
     * @tc.name   testKeyUpd010090
     * @tc.number SUB_ASSET_KEYUPD_0090
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010090 begin');
      await removeAssetPromise('uUpd010089', '');
      await addAssetPromise('uUpd010089', '12345678', 'l9');
      await updateAssetPromise('uUpd010089', '87654321', 'a9;b9;c9;d9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010089', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010090 end');
    })

    /**
     * @tc.name   testKeyUpd010091
     * @tc.number SUB_ASSET_KEYUPD_0091
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010091 begin');
      await removeAssetPromise('uUpd010090', '');
      await addAssetPromise('uUpd010090', 'p1', 'l10');
      await updateAssetPromise('uUpd010090', 'np1', 'a10;b10;c10;d10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010090', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010091 end');
    })

    /**
     * @tc.name   testKeyUpd010092
     * @tc.number SUB_ASSET_KEYUPD_0092
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010092 begin');
      await removeAssetPromise('uUpd010091', '');
      await addAssetPromise('uUpd010091', 'password8', 'l11');
      await updateAssetPromise('uUpd010091', 'newPassword', 'a11;b11;c11;d11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010091', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010092 end');
    })

    /**
     * @tc.name   testKeyUpd010093
     * @tc.number SUB_ASSET_KEYUPD_0093
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010093 begin');
      await removeAssetPromise('uUpd010092', '');
      await addAssetPromise('uUpd010092', 'pwd_16_chars_123', 'l12');
      await updateAssetPromise('uUpd010092', 'npwd_16_chars_456', 'a12;b12;c12;d12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010092', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010093 end');
    })

    /**
     * @tc.name   testKeyUpd010094
     * @tc.number SUB_ASSET_KEYUPD_0094
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010094 begin');
      await removeAssetPromise('uUpd010093', '');
      await addAssetPromise('uUpd010093', '中文密码', 'l13');
      await updateAssetPromise('uUpd010093', '新密码', 'a13;b13;c13;d13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010093', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010094 end');
    })

    /**
     * @tc.name   testKeyUpd010095
     * @tc.number SUB_ASSET_KEYUPD_0095
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010095 begin');
      await removeAssetPromise('uUpd010094', '');
      await addAssetPromise('uUpd010094', 'pwd@#$%^&*()', 'l14');
      await updateAssetPromise('uUpd010094', 'npwd@#$%^&*()', 'a14;b14;c14;d14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010094', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010095 end');
    })

    /**
     * @tc.name   testKeyUpd010096
     * @tc.number SUB_ASSET_KEYUPD_0096
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010096 begin');
      await removeAssetPromise('uUpd010095', '');
      await addAssetPromise('uUpd010095', '12345678', 'l15');
      await updateAssetPromise('uUpd010095', '87654321', 'a15;b15;c15;d15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010095', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010096 end');
    })

    /**
     * @tc.name   testKeyUpd010097
     * @tc.number SUB_ASSET_KEYUPD_0097
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010097 begin');
      await removeAssetPromise('uUpd010096', '');
      await addAssetPromise('uUpd010096', 'p1', 'l16');
      await updateAssetPromise('uUpd010096', 'np1', 'a16;b16;c16;d16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010096', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010097 end');
    })

    /**
     * @tc.name   testKeyUpd010098
     * @tc.number SUB_ASSET_KEYUPD_0098
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010098 begin');
      await removeAssetPromise('uUpd010097', '');
      await addAssetPromise('uUpd010097', 'password8', 'l17');
      await updateAssetPromise('uUpd010097', 'newPassword', 'a17;b17;c17;d17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010097', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010098 end');
    })

    /**
     * @tc.name   testKeyUpd010099
     * @tc.number SUB_ASSET_KEYUPD_0099
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010099 begin');
      await removeAssetPromise('uUpd010098', '');
      await addAssetPromise('uUpd010098', 'pwd_16_chars_123', 'l18');
      await updateAssetPromise('uUpd010098', 'npwd_16_chars_456', 'a18;b18;c18;d18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010098', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010099 end');
    })

    /**
     * @tc.name   testKeyUpd010100
     * @tc.number SUB_ASSET_KEYUPD_0100
     * @tc.desc   边界值：更新四标签上界后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010100 begin');
      await removeAssetPromise('uUpd010099', '');
      await addAssetPromise('uUpd010099', '中文密码', 'l19');
      await updateAssetPromise('uUpd010099', '新密码', 'a19;b19;c19;d19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010099', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010100 end');
    })

    /**
     * @tc.name   testKeyUpd010101
     * @tc.number SUB_ASSET_KEYUPD_0101
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010101 begin');
      await removeAssetPromise('uUpd010100', '');
      await addAssetPromise('uUpd010100', 'pwd@#$%^&*()', 'g0');
      await updateAssetPromise('uUpd010100', 'npwd@#$%^&*()', 'a0;b0;c0;d0;e0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010100', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010101 end');
    })

    /**
     * @tc.name   testKeyUpd010102
     * @tc.number SUB_ASSET_KEYUPD_0102
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010102 begin');
      await removeAssetPromise('uUpd010101', '');
      await addAssetPromise('uUpd010101', '12345678', 'g1');
      await updateAssetPromise('uUpd010101', '87654321', 'a1;b1;c1;d1;e1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010101', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010102 end');
    })

    /**
     * @tc.name   testKeyUpd010103
     * @tc.number SUB_ASSET_KEYUPD_0103
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010103 begin');
      await removeAssetPromise('uUpd010102', '');
      await addAssetPromise('uUpd010102', 'p1', 'g2');
      await updateAssetPromise('uUpd010102', 'np1', 'a2;b2;c2;d2;e2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010102', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010103 end');
    })

    /**
     * @tc.name   testKeyUpd010104
     * @tc.number SUB_ASSET_KEYUPD_0104
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010104 begin');
      await removeAssetPromise('uUpd010103', '');
      await addAssetPromise('uUpd010103', 'password8', 'g3');
      await updateAssetPromise('uUpd010103', 'newPassword', 'a3;b3;c3;d3;e3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010103', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010104 end');
    })

    /**
     * @tc.name   testKeyUpd010105
     * @tc.number SUB_ASSET_KEYUPD_0105
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010105 begin');
      await removeAssetPromise('uUpd010104', '');
      await addAssetPromise('uUpd010104', 'pwd_16_chars_123', 'g4');
      await updateAssetPromise('uUpd010104', 'npwd_16_chars_456', 'a4;b4;c4;d4;e4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010104', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010105 end');
    })

    /**
     * @tc.name   testKeyUpd010106
     * @tc.number SUB_ASSET_KEYUPD_0106
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010106 begin');
      await removeAssetPromise('uUpd010105', '');
      await addAssetPromise('uUpd010105', '中文密码', 'l5');
      await updateAssetPromise('uUpd010105', '新密码', 'a5;b5;c5;d5;e5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010105', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010106 end');
    })

    /**
     * @tc.name   testKeyUpd010107
     * @tc.number SUB_ASSET_KEYUPD_0107
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010107 begin');
      await removeAssetPromise('uUpd010106', '');
      await addAssetPromise('uUpd010106', 'pwd@#$%^&*()', 'l6');
      await updateAssetPromise('uUpd010106', 'npwd@#$%^&*()', 'a6;b6;c6;d6;e6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010106', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010107 end');
    })

    /**
     * @tc.name   testKeyUpd010108
     * @tc.number SUB_ASSET_KEYUPD_0108
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010108 begin');
      await removeAssetPromise('uUpd010107', '');
      await addAssetPromise('uUpd010107', '12345678', 'l7');
      await updateAssetPromise('uUpd010107', '87654321', 'a7;b7;c7;d7;e7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010107', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010108 end');
    })

    /**
     * @tc.name   testKeyUpd010109
     * @tc.number SUB_ASSET_KEYUPD_0109
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010109 begin');
      await removeAssetPromise('uUpd010108', '');
      await addAssetPromise('uUpd010108', 'p1', 'l8');
      await updateAssetPromise('uUpd010108', 'np1', 'a8;b8;c8;d8;e8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010108', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010109 end');
    })

    /**
     * @tc.name   testKeyUpd010110
     * @tc.number SUB_ASSET_KEYUPD_0110
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010110 begin');
      await removeAssetPromise('uUpd010109', '');
      await addAssetPromise('uUpd010109', 'password8', 'l9');
      await updateAssetPromise('uUpd010109', 'newPassword', 'a9;b9;c9;d9;e9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010109', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010110 end');
    })

    /**
     * @tc.name   testKeyUpd010111
     * @tc.number SUB_ASSET_KEYUPD_0111
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010111 begin');
      await removeAssetPromise('uUpd010110', '');
      await addAssetPromise('uUpd010110', 'pwd_16_chars_123', 'l10');
      await updateAssetPromise('uUpd010110', 'npwd_16_chars_456', 'a10;b10;c10;d10;e10');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010110', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010111 end');
    })

    /**
     * @tc.name   testKeyUpd010112
     * @tc.number SUB_ASSET_KEYUPD_0112
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010112 begin');
      await removeAssetPromise('uUpd010111', '');
      await addAssetPromise('uUpd010111', '中文密码', 'l11');
      await updateAssetPromise('uUpd010111', '新密码', 'a11;b11;c11;d11;e11');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010111', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010112 end');
    })

    /**
     * @tc.name   testKeyUpd010113
     * @tc.number SUB_ASSET_KEYUPD_0113
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010113 begin');
      await removeAssetPromise('uUpd010112', '');
      await addAssetPromise('uUpd010112', 'pwd@#$%^&*()', 'l12');
      await updateAssetPromise('uUpd010112', 'npwd@#$%^&*()', 'a12;b12;c12;d12;e12');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010112', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010113 end');
    })

    /**
     * @tc.name   testKeyUpd010114
     * @tc.number SUB_ASSET_KEYUPD_0114
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010114 begin');
      await removeAssetPromise('uUpd010113', '');
      await addAssetPromise('uUpd010113', '12345678', 'l13');
      await updateAssetPromise('uUpd010113', '87654321', 'a13;b13;c13;d13;e13');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010113', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010114 end');
    })

    /**
     * @tc.name   testKeyUpd010115
     * @tc.number SUB_ASSET_KEYUPD_0115
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010115 begin');
      await removeAssetPromise('uUpd010114', '');
      await addAssetPromise('uUpd010114', 'p1', 'l14');
      await updateAssetPromise('uUpd010114', 'np1', 'a14;b14;c14;d14;e14');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010114', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010115 end');
    })

    /**
     * @tc.name   testKeyUpd010116
     * @tc.number SUB_ASSET_KEYUPD_0116
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010116 begin');
      await removeAssetPromise('uUpd010115', '');
      await addAssetPromise('uUpd010115', 'password8', 'l15');
      await updateAssetPromise('uUpd010115', 'newPassword', 'a15;b15;c15;d15;e15');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010115', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010116 end');
    })

    /**
     * @tc.name   testKeyUpd010117
     * @tc.number SUB_ASSET_KEYUPD_0117
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010117 begin');
      await removeAssetPromise('uUpd010116', '');
      await addAssetPromise('uUpd010116', 'pwd_16_chars_123', 'l16');
      await updateAssetPromise('uUpd010116', 'npwd_16_chars_456', 'a16;b16;c16;d16;e16');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010116', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010117 end');
    })

    /**
     * @tc.name   testKeyUpd010118
     * @tc.number SUB_ASSET_KEYUPD_0118
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010118 begin');
      await removeAssetPromise('uUpd010117', '');
      await addAssetPromise('uUpd010117', '中文密码', 'l17');
      await updateAssetPromise('uUpd010117', '新密码', 'a17;b17;c17;d17;e17');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010117', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010118 end');
    })

    /**
     * @tc.name   testKeyUpd010119
     * @tc.number SUB_ASSET_KEYUPD_0119
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010119 begin');
      await removeAssetPromise('uUpd010118', '');
      await addAssetPromise('uUpd010118', 'pwd@#$%^&*()', 'l18');
      await updateAssetPromise('uUpd010118', 'npwd@#$%^&*()', 'a18;b18;c18;d18;e18');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010118', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010119 end');
    })

    /**
     * @tc.name   testKeyUpd010120
     * @tc.number SUB_ASSET_KEYUPD_0120
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010120 begin');
      await removeAssetPromise('uUpd010119', '');
      await addAssetPromise('uUpd010119', '12345678', 'l19');
      await updateAssetPromise('uUpd010119', '87654321', 'a19;b19;c19;d19;e19');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010119', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010120 end');
    })

    /**
     * @tc.name   testKeyUpd010121
     * @tc.number SUB_ASSET_KEYUPD_0121
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010121 begin');
      await removeAssetPromise('uUpd010120', '');
      await addAssetPromise('uUpd010120', 'p1', 'l20');
      await updateAssetPromise('uUpd010120', 'np1', 'a20;b20;c20;d20;e20');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010120', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010121 end');
    })

    /**
     * @tc.name   testKeyUpd010122
     * @tc.number SUB_ASSET_KEYUPD_0122
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010122 begin');
      await removeAssetPromise('uUpd010121', '');
      await addAssetPromise('uUpd010121', 'password8', 'l21');
      await updateAssetPromise('uUpd010121', 'newPassword', 'a21;b21;c21;d21;e21');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010121', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010122 end');
    })

    /**
     * @tc.name   testKeyUpd010123
     * @tc.number SUB_ASSET_KEYUPD_0123
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010123 begin');
      await removeAssetPromise('uUpd010122', '');
      await addAssetPromise('uUpd010122', 'pwd_16_chars_123', 'l22');
      await updateAssetPromise('uUpd010122', 'npwd_16_chars_456', 'a22;b22;c22;d22;e22');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010122', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010123 end');
    })

    /**
     * @tc.name   testKeyUpd010124
     * @tc.number SUB_ASSET_KEYUPD_0124
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010124 begin');
      await removeAssetPromise('uUpd010123', '');
      await addAssetPromise('uUpd010123', '中文密码', 'l23');
      await updateAssetPromise('uUpd010123', '新密码', 'a23;b23;c23;d23;e23');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010123', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010124 end');
    })

    /**
     * @tc.name   testKeyUpd010125
     * @tc.number SUB_ASSET_KEYUPD_0125
     * @tc.desc   非法值：更新五标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010125 begin');
      await removeAssetPromise('uUpd010124', '');
      await addAssetPromise('uUpd010124', 'pwd@#$%^&*()', 'l24');
      await updateAssetPromise('uUpd010124', 'npwd@#$%^&*()', 'a24;b24;c24;d24;e24');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010124', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010125 end');
    })

    /**
     * @tc.name   testKeyUpd010126
     * @tc.number SUB_ASSET_KEYUPD_0126
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010126 begin');
      await removeAssetPromise('uUpd010125', '');
      await addAssetPromise('uUpd010125', '12345678', 'g0');
      await updateAssetPromise('uUpd010125', '87654321', 'a0;b0;c0;d0;e0;f0');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010125', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010126 end');
    })

    /**
     * @tc.name   testKeyUpd010127
     * @tc.number SUB_ASSET_KEYUPD_0127
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010127 begin');
      await removeAssetPromise('uUpd010126', '');
      await addAssetPromise('uUpd010126', 'p1', 'g1');
      await updateAssetPromise('uUpd010126', 'np1', 'a1;b1;c1;d1;e1;f1');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010126', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010127 end');
    })

    /**
     * @tc.name   testKeyUpd010128
     * @tc.number SUB_ASSET_KEYUPD_0128
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010128 begin');
      await removeAssetPromise('uUpd010127', '');
      await addAssetPromise('uUpd010127', 'password8', 'g2');
      await updateAssetPromise('uUpd010127', 'newPassword', 'a2;b2;c2;d2;e2;f2');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010127', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010128 end');
    })

    /**
     * @tc.name   testKeyUpd010129
     * @tc.number SUB_ASSET_KEYUPD_0129
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010129 begin');
      await removeAssetPromise('uUpd010128', '');
      await addAssetPromise('uUpd010128', 'pwd_16_chars_123', 'g3');
      await updateAssetPromise('uUpd010128', 'npwd_16_chars_456', 'a3;b3;c3;d3;e3;f3');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010128', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010129 end');
    })

    /**
     * @tc.name   testKeyUpd010130
     * @tc.number SUB_ASSET_KEYUPD_0130
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010130 begin');
      await removeAssetPromise('uUpd010129', '');
      await addAssetPromise('uUpd010129', '中文密码', 'g4');
      await updateAssetPromise('uUpd010129', '新密码', 'a4;b4;c4;d4;e4;f4');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010129', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010130 end');
    })

    /**
     * @tc.name   testKeyUpd010131
     * @tc.number SUB_ASSET_KEYUPD_0131
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010131 begin');
      await removeAssetPromise('uUpd010130', '');
      await addAssetPromise('uUpd010130', 'pwd@#$%^&*()', 'l5');
      await updateAssetPromise('uUpd010130', 'npwd@#$%^&*()', 'a5;b5;c5;d5;e5;f5');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010130', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010131 end');
    })

    /**
     * @tc.name   testKeyUpd010132
     * @tc.number SUB_ASSET_KEYUPD_0132
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010132 begin');
      await removeAssetPromise('uUpd010131', '');
      await addAssetPromise('uUpd010131', '12345678', 'l6');
      await updateAssetPromise('uUpd010131', '87654321', 'a6;b6;c6;d6;e6;f6');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010131', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010132 end');
    })

    /**
     * @tc.name   testKeyUpd010133
     * @tc.number SUB_ASSET_KEYUPD_0133
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010133 begin');
      await removeAssetPromise('uUpd010132', '');
      await addAssetPromise('uUpd010132', 'p1', 'l7');
      await updateAssetPromise('uUpd010132', 'np1', 'a7;b7;c7;d7;e7;f7');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010132', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010133 end');
    })

    /**
     * @tc.name   testKeyUpd010134
     * @tc.number SUB_ASSET_KEYUPD_0134
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010134 begin');
      await removeAssetPromise('uUpd010133', '');
      await addAssetPromise('uUpd010133', 'password8', 'l8');
      await updateAssetPromise('uUpd010133', 'newPassword', 'a8;b8;c8;d8;e8;f8');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010133', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010134 end');
    })

    /**
     * @tc.name   testKeyUpd010135
     * @tc.number SUB_ASSET_KEYUPD_0135
     * @tc.desc   非法值：更新六标签超上界提前返回不可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010135 begin');
      await removeAssetPromise('uUpd010134', '');
      await addAssetPromise('uUpd010134', 'pwd_16_chars_123', 'l9');
      await updateAssetPromise('uUpd010134', 'npwd_16_chars_456', 'a9;b9;c9;d9;e9;f9');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010134', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010135 end');
    })

    /**
     * @tc.name   testKeyUpd010136
     * @tc.number SUB_ASSET_KEYUPD_0136
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010136 begin');
      await removeAssetPromise('uUpd010135', '');
      await addAssetPromise('uUpd010135', '中文密码', 'g0');
      await updateAssetPromise('uUpd010135', '新密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010135', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010136 end');
    })

    /**
     * @tc.name   testKeyUpd010137
     * @tc.number SUB_ASSET_KEYUPD_0137
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010137 begin');
      await removeAssetPromise('uUpd010136', '');
      await addAssetPromise('uUpd010136', 'pwd@#$%^&*()', 'g1');
      await updateAssetPromise('uUpd010136', 'npwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010136', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010137 end');
    })

    /**
     * @tc.name   testKeyUpd010138
     * @tc.number SUB_ASSET_KEYUPD_0138
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010138 begin');
      await removeAssetPromise('uUpd010137', '');
      await addAssetPromise('uUpd010137', '12345678', 'g2');
      await updateAssetPromise('uUpd010137', '87654321', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010137', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010138 end');
    })

    /**
     * @tc.name   testKeyUpd010139
     * @tc.number SUB_ASSET_KEYUPD_0139
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010139 begin');
      await removeAssetPromise('uUpd010138', '');
      await addAssetPromise('uUpd010138', 'p1', 'g3');
      await updateAssetPromise('uUpd010138', 'np1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010138', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010139 end');
    })

    /**
     * @tc.name   testKeyUpd010140
     * @tc.number SUB_ASSET_KEYUPD_0140
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010140 begin');
      await removeAssetPromise('uUpd010139', '');
      await addAssetPromise('uUpd010139', 'password8', 'g4');
      await updateAssetPromise('uUpd010139', 'newPassword', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010139', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010140 end');
    })

    /**
     * @tc.name   testKeyUpd010141
     * @tc.number SUB_ASSET_KEYUPD_0141
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010141 begin');
      await removeAssetPromise('uUpd010140', '');
      await addAssetPromise('uUpd010140', 'pwd_16_chars_123', 'l5');
      await updateAssetPromise('uUpd010140', 'npwd_16_chars_456', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010140', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010141 end');
    })

    /**
     * @tc.name   testKeyUpd010142
     * @tc.number SUB_ASSET_KEYUPD_0142
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010142 begin');
      await removeAssetPromise('uUpd010141', '');
      await addAssetPromise('uUpd010141', '中文密码', 'l6');
      await updateAssetPromise('uUpd010141', '新密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010141', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010142 end');
    })

    /**
     * @tc.name   testKeyUpd010143
     * @tc.number SUB_ASSET_KEYUPD_0143
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010143 begin');
      await removeAssetPromise('uUpd010142', '');
      await addAssetPromise('uUpd010142', 'pwd@#$%^&*()', 'l7');
      await updateAssetPromise('uUpd010142', 'npwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010142', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010143 end');
    })

    /**
     * @tc.name   testKeyUpd010144
     * @tc.number SUB_ASSET_KEYUPD_0144
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010144 begin');
      await removeAssetPromise('uUpd010143', '');
      await addAssetPromise('uUpd010143', '12345678', 'l8');
      await updateAssetPromise('uUpd010143', '87654321', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010143', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010144 end');
    })

    /**
     * @tc.name   testKeyUpd010145
     * @tc.number SUB_ASSET_KEYUPD_0145
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010145 begin');
      await removeAssetPromise('uUpd010144', '');
      await addAssetPromise('uUpd010144', 'p1', 'l9');
      await updateAssetPromise('uUpd010144', 'np1', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010144', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010145 end');
    })

    /**
     * @tc.name   testKeyUpd010146
     * @tc.number SUB_ASSET_KEYUPD_0146
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010146 begin');
      await removeAssetPromise('uUpd010145', '');
      await addAssetPromise('uUpd010145', 'password8', 'l10');
      await updateAssetPromise('uUpd010145', 'newPassword', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010145', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010146 end');
    })

    /**
     * @tc.name   testKeyUpd010147
     * @tc.number SUB_ASSET_KEYUPD_0147
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010147 begin');
      await removeAssetPromise('uUpd010146', '');
      await addAssetPromise('uUpd010146', 'pwd_16_chars_123', 'l11');
      await updateAssetPromise('uUpd010146', 'npwd_16_chars_456', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010146', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010147 end');
    })

    /**
     * @tc.name   testKeyUpd010148
     * @tc.number SUB_ASSET_KEYUPD_0148
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010148 begin');
      await removeAssetPromise('uUpd010147', '');
      await addAssetPromise('uUpd010147', '中文密码', 'l12');
      await updateAssetPromise('uUpd010147', '新密码', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010147', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010148 end');
    })

    /**
     * @tc.name   testKeyUpd010149
     * @tc.number SUB_ASSET_KEYUPD_0149
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010149', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010149 begin');
      await removeAssetPromise('uUpd010148', '');
      await addAssetPromise('uUpd010148', 'pwd@#$%^&*()', 'l13');
      await updateAssetPromise('uUpd010148', 'npwd@#$%^&*()', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010148', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010149 end');
    })

    /**
     * @tc.name   testKeyUpd010150
     * @tc.number SUB_ASSET_KEYUPD_0150
     * @tc.desc   边界值：更新空标签清空后按账号查询可见
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testKeyUpd010150', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010150 begin');
      await removeAssetPromise('uUpd010149', '');
      await addAssetPromise('uUpd010149', '12345678', 'l14');
      await updateAssetPromise('uUpd010149', '87654321', '');
      const result: Map<string, string>[] = await queryAssetPromise('uUpd010149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, 'actual=%{public}s expected=%{public}s', String(result.length), String(1));
      expect(result.length).assertEqual(1);
      hilog.info(LOG_DOMAIN, LOG_TAG, 'value=%{public}s', String(result instanceof Array));
      expect(result instanceof Array).assertTrue();
      hilog.info(LOG_DOMAIN, LOG_TAG,
        'actual=%{public}s expected=%{public}s',
        String(String(result.length)),
        String('1'));
      expect(String(result.length)).assertEqual('1');
      await removeAssetPromise('uUpd010149', '');
      hilog.info(LOG_DOMAIN, LOG_TAG, '%{public}s', 'testKeyUpd010150 end');
    })

  })
}
