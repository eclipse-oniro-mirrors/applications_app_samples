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
import {
  FEATURE_METAS, FeatureKind, FeatureMeta, entryFunctionOf, filterFeatures, isFeatureKind, metaOf, noteText,
  permissionText, summaryText, titleText
} from '../../../main/ets/model/DistributedCatalog';

/** 首页搜索框调用的就是 filterFeatures，这里统一按"命中条数"断言 */
function countOf(keyword: string): number {
  return filterFeatures(keyword).length;
}

/** 三张卡片的标题：用于验证搜索是按字段而不是按整条记录 */
function titleOf(index: number): string {
  return titleText(FEATURE_METAS[index]);
}

/** 数字枚举化的 FeatureKind 需要转成字符串才能喂给 isFeatureKind */
function kindText(meta: FeatureMeta): string {
  return `${meta.kind}`;
}

/**
 * 能力目录：三张卡片的元数据、搜索命中的字段范围、以及枚举守卫。
 * 搜索是首页唯一的交互入口，命中范围写错会让读者以为某项能力不存在，因此逐字段验证。
 */
export default function distributedCatalogMatrixTest() {
  describe('DistributedCatalogMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0100
     * @tc.name testCatalog0001
     * @tc.desc Verify the catalog holds three features in the documented order.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0001', 0, () => {
      expect(FEATURE_METAS.length).assertEqual(3);
      expect(FEATURE_METAS[0].kind).assertEqual(FeatureKind.EXTENSION);
      expect(FEATURE_METAS[1].kind).assertEqual(FeatureKind.LINK);
      expect(FEATURE_METAS[2].kind).assertEqual(FeatureKind.CHANNEL);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0200
     * @tc.name testCatalog0002
     * @tc.desc Verify the three short codes are uppercase, unique and used as list keys.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0002', 0, () => {
      expect(FEATURE_METAS[0].code).assertEqual('EXT');
      expect(FEATURE_METAS[1].code).assertEqual('LINK');
      expect(FEATURE_METAS[2].code).assertEqual('CHAN');
      expect(countOf('EXT')).assertEqual(1);
      expect(countOf('Chan')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0300
     * @tc.name testCatalog0003
     * @tc.desc Verify each card points at its own module name and entry function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0003', 0, () => {
      expect(FEATURE_METAS[1].apiName).assertEqual('@ohos.distributedsched.linkEnhance');
      expect(FEATURE_METAS[2].apiName).assertEqual('@ohos.distributedsched.proxyChannelManager');
      expect(FEATURE_METAS[1].interfaceName.includes('linkEnhance')).assertTrue();
      expect(FEATURE_METAS[2].interfaceName).assertEqual('proxyChannelManager');
      expect(entryFunctionOf(FeatureKind.LINK)).assertEqual('linkEnhance.createServer() / createConnection()');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0400
     * @tc.name testCatalog0004
     * @tc.desc Verify the permission text of each card matches the d.ts requirement.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0004', 0, () => {
      expect(permissionText(FEATURE_METAS[0]).includes('ohos.permission')).assertFalse();
      expect(permissionText(FEATURE_METAS[0]).includes('系统应用')).assertTrue();
      expect(FEATURE_METAS[1].permission).assertEqual('ohos.permission.DISTRIBUTED_DATASYNC');
      expect(FEATURE_METAS[2].permission).assertEqual('ohos.permission.ACCESS_BLUETOOTH');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0500
     * @tc.name testCatalog0005
     * @tc.desc Verify the documentation page named on each card exists in the reference set.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCatalog0005', 0, () => {
      expect(FEATURE_METAS[0].docPage).assertEqual('js-apis-distributedExtensionAbility.md');
      expect(FEATURE_METAS[1].docPage).assertEqual('js-apis-link-enhance.md');
      expect(FEATURE_METAS[2].docPage).assertEqual('js-apis-proxyChannelManager.md');
      for (let i = 0; i < FEATURE_METAS.length; i++) {
        expect(FEATURE_METAS[i].docPage.startsWith('js-apis-')).assertTrue();
        expect(FEATURE_METAS[i].docPage.endsWith('.md')).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0600
     * @tc.name testCatalog0006
     * @tc.desc Verify metaOf returns the entry whose kind equals the requested kind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0006', 0, () => {
      expect(metaOf(FeatureKind.EXTENSION).kind).assertEqual(FeatureKind.EXTENSION);
      expect(metaOf(FeatureKind.LINK).kind).assertEqual(FeatureKind.LINK);
      expect(metaOf(FeatureKind.CHANNEL).kind).assertEqual(FeatureKind.CHANNEL);
      expect(metaOf(FeatureKind.CHANNEL).code).assertEqual('CHAN');
      expect(metaOf(FeatureKind.LINK) === FEATURE_METAS[1]).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0700
     * @tc.name testCatalog0007
     * @tc.desc Verify every summary explains the flow and every note states the boundary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCatalog0007', 0, () => {
      for (let i = 0; i < FEATURE_METAS.length; i++) {
        const meta = FEATURE_METAS[i];
        expect(summaryText(meta).endsWith('。')).assertTrue();
        expect(summaryText(meta).length > 20).assertTrue();
        expect(noteText(meta).length > 10).assertTrue();
        expect(titleText(meta).length >= 4).assertTrue();
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0800
     * @tc.name testCatalog0008
     * @tc.desc Verify an empty or blank keyword keeps all three cards visible.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0008', 0, () => {
      expect(countOf('')).assertEqual(3);
      expect(countOf(' ')).assertEqual(3);
      expect(countOf('    ')).assertEqual(3);
      expect(countOf('\t')).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_0900
     * @tc.name testCatalog0009
     * @tc.desc Verify the search matches the short code case insensitively.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0009', 0, () => {
      expect(countOf('ext')).assertEqual(1);
      expect(countOf('link')).assertEqual(1);
      expect(countOf('chan')).assertEqual(1);
      expect(countOf('LiNk')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1000
     * @tc.name testCatalog0010
     * @tc.desc Verify the search matches the Chinese card title.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0010', 0, () => {
      expect(countOf('分布式扩展')).assertEqual(1);
      expect(countOf('链路增强')).assertEqual(1);
      expect(countOf('代理通道')).assertEqual(1);
      expect(titleOf(2)).assertEqual('代理通道');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1100
     * @tc.name testCatalog0011
     * @tc.desc Verify the search matches the module name shown on the card.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0011', 0, () => {
      expect(countOf('proxyChannelManager')).assertEqual(1);
      expect(countOf('linkEnhance')).assertEqual(1);
      expect(countOf('DistributedExtensionAbility')).assertEqual(1);
      expect(countOf('@ohos.distributedsched')).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1200
     * @tc.name testCatalog0012
     * @tc.desc Verify the search ignores entryFunction and only covers the five documented fields.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCatalog0012', 0, () => {
      // filterFeatures 只看 code / 标题 / apiName / interfaceName / summary 五个字段，entryFunction 不在其中：
      // openProxyChannel 只出现在 entryFunction 里，所以搜不到；proxyChannelManager 在 apiName 里，所以搜得到
      expect(countOf('openProxyChannel')).assertEqual(0);
      expect(countOf('proxyChannelManager')).assertEqual(1);
      expect(FEATURE_METAS[2].entryFunction.includes('openProxyChannel')).assertTrue();
      expect(countOf('Server')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1300
     * @tc.name testCatalog0013
     * @tc.desc Verify the search also looks inside the summary sentence.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0013', 0, () => {
      expect(countOf('ArrayBuffer')).assertEqual(1);
      expect(countOf('onCollaborate')).assertEqual(1);
      expect(countOf('channelId')).assertEqual(1);
      expect(countOf('蓝牙')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1400
     * @tc.name testCatalog0014
     * @tc.desc Verify the permission and note fields are not part of the search scope.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCatalog0014', 0, () => {
      // 卡片上会显示权限，但搜索不下钻到权限字段，这两个关键字必须零命中
      expect(countOf('ACCESS_BLUETOOTH')).assertEqual(0);
      expect(countOf('DISTRIBUTED_DATASYNC')).assertEqual(0);
      expect(countOf('系统应用')).assertEqual(0);
      expect(countOf('模拟器')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1500
     * @tc.name testCatalog0015
     * @tc.desc Verify a keyword that matches nothing returns an empty list rather than the full list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0015', 0, () => {
      const none = filterFeatures('不存在的关键字');
      expect(none.length).assertEqual(0);
      expect(countOf('zzz')).assertEqual(0);
      expect(countOf('分布式扩展链路')).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1600
     * @tc.name testCatalog0016
     * @tc.desc Verify the filter honours an explicitly supplied candidate list.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCatalog0016', 0, () => {
      const only: FeatureMeta[] = [FEATURE_METAS[2]];
      expect(filterFeatures('', only).length).assertEqual(1);
      expect(filterFeatures('channel', only).length).assertEqual(1);
      expect(filterFeatures('link', only).length).assertEqual(0);
      expect(countOf('link')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1700
     * @tc.name testCatalog0017
     * @tc.desc Verify surrounding spaces are trimmed before matching, so a pasted keyword still works.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0017', 0, () => {
      expect(countOf('  link  ')).assertEqual(1);
      expect(countOf('\tEXT\n')).assertEqual(1);
      expect(countOf(' 代理通道 ')).assertEqual(1);
      expect(countOf('  Channel  ')).assertEqual(1);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1800
     * @tc.name testCatalog0018
     * @tc.desc Verify the kind guard accepts only the three lowercase literals.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testCatalog0018', 0, () => {
      expect(isFeatureKind('extension')).assertTrue();
      expect(isFeatureKind('link')).assertTrue();
      expect(isFeatureKind('channel')).assertTrue();
      expect(isFeatureKind('ext')).assertFalse();
      expect(isFeatureKind('channel ')).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_1900
     * @tc.name testCatalog0019
     * @tc.desc Verify every catalog entry passes the kind guard with its own kind text.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCatalog0019', 0, () => {
      for (let i = 0; i < FEATURE_METAS.length; i++) {
        expect(isFeatureKind(kindText(FEATURE_METAS[i]))).assertTrue();
      }
      expect(kindText(FEATURE_METAS[0])).assertEqual('extension');
      expect(kindText(FEATURE_METAS[2])).assertEqual('channel');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_CATALOG_2000
     * @tc.name testCatalog0020
     * @tc.desc Verify the three titles and codes are pairwise distinct so a card cannot be mistaken.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testCatalog0020', 0, () => {
      expect(titleOf(0) === titleOf(1)).assertFalse();
      expect(titleOf(1) === titleOf(2)).assertFalse();
      expect(titleOf(0) === titleOf(2)).assertFalse();
      expect(FEATURE_METAS[0].code === FEATURE_METAS[2].code).assertFalse();
      expect(FEATURE_METAS[1].summary === FEATURE_METAS[2].summary).assertFalse();
    });
  });
}
