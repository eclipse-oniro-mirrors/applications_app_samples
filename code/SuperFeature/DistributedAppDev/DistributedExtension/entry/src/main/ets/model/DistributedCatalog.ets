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
 * 分布式扩展与链路的三条能力元数据。
 * 纯数据 + 纯函数，不依赖 DistributedServiceKit，因此本地单测与设备侧用例都能直接断言。
 *
 * 用户可见的四段文案（title / summary / note / permission）存的是资源名，
 * 因为模块级常量在 import 求值时就定型，那时 ResourceManager 还没绑定；
 * 展示时统一走 titleText / summaryText / noteText / permissionText 在运行时解析。
 */

import { text } from '../common/StringResource';

export enum FeatureKind {
  EXTENSION = 'extension',
  LINK = 'link',
  CHANNEL = 'channel'
}

export class FeatureMeta {
  public kind: FeatureKind;
  public code: string;
  public apiName: string;
  public interfaceName: string;
  public entryFunction: string;
  public title: string;
  public permission: string;
  public docPage: string;
  public summary: string;
  public note: string;

  constructor(kind: FeatureKind, code: string, apiName: string, interfaceName: string, entryFunction: string,
              title: string, permission: string, docPage: string, summary: string, note: string) {
    this.kind = kind;
    this.code = code;
    this.apiName = apiName;
    this.interfaceName = interfaceName;
    this.entryFunction = entryFunction;
    this.title = title;
    this.permission = permission;
    this.docPage = docPage;
    this.summary = summary;
    this.note = note;
  }
}

export const FEATURE_METAS: FeatureMeta[] = [
  new FeatureMeta(
    FeatureKind.EXTENSION, 'EXT', '@ohos.application.DistributedExtensionAbility / DistributedExtensionContext',
    'DistributedExtensionAbility', 'catalog_ext_entry',
    'catalog_ext_title', 'catalog_ext_permission', 'js-apis-distributedExtensionAbility.md',
    'catalog_ext_summary', 'catalog_ext_note'
  ),
  new FeatureMeta(
    FeatureKind.LINK, 'LINK', '@ohos.distributedsched.linkEnhance', 'linkEnhance.Server / linkEnhance.Connection',
    'linkEnhance.createServer() / createConnection()', 'catalog_link_title', 'ohos.permission.DISTRIBUTED_DATASYNC',
    'js-apis-link-enhance.md', 'catalog_link_summary', 'catalog_link_note'
  ),
  new FeatureMeta(
    FeatureKind.CHANNEL, 'CHAN', '@ohos.distributedsched.proxyChannelManager', 'proxyChannelManager',
    'proxyChannelManager.openProxyChannel()', 'catalog_chan_title', 'ohos.permission.ACCESS_BLUETOOTH',
    'js-apis-proxyChannelManager.md', 'catalog_chan_summary', 'catalog_chan_note'
  )
];

/** 只有以 catalog_ 开头的才是资源名，其余（接口名、函数签名）原样返回 */
function resolveMaybe(name: string): string {
  return name.indexOf('catalog_') === 0 ? text(name) : name;
}

export function titleText(meta: FeatureMeta): string {
  return resolveMaybe(meta.title);
}

export function summaryText(meta: FeatureMeta): string {
  return resolveMaybe(meta.summary);
}

export function noteText(meta: FeatureMeta): string {
  return resolveMaybe(meta.note);
}

export function permissionText(meta: FeatureMeta): string {
  return resolveMaybe(meta.permission);
}

export function entryText(meta: FeatureMeta): string {
  return resolveMaybe(meta.entryFunction);
}

export function metaOf(kind: FeatureKind): FeatureMeta {
  for (const meta of FEATURE_METAS) {
    if (meta.kind === kind) {
      return meta;
    }
  }
  return FEATURE_METAS[0];
}

export function isFeatureKind(value: string): boolean {
  return value === FeatureKind.EXTENSION || value === FeatureKind.LINK || value === FeatureKind.CHANNEL;
}

/** 首页搜索：命中 code / 标题 / 接口名 / 说明任一字段即保留；空关键字返回全部 */
export function filterFeatures(keyword: string, items: FeatureMeta[] = FEATURE_METAS): FeatureMeta[] {
  const normalized = keyword.trim().toLowerCase();
  if (normalized.length === 0) {
    return items;
  }
  return items.filter((item: FeatureMeta) => {
    return item.code.toLowerCase().includes(normalized) ||
      titleText(item).toLowerCase().includes(normalized) ||
      item.apiName.toLowerCase().includes(normalized) ||
      item.interfaceName.toLowerCase().includes(normalized) ||
      summaryText(item).toLowerCase().includes(normalized);
  });
}

export function entryFunctionOf(kind: FeatureKind): string {
  return metaOf(kind).entryFunction;
}

export function entryFunctionText(kind: FeatureKind): string {
  return entryText(metaOf(kind));
}
