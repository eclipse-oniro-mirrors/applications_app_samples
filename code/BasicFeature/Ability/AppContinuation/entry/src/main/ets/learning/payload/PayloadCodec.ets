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

import { localize } from '../../common/LocaleStrings';
/**
 * 接续载荷的编解码。
 *
 * 编码结果是一个扁平字符串：`v=3&doc=...&body=...`。选择这种格式而不是 JSON 是
 * 因为它可截断、可逐字段校验、出错时能指出具体字段，而且不依赖运行时的解析器行为。
 */

import {
  BODY_LIMIT, PAYLOAD_FIELDS, PAYLOAD_LIMIT, PAYLOAD_VERSION, PAIR_SEPARATOR, PayloadField,
  PayloadKind, VALUE_SEPARATOR, escapeValue, unescapeValue
} from './PayloadSchema';

/** 解码后的载荷。 */
export class PayloadData {
  public doc: string = '';
  public rev: number = 0;
  public title: string = '';
  public body: string = '';
  public cs: number = 0;
  public ce: number = 0;
  public dev: string = '';
  public at: number = 0;
  public app: string = '';
  public ck: string = 'none';
  public sig: string = '';

  constructor(doc: string = '', rev: number = 0) {
    this.doc = doc;
    this.rev = rev;
  }

  public clone(): PayloadData {
    const copy: PayloadData = new PayloadData(this.doc, this.rev);
    copy.title = this.title;
    copy.body = this.body;
    copy.cs = this.cs;
    copy.ce = this.ce;
    copy.dev = this.dev;
    copy.at = this.at;
    copy.app = this.app;
    copy.ck = this.ck;
    copy.sig = this.sig;
    return copy;
  }

  /** 选区是否合法：终点不小于起点，且不越界。 */
  public selectionValid(): boolean {
    return this.cs >= 0 && this.ce >= this.cs && this.ce <= this.body.length;
  }

  /** 正文是否为空。 */
  public bodyEmpty(): boolean {
    return this.body.trim().length === 0;
  }

  /** 一段可读摘要。 */
  public summary(): string {
    const bodyText: string = this.bodyEmpty() ? localize('ac_payloadcodec_001') : localize('ac_payloadcodec_002', [this.body.length]);
    return localize('ac_payloadcodec_003', [this.title, this.rev, bodyText, this.cs, this.ce]);
  }
}

/** 解码问题。 */
export class DecodeIssue {
  public field: string = '';
  public reason: string = '';

  constructor(field: string = '', reason: string = '') {
    this.field = field;
    this.reason = reason;
  }

  public text(): string {
    return `${this.field}：${this.reason}`;
  }
}

/** 解码结果。 */
export class DecodeResult {
  public data: PayloadData | undefined = undefined;
  /** 原始版本；无法识别为 -1。 */
  public version: number = -1;
  /** 是否需要迁移。 */
  public migrated: boolean = false;
  public issues: DecodeIssue[] = [];
  public rawLength: number = 0;

  public ok(): boolean {
    return this.data !== undefined;
  }

  /** 只有告警、没有整体失败。 */
  public warnOnly(): boolean {
    return this.data !== undefined && this.issues.length > 0;
  }
}

/** 统计 UTF-8 字节数，用于估算载荷体积。 */
export function utf8Length(text: string): number {
  let bytes: number = 0;
  for (let index = 0; index < text.length; index++) {
    const code: number = text.charCodeAt(index);
    if (code < 0x80) {
      bytes += 1;
    } else if (code < 0x800) {
      bytes += 2;
    } else if (code >= 0xD800 && code <= 0xDBFF) {
      bytes += 4;
      index++;
    } else {
      bytes += 3;
    }
  }
  return bytes;
}

/** FNV-1a 摘要，取 8 位十六进制。只用于本地一致性判断，不作安全用途。 */
export function digestOf(text: string): string {
  let hash: number = 0x811c9dc5;
  for (let index = 0; index < text.length; index++) {
    hash = hash ^ text.charCodeAt(index);
    hash = (hash * 0x01000193) % 0x100000000;
  }
  return (hash >>> 0).toString(16).padStart(8, '0');
}

/** 取字段的字符串形态。 */
function valueOf(data: PayloadData, name: string): string {
  switch (name) {
    case 'v':
      return PAYLOAD_VERSION.toString();
    case 'doc':
      return data.doc;
    case 'rev':
      return Math.max(0, Math.round(data.rev)).toString();
    case 'title':
      return data.title;
    case 'body':
      return data.body;
    case 'cs':
      return Math.max(0, Math.round(data.cs)).toString();
    case 'ce':
      return Math.max(0, Math.round(data.ce)).toString();
    case 'dev':
      return data.dev;
    case 'at':
      return Math.max(0, Math.round(data.at)).toString();
    case 'app':
      return data.app;
    case 'ck':
      return data.ck;
    case 'sig':
      return data.sig;
    default:
      return '';
  }
}

/** 编码为字符串。字段顺序与字段目录一致。 */
export function encodePayload(data: PayloadData): string {
  const pairs: string[] = [];
  PAYLOAD_FIELDS.forEach((field: PayloadField): void => {
    const value: string = field.coerce(valueOf(data, field.name));
    if (value.length === 0 && !field.required) {
      return;
    }
    pairs.push(`${field.name}${VALUE_SEPARATOR}${escapeValue(value)}`);
  });
  return pairs.join(PAIR_SEPARATOR);
}

/** 解析成键值表。重复键保留最后一次。 */
function parsePairs(raw: string): Map<string, string> {
  const map: Map<string, string> = new Map<string, string>();
  raw.split(PAIR_SEPARATOR).forEach((pair: string): void => {
    if (pair.length === 0) {
      return;
    }
    const index: number = pair.indexOf(VALUE_SEPARATOR);
    if (index <= 0) {
      return;
    }
    const key: string = pair.slice(0, index);
    const value: string = unescapeValue(pair.slice(index + 1));
    map.set(key, value);
  });
  return map;
}

/** 按字段表把键值表还原为载荷。 */
function buildData(map: Map<string, string>, issues: DecodeIssue[]): PayloadData {
  const data: PayloadData = new PayloadData();
  PAYLOAD_FIELDS.forEach((field: PayloadField): void => {
    const raw: string | undefined = map.get(field.name);
    const value: string = raw === undefined ? '' : raw;
    if (raw === undefined && field.required) {
      issues.push(new DecodeIssue(field.name, localize('ac_payloadcodec_004')));
    }
    if (raw !== undefined && !field.accepts(value)) {
      issues.push(new DecodeIssue(field.name, localize('ac_payloadcodec_005')));
    }
    const safe: string = field.coerce(value);
    switch (field.name) {
      case 'doc':
        data.doc = safe;
        break;
      case 'rev':
        data.rev = Number(safe);
        break;
      case 'title':
        data.title = safe;
        break;
      case 'body':
        data.body = safe;
        break;
      case 'cs':
        data.cs = Number(safe);
        break;
      case 'ce':
        data.ce = Number(safe);
        break;
      case 'dev':
        data.dev = safe;
        break;
      case 'at':
        data.at = Number(safe);
        break;
      case 'app':
        data.app = safe;
        break;
      case 'ck':
        data.ck = safe;
        break;
      case 'sig':
        data.sig = safe;
        break;
      default:
        break;
    }
  });
  return data;
}

/** 解码。空载荷、超长载荷、未知版本都返回不可用结果。 */
export function decodePayload(raw: string): DecodeResult {
  const result: DecodeResult = new DecodeResult();
  result.rawLength = raw.length;
  if (raw.length === 0) {
    result.issues.push(new DecodeIssue('raw', localize('ac_payloadcodec_006')));
    return result;
  }
  if (raw.length > PAYLOAD_LIMIT) {
    result.issues.push(new DecodeIssue('raw', localize('ac_payloadcodec_007')));
    return result;
  }
  const map: Map<string, string> = parsePairs(raw);
  const versionText: string | undefined = map.get('v');
  if (versionText === undefined) {
    result.issues.push(new DecodeIssue('v', localize('ac_payloadcodec_008')));
    return result;
  }
  const version: number = Number(versionText);
  if (!Number.isFinite(version) || version < 1 || version > PAYLOAD_VERSION) {
    result.issues.push(new DecodeIssue('v', localize('ac_payloadcodec_009', [versionText])));
    return result;
  }
  result.version = version;
  result.migrated = version < PAYLOAD_VERSION;
  const data: PayloadData = buildData(map, result.issues);
  if (data.doc.length === 0) {
    result.issues.push(new DecodeIssue('doc', localize('ac_payloadcodec_010')));
    return result;
  }
  result.data = data;
  return result;
}

/** 截断结果。 */
export class FitResult {
  public content: string = '';
  /** 是否发生了截断。 */
  public truncated: boolean = false;
  /** 被截掉的字符数。 */
  public droppedChars: number = 0;

  public caption(): string {
    return this.truncated ? localize('ac_payloadcodec_011', [this.droppedChars]) : localize('ac_payloadcodec_012');
  }
}

/** 把载荷压到上限内：优先截断正文，正文已空则整体截断。 */
export function fitWithinLimit(data: PayloadData, limit: number = PAYLOAD_LIMIT): FitResult {
  const result: FitResult = new FitResult();
  let encoded: string = encodePayload(data);
  if (encoded.length <= limit) {
    result.content = encoded;
    return result;
  }
  const working: PayloadData = data.clone();
  const bodyLength: number = working.body.length;
  const excess: number = encoded.length - limit;
  const keep: number = Math.max(0, bodyLength - excess - 8);
  working.body = working.body.slice(0, Math.min(BODY_LIMIT, keep));
  working.ce = Math.min(working.ce, working.body.length);
  working.cs = Math.min(working.cs, working.ce);
  encoded = encodePayload(working);
  result.truncated = true;
  result.droppedChars = bodyLength - working.body.length;
  result.content = encoded.length <= limit ? encoded : encoded.slice(0, limit);
  return result;
}

/** 字段差异。 */
export class FieldDelta {
  public field: string = '';
  public before: string = '';
  public after: string = '';

  constructor(field: string = '', before: string = '', after: string = '') {
    this.field = field;
    this.before = before;
    this.after = after;
  }

  public text(): string {
    return `${this.field}: ${this.before} -> ${this.after}`;
  }
}

/** 载荷差异。 */
export class PayloadDiff {
  public deltas: FieldDelta[] = [];

  /** 是否有变化。 */
  public changed(): boolean {
    return this.deltas.length > 0;
  }

  /** 变化字段名。 */
  public fields(): string[] {
    return this.deltas.map((delta: FieldDelta): string => delta.field);
  }

  /** 是否只改了光标位置。 */
  public cursorOnly(): boolean {
    return this.deltas.length > 0 && this.deltas.every((delta: FieldDelta): boolean =>
      delta.field === 'cs' || delta.field === 'ce');
  }

  /** 摘要文本。 */
  public summary(): string {
    if (!this.changed()) {
      return localize('ac_payloadcodec_013');
    }
    return localize('ac_payloadcodec_014', [this.deltas.length, this.fields().join(',')]);
  }
}

/** 逐字段比较两份载荷。 */
export function diffPayloads(left: PayloadData, right: PayloadData): PayloadDiff {
  const diff: PayloadDiff = new PayloadDiff();
  PAYLOAD_FIELDS.forEach((field: PayloadField): void => {
    if (field.name === 'v' || field.name === 'sig') {
      return;
    }
    const before: string = valueOf(left, field.name);
    const after: string = valueOf(right, field.name);
    if (before !== after) {
      diff.deltas.push(new FieldDelta(field.name, before, after));
    }
  });
  return diff;
}

/** 体积估算结论。 */
export class SizeReport {
  public chars: number = 0;
  public bytes: number = 0;
  public limit: number = PAYLOAD_LIMIT;

  /** 占用比例，百分比一位小数。 */
  public ratio(): number {
    if (this.limit <= 0) {
      return 0;
    }
    return Math.round((this.chars / this.limit) * 1000) / 10;
  }

  /** 是否接近上限。 */
  public nearLimit(): boolean {
    return this.ratio() >= 80;
  }

  public text(): string {
    return localize('ac_payloadcodec_015', [this.chars, this.limit, this.ratio(), this.bytes]);
  }
}

/** 计算载荷体积。 */
export function sizeOf(data: PayloadData): SizeReport {
  const report: SizeReport = new SizeReport();
  const encoded: string = encodePayload(data);
  report.chars = encoded.length;
  report.bytes = utf8Length(encoded);
  return report;
}

/** 校验摘要是否与内容一致。 */
export function matchesDigest(data: PayloadData): boolean {
  if (data.sig.length === 0) {
    return false;
  }
  return data.sig === digestOf(`${data.doc}:${data.rev}:${data.body}`);
}

/** 重新计算并写入校验摘要。 */
export function sealPayload(data: PayloadData): PayloadData {
  const copy: PayloadData = data.clone();
  copy.sig = digestOf(`${copy.doc}:${copy.rev}:${copy.body}`);
  return copy;
}

/** 字段形态与运行时取值是否一致，供自检使用。 */
export function auditEncoding(): string[] {
  const findings: string[] = [];
  PAYLOAD_FIELDS.forEach((field: PayloadField): void => {
    const probe: PayloadData = sealPayload(new PayloadData('audit-doc', 1));
    const encoded: string = encodePayload(probe);
    if (encoded.indexOf(`${field.name}${VALUE_SEPARATOR}`) < 0 && field.required) {
      findings.push(localize('ac_payloadcodec_016', [field.name]));
    }
    if (field.kind === PayloadKind.MULTILINE && field.maxLength > BODY_LIMIT) {
      findings.push(localize('ac_payloadcodec_017', [field.name]));
    }
  });
  return findings;
}
