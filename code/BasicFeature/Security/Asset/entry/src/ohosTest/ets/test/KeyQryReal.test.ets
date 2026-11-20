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

export default function keyQryReal() {
  describe('KeyQryRealTest', () => {
    /**
     * @tc.number SUB_ASSET_KEYQRY_0451
     * @tc.name testKeyQry0451
     * @tc.desc 合法值：查询已保存账号返回 1 条且 secret 正确
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyQry0451', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0451 begin');
      const alias: string = 'uQry0451';
      await addAssetPromise(alias, 'pwd0451', 'l1');
      let thrown: boolean = false;
      let result: Map<string, string>[] = new Array<Map<string, string>>();
      try {
        result = await queryAssetPromise(alias, '');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'pwd0451');
      expect(result[0].get('secret') as string).assertEqual('pwd0451');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0451 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0452
     * @tc.name testKeyQry0452
     * @tc.desc 合法值：查询不存在账号返回 0 条且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyQry0452', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0452 begin');
      let thrown: boolean = false;
      let result: Map<string, string>[] = new Array<Map<string, string>>();
      try {
        result = await queryAssetPromise('uQry0452_not_exist', '');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0452 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0453
     * @tc.name testKeyQry0453
     * @tc.desc 合法值：空账号空标签批量查询，每条结果均含 alias 字段
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level0
     */
    it('testKeyQry0453', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0453 begin');
      let thrown: boolean = false;
      let all: Map<string, string>[] = new Array<Map<string, string>>();
      try {
        all = await queryAssetPromise('', '');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      expect(all instanceof Array).assertTrue();
      let allHaveAlias: boolean = true;
      for (let item of all) {
        if (!item.has('alias')) {
          allHaveAlias = false;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(allHaveAlias), 'true');
      expect(allHaveAlias).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0453 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0454
     * @tc.name testKeyQry0454
     * @tc.desc 边界值：按单个标签查询命中已保存资产
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0454', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0454 begin');
      const alias: string = 'uQry0454';
      await addAssetPromise(alias, 'pwd0454', 'tagX');
      const result: Map<string, string>[] = await queryAssetPromise(alias, 'tagX');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias') as string, alias);
      expect(result[0].get('alias') as string).assertEqual(alias);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'tagX');
      expect(result[0].get('label') as string).assertEqual('tagX');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0454 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0455
     * @tc.name testKeyQry0455
     * @tc.desc 边界值：两个标签 AND 组合查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0455', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0455 begin');
      const alias: string = 'uQry0455';
      await addAssetPromise(alias, 'pwd0455', 'x;y');
      const result: Map<string, string>[] = await queryAssetPromise(alias, 'x;y');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'x;y');
      expect(result[0].get('label') as string).assertEqual('x;y');
      expect(result[0].get('secret') as string).assertEqual('pwd0455');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0455 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0456
     * @tc.name testKeyQry0456
     * @tc.desc 边界值：账号存在但标签不匹配返回 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0456', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0456 begin');
      const alias: string = 'uQry0456';
      await addAssetPromise(alias, 'pwd0456', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, 'nomatch');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      const byAlias: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', byAlias.length, 1);
      expect(byAlias.length).assertEqual(1);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0456 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0457
     * @tc.name testKeyQry0457
     * @tc.desc 边界值：重复标签条件去重后查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0457', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0457 begin');
      const alias: string = 'uQry0457';
      await addAssetPromise(alias, 'pwd0457', 'a;b');
      const result: Map<string, string>[] = await queryAssetPromise(alias, 'a;a;b');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias') as string, alias);
      expect(result[0].get('alias') as string).assertEqual(alias);
      expect(result[0].get('label') as string).assertEqual('a;b');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0457 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0458
     * @tc.name testKeyQry0458
     * @tc.desc 边界值：标签条件含空段被过滤后查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0458', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0458 begin');
      const alias: string = 'uQry0458';
      await addAssetPromise(alias, 'pwd0458', 'a;b');
      const result: Map<string, string>[] = await queryAssetPromise(alias, 'a;;b');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      expect(result[0].get('secret') as string).assertEqual('pwd0458');
      expect(result[0].get('label') as string).assertEqual('a;b');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0458 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0459
     * @tc.name testKeyQry0459
     * @tc.desc 非法值：空账号按标签查询在设备上不命中，返回 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0459', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0459 begin');
      await removeAssetPromise('uQry0459a', '');
      await removeAssetPromise('uQry0459b', '');
      await addAssetPromise('uQry0459a', 'pwda', 'shared0459');
      await addAssetPromise('uQry0459b', 'pwdb', 'shared0459');
      const result: Map<string, string>[] = await queryAssetPromise('', 'shared0459');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      await removeAssetPromise('uQry0459a', '');
      await removeAssetPromise('uQry0459b', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0459 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0460
     * @tc.name testKeyQry0460
     * @tc.desc 非法值：空账号加不存在的标签返回 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0460', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0460 begin');
      const result: Map<string, string>[] = await queryAssetPromise('', 'label0460_not_exist');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      expect(result.length < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0460 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0461
     * @tc.name testKeyQry0461
     * @tc.desc 非法值：超长账号查询返回 0 条且不抛异常
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyQry0461', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0461 begin');
      let alias: string = '';
      for (let i: number = 0; i < 1000; i++) {
        alias += 'Q';
      }
      let thrown: boolean = false;
      let result: Map<string, string>[] = new Array<Map<string, string>>();
      try {
        result = await queryAssetPromise(alias, '');
      } catch (error) {
        thrown = true;
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(thrown), 'false');
      expect(thrown).assertFalse();
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0461 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0462
     * @tc.name testKeyQry0462
     * @tc.desc 极值：1000 字符账号，设备拒绝保存，查询 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyQry0462', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0462 begin');
      let alias: string = '';
      for (let i: number = 0; i < 1000; i++) {
        alias += 'A';
      }
      await addAssetPromise(alias, 'pwd0462', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0462 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0463
     * @tc.name testKeyQry0463
     * @tc.desc 组合值：中文账号保存后查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0463', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0463 begin');
      const alias: string = '账号0463';
      await addAssetPromise(alias, '密码0463', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, '密码0463');
      expect(result[0].get('secret') as string).assertEqual('密码0463');
      expect(result[0].get('alias') as string).assertEqual(alias);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0463 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0464
     * @tc.name testKeyQry0464
     * @tc.desc 组合值：特殊符号账号保存后查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0464', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0464 begin');
      const alias: string = 'uQry0464@#$%';
      await addAssetPromise(alias, 'pwd0464', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias') as string, alias);
      expect(result[0].get('alias') as string).assertEqual(alias);
      expect(result[0].get('secret') as string).assertEqual('pwd0464');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0464 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0465
     * @tc.name testKeyQry0465
     * @tc.desc 组合值：中文标签保存后按标签查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0465', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0465 begin');
      const alias: string = 'uQry0465';
      await addAssetPromise(alias, 'pwd0465', '标签一');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '标签一');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, '标签一');
      expect(result[0].get('label') as string).assertEqual('标签一');
      expect(result[0].get('secret') as string).assertEqual('pwd0465');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0465 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0466
     * @tc.name testKeyQry0466
     * @tc.desc 状态值：更新后查询反映新 secret
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0466', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0466 begin');
      const alias: string = 'uQry0466';
      await addAssetPromise(alias, 'oldPwd', 'l1');
      await updateAssetPromise(alias, 'newPwd', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'newPwd');
      expect(result[0].get('secret') as string).assertEqual('newPwd');
      expect(result[0].get('label') as string).assertEqual('l1');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0466 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0467
     * @tc.name testKeyQry0467
     * @tc.desc 状态值：删除后查询不可见
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0467', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0467 begin');
      const alias: string = 'uQry0467';
      await addAssetPromise(alias, 'pwd0467', 'l1');
      await removeAssetPromise(alias, '');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0467: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === alias) {
          contains0467 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0467), 'false');
      expect(contains0467).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0467 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0468
     * @tc.name testKeyQry0468
     * @tc.desc 状态值：同一账号重复查询结果一致
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0468', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0468 begin');
      const alias: string = 'uQry0468';
      await addAssetPromise(alias, 'pwd0468', 'l1');
      const first: Map<string, string>[] = await queryAssetPromise(alias, '');
      const second: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', first.length, 1);
      expect(first.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', second.length, 1);
      expect(second.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', second[0].get('secret') as string, 'pwd0468');
      expect(second[0].get('secret') as string).assertEqual('pwd0468');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0468 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0469
     * @tc.name testKeyQry0469
     * @tc.desc 边界值：4 个标签上界资产回读完整
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0469', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0469 begin');
      const alias: string = 'uQry0469';
      await addAssetPromise(alias, 'pwd0469', 'a;b;c;d');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('label') as string, 'a;b;c;d');
      expect(result[0].get('label') as string).assertEqual('a;b;c;d');
      expect(result[0].get('secret') as string).assertEqual('pwd0469');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0469 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0470
     * @tc.name testKeyQry0470
     * @tc.desc 非法值：不存在账号加有效标签返回 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0470', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0470 begin');
      const alias: string = 'uQry0470';
      await addAssetPromise(alias, 'pwd0470', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise('uQry0470_not_exist', 'l1');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      const byAlias: Map<string, string>[] = await queryAssetPromise(alias, '');
      expect(byAlias.length).assertEqual(1);
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0470 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0471
     * @tc.name testKeyQry0471
     * @tc.desc 组合值：emoji 账号保存后查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyQry0471', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0471 begin');
      const alias: string = '账号😀0471';
      await addAssetPromise(alias, 'pwd0471', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias') as string, alias);
      expect(result[0].get('alias') as string).assertEqual(alias);
      expect(result[0].get('secret') as string).assertEqual('pwd0471');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0471 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0472
     * @tc.name testKeyQry0472
     * @tc.desc 极值：2000 字符账号保存超限失败，查询返回 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyQry0472', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0472 begin');
      let alias: string = '';
      for (let i: number = 0; i < 2000; i++) {
        alias += 'B';
      }
      let addThrown: boolean = false;
      try {
        await addAssetPromise(alias, 'pwd0472', 'l1');
      } catch (error) {
        addThrown = true;
      }
      expect(addThrown).assertFalse();
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      const all: Map<string, string>[] = await queryAssetPromise('', '');
      let contains0472: boolean = false;
      for (let item of all) {
        if ((item.get('alias') as string) === alias) {
          contains0472 = true;
        }
      }
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', String(contains0472), 'false');
      expect(contains0472).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0472 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0473
     * @tc.name testKeyQry0473
     * @tc.desc 合法值：多资产按账号分别查询互不串扰
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0473', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0473 begin');
      await addAssetPromise('uQry0473a', 'pwda', 'la');
      await addAssetPromise('uQry0473b', 'pwdb', 'lb');
      await addAssetPromise('uQry0473c', 'pwdc', 'lc');
      const resultA: Map<string, string>[] = await queryAssetPromise('uQry0473a', '');
      const resultB: Map<string, string>[] = await queryAssetPromise('uQry0473b', '');
      const resultC: Map<string, string>[] = await queryAssetPromise('uQry0473c', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', resultA.length, 1);
      expect(resultA.length).assertEqual(1);
      expect(resultA[0].get('secret') as string).assertEqual('pwda');
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', resultB[0].get('secret') as string, 'pwdb');
      expect(resultB[0].get('secret') as string).assertEqual('pwdb');
      expect(resultC[0].get('secret') as string).assertEqual('pwdc');
      await removeAssetPromise('uQry0473a', '');
      await removeAssetPromise('uQry0473b', '');
      await removeAssetPromise('uQry0473c', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0473 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0474
     * @tc.name testKeyQry0474
     * @tc.desc 边界值：标签大小写敏感，大小写不匹配返回 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0474', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0474 begin');
      const alias: string = 'uQry0474';
      await addAssetPromise(alias, 'pwd0474', 'tag');
      const upper: Map<string, string>[] = await queryAssetPromise(alias, 'TAG');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', upper.length, 0);
      expect(upper.length).assertEqual(0);
      const exact: Map<string, string>[] = await queryAssetPromise(alias, 'tag');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', exact.length, 1);
      expect(exact.length).assertEqual(1);
      expect(exact[0].get('secret') as string).assertEqual('pwd0474');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0474 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0475
     * @tc.name testKeyQry0475
     * @tc.desc 边界值：含分号的账号保存后按账号查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyQry0475', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0475 begin');
      const alias: string = 'uQry0475;a';
      await addAssetPromise(alias, 'pwd0475', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias') as string, alias);
      expect(result[0].get('alias') as string).assertEqual(alias);
      expect(result[0].get('secret') as string).assertEqual('pwd0475');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0475 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0476
     * @tc.name testKeyQry0476
     * @tc.desc 状态值：同标签两资产按账号分别查询区分
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0476', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0476 begin');
      await addAssetPromise('uQry0476a', 'pwda', 'shared0476');
      await addAssetPromise('uQry0476b', 'pwdb', 'shared0476');
      const resultA: Map<string, string>[] = await queryAssetPromise('uQry0476a', '');
      const resultB: Map<string, string>[] = await queryAssetPromise('uQry0476b', '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', resultA.length, 1);
      expect(resultA.length).assertEqual(1);
      expect(resultA[0].get('secret') as string).assertEqual('pwda');
      expect(resultB[0].get('secret') as string).assertEqual('pwdb');
      await removeAssetPromise('uQry0476a', '');
      await removeAssetPromise('uQry0476b', '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0476 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0477
     * @tc.name testKeyQry0477
     * @tc.desc 组合值：纯数字账号保存后查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0477', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0477 begin');
      const alias: string = '04770477';
      await addAssetPromise(alias, 'pwd0477', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias') as string, alias);
      expect(result[0].get('alias') as string).assertEqual(alias);
      expect(result[0].get('secret') as string).assertEqual('pwd0477');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0477 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0478
     * @tc.name testKeyQry0478
     * @tc.desc 非法值：空账号加超长标签返回 0 条
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level2
     */
    it('testKeyQry0478', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0478 begin');
      let label: string = '';
      for (let i: number = 0; i < 1000; i++) {
        label += 'L';
      }
      const result: Map<string, string>[] = await queryAssetPromise('', label);
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 0);
      expect(result.length).assertEqual(0);
      expect(result instanceof Array).assertTrue();
      expect(result.length < 1).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0478 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0479
     * @tc.name testKeyQry0479
     * @tc.desc 边界值：尾随空格账号保存后查询命中
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0479', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0479 begin');
      const alias: string = 'uQry0479 ';
      await addAssetPromise(alias, 'pwd0479', 'l1');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('alias') as string, alias);
      expect(result[0].get('alias') as string).assertEqual(alias);
      expect(result[0].get('secret') as string).assertEqual('pwd0479');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0479 end');
    });

    /**
     * @tc.number SUB_ASSET_KEYQRY_0480
     * @tc.name testKeyQry0480
     * @tc.desc 状态值：删除后重新保存同账号，查询返回新 secret
     * @tc.type Function
     * @tc.size SmallTest
     * @tc.level Level1
     */
    it('testKeyQry0480', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0480 begin');
      const alias: string = 'uQry0480';
      await addAssetPromise(alias, 'firstPwd', 'l1');
      await removeAssetPromise(alias, '');
      await addAssetPromise(alias, 'secondPwd', 'l2');
      const result: Map<string, string>[] = await queryAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, 'actual=%{public}d, expected=%{public}d', result.length, 1);
      expect(result.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, 'actual=%{public}s, expected=%{public}s', result[0].get('secret') as string, 'secondPwd');
      expect(result[0].get('secret') as string).assertEqual('secondPwd');
      expect(result[0].get('label') as string).assertEqual('l2');
      await removeAssetPromise(alias, '');
      hilog.info(DOMAIN, TAG, '%{public}s', 'testKeyQry0480 end');
    });
  });
}


