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
 * 报告导出：把条件分组统计、阶段耗时与缺口说明输出为 Markdown / CSV。
 *
 * 脱敏契约：不写路径、正文、阶段详情、记录备注、凭据或设备序列号。
 * 截断契约：单元格、条件描述、缺口与整篇报告有上限，截断显式标注原始长度。
 * 校验契约：必填段落按稳定 sectionId 校验，不依赖当前语言或正文中的同名文本。
 */

import { ExperimentRecord } from '../ExperimentLedger';
import { message, localize } from '../TextMessages';
import { formatTime } from '../Types';
import { ConditionSource, compareConditions } from './ConditionFingerprint';
import { ConditionGroup, ReportTable, StageTimingRow } from './ReportTable';

/** 导出格式；值属于稳定协议，不翻译。 */
export enum ReportFormat {
  MARKDOWN = 'markdown',
  CSV = 'csv'
}

export function formatLabel(format: ReportFormat): string {
  return message(format === ReportFormat.CSV ? 'report_format_csv' : 'report_format_markdown');
}

/** Stable section identities shared by rendering and required-section validation. */
export const SECTION_CONDITIONS: string = 'conditions';
export const SECTION_STATS: string = 'statistics';
export const SECTION_STAGES: string = 'stages';
export const SECTION_GAPS: string = 'gaps';
export const SECTION_TIME: string = 'generated_at';
const SECTION_COMPARISON: string = 'comparison';

/** CSV 以 BOM 开头，便于表格软件按 UTF-8 识别。 */
export const CSV_BOM: string = '\uFEFF';

const CELL_LIMIT: number = 120;
const CONDITION_LIMIT: number = 240;
const GAP_LIMIT: number = 200;
const REPORT_LIMIT: number = 200000;

const ABSOLUTE_PATH_SOURCE: string =
  /[A-Za-z]:[\\/]|\/data\/|\/storage\/|\/sdcard\/|\/system\/|\/proc\/|\/users\/|\/home\/|file:\/\//.source;
const PARENT_PATH_SOURCE: string = /\.\.\//.source;
const SEGMENT_PATH_SOURCE: string = /(?:[A-Za-z0-9_.-]+\/){2,}[A-Za-z0-9_.-]+/.source;
const PATH_TEST: RegExp =
  new RegExp(`(?:${ABSOLUTE_PATH_SOURCE}|${PARENT_PATH_SOURCE}|${SEGMENT_PATH_SOURCE})`);
const SECRET_TEST: RegExp =
  /(?:serialNumber|serial|udid|imei|oaid|token|password|passwd|secret|authorization|cookie|sn)\s*[:=]\s*\S+/i;
const LONG_DIGITS_TEST: RegExp = /[0-9]{15,}/;
const PATH_REPLACE: RegExp = new RegExp(
  `(?:${ABSOLUTE_PATH_SOURCE}|${SEGMENT_PATH_SOURCE})${/[^\s"'|,;)]*/.source}`, 'g');
const RELATIVE_REPLACE: RegExp = /\.\.\/[^\s"'|,;)]*/g;
const SEGMENT_PATH_REPLACE: RegExp = /(?:[A-Za-z0-9_.-]+\/){2,}[A-Za-z0-9_.-]+/g;
const SECRET_REPLACE: RegExp =
  /(?:serialNumber|serial|udid|imei|oaid|token|password|passwd|secret|authorization|cookie|sn)\s*[:=]\s*[^\s,;|]+/gi;
const LONG_DIGITS_REPLACE: RegExp = /[0-9]{15,}/g;

/** 报告元信息。generatedAt 为 0 时在导出时取当前时间。 */
export class ReportMeta {
  public title: string = message('report_title');
  public generatedAt: number = 0;
  public filterText: string = '';
  public note: string = '';

  constructor(title: string = message('report_title'), generatedAt: number = 0,
    filterText: string = '', note: string = '') {
    this.title = title;
    this.generatedAt = generatedAt;
    this.filterText = filterText;
    this.note = note;
  }
}

export class ReportCheck {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? message('report_check_passed') : this.findings.join(message('report_list_separator'));
  }
}

export class ExportOutcome {
  public ok: boolean = false;
  public format: ReportFormat = ReportFormat.MARKDOWN;
  public text: string = '';
  public check: ReportCheck = new ReportCheck();
}

/** Text and stable identity travel together until rendering has applied the length cap. */
class ReportSection {
  public sectionId: string = '';
  public lines: string[] = [];

  constructor(sectionId: string = '', lines: string[] = []) {
    this.sectionId = sectionId;
    this.lines = lines;
  }
}

class RenderedReport {
  public text: string = '';
  /** Only complete emitted sections participate in required-section validation. */
  public sections: ReportSection[] = [];

  hasSection(sectionId: string): boolean {
    return this.sections.some((section: ReportSection): boolean => section.sectionId === sectionId);
  }
}

function sectionLabel(sectionId: string): string {
  switch (sectionId) {
    case SECTION_CONDITIONS:
      return message('report_section_conditions');
    case SECTION_STATS:
      return message('report_section_stats');
    case SECTION_STAGES:
      return message('report_section_stages');
    case SECTION_GAPS:
      return message('report_section_gaps');
    case SECTION_TIME:
      return message('report_section_time');
    default:
      return message('report_section_comparison');
  }
}

/** 抹掉路径、凭据与长数字序列，并折叠换行。 */
function sanitize(text: string): string {
  let value: string = text.replace(/[\r\n\t]+/g, ' ').trim();
  value = value.replace(PATH_REPLACE, message('report_redacted_path'));
  value = value.replace(RELATIVE_REPLACE, message('report_redacted_path'));
  value = value.replace(SEGMENT_PATH_REPLACE, message('report_redacted_path'));
  value = value.replace(SECRET_REPLACE, message('report_redacted_credentials'));
  value = value.replace(LONG_DIGITS_REPLACE, message('report_redacted_digits'));
  return value;
}

function clip(text: string, limit: number): string {
  const value: string = text.trim();
  if (value.length <= limit) {
    return value;
  }
  return message('report_clipped', [value.slice(0, limit), value.length]);
}

function clean(text: string, limit: number): string {
  return clip(sanitize(text), limit);
}

function markdownCell(text: string, limit: number = CELL_LIMIT): string {
  return clean(localize(text), limit).replace(/\|/g, '\\|');
}

/** Always quote commas and quotes, doubling embedded quotes; every CSV row has five cells. */
function csvCell(text: string, limit: number = CELL_LIMIT): string {
  const value: string = clean(localize(text), limit);
  if (/[",]/.test(value)) {
    return `"${value.replace(/"/g, '""')}"`;
  }
  return value;
}

function csvRow(cells: string[], limit: number = CELL_LIMIT): string {
  return cells.map((item: string): string => csvCell(item, limit)).join(',');
}

function stampOf(meta: ReportMeta): number {
  return Number.isFinite(meta.generatedAt) && meta.generatedAt > 0 ? meta.generatedAt : Date.now();
}

function resolveMeta(meta: ReportMeta): ReportMeta {
  return new ReportMeta(meta.title, stampOf(meta), meta.filterText, meta.note);
}

function display(value: string, fallback: string): string {
  return value.trim().length > 0 ? localize(value.trim()) : fallback;
}

function countSamples(groups: ConditionGroup[]): number {
  return groups.reduce((sum: number, group: ConditionGroup): number => sum + group.samples, 0);
}

function workloadText(group: ConditionGroup): string {
  return group.workloadLabel.length > 0 ?
    message('report_workload_named', [localize(group.workloadLabel), group.workloadId]) :
    display(group.workloadId, message('report_workload_unrecorded'));
}

/** Markdown keeps the historical character cap and explicit original-length notice. */
function renderMarkdownSections(sections: ReportSection[]): RenderedReport {
  const rendered: RenderedReport = new RenderedReport();
  const parts: string[] = [];
  let length: number = 0;
  sections.forEach((section: ReportSection, index: number): void => {
    const part: string = section.lines.join('\n');
    parts.push(part);
    length += (index > 0 ? 1 : 0) + part.length;
    if (section.lines.length > 0 && length <= REPORT_LIMIT) {
      rendered.sections.push(section);
    }
  });
  const text: string = parts.join('\n');
  rendered.text = text.length <= REPORT_LIMIT ? text :
    `${text.slice(0, REPORT_LIMIT)}\n\n> ${message('report_truncated', [REPORT_LIMIT, text.length])}`;
  return rendered;
}

/** Never cut a quoted CSV row in half; the truncation notice is also a five-column row. */
function renderCsvSections(sections: ReportSection[]): RenderedReport {
  const rendered: RenderedReport = new RenderedReport();
  const rows: string[] = [];
  let originalLength: number = CSV_BOM.length;
  sections.forEach((section: ReportSection): void => {
    section.lines.forEach((row: string): void => {
      originalLength += row.length + 1;
    });
  });
  let length: number = CSV_BOM.length;
  let truncated: boolean = false;
  sections.forEach((section: ReportSection): void => {
    let complete: boolean = section.lines.length > 0 && !truncated;
    section.lines.forEach((row: string): void => {
      if (truncated || length + row.length + 1 > REPORT_LIMIT) {
        truncated = true;
        complete = false;
        return;
      }
      rows.push(row);
      length += row.length + 1;
    });
    if (complete) {
      rendered.sections.push(section);
    }
  });
  if (truncated) {
    rows.push(csvRow([message('report_report'), message('report_all'), message('report_truncation'),
      message('report_truncated', [REPORT_LIMIT, originalLength]), ''], GAP_LIMIT));
  }
  rendered.text = `${CSV_BOM}${rows.join('\n')}\n`;
  return rendered;
}

function renderMarkdown(table: ReportTable, meta: ReportMeta): RenderedReport {
  const groups: ConditionGroup[] = table.rows;
  const sections: ReportSection[] = [];
  sections.push(new ReportSection('', [
    `# ${markdownCell(display(meta.title, message('report_title')), 80)}`, '',
    `> ${message('report_redaction_notice')}`, ''
  ]));

  const conditions: ReportSection = new ReportSection(SECTION_CONDITIONS);
  const lines: string[] = conditions.lines;
  lines.push(`## 1. ${sectionLabel(SECTION_CONDITIONS)}`, '');
  lines.push(`- ${message('report_counts', [groups.length, countSamples(groups)])}`);
  if (meta.filterText.trim().length > 0) {
    lines.push(`- ${message('report_filter_line', [clean(localize(meta.filterText), CELL_LIMIT)])}`);
  }
  if (meta.note.trim().length > 0) {
    lines.push(`- ${message('report_note_line', [clean(localize(meta.note), GAP_LIMIT)])}`);
  }
  lines.push('');
  if (groups.length === 0) {
    lines.push(`- ${message('report_no_groups')}`, '');
  }
  groups.forEach((group: ConditionGroup): void => {
    lines.push(`### ${markdownCell(group.labelText(), 40)}`, '');
    lines.push(`- ${message('report_fingerprint_line', [group.fingerprint.length > 0 ?
      group.fingerprint : message('report_fingerprint_missing')])}`);
    lines.push(`- ${message('report_workload_line', [markdownCell(workloadText(group), CELL_LIMIT)])}`);
    lines.push(`- ${message('report_mode_line', [group.modeLabel()])}`);
    lines.push(`- ${message('report_condition_line', [markdownCell(group.conditionText, CONDITION_LIMIT)])}`);
    lines.push(`- ${message('report_comparability_line', [group.unavailable.length > 0 ?
      clean(localize(group.unavailable), GAP_LIMIT) : message('report_comparable_baseline')])}`, '');
  });
  sections.push(conditions);

  const comparison: ReportSection = new ReportSection(SECTION_COMPARISON,
    [`### ${sectionLabel(SECTION_COMPARISON)}`, '']);
  if (groups.length <= 1) {
    comparison.lines.push(`- ${message('report_single_group')}`);
  } else {
    const base: ConditionGroup = groups[0];
    for (let index: number = 1; index < groups.length; index++) {
      const other: ConditionGroup = groups[index];
      comparison.lines.push(`- ${message('report_compare_groups', [markdownCell(base.labelText(), 40),
        markdownCell(other.labelText(), 40), clean(compareConditions(base.fields, other.fields).text(), 300)])}`);
    }
  }
  comparison.lines.push('');
  sections.push(comparison);

  const stats: ReportSection = new ReportSection(SECTION_STATS, [
    `## 2. ${sectionLabel(SECTION_STATS)}`, '', message('report_markdown_stats_header'),
    '| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |'
  ]);
  groups.forEach((group: ConditionGroup, index: number): void => {
    stats.lines.push(`| ${index + 1} | ${markdownCell(group.labelText(), 40)} | ` +
      `${markdownCell(group.workloadId, 60)} | ${group.modeLabel()} | ${group.samples} | ` +
      `${group.validSamples} | ${group.failed} | ${group.p50Text()} | ${group.p90Text()} | ` +
      `${group.meanText()} |`);
  });
  stats.lines.push('', `> ${message('report_stats_notice')}`, '');
  sections.push(stats);

  const stages: ReportSection = new ReportSection(SECTION_STAGES, [
    `## 3. ${sectionLabel(SECTION_STAGES)}`, '', message('report_markdown_stages_header'),
    '| --- | --- | --- | --- | --- |'
  ]);
  groups.forEach((group: ConditionGroup): void => {
    group.stageRows.forEach((row: StageTimingRow): void => {
      stages.lines.push(`| ${markdownCell(group.labelText(), 40)} | ${markdownCell(row.label, 40)} | ` +
        `${row.samples} | ${row.p50Text()} | ${row.meanText()} |`);
    });
  });
  stages.lines.push('', `> ${message('report_stages_notice')}`, '');
  sections.push(stages);

  const gaps: ReportSection = new ReportSection(SECTION_GAPS, [`## 4. ${sectionLabel(SECTION_GAPS)}`, '']);
  let gapCount: number = 0;
  groups.forEach((group: ConditionGroup): void => {
    if (group.gaps.length === 0) {
      return;
    }
    gapCount += group.gaps.length;
    gaps.lines.push(`### ${markdownCell(group.labelText(), 40)}`, '');
    group.gaps.forEach((text: string): void => {
      gaps.lines.push(`- ${clean(localize(text), GAP_LIMIT)}`);
    });
    gaps.lines.push('');
  });
  if (gapCount === 0) {
    gaps.lines.push(`- ${message('report_no_gaps_line')}`, '');
  }
  gaps.lines.push(`- ${message('report_source_notice')}`, '');
  sections.push(gaps);

  const time: ReportSection = new ReportSection(SECTION_TIME, [
    `## 5. ${sectionLabel(SECTION_TIME)}`, '',
    `- ${message('report_generated_line', [formatTime(stampOf(meta))])}`,
    `- ${message('report_version_line', ['report-v1'])}`,
    `- ${message('report_counts', [groups.length, countSamples(groups)])}`
  ]);
  if (groups.length > 0) {
    const first: ConditionGroup = groups[0];
    time.lines.push(`- ${message('report_environment_line', [
      clean(display(first.fields.device, message('report_unrecorded')), 80),
      clean(display(first.fields.osVersion, message('report_unrecorded')), 80),
      clean(display(first.fields.appVersion, message('report_unrecorded')), 40)])}`);
    time.lines.push(`- ${message('report_protocol_line',
      [clean(display(first.fields.protocol, message('report_unrecorded')), 120)])}`);
  } else {
    time.lines.push(`- ${message('report_environment_line', [message('report_unrecorded'),
      message('report_unrecorded'), message('report_unrecorded')])}`);
    time.lines.push(`- ${message('report_protocol_line', [message('report_unrecorded')])}`);
  }
  time.lines.push(`- ${message('report_format_line', [formatLabel(ReportFormat.MARKDOWN)])}`);
  sections.push(time);
  return renderMarkdownSections(sections);
}

/** Markdown rendering without validation; page exports should use exportReport. */
export function buildMarkdown(table: ReportTable, meta: ReportMeta): string {
  return renderMarkdown(table, meta).text;
}

function renderCsv(table: ReportTable, meta: ReportMeta): RenderedReport {
  const groups: ConditionGroup[] = table.rows;
  const sections: ReportSection[] = [];
  sections.push(new ReportSection('', [csvRow([message('report_column_section'), message('report_group'),
    message('report_column_item'), message('report_column_value'), message('report_note')], 40)]));
  sections.push(new ReportSection(SECTION_TIME, [
    csvRow([message('report_report'), message('report_all'), sectionLabel(SECTION_TIME),
      formatTime(stampOf(meta)), message('report_local_time')]),
    csvRow([message('report_report'), message('report_all'), message('report_version'), 'report-v1', '']),
    csvRow([message('report_report'), message('report_all'), message('report_group'), String(groups.length), '']),
    csvRow([message('report_report'), message('report_all'), message('report_record_count'),
      String(countSamples(groups)), '']),
    csvRow([message('report_report'), message('report_all'), message('report_filter_label'),
      localize(meta.filterText), '']),
    csvRow([message('report_report'), message('report_all'), message('report_note'), localize(meta.note), ''],
      GAP_LIMIT)
  ]));

  const base: ConditionGroup | undefined = groups.length > 0 ? groups[0] : undefined;
  groups.forEach((group: ConditionGroup): void => {
    const label: string = group.labelText();
    const comparability: string = group.unavailable.length > 0 ? localize(group.unavailable) :
      message('report_comparable_stats');
    const rowsOfConditions: string[][] = [
      [sectionLabel(SECTION_CONDITIONS), label, message('report_field_fingerprint'),
        group.fingerprint.length > 0 ? group.fingerprint : message('report_unavailable'),
        message('report_no_fingerprint_notice')],
      [sectionLabel(SECTION_CONDITIONS), label, message('report_workload'), workloadText(group), ''],
      [sectionLabel(SECTION_CONDITIONS), label, message('report_field_mode'), group.modeLabel(), ''],
      [sectionLabel(SECTION_CONDITIONS), label, sectionLabel(SECTION_CONDITIONS), group.conditionText, ''],
      [sectionLabel(SECTION_CONDITIONS), label, message('report_comparability'), comparability, '']
    ];
    if (base !== undefined && base !== group) {
      rowsOfConditions.push([sectionLabel(SECTION_CONDITIONS), label,
        message('report_compare_with', [base.labelText()]), compareConditions(base.fields, group.fields).text(), '']);
    }
    sections.push(new ReportSection(SECTION_CONDITIONS, rowsOfConditions.map((cells: string[]): string =>
      csvRow(cells, CONDITION_LIMIT))));

    const rowsOfStats: string[][] = [
      [sectionLabel(SECTION_STATS), label, message('report_samples'), String(group.samples), ''],
      [sectionLabel(SECTION_STATS), label, message('report_valid_samples'), String(group.validSamples), ''],
      [sectionLabel(SECTION_STATS), label, message('report_failed'), String(group.failed), ''],
      [sectionLabel(SECTION_STATS), label, message('report_p50'), group.p50Text(), message('report_stage_total')],
      [sectionLabel(SECTION_STATS), label, message('report_p90'), group.p90Text(), message('report_stage_total')],
      [sectionLabel(SECTION_STATS), label, message('report_mean'), group.meanText(), message('report_stage_total')]
    ];
    sections.push(new ReportSection(SECTION_STATS, rowsOfStats.map((cells: string[]): string => csvRow(cells))));

    const stages: ReportSection = new ReportSection(SECTION_STAGES);
    group.stageRows.forEach((row: StageTimingRow): void => {
      stages.lines.push(csvRow([sectionLabel(SECTION_STAGES), label, localize(row.label),
        message('report_p50_value', [row.p50Text()]),
        message('report_stage_stats', [row.samples, row.meanText()])], GAP_LIMIT));
    });
    sections.push(stages);

    const gaps: ReportSection = new ReportSection(SECTION_GAPS);
    group.gaps.forEach((text: string, index: number): void => {
      gaps.lines.push(csvRow([sectionLabel(SECTION_GAPS), label, message('report_gap_number', [index + 1]),
        localize(text), ''], GAP_LIMIT));
    });
    sections.push(gaps);
  });

  const gaps: ReportSection = new ReportSection(SECTION_GAPS);
  if (groups.every((group: ConditionGroup): boolean => group.gaps.length === 0)) {
    gaps.lines.push(csvRow([sectionLabel(SECTION_GAPS), message('report_all'), message('report_no_gaps'),
      message('report_all_samples_complete'), ''], GAP_LIMIT));
  }
  gaps.lines.push(csvRow([sectionLabel(SECTION_GAPS), message('report_all'), message('report_source'),
    message('report_local_ledger'), message('report_reclaim_unobservable')], GAP_LIMIT));
  sections.push(gaps);
  return renderCsvSections(sections);
}

/** CSV rendering: fixed five-column rows and a UTF-8 BOM. */
export function buildCsv(table: ReportTable, meta: ReportMeta): string {
  return renderCsv(table, meta).text;
}

export function residualSensitive(text: string): string[] {
  const findings: string[] = [];
  if (PATH_TEST.test(text)) {
    findings.push(message('report_sensitive_path'));
  }
  if (SECRET_TEST.test(text)) {
    findings.push(message('report_sensitive_credentials'));
  }
  if (LONG_DIGITS_TEST.test(text)) {
    findings.push(message('report_sensitive_digits'));
  }
  return findings;
}

/** Check exactly the render structures whose text will be returned, not localized substrings. */
function checkRenderedReport(records: ExperimentRecord[], meta: ReportMeta, table: ReportTable,
  markdown: RenderedReport, csv: RenderedReport): ReportCheck {
  const check: ReportCheck = new ReportCheck();
  if (meta.title.trim().length === 0) {
    check.findings.push(message('report_check_empty_title'));
  }
  if (meta.generatedAt !== 0 && (!Number.isFinite(meta.generatedAt) || meta.generatedAt < 0)) {
    check.findings.push(message('report_check_invalid_time'));
  }
  if (records.length === 0) {
    check.findings.push(message('report_check_no_records'));
  }
  if (table.rows.length === 0) {
    check.findings.push(message('report_check_no_stats'));
  }
  table.rows.forEach((group: ConditionGroup): void => {
    if (group.conditionText.trim().length === 0) {
      check.findings.push(message('report_check_no_condition', [group.labelText()]));
    }
    if (group.stageRows.length === 0) {
      check.findings.push(message('report_check_no_stages', [group.labelText()]));
    }
  });
  const required: string[] = [SECTION_CONDITIONS, SECTION_STATS, SECTION_STAGES, SECTION_GAPS, SECTION_TIME];
  required.forEach((sectionId: string): void => {
    if (!markdown.hasSection(sectionId)) {
      check.findings.push(message('report_check_missing_section',
        [formatLabel(ReportFormat.MARKDOWN), sectionLabel(sectionId)]));
    }
    if (!csv.hasSection(sectionId)) {
      check.findings.push(message('report_check_missing_section',
        [formatLabel(ReportFormat.CSV), sectionLabel(sectionId)]));
    }
  });
  if (!markdown.hasSection(SECTION_COMPARISON)) {
    check.findings.push(message('report_check_no_comparison'));
  }
  if (markdown.text.trim().length === 0 || csv.text.trim().length === 0) {
    check.findings.push(message('report_check_empty_render'));
  }
  residualSensitive(markdown.text).forEach((item: string): void => {
    check.findings.push(message('report_check_sensitive', [formatLabel(ReportFormat.MARKDOWN), item]));
  });
  residualSensitive(csv.text).forEach((item: string): void => {
    check.findings.push(message('report_check_sensitive', [formatLabel(ReportFormat.CSV), item]));
  });
  check.ok = check.findings.length === 0;
  return check;
}

export function checkReport(records: ExperimentRecord[], meta: ReportMeta,
  source: ConditionSource | undefined = undefined): ReportCheck {
  const table: ReportTable = ReportTable.build(records, source);
  const resolved: ReportMeta = resolveMeta(meta);
  return checkRenderedReport(records, meta, table, renderMarkdown(table, resolved), renderCsv(table, resolved));
}

/** Validate and return the same rendered output; no second build, timestamp, or localization pass. */
export function exportReport(records: ExperimentRecord[], meta: ReportMeta, format: ReportFormat,
  source: ConditionSource | undefined = undefined): ExportOutcome {
  const outcome: ExportOutcome = new ExportOutcome();
  outcome.format = format;
  const table: ReportTable = ReportTable.build(records, source);
  const resolved: ReportMeta = resolveMeta(meta);
  const markdown: RenderedReport = renderMarkdown(table, resolved);
  const csv: RenderedReport = renderCsv(table, resolved);
  outcome.check = checkRenderedReport(records, meta, table, markdown, csv);
  if (!outcome.check.ok) {
    return outcome;
  }
  outcome.text = format === ReportFormat.CSV ? csv.text : markdown.text;
  outcome.ok = outcome.text.trim().length > 0;
  if (!outcome.ok) {
    outcome.check.ok = false;
    outcome.check.findings.push(message('report_check_empty_render'));
  }
  return outcome;
}
