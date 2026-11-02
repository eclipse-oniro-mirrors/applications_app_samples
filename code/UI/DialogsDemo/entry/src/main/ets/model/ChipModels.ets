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
import { ChipV2LabelConfig, ChipV2PrefixImageIconConfig, ChipGroupV2ItemConfig, SegmentButtonV2ItemOptions } from '@kit.ArkUI';

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
  /** ChipV2 标签配置 */
  static buildLabelConfig(text: string): ChipV2LabelConfig {
    return { text: text } as ChipV2LabelConfig;
  }

  /** ChipV2 前缀图片图标配置 */
  static buildPrefixIcon(src: ResourceStr): ChipV2PrefixImageIconConfig {
    return { src: src } as ChipV2PrefixImageIconConfig;
  }

  /** 文本数组 → ChipGroupV2 条目配置（带前缀图标与关闭按钮） */
  static buildGroupItemConfigs(texts: string[], icon: ResourceStr): ChipGroupV2ItemConfig[] {
    const configs: ChipGroupV2ItemConfig[] = [];
    for (const t of texts) {
      configs.push({
        label: ChipConfigFactory.buildLabelConfig(t),
        prefixIcon: ChipConfigFactory.buildPrefixIcon(icon),
        allowClose: true
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
}
