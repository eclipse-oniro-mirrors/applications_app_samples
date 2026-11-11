/**
 * 条件指纹：把一次实验的采样条件收敛为「稳定指纹 + 可读描述 + 可比性结论」。
 *
 * 为什么需要：同一负载的两次耗时，只有在同一设备、同一系统与应用版本、同一资源大小与内容、
 * 同一回收模式与目标集合、同一采样协议下才可比较。账本里的 condition 字段是一个 JSON 元组
 * （环境 / 应用版本 / 前后台 / 负载 / 目标列表），任何字段缺失时，直接比较字符串会把
 * 「不知道」当成「相同」。这里显式区分三种结论：
 *   - 同条件（same）：两侧关键字段齐全，且指纹一致、辅助字段也一致；
 *   - 部分不同（partial）：两侧关键字段齐全，但至少一个字段不同，逐项列出差异；
 *   - 不可比（incomparable）：任一侧关键字段缺失，此时不生成指纹。
 * 契约：缺失条件永远不得视为相同；空指纹（''）只表示不可比，调用方不得用它分组。
 */

import { ExperimentRecord } from '../ExperimentLedger';

/** 条件比较结论。 */
export enum ConditionVerdict {
  SAME = 'same',
  PARTIAL = 'partial',
  INCOMPARABLE = 'incomparable'
}

/** 结论标签。 */
export function conditionVerdictLabel(verdict: ConditionVerdict): string {
  switch (verdict) {
    case ConditionVerdict.SAME:
      return '同条件';
    case ConditionVerdict.PARTIAL:
      return '部分不同';
    default:
      return '不可比';
  }
}

/**
 * 采样协议标识：固定为账本记录所代表的真实配方（6 个阶段、单次运行、同资源重读）。
 * 协议本身随应用版本演进，版本号已进入指纹，因此这里用常量而不是样本推断。
 */
export const SAMPLING_PROTOCOL: string = 'ledger-v1 · 6 阶段 · 单次运行 · 同资源重读';

/** 指纹前缀；规范化文本里另带 schema 版本，字段顺序改变时旧指纹不会与新指纹相撞。 */
const FINGERPRINT_PREFIX: string = 'cf';
const FINGERPRINT_SCHEMA: string = 'cf-v1';

/** 字段标签，用于差异与缺失说明；顺序即展示顺序。 */
const FIELD_DEVICE: string = '设备型号';
const FIELD_OS: string = '系统版本';
const FIELD_APP: string = '应用版本';
const FIELD_WORKLOAD: string = '负载标识';
const FIELD_MODE: string = '回收模式';
const FIELD_SIZE: string = '资源大小';
const FIELD_DIGEST: string = '资源摘要';
const FIELD_TARGETS: string = '目标集合';
const FIELD_PROTOCOL: string = '采样协议';
const FIELD_FOREGROUND: string = '前后台';
const FIELD_SCOPE: string = '安装/回收目标清单';

/** 一次实验的采样条件。字段为空或哨兵值表示「未记录」，不做默认补齐。 */
export class ConditionFields {
  /** 设备型号（不填序列号）。 */
  public device: string = '';
  /** 系统版本。 */
  public osVersion: string = '';
  /** 应用版本。 */
  public appVersion: string = '';
  public workloadId: string = '';
  public workloadLabel: string = '';
  /** 回收模式：control / files / modules。 */
  public mode: string = '';
  /** 资源字节数；-1 表示未记录。 */
  public assetBytes: number = -1;
  /** 资源内容摘要；空串表示未记录。 */
  public assetDigest: string = '';
  /** 目标个数；-1 表示未记录，对照组显式为 0。 */
  public targetCount: number = -1;
  /** 目标集合摘要（只存摘要，不存目标名或路径）。 */
  public targetDigest: string = '';
  public protocol: string = '';
  /** 前后台：'前台' / '后台' / ''（未记录）。辅助字段，不进入关键指纹。 */
  public foreground: string = '';
  /**
   * 安装目标与回收目标的合并摘要。辅助字段（不进入关键指纹），只为让「账本条件不同但关键
   * 字段相同」的两组不会在跨组比较里被误判成同条件——账本的 condition 还包含发现到的
   * 安装文件/模块清单，这里用摘要覆盖它，且不会把目标名或路径带进报告。
   */
  public scopeDigest: string = '';

  constructor(device: string = '', osVersion: string = '', appVersion: string = '',
    workloadId: string = '', workloadLabel: string = '', mode: string = '',
    assetBytes: number = -1, assetDigest: string = '', targetCount: number = -1,
    targetDigest: string = '', protocol: string = '', foreground: string = '') {
    this.device = device;
    this.osVersion = osVersion;
    this.appVersion = appVersion;
    this.workloadId = workloadId;
    this.workloadLabel = workloadLabel;
    this.mode = mode;
    this.assetBytes = assetBytes;
    this.assetDigest = assetDigest;
    this.targetCount = targetCount;
    this.targetDigest = targetDigest;
    this.protocol = protocol;
    this.foreground = foreground;
  }

  /** 回收模式标签，与账本 ExperimentRecord.modeLabel 保持一致。 */
  modeLabel(): string {
    if (this.mode === 'files') {
      return '文件回收';
    }
    if (this.mode === 'modules') {
      return '模块回收';
    }
    if (this.mode === 'control') {
      return '对照组';
    }
    return '模式未记录';
  }

  /** 资源描述：大小 + 摘要。 */
  assetText(): string {
    const size: string = this.assetBytes > 0 ? `${this.assetBytes} 字节` : '大小未记录';
    return `${size} / 摘要 ${this.assetDigest.length > 0 ? this.assetDigest : '未记录'}`;
  }

  /** 目标集合描述：个数 + 摘要（不含目标名，避免把路径带进报告）。 */
  targetText(): string {
    const count: string = this.targetCount >= 0 ? `${this.targetCount} 项` : '个数未记录';
    return `${count} / 摘要 ${this.targetDigest.length > 0 ? this.targetDigest : '未记录'}`;
  }
}

/**
 * 外部环境输入。页面通常不需要构造它：fieldsOfRecord 会从记录自带的 condition 元组还原。
 * device 只填型号（如 productModel），不要填序列号；导出层另有脱敏兜底。
 */
export class ConditionSource {
  public device: string = '';
  public osVersion: string = '';
  public appVersion: string = '';
  public protocol: string = SAMPLING_PROTOCOL;

  constructor(device: string = '', osVersion: string = '', appVersion: string = '',
    protocol: string = SAMPLING_PROTOCOL) {
    this.device = device;
    this.osVersion = osVersion;
    this.appVersion = appVersion;
    this.protocol = protocol;
  }

  /** 从 AppPlatform.environment() 的「型号 · 系统版本」文本拆分。 */
  static fromEnvironment(environment: string, appVersion: string): ConditionSource {
    const source: ConditionSource = new ConditionSource();
    const parts: string[] = environment.split('·')
      .map((part: string): string => part.trim())
      .filter((part: string): boolean => part.length > 0);
    source.device = parts.length > 0 ? parts[0] : '';
    source.osVersion = parts.length > 1 ? parts.slice(1).join(' · ') : '';
    source.appVersion = appVersion.trim();
    return source;
  }

  static of(device: string, osVersion: string, appVersion: string,
    protocol: string = SAMPLING_PROTOCOL): ConditionSource {
    return new ConditionSource(device, osVersion, appVersion, protocol);
  }
}

/** 一个字段的差异：左侧条件 → 右侧条件。 */
export class ConditionDiff {
  public label: string = '';
  public left: string = '';
  public right: string = '';

  constructor(label: string = '', left: string = '', right: string = '') {
    this.label = label;
    this.left = left;
    this.right = right;
  }

  text(): string {
    return `${this.label}（${this.left} → ${this.right}）`;
  }
}

/** 两条条件的比较结论。 */
export class ConditionComparison {
  public verdict: ConditionVerdict = ConditionVerdict.INCOMPARABLE;
  /** 共同指纹；不可比时为空串。 */
  public fingerprint: string = '';
  public diffs: ConditionDiff[] = [];
  /** 缺失字段说明，形如「左侧缺少设备型号」。 */
  public missing: string[] = [];

  constructor(verdict: ConditionVerdict = ConditionVerdict.INCOMPARABLE, fingerprint: string = '',
    diffs: ConditionDiff[] = [], missing: string[] = []) {
    this.verdict = verdict;
    this.fingerprint = fingerprint;
    this.diffs = diffs;
    this.missing = missing;
  }

  same(): boolean {
    return this.verdict === ConditionVerdict.SAME;
  }

  /** 是否可用于同条件统计（只有 SAME 才算同条件）。 */
  comparable(): boolean {
    return this.verdict === ConditionVerdict.SAME;
  }

  text(): string {
    if (this.verdict === ConditionVerdict.INCOMPARABLE) {
      return `不可比：${this.missing.length > 0 ? this.missing.join('；') : '关键字段缺失'}`;
    }
    if (this.verdict === ConditionVerdict.SAME) {
      return `同条件（指纹 ${this.fingerprint}）`;
    }
    const detail: string = this.diffs.map((item: ConditionDiff): string => item.text()).join('；');
    return `部分不同（指纹 ${this.fingerprint}）：${detail.length > 0 ? detail : '字段值不同'}`;
  }
}

/** 取字符串，非字符串与越界一律视为未记录。 */
function textAt(list: Object[], index: number): string {
  if (index < 0 || index >= list.length) {
    return '';
  }
  const value: Object = list[index];
  return typeof value === 'string' ? (value as string) : '';
}

/** 取字符串数组，非数组元素忽略。 */
function textListAt(list: Object[], index: number): string[] {
  if (index < 0 || index >= list.length) {
    return [];
  }
  const value: Object = list[index];
  if (!Array.isArray(value)) {
    return [];
  }
  const result: string[] = [];
  (value as Object[]).forEach((item: Object): void => {
    if (typeof item === 'string') {
      result.push(item as string);
    }
  });
  return result;
}

/** 前后台：账本写入的是布尔值；也接受字符串，缺失返回空串。 */
function foregroundAt(list: Object[], index: number): string {
  if (index < 0 || index >= list.length) {
    return '';
  }
  const value: Object = list[index];
  if (typeof value === 'boolean') {
    return (value as boolean) ? '前台' : '后台';
  }
  if (typeof value === 'string') {
    const text: string = (value as string).trim();
    return text === '前台' || text === '后台' ? text : '';
  }
  return '';
}

/** 把账本 condition 字段解析成元组；旧记录或损坏值返回空数组（全部字段按缺失处理）。 */
function conditionTuple(condition: string): Object[] {
  if (condition.trim().length === 0) {
    return [];
  }
  try {
    const parsed: Object = JSON.parse(condition) as Object;
    return Array.isArray(parsed) ? (parsed as Object[]) : [];
  } catch (error) {
    return [];
  }
}

/** 优先使用调用方提供的值，其次使用记录里的值。 */
function pickText(primary: string, fallback: string): string {
  const value: string = primary.trim();
  return value.length > 0 ? value : fallback.trim();
}

/** 去重后排序，保证目标集合摘要与目标顺序无关。 */
function uniqueSorted(values: string[]): string[] {
  const result: string[] = [];
  values.forEach((value: string): void => {
    const text: string = value.trim();
    if (text.length > 0 && result.indexOf(text) < 0) {
      result.push(text);
    }
  });
  return result.sort();
}

/**
 * 稳定文本哈希（FNV-1a 32 位）。
 *
 * 为什么新写：既有两处 FNV-1a 都是私有函数——AppService.digest（对 Uint8Array）与
 * BusinessCheckpoint.identity（对字符串）——没有导出，新文件无法 import 复用，也不能修改它们。
 * 与既有实现的差别：输入先做「长度前缀 + 分隔符」规范化，输出加 cf-/tg- 前缀；
 * 散列参数（2166136261 / 16777619）与既有实现一致。32 位摘要只用于分组与展示，
 * 不作为安全摘要或内容完整性证明。
 */
function fnv1a(text: string): string {
  let hash: number = 2166136261;
  for (let index: number = 0; index < text.length; index++) {
    hash = Math.imul(hash ^ text.charCodeAt(index), 16777619) >>> 0;
  }
  return hash.toString(16).padStart(8, '0');
}

/** 目标集合摘要：只对排序后的目标名求摘要，目标名本身不进入描述与报告。 */
function targetDigestOf(targets: string[]): string {
  const canonical: string = targets.map((target: string): string => `${target.length}:${target}`).join('|');
  return `tg-${fnv1a(canonical)}`;
}

/**
 * 安装目标与回收目标的合并摘要（辅助字段）。
 * 账本的 condition 还包含发现到的安装文件/模块清单；关键字段相同的两组可能只差这份清单。
 * 用摘要覆盖它，跨组比较就不会把「账本条件不同」误报成同条件，同时不泄露目标名或路径。
 */
function scopeDigestOf(files: string[], modules: string[], targets: string[]): string {
  const all: string[] = [];
  const sources: string[][] = [files, modules, targets];
  sources.forEach((values: string[]): void => {
    values.forEach((value: string): void => {
      const text: string = value.trim();
      if (text.length > 0 && all.indexOf(text) < 0) {
        all.push(text);
      }
    });
  });
  if (all.length === 0) {
    return '';
  }
  all.sort();
  const canonical: string = all.map((value: string): string => `${value.length}:${value}`).join('|');
  return `sc-${fnv1a(canonical)}`;
}

/**
 * 关键字段缺失清单。空数组表示关键字段齐全。
 * 注意：对照组的目标集合显式为「0 项」，不是缺失；files/modules 的 0 项目标视为缺失。
 */
export function missingFieldsOf(fields: ConditionFields): string[] {
  const missing: string[] = [];
  if (fields.device.trim().length === 0) {
    missing.push(FIELD_DEVICE);
  }
  if (fields.osVersion.trim().length === 0) {
    missing.push(FIELD_OS);
  }
  if (fields.appVersion.trim().length === 0) {
    missing.push(FIELD_APP);
  }
  if (fields.workloadId.trim().length === 0) {
    missing.push(FIELD_WORKLOAD);
  }
  if (['control', 'files', 'modules'].indexOf(fields.mode) < 0) {
    missing.push(FIELD_MODE);
  }
  if (!Number.isSafeInteger(fields.assetBytes) || fields.assetBytes <= 0) {
    missing.push(FIELD_SIZE);
  }
  if (!/^[0-9a-f]{8,64}$/.test(fields.assetDigest)) {
    missing.push(FIELD_DIGEST);
  }
  if (fields.targetCount < 0 || fields.targetDigest.length === 0) {
    missing.push(FIELD_TARGETS);
  } else if (fields.targetCount === 0 && fields.mode !== 'control') {
    missing.push(FIELD_TARGETS);
  }
  if (fields.protocol.trim().length === 0) {
    missing.push(FIELD_PROTOCOL);
  }
  return missing;
}

/** 规范化文本：字段带长度前缀，避免分隔符出现在值里造成歧义。 */
function canonicalText(fields: ConditionFields): string {
  const parts: string[] = [
    FINGERPRINT_SCHEMA,
    fields.device.trim(),
    fields.osVersion.trim(),
    fields.appVersion.trim(),
    fields.workloadId.trim(),
    fields.mode.trim(),
    String(fields.assetBytes),
    fields.assetDigest.trim(),
    String(fields.targetCount),
    fields.targetDigest.trim(),
    fields.protocol.trim()
  ];
  return parts.map((part: string): string => `${part.length}:${part}`).join('|');
}

/** 稳定指纹；关键字段缺失时返回空串（不可比），不生成「部分指纹」。 */
export function fingerprintOf(fields: ConditionFields): string {
  if (missingFieldsOf(fields).length > 0) {
    return '';
  }
  return `${FINGERPRINT_PREFIX}-${fnv1a(canonicalText(fields))}`;
}

/** 可读条件描述：设备/系统/版本 → 负载/模式 → 资源 → 目标集合 → 协议/前后台。 */
export function describeCondition(fields: ConditionFields): string {
  const device: string = fields.device.trim().length > 0 ? fields.device.trim() : '设备未记录';
  const os: string = fields.osVersion.trim().length > 0 ? fields.osVersion.trim() : '系统未记录';
  const app: string = fields.appVersion.trim().length > 0 ? fields.appVersion.trim() : '版本未记录';
  const workload: string = fields.workloadLabel.trim().length > 0 ?
    `${fields.workloadLabel.trim()}（${fields.workloadId.trim()}）` :
    (fields.workloadId.trim().length > 0 ? fields.workloadId.trim() : '负载未记录');
  const protocol: string = fields.protocol.trim().length > 0 ? fields.protocol.trim() : '协议未记录';
  const foreground: string = fields.foreground.trim().length > 0 ? ` · ${fields.foreground.trim()}` : '';
  return `${device} · ${os} · APP ${app}｜${workload} · ${fields.modeLabel()}｜` +
    `样本 ${fields.assetBytes > 0 ? `${fields.assetBytes} 字节` : '未记录'} · ` +
    `摘要 ${fields.assetDigest.length > 0 ? fields.assetDigest : '未记录'}｜` +
    `目标 ${fields.targetCount >= 0 ? `${fields.targetCount} 项` : '未记录'} · ` +
    `摘要 ${fields.targetDigest.length > 0 ? fields.targetDigest : '未记录'}｜` +
    `协议 ${protocol}${foreground}`;
}

/**
 * 从一条账本记录还原条件字段。
 *
 * 数据来源优先级：调用方显式提供的 source > 记录 condition 元组里的环境/版本。
 * 资源大小与摘要取记录事实字段（beforeBytes / digestBefore），不重新读取文件。
 * 缺失字段保持哨兵值，不用空设备名或 0 字节去「补齐」。
 */
export function fieldsOfRecord(record: ExperimentRecord,
  source: ConditionSource | undefined = undefined): ConditionFields {
  const tuple: Object[] = conditionTuple(record.condition);
  const parsed: ConditionSource = ConditionSource.fromEnvironment(textAt(tuple, 0), textAt(tuple, 1));
  const fields: ConditionFields = new ConditionFields();
  fields.device = pickText(source === undefined ? '' : source.device, parsed.device);
  fields.osVersion = pickText(source === undefined ? '' : source.osVersion, parsed.osVersion);
  fields.appVersion = pickText(source === undefined ? '' : source.appVersion, parsed.appVersion);
  fields.protocol = pickText(source === undefined ? '' : source.protocol, SAMPLING_PROTOCOL);
  fields.workloadId = record.workloadId;
  fields.workloadLabel = record.workloadLabel;
  fields.mode = record.mode;
  fields.assetBytes = record.beforeBytes;
  fields.assetDigest = record.digestBefore.trim();
  fields.foreground = foregroundAt(tuple, 2);

  let targets: string[] = [];
  if (record.mode === 'files') {
    targets = uniqueSorted(textListAt(tuple, 7));
  } else if (record.mode === 'modules') {
    targets = uniqueSorted(textListAt(tuple, 6));
  }
  if (record.mode === 'control') {
    // 对照组没有下发回收：目标集合显式记为 0 项，而不是「未记录」。
    fields.targetCount = 0;
    fields.targetDigest = targetDigestOf([]);
  } else if (targets.length > 0) {
    fields.targetCount = targets.length;
    fields.targetDigest = targetDigestOf(targets);
  }
  fields.scopeDigest = scopeDigestOf(textListAt(tuple, 5), textListAt(tuple, 6), targets);
  return fields;
}

/** 记录来源的字段差异；只比较展示字段，不比较任何文件内容。 */
function differencesOf(base: ConditionFields, other: ConditionFields): ConditionDiff[] {
  const diffs: ConditionDiff[] = [];
  if (base.device.trim() !== other.device.trim()) {
    diffs.push(new ConditionDiff(FIELD_DEVICE, orUnrecorded(base.device), orUnrecorded(other.device)));
  }
  if (base.osVersion.trim() !== other.osVersion.trim()) {
    diffs.push(new ConditionDiff(FIELD_OS, orUnrecorded(base.osVersion), orUnrecorded(other.osVersion)));
  }
  if (base.appVersion.trim() !== other.appVersion.trim()) {
    diffs.push(new ConditionDiff(FIELD_APP, orUnrecorded(base.appVersion), orUnrecorded(other.appVersion)));
  }
  if (base.workloadId.trim() !== other.workloadId.trim()) {
    diffs.push(new ConditionDiff(FIELD_WORKLOAD, workloadText(base), workloadText(other)));
  }
  if (base.mode !== other.mode) {
    diffs.push(new ConditionDiff(FIELD_MODE, base.modeLabel(), other.modeLabel()));
  }
  if (base.assetBytes !== other.assetBytes) {
    diffs.push(new ConditionDiff(FIELD_SIZE, orUnrecorded(String(base.assetBytes)),
      orUnrecorded(String(other.assetBytes))));
  }
  if (base.assetDigest !== other.assetDigest) {
    diffs.push(new ConditionDiff(FIELD_DIGEST, orUnrecorded(base.assetDigest),
      orUnrecorded(other.assetDigest)));
  }
  if (base.targetCount !== other.targetCount || base.targetDigest !== other.targetDigest) {
    diffs.push(new ConditionDiff(FIELD_TARGETS, base.targetText(), other.targetText()));
  }
  if (base.protocol.trim() !== other.protocol.trim()) {
    diffs.push(new ConditionDiff(FIELD_PROTOCOL, orUnrecorded(base.protocol),
      orUnrecorded(other.protocol)));
  }
  // 前后台与安装/回收目标清单是辅助字段：缺失不会使整条记录不可比，但也不允许当成相同。
  if (base.foreground !== other.foreground) {
    diffs.push(new ConditionDiff(FIELD_FOREGROUND, orUnrecorded(base.foreground),
      orUnrecorded(other.foreground)));
  }
  if (base.scopeDigest !== other.scopeDigest) {
    diffs.push(new ConditionDiff(FIELD_SCOPE, orUnrecorded(base.scopeDigest),
      orUnrecorded(other.scopeDigest)));
  }
  return diffs;
}

function workloadText(fields: ConditionFields): string {
  const label: string = fields.workloadLabel.trim();
  const id: string = fields.workloadId.trim();
  if (label.length > 0 && id.length > 0) {
    return `${label}（${id}）`;
  }
  return label.length > 0 ? label : (id.length > 0 ? id : '未记录');
}

function orUnrecorded(value: string): string {
  return value.trim().length > 0 ? value.trim() : '未记录';
}

/**
 * 比较两条条件。
 * 判定顺序：先查关键字段缺失（→ 不可比），再比指纹（关键字段），最后查辅助字段差异。
 * 任一步缺失都返回不可比，绝不把缺失当成相同。
 */
export function compareConditions(base: ConditionFields, other: ConditionFields): ConditionComparison {
  const comparison: ConditionComparison = new ConditionComparison();
  missingFieldsOf(base).forEach((label: string): void => {
    comparison.missing.push(`左侧缺少${label}`);
  });
  missingFieldsOf(other).forEach((label: string): void => {
    comparison.missing.push(`右侧缺少${label}`);
  });
  if (comparison.missing.length > 0) {
    comparison.verdict = ConditionVerdict.INCOMPARABLE;
    return comparison;
  }
  comparison.fingerprint = fingerprintOf(base);
  comparison.diffs = differencesOf(base, other);
  if (comparison.diffs.length === 0 && comparison.fingerprint === fingerprintOf(other)) {
    comparison.verdict = ConditionVerdict.SAME;
  } else {
    if (comparison.diffs.length === 0) {
      comparison.diffs.push(new ConditionDiff('条件指纹', comparison.fingerprint, fingerprintOf(other)));
    }
    comparison.verdict = ConditionVerdict.PARTIAL;
  }
  return comparison;
}

/** 页面直接比较两条账本记录。 */
export function compareRecordConditions(base: ExperimentRecord, other: ExperimentRecord,
  source: ConditionSource | undefined = undefined): ConditionComparison {
  return compareConditions(fieldsOfRecord(base, source), fieldsOfRecord(other, source));
}
