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
 * 业务负载目录：把「读一段样本文件」升级为可校验的业务数据。
 *
 * 每种负载都有自己的解析与完整性判据：纯文本看行数与非空，笔记列表看条目、标题和正文，
 * 图片索引看条目与尺寸字段，表单草稿看必填字段与步骤。校验只依赖已读入的字节，
 * 不发起系统调用，因此同一份数据在主机与真机上得到相同结论。
 */

import { util } from '@kit.ArkTS';
import { message } from './TextMessages';

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
      return message('ap_dynamic_text');
    case WorkloadKind.NOTE_LIST:
      return message('ap_ui_note_list');
    case WorkloadKind.IMAGE_INDEX:
      return message('ap_ui_image_index');
    default:
      return message('ap_ui_form_draft');
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
    const detail: string = this.entryCount >= 0 ? message('report_workload_named',
      [this.headline, message('ap_dynamic_entries_321', [this.entryCount])]) : this.headline;
    return message(this.ok ? 'ap_dynamic_status_marker_322' : 'ap_dynamic_status_marker_323', [detail]);
  }
}

/** 一个负载定义。 */
export class WorkloadSpec {
  public id: string = '';
  private labelKey: string = '';
  public kind: WorkloadKind = WorkloadKind.TEXT;
  public rawFile: string = '';
  private descriptionKey: string = '';
  /** 低于该字节数视为样本缺失。 */
  public minimumBytes: number = 1;

  public get label(): string {
    return message(this.labelKey);
  }

  public set label(value: string) {
    this.labelKey = value;
  }

  public get description(): string {
    return message(this.descriptionKey);
  }

  public set description(value: string) {
    this.descriptionKey = value;
  }

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
    check.headline = message('ap_dynamic_sample_smaller_than_bytes', [spec.minimumBytes]);
    check.facts.push(message('ap_dynamic_actual_bytes', [bytes.length]));
    return check;
  }
  const text: string = decodeText(bytes);
  if (text.length === 0) {
    check.headline = message('ap_dynamic_text_decoding_failed');
    return check;
  }
  const lines: number = nonEmptyLines(text);
  check.entryCount = lines;
  check.ok = lines > 0;
  check.headline = check.ok ? message('ap_dynamic_text_is_readable') : message('ap_dynamic_no_valid_lines');
  check.facts.push(message('ap_dynamic_bytes_93', [bytes.length]));
  check.facts.push(message('ap_dynamic_nonempty_lines', [lines]));
  check.facts.push(message('ap_dynamic_first_line', [firstLine(text)]));
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
  return message('ap_dynamic_empty');
}

/** 校验笔记列表：每行 `标题|正文|更新时间`，条目数与字段数都要对得上。 */
export function verifyNoteList(bytes: Uint8Array, spec: WorkloadSpec): WorkloadCheck {
  const check: WorkloadCheck = new WorkloadCheck();
  if (bytes.length < spec.minimumBytes) {
    check.headline = message('ap_dynamic_insufficient_note_sample');
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
  check.headline = check.ok ? message('ap_dynamic_note_list_structure_is_complete') :
    message('ap_dynamic_note_list_issues_malformed_rows_empty_rows', [malformed, emptyBody]);
  check.facts.push(message('ap_dynamic_notes', [rows.length]));
  check.facts.push(message('ap_dynamic_bytes_93', [bytes.length]));
  if (rows.length > 0) {
    check.facts.push(message('ap_dynamic_first_entry', [rows[0][0].slice(0, 24)]));
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
  check.headline = check.ok ? message('ap_dynamic_image_index_is_parseable') :
    message('ap_dynamic_index_entries_have_invalid_dimensions', [badSize]);
  check.facts.push(message('ap_dynamic_index_entries', [rows.length]));
  check.facts.push(message('ap_dynamic_pixels_in_total', [totalPixels]));
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
  check.headline = check.ok ? message('ap_dynamic_form_draft_fields_are_complete') :
    message('ap_dynamic_missing_fields', [missing.join(message('report_field_separator'))]);
  check.facts.push(message('ap_dynamic_required_fields_filled', [found.length, required.length]));
  if (found.length > 0) {
    check.facts.push(message('ap_dynamic_current_step', [valueOf(pairs, 'step')]));
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
  new WorkloadSpec('W-TEXT', 'ap_ui_sample_text', WorkloadKind.TEXT, 'sample.txt',
    'ap_ui_a_basic_single_file_workload_used_as_a_control_for_the_existing_flow', 1),
  new WorkloadSpec('W-NOTES', 'ap_ui_note_list', WorkloadKind.NOTE_LIST, 'workloads/notes_list.txt',
    'ap_ui_multi_line_business_data_covering_field_parsing_and_empty_content_checks', 32),
  new WorkloadSpec('W-IMAGES', 'ap_ui_image_index', WorkloadKind.IMAGE_INDEX, 'workloads/image_index.txt',
    'ap_ui_dimension_checks_detect_truncation_and_invalid_values', 32),
  new WorkloadSpec('W-FORM', 'ap_ui_form_draft', WorkloadKind.FORM_DRAFT, 'workloads/form_draft.txt',
    'ap_ui_cross_field_integrity_must_be_rechecked_after_restoration', 32)
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
    return this.ok ? message('ap_dynamic_workload_catalog_is_consistent') :
      this.findings.join(message('ap_series_reason_separator'));
  }
}

/** 校验目录。 */
export function auditWorkloads(): WorkloadAudit {
  const audit: WorkloadAudit = new WorkloadAudit();
  const seen: string[] = [];
  WORKLOADS.forEach((spec: WorkloadSpec): void => {
    if (seen.indexOf(spec.id) >= 0) {
      audit.findings.push(message('ap_dynamic_duplicate_workload_id', [spec.id]));
    }
    seen.push(spec.id);
    if (spec.rawFile.length === 0) {
      audit.findings.push(message('ap_dynamic_missing_sample_path', [spec.id]));
    }
    if (spec.minimumBytes < 0) {
      audit.findings.push(message('ap_dynamic_invalid_byte_threshold', [spec.id]));
    }
  });
  audit.ok = audit.findings.length === 0;
  return audit;
}
