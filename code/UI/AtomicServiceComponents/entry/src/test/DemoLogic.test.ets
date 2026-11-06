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
// DemoLogic 单测：目录数据完整性、搜索过滤规则、Simplified切换守卫与导航栈返回守卫。
// 页面（Index/SearchDemo/TabsDemo/DemoPageScaffold）的All业务判定都来自这里导出的纯函数。
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import {
  CATEGORIES,
  DEMO_ITEMS,
  canPopNavStack,
  canSwitchTab,
  filterDemos
} from '../main/ets/model/DemoLogic';
import { RouteKey, TAB_COUNT, isRouteKey } from '../main/ets/common/AppConstants';

export default function demoLogicTest() {
  describe('DemoLogicTest', () => {
    // 关键字为空或纯空白时不过滤，返回All条目
    it('filterDemos_emptyKeywordReturnsAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '', 'All').length).assertEqual(DEMO_ITEMS.length);
      expect(filterDemos(DEMO_ITEMS, '   ', '').length).assertEqual(DEMO_ITEMS.length);
    });

    // Title匹配不区分大小写："tabs"/"TABS" 各命中 1 项；"Atomic" 恰好命中 4 个以 AtomicService 开头的Title
    it('filterDemos_matchesTitleCaseInsensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'tabs', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'TABS', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'Atomic', 'All').length).assertEqual(4);
      const result = filterDemos(DEMO_ITEMS, 'tabs', 'All');
      expect(result[0].key).assertEqual('tabs');
    });

    // 副Title参与匹配：tabs 副Title含"Simplified"、download 副Title含"download"，各命中 1 项
    it('filterDemos_matchesSubtitle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'H5', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'Simplified', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'download', 'All').length).assertEqual(1);
      const result = filterDemos(DEMO_ITEMS, 'H5', 'All');
      expect(result[0].key).assertEqual('web');
    });

    // 按分类过滤时只返回该分类的条目；空分类与"All"等价
    it('filterDemos_filtersByCategory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const result = filterDemos(DEMO_ITEMS, '', 'Capability');
      expect(result.length).assertEqual(5);
      for (const item of result) {
        expect(item.category).assertEqual('Capability');
      }
      expect(filterDemos(DEMO_ITEMS, 'web', '').length).assertEqual(1);
    });

    // 分类与关键字取交集而非并集：交集命中 1 项，交集为空时返回 0 项
    it('filterDemos_categoryAndKeywordCombined', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'Download', 'Capability').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'web', 'Container').length).assertEqual(0);
      const result = filterDemos(DEMO_ITEMS, 'Download', 'Capability');
      expect(result[0].key).assertEqual('download');
    });

    // 关键字可以命中分类名本身（"Container"/"Interaction"命中对应分类的All条目）
    it('filterDemos_matchesCategoryKeyword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'Interaction', 'All').length).assertEqual(3);
      expect(filterDemos(DEMO_ITEMS, 'Container', 'All').length).assertEqual(1);
    });

    // 无任何命中时返回空数组而不是 undefined；分类与关键字双不命中同样为空
    it('filterDemos_noMatchReturnsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, 'missing component', 'All').length).assertEqual(0);
      expect(filterDemos(DEMO_ITEMS, 'navigation', 'Interaction').length).assertEqual(0);
    });

    // 关键字首尾空白被去除后再匹配，与大小写转换可叠加（' WEB ' 命中 1 项）
    it('filterDemos_trimsKeyword', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, ' web ', 'All').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, ' WEB ', 'All').length).assertEqual(1);
    });

    // 未锁定时任意有效索引组合都允许切换（含单Simplified表）
    it('canSwitchTab_whenUnlocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(0, 2, false, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(2, 0, false, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, 2, false, 5)).assertTrue();
      expect(canSwitchTab(0, 0, false, 1)).assertTrue();
    });

    // 锁定时只允许"切到自己"（即留在当前页），其他目标一律拒绝；单Simplified表锁定时同样可留守
    it('canSwitchTab_whenLocked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(1, 2, true, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(1, 1, true, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, 0, true, 1)).assertTrue();
    });

    // 目标索引越界一律拒绝，与是否锁定无关；tabCount 非正时All拒绝
    it('canSwitchTab_rejectsOutOfRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(0, 3, false, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, 5, false, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, -1, false, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, 0, false, 0)).assertFalse();
      expect(canSwitchTab(0, 0, true, -2)).assertFalse();
    });

    // 末页边界：最后一个有效索引可用；锁定时同页可留、他页拒绝
    it('canSwitchTab_boundaryLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canSwitchTab(TAB_COUNT - 1, TAB_COUNT - 1, false, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(TAB_COUNT - 1, TAB_COUNT - 1, true, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, TAB_COUNT - 1, true, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, TAB_COUNT - 1, false, TAB_COUNT)).assertTrue();
    });

    // 导航栈守卫：栈空或负数（size=0/-1）不可返回，非空可返回（对应隐藏Title栏后的返回按钮）
    it('canPopNavStack_emptyAndNonEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(canPopNavStack(0)).assertFalse();
      expect(canPopNavStack(-1)).assertFalse();
      expect(canPopNavStack(1)).assertTrue();
      expect(canPopNavStack(99)).assertTrue();
    });

    // 目录固定 6 项，key 齐全，且每项的Title/副Title/分类都非空（卡片渲染依赖三个字段）
    it('catalog_hasSixDemoItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(DEMO_ITEMS.length).assertEqual(9);
      const keys: string[] = DEMO_ITEMS.map((item) => item.key);
      expect(keys.includes('navigation')).assertTrue();
      expect(keys.includes('search')).assertTrue();
      expect(keys.includes('tabs')).assertTrue();
      expect(keys.includes('web')).assertTrue();
      expect(keys.includes('download')).assertTrue();
      expect(keys.includes('halfScreen')).assertTrue();
      for (const item of DEMO_ITEMS) {
        expect(item.title.length > 0).assertTrue();
        expect(item.subtitle.length > 0).assertTrue();
        expect(item.category.length > 0).assertTrue();
      }
    });

    // key 不允许重复，否则 pageMap 路由会互相覆盖
    it('catalog_keysAreUnique', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const keys: string[] = DEMO_ITEMS.map((item) => item.key);
      const unique: string[] = [];
      for (const key of keys) {
        expect(unique.includes(key)).assertFalse();
        unique.push(key);
      }
      expect(unique.length).assertEqual(9);
    });

    // 每个 key 都必须能通过 isRouteKey 校验，保证 pageMap 全覆盖
    it('catalog_everyKeyIsRoutable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      for (const item of DEMO_ITEMS) {
        expect(isRouteKey(item.key)).assertTrue();
      }
      expect(isRouteKey('unknown')).assertFalse();
      expect(RouteKey.HALF_SCREEN).assertEqual('halfScreen');
    });

    // 分类下拉框的选项必须覆盖目录中出现的所有分类
    it('catalog_categoriesCoverAllItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(CATEGORIES.length).assertEqual(4);
      for (const item of DEMO_ITEMS) {
        expect(CATEGORIES.includes(item.category)).assertTrue();
      }
    });

    // Container/Interaction/Capability三组的条目数固定为 1/2/3
    it('catalog_containsSingleColumnAndInteractiveGroups', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(filterDemos(DEMO_ITEMS, '', 'Container').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '', 'Interaction').length).assertEqual(3);
      expect(filterDemos(DEMO_ITEMS, '', 'Capability').length).assertEqual(5);
    });
  });
}
