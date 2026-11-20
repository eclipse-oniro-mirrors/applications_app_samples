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
  COLLABORATE_INDEX_KEY, CollaborateRequest, buildRequest, collaborateIndex, mockRequest, shouldAccept,
  summarizeRequest, toggleAccepted, wantParamKeys
} from '../../../main/ets/model/CollabModel';
import {
  FEATURE_METAS, FeatureKind, FeatureMeta, entryFunctionOf, entryText, filterFeatures, isFeatureKind, metaOf, noteText,
  permissionText, summaryText, titleText
} from '../../../main/ets/model/DistributedCatalog';
import {
  BLUETOOTH_PERMISSION, DATASYNC_PERMISSION, FEATURE_COUNT, RouteKey, isRouteKey
} from '../../../main/ets/common/AppConstants';

const ALL_KINDS: FeatureKind[] = [FeatureKind.EXTENSION, FeatureKind.LINK, FeatureKind.CHANNEL];

/** 关键字与命中 code 的对照表：期望值按 filterFeatures 只搜 code/title/apiName/interfaceName/summary 推出 */
class KeywordCase {
  public keyword: string;
  public codes: string;

  constructor(keyword: string, codes: string) {
    this.keyword = keyword;
    this.codes = codes;
  }
}

function codesOf(items: FeatureMeta[]): string {
  const parts: string[] = [];
  for (const item of items) {
    parts.push(item.code);
  }
  return parts.join(',');
}

/** 逐条跑对照表，返回不一致的关键字，便于失败时直接看出是哪一个 */
function mismatchedKeywords(cases: KeywordCase[]): string {
  const wrong: string[] = [];
  for (const c of cases) {
    if (codesOf(filterFeatures(c.keyword)) !== c.codes) {
      wrong.push(c.keyword);
    }
  }
  return wrong.join('|');
}

function wantWith(index: Object, extraKeys: number): Record<string, Object> {
  const want: Record<string, Object> = {};
  want[COLLABORATE_INDEX_KEY] = index;
  for (let i = 0; i < extraKeys; i++) {
    want[`extra.key.${i}`] = i;
  }
  return want;
}

/**
 * 协同参数 × 能力目录（分）：wantParam 的取值类型与键个数做成网格，
 * 首页搜索按"接口名 / 中文标题 / 标点与单字母 / 只出现在不参与搜索字段里的词"四类关键字穷举，
 * 再把 FeatureKind 与 RouteKey、权限常量、文档页做交叉一致性核对。
 */
export default function distributedCollabCatalogMatrixTest() {
  describe('DistributedCollabCatalogMatrixTest', () => {
    // 每 10 条用例让出一次主线程，避免整批串跑触发 THREAD_BLOCK_6S（见 TestTick.ets）
    beforeEachIt(async () => {
      await tick();
    });
    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0100
     * @tc.name testColCat0001
     * @tc.desc Verify numeric and boolean index values are stringified and accepted.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0001', 0, () => {
      expect(collaborateIndex(wantWith(0, 0))).assertEqual('0');
      expect(collaborateIndex(wantWith(-1, 0))).assertEqual('-1');
      expect(collaborateIndex(wantWith(false, 0))).assertEqual('false');
      expect(buildRequest(wantWith(0, 0)).accepted).assertTrue();
      expect(buildRequest(wantWith(false, 0)).accepted).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0200
     * @tc.name testColCat0002
     * @tc.desc Verify array index values join with commas and an empty array is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0002', 0, () => {
      const pair: number[] = [1, 2];
      const none: number[] = [];
      expect(collaborateIndex(wantWith(pair, 0))).assertEqual('1,2');
      expect(collaborateIndex(wantWith(none, 0))).assertEqual('');
      expect(buildRequest(wantWith(pair, 0)).accepted).assertTrue();
      expect(buildRequest(wantWith(none, 0)).accepted).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0300
     * @tc.name testColCat0003
     * @tc.desc Verify blank index strings are kept verbatim yet rejected after trimming.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0003', 0, () => {
      const blanks: string[] = [' ', '\t', '\n', '   ', ' \t\n '];
      let rejected = 0;
      for (const blank of blanks) {
        const request = buildRequest(wantWith(blank, 0));
        expect(request.index).assertEqual(blank);
        rejected += request.accepted ? 0 : 1;
      }
      expect(rejected).assertEqual(blanks.length);
      expect(shouldAccept(' a ')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0400
     * @tc.name testColCat0004
     * @tc.desc Verify a 4 by 4 grid of index values and extra keys sets key count and verdict.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0004', 0, () => {
      const indexes: string[] = ['', ' ', '0', '设备A'];
      let combos = 0;
      let wrongCount = 0;
      let accepted = 0;
      for (const index of indexes) {
        for (let extra = 0; extra < 4; extra++) {
          const request = buildRequest(wantWith(index, extra));
          wrongCount += request.keyCount === extra + 1 ? 0 : 1;
          accepted += request.accepted ? 1 : 0;
          combos++;
        }
      }
      expect(combos).assertEqual(16);
      expect(wrongCount).assertEqual(0);
      expect(accepted).assertEqual(8);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0500
     * @tc.name testColCat0005
     * @tc.desc Verify extra keys without the index key are counted but the request is rejected.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0005', 0, () => {
      const want: Record<string, Object> = {};
      want['ohos.extra.param.key.other'] = '1';
      want['supportCollaborateIndex'] = '2';
      const request = buildRequest(want);
      expect(request.index).assertEqual('');
      expect(request.keyCount).assertEqual(2);
      expect(request.accepted).assertFalse();
      expect(wantParamKeys(want).join(',')).assertEqual('ohos.extra.param.key.other,supportCollaborateIndex');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0600
     * @tc.name testColCat0006
     * @tc.desc Verify the request description for accepted, blank and missing indexes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0006', 0, () => {
      const empty: Record<string, Object> = {};
      expect(buildRequest(wantWith('2', 2)).describe()).assertEqual('协同下标 "2"，参数 3 个 → ACCEPT');
      expect(buildRequest(wantWith(' ', 0)).describe()).assertEqual('协同下标 " "，参数 1 个 → REJECT');
      expect(buildRequest(empty).describe()).assertEqual('协同下标 "（空）"，参数 0 个 → REJECT');
      expect(new CollaborateRequest('', true, 9).describe()).assertEqual('协同下标 "（空）"，参数 9 个 → ACCEPT');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0700
     * @tc.name testColCat0007
     * @tc.desc Verify the summary appends the demo verdict that matches the accepted flag.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0007', 0, () => {
      expect(summarizeRequest(mockRequest('1'))).assertEqual('协同下标 "1"，参数 1 个 → ACCEPT；扩展按 demo 规则接受协同');
      expect(summarizeRequest(mockRequest(''))).assertEqual(
        '协同下标 "（空）"，参数 0 个 → REJECT；扩展按 demo 规则拒绝协同（缺少 supportCollaborateIndex）');
      expect(summarizeRequest(new CollaborateRequest('x', false, 1)).endsWith('（缺少 supportCollaborateIndex）'))
        .assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0800
     * @tc.name testColCat0008
     * @tc.desc Verify mockRequest agrees with buildRequest for every non blank single key request.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0008', 0, () => {
      const indexes: string[] = ['0', '1', '99', 'abc', '设备A-窗口2', 'x y'];
      let differ = 0;
      for (const index of indexes) {
        differ += summarizeRequest(mockRequest(index)) === summarizeRequest(buildRequest(wantWith(index, 0))) ? 0 : 1;
      }
      expect(differ).assertEqual(0);
      expect(mockRequest('  ').keyCount).assertEqual(1);
      expect(mockRequest('  ').accepted).assertFalse();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_0900
     * @tc.name testColCat0009
     * @tc.desc Verify toggling twice restores the verdict and toggling once flips the summary.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0009', 0, () => {
      const request = mockRequest('3');
      expect(toggleAccepted(toggleAccepted(request.accepted))).assertEqual(request.accepted);
      request.accepted = toggleAccepted(request.accepted);
      expect(request.accepted).assertFalse();
      expect(summarizeRequest(request).includes('REJECT')).assertTrue();
      request.accepted = toggleAccepted(request.accepted);
      expect(summarizeRequest(request).includes('ACCEPT')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1000
     * @tc.name testColCat0010
     * @tc.desc Verify the catalog lists the three kinds in order and agrees with the feature count.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0010', 0, () => {
      expect(FEATURE_METAS.length).assertEqual(FEATURE_COUNT);
      expect(codesOf(FEATURE_METAS)).assertEqual('EXT,LINK,CHAN');
      for (let i = 0; i < ALL_KINDS.length; i++) {
        expect(metaOf(ALL_KINDS[i]) === FEATURE_METAS[i]).assertTrue();
        expect(entryFunctionOf(ALL_KINDS[i])).assertEqual(FEATURE_METAS[i].entryFunction);
      }
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1100
     * @tc.name testColCat0011
     * @tc.desc Verify every feature kind is also a route key with the same literal value.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0011', 0, () => {
      expect(`${FeatureKind.EXTENSION}`).assertEqual(`${RouteKey.EXTENSION}`);
      expect(`${FeatureKind.LINK}`).assertEqual(`${RouteKey.LINK}`);
      expect(`${FeatureKind.CHANNEL}`).assertEqual(`${RouteKey.CHANNEL}`);
      let both = 0;
      for (const kind of ALL_KINDS) {
        both += isFeatureKind(kind) && isRouteKey(kind) ? 1 : 0;
      }
      expect(both).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1200
     * @tc.name testColCat0012
     * @tc.desc Verify near miss strings are rejected by both the kind and the route key checks.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0012', 0, () => {
      const misses: string[] = ['', 'EXT', 'Link', 'CHANNEL', 'channel ', ' link', 'extensions', 'chan', 'route'];
      let kindHits = 0;
      let routeHits = 0;
      for (const value of misses) {
        kindHits += isFeatureKind(value) ? 1 : 0;
        routeHits += isRouteKey(value) ? 1 : 0;
      }
      expect(misses.length).assertEqual(9);
      expect(kindHits).assertEqual(0);
      expect(routeHits).assertEqual(0);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1300
     * @tc.name testColCat0013
     * @tc.desc Verify API and interface name keywords narrow the catalog to the expected codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0013', 0, () => {
      const cases: KeywordCase[] = [
        new KeywordCase('ohos', 'EXT,LINK,CHAN'), new KeywordCase('distributedsched', 'LINK,CHAN'),
        new KeywordCase('manager', 'CHAN'), new KeywordCase('connection', 'LINK'),
        new KeywordCase('senddata', 'LINK'), new KeywordCase('channel', 'CHAN'),
        new KeywordCase('oncollaborate', 'EXT'), new KeywordCase('createserver', 'LINK'),
        new KeywordCase('arraybuffer', 'LINK'), new KeywordCase('server', 'LINK'),
        new KeywordCase('extension', 'EXT'), new KeywordCase('context', 'EXT'),
        new KeywordCase('channelid', 'CHAN'), new KeywordCase('application', 'EXT'),
        new KeywordCase('ondestroy', 'EXT'), new KeywordCase('proxy', 'CHAN'),
        new KeywordCase('enhance', 'LINK'), new KeywordCase('ability', 'EXT'), new KeywordCase('onCreate', 'EXT')
      ];
      expect(cases.length).assertEqual(19);
      expect(mismatchedKeywords(cases)).assertEqual('');
      expect(filterFeatures('DistributedSched').length).assertEqual(2);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1400
     * @tc.name testColCat0014
     * @tc.desc Verify CJK title and summary keywords narrow the catalog to the expected codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0014', 0, () => {
      const cases: KeywordCase[] = [
        new KeywordCase('蓝牙', 'CHAN'), new KeywordCase('通道', 'CHAN'), new KeywordCase('协同', 'EXT'),
        new KeywordCase('（BR）', 'CHAN'), new KeywordCase('扩展', 'EXT'), new KeywordCase('链路', 'LINK'),
        new KeywordCase('代理', 'CHAN'), new KeywordCase('生命周期', 'EXT'), new KeywordCase('设备', 'LINK'),
        new KeywordCase('数据', 'CHAN'), new KeywordCase('连接', 'LINK')
      ];
      expect(cases.length).assertEqual(11);
      expect(mismatchedKeywords(cases)).assertEqual('');
      expect(codesOf(filterFeatures('分布式扩展'))).assertEqual('EXT');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1500
     * @tc.name testColCat0015
     * @tc.desc Verify single letters, code names and punctuation keywords hit the expected codes.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0015', 0, () => {
      const cases: KeywordCase[] = [
        new KeywordCase('ext', 'EXT'), new KeywordCase('link', 'LINK'), new KeywordCase('chan', 'CHAN'),
        new KeywordCase('e', 'EXT,LINK,CHAN'), new KeywordCase(' LINK ', 'LINK'), new KeywordCase('br', 'CHAN'),
        new KeywordCase('distributed', 'EXT,LINK,CHAN'), new KeywordCase('/', 'EXT,LINK'),
        new KeywordCase('：', 'EXT,LINK'), new KeywordCase('。', 'EXT,LINK,CHAN'), new KeywordCase('x', 'EXT,CHAN'),
        new KeywordCase('n', 'EXT,LINK,CHAN'), new KeywordCase('a', 'EXT,LINK,CHAN'), new KeywordCase('in', 'LINK'),
        new KeywordCase('ext ', 'EXT'), new KeywordCase('.', 'EXT,LINK,CHAN')
      ];
      expect(cases.length).assertEqual(16);
      expect(mismatchedKeywords(cases)).assertEqual('');
      expect(filterFeatures('').length).assertEqual(3);
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1600
     * @tc.name testColCat0016
     * @tc.desc Verify words that only appear in entry function, permission, note or doc fields find nothing.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0016', 0, () => {
      const cases: KeywordCase[] = [
        new KeywordCase('openproxychannel', ''), new KeywordCase('module.json5', ''), new KeywordCase('acl', ''),
        new KeywordCase('js-apis', ''), new KeywordCase('xyz', ''), new KeywordCase('distributed_datasync', ''),
        new KeywordCase('access_bluetooth', ''), new KeywordCase('system_basic', ''),
        new KeywordCase('linkenhance.createserver', ''), new KeywordCase('.md', '')
      ];
      expect(cases.length).assertEqual(10);
      expect(mismatchedKeywords(cases)).assertEqual('');
      expect(FEATURE_METAS[2].entryFunction.toLowerCase().includes('openproxychannel')).assertTrue();
      expect(noteText(FEATURE_METAS[0]).includes('APL=system_basic')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1700
     * @tc.name testColCat0017
     * @tc.desc Verify each searchable field of every meta finds that meta and only that meta.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0017', 0, () => {
      let checked = 0;
      let wrong = 0;
      for (const meta of FEATURE_METAS) {
        const fields: string[] = [meta.code, titleText(meta), meta.apiName, meta.interfaceName, summaryText(meta)];
        for (const field of fields) {
          wrong += codesOf(filterFeatures(field)) === meta.code ? 0 : 1;
          checked++;
        }
      }
      expect(checked).assertEqual(15);
      expect(wrong).assertEqual(0);
      expect(codesOf(filterFeatures(titleText(FEATURE_METAS[1]).toUpperCase()))).assertEqual('LINK');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1800
     * @tc.name testColCat0018
     * @tc.desc Verify a custom item list is filtered alone and an empty keyword returns it unchanged.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0018', 0, () => {
      const only: FeatureMeta[] = [FEATURE_METAS[2]];
      expect(filterFeatures('', only) === only).assertTrue();
      expect(codesOf(filterFeatures('ohos', only))).assertEqual('CHAN');
      expect(filterFeatures('link', only).length).assertEqual(0);
      expect(filterFeatures('ohos', []).length).assertEqual(0);
      expect(filterFeatures('   ') === FEATURE_METAS).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_1900
     * @tc.name testColCat0019
     * @tc.desc Verify the permission column names the two runtime permissions and the ACL note.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0019', 0, () => {
      expect(metaOf(FeatureKind.LINK).permission).assertEqual(DATASYNC_PERMISSION);
      expect(metaOf(FeatureKind.CHANNEL).permission).assertEqual(BLUETOOTH_PERMISSION);
      expect(permissionText(metaOf(FeatureKind.EXTENSION)).includes('ACL')).assertTrue();
      expect(permissionText(metaOf(FeatureKind.EXTENSION)).startsWith('无')).assertTrue();
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_2000
     * @tc.name testColCat0020
     * @tc.desc Verify every doc page is a distinct js-apis markdown file and every summary ends with a full stop.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0020', 0, () => {
      const pages = new Set<string>();
      let wellFormed = 0;
      for (const meta of FEATURE_METAS) {
        pages.add(meta.docPage);
        wellFormed += meta.docPage.startsWith('js-apis-') && meta.docPage.endsWith('.md') &&
          summaryText(meta).endsWith('。') && noteText(meta).length > titleText(meta).length ? 1 : 0;
      }
      expect(pages.size).assertEqual(3);
      expect(wellFormed).assertEqual(3);
      expect(metaOf(FeatureKind.LINK).docPage).assertEqual('js-apis-link-enhance.md');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_2100
     * @tc.name testColCat0021
     * @tc.desc Verify entry functions name the factory call of each kind.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0021', 0, () => {
      expect(entryText(metaOf(FeatureKind.EXTENSION)).includes('module.json5')).assertTrue();
      expect(entryFunctionOf(FeatureKind.LINK)).assertEqual('linkEnhance.createServer() / createConnection()');
      expect(entryFunctionOf(FeatureKind.CHANNEL)).assertEqual('proxyChannelManager.openProxyChannel()');
      expect(metaOf(FeatureKind.CHANNEL).interfaceName).assertEqual('proxyChannelManager');
    });

    /**
     * @tc.number SUB_DISTRIBUTED_EXT_COLCAT_2200
     * @tc.name testColCat0022
     * @tc.desc Verify the catalog search and the collaborate verdict combine for each kind route.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testColCat0022', 0, () => {
      const routes: string[] = [];
      for (const kind of ALL_KINDS) {
        const meta = metaOf(kind);
        const request = buildRequest(wantWith(meta.code, 0));
        routes.push(`${kind}:${filterFeatures(meta.code).length}:${request.accepted ? 'A' : 'R'}`);
      }
      expect(routes.join(',')).assertEqual('extension:1:A,link:1:A,channel:1:A');
      expect(buildRequest(wantWith(metaOf(FeatureKind.LINK).code, 0)).index).assertEqual('LINK');
      expect(isRouteKey(metaOf(FeatureKind.CHANNEL).kind)).assertTrue();
    });
  });
}
