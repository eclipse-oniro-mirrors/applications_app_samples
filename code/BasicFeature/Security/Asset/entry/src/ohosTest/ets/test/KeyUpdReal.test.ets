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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function keyUpdReal() {
  describe('KeyUpdRealTest', () => {
    /**
     * @tc.number SUB_ASSET_KEYUPD_0301
     * @tc.name testKeyUpd0301
     * @tc.desc 合法值：更新已存在资产 secret 生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyUpd0301', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0301 begin');
      const alias: string = 'uUpd0301';
      await addAssetPromise(alias, 'oldPwd', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'newPwd', 'l1');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'newPwd');
      expect(result[0].get('secret') as string).assertEqual('newPwd');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0301 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0302
     * @tc.name testKeyUpd0302
     * @tc.desc 合法值：更新标签为 1 个生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyUpd0302', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0302 begin');
      const alias: string = 'uUpd0302';
      await addAssetPromise(alias, 'pwd0302', 'l1;l2');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0302', 'x');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'x');
      expect(result[0].get('label') as string).assertEqual('x');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0302 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0303
     * @tc.name testKeyUpd0303
     * @tc.desc 合法值：更新标签为 2 个生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyUpd0303', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0303 begin');
      const alias: string = 'uUpd0303';
      await addAssetPromise(alias, 'pwd0303', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0303', 'x;y');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'x;y');
      expect(result[0].get('label') as string).assertEqual('x;y');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0303 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0304
     * @tc.name testKeyUpd0304
     * @tc.desc 边界值：更新 4 个标签上界生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0304', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0304 begin');
      const alias: string = 'uUpd0304';
      await addAssetPromise(alias, 'pwd0304', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0304', 'a;b;c;d');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'a;b;c;d');
      expect(result[0].get('label') as string).assertEqual('a;b;c;d');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0304 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0305
     * @tc.name testKeyUpd0305
     * @tc.desc 边界值：更新空标签清空标签，secret 保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0305', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0305 begin');
      const alias: string = 'uUpd0305';
      await addAssetPromise(alias, 'pwd0305', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0305', '');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, '');
      expect(result[0].get('label') as string).assertEqual('');
      expect(result[0].get('secret') as string).assertEqual('pwd0305');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0305 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0306
     * @tc.name testKeyUpd0306
     * @tc.desc 非法值：更新 5 个标签超上界提前返回，原值保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0306', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0306 begin');
      const alias: string = 'uUpd0306';
      await addAssetPromise(alias, 'pwd0306', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0306', 'a;b;c;d;e');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'l1');
      expect(result[0].get('label') as string).assertEqual('l1');
      expect(result[0].get('secret') as string).assertEqual('pwd0306');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0306 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0307
     * @tc.name testKeyUpd0307
     * @tc.desc 非法值：更新不存在账号不抛异常且不落库
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0307', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0307 begin');
      let thrown: boolean = false;
      try {
        await updateAssetPromise('uUpd0307_not_exist', 'pwd0307', 'l1');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise('uUpd0307_not_exist', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0307: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'uUpd0307_not_exist') {
          contains0307 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0307), 'false');
      expect(contains0307).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0307 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0308
     * @tc.name testKeyUpd0308
     * @tc.desc 边界值：更新单字符密码生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0308', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0308 begin');
      const alias: string = 'uUpd0308';
      await addAssetPromise(alias, 'pwd0308', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'x', 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'x');
      expect(result[0].get('secret') as string).assertEqual('x');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0308 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0309
     * @tc.name testKeyUpd0309
     * @tc.desc 组合值：更新中文 secret 生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0309', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0309 begin');
      const alias: string = 'uUpd0309';
      await addAssetPromise(alias, 'oldPwd', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, '密码0309', 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, '密码0309');
      expect(result[0].get('secret') as string).assertEqual('密码0309');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0309 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0310
     * @tc.name testKeyUpd0310
     * @tc.desc 组合值：更新特殊符号 secret 生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0310', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0310 begin');
      const alias: string = 'uUpd0310';
      await addAssetPromise(alias, 'oldPwd', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, '@#$%^&*()', 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, '@#$%^&*()');
      expect(result[0].get('secret') as string).assertEqual('@#$%^&*()');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0310 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0311
     * @tc.name testKeyUpd0311
     * @tc.desc 状态值：连续两次更新第二次生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0311', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0311 begin');
      const alias: string = 'uUpd0311';
      await addAssetPromise(alias, 'initPwd', 'l1');
      await updateAssetPromise(alias, 'firstPwd', 'l1');
      await updateAssetPromise(alias, 'secondPwd', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'secondPwd');
      expect(result[0].get('secret') as string).assertEqual('secondPwd');
      expect(result[0].get('label') as string).assertEqual('l1');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0311 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0312
     * @tc.name testKeyUpd0312
     * @tc.desc 状态值：更新标签后按新标签查询可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0312', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0312 begin');
      const alias: string = 'uUpd0312';
      await addAssetPromise(alias, 'pwd0312', 'oldTag');
      await updateAssetPromise(alias, 'pwd0312', 'newTag');
      const byNew: Map<string, string>[] = await queryAssetPromise(alias, 'newTag');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', byNew.length, 1);
      expect(byNew.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', byNew[0].get('label') as string, 'newTag');
      expect(byNew[0].get('label') as string).assertEqual('newTag');
      expect(byNew[0].get('secret') as string).assertEqual('pwd0312');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0312 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0313
     * @tc.name testKeyUpd0313
     * @tc.desc 状态值：更新标签后按旧标签查询不可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0313', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0313 begin');
      const alias: string = 'uUpd0313';
      await addAssetPromise(alias, 'pwd0313', 'oldTag');
      await updateAssetPromise(alias, 'pwd0313', 'newTag');
      const byOld: Map<string, string>[] = await queryAssetPromise(alias, 'oldTag');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', byOld.length, 0);
      expect(byOld.length).assertEqual(0);
      const byAlias: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', byAlias.length, 1);
      expect(byAlias.length).assertEqual(1);
      expect(byAlias[0].get('label') as string).assertEqual('newTag');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0313 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0314
     * @tc.name testKeyUpd0314
     * @tc.desc 极值：更新 1000 字符密码生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyUpd0314', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0314 begin');
      const alias: string = 'uUpd0314';
      let pwd: string = '';
      for (let i: number = 0; i < 1000; i++) {
        pwd += 'P';
      }
      await addAssetPromise(alias, 'initPwd', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, pwd, 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d',
        (result[0].get('secret') as string).length, 1000);
      expect((result[0].get('secret') as string).length).assertEqual(1000);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0314 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0315
     * @tc.name testKeyUpd0315
     * @tc.desc 极值：更新 1000 字符标签生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyUpd0315', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0315 begin');
      const alias: string = 'uUpd0315';
      let label: string = '';
      for (let i: number = 0; i < 1000; i++) {
        label += 'L';
      }
      await addAssetPromise(alias, 'pwd0315', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0315', label);
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d',
        (result[0].get('label') as string).length, 1000);
      expect((result[0].get('label') as string).length).assertEqual(1000);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0315 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0316
     * @tc.name testKeyUpd0316
     * @tc.desc 非法值：重复标签去重后更新保存
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0316', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0316 begin');
      const alias: string = 'uUpd0316';
      await addAssetPromise(alias, 'pwd0316', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0316', 'd;d');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'd');
      expect(result[0].get('label') as string).assertEqual('d');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0316 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0317
     * @tc.name testKeyUpd0317
     * @tc.desc 组合值：更新中文标签生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0317', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0317 begin');
      const alias: string = 'uUpd0317';
      await addAssetPromise(alias, 'pwd0317', 'l1');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'pwd0317', '标签0317');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, '标签0317');
      expect(result[0].get('label') as string).assertEqual('标签0317');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0317 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0318
     * @tc.name testKeyUpd0318
     * @tc.desc 边界值：secret 与标签同时更新均生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0318', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0318 begin');
      const alias: string = 'uUpd0318';
      await addAssetPromise(alias, 'oldPwd', 'oldL1;oldL2');
      let thrown: boolean = false;
      try {
        await updateAssetPromise(alias, 'newPwd', 'nl1;nl2');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'newPwd');
      expect(result[0].get('secret') as string).assertEqual('newPwd');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'nl1;nl2');
      expect(result[0].get('label') as string).assertEqual('nl1;nl2');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0318 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0319
     * @tc.name testKeyUpd0319
     * @tc.desc 状态值：删除重建后更新生效
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyUpd0319', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0319 begin');
      const alias: string = 'uUpd0319';
      await addAssetPromise(alias, 'firstPwd', 'l1');
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'secondPwd', 'l2');
      await updateAssetPromise(alias, 'thirdPwd', 'l2');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'thirdPwd');
      expect(result[0].get('secret') as string).assertEqual('thirdPwd');
      expect(result[0].get('label') as string).assertEqual('l2');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0319 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYUPD_0320
     * @tc.name testKeyUpd0320
     * @tc.desc 非法值：不存在账号加 5 个标签提前返回，不抛异常不落库
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyUpd0320', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0320 begin');
      let thrown: boolean = false;
      try {
        await updateAssetPromise('uUpd0320_not_exist', 'pwd0320', 'a;b;c;d;e');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise('uUpd0320_not_exist', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0320: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'uUpd0320_not_exist') {
          contains0320 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0320), 'false');
      expect(contains0320).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyUpd0320 end');
    });
  });
}


