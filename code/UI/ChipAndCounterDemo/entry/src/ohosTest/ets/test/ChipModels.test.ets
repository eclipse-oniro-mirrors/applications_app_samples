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
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { TagStore, CounterLogic, ChipConfigFactory, TagItem } from '../../../main/ets/model/ChipModels';
import { LogUtil, LogSink, LogLevel } from '../../../main/ets/model/utils/LogUtil';
import {
  SymbolGlyphModifier, ChipV2Size, ColorMetrics, ChipSuffixSymbolGlyphOptions, ChipV2SuffixSymbolIcon,
  ChipGroupV2Padding, ChipGroupV2IconItemConfig, ChipGroupV2SymbolItemConfig, SegmentButtonV2ItemOptions
} from '@kit.ArkUI';

export default function chipModelsTest() {
  describe('chipModelsTest', () => {
    let store: TagStore = new TagStore();

    beforeAll(() => {
    });

    /** 构建含 A/B/C 三条的全新仓库 */
    const freshStore = (): TagStore => {
      const s: TagStore = new TagStore();
      s.add('A');
      s.add('B');
      s.add('C');
      return s;
    };

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0100
     * @tc.name tagStore_add
     * @tc.desc Verify TagStore.add appends a tag with unique id and default inactive/enabled state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_add', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.count()).assertEqual(3);
      const item: TagItem = store.add('D');
      expect(store.count()).assertEqual(4);
      expect(item.id > 0).assertTrue();
      expect(item.text).assertEqual('D');
      expect(item.activated).assertFalse();
      expect(item.enabled).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0200
     * @tc.name tagStore_remove
     * @tc.desc Verify removing an existing tag by id shrinks the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_remove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const first: TagItem | null = store.findById(1);
      expect(first !== null).assertTrue();
      expect(store.remove(1)).assertTrue();
      expect(store.count()).assertEqual(2);
      expect(store.findById(1) === null).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0300
     * @tc.name tagStore_removeMissing
     * @tc.desc Verify removing a missing tag returns false and keeps data intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_removeMissing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      // 删不存在 id：返回 false 且不影响现有数据
      expect(store.remove(999)).assertFalse();
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0400
     * @tc.name tagStore_toggleActivated
     * @tc.desc Verify toggleActivated flips state and can deactivate again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_toggleActivated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.toggleActivated(2)).assertTrue();
      const t: TagItem | null = store.findById(2);
      expect(t !== null && t.activated).assertTrue();
      expect(store.toggleActivated(2)).assertFalse();
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0500
     * @tc.name tagStore_toggleMissing_returnsNull
     * @tc.desc Verify toggling a missing tag returns null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_toggleMissing_returnsNull', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.toggleActivated(999) === null).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0600
     * @tc.name tagStore_setEnabled
     * @tc.desc Verify setEnabled updates the flag and rejects a missing id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_setEnabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.setEnabled(3, false)).assertTrue();
      const t: TagItem | null = store.findById(3);
      expect(t !== null && !t.enabled).assertTrue();
      expect(store.setEnabled(999, false)).assertFalse();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0700
     * @tc.name tagStore_getAllIsCopy
     * @tc.desc Verify getAll returns a copy so mutations do not affect the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_getAllIsCopy', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const all: TagItem[] = store.getAll();
      all.pop();
      // 副本操作不影响仓库
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0800
     * @tc.name tagStore_clear
     * @tc.desc Verify clear empties the store and resets the activated count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_clear', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      store.clear();
      expect(store.count()).assertEqual(0);
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_0900
     * @tc.name counterLogic_clamp
     * @tc.desc Verify CounterLogic.clamp bounds values to the [min, max] range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_clamp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(CounterLogic.clamp(5, 0, 10)).assertEqual(5);
      expect(CounterLogic.clamp(-1, 0, 10)).assertEqual(0);
      expect(CounterLogic.clamp(11, 0, 10)).assertEqual(10);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1000
     * @tc.name counterLogic_initialClamped
     * @tc.desc Verify out-of-range initial values are clamped on construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_initialClamped', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 初始值越界自动截断
      const c: CounterLogic = new CounterLogic(50, 0, 10, 1);
      expect(c.getValue()).assertEqual(10);
      const c2: CounterLogic = new CounterLogic(-5, 0, 10, 1);
      expect(c2.getValue()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1100
     * @tc.name counterLogic_step
     * @tc.desc Verify increase/decrease apply the configured step
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_step', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 2);
      expect(c.increase()).assertEqual(7);
      expect(c.decrease()).assertEqual(5);
      expect(c.decrease()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1200
     * @tc.name counterLogic_boundary
     * @tc.desc Verify the counter stops at min and max boundaries
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_boundary', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c: CounterLogic = new CounterLogic(9, 0, 10, 1);
      c.increase();
      expect(c.atMax()).assertTrue();
      // 上限继续加不越界
      expect(c.increase()).assertEqual(10);
      c.setValue(0);
      expect(c.atMin()).assertTrue();
      expect(c.decrease()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1300
     * @tc.name counterLogic_setValue
     * @tc.desc Verify setValue clamps to range and returns the applied value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_setValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 1);
      expect(c.setValue(8)).assertEqual(8);
      expect(c.setValue(99)).assertEqual(10);
      expect(c.setValue(-3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1400
     * @tc.name factory_buildLabelConfig
     * @tc.desc Verify buildLabelConfig maps text into LabelOptions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildLabelConfig', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const cfg = ChipConfigFactory.buildLabelConfig('标签');
      expect(cfg.text).assertEqual('标签');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1500
     * @tc.name factory_buildGroupItemConfigs
     * @tc.desc Verify group item configs map labels/icons and honor allowClose
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildGroupItemConfigs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const configs = ChipConfigFactory.buildGroupItemConfigs(['X', 'Y'], 'icon.png');
      expect(configs.length).assertEqual(2);
      expect(configs[0].label.text).assertEqual('X');
      expect(configs[1].label.text).assertEqual('Y');
      // 默认不显示关闭按钮，避免与组内“选择”交互混淆
      expect(configs[0].allowClose).assertFalse();
      const removable = ChipConfigFactory.buildGroupItemConfigs(['Z'], 'icon.png', true);
      expect(removable[0].allowClose).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1600
     * @tc.name factory_buildSegmentItems
     * @tc.desc Verify segment items map texts in input order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildSegmentItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const items = ChipConfigFactory.buildSegmentItems(['日', '周', '月']);
      expect(items.length).assertEqual(3);
      expect(items[0].text).assertEqual('日');
      expect(items[2].text).assertEqual('月');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1700
     * @tc.name factory_emptyArrays
     * @tc.desc Verify factory builders return empty arrays for empty input
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_emptyArrays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      expect(ChipConfigFactory.buildGroupItemConfigs([], 'icon.png').length).assertEqual(0);
      expect(ChipConfigFactory.buildSegmentItems([]).length).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1800
     * @tc.name factory_buildSymbolModifier
     * @tc.desc Verify buildSymbolModifier returns a SymbolGlyphModifier instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildSymbolModifier', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const m: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#FF0000');
      expect(m instanceof SymbolGlyphModifier).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1900
     * @tc.name factory_buildV1SymbolOptions
     * @tc.desc Verify V1 prefixSymbol options include an optional activated modifier
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildV1SymbolOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const normal: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#424242');
      const activated: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.heart'), '#FFFFFF');
      const onlyNormal = ChipConfigFactory.buildV1SymbolOptions(normal);
      expect(onlyNormal.normal !== undefined).assertTrue();
      expect(onlyNormal.activated === undefined).assertTrue();
      const both = ChipConfigFactory.buildV1SymbolOptions(normal, activated);
      expect(both.activated !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2000
     * @tc.name factory_buildPrefixSymbolIcon
     * @tc.desc Verify ChipV2 prefix symbol icon carries normal and activated modifiers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildPrefixSymbolIcon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const normal: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#424242');
      const activated: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#FFFFFF');
      const icon = ChipConfigFactory.buildPrefixSymbolIcon(normal, activated);
      expect(icon.normal !== undefined).assertTrue();
      expect(icon.activated !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2100
     * @tc.name factory_buildCloseIcon
     * @tc.desc Verify the close icon keeps hint text and font size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildCloseIcon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const icon = ChipConfigFactory.buildCloseIcon('删除测试标签', 20);
      expect(icon.accessibilityText).assertEqual('删除测试标签');
      expect(icon.fontSize !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2200
     * @tc.name factory_buildGroupItemStyle
     * @tc.desc Verify group item style exposes size and color metrics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildGroupItemStyle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const style = ChipConfigFactory.buildGroupItemStyle();
      expect(style.size).assertEqual(ChipV2Size.SMALL);
      expect(style.backgroundColor !== undefined).assertTrue();
      expect(style.selectedBackgroundColor !== undefined).assertTrue();
      expect(style.selectedFontColor !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2300
     * @tc.name factory_buildGroupSpace
     * @tc.desc Verify group space maps item, start and end spacing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildGroupSpace', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const space = ChipConfigFactory.buildGroupSpace();
      expect(space.itemSpace).assertEqual(12);
      expect(space.startSpace).assertEqual(8);
      expect(space.endSpace).assertEqual(8);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2400
     * @tc.name factory_buildHybridSegmentItems
     * @tc.desc Verify hybrid segment items mix Image icon, Symbol icon and text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildHybridSegmentItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const items = ChipConfigFactory.buildHybridSegmentItems(
        'icon.png', $r('sys.symbol.heart'), $r('sys.symbol.star'));
      expect(items.length).assertEqual(3);
      expect(items[0].text).assertEqual('Images');
      expect(items[0].icon !== undefined).assertTrue();
      expect(items[1].text).assertEqual('Favorite');
      expect(items[1].symbol !== undefined).assertTrue();
      expect(items[2].symbol !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2500
     * @tc.name tagStore_nextIdNotReused
     * @tc.desc Verify a new tag gets a fresh id after the highest-id tag was removed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_nextIdNotReused', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      expect(store.remove(2)).assertTrue();
      const item: TagItem = store.add('D');
      expect(item.id).assertEqual(4);
      expect(store.count()).assertEqual(3);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2600
     * @tc.name tagStore_getAllOrderPreserved
     * @tc.desc Verify getAll preserves the insertion order of tags
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_getAllOrderPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const texts: string[] = store.getAll().map((t: TagItem): string => t.text);
      expect(texts.join('-')).assertEqual('A-B-C');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2700
     * @tc.name tagStore_activatedCountWithRemove
     * @tc.desc Verify removing an activated tag decrements the activated count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_activatedCountWithRemove', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      store.toggleActivated(1);
      store.toggleActivated(3);
      expect(store.activatedCount()).assertEqual(2);
      expect(store.remove(3)).assertTrue();
      expect(store.count()).assertEqual(2);
      expect(store.activatedCount()).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2800
     * @tc.name counterLogic_stepExceedsRange
     * @tc.desc Verify a step larger than the range clamps to the boundary in one call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_stepExceedsRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const c: CounterLogic = new CounterLogic(5, 0, 10, 20);
      expect(c.increase()).assertEqual(10);
      expect(c.decrease()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2900
     * @tc.name factory_buildLabelConfigWithActivatedColor
     * @tc.desc Verify buildLabelConfig keeps the optional activated font color
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildLabelConfigWithActivatedColor', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const cfg = ChipConfigFactory.buildLabelConfig('标签', ColorMetrics.resourceColor('#FF0000'));
      expect(cfg.text).assertEqual('标签');
      expect(cfg.activatedFontColor !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3000
     * @tc.name factory_buildPrefixIconSrc
     * @tc.desc Verify buildPrefixIcon maps the image source into the config
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildPrefixIconSrc', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const cfg = ChipConfigFactory.buildPrefixIcon('icon.png');
      expect(cfg.src).assertEqual('icon.png');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3100
     * @tc.name factory_closeIconFontSizeValue
     * @tc.desc Verify buildCloseIcon maps the font size to the exact vp value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_closeIconFontSizeValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const icon = ChipConfigFactory.buildCloseIcon('删除测试标签', 20);
      const fontSize = icon.fontSize;
      expect(fontSize !== undefined).assertTrue();
      if (fontSize !== undefined) {
        expect(fontSize.value).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3200
     * @tc.name factory_hybridFieldsIsolated
     * @tc.desc Verify hybrid segment items keep icon and symbol fields isolated per item
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_hybridFieldsIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const items = ChipConfigFactory.buildHybridSegmentItems(
        'icon.png', $r('sys.symbol.heart'), $r('sys.symbol.star'));
      expect(items[0].icon !== undefined).assertTrue();
      expect(items[0].symbol === undefined).assertTrue();
      expect(items[1].icon === undefined).assertTrue();
      expect(items[1].symbol !== undefined).assertTrue();
      expect(items[2].icon === undefined).assertTrue();
      expect(items[2].symbol !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3300
     * @tc.name factory_buildSuffixSymbolOptions
     * @tc.desc Verify the V1 suffix symbol options expose a working action callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildSuffixSymbolOptions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let hits: number = 0;
      const options: ChipSuffixSymbolGlyphOptions = ChipConfigFactory.buildSuffixSymbolOptions((): void => {
        hits += 1;
      });
      if (options.action !== undefined) {
        options.action();
      }
      expect(hits).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3400
     * @tc.name factory_buildSuffixSymbolIcon
     * @tc.desc Verify the ChipV2 suffix symbol icon keeps normal/activated modifiers and action
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildSuffixSymbolIcon', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const normal: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.chevron_right'), '#424242');
      const activated: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.chevron_right'), '#FFFFFF');
      const icon: ChipV2SuffixSymbolIcon = ChipConfigFactory.buildSuffixSymbolIcon(normal, activated, (): void => {
      });
      expect(icon instanceof ChipV2SuffixSymbolIcon).assertTrue();
      expect(icon.normal !== undefined).assertTrue();
      expect(icon.activated !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3500
     * @tc.name factory_buildChipV2Padding
     * @tc.desc Verify the ChipV2 padding keeps start/end values and fixed vertical padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildChipV2Padding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const padding: LocalizedPadding = ChipConfigFactory.buildChipV2Padding(16, 16);
      expect(padding.start !== undefined && padding.start.value).assertEqual(16);
      expect(padding.end !== undefined && padding.end.value).assertEqual(16);
      expect(padding.top !== undefined && padding.top.value).assertEqual(6);
      expect(padding.bottom !== undefined && padding.bottom.value).assertEqual(6);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3600
     * @tc.name factory_buildGroupPadding
     * @tc.desc Verify the group padding maps top/bottom values into a ChipGroupV2Padding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildGroupPadding', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const padding: ChipGroupV2Padding = ChipConfigFactory.buildGroupPadding(10, 12);
      expect(padding instanceof ChipGroupV2Padding).assertTrue();
      expect(padding.top).assertEqual(10);
      expect(padding.bottom).assertEqual(12);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3700
     * @tc.name factory_buildGroupSuffixItems
     * @tc.desc Verify the group suffix holds one image item plus one item per symbol with actions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildGroupSuffixItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let iconHits: number = 0;
      const seen: number[] = [];
      const items: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [$r('sys.symbol.heart'), $r('sys.symbol.star')],
          (): void => {
            iconHits += 1;
          }, (index: number): void => {
            seen.push(index);
          });
      expect(items.length).assertEqual(3);
      const imageItem: ChipGroupV2IconItemConfig = items[0] as ChipGroupV2IconItemConfig;
      imageItem.action();
      expect(iconHits).assertEqual(1);
      (items[1] as ChipGroupV2SymbolItemConfig).action();
      expect(seen.length).assertEqual(1);
      expect(seen[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3800
     * @tc.name factory_buildSymbolSegmentItems
     * @tc.desc Verify symbol-only segment items carry a symbol plus a text hint
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildSymbolSegmentItems', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSymbolSegmentItems(
        [$r('sys.symbol.heart'), $r('sys.symbol.star')]);
      expect(items.length).assertEqual(2);
      expect(items[0].symbol !== undefined).assertTrue();
      expect(items[1].symbol !== undefined).assertTrue();
      expect(items[0].accessibilityText).assertEqual('Symbol option 1');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3900
     * @tc.name factory_buildSegmentItemsWithDisabled
     * @tc.desc Verify only the requested segment item is disabled and -1 leaves all enabled
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildSegmentItemsWithDisabled', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const items: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItemsWithDisabled(
        ['可用 A', '已禁用', '可用 B'], 1);
      expect(items[1].enabled).assertFalse();
      expect(items[0].enabled).assertTrue();
      expect(items[2].enabled).assertTrue();
      const allEnabled: SegmentButtonV2ItemOptions[] = ChipConfigFactory.buildSegmentItemsWithDisabled(['X'], -1);
      expect(allEnabled[0].enabled).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_3950
     * @tc.name factory_buildGroupSuffixItemsLitFlags
     * @tc.desc Verify onFlags only alters the lit path: item structure and index dispatch stay intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildGroupSuffixItemsLitFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const iconHits: number[] = [];
      const seen: number[] = [];
      const items: (ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig)[] =
        ChipConfigFactory.buildGroupSuffixItems('icon.png', [$r('sys.symbol.heart'), $r('sys.symbol.star')],
          (): void => {
            iconHits.push(1);
          }, (index: number): void => {
            seen.push(index);
          }, [true, false]);
      expect(items.length).assertEqual(3);
      (items[0] as ChipGroupV2IconItemConfig).action();
      (items[1] as ChipGroupV2SymbolItemConfig).action();
      (items[2] as ChipGroupV2SymbolItemConfig).action();
      expect(iconHits.length).assertEqual(1);
      expect(seen.length).assertEqual(2);
      expect(seen[0]).assertEqual(0);
      expect(seen[1]).assertEqual(1);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_4000
     * @tc.name tagStore_getAllShallowCopySemantics
     * @tc.desc Verify getAll is a structural copy whose element objects stay shared with the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_getAllShallowCopySemantics', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      store = freshStore();
      const copy: TagItem[] = store.getAll();
      copy.pop();
      expect(store.count()).assertEqual(3);
      copy[0].activated = true;
      expect(store.activatedCount()).assertEqual(1);
      copy[0].activated = false;
      expect(store.activatedCount()).assertEqual(0);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_4100
     * @tc.name tagStore_whitespaceTextPreserved
     * @tc.desc Verify whitespace-only and padded texts are stored exactly as given
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_whitespaceTextPreserved', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const fresh: TagStore = new TagStore();
      fresh.add('  ');
      fresh.add(' A ');
      const all: TagItem[] = fresh.getAll();
      expect(all.length).assertEqual(2);
      expect(all[0].text).assertEqual('  ');
      expect(all[1].text).assertEqual(' A ');
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_4200
     * @tc.name counterLogic_negativeStep
     * @tc.desc Verify a negative step reverses increase/decrease direction while clamps still hold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_negativeStep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const counter: CounterLogic = new CounterLogic(9, 0, 9, -3);
      expect(counter.getValue()).assertEqual(9);
      expect(counter.increase()).assertEqual(6);
      expect(counter.increase()).assertEqual(3);
      expect(counter.increase()).assertEqual(0);
      expect(counter.increase()).assertEqual(0);
      expect(counter.atMin()).assertTrue();
      expect(counter.decrease()).assertEqual(3);
      expect(counter.decrease()).assertEqual(6);
      expect(counter.decrease()).assertEqual(9);
      expect(counter.decrease()).assertEqual(9);
      expect(counter.atMax()).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_4300
     * @tc.name counterLogic_degenerateRangeFlags
     * @tc.desc Verify min==max range reports both boundary flags and steps stay fixed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('counterLogic_degenerateRangeFlags', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const counter: CounterLogic = new CounterLogic(7, 7, 7, 2);
      expect(counter.atMax()).assertTrue();
      expect(counter.atMin()).assertTrue();
      expect(counter.increase()).assertEqual(7);
      expect(counter.decrease()).assertEqual(7);
      expect(counter.setValue(100)).assertEqual(7);
      expect(counter.setValue(-100)).assertEqual(7);
      expect(CounterLogic.clamp(7, 7, 7)).assertEqual(7);
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_4400
     * @tc.name tagStore_addWritesLogLine
     * @tc.desc Verify TagStore.add emits a formatted LogUtil line carrying tag, action and id
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tagStore_addWritesLogLine', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const lines: string[] = [];
      const sink: LogSink = (line: string) => {
        lines.push(line);
      };
      LogUtil.init(sink, LogLevel.DEBUG);
      const counter0: number = lines.length;
      store = freshStore();
      store.add('日志联动');
      expect(lines.length - counter0).assertEqual(4);
      const last: string = lines[lines.length - 1];
      expect(last.includes('[I][ChipModels]')).assertTrue();
      expect(last.includes('TagStore.add')).assertTrue();
      expect(last.includes('#4')).assertTrue();
      expect(last.includes('日志联动')).assertTrue();
      expect(last.includes('当前 4 个')).assertTrue();
    });
  });
}
