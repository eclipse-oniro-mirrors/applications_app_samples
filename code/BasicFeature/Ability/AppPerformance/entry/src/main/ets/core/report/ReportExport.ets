/**
 * 报告导出：把条件分组统计、阶段耗时与缺口说明输出为 Markdown / CSV。
 *
 * 脱敏契约（导出前强制校验，校验不过不返回任何文本）：
 *   - 不写文件路径（绝对/相对路径一律替换为占位符）；
 *   - 不写资源正文、阶段详情与记录备注（只使用大小、摘要、状态与统计值）；
 *   - 不写凭据（token/password/secret/authorization/cookie 等键值）；
 *   - 不写设备序列号（导出层从不采集序列号，另有长数字序列兜底脱敏）。
 *
 * 截断契约：单元格、条件描述、缺口与整篇报告都有上限；超长内容会截断并标注
 * 「截断，原 N 字符」，不静默丢字。
 *
 * 校验契约：checkReport 先构建两份渲染结果，再检查必填段落是否齐全、是否残留
 * 敏感信息；exportReport 只有在校验通过时才返回文本。
 */

import { ExperimentRecord } from '../ExperimentLedger';
import { formatTime } from '../Types';
import { ConditionSource, compareConditions } from './ConditionFingerprint';
import { ConditionGroup, ReportTable, StageTimingRow } from './ReportTable';

/** 导出格式。 */
export enum ReportFormat {
  MARKDOWN = 'markdown',
  CSV = 'csv'
}

/** 格式标签。 */
export function formatLabel(format: ReportFormat): string {
  return format === ReportFormat.CSV ? 'CSV' : 'Markdown';
}

/** 报告必填段落名；渲染与校验共用，避免两处字符串漂移。 */
export const SECTION_CONDITIONS: string = '条件描述';
export const SECTION_STATS: string = '分组统计';
export const SECTION_STAGES: string = '阶段耗时';
export const SECTION_GAPS: string = '缺口说明';
export const SECTION_TIME: string = '生成时间';

/** CSV 以 BOM 开头，便于表格软件按 UTF-8 识别中文。 */
export const CSV_BOM: string = '\uFEFF';

const CELL_LIMIT: number = 120;
const CONDITION_LIMIT: number = 240;
const GAP_LIMIT: number = 200;
const REPORT_LIMIT: number = 200000;

/** 敏感信息检测（不带 g，避免 test 的 lastIndex 状态）。 */
const ABSOLUTE_PATH_SOURCE: string =
  /[A-Za-z]:[\\/]|\/data\/|\/storage\/|\/sdcard\/|\/system\/|\/proc\/|\/users\/|\/home\/|file:\/\//.source;
const PARENT_PATH_SOURCE: string = /\.\.\//.source;
const SEGMENT_PATH_SOURCE: string = /(?:[A-Za-z0-9_.-]+\/){2,}[A-Za-z0-9_.-]+/.source;
const PATH_TEST: RegExp =
  new RegExp(`(?:${ABSOLUTE_PATH_SOURCE}|${PARENT_PATH_SOURCE}|${SEGMENT_PATH_SOURCE})`);
const SECRET_TEST: RegExp =
  /(?:serialNumber|serial|udid|imei|oaid|token|password|passwd|secret|authorization|cookie|sn)\s*[:=]\s*\S+/i;
const LONG_DIGITS_TEST: RegExp = /[0-9]{15,}/;

/** 脱敏替换（带 g，只用于 replace）。 */
const PATH_REPLACE: RegExp = new RegExp(
  `(?:${ABSOLUTE_PATH_SOURCE}|${SEGMENT_PATH_SOURCE})${/[^\s"'|,;)]*/.source}`, 'g');
const RELATIVE_REPLACE: RegExp = /\.\.\/[^\s"'|,;)]*/g;
const SEGMENT_PATH_REPLACE: RegExp = /(?:[A-Za-z0-9_.-]+\/){2,}[A-Za-z0-9_.-]+/g;
const SECRET_REPLACE: RegExp =
  /(?:serialNumber|serial|udid|imei|oaid|token|password|passwd|secret|authorization|cookie|sn)\s*[:=]\s*[^\s,;|]+/gi;
const LONG_DIGITS_REPLACE: RegExp = /[0-9]{15,}/g;

/** 报告元信息。generatedAt 为 0 时在导出时取当前时间。 */
export class ReportMeta {
  public title: string = '应用性能实验报告';
  public generatedAt: number = 0;
  /** 生成报告时使用的筛选条件描述（可空）。 */
  public filterText: string = '';
  /** 生成者备注；导出时会脱敏并截断。 */
  public note: string = '';

  constructor(title: string = '应用性能实验报告', generatedAt: number = 0,
    filterText: string = '', note: string = '') {
    this.title = title;
    this.generatedAt = generatedAt;
    this.filterText = filterText;
    this.note = note;
  }
}

/** 导出前校验结果。 */
export class ReportCheck {
  public ok: boolean = false;
  public findings: string[] = [];

  summary(): string {
    return this.ok ? '必填段落齐全，未发现敏感信息残留' : this.findings.join('；');
  }
}

/** 导出结果：校验不通过时 text 为空。 */
export class ExportOutcome {
  public ok: boolean = false;
  public format: ReportFormat = ReportFormat.MARKDOWN;
  public text: string = '';
  public check: ReportCheck = new ReportCheck();
}

/** 抹掉路径、凭据与长数字序列，并折叠换行。 */
function sanitize(text: string): string {
  let value: string = text.replace(/[\r\n\t]+/g, ' ').trim();
  value = value.replace(PATH_REPLACE, '[路径已脱敏]');
  value = value.replace(RELATIVE_REPLACE, '[路径已脱敏]');
  value = value.replace(SEGMENT_PATH_REPLACE, '[路径已脱敏]');
  value = value.replace(SECRET_REPLACE, '[凭据已脱敏]');
  value = value.replace(LONG_DIGITS_REPLACE, '[长数字已脱敏]');
  return value;
}

/** 先脱敏再按上限截断，截断处显式标注原始长度。 */
function clip(text: string, limit: number): string {
  const value: string = text.trim();
  if (value.length <= limit) {
    return value;
  }
  return `${value.slice(0, limit)}…（截断，原 ${value.length} 字符）`;
}

/** 脱敏 + 截断。 */
function clean(text: string, limit: number): string {
  return clip(sanitize(text), limit);
}

/** Markdown 单元格：额外转义表格分隔符。 */
function markdownCell(text: string, limit: number = CELL_LIMIT): string {
  return clean(text, limit).replace(/\|/g, '\\|');
}

/** CSV 单元格：含逗号、引号时加引号并双写引号。 */
function csvCell(text: string, limit: number = CELL_LIMIT): string {
  const value: string = clean(text, limit);
  if (/[",]/.test(value)) {
    return `"${value.replace(/"/g, '""')}"`;
  }
  return value;
}

/** 生成时间：0 或非法值取当前时间；负数也不写入报告。 */
function stampOf(meta: ReportMeta): number {
  return Number.isFinite(meta.generatedAt) && meta.generatedAt > 0 ? meta.generatedAt : Date.now();
}

function resolveMeta(meta: ReportMeta): ReportMeta {
  return new ReportMeta(meta.title, stampOf(meta), meta.filterText, meta.note);
}

function display(value: string, fallback: string): string {
  return value.trim().length > 0 ? value.trim() : fallback;
}

function countSamples(groups: ConditionGroup[]): number {
  return groups.reduce((sum: number, group: ConditionGroup): number => sum + group.samples, 0);
}

/** 整篇报告的兜底截断。 */
function limitReport(text: string): string {
  if (text.length <= REPORT_LIMIT) {
    return text;
  }
  return `${text.slice(0, REPORT_LIMIT)}\n\n> （报告超过 ${REPORT_LIMIT} 字符已截断，原 ${text.length} 字符）`;
}

/** Markdown 渲染：固定五段，缺段即为校验失败。页面导出请走 exportReport（本函数不做校验）。 */
export function buildMarkdown(table: ReportTable, meta: ReportMeta): string {
  const groups: ConditionGroup[] = table.rows;
  const lines: string[] = [];
  lines.push(`# ${markdownCell(display(meta.title, '应用性能实验报告'), 80)}`);
  lines.push('');
  lines.push('> 本报告由本地实验账本生成并已脱敏：不含文件路径、文件正文、凭据与设备序列号；' +
    '缺失样本标记为「不可评估」，不以 0 代替。');
  lines.push('');

  lines.push(`## 1. ${SECTION_CONDITIONS}`);
  lines.push('');
  lines.push(`- 条件组：${groups.length} 组；记录：${countSamples(groups)} 条`);
  if (meta.filterText.trim().length > 0) {
    lines.push(`- 筛选：${clean(meta.filterText, CELL_LIMIT)}`);
  }
  if (meta.note.trim().length > 0) {
    lines.push(`- 备注：${clean(meta.note, GAP_LIMIT)}`);
  }
  lines.push('');
  if (groups.length === 0) {
    lines.push('- 没有条件组：账本为空或全部被筛选条件排除。');
    lines.push('');
  }
  groups.forEach((group: ConditionGroup): void => {
    lines.push(`### ${markdownCell(group.label, 40)}`);
    lines.push('');
    lines.push(`- 指纹：${group.fingerprint.length > 0 ? group.fingerprint : '不可用（关键字段缺失）'}`);
    const workload: string = group.workloadLabel.length > 0 ?
      `${group.workloadLabel}（${group.workloadId}）` : display(group.workloadId, '负载未记录');
    lines.push(`- 负载：${markdownCell(workload, CELL_LIMIT)}`);
    lines.push(`- 回收模式：${group.modeLabel()}`);
    lines.push(`- 条件描述：${markdownCell(group.conditionText, CONDITION_LIMIT)}`);
    lines.push(`- 可比性：${group.unavailable.length > 0 ? clean(group.unavailable, GAP_LIMIT) :
      '关键字段齐全，可作为同条件比较基线'}`);
    lines.push('');
  });
  lines.push('### 条件间比较');
  lines.push('');
  if (groups.length <= 1) {
    lines.push('- 只有一个条件组，未进行跨组比较。');
  } else {
    const base: ConditionGroup = groups[0];
    for (let index: number = 1; index < groups.length; index++) {
      const other: ConditionGroup = groups[index];
      const comparison: string = compareConditions(base.fields, other.fields).text();
      lines.push(`- 以 ${base.label} 为基准，${other.label}：${clean(comparison, 300)}`);
    }
  }
  lines.push('');

  lines.push(`## 2. ${SECTION_STATS}`);
  lines.push('');
  lines.push('| 序号 | 条件组 | 负载 | 模式 | 样本 | 有效 | 失败/缺失 | P50 | P90 | 均值 |');
  lines.push('| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |');
  groups.forEach((group: ConditionGroup, index: number): void => {
    lines.push(`| ${index + 1} | ${markdownCell(group.label, 40)} | ` +
      `${markdownCell(group.workloadId, 60)} | ${group.modeLabel()} | ${group.samples} | ` +
      `${group.validSamples} | ${group.failed} | ${group.p50Text()} | ${group.p90Text()} | ` +
      `${group.meanText()} |`);
  });
  lines.push('');
  lines.push('> P50/P90/均值均为阶段耗时合计；「不可评估」表示没有有效样本，不是 0。');
  lines.push('');

  lines.push(`## 3. ${SECTION_STAGES}`);
  lines.push('');
  lines.push('| 条件组 | 阶段 | 样本 | P50 | 均值 |');
  lines.push('| --- | --- | --- | --- | --- |');
  groups.forEach((group: ConditionGroup): void => {
    group.stageRows.forEach((row: StageTimingRow): void => {
      lines.push(`| ${markdownCell(group.label, 40)} | ${markdownCell(row.label, 40)} | ` +
        `${row.samples} | ${row.p50Text()} | ${row.meanText()} |`);
    });
  });
  lines.push('');
  lines.push('> 阶段耗时只统计正常结束的有效样本；阶段级 P90 不在报告内重算' +
    '（既有 P90 只按条件组提供，避免在新代码里复制分位数实现）。');
  lines.push('');

  lines.push(`## 4. ${SECTION_GAPS}`);
  lines.push('');
  let gapCount: number = 0;
  groups.forEach((group: ConditionGroup): void => {
    if (group.gaps.length === 0) {
      return;
    }
    gapCount += group.gaps.length;
    lines.push(`### ${markdownCell(group.label, 40)}`);
    lines.push('');
    group.gaps.forEach((text: string): void => {
      lines.push(`- ${clean(text, GAP_LIMIT)}`);
    });
    lines.push('');
  });
  if (gapCount === 0) {
    lines.push('- 未登记缺口：所有样本正常结束且条件字段齐全。');
    lines.push('');
  }
  lines.push('- 数据来源：本地实验账本（有界保留），不包含已被淘汰的历史记录；' +
    '驻留页变化不可观测，回收效果不量化。');
  lines.push('');

  lines.push(`## 5. ${SECTION_TIME}`);
  lines.push('');
  lines.push(`- 生成时间：${formatTime(stampOf(meta))}（本机时间）`);
  lines.push('- 报告版本：report-v1');
  lines.push(`- 条件组：${groups.length} 组；记录：${countSamples(groups)} 条`);
  if (groups.length > 0) {
    const first: ConditionGroup = groups[0];
    lines.push(`- 设备：${clean(display(first.fields.device, '未记录'), 80)}｜` +
      `系统：${clean(display(first.fields.osVersion, '未记录'), 80)}｜` +
      `应用版本：${clean(display(first.fields.appVersion, '未记录'), 40)}`);
    lines.push(`- 采样协议：${clean(display(first.fields.protocol, '未记录'), 120)}`);
  } else {
    lines.push('- 设备：未记录｜系统：未记录｜应用版本：未记录');
    lines.push('- 采样协议：未记录');
  }
  lines.push('- 导出格式：Markdown');
  return limitReport(lines.join('\n'));
}

/** CSV 渲染：固定列 章节/条件组/项目/值/备注，逐段平铺，便于表格软件透视。页面导出请走 exportReport。 */
export function buildCsv(table: ReportTable, meta: ReportMeta): string {
  const groups: ConditionGroup[] = table.rows;
  const rows: string[] = [];
  rows.push(['章节', '条件组', '项目', '值', '备注'].map((item: string): string =>
    csvCell(item, 40)).join(','));

  rows.push(['报告', '全部', '生成时间', formatTime(stampOf(meta)), '本机时间'].map(
    (item: string): string => csvCell(item, CELL_LIMIT)).join(','));
  rows.push(['报告', '全部', '报告版本', 'report-v1', ''].map((item: string): string =>
    csvCell(item, CELL_LIMIT)).join(','));
  rows.push(['报告', '全部', '条件组', String(groups.length), ''].map((item: string): string =>
    csvCell(item, CELL_LIMIT)).join(','));
  rows.push(['报告', '全部', '记录数', String(countSamples(groups)), ''].map(
    (item: string): string => csvCell(item, CELL_LIMIT)).join(','));
  rows.push(['报告', '全部', '筛选', meta.filterText, ''].map((item: string): string =>
    csvCell(item, CELL_LIMIT)).join(','));
  rows.push(['报告', '全部', '备注', meta.note, ''].map((item: string): string =>
    csvCell(item, GAP_LIMIT)).join(','));

  const base: ConditionGroup | undefined = groups.length > 0 ? groups[0] : undefined;
  groups.forEach((group: ConditionGroup): void => {
    const workload: string = group.workloadLabel.length > 0 ?
      `${group.workloadLabel}（${group.workloadId}）` : display(group.workloadId, '负载未记录');
    const comparability: string = group.unavailable.length > 0 ? group.unavailable :
      '关键字段齐全，可统计';
    const rowsOfConditions: string[][] = [
      [SECTION_CONDITIONS, group.label, '指纹',
        group.fingerprint.length > 0 ? group.fingerprint : '不可用', '关键字段缺失时不生成指纹'],
      [SECTION_CONDITIONS, group.label, '负载', workload, ''],
      [SECTION_CONDITIONS, group.label, '回收模式', group.modeLabel(), ''],
      [SECTION_CONDITIONS, group.label, '条件描述', group.conditionText, ''],
      [SECTION_CONDITIONS, group.label, '可比性', comparability, '']
    ];
    if (base !== undefined && base !== group) {
      const comparison: string = compareConditions(base.fields, group.fields).text();
      rowsOfConditions.push([SECTION_CONDITIONS, group.label, `与${base.label}比较`,
        comparison, '']);
    }
    rowsOfConditions.forEach((cells: string[]): void => {
      rows.push(cells.map((item: string): string => csvCell(item, CONDITION_LIMIT)).join(','));
    });

    const rowsOfStats: string[][] = [
      [SECTION_STATS, group.label, '样本量', String(group.samples), ''],
      [SECTION_STATS, group.label, '有效样本', String(group.validSamples), ''],
      [SECTION_STATS, group.label, '失败/缺失', String(group.failed), ''],
      [SECTION_STATS, group.label, 'P50', group.p50Text(), '阶段耗时合计'],
      [SECTION_STATS, group.label, 'P90', group.p90Text(), '阶段耗时合计'],
      [SECTION_STATS, group.label, '均值', group.meanText(), '阶段耗时合计']
    ];
    rowsOfStats.forEach((cells: string[]): void => {
      rows.push(cells.map((item: string): string => csvCell(item, CELL_LIMIT)).join(','));
    });

    group.stageRows.forEach((row: StageTimingRow): void => {
      rows.push([SECTION_STAGES, group.label, row.label, `P50 ${row.p50Text()}`,
        `样本 ${row.samples} · 均值 ${row.meanText()}`].map(
        (item: string): string => csvCell(item, GAP_LIMIT)).join(','));
    });

    group.gaps.forEach((text: string, index: number): void => {
      rows.push([SECTION_GAPS, group.label, `缺口${index + 1}`, text, ''].map(
        (item: string): string => csvCell(item, GAP_LIMIT)).join(','));
    });
  });

  if (groups.every((group: ConditionGroup): boolean => group.gaps.length === 0)) {
    rows.push([SECTION_GAPS, '全部', '未登记缺口', '所有样本正常结束且条件字段齐全', ''].map(
      (item: string): string => csvCell(item, GAP_LIMIT)).join(','));
  }
  rows.push([SECTION_GAPS, '全部', '数据来源', '本地实验账本（有界保留）',
    '驻留页变化不可观测，回收效果不量化'].map(
    (item: string): string => csvCell(item, GAP_LIMIT)).join(','));

  return limitReport(`${CSV_BOM}${rows.join('\n')}\n`);
}

/** 渲染文本里是否仍有敏感信息残留；返回命中类别，空数组表示干净。 */
export function residualSensitive(text: string): string[] {
  const findings: string[] = [];
  if (PATH_TEST.test(text)) {
    findings.push('疑似文件路径');
  }
  if (SECRET_TEST.test(text)) {
    findings.push('疑似凭据或序列号字段');
  }
  if (LONG_DIGITS_TEST.test(text)) {
    findings.push('疑似长数字序列（可能是序列号）');
  }
  return findings;
}

/**
 * 导出前校验：必填段落齐全、条件描述/阶段行存在、渲染结果非空、没有敏感信息残留。
 * 只校验模型与渲染结果，不读取文件、不写文件、不发起系统调用。
 */
export function checkReport(records: ExperimentRecord[], meta: ReportMeta,
  source: ConditionSource | undefined = undefined): ReportCheck {
  const check: ReportCheck = new ReportCheck();
  if (meta.title.trim().length === 0) {
    check.findings.push('报告标题为空');
  }
  if (meta.generatedAt !== 0 && (!Number.isFinite(meta.generatedAt) || meta.generatedAt < 0)) {
    check.findings.push('生成时间非法');
  }
  if (records.length === 0) {
    check.findings.push('没有任何实验记录，无法生成条件描述与分组统计');
  }
  const table: ReportTable = ReportTable.build(records, source);
  if (table.rows.length === 0) {
    check.findings.push('缺少分组统计行');
  }
  table.rows.forEach((group: ConditionGroup): void => {
    if (group.conditionText.trim().length === 0) {
      check.findings.push(`${group.label} 缺少条件描述`);
    }
    if (group.stageRows.length === 0) {
      check.findings.push(`${group.label} 缺少阶段耗时行`);
    }
  });

  const resolved: ReportMeta = resolveMeta(meta);
  const markdown: string = buildMarkdown(table, resolved);
  const csv: string = buildCsv(table, resolved);
  const sections: string[] = [SECTION_CONDITIONS, SECTION_STATS, SECTION_STAGES,
    SECTION_GAPS, SECTION_TIME];
  sections.forEach((section: string): void => {
    if (markdown.indexOf(section) < 0) {
      check.findings.push(`Markdown 缺少必填段落：${section}`);
    }
    if (csv.indexOf(section) < 0) {
      check.findings.push(`CSV 缺少必填段落：${section}`);
    }
  });
  if (markdown.indexOf('条件间比较') < 0) {
    check.findings.push('Markdown 缺少条件间比较段');
  }
  if (markdown.trim().length === 0 || csv.trim().length === 0) {
    check.findings.push('渲染结果为空');
  }
  residualSensitive(markdown).forEach((item: string): void => {
    check.findings.push(`Markdown 残留敏感信息：${item}`);
  });
  residualSensitive(csv).forEach((item: string): void => {
    check.findings.push(`CSV 残留敏感信息：${item}`);
  });
  check.ok = check.findings.length === 0;
  return check;
}

/**
 * 导出入口：校验通过才返回文本。
 * 页面把 outcome.text 交给剪贴板或文件保存；outcome.check.summary() 可直接展示失败原因。
 */
export function exportReport(records: ExperimentRecord[], meta: ReportMeta, format: ReportFormat,
  source: ConditionSource | undefined = undefined): ExportOutcome {
  const outcome: ExportOutcome = new ExportOutcome();
  outcome.format = format;
  outcome.check = checkReport(records, meta, source);
  if (!outcome.check.ok) {
    return outcome;
  }
  const table: ReportTable = ReportTable.build(records, source);
  const resolved: ReportMeta = resolveMeta(meta);
  outcome.text = format === ReportFormat.CSV ? buildCsv(table, resolved) :
    buildMarkdown(table, resolved);
  outcome.ok = outcome.text.trim().length > 0;
  if (!outcome.ok) {
    outcome.check.ok = false;
    outcome.check.findings.push('渲染结果为空');
  }
  return outcome;
}
