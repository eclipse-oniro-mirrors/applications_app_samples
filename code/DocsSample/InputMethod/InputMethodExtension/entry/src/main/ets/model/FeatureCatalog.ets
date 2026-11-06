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
 */

export enum FeatureId {
  EXTRA = 'extra',
  LIST = 'list',
  PANEL = 'panel'
}

export class FeatureEntry {
  id: FeatureId;
  title: string;
  subtitle: string;
  apis: string[];
  route: string;

  constructor(id: FeatureId, title: string, subtitle: string, apis: string[], route: string) {
    this.id = id;
    this.title = title;
    this.subtitle = subtitle;
    this.apis = apis;
    this.route = route;
  }

  apiSummary(): string {
    return this.apis.join('、');
  }

  apiCount(): number {
    return this.apis.length;
  }
}

export const FEATURES: FeatureEntry[] = [
  new FeatureEntry(FeatureId.EXTRA, '扩展信息',
    'ArkUI 编辑框拉起输入法时携带的 customSettings：构造、32KB 额度、打桩读取',
    ['InputMethodExtraConfig', 'customSettings', 'CustomValueType', 'EditorAttribute.extraConfig'],
    'pages/demos/ExtraConfigDemo'),
  new FeatureEntry(FeatureId.LIST, '输入法列表',
    '系统输入法切换列表控件：显示默认输入法子类型与三方输入法，可带模式选项',
    ['InputMethodListDialog', 'PatternOptions', 'Pattern'],
    'pages/demos/InputMethodListDemo'),
  new FeatureEntry(FeatureId.PANEL, '面板与模式',
    '面板类型/状态枚举、软键盘面板预览，以及跨进程 createPanel 的真实返回',
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
  name: string;
  reason: string;

  constructor(name: string, reason: string) {
    this.name = name;
    this.reason = reason;
  }
}

export const UNCOVERED_APIS: UncoveredApi[] = [
  new UncoveredApi('InputMethodExtensionAbility 真实输入',
    '安装为输入法并在设置中启用、聚焦编辑框后才会被拉起，示例不自动改系统输入法设置'),
  new UncoveredApi('inputMethodEngine 输入回调（insertText 等）',
    '需要输入法身份与真实编辑框连接，自动化环境拿不到该连接，页面只做面板预览')
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
    return item.title.toLowerCase().includes(normalized) ||
      item.subtitle.toLowerCase().includes(normalized) ||
      item.apiSummary().toLowerCase().includes(normalized);
  });
}

/** 目录里声明的接口总数，用例用它防止"目录与页面脱节" */
export function declaredApiCount(): number {
  return FEATURES.reduce((sum: number, item: FeatureEntry) => sum + item.apiCount(), 0);
}

export function uncoveredSummary(): string {
  return UNCOVERED_APIS.map((item: UncoveredApi) => `${item.name}（${item.reason}）`).join('；');
}
