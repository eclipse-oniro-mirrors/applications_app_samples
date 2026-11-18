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

import { beforeEachIt, describe, expect, it } from '@ohos/hypium';
import { tick } from '../util/TestTick';
import { FEATURE_METAS, FeatureMeta, filterFeatures } from '../../../main/ets/model/DistributedCatalog';

/**
 * 首页搜索关键字网格：55 个关键字覆盖 code / 标题 / 接口名 / 摘要四个字段，含大小写、前缀片段、符号与中文。
 * 搜索先 trim 再 toLowerCase，空关键字返回全部卡片；`entryFunction` 不参与检索，这属于已知边界。
 * 每条都核对命中张数与首张卡片的 code，避免「命中了但命错对象」。
 */
export default function distributedCatalogKeywordGridTest() {
  describe('DistributedCatalogKeywordGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0001
     * @tc.name testCatKey0001
     * @tc.desc Verify keyword empty matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0001', 0, () => {
      const result: FeatureMeta[] = filterFeatures('');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0002
     * @tc.name testCatKey0002
     * @tc.desc Verify keyword   matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0002', 0, () => {
      const result: FeatureMeta[] = filterFeatures(' ');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0003
     * @tc.name testCatKey0003
     * @tc.desc Verify keyword    matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0003', 0, () => {
      const result: FeatureMeta[] = filterFeatures('  ');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0004
     * @tc.name testCatKey0004
     * @tc.desc Verify keyword ext matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0004', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ext');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0005
     * @tc.name testCatKey0005
     * @tc.desc Verify keyword EXT matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0005', 0, () => {
      const result: FeatureMeta[] = filterFeatures('EXT');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0006
     * @tc.name testCatKey0006
     * @tc.desc Verify keyword Ext matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0006', 0, () => {
      const result: FeatureMeta[] = filterFeatures('Ext');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0007
     * @tc.name testCatKey0007
     * @tc.desc Verify keyword link matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0007', 0, () => {
      const result: FeatureMeta[] = filterFeatures('link');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0008
     * @tc.name testCatKey0008
     * @tc.desc Verify keyword LINK matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0008', 0, () => {
      const result: FeatureMeta[] = filterFeatures('LINK');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0009
     * @tc.name testCatKey0009
     * @tc.desc Verify keyword chan matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0009', 0, () => {
      const result: FeatureMeta[] = filterFeatures('chan');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0010
     * @tc.name testCatKey0010
     * @tc.desc Verify keyword CHAN matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0010', 0, () => {
      const result: FeatureMeta[] = filterFeatures('CHAN');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0011
     * @tc.name testCatKey0011
     * @tc.desc Verify keyword proxy matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0011', 0, () => {
      const result: FeatureMeta[] = filterFeatures('proxy');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0012
     * @tc.name testCatKey0012
     * @tc.desc Verify keyword proxyChannel matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0012', 0, () => {
      const result: FeatureMeta[] = filterFeatures('proxyChannel');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0013
     * @tc.name testCatKey0013
     * @tc.desc Verify keyword manager matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0013', 0, () => {
      const result: FeatureMeta[] = filterFeatures('manager');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0014
     * @tc.name testCatKey0014
     * @tc.desc Verify keyword ability matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0014', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ability');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0015
     * @tc.name testCatKey0015
     * @tc.desc Verify keyword Ability matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0015', 0, () => {
      const result: FeatureMeta[] = filterFeatures('Ability');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0016
     * @tc.name testCatKey0016
     * @tc.desc Verify keyword ohos matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0016', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ohos');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0017
     * @tc.name testCatKey0017
     * @tc.desc Verify keyword @ohos matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0017', 0, () => {
      const result: FeatureMeta[] = filterFeatures('@ohos');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0018
     * @tc.name testCatKey0018
     * @tc.desc Verify keyword distributedsched matches 2 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0018', 0, () => {
      const result: FeatureMeta[] = filterFeatures('distributedsched');
      expect(result.length).assertEqual(2);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0019
     * @tc.name testCatKey0019
     * @tc.desc Verify keyword distributed matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0019', 0, () => {
      const result: FeatureMeta[] = filterFeatures('distributed');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0020
     * @tc.name testCatKey0020
     * @tc.desc Verify keyword Distributed matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0020', 0, () => {
      const result: FeatureMeta[] = filterFeatures('Distributed');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0021
     * @tc.name testCatKey0021
     * @tc.desc Verify keyword server matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0021', 0, () => {
      const result: FeatureMeta[] = filterFeatures('server');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0022
     * @tc.name testCatKey0022
     * @tc.desc Verify keyword Server matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0022', 0, () => {
      const result: FeatureMeta[] = filterFeatures('Server');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0023
     * @tc.name testCatKey0023
     * @tc.desc Verify keyword connection matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0023', 0, () => {
      const result: FeatureMeta[] = filterFeatures('connection');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0024
     * @tc.name testCatKey0024
     * @tc.desc Verify keyword Connection matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0024', 0, () => {
      const result: FeatureMeta[] = filterFeatures('Connection');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0025
     * @tc.name testCatKey0025
     * @tc.desc Verify keyword create matches 2 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0025', 0, () => {
      const result: FeatureMeta[] = filterFeatures('create');
      expect(result.length).assertEqual(2);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0026
     * @tc.name testCatKey0026
     * @tc.desc Verify keyword createServer matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0026', 0, () => {
      const result: FeatureMeta[] = filterFeatures('createServer');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0027
     * @tc.name testCatKey0027
     * @tc.desc Verify keyword createConnection matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0027', 0, () => {
      const result: FeatureMeta[] = filterFeatures('createConnection');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0028
     * @tc.name testCatKey0028
     * @tc.desc Verify keyword senddata matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0028', 0, () => {
      const result: FeatureMeta[] = filterFeatures('senddata');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0029
     * @tc.name testCatKey0029
     * @tc.desc Verify keyword sendData matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0029', 0, () => {
      const result: FeatureMeta[] = filterFeatures('sendData');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0030
     * @tc.name testCatKey0030
     * @tc.desc Verify keyword arraybuffer matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0030', 0, () => {
      const result: FeatureMeta[] = filterFeatures('arraybuffer');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0031
     * @tc.name testCatKey0031
     * @tc.desc Verify keyword ArrayBuffer matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0031', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ArrayBuffer');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0032
     * @tc.name testCatKey0032
     * @tc.desc Verify keyword oncollaborate matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0032', 0, () => {
      const result: FeatureMeta[] = filterFeatures('oncollaborate');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0033
     * @tc.name testCatKey0033
     * @tc.desc Verify keyword onCreate matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0033', 0, () => {
      const result: FeatureMeta[] = filterFeatures('onCreate');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0034
     * @tc.name testCatKey0034
     * @tc.desc Verify keyword onDestroy matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0034', 0, () => {
      const result: FeatureMeta[] = filterFeatures('onDestroy');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0035
     * @tc.name testCatKey0035
     * @tc.desc Verify keyword 扩展 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0035', 0, () => {
      const result: FeatureMeta[] = filterFeatures('扩展');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0036
     * @tc.name testCatKey0036
     * @tc.desc Verify keyword 分组 matches 0 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0036', 0, () => {
      const result: FeatureMeta[] = filterFeatures('分组');
      expect(result.length).assertEqual(0);
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0037
     * @tc.name testCatKey0037
     * @tc.desc Verify keyword 链路 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0037', 0, () => {
      const result: FeatureMeta[] = filterFeatures('链路');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0038
     * @tc.name testCatKey0038
     * @tc.desc Verify keyword 增强 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0038', 0, () => {
      const result: FeatureMeta[] = filterFeatures('增强');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0039
     * @tc.name testCatKey0039
     * @tc.desc Verify keyword 代理 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0039', 0, () => {
      const result: FeatureMeta[] = filterFeatures('代理');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0040
     * @tc.name testCatKey0040
     * @tc.desc Verify keyword 通道 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0040', 0, () => {
      const result: FeatureMeta[] = filterFeatures('通道');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0041
     * @tc.name testCatKey0041
     * @tc.desc Verify keyword 协同 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0041', 0, () => {
      const result: FeatureMeta[] = filterFeatures('协同');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0042
     * @tc.name testCatKey0042
     * @tc.desc Verify keyword 生命周期 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0042', 0, () => {
      const result: FeatureMeta[] = filterFeatures('生命周期');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0043
     * @tc.name testCatKey0043
     * @tc.desc Verify keyword 蓝牙 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0043', 0, () => {
      const result: FeatureMeta[] = filterFeatures('蓝牙');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0044
     * @tc.name testCatKey0044
     * @tc.desc Verify keyword 经典蓝牙 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0044', 0, () => {
      const result: FeatureMeta[] = filterFeatures('经典蓝牙');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0045
     * @tc.name testCatKey0045
     * @tc.desc Verify keyword 数据 matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0045', 0, () => {
      const result: FeatureMeta[] = filterFeatures('数据');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0046
     * @tc.name testCatKey0046
     * @tc.desc Verify keyword zzz matches 0 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0046', 0, () => {
      const result: FeatureMeta[] = filterFeatures('zzz');
      expect(result.length).assertEqual(0);
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0047
     * @tc.name testCatKey0047
     * @tc.desc Verify keyword x matches 2 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0047', 0, () => {
      const result: FeatureMeta[] = filterFeatures('x');
      expect(result.length).assertEqual(2);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0048
     * @tc.name testCatKey0048
     * @tc.desc Verify keyword 0 matches 0 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0048', 0, () => {
      const result: FeatureMeta[] = filterFeatures('0');
      expect(result.length).assertEqual(0);
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0049
     * @tc.name testCatKey0049
     * @tc.desc Verify keyword 9 matches 0 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0049', 0, () => {
      const result: FeatureMeta[] = filterFeatures('9');
      expect(result.length).assertEqual(0);
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0050
     * @tc.name testCatKey0050
     * @tc.desc Verify keyword - matches 0 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0050', 0, () => {
      const result: FeatureMeta[] = filterFeatures('-');
      expect(result.length).assertEqual(0);
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0051
     * @tc.name testCatKey0051
     * @tc.desc Verify keyword / matches 2 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0051', 0, () => {
      const result: FeatureMeta[] = filterFeatures('/');
      expect(result.length).assertEqual(2);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0052
     * @tc.name testCatKey0052
     * @tc.desc Verify keyword . matches 3 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0052', 0, () => {
      const result: FeatureMeta[] = filterFeatures('.');
      expect(result.length).assertEqual(3);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0053
     * @tc.name testCatKey0053
     * @tc.desc Verify keyword ex matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0053', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ex');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('EXT');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0054
     * @tc.name testCatKey0054
     * @tc.desc Verify keyword ink matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0054', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ink');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('LINK');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0055
     * @tc.name testCatKey0055
     * @tc.desc Verify keyword hann matches 1 feature cards.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatKey0055', 0, () => {
      const result: FeatureMeta[] = filterFeatures('hann');
      expect(result.length).assertEqual(1);
      expect(result[0].code).assertEqual('CHAN');
      expect(result.length <= FEATURE_METAS.length).assertTrue();
    });

  });
}
