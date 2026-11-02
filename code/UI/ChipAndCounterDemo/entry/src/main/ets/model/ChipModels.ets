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
import { LogUtil } from './utils/LogUtil';
import {
  ChipSymbolGlyphOptions, ChipSuffixSymbolGlyphOptions, ChipV2LabelConfig, ChipV2PrefixImageIconConfig,
  ChipGroupV2ItemConfig, ChipGroupV2IconItemConfig, ChipGroupV2SymbolItemConfig,
  ChipGroupV2ItemStyle, ChipGroupV2ItemStyleConfig, ChipGroupV2Space, ChipGroupV2SpaceConfig,
  ChipGroupV2Padding, ChipGroupV2PaddingConfig,
  ChipV2CloseIcon, ChipV2CloseConfig, ChipV2PrefixSymbolIcon, ChipV2PrefixSymbolIconConfig,
  ChipV2SuffixSymbolIcon, ChipV2SuffixSymbolIconConfig, ChipV2Size,
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

  /** Chip V1 后缀 Symbol 的可点击配置（suffixSymbol 负责外观，suffixSymbolOptions 负责点击） */
  static buildSuffixSymbolOptions(action: VoidCallback): ChipSuffixSymbolGlyphOptions {
    return { action: action } as ChipSuffixSymbolGlyphOptions;
  }

  /** ChipV2 后缀 Symbol 图标：普通态/激活态两种颜色 + 点击回调 */
  static buildSuffixSymbolIcon(normal: SymbolGlyphModifier, activated: SymbolGlyphModifier,
    action: VoidCallback): ChipV2SuffixSymbolIcon {
    return new ChipV2SuffixSymbolIcon({ normal: normal, activated: activated, action: action } as ChipV2SuffixSymbolIconConfig);
  }

  /** ChipV2 自定义内边距：左右 start/end 可调，上下固定 6vp */
  static buildChipV2Padding(startVp: number, endVp: number): LocalizedPadding {
    return {
      start: LengthMetrics.vp(startVp),
      end: LengthMetrics.vp(endVp),
      top: LengthMetrics.vp(6),
      bottom: LengthMetrics.vp(6)
    } as LocalizedPadding;
  }

  /** ChipGroupV2 组内容器的上下内边距 */
  static buildGroupPadding(topVp: number, bottomVp: number): ChipGroupV2Padding {
    return new ChipGroupV2Padding({ top: topVp, bottom: bottomVp } as ChipGroupV2PaddingConfig);
  }

  /** ChipGroupV2 尾部图标组：Image 图标 + 若干 Symbol 图标，onFlags[i] 为 true 时点亮为橙色（点赞/收藏态），否则灰色；点击各自触发回调 */
  static buildGroupSuffixItems(icon: ResourceStr, symbols: Resource[],
    onIconAction: VoidCallback, onSymbolAction: (index: number) => void, onFlags?: boolean[]):
    Array<ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig> {
    const items: Array<ChipGroupV2IconItemConfig | ChipGroupV2SymbolItemConfig> = [];
    items.push({ icon: ChipConfigFactory.buildPrefixIcon(icon), action: onIconAction } as ChipGroupV2IconItemConfig);
    for (let i = 0; i < symbols.length; i++) {
      const idx: number = i;
      const lit: boolean = onFlags !== undefined && onFlags[i] === true;
      items.push({
        symbol: ChipConfigFactory.buildSymbolModifier(symbols[i], lit ? '#E65100' : '#BDBDBD'),
        action: (): void => onSymbolAction(idx)
      } as ChipGroupV2SymbolItemConfig);
    }
    return items;
  }

  /** SegmentButtonV2 纯 Symbol 条目（图标无文本，靠无障碍文案兜底） */
  static buildSymbolSegmentItems(symbols: Resource[]): SegmentButtonV2ItemOptions[] {
    const items: SegmentButtonV2ItemOptions[] = [];
    for (let i = 0; i < symbols.length; i++) {
      items.push({
        symbol: symbols[i],
        accessibilityText: `第 ${i + 1} 个图标选项`
      } as SegmentButtonV2ItemOptions);
    }
    return items;
  }

  /** SegmentButtonV2 条目：disabledIndex 位置（-1 表示无）置为 enabled=false */
  static buildSegmentItemsWithDisabled(texts: string[], disabledIndex: number): SegmentButtonV2ItemOptions[] {
    const items: SegmentButtonV2ItemOptions[] = [];
    for (let i = 0; i < texts.length; i++) {
      const disabled: boolean = i === disabledIndex;
      items.push({ text: texts[i], enabled: !disabled } as SegmentButtonV2ItemOptions);
    }
    return items;
  }
}
