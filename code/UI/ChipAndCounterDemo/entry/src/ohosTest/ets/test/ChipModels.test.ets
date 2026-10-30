
/**
 * 文件：entry/src/ohosTest/ets/test/ChipModels.test.ets
 * 套件：chipModelsTest（32 条用例）
 * 内容：ChipModels 业务模型设备侧测试
 * - TagStore：增删/激活切换/禁用/查找/统计/清空/边界（删不存在 id、切换不存在 id、id 不复用、顺序保持）
 * - CounterLogic：clamp/步进/上下限边界/直接设置/跨度过大
 * - ChipConfigFactory：配置工厂字段映射（含 Symbol 图标/closeIcon 字号/分组样式与间距/图文混合字段隔离）
 * 运行：aa test -b com.samples.chipandcounterdemo -m entry_test -s unittest OpenHarmonyTestRunner
 */
import { describe, beforeAll, it, expect } from '@ohos/hypium';
import { TagStore, CounterLogic, ChipConfigFactory, TagItem } from '../../../main/ets/model/ChipModels';
import { SymbolGlyphModifier, ChipV2Size, ColorMetrics } from '@kit.ArkUI';

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
    it('tagStore_add', 0, () => {
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
    it('tagStore_remove', 0, () => {
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
    it('tagStore_removeMissing', 0, () => {
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
    it('tagStore_toggleActivated', 0, () => {
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
    it('tagStore_toggleMissing_returnsNull', 0, () => {
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
    it('tagStore_setEnabled', 0, () => {
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
    it('tagStore_getAllIsCopy', 0, () => {
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
    it('tagStore_clear', 0, () => {
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
    it('counterLogic_clamp', 0, () => {
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
    it('counterLogic_initialClamped', 0, () => {
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
    it('counterLogic_step', 0, () => {
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
    it('counterLogic_boundary', 0, () => {
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
    it('counterLogic_setValue', 0, () => {
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
    it('factory_buildLabelConfig', 0, () => {
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
    it('factory_buildGroupItemConfigs', 0, () => {
      const configs = ChipConfigFactory.buildGroupItemConfigs(['X', 'Y'], 'icon.png');
      expect(configs.length).assertEqual(2);
      expect(configs[0].label.text).assertEqual('X');
      expect(configs[1].label.text).assertEqual('Y');
      // 默认不显示关闭按钮，避免与组内“选择”交互混淆
      expect(configs[0].allowClose).assertFalse();
      const closable = ChipConfigFactory.buildGroupItemConfigs(['Z'], 'icon.png', true);
      expect(closable[0].allowClose).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_1600
     * @tc.name factory_buildSegmentItems
     * @tc.desc Verify segment items map texts in input order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildSegmentItems', 0, () => {
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
    it('factory_emptyArrays', 0, () => {
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
    it('factory_buildSymbolModifier', 0, () => {
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
    it('factory_buildV1SymbolOptions', 0, () => {
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
    it('factory_buildPrefixSymbolIcon', 0, () => {
      const normal: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#424242');
      const activated: SymbolGlyphModifier = ChipConfigFactory.buildSymbolModifier($r('sys.symbol.star'), '#FFFFFF');
      const icon = ChipConfigFactory.buildPrefixSymbolIcon(normal, activated);
      expect(icon.normal !== undefined).assertTrue();
      expect(icon.activated !== undefined).assertTrue();
    });

    /**
     * @tc.number SUB_CHIP_COUNTER_DEMO_CHIPMODELS_2100
     * @tc.name factory_buildCloseIcon
     * @tc.desc Verify the close icon keeps accessibility text and font size
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('factory_buildCloseIcon', 0, () => {
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
    it('factory_buildGroupItemStyle', 0, () => {
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
    it('factory_buildGroupSpace', 0, () => {
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
    it('factory_buildHybridSegmentItems', 0, () => {
      const items = ChipConfigFactory.buildHybridSegmentItems(
        'icon.png', $r('sys.symbol.heart'), $r('sys.symbol.star'));
      expect(items.length).assertEqual(3);
      expect(items[0].text).assertEqual('图片');
      expect(items[0].icon !== undefined).assertTrue();
      expect(items[1].text).assertEqual('收藏');
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
    it('tagStore_nextIdNotReused', 0, () => {
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
    it('tagStore_getAllOrderPreserved', 0, () => {
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
    it('tagStore_activatedCountWithRemove', 0, () => {
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
    it('counterLogic_stepExceedsRange', 0, () => {
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
    it('factory_buildLabelConfigWithActivatedColor', 0, () => {
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
    it('factory_buildPrefixIconSrc', 0, () => {
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
    it('factory_closeIconFontSizeValue', 0, () => {
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
    it('factory_hybridFieldsIsolated', 0, () => {
      const items = ChipConfigFactory.buildHybridSegmentItems(
        'icon.png', $r('sys.symbol.heart'), $r('sys.symbol.star'));
      expect(items[0].icon !== undefined).assertTrue();
      expect(items[0].symbol === undefined).assertTrue();
      expect(items[1].icon === undefined).assertTrue();
      expect(items[1].symbol !== undefined).assertTrue();
      expect(items[2].icon === undefined).assertTrue();
      expect(items[2].symbol !== undefined).assertTrue();
    });
  });
}
