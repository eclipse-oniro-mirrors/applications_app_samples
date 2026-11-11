/**
 * 业务负载目录：把「读一段样本文件」升级为可校验的业务数据。
 *
 * 每种负载都有自己的解析与完整性判据：纯文本看行数与非空，笔记列表看条目、标题和正文，
 * 图片索引看条目与尺寸字段，表单草稿看必填字段与步骤。校验只依赖已读入的字节，
 * 不发起系统调用，因此同一份数据在主机与真机上得到相同结论。
 */

import { util } from '@kit.ArkTS';

/** 负载类型。 */
export enum WorkloadKind {
  TEXT = 'text',
  NOTE_LIST = 'noteList',
  IMAGE_INDEX = 'imageIndex',
  FORM_DRAFT = 'formDraft'
}

/** 类型标签。 */
export function workloadKindLabel(kind: WorkloadKind): string {
  switch (kind) {
    case WorkloadKind.TEXT:
      return '文本';
    case WorkloadKind.NOTE_LIST:
      return '笔记列表';
    case WorkloadKind.IMAGE_INDEX:
      return '图片索引';
    default:
      return '表单草稿';
  }
}

/** 校验结论。 */
export class WorkloadCheck {
  public ok: boolean = false;
  public headline: string = '';
  public facts: string[] = [];
  /** 解析出的业务条目数；不适用时为 -1。 */
  public entryCount: number = -1;

  text(): string {
    return `${this.ok ? '✓' : '✗'} ${this.headline}${this.entryCount >= 0 ? `（${this.entryCount} 条）` : ''}`;
  }
}

/** 一个负载定义。 */
export class WorkloadSpec {
  public id: string = '';
  public label: string = '';
  public kind: WorkloadKind = WorkloadKind.TEXT;
  public rawFile: string = '';
  public description: string = '';
  /** 低于该字节数视为样本缺失。 */
  public minimumBytes: number = 1;

  constructor(id: string = '', label: string = '', kind: WorkloadKind = WorkloadKind.TEXT,
    rawFile: string = '', description: string = '', minimumBytes: number = 1) {
    this.id = id;
    this.label = label;
    this.kind = kind;
    this.rawFile = rawFile;
    this.description = description;
    this.minimumBytes = minimumBytes;
  }

  text(): string {
    return `${this.label}｜${workloadKindLabel(this.kind)}｜${this.rawFile}`;
  }
}

/** 解码为文本；非法 UTF-8 时返回空串，由调用方判为失败。 */
export function decodeText(bytes: Uint8Array): string {
  if (bytes.length === 0) {
    return '';
  }
  try {
    const decoder = util.TextDecoder.create('utf-8');
    return decoder.decodeToString(bytes);
  } catch (error) {
    return '';
  }
}

/** 统计非空行。 */
export function nonEmptyLines(text: string): number {
  let count: number = 0;
  text.split('\n').forEach((line: string): void => {
    if (line.trim().length > 0 && line.trim().charAt(0) !== '#') {
      count += 1;
    }
  });
  return count;
}

/** 一行的关键值。 */
export class KeyValueLine {
  public key: string = '';
  public value: string = '';

  constructor(key: string = '', value: string = '') {
    this.key = key;
    this.value = value;
  }
}

/** 解析 `key=value` 形态的清单，忽略注释与空行。 */
export function parseKeyValueLines(text: string): KeyValueLine[] {
  const result: KeyValueLine[] = [];
  text.split('\n').forEach((line: string): void => {
    const trimmed: string = line.trim();
    if (trimmed.length === 0 || trimmed.charAt(0) === '#') {
      return;
    }
    const index: number = trimmed.indexOf('=');
    if (index <= 0) {
      return;
    }
    result.push(new KeyValueLine(trimmed.slice(0, index).trim(), trimmed.slice(index + 1).trim()));
  });
  return result;
}

/** 以 `|` 分隔的表格行。 */
export function parseTableRows(text: string): string[][] {
  const rows: string[][] = [];
  text.split('\n').forEach((line: string): void => {
    const trimmed: string = line.trim();
    if (trimmed.length === 0 || trimmed.charAt(0) === '#') {
      return;
    }
    rows.push(trimmed.split('|').map((cell: string): string => cell.trim()));
  });
  return rows;
}

/** 校验文本负载：至少一行有效内容。 */
export function verifyText(bytes: Uint8Array, spec: WorkloadSpec): WorkloadCheck {
  const check: WorkloadCheck = new WorkloadCheck();
  if (bytes.length < spec.minimumBytes) {
    check.headline = `样本不足 ${spec.minimumBytes} 字节`;
    check.facts.push(`实际 ${bytes.length} 字节`);
    return check;
  }
  const text: string = decodeText(bytes);
  if (text.length === 0) {
    check.headline = '文本解码失败';
    return check;
  }
  const lines: number = nonEmptyLines(text);
  check.entryCount = lines;
  check.ok = lines > 0;
  check.headline = check.ok ? '文本内容可读' : '没有任何有效行';
  check.facts.push(`${bytes.length} 字节`);
  check.facts.push(`${lines} 行有效内容`);
  check.facts.push(`首行：${firstLine(text)}`);
  return check;
}

/** 首行摘要。 */
export function firstLine(text: string): string {
  const lines: string[] = text.split('\n');
  for (let index: number = 0; index < lines.length; index++) {
    const trimmed: string = lines[index].trim();
    if (trimmed.length > 0 && trimmed.charAt(0) !== '#') {
      return trimmed.slice(0, 40);
    }
  }
  return '（空）';
}

/** 校验笔记列表：每行 `标题|正文|更新时间`，条目数与字段数都要对得上。 */
export function verifyNoteList(bytes: Uint8Array, spec: WorkloadSpec): WorkloadCheck {
  const check: WorkloadCheck = new WorkloadCheck();
  if (bytes.length < spec.minimumBytes) {
    check.headline = '笔记样本不足';
    return check;
  }
  const rows: string[][] = parseTableRows(decodeText(bytes));
  let malformed: number = 0;
  let emptyBody: number = 0;
  rows.forEach((row: string[]): void => {
    if (row.length !== 3) {
      malformed += 1;
      return;
    }
    if (row[0].length === 0 || row[1].length === 0) {
      emptyBody += 1;
    }
  });
  check.entryCount = rows.length;
  check.ok = rows.length > 0 && malformed === 0 && emptyBody === 0;
  check.headline = check.ok ? '笔记列表结构完整' : `笔记列表有问题（${malformed} 行字段异常，${emptyBody} 行内容为空）`;
  check.facts.push(`${rows.length} 条笔记`);
  check.facts.push(`${bytes.length} 字节`);
  if (rows.length > 0) {
    check.facts.push(`首条：${rows[0][0].slice(0, 24)}`);
  }
  return check;
}

/** 校验图片索引：`名称|宽度|高度`，尺寸必须为正整数。 */
export function verifyImageIndex(bytes: Uint8Array, spec: WorkloadSpec): WorkloadCheck {
  const check: WorkloadCheck = new WorkloadCheck();
  const rows: string[][] = parseTableRows(decodeText(bytes));
  let badSize: number = 0;
  let totalPixels: number = 0;
  rows.forEach((row: string[]): void => {
    if (row.length !== 3) {
      badSize += 1;
      return;
    }
    const width: number = Number(row[1]);
    const height: number = Number(row[2]);
    if (!Number.isInteger(width) || !Number.isInteger(height) || width <= 0 || height <= 0) {
      badSize += 1;
      return;
    }
    totalPixels += width * height;
  });
  check.entryCount = rows.length;
  check.ok = rows.length > 0 && badSize === 0;
  check.headline = check.ok ? '图片索引可解析' : `${badSize} 条索引尺寸非法`;
  check.facts.push(`${rows.length} 条索引`);
  check.facts.push(`合计 ${totalPixels} 像素`);
  return check;
}

/** 校验表单草稿：必需的 `key=value` 都存在且非空。 */
export function verifyFormDraft(bytes: Uint8Array, spec: WorkloadSpec): WorkloadCheck {
  const check: WorkloadCheck = new WorkloadCheck();
  const pairs: KeyValueLine[] = parseKeyValueLines(decodeText(bytes));
  const required: string[] = ['step', 'name', 'phone', 'address', 'note'];
  const found: string[] = [];
  pairs.forEach((pair: KeyValueLine): void => {
    if (required.indexOf(pair.key) >= 0 && pair.value.length > 0) {
      found.push(pair.key);
    }
  });
  const missing: string[] = required.filter((key: string): boolean => found.indexOf(key) < 0);
  check.entryCount = found.length;
  check.ok = missing.length === 0;
  check.headline = check.ok ? '表单草稿字段齐全' : `缺少字段：${missing.join('、')}`;
  check.facts.push(`已填 ${found.length}/${required.length} 个必填字段`);
  if (found.length > 0) {
    check.facts.push(`当前步骤：${valueOf(pairs, 'step')}`);
  }
  return check;
}

/** 取某个键的值。 */
export function valueOf(pairs: KeyValueLine[], key: string): string {
  const hit: KeyValueLine | undefined = pairs.find((pair: KeyValueLine): boolean => pair.key === key);
  return hit === undefined ? '' : hit.value;
}

/** 按类型分派校验。 */
export function verifyWorkload(spec: WorkloadSpec, bytes: Uint8Array): WorkloadCheck {
  switch (spec.kind) {
    case WorkloadKind.NOTE_LIST:
      return verifyNoteList(bytes, spec);
    case WorkloadKind.IMAGE_INDEX:
      return verifyImageIndex(bytes, spec);
    case WorkloadKind.FORM_DRAFT:
      return verifyFormDraft(bytes, spec);
    default:
      return verifyText(bytes, spec);
  }
}

/** 负载目录。 */
export const WORKLOADS: WorkloadSpec[] = [
  new WorkloadSpec('W-TEXT', '示例文本', WorkloadKind.TEXT, 'sample.txt',
    '最基础的单文件负载，用于对照既有流程。', 1),
  new WorkloadSpec('W-NOTES', '笔记列表', WorkloadKind.NOTE_LIST, 'workloads/notes_list.txt',
    '多行业务数据，覆盖字段解析与空内容判定。', 32),
  new WorkloadSpec('W-IMAGES', '图片索引', WorkloadKind.IMAGE_INDEX, 'workloads/image_index.txt',
    '尺寸字段参与校验，能发现截断与非法数值。', 32),
  new WorkloadSpec('W-FORM', '表单草稿', WorkloadKind.FORM_DRAFT, 'workloads/form_draft.txt',
    '跨字段完整性，恢复后需要重新校验。', 32)
];

/** 按编号查找负载。 */
export function workloadOf(id: string): WorkloadSpec | undefined {
  return WORKLOADS.find((spec: WorkloadSpec): boolean => spec.id === id);
}

/** 目录摘要行。 */
export function workloadLines(): string[] {
  return WORKLOADS.map((spec: WorkloadSpec): string => `${spec.id}｜${spec.text()}`);
}

/** 目录自检：编号唯一、样本路径非空、阈值非负。 */
export class WorkloadAudit {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '负载目录自洽' : this.findings.join('；');
  }
}

/** 校验目录。 */
export function auditWorkloads(): WorkloadAudit {
  const audit: WorkloadAudit = new WorkloadAudit();
  const seen: string[] = [];
  WORKLOADS.forEach((spec: WorkloadSpec): void => {
    if (seen.indexOf(spec.id) >= 0) {
      audit.findings.push(`负载编号重复：${spec.id}`);
    }
    seen.push(spec.id);
    if (spec.rawFile.length === 0) {
      audit.findings.push(`缺少样本路径：${spec.id}`);
    }
    if (spec.minimumBytes < 0) {
      audit.findings.push(`字节阈值非法：${spec.id}`);
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}
