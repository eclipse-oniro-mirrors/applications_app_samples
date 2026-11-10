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
 * HFP（AG 角色）的 Profile 元数据。
 * 纯数据 + 纯函数，不依赖 ConnectivityKit，因此本地单测与设备侧用例都能直接断言。
 *
 * 说明：本示例早期版本在 HFP 里还提供过 AG / HF 双角色对照，真机实测 HF 角色只在
 * phone / wearable 上登记实现，在示例设备上拿不到可用链路，因此这一版只保留 AG。
 *
 * 展示文本（标题 / 角色 / 说明 / 备注）以资源名称保存，读取时再经 StringResource 解析：
 * 模块级常量在资源管理器绑定前就已构造，不能在这里缓存解析后的文本。
 */

import { text } from '../common/StringResource';

export enum ProfileKind {
  HFP = 'hfp'
}

export class ProfileMeta {
  kind: ProfileKind;
  code: string;
  apiName: string;
  interfaceName: string;
  createFunction: string;
  profileId: number;
  docPage: string;
  private titleName: string;
  private roleName: string;
  private summaryName: string;
  private noteName: string;

  constructor(kind: ProfileKind, code: string, apiName: string, titleName: string, roleName: string,
              interfaceName: string, createFunction: string, profileId: number, docPage: string,
              summaryName: string, noteName: string) {
    this.kind = kind;
    this.code = code;
    this.apiName = apiName;
    this.titleName = titleName;
    this.roleName = roleName;
    this.interfaceName = interfaceName;
    this.createFunction = createFunction;
    this.profileId = profileId;
    this.docPage = docPage;
    this.summaryName = summaryName;
    this.noteName = noteName;
  }

  get title(): string {
    return text(this.titleName);
  }

  get role(): string {
    return text(this.roleName);
  }

  get summary(): string {
    return text(this.summaryName);
  }

  get note(): string {
    return text(this.noteName);
  }
}

export const PROFILE_METAS: ProfileMeta[] = [
  new ProfileMeta(
    ProfileKind.HFP, 'HFP', '@ohos.bluetooth.hfp', 'catalog_hfp_title',
    'catalog_role_ag', 'HandsFreeAudioGatewayProfile', 'hfp.createHfpAgProfile()',
    4, 'js-apis-bluetooth-hfp.md',
    'catalog_hfp_desc',
    'catalog_hfp_note'
  )
];

export function metaOf(kind: ProfileKind): ProfileMeta {
  for (const meta of PROFILE_METAS) {
    if (meta.kind === kind) {
      return meta;
    }
  }
  return PROFILE_METAS[0];
}

export function isProfileKind(value: string): boolean {
  return value === ProfileKind.HFP;
}

/** 首页搜索：命中 code / 标题 / 接口名 / 说明任一字段即保留；空关键字返回全部 */
export function filterProfiles(keyword: string, items: ProfileMeta[] = PROFILE_METAS): ProfileMeta[] {
  const normalized = keyword.trim().toLowerCase();
  if (normalized.length === 0) {
    return items;
  }
  return items.filter((item: ProfileMeta) => {
    return item.code.toLowerCase().includes(normalized) ||
      item.title.toLowerCase().includes(normalized) ||
      item.apiName.toLowerCase().includes(normalized) ||
      item.interfaceName.toLowerCase().includes(normalized) ||
      item.summary.toLowerCase().includes(normalized);
  });
}

export function createFunctionOf(kind: ProfileKind): string {
  return metaOf(kind).createFunction;
}

/** 角色名固定为 AG，页面标题与日志都用它，避免与已删除的 HF 角色混称 */
export function hfpRoleName(): string {
  return text('catalog_role_ag_short');
}
