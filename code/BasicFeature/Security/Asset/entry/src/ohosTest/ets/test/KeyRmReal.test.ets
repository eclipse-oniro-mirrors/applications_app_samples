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

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Asset]';

export default function keyRmReal() {
  describe('KeyRmRealTest', () => {
    /**
     * @tc.number SUB_ASSET_KEYRM_0451
     * @tc.name testKeyRm0451
     * @tc.desc 合法值：按账号删除已保存资产，查询不可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyRm0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0451 begin');
      const alias: string = 'uRm0451';
      await addAssetPromise(alias, 'pwd0451', 'l1');
      const before: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(before.length).assertEqual(1);
      let thrown: boolean = false;
      try {
        await removeAssetPromise(alias, '');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0451 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0452
     * @tc.name testKeyRm0452
     * @tc.desc 合法值：按账号+单个标签删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyRm0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0452 begin');
      const alias: string = 'uRm0452';
      await addAssetPromise(alias, 'pwd0452', 'l1;l2');
      let thrown: boolean = false;
      try {
        await removeAssetPromise(alias, 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0452 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0453
     * @tc.name testKeyRm0453
     * @tc.desc 合法值：批量删除（空账号空标签）清空已保存资产
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyRm0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0453 begin');
      await addAssetPromise('uRm0453a', 'pwda', 'la');
      await addAssetPromise('uRm0453b', 'pwdb', 'lb');
      let thrown: boolean = false;
      try {
        await removeAssetPromise('', '');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const afterA: Map<string, string>[] = await queryAssetPromise('uRm0453a', '');
      const afterB: Map<string, string>[] = await queryAssetPromise('uRm0453b', '');
      expect(afterA.length).assertEqual(0);
      expect(afterB.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0453 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0454
     * @tc.name testKeyRm0454
     * @tc.desc 边界值：空账号按标签删除在设备上不命中，资产保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0454 begin');
      await removeAssetPromise('uRm0454a', '');
      await removeAssetPromise('uRm0454b', '');
      await removeAssetPromise('uRm0454c', '');
      await addAssetPromise('uRm0454a', 'pwda', 'shared');
      await addAssetPromise('uRm0454b', 'pwdb', 'shared');
      await addAssetPromise('uRm0454c', 'pwdc', 'other');
      await removeAssetPromise('', 'shared');
      const afterA: Map<string, string>[] = await queryAssetPromise('uRm0454a', '');
      const afterB: Map<string, string>[] = await queryAssetPromise('uRm0454b', '');
      const afterC: Map<string, string>[] = await queryAssetPromise('uRm0454c', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', afterA.length, 1);
      expect(afterA.length).assertEqual(1);
      expect(afterB.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', afterC.length, 1);
      expect(afterC.length).assertEqual(1);
      await removeAssetPromise('uRm0454a', '');
      await removeAssetPromise('uRm0454b', '');
      await removeAssetPromise('uRm0454c', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0454 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0455
     * @tc.name testKeyRm0455
     * @tc.desc 非法值：删除不存在的账号，不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0455 begin');
      let thrown: boolean = false;
      try {
        await removeAssetPromise('uRm0455_not_exist', '');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const after: Map<string, string>[] = await queryAssetPromise('uRm0455_not_exist', '');
      expect(after.length).assertEqual(0);
      expect(after instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0455 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0456
     * @tc.name testKeyRm0456
     * @tc.desc 边界值：资产库无数据时批量删除不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0456 begin');
      let thrown: boolean = false;
      try {
        await removeAssetPromise('uRm0456_empty', '');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0456: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'uRm0456_empty') {
          contains0456 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0456), 'false');
      expect(contains0456).assertFalse();
      expect(all instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0456 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0457
     * @tc.name testKeyRm0457
     * @tc.desc 非法值：账号存在但标签不匹配，资产保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0457 begin');
      const alias: string = 'uRm0457';
      await addAssetPromise(alias, 'pwd0457', 'l1');
      await removeAssetPromise(alias, 'nomatch');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 1);
      expect(after.length).assertEqual(1);
      expect(after[0].get('secret') as string).assertEqual('pwd0457');
      expect(after[0].get('label') as string).assertEqual('l1');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0457 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0458
     * @tc.name testKeyRm0458
     * @tc.desc 非法值：超长账号删除不抛异常且无残留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0458 begin');
      let alias: string = '';
      for (let i: number = 0; i < 1000; i++) {
        alias += 'R';
      }
      await addAssetPromise(alias, 'pwd0458', 'l1');
      let thrown: boolean = false;
      try {
        await removeAssetPromise(alias, '');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length === 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0458 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0459
     * @tc.name testKeyRm0459
     * @tc.desc 状态：空账号按标签删除在设备上不命中，同一标签多个账号保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0459 begin');
      await removeAssetPromise('uRm0459a', '');
      await removeAssetPromise('uRm0459b', '');
      await addAssetPromise('uRm0459a', 'pwda', 'tagX');
      await addAssetPromise('uRm0459b', 'pwdb', 'tagX');
      await removeAssetPromise('', 'tagX');
      const afterA: Map<string, string>[] = await queryAssetPromise('uRm0459a', '');
      const afterB: Map<string, string>[] = await queryAssetPromise('uRm0459b', '');
      expect(afterA.length).assertEqual(1);
      expect(afterB.length).assertEqual(1);
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0459: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'uRm0459a') {
          contains0459 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0459), 'true');
      expect(contains0459).assertTrue();
      await removeAssetPromise('uRm0459a', '');
      await removeAssetPromise('uRm0459b', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0459 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0460
     * @tc.name testKeyRm0460
     * @tc.desc 组合值：空账号按标签删除在设备上不命中，3 个账号均保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0460 begin');
      await removeAssetPromise('uRm0460a', '');
      await removeAssetPromise('uRm0460b', '');
      await removeAssetPromise('uRm0460c', '');
      await addAssetPromise('uRm0460a', 'pwda', 'match');
      await addAssetPromise('uRm0460b', 'pwdb', 'other1');
      await addAssetPromise('uRm0460c', 'pwdc', 'other2');
      await removeAssetPromise('', 'match');
      const afterA: Map<string, string>[] = await queryAssetPromise('uRm0460a', '');
      const afterB: Map<string, string>[] = await queryAssetPromise('uRm0460b', '');
      const afterC: Map<string, string>[] = await queryAssetPromise('uRm0460c', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', afterA.length, 1);
      expect(afterA.length).assertEqual(1);
      expect(afterB.length).assertEqual(1);
      expect(afterC.length).assertEqual(1);
      await removeAssetPromise('uRm0460a', '');
      await removeAssetPromise('uRm0460b', '');
      await removeAssetPromise('uRm0460c', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0460 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0461
     * @tc.name testKeyRm0461
     * @tc.desc 组合值：空账号按多标签删除在设备上不命中，账号均保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0461 begin');
      await removeAssetPromise('uRm0461a', '');
      await removeAssetPromise('uRm0461b', '');
      await addAssetPromise('uRm0461a', 'pwda', 't1;t2');
      await addAssetPromise('uRm0461b', 'pwdb', 't1');
      await removeAssetPromise('', 't1;t2');
      const afterA: Map<string, string>[] = await queryAssetPromise('uRm0461a', '');
      const afterB: Map<string, string>[] = await queryAssetPromise('uRm0461b', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', afterA.length, 1);
      expect(afterA.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', afterB.length, 1);
      expect(afterB.length).assertEqual(1);
      expect(afterB[0].get('label') as string).assertEqual('t1');
      await removeAssetPromise('uRm0461a', '');
      await removeAssetPromise('uRm0461b', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0461 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0462
     * @tc.name testKeyRm0462
     * @tc.desc 状态：删除后再次删除同一账号不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0462 begin');
      const alias: string = 'uRm0462';
      await addAssetPromise(alias, 'pwd0462', 'l1');
      await removeAssetPromise(alias, '');
      let thrown: boolean = false;
      try {
        await removeAssetPromise(alias, '');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0462 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0463
     * @tc.name testKeyRm0463
     * @tc.desc 边界值：中文账号删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0463 begin');
      const alias: string = '删除账号0463';
      await addAssetPromise(alias, 'pwd0463', 'l1');
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length < 1).assertTrue();
      const before: Map<string, string>[] = await queryAssetPromise(alias, 'l1');
      expect(before.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0463 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0464
     * @tc.name testKeyRm0464
     * @tc.desc 边界值：纯数字账号删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0464 begin');
      const alias: string = '9876543210';
      await addAssetPromise(alias, 'pwd0464', 'l1');
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length === 0).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0464: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === '9876543210') {
          contains0464 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0464), 'false');
      expect(contains0464).assertFalse();
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0465
     * @tc.name testKeyRm0465
     * @tc.desc 组合值：账号+中文标签删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0465 begin');
      const alias: string = 'uRm0465';
      await addAssetPromise(alias, 'pwd0465', '工作;生活');
      await removeAssetPromise(alias, '工作');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length < 1).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      expect(all instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0465 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0466
     * @tc.name testKeyRm0466
     * @tc.desc 极值：单标签超长 2000 字符后删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0466 begin');
      const alias: string = 'uRm0466';
      let label: string = '';
      for (let i: number = 0; i < 2000; i++) {
        label += 'L';
      }
      await addAssetPromise(alias, 'pwd0466', label);
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length === 0).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0466: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'uRm0466') {
          contains0466 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0466), 'false');
      expect(contains0466).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0466 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0467
     * @tc.name testKeyRm0467
     * @tc.desc 状态：删除一个不影响另一个账号
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0467 begin');
      await addAssetPromise('uRm0467a', 'pwda', 'la');
      await addAssetPromise('uRm0467b', 'pwdb', 'lb');
      await removeAssetPromise('uRm0467a', '');
      const afterA: Map<string, string>[] = await queryAssetPromise('uRm0467a', '');
      const afterB: Map<string, string>[] = await queryAssetPromise('uRm0467b', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', afterA.length, 0);
      expect(afterA.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', afterB.length, 1);
      expect(afterB.length).assertEqual(1);
      expect(afterB[0].get('secret') as string).assertEqual('pwdb');
      await removeAssetPromise('uRm0467b', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0467 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0468
     * @tc.name testKeyRm0468
     * @tc.desc 边界值：空账号+空标签删除含 4 标签资产
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0468 begin');
      await addAssetPromise('uRm0468', 'pwd0468', 'a;b;c;d');
      await removeAssetPromise('', '');
      const after: Map<string, string>[] = await queryAssetPromise('uRm0468', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length === 0).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0468: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'uRm0468') {
          contains0468 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0468), 'false');
      expect(contains0468).assertFalse();
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0469
     * @tc.name testKeyRm0469
     * @tc.desc 组合值：乱序多标签删除（去重排序后仍可匹配）
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0469 begin');
      const alias: string = 'uRm0469';
      await addAssetPromise(alias, 'pwd0469', 'x;y;z');
      await removeAssetPromise(alias, 'z;x');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length < 1).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      expect(all instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0469 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0470
     * @tc.name testKeyRm0470
     * @tc.desc 边界值：删除标签含空段，空段被过滤后按有效标签删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0470 begin');
      const alias: string = 'uRm0470';
      await addAssetPromise(alias, 'pwd0470', 'l1');
      await removeAssetPromise(alias, ';l1;');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length === 0).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0470: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'uRm0470') {
          contains0470 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0470), 'false');
      expect(contains0470).assertFalse();
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0471
     * @tc.name testKeyRm0471
     * @tc.desc 非法值：空账号+不存在标签删除不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0471 begin');
      let thrown: boolean = false;
      try {
        await removeAssetPromise('', 'no_such_label_0471');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0471: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'no_such_alias_0471') {
          contains0471 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0471), 'false');
      expect(contains0471).assertFalse();
      expect(all instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0471 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0472
     * @tc.name testKeyRm0472
     * @tc.desc 状态：add→remove→add 同一账号重新保存成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0472 begin');
      const alias: string = 'uRm0472';
      await addAssetPromise(alias, 'pwd1', 'l1');
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'pwd2', 'l2');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 1);
      expect(after.length).assertEqual(1);
      expect(after[0].get('secret') as string).assertEqual('pwd2');
      expect(after[0].get('label') as string).assertEqual('l2');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0472 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0473
     * @tc.name testKeyRm0473
     * @tc.desc 组合值：批量删除后批量查询为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0473 begin');
      await addAssetPromise('uRm0473a', 'pwda', 'la');
      await addAssetPromise('uRm0473b', 'pwdb', 'lb');
      await removeAssetPromise('', '');
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', all.length, 0);
      expect(all.length).assertEqual(0);
      expect(all.length === 0).assertTrue();
      expect(all instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0473 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0474
     * @tc.name testKeyRm0474
     * @tc.desc 边界值：特殊符号账号删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0474 begin');
      const alias: string = 'u@rm#$%0474';
      await addAssetPromise(alias, 'pwd0474', 'l1');
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length === 0).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0474: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === 'u@rm#$%0474') {
          contains0474 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0474), 'false');
      expect(contains0474).assertFalse();
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0475
     * @tc.name testKeyRm0475
     * @tc.desc 状态：按账号删除 4 标签资产
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0475 begin');
      const alias: string = 'uRm0475';
      await addAssetPromise(alias, 'pwd0475', 'a;b;c;d');
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length < 1).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      expect(all instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0475 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0476
     * @tc.name testKeyRm0476
     * @tc.desc 组合值：同账号同标签保存删除往返两轮
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0476 begin');
      const alias: string = 'uRm0476';
      for (let round: number = 0; round < 2; round++) {
        await addAssetPromise(alias, 'pwd0476', 'l1');
        const mid: Map<string, string>[] = await queryAssetPromise(alias, '');
        expect(mid.length).assertEqual(1);
        await removeAssetPromise(alias, '');
        const after: Map<string, string>[] = await queryAssetPromise(alias, '');
        hilog.info(DOMAIN, TAG, 'round=%{public}d, actual=%{public}d, expected=%{public}d', round, after.length, 0);
        expect(after.length).assertEqual(0);
        expect(mid.length - after.length).assertEqual(1);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0476 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0477
     * @tc.name testKeyRm0477
     * @tc.desc 边界值：emoji 账号删除
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0477 begin');
      const alias: string = '😀uRm0477';
      await addAssetPromise(alias, 'pwd0477', 'l1');
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(after.length === 0).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0477: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === '😀uRm0477') {
          contains0477 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0477), 'false');
      expect(contains0477).assertFalse();
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0478
     * @tc.name testKeyRm0478
     * @tc.desc 非法值：账号+4 个不匹配标签删除，资产保留
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyRm0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0478 begin');
      const alias: string = 'uRm0478';
      await addAssetPromise(alias, 'pwd0478', 'keep');
      await removeAssetPromise(alias, 'n1;n2;n3;n4');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 1);
      expect(after.length).assertEqual(1);
      expect(after[0].get('label') as string).assertEqual('keep');
      expect(after[0].get('secret') as string).assertEqual('pwd0478');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0478 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0479
     * @tc.name testKeyRm0479
     * @tc.desc 状态：连续删除 3 个账号均不可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0479 begin');
      await addAssetPromise('uRm0479a', 'pwda', 'la');
      await addAssetPromise('uRm0479b', 'pwdb', 'lb');
      await addAssetPromise('uRm0479c', 'pwdc', 'lc');
      await removeAssetPromise('uRm0479a', '');
      await removeAssetPromise('uRm0479b', '');
      await removeAssetPromise('uRm0479c', '');
      const afterA: Map<string, string>[] = await queryAssetPromise('uRm0479a', '');
      const afterB: Map<string, string>[] = await queryAssetPromise('uRm0479b', '');
      const afterC: Map<string, string>[] = await queryAssetPromise('uRm0479c', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d+%{public}d+%{public}d, expected=%{public}d',
        afterA.length, afterB.length, afterC.length, 0);
      expect(afterA.length + afterB.length + afterC.length).assertEqual(0);
      expect(afterA.length).assertEqual(0);
      expect(afterC.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0479 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYRM_0480
     * @tc.name testKeyRm0480
     * @tc.desc 组合值：删除空密码资产，设备拒绝空密码保存后删除不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyRm0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0480 begin');
      const alias: string = 'uRm0480';
      await addAssetPromise(alias, '', 'l1');
      const before: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', before.length, 0);
      expect(before.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(before.length - after.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyRm0480 end');
    });
  });
}


