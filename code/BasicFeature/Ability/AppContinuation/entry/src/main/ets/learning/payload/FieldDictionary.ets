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

import { localize, registerLocaleCatalog } from '../../common/LocaleStrings';
/**
 * 载荷字段字典。
 *
 * 编码只关心"能不能存"，字典关心"这个字段是什么意思、给谁看、缺失会怎样"。
 * 页面用它渲染字段说明与真实取值，导出用它生成表头，测试用它核对字段覆盖。
 */

import { PayloadData } from './PayloadCodec';
import { PAYLOAD_FIELDS, PayloadField } from './PayloadSchema';

/** 字段用途。 */
export enum FieldRole {
  IDENTITY = 'identity',
  CONTENT = 'content',
  POSITION = 'position',
  CONTEXT = 'context',
  INTEGRITY = 'integrity',
  DERIVED = 'derived'
}

/** 用途标签。 */
export function roleLabel(role: FieldRole): string {
  switch (role) {
    case FieldRole.IDENTITY:
      return localize('ac_fielddictionary_001');
    case FieldRole.CONTENT:
      return localize('ac_fielddictionary_002');
    case FieldRole.POSITION:
      return localize('ac_fielddictionary_003');
    case FieldRole.CONTEXT:
      return localize('ac_fielddictionary_004');
    case FieldRole.INTEGRITY:
      return localize('ac_fielddictionary_005');
    default:
      return localize('ac_fielddictionary_006');
  }
}

/** 展示单位。 */
export enum FieldUnit {
  NONE = 'none',
  CHARS = 'chars',
  COUNT = 'count',
  MILLIS = 'ms'
}

/** 单位文本。 */
export function unitLabel(unit: FieldUnit): string {
  switch (unit) {
    case FieldUnit.CHARS:
      return localize('ac_fielddictionary_007');
    case FieldUnit.COUNT:
      return localize('ac_fielddictionary_008');
    case FieldUnit.MILLIS:
      return localize('ac_fielddictionary_009');
    default:
      return '';
  }
}

/** 一条字段说明。 */
export class FieldDoc {
  public key: string = '';
  public label: string = '';
  public role: FieldRole = FieldRole.CONTENT;
  public unit: FieldUnit = FieldUnit.NONE;
  /** 是否必填。 */
  public required: boolean = false;
  /** 长度上限；0 表示不限。 */
  public maxLength: number = 0;
  /** 缺失时的行为说明。 */
  public missingHint: string = '';
  /** 是否在界面上展示。 */
  public visible: boolean = true;

  constructor(key: string = '', label: string = '', role: FieldRole = FieldRole.CONTENT,
    unit: FieldUnit = FieldUnit.NONE, required: boolean = false, maxLength: number = 0,
    missingHint: string = '', visible: boolean = true) {
    this.key = key;
    this.label = label;
    this.role = role;
    this.unit = unit;
    this.required = required;
    this.maxLength = maxLength;
    this.missingHint = missingHint;
    this.visible = visible;
  }

  public text(): string {
    const limit: string = this.maxLength > 0 ? `≤${this.maxLength}` : localize('ac_fielddictionary_010');
    return `${this.key} ${this.label}｜${roleLabel(this.role)}｜${limit}｜` +
      `${this.required ? localize('ac_fielddictionary_011') : localize('ac_fielddictionary_012')}`;
  }
}

/** 字段字典。派生字段不参与编码，只用于展示与统计。 */
function createFIELD_DOCS(): FieldDoc[] {
  return [
  new FieldDoc('doc', localize('ac_fielddictionary_013'), FieldRole.IDENTITY, FieldUnit.NONE, true, 64,
    localize('ac_fielddictionary_014')),
  new FieldDoc('rev', localize('ac_fielddictionary_015'), FieldRole.IDENTITY, FieldUnit.COUNT, true, 12,
    localize('ac_fielddictionary_016')),
  new FieldDoc('title', localize('ac_index_115'), FieldRole.CONTENT, FieldUnit.CHARS, false, 64,
    localize('ac_fielddictionary_018')),
  new FieldDoc('body', localize('ac_index_119'), FieldRole.CONTENT, FieldUnit.CHARS, false, 4096,
    localize('ac_fielddictionary_020')),
  new FieldDoc('cs', localize('ac_fielddictionary_021'), FieldRole.POSITION, FieldUnit.COUNT, false, 12,
    localize('ac_fielddictionary_016')),
  new FieldDoc('ce', localize('ac_fielddictionary_023'), FieldRole.POSITION, FieldUnit.COUNT, false, 12,
    localize('ac_fielddictionary_016')),
  new FieldDoc('dev', localize('ac_fielddictionary_025'), FieldRole.CONTEXT, FieldUnit.NONE, false, 64,
    localize('ac_fielddictionary_026')),
  new FieldDoc('at', localize('ac_fielddictionary_027'), FieldRole.CONTEXT, FieldUnit.MILLIS, false, 20,
    localize('ac_fielddictionary_028')),
  new FieldDoc('app', localize('ac_fielddictionary_029'), FieldRole.CONTEXT, FieldUnit.NONE, false, 32,
    localize('ac_fielddictionary_030')),
  new FieldDoc('ck', localize('ac_fielddictionary_031'), FieldRole.INTEGRITY, FieldUnit.NONE, false, 16,
    localize('ac_fielddictionary_032')),
  new FieldDoc('sig', localize('ac_fielddictionary_033'), FieldRole.INTEGRITY, FieldUnit.NONE, false, 32,
    localize('ac_fielddictionary_034')),
  new FieldDoc('v', localize('ac_fielddictionary_035'), FieldRole.IDENTITY, FieldUnit.COUNT, true, 4,
    localize('ac_fielddictionary_036'), false),
  new FieldDoc('bodyLength', localize('ac_fielddictionary_037'), FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    localize('ac_fielddictionary_038'), true),
  new FieldDoc('selectionLength', localize('ac_fielddictionary_039'), FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    localize('ac_fielddictionary_040'), true),
  new FieldDoc('payloadSize', localize('ac_fielddictionary_041'), FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    localize('ac_fielddictionary_042'), true),
  new FieldDoc('remainChars', localize('ac_fielddictionary_043'), FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    localize('ac_fielddictionary_044'), true),
  new FieldDoc('ageMinutes', localize('ac_fielddictionary_045'), FieldRole.DERIVED, FieldUnit.MILLIS, false, 0,
    localize('ac_fielddictionary_046'), true),
  new FieldDoc('conflictText', localize('ac_fielddictionary_047'), FieldRole.DERIVED, FieldUnit.NONE, false, 0,
    localize('ac_fielddictionary_048'), true),
  new FieldDoc('revisionGap', localize('ac_fielddictionary_049'), FieldRole.DERIVED, FieldUnit.COUNT, false, 0,
    localize('ac_fielddictionary_050'), true),
  new FieldDoc('tagCount', localize('ac_fielddictionary_051'), FieldRole.DERIVED, FieldUnit.COUNT, false, 0,
    localize('ac_fielddictionary_052'), false)
];
}

export const FIELD_DOCS: FieldDoc[] = createFIELD_DOCS();
registerLocaleCatalog((): void => {
  FIELD_DOCS.splice(0, FIELD_DOCS.length);
  createFIELD_DOCS().forEach((item: FieldDoc): void => { FIELD_DOCS.push(item); });
});

/** 字段键列表。 */
export function docKeys(): string[] {
  return FIELD_DOCS.map((doc: FieldDoc): string => doc.key);
}

/** 按 key 取说明。 */
export function docOf(key: string): FieldDoc | undefined {
  return FIELD_DOCS.find((doc: FieldDoc): boolean => doc.key === key);
}

/** 按用途取说明。 */
export function docsOfRole(role: FieldRole): FieldDoc[] {
  return FIELD_DOCS.filter((doc: FieldDoc): boolean => doc.role === role);
}

/** 必填字段。 */
export function requiredDocs(): FieldDoc[] {
  return FIELD_DOCS.filter((doc: FieldDoc): boolean => doc.required);
}

/** 可见字段。 */
export function visibleDocs(): FieldDoc[] {
  return FIELD_DOCS.filter((doc: FieldDoc): boolean => doc.visible);
}

/** 载荷字段与字典的一致性：字典必须覆盖 PayloadSchema 的每个字段。 */
export function missingSchemaKeys(): string[] {
  const keys: string[] = docKeys();
  return PAYLOAD_FIELDS.map((field: PayloadField): string => field.name)
    .filter((name: string): boolean => keys.indexOf(name) < 0);
}

/** 冲突标记到说明的映射。 */
export function conflictText(marker: string): string {
  switch (marker) {
    case 'none':
      return localize('ac_conflictpolicy_001');
    case 'remoteNewer':
      return localize('ac_conflictpolicy_002');
    case 'localNewer':
      return localize('ac_conflictpolicy_003');
    case 'bothChanged':
      return localize('ac_conflictpolicy_004');
    default:
      return localize('ac_conflictpolicy_007');
  }
}

/** 取字段的展示值。派生字段按载荷实时计算。 */
export function valueOfKey(data: PayloadData, key: string): string {
  switch (key) {
    case 'doc':
      return data.doc;
    case 'rev':
      return data.rev.toString();
    case 'title':
      return data.title;
    case 'body':
      return data.body;
    case 'cs':
      return data.cs.toString();
    case 'ce':
      return data.ce.toString();
    case 'dev':
      return data.dev;
    case 'at':
      return data.at <= 0 ? localize('ac_fielddictionary_058') : data.at.toString();
    case 'app':
      return data.app;
    case 'ck':
      return data.ck;
    case 'sig':
      return data.sig;
    case 'v':
      return '3';
    case 'bodyLength':
      return data.body.length.toString();
    case 'selectionLength':
      return Math.max(0, data.ce - data.cs).toString();
    case 'payloadSize':
      return `${data.body.length + data.title.length}`;
    case 'remainChars':
      return Math.max(0, 8192 - (data.body.length + data.title.length)).toString();
    case 'ageMinutes':
      return data.at <= 0 ? localize('ac_continueclient_015') : Math.floor(Date.now() - data.at > 0 ?
        (Date.now() - data.at) / 60000 : 0).toString();
    case 'conflictText':
      return conflictText(data.ck);
    case 'revisionGap':
      return '0';
    case 'tagCount':
      return data.body.split('#').length > 1 ? (data.body.split('#').length - 1).toString() : '0';
    default:
      return '';
  }
}

/** 一条字段的展示行。 */
export function describeValue(data: PayloadData, key: string): string {
  const doc: FieldDoc | undefined = docOf(key);
  if (doc === undefined) {
    return localize('ac_fielddictionary_060', [key]);
  }
  const value: string = valueOfKey(data, key);
  if (value.length === 0) {
    return localize('ac_fielddictionary_061', [doc.label]);
  }
  const unit: string = unitLabel(doc.unit);
  return `${doc.label}：${value}${unit.length > 0 ? unit : ''}`;
}

/** 字典自检。 */
export class DictionaryAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  public summary(): string {
    return this.ok ? localize('ac_fielddictionary_062') : this.findings.join('；');
  }
}

/** 校验字典：键唯一、必填有缺失说明、派生字段不参与编码、覆盖 schema。 */
export function auditDictionary(): DictionaryAudit {
  const audit: DictionaryAudit = new DictionaryAudit();
  const keys: string[] = [];
  FIELD_DOCS.forEach((doc: FieldDoc): void => {
    if (keys.indexOf(doc.key) >= 0) {
      audit.findings.push(localize('ac_fielddictionary_063', [doc.key]));
    }
    keys.push(doc.key);
    if (doc.label.length === 0) {
      audit.findings.push(localize('ac_fielddictionary_064', [doc.key]));
    }
    if (doc.required && doc.missingHint.length === 0) {
      audit.findings.push(localize('ac_fielddictionary_065', [doc.key]));
    }
    if (doc.maxLength < 0) {
      audit.findings.push(localize('ac_fielddictionary_066', [doc.key]));
    }
  });
  missingSchemaKeys().forEach((key: string): void => {
    audit.findings.push(localize('ac_fielddictionary_067', [key]));
  });
  if (requiredDocs().length === 0) {
    audit.findings.push(localize('ac_fielddictionary_068'));
  }
  audit.ok = audit.findings.length === 0;
  return audit;
}

/** 字典摘要行。 */
export function dictionaryLines(): string[] {
  return FIELD_DOCS.map((doc: FieldDoc): string => doc.text());
}

/** 用途分布行。 */
export function roleLines(): string[] {
  const roles: FieldRole[] = [FieldRole.IDENTITY, FieldRole.CONTENT, FieldRole.POSITION,
    FieldRole.CONTEXT, FieldRole.INTEGRITY, FieldRole.DERIVED];
  return roles.map((role: FieldRole): string =>
    localize('ac_fielddictionary_069', [roleLabel(role), docsOfRole(role).length]));
}
