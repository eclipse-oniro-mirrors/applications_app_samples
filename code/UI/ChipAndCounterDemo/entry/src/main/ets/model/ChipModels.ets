/**
 * ChipModels 反馈组件业务模型
 *
 * - TagItem/TagStore：标签数据仓库（增删、激活/禁用切换、转 ChipGroupV2ItemConfig）
 * - CounterLogic：计数逻辑（min/max 截断、步进累加，与 CounterV2 联动）
 * - ChipConfigFactory：ChipV2/ChipGroupV2/SegmentButtonV2 配置工厂（统一构建入口）
 *
 * 纯逻辑无 UI 依赖（仅配置工厂引用 kit 类型），全部可单元测试。
 */
import { LogUtil } from './utils/LogUtil';
import {
  ChipSymbolGlyphOptions, ChipV2LabelConfig, ChipV2PrefixImageIconConfig, ChipGroupV2ItemConfig,
  ChipGroupV2ItemStyle, ChipGroupV2ItemStyleConfig, ChipGroupV2Space, ChipGroupV2SpaceConfig,
  ChipV2CloseIcon, ChipV2CloseConfig, ChipV2PrefixSymbolIcon, ChipV2PrefixSymbolIconConfig, ChipV2Size,
  SegmentButtonV2ItemOptions, SymbolGlyphModifier, LengthMetrics, ColorMetrics
} from '@kit.ArkUI';

const TAG = 'ChipModels';

/** 标签数据模型 */
export interface TagItem {
  id: number;
  text: string;
  activated: boolean;
  enabled: boolean;
}

/** 标签仓库：演示标签的增删与状态切换（搜索历史、邮件标签等场景的数据层） */
export class TagStore {
  private tags: TagItem[] = [];
  private nextId: number = 1;

  /** 新增标签，返回新条目 */
  add(text: string): TagItem {
    const item: TagItem = {
      id: this.nextId,
      text: text,
      activated: false,
      enabled: true
    } as TagItem;
    this.nextId++;
    this.tags.push(item);
    LogUtil.info(TAG, `TagStore.add：#${item.id}「${text}」，当前 ${this.tags.length} 个`);
    return item;
  }

  /** 按 id 删除，返回是否删除成功 */
  remove(id: number): boolean {
    const before: number = this.tags.length;
    this.tags = this.tags.filter((t: TagItem): boolean => t.id !== id);
    const ok: boolean = this.tags.length < before;
    if (ok) {
      LogUtil.info(TAG, `TagStore.remove：#${id} 已删除，剩余 ${this.tags.length} 个`);
    } else {
      LogUtil.warn(TAG, `TagStore.remove：#${id} 不存在`);
    }
    return ok;
  }

  /** 切换激活态，返回切换后的状态；id 不存在返回 null */
  toggleActivated(id: number): boolean | null {
    for (const t of this.tags) {
      if (t.id === id) {
        t.activated = !t.activated;
        LogUtil.info(TAG, `TagStore.toggleActivated：#${id}「${t.text}」→ ${t.activated ? '激活' : '未激活'}`);
        return t.activated;
      }
    }
    LogUtil.warn(TAG, `TagStore.toggleActivated：#${id} 不存在`);
    return null;
  }

  /** 设置禁用态，返回是否设置成功 */
  setEnabled(id: number, enabled: boolean): boolean {
    for (const t of this.tags) {
      if (t.id === id) {
        t.enabled = enabled;
        LogUtil.info(TAG, `TagStore.setEnabled：#${id} → ${enabled ? '启用' : '禁用'}`);
        return true;
      }
    }
    return false;
  }

  /** 全部标签（副本） */
  getAll(): TagItem[] {
    return this.tags.slice();
  }

  /** 按 id 查找，未命中返回 null */
  findById(id: number): TagItem | null {
    for (const t of this.tags) {
      if (t.id === id) {
        return t;
      }
    }
    return null;
  }

  /** 标签数量 */
  count(): number {
    return this.tags.length;
  }

  /** 激活态数量 */
  activatedCount(): number {
    let n = 0;
    for (const t of this.tags) {
      if (t.activated) {
        n++;
      }
    }
    return n;
  }

  /** 清空 */
  clear(): void {
    this.tags = [];
    LogUtil.info(TAG, 'TagStore.clear：已清空');
  }
}

/** 计数逻辑：min/max 截断与步进（购物车数量、日期调节等场景的数据层） */
export class CounterLogic {
  private value: number;
  private readonly min: number;
  private readonly max: number;
  private readonly step: number;

  constructor(initial: number, min: number, max: number, step: number) {
    this.min = min;
    this.max = max;
    this.step = step;
    this.value = CounterLogic.clamp(initial, min, max);
  }

  /** 数值截断到 [min, max] */
  static clamp(v: number, min: number, max: number): number {
    if (v < min) {
      return min;
    }
    if (v > max) {
      return max;
    }
    return v;
  }

  /** 步进 +1 个 step，返回新值（越界截断） */
  increase(): number {
    this.value = CounterLogic.clamp(this.value + this.step, this.min, this.max);
    return this.value;
  }

  /** 步进 -1 个 step，返回新值（越界截断） */
  decrease(): number {
    this.value = CounterLogic.clamp(this.value - this.step, this.min, this.max);
    return this.value;
  }

  /** 当前值 */
  getValue(): number {
    return this.value;
  }

  /** 直接设置（自动截断），返回生效值 */
  setValue(v: number): number {
    this.value = CounterLogic.clamp(v, this.min, this.max);
    return this.value;
  }

  /** 是否已到上限 */
  atMax(): boolean {
    return this.value >= this.max;
  }

  /** 是否已到下限 */
  atMin(): boolean {
    return this.value <= this.min;
  }
}

/** 配置工厂：统一构建 ChipV2/ChipGroupV2/SegmentButtonV2 配置对象 */
export class ChipConfigFactory {
  /** ChipV2 标签配置（activatedFontColor 属于 LabelConfig，不在 ChipV2Options 上） */
  static buildLabelConfig(text: string, activatedFontColor?: ColorMetrics): ChipV2LabelConfig {
    if (activatedFontColor !== undefined) {
      return { text: text, activatedFontColor: activatedFontColor } as ChipV2LabelConfig;
    }
    return { text: text } as ChipV2LabelConfig;
  }

  /** ChipV2 前缀图片图标配置 */
  static buildPrefixIcon(src: ResourceStr): ChipV2PrefixImageIconConfig {
    return { src: src } as ChipV2PrefixImageIconConfig;
  }

  /** 文本数组 → ChipGroupV2 条目配置（默认不带关闭按钮，避免与“选择”交互混淆） */
  static buildGroupItemConfigs(texts: string[], icon: ResourceStr, allowClose: boolean = false): ChipGroupV2ItemConfig[] {
    const configs: ChipGroupV2ItemConfig[] = [];
    for (const t of texts) {
      configs.push({
        label: ChipConfigFactory.buildLabelConfig(t),
        prefixIcon: ChipConfigFactory.buildPrefixIcon(icon),
        allowClose: allowClose
      } as ChipGroupV2ItemConfig);
    }
    return configs;
  }

  /** 文本数组 → SegmentButtonV2 条目配置 */
  static buildSegmentItems(texts: string[]): SegmentButtonV2ItemOptions[] {
    const items: SegmentButtonV2ItemOptions[] = [];
    for (const t of texts) {
      items.push({ text: t } as SegmentButtonV2ItemOptions);
    }
    return items;
  }

  /** SymbolGlyphModifier：HM Symbol 图标 + 颜色（图标本身由系统 Symbol 资源渲染） */
  static buildSymbolModifier(src: Resource, color: ResourceColor): SymbolGlyphModifier {
    const modifier = new SymbolGlyphModifier(src);
    modifier.fontColor([color]);
    return modifier;
  }

  /** Chip V1 的 prefixSymbol/suffixSymbol 配置（normal 必填，activated 可选） */
  static buildV1SymbolOptions(normal: SymbolGlyphModifier, activated?: SymbolGlyphModifier): ChipSymbolGlyphOptions {
    if (activated !== undefined) {
      return { normal: normal, activated: activated } as ChipSymbolGlyphOptions;
    }
    return { normal: normal } as ChipSymbolGlyphOptions;
  }

  /** ChipV2 前缀 Symbol 图标（普通态/激活态两种颜色） */
  static buildPrefixSymbolIcon(normal: SymbolGlyphModifier, activated: SymbolGlyphModifier): ChipV2PrefixSymbolIcon {
    return new ChipV2PrefixSymbolIcon({ normal: normal, activated: activated } as ChipV2PrefixSymbolIconConfig);
  }

  /** ChipV2 自定义关闭图标：可访问文案 + 图标字号 */
  static buildCloseIcon(accessibilityText: string, fontSizeVp: number): ChipV2CloseIcon {
    return new ChipV2CloseIcon({
      accessibilityText: accessibilityText,
      fontSize: LengthMetrics.vp(fontSizeVp)
    } as ChipV2CloseConfig);
  }

  /** ChipGroupV2 条目样式：小尺寸、浅橙底橙字，选中橙底白字（与默认蓝色选中明显区分） */
  static buildGroupItemStyle(): ChipGroupV2ItemStyle {
    return new ChipGroupV2ItemStyle({
      size: ChipV2Size.SMALL,
      backgroundColor: ColorMetrics.resourceColor('#FFF3E0'),
      fontColor: ColorMetrics.resourceColor('#E65100'),
      selectedBackgroundColor: ColorMetrics.resourceColor('#E65100'),
      selectedFontColor: ColorMetrics.resourceColor('#FFFFFF')
    } as ChipGroupV2ItemStyleConfig);
  }

  /** ChipGroupV2 间距：条目间距 12vp，首尾各留 8vp */
  static buildGroupSpace(): ChipGroupV2Space {
    return new ChipGroupV2Space({ itemSpace: 12, startSpace: 8, endSpace: 8 } as ChipGroupV2SpaceConfig);
  }

  /** SegmentButtonV2 图文混合条目：Image 图标+文本、两个 Symbol 图标+文本 */
  static buildHybridSegmentItems(icon: ResourceStr, symbolA: Resource, symbolB: Resource): SegmentButtonV2ItemOptions[] {
    return [
      { icon: icon, text: '图片' } as SegmentButtonV2ItemOptions,
      { symbol: symbolA, text: '收藏' } as SegmentButtonV2ItemOptions,
      { symbol: symbolB, text: '星标' } as SegmentButtonV2ItemOptions
    ];
  }
}
