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

export default function keyAddReal() {
  describe('KeyAddRealTest', () => {
    /**
     * @tc.number SUB_ASSET_KEYADD_0451
     * @tc.name testKeyAdd0451
     * @tc.desc 合法值：1 个标签保存成功，查询可见且密钥正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAdd0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0451 begin');
      const alias: string = 'uAdd0451';
      const pwd: string = 'pwd0451';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, pwd, 'label1');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, pwd);
      expect(result[0].get('secret') as string).assertEqual(pwd);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0451 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0452
     * @tc.name testKeyAdd0452
     * @tc.desc 合法值：2 个标签保存成功，标签内容回读正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAdd0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0452 begin');
      const alias: string = 'uAdd0452';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0452', 'l1;l2');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'l1;l2');
      expect(label).assertEqual('l1;l2');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0452 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0453
     * @tc.name testKeyAdd0453
     * @tc.desc 合法值：3 个标签保存成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAdd0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0453 begin');
      const alias: string = 'uAdd0453';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0453', 'a;b;c');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'a;b;c');
      expect(label).assertEqual('a;b;c');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0453 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0454
     * @tc.name testKeyAdd0454
     * @tc.desc 边界值：4 个标签上界保存成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyAdd0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0454 begin');
      const alias: string = 'uAdd0454';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0454', 'a;b;c;d');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'a;b;c;d');
      expect(label).assertEqual('a;b;c;d');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0454 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0455
     * @tc.name testKeyAdd0455
     * @tc.desc 边界值：重复标签被去重后保存
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0455 begin');
      const alias: string = 'uAdd0455';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0455', 'a;a');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'a');
      expect(label).assertEqual('a');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0455 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0456
     * @tc.name testKeyAdd0456
     * @tc.desc 边界值：空标签串保存成功，标签回读为空
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0456 begin');
      const alias: string = 'uAdd0456';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0456', '');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, '');
      expect(label).assertEqual('');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0456 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0457
     * @tc.name testKeyAdd0457
     * @tc.desc 非法值：5 个标签超上界，提前返回不落库
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0457 begin');
      const alias: string = 'uAdd0457';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0457', 'a;b;c;d;e');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result.length < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0457 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0458
     * @tc.name testKeyAdd0458
     * @tc.desc 非法值：6 个标签提前返回
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0458 begin');
      const alias: string = 'uAdd0458';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0458', 'a;b;c;d;e;f');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(0);
      expect(await queryAssetPromise('', '')).assertLarger(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0458 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0459
     * @tc.name testKeyAdd0459
     * @tc.desc 非法值：标签含空段被过滤后保存
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0459 begin');
      const alias: string = 'uAdd0459';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0459', 'a;;b');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'a;b');
      expect(label).assertEqual('a;b');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0459 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0460
     * @tc.name testKeyAdd0460
     * @tc.desc 极值：1000 字符超长账号，设备拒绝保存，查询 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0460 begin');
      let alias: string = '';
      for (let i: number = 0; i < 1000; i++) {
        alias += 'A';
      }
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0460', 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0460 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0461
     * @tc.name testKeyAdd0461
     * @tc.desc 极值：5000 字符超长密码，超出设备 1KB 限制被拒
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0461 begin');
      const alias: string = 'uAdd0461';
      let pwd: string = '';
      for (let i: number = 0; i < 5000; i++) {
        pwd += 'p';
      }
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, pwd, 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0461 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0462
     * @tc.name testKeyAdd0462
     * @tc.desc 极值：单个超长标签
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0462 begin');
      const alias: string = 'uAdd0462';
      let label: string = '';
      for (let i: number = 0; i < 2000; i++) {
        label += 'L';
      }
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0462', label);
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      expect((result[0].get('label') as string).length).assertEqual(2000);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0462 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0463
     * @tc.name testKeyAdd0463
     * @tc.desc 组合值：账号密码标签三者组合保存
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0463 begin');
      const alias: string = 'user@example.com';
      const pwd: string = 'P@ssw0rd#2026';
      const label: string = 'work;vip;bank';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, pwd, label);
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      expect(result[0].get('secret') as string).assertEqual(pwd);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0463 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0464
     * @tc.name testKeyAdd0464
     * @tc.desc 组合值：中文账号与中文标签
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0464 begin');
      const alias: string = '测试账号0464';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, '密码0464', '工作;生活');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, '工作;生活');
      expect(label).assertEqual('工作;生活');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0464 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0465
     * @tc.name testKeyAdd0465
     * @tc.desc 组合值：含特殊符号的账号
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0465 begin');
      const alias: string = 'u@dd$%^&*()_+-=0465';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0465', 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      expect(result[0].get('alias') as string).assertEqual(alias);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0465 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0466
     * @tc.name testKeyAdd0466
     * @tc.desc 状态：重复保存同账号，第二次返回账号已存在，不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0466 begin');
      const alias: string = 'uAdd0466';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0466', 'l1');
        await addAssetPromise(alias, 'pwd0466b', 'l2');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0].get('secret') as string).assertEqual('pwd0466');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0466 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0467
     * @tc.name testKeyAdd0467
     * @tc.desc 状态：保存后删除再查询不可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0467 begin');
      const alias: string = 'uAdd0467';
      await addAssetPromise(alias, 'pwd0467', 'l1');
      const before: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(before.length).assertEqual(1);
      await removeAssetPromise(alias, '');
      const after: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', after.length, 0);
      expect(after.length).assertEqual(0);
      expect(before.length - after.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0467 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0468
     * @tc.name testKeyAdd0468
     * @tc.desc 状态：保存两个账号互不影响
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0468 begin');
      const aliasA: string = 'uAdd0468a';
      const aliasB: string = 'uAdd0468b';
      await addAssetPromise(aliasA, 'pwda', 'la');
      await addAssetPromise(aliasB, 'pwdb', 'lb');
      const resultA: Map<string, string>[] = await queryAssetPromise(aliasA, '');
      const resultB: Map<string, string>[] = await queryAssetPromise(aliasB, '');
      expect(resultA.length).assertEqual(1);
      expect(resultB.length).assertEqual(1);
      expect(resultA[0].get('secret') as string).assertEqual('pwda');
      await removeAssetPromise(aliasA, '');
      await removeAssetPromise(aliasB, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0468 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0469
     * @tc.name testKeyAdd0469
     * @tc.desc 边界值：乱序标签保存后按排序回读
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0469 begin');
      const alias: string = 'uAdd0469';
      await addAssetPromise(alias, 'pwd0469', 'b;a');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'a;b');
      expect(label).assertEqual('a;b');
      expect(label.indexOf('a')).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0469 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0470
     * @tc.name testKeyAdd0470
     * @tc.desc 边界值：标签以分号结尾，尾空段被过滤
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0470 begin');
      const alias: string = 'uAdd0470';
      await addAssetPromise(alias, 'pwd0470', 'a;b;');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'a;b');
      expect(label).assertEqual('a;b');
      expect(label.length).assertEqual(3);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0470 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0471
     * @tc.name testKeyAdd0471
     * @tc.desc 非法值：空账号保存不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0471 begin');
      let thrown: boolean = false;
      try {
        await addAssetPromise('', 'pwd0471', 'l1');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise('uAdd0471', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0471 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0472
     * @tc.name testKeyAdd0472
     * @tc.desc 非法值：空密码，设备参数校验拒绝保存，查询 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0472 begin');
      const alias: string = 'uAdd0472';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, '', 'l1');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0472 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0473
     * @tc.name testKeyAdd0473
     * @tc.desc 组合值：中文标签保存后按字典序回读
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0473 begin');
      const alias: string = 'uAdd0473';
      await addAssetPromise(alias, 'pwd0473', '银行;邮箱;购物');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, '购物;邮箱;银行');
      expect(label).assertEqual('购物;邮箱;银行');
      expect(label.indexOf('银行')).assertEqual(6);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0473 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0474
     * @tc.name testKeyAdd0474
     * @tc.desc 边界值：4 个有效标签 + 尾空段，按 4 标签保存
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0474 begin');
      const alias: string = 'uAdd0474';
      await addAssetPromise(alias, 'pwd0474', 'a;b;c;d;');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, 'a;b;c;d');
      expect(label).assertEqual('a;b;c;d');
      expect(label.split(';').length).assertEqual(4);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0474 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0475
     * @tc.name testKeyAdd0475
     * @tc.desc 状态：保存后更新，查询回读更新后的值
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0475 begin');
      const alias: string = 'uAdd0475';
      await addAssetPromise(alias, 'pwd0475', 'l1');
      await updateAssetPromise(alias, 'pwd0475_new', 'l1;l2');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const secret: string = result[0].get('secret') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', secret, 'pwd0475_new');
      expect(secret).assertEqual('pwd0475_new');
      expect(result[0].get('label') as string).assertEqual('l1;l2');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0475 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0476
     * @tc.name testKeyAdd0476
     * @tc.desc 组合值：账号大小写敏感
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0476 begin');
      const alias: string = 'uAdd0476';
      await addAssetPromise(alias, 'pwd0476', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise('UADD0476', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      const exact: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(exact.length).assertEqual(1);
      expect(exact[0].get('secret') as string).assertEqual('pwd0476');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0476 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0477
     * @tc.name testKeyAdd0477
     * @tc.desc 边界值：纯数字账号
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0477 begin');
      const alias: string = '1234567890';
      await addAssetPromise(alias, 'pwd0477', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      expect(result[0].get('alias') as string).assertEqual(alias);
      expect(result[0].get('secret') as string).assertEqual('pwd0477');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0477 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0478
     * @tc.name testKeyAdd0478
     * @tc.desc 非法值：标签全为分号，0 个有效标签仍保存成功
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyAdd0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0478 begin');
      const alias: string = 'uAdd0478';
      let thrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0478', ';;;');
      } catch (error) {
        thrown = true;
      }
      expect(thrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(result.length).assertEqual(1);
      const label: string = result[0].get('label') as string;
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', label, '');
      expect(label).assertEqual('');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0478 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0479
     * @tc.name testKeyAdd0479
     * @tc.desc 状态：连续保存 3 个账号均可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0479 begin');
      await addAssetPromise('uAdd0479a', 'pwda', 'la');
      await addAssetPromise('uAdd0479b', 'pwdb', 'lb');
      await addAssetPromise('uAdd0479c', 'pwdc', 'lc');
      const resultA: Map<string, string>[] = await queryAssetPromise('uAdd0479a', '');
      const resultB: Map<string, string>[] = await queryAssetPromise('uAdd0479b', '');
      const resultC: Map<string, string>[] = await queryAssetPromise('uAdd0479c', '');
      expect(resultA.length).assertEqual(1);
      expect(resultB.length).assertEqual(1);
      expect(resultC.length).assertEqual(1);
      await removeAssetPromise('uAdd0479a', '');
      await removeAssetPromise('uAdd0479b', '');
      await removeAssetPromise('uAdd0479c', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0479 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYADD_0480
     * @tc.name testKeyAdd0480
     * @tc.desc 组合值：批量查询结果包含新保存账号
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyAdd0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0480 begin');
      const alias: string = 'uAdd0480';
      await addAssetPromise(alias, 'pwd0480', 'batch;tag');
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      const before: number = all.length;
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', before, 0);
      expect(before).assertLarger(0);
      let found: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === alias) {
          found = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(found), 'true');
      expect(found).assertTrue();
      expect(all.length).assertEqual(before);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyAdd0480 end');
    });
  });
}


