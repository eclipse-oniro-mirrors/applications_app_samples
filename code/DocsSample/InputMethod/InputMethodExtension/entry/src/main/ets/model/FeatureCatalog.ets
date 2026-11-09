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

/**
 * 首页目录的数据源：每个条目对应一个演示页，条目里列出该页覆盖的接口。
 * 目录与页面必须一一对应，"列在目录里但页面没实现"是本示例刻意避免的。
 *
 * title / subtitle 存的是 string.json 里的资源名（静态常量在模块加载时求值，那时资源管理器
 * 还没绑定，所以不能直接存文案）；渲染与搜索统一走 titleText() / subtitleText()。
 */

import { text } from '../common/L10n';

export enum FeatureId {
  EXTRA = 'extra',
  LIST = 'list',
  PANEL = 'panel'
}

export class FeatureEntry {
  public id: FeatureId;
  public title: string;
  public subtitle: string;
  public apis: string[];
  public route: string;

  constructor(id: FeatureId, title: string, subtitle: string, apis: string[], route: string) {
    this.id = id;
    this.title = title;
    this.subtitle = subtitle;
    this.apis = apis;
    this.route = route;
  }

  titleText(): string {
    return text(this.title);
  }

  subtitleText(): string {
    return text(this.subtitle);
  }

  apiSummary(): string {
    return this.apis.join(text('feature_api_join'));
  }

  apiCount(): number {
    return this.apis.length;
  }
}

export const FEATURES: FeatureEntry[] = [
  new FeatureEntry(FeatureId.EXTRA, 'feature_extra_title', 'feature_extra_subtitle',
    ['InputMethodExtraConfig', 'customSettings', 'CustomValueType', 'EditorAttribute.extraConfig'],
    'pages/demos/ExtraConfigDemo'),
  new FeatureEntry(FeatureId.LIST, 'feature_list_title', 'feature_list_subtitle',
    ['InputMethodListDialog', 'PatternOptions', 'Pattern'],
    'pages/demos/InputMethodListDemo'),
  new FeatureEntry(FeatureId.PANEL, 'feature_panel_title', 'feature_panel_subtitle',
    ['PanelType', 'PanelFlag', 'getInputMethodAbility', 'createPanel'],
    'pages/demos/PanelDemo')
];

/**
 * 本示例不覆盖、但同样属于输入法扩展能力的部分。
 * 原因写在 reason 里：两者都需要"本应用已被系统启用为输入法"这一前提，
 * 而启用动作要在设置的输入法管理里手动完成，示例不自动改系统设置。
 * 这里不写"不支持"，只写"未覆盖"和原因——能力是否可用不由示例的取舍来断定。
 */
export class UncoveredApi {
  public name: string;
  public reason: string;

  constructor(name: string, reason: string) {
    this.name = name;
    this.reason = reason;
  }
}

export const UNCOVERED_APIS: UncoveredApi[] = [
  new UncoveredApi('uncovered_ime_name', 'uncovered_ime_reason'),
  new UncoveredApi('uncovered_engine_name', 'uncovered_engine_reason')
];

export function featureById(id: FeatureId): FeatureEntry {
  const found = FEATURES.find((item: FeatureEntry) => item.id === id);
  return found !== undefined ? found : FEATURES[0];
}

export function routes(): string[] {
  return FEATURES.map((item: FeatureEntry) => item.route);
}

/** 首页搜索：命中标题、副标题或任一接口名即保留；空关键字返回全部 */
export function filterFeatures(keyword: string, items: FeatureEntry[] = FEATURES): FeatureEntry[] {
  const normalized = keyword.trim().toLowerCase();
  if (normalized.length === 0) {
    return items;
  }
  return items.filter((item: FeatureEntry) => {
    return item.titleText().toLowerCase().includes(normalized) ||
      item.subtitleText().toLowerCase().includes(normalized) ||
      item.apiSummary().toLowerCase().includes(normalized);
  });
}

/** 目录里声明的接口总数，用例用它防止"目录与页面脱节" */
export function declaredApiCount(): number {
  return FEATURES.reduce((sum: number, item: FeatureEntry) => sum + item.apiCount(), 0);
}

export function uncoveredSummary(): string {
  return UNCOVERED_APIS.map((item: UncoveredApi) => text('uncovered_item', text(item.name), text(item.reason)))
    .join(text('uncovered_join'));
}
