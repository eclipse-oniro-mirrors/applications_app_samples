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
      return '标识';
    case FieldRole.CONTENT:
      return '内容';
    case FieldRole.POSITION:
      return '位置';
    case FieldRole.CONTEXT:
      return '上下文';
    case FieldRole.INTEGRITY:
      return '完整性';
    default:
      return '派生';
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
      return '字符';
    case FieldUnit.COUNT:
      return '个';
    case FieldUnit.MILLIS:
      return '毫秒';
    default:
      return '';
  }
}

/** 一条字段说明。 */
export class FieldDoc {
  key: string = '';
  label: string = '';
  role: FieldRole = FieldRole.CONTENT;
  unit: FieldUnit = FieldUnit.NONE;
  /** 是否必填。 */
  required: boolean = false;
  /** 长度上限；0 表示不限。 */
  maxLength: number = 0;
  /** 缺失时的行为说明。 */
  missingHint: string = '';
  /** 是否在界面上展示。 */
  visible: boolean = true;

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

  text(): string {
    const limit: string = this.maxLength > 0 ? `≤${this.maxLength}` : '不限';
    return `${this.key} ${this.label}｜${roleLabel(this.role)}｜${limit}｜` +
      `${this.required ? '必填' : '选填'}`;
  }
}

/** 字段字典。派生字段不参与编码，只用于展示与统计。 */
export const FIELD_DOCS: FieldDoc[] = [
  new FieldDoc('doc', '文档标识', FieldRole.IDENTITY, FieldUnit.NONE, true, 64,
    '缺失则整条载荷丢弃'),
  new FieldDoc('rev', '修订号', FieldRole.IDENTITY, FieldUnit.COUNT, true, 12,
    '缺失按 0 处理'),
  new FieldDoc('title', '标题', FieldRole.CONTENT, FieldUnit.CHARS, false, 64,
    '缺失显示为未命名'),
  new FieldDoc('body', '正文', FieldRole.CONTENT, FieldUnit.CHARS, false, 4096,
    '缺失按空正文处理'),
  new FieldDoc('cs', '选区起点', FieldRole.POSITION, FieldUnit.COUNT, false, 12,
    '缺失按 0 处理'),
  new FieldDoc('ce', '选区终点', FieldRole.POSITION, FieldUnit.COUNT, false, 12,
    '缺失按 0 处理'),
  new FieldDoc('dev', '来源设备', FieldRole.CONTEXT, FieldUnit.NONE, false, 64,
    '缺失显示为 unknown'),
  new FieldDoc('at', '写入时间', FieldRole.CONTEXT, FieldUnit.MILLIS, false, 20,
    '缺失显示为未记录时间'),
  new FieldDoc('app', '应用版本', FieldRole.CONTEXT, FieldUnit.NONE, false, 32,
    '缺失按空串处理'),
  new FieldDoc('ck', '冲突标记', FieldRole.INTEGRITY, FieldUnit.NONE, false, 16,
    '缺失按 none 处理'),
  new FieldDoc('sig', '校验摘要', FieldRole.INTEGRITY, FieldUnit.NONE, false, 32,
    '缺失表示未校验'),
  new FieldDoc('v', '载荷版本', FieldRole.IDENTITY, FieldUnit.COUNT, true, 4,
    '缺失视为不可解析', false),
  new FieldDoc('bodyLength', '正文长度', FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    '由正文计算', true),
  new FieldDoc('selectionLength', '选区长度', FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    '由选区计算', true),
  new FieldDoc('payloadSize', '编码体积', FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    '由编码结果计算', true),
  new FieldDoc('remainChars', '剩余容量', FieldRole.DERIVED, FieldUnit.CHARS, false, 0,
    '由上限与编码体积计算', true),
  new FieldDoc('ageMinutes', '写入时长', FieldRole.DERIVED, FieldUnit.MILLIS, false, 0,
    '由写入时间计算', true),
  new FieldDoc('conflictText', '冲突说明', FieldRole.DERIVED, FieldUnit.NONE, false, 0,
    '由冲突标记映射', true),
  new FieldDoc('revisionGap', '修订差距', FieldRole.DERIVED, FieldUnit.COUNT, false, 0,
    '与对端修订号比较得出', true),
  new FieldDoc('tagCount', '标签数量', FieldRole.DERIVED, FieldUnit.COUNT, false, 0,
    '由正文中的标签计算', false)
];

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
      return '无冲突';
    case 'remoteNewer':
      return '对端更新';
    case 'localNewer':
      return '本机更新';
    case 'bothChanged':
      return '两端都改过';
    default:
      return '无法判断';
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
      return data.at <= 0 ? '未记录时间' : data.at.toString();
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
      return data.at <= 0 ? '未知' : Math.floor(Date.now() - data.at > 0 ?
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
    return `${key}：未定义字段`;
  }
  const value: string = valueOfKey(data, key);
  if (value.length === 0) {
    return `${doc.label}：（空）`;
  }
  const unit: string = unitLabel(doc.unit);
  return `${doc.label}：${value}${unit.length > 0 ? unit : ''}`;
}

/** 字典自检。 */
export class DictionaryAudit {
  ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '字段字典自洽' : this.findings.join('；');
  }
}

/** 校验字典：键唯一、必填有缺失说明、派生字段不参与编码、覆盖 schema。 */
export function auditDictionary(): DictionaryAudit {
  const audit: DictionaryAudit = new DictionaryAudit();
  const keys: string[] = [];
  FIELD_DOCS.forEach((doc: FieldDoc): void => {
    if (keys.indexOf(doc.key) >= 0) {
      audit.findings.push(`字段重复：${doc.key}`);
    }
    keys.push(doc.key);
    if (doc.label.length === 0) {
      audit.findings.push(`缺少标签：${doc.key}`);
    }
    if (doc.required && doc.missingHint.length === 0) {
      audit.findings.push(`必填字段缺少缺失说明：${doc.key}`);
    }
    if (doc.maxLength < 0) {
      audit.findings.push(`长度上限为负：${doc.key}`);
    }
  });
  missingSchemaKeys().forEach((key: string): void => {
    audit.findings.push(`字典缺少字段：${key}`);
  });
  if (requiredDocs().length === 0) {
    audit.findings.push('缺少必填字段说明');
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
    `${roleLabel(role)}：${docsOfRole(role).length} 个字段`);
}
