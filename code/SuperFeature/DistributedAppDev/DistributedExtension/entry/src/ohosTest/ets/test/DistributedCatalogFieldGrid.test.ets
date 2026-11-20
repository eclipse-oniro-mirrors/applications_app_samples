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
 * 按字段取样：每个字段（code / 标题 / apiName / interfaceName / 摘要）各取若干独有词，核对命中集合。
 * `note` 与 `permission` 不在检索范围内，取样里放这两个字段的词，结果应为 0。
 * 命中时首张卡片的 title 必须非空，防止返回了结构不完整的对象。
 */
export default function distributedCatalogFieldGridTest() {
  describe('DistributedCatalogFieldGridTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0001
     * @tc.name testField0001
     * @tc.desc Verify token EXT narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0001', 0, () => {
      const result: FeatureMeta[] = filterFeatures('EXT');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0002
     * @tc.name testField0002
     * @tc.desc Verify token LINK narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0002', 0, () => {
      const result: FeatureMeta[] = filterFeatures('LINK');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0003
     * @tc.name testField0003
     * @tc.desc Verify token CHAN narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0003', 0, () => {
      const result: FeatureMeta[] = filterFeatures('CHAN');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0004
     * @tc.name testField0004
     * @tc.desc Verify token 分布式扩展 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0004', 0, () => {
      const result: FeatureMeta[] = filterFeatures('分布式扩展');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0005
     * @tc.name testField0005
     * @tc.desc Verify token 链路增强 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0005', 0, () => {
      const result: FeatureMeta[] = filterFeatures('链路增强');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0006
     * @tc.name testField0006
     * @tc.desc Verify token 代理通道 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0006', 0, () => {
      const result: FeatureMeta[] = filterFeatures('代理通道');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0007
     * @tc.name testField0007
     * @tc.desc Verify token DistributedExtensionAbility narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0007', 0, () => {
      const result: FeatureMeta[] = filterFeatures('DistributedExtensionAbility');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0008
     * @tc.name testField0008
     * @tc.desc Verify token linkEnhance.Server narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0008', 0, () => {
      const result: FeatureMeta[] = filterFeatures('linkEnhance.Server');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0009
     * @tc.name testField0009
     * @tc.desc Verify token proxyChannelManager narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0009', 0, () => {
      const result: FeatureMeta[] = filterFeatures('proxyChannelManager');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0010
     * @tc.name testField0010
     * @tc.desc Verify token DistributedExtensionContext narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0010', 0, () => {
      const result: FeatureMeta[] = filterFeatures('DistributedExtensionContext');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0011
     * @tc.name testField0011
     * @tc.desc Verify token linkEnhance.Connection narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0011', 0, () => {
      const result: FeatureMeta[] = filterFeatures('linkEnhance.Connection');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0012
     * @tc.name testField0012
     * @tc.desc Verify token proxyChannelManager 的 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0012', 0, () => {
      const result: FeatureMeta[] = filterFeatures('proxyChannelManager 的');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0013
     * @tc.name testField0013
     * @tc.desc Verify token syscap narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0013', 0, () => {
      const result: FeatureMeta[] = filterFeatures('syscap');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0014
     * @tc.name testField0014
     * @tc.desc Verify token type 为 distributed narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0014', 0, () => {
      const result: FeatureMeta[] = filterFeatures('type 为 distributed');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0015
     * @tc.name testField0015
     * @tc.desc Verify token LINK_BR narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0015', 0, () => {
      const result: FeatureMeta[] = filterFeatures('LINK_BR');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0016
     * @tc.name testField0016
     * @tc.desc Verify token channelId narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0016', 0, () => {
      const result: FeatureMeta[] = filterFeatures('channelId');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0017
     * @tc.name testField0017
     * @tc.desc Verify token peerDevAddr narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0017', 0, () => {
      const result: FeatureMeta[] = filterFeatures('peerDevAddr');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0018
     * @tc.name testField0018
     * @tc.desc Verify token peerUuid narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0018', 0, () => {
      const result: FeatureMeta[] = filterFeatures('peerUuid');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0019
     * @tc.name testField0019
     * @tc.desc Verify token onCollaborate narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0019', 0, () => {
      const result: FeatureMeta[] = filterFeatures('onCollaborate');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0020
     * @tc.name testField0020
     * @tc.desc Verify token onCreate narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0020', 0, () => {
      const result: FeatureMeta[] = filterFeatures('onCreate');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0021
     * @tc.name testField0021
     * @tc.desc Verify token onDestroy narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0021', 0, () => {
      const result: FeatureMeta[] = filterFeatures('onDestroy');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0022
     * @tc.name testField0022
     * @tc.desc Verify token createServer narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0022', 0, () => {
      const result: FeatureMeta[] = filterFeatures('createServer');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0023
     * @tc.name testField0023
     * @tc.desc Verify token createConnection narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0023', 0, () => {
      const result: FeatureMeta[] = filterFeatures('createConnection');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0024
     * @tc.name testField0024
     * @tc.desc Verify token sendData narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0024', 0, () => {
      const result: FeatureMeta[] = filterFeatures('sendData');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0025
     * @tc.name testField0025
     * @tc.desc Verify token ArrayBuffer narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0025', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ArrayBuffer');
      expect(result.length).assertEqual(1);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result[0].title.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0026
     * @tc.name testField0026
     * @tc.desc Verify token SystemCapability narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0026', 0, () => {
      const result: FeatureMeta[] = filterFeatures('SystemCapability');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0027
     * @tc.name testField0027
     * @tc.desc Verify token DISTRIBUTED_DATASYNC narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0027', 0, () => {
      const result: FeatureMeta[] = filterFeatures('DISTRIBUTED_DATASYNC');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0028
     * @tc.name testField0028
     * @tc.desc Verify token ACCESS_BLUETOOTH narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0028', 0, () => {
      const result: FeatureMeta[] = filterFeatures('ACCESS_BLUETOOTH');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0029
     * @tc.name testField0029
     * @tc.desc Verify token docPage narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0029', 0, () => {
      const result: FeatureMeta[] = filterFeatures('docPage');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0030
     * @tc.name testField0030
     * @tc.desc Verify token summary narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0030', 0, () => {
      const result: FeatureMeta[] = filterFeatures('summary');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0031
     * @tc.name testField0031
     * @tc.desc Verify token note narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0031', 0, () => {
      const result: FeatureMeta[] = filterFeatures('note');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0032
     * @tc.name testField0032
     * @tc.desc Verify token title narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0032', 0, () => {
      const result: FeatureMeta[] = filterFeatures('title');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0033
     * @tc.name testField0033
     * @tc.desc Verify token code narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0033', 0, () => {
      const result: FeatureMeta[] = filterFeatures('code');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0034
     * @tc.name testField0034
     * @tc.desc Verify token apiName narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0034', 0, () => {
      const result: FeatureMeta[] = filterFeatures('apiName');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0035
     * @tc.name testField0035
     * @tc.desc Verify token interfaceName narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0035', 0, () => {
      const result: FeatureMeta[] = filterFeatures('interfaceName');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0036
     * @tc.name testField0036
     * @tc.desc Verify token permission narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0036', 0, () => {
      const result: FeatureMeta[] = filterFeatures('permission');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0037
     * @tc.name testField0037
     * @tc.desc Verify token 路径 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0037', 0, () => {
      const result: FeatureMeta[] = filterFeatures('路径');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0038
     * @tc.name testField0038
     * @tc.desc Verify token 扫描 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0038', 0, () => {
      const result: FeatureMeta[] = filterFeatures('扫描');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0039
     * @tc.name testField0039
     * @tc.desc Verify token 配对 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0039', 0, () => {
      const result: FeatureMeta[] = filterFeatures('配对');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0040
     * @tc.name testField0040
     * @tc.desc Verify token 许可 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0040', 0, () => {
      const result: FeatureMeta[] = filterFeatures('许可');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0041
     * @tc.name testField0041
     * @tc.desc Verify token 权限 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0041', 0, () => {
      const result: FeatureMeta[] = filterFeatures('权限');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0042
     * @tc.name testField0042
     * @tc.desc Verify token 系统签名 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0042', 0, () => {
      const result: FeatureMeta[] = filterFeatures('系统签名');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0043
     * @tc.name testField0043
     * @tc.desc Verify token 单机 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0043', 0, () => {
      const result: FeatureMeta[] = filterFeatures('单机');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0044
     * @tc.name testField0044
     * @tc.desc Verify token 两台设备 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0044', 0, () => {
      const result: FeatureMeta[] = filterFeatures('两台设备');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOGFIELD_0045
     * @tc.name testField0045
     * @tc.desc Verify token 同组网 narrows the catalogue.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testField0045', 0, () => {
      const result: FeatureMeta[] = filterFeatures('同组网');
      expect(result.length).assertEqual(0);
      expect(result.length <= FEATURE_METAS.length).assertTrue();
      expect(result.length).assertEqual(0);
    });

  });
}
