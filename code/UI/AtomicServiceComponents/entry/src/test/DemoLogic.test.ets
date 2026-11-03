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
// DemoLogic 单测：目录数据完整性、搜索过滤规则、页签切换守卫与导航栈返回守卫。
// 页面（Index/SearchDemo/TabsDemo/DemoPageScaffold）的全部业务判定都来自这里导出的纯函数。
import { describe, it, expect } from '@ohos/hypium';
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
    // 关键字为空或纯空白时不过滤，返回全部条目
    it('filterDemos_emptyKeywordReturnsAll', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '全部').length).assertEqual(DEMO_ITEMS.length);
      expect(filterDemos(DEMO_ITEMS, '   ', '').length).assertEqual(DEMO_ITEMS.length);
    });

    // 标题匹配不区分大小写："tabs"/"TABS" 各命中 1 项；"Atomic" 恰好命中 4 个以 AtomicService 开头的标题
    it('filterDemos_matchesTitleCaseInsensitive', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'tabs', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'TABS', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'Atomic', '全部').length).assertEqual(4);
      const result = filterDemos(DEMO_ITEMS, 'tabs', '全部');
      expect(result[0].key).assertEqual('tabs');
    });

    // 副标题参与匹配：tabs 副标题含"页签"、download 副标题含"下载"，各命中 1 项
    it('filterDemos_matchesSubtitle', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'H5', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '页签', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '下载', '全部').length).assertEqual(1);
      const result = filterDemos(DEMO_ITEMS, 'H5', '全部');
      expect(result[0].key).assertEqual('web');
    });

    // 按分类过滤时只返回该分类的条目；空分类与"全部"等价
    it('filterDemos_filtersByCategory', 0, () => {
      const result = filterDemos(DEMO_ITEMS, '', '能力');
      expect(result.length).assertEqual(5);
      for (const item of result) {
        expect(item.category).assertEqual('能力');
      }
      expect(filterDemos(DEMO_ITEMS, 'web', '').length).assertEqual(1);
    });

    // 分类与关键字取交集而非并集：交集命中 1 项，交集为空时返回 0 项
    it('filterDemos_categoryAndKeywordCombined', 0, () => {
      expect(filterDemos(DEMO_ITEMS, 'Download', '能力').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, 'web', '容器').length).assertEqual(0);
      const result = filterDemos(DEMO_ITEMS, 'Download', '能力');
      expect(result[0].key).assertEqual('download');
    });

    // 关键字可以命中分类名本身（"容器"/"交互"命中对应分类的全部条目）
    it('filterDemos_matchesCategoryKeyword', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '交互', '全部').length).assertEqual(3);
      expect(filterDemos(DEMO_ITEMS, '容器', '全部').length).assertEqual(1);
    });

    // 无任何命中时返回空数组而不是 undefined；分类与关键字双不命中同样为空
    it('filterDemos_noMatchReturnsEmpty', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '不存在的组件', '全部').length).assertEqual(0);
      expect(filterDemos(DEMO_ITEMS, 'navigation', '交互').length).assertEqual(0);
    });

    // 关键字首尾空白被去除后再匹配，与大小写转换可叠加（' WEB ' 命中 1 项）
    it('filterDemos_trimsKeyword', 0, () => {
      expect(filterDemos(DEMO_ITEMS, ' web ', '全部').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, ' WEB ', '全部').length).assertEqual(1);
    });

    // 未锁定时任意有效索引组合都允许切换（含单页签表）
    it('canSwitchTab_whenUnlocked', 0, () => {
      expect(canSwitchTab(0, 2, false, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(2, 0, false, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, 2, false, 5)).assertTrue();
      expect(canSwitchTab(0, 0, false, 1)).assertTrue();
    });

    // 锁定时只允许"切到自己"（即留在当前页），其他目标一律拒绝；单页签表锁定时同样可留守
    it('canSwitchTab_whenLocked', 0, () => {
      expect(canSwitchTab(1, 2, true, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(1, 1, true, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, 0, true, 1)).assertTrue();
    });

    // 目标索引越界一律拒绝，与是否锁定无关；tabCount 非正时全部拒绝
    it('canSwitchTab_rejectsOutOfRange', 0, () => {
      expect(canSwitchTab(0, 3, false, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, 5, false, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, -1, false, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, 0, false, 0)).assertFalse();
      expect(canSwitchTab(0, 0, true, -2)).assertFalse();
    });

    // 末页边界：最后一个有效索引可用；锁定时同页可留、他页拒绝
    it('canSwitchTab_boundaryLastIndex', 0, () => {
      expect(canSwitchTab(TAB_COUNT - 1, TAB_COUNT - 1, false, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(TAB_COUNT - 1, TAB_COUNT - 1, true, TAB_COUNT)).assertTrue();
      expect(canSwitchTab(0, TAB_COUNT - 1, true, TAB_COUNT)).assertFalse();
      expect(canSwitchTab(0, TAB_COUNT - 1, false, TAB_COUNT)).assertTrue();
    });

    // 导航栈守卫：栈空或负数（size=0/-1）不可返回，非空可返回（对应隐藏标题栏后的返回按钮）
    it('canPopNavStack_emptyAndNonEmpty', 0, () => {
      expect(canPopNavStack(0)).assertFalse();
      expect(canPopNavStack(-1)).assertFalse();
      expect(canPopNavStack(1)).assertTrue();
      expect(canPopNavStack(99)).assertTrue();
    });

    // 目录固定 6 项，key 齐全，且每项的标题/副标题/分类都非空（卡片渲染依赖三个字段）
    it('catalog_hasSixDemoItems', 0, () => {
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
    it('catalog_keysAreUnique', 0, () => {
      const keys: string[] = DEMO_ITEMS.map((item) => item.key);
      const unique: string[] = [];
      for (const key of keys) {
        expect(unique.includes(key)).assertFalse();
        unique.push(key);
      }
      expect(unique.length).assertEqual(9);
    });

    // 每个 key 都必须能通过 isRouteKey 校验，保证 pageMap 全覆盖
    it('catalog_everyKeyIsRoutable', 0, () => {
      for (const item of DEMO_ITEMS) {
        expect(isRouteKey(item.key)).assertTrue();
      }
      expect(isRouteKey('unknown')).assertFalse();
      expect(RouteKey.HALF_SCREEN).assertEqual('halfScreen');
    });

    // 分类下拉框的选项必须覆盖目录中出现的所有分类
    it('catalog_categoriesCoverAllItems', 0, () => {
      expect(CATEGORIES.length).assertEqual(4);
      for (const item of DEMO_ITEMS) {
        expect(CATEGORIES.includes(item.category)).assertTrue();
      }
    });

    // 容器/交互/能力三组的条目数固定为 1/2/3
    it('catalog_containsSingleColumnAndInteractiveGroups', 0, () => {
      expect(filterDemos(DEMO_ITEMS, '', '容器').length).assertEqual(1);
      expect(filterDemos(DEMO_ITEMS, '', '交互').length).assertEqual(3);
      expect(filterDemos(DEMO_ITEMS, '', '能力').length).assertEqual(5);
    });
  });
}
