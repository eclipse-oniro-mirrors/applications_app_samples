/**
 * 历史归档索引：把归档记录整理成"按日期 / 来源 / 结果"可查的有界索引。
 *
 * 契约：
 *  - 输入只读：构建函数不修改入参记录、数组与顺序；返回的样本都是副本。
 *  - 索引有界：天数、每日样本数、最近有效样本数、趋势点数都有硬上限；被挡在
 *    窗口外的记录计入 droppedEntries / droppedDays，并写进 notices，不静默丢弃。
 *  - 日期按"本地日界线"切分，不是滚动 24 小时窗口。时区偏移由调用方显式传给
 *    buildArchiveIndex，同一份记录 + 同一偏移得到同一份索引。
 *  - 空输入必须给出可判定的空态（isEmpty() + emptyState()），不能返回看似正常
 *    但没有任何解释的半成品。
 *
 * 数据来源是真实持久化的 schema1 查询记录（QueryRecord，见 AutoStartupHistory）。
 * history/HistorySchema 的 TSV 行是未接入的演示模型，不作为归档输入，也不在这里
 * 做任何"迁移"。
 */

import { QueryOutcome, QueryRecord, RefreshSource } from '../AutoStartupTypes';

/** 一天的毫秒数。本地日界线切分与保留天数计算共用。 */
export const DAY_MS: number = 24 * 60 * 60 * 1000;

/** 归档认可的刷新来源，与持久化记录使用同一组取值。 */
export const ARCHIVE_SOURCES: string[] = [
  RefreshSource.INITIAL,
  RefreshSource.MANUAL,
  RefreshSource.FOREGROUND,
  RefreshSource.SETTINGS
];

/** 归档认可的查询结论。 */
export const ARCHIVE_OUTCOMES: string[] = [
  QueryOutcome.SUCCESS,
  QueryOutcome.FAILURE,
  QueryOutcome.UNSUPPORTED,
  QueryOutcome.TIMEOUT,
  QueryOutcome.UNKNOWN
];

/** 索引最多保留的天数。更早的日期不建桶，只计数。 */
export const INDEX_MAX_DAYS: number = 180;
/** 每天最多在索引里保留的样本条数；其余只进统计。 */
export const INDEX_SAMPLES_PER_DAY: number = 20;
/** 全局"最近有效样本"最多保留条数。 */
export const INDEX_RECENT_VALID: number = 10;
/** 趋势最多展示的天数（取最近的这些天）。 */
export const INDEX_TREND_POINTS: number = 60;

/** 归档记录文本字段上限，与持久化 schema1 的校验保持一致。 */
export const ENTRY_TEXT_LIMIT: number = 200;
export const ENTRY_CODE_LIMIT: number = 64;
export const ENTRY_MESSAGE_LIMIT: number = 512;
export const ENTRY_NOTE_LIMIT: number = 192;

/** 来源是否在归档白名单内。 */
export function isKnownSource(source: string): boolean {
  return ARCHIVE_SOURCES.indexOf(source) >= 0;
}

/** 结论是否在归档白名单内。 */
export function isKnownOutcome(outcome: string): boolean {
  return ARCHIVE_OUTCOMES.indexOf(outcome) >= 0;
}

/** 两位补零。 */
export function pad2(value: number): string {
  return value < 10 ? `0${value}` : value.toString();
}

/**
 * 本地时区相对 UTC 的分钟偏移（东八区为 480）。
 *
 * 统一规定"正数表示东侧"，与 Date#getTimezoneOffset 的符号相反，避免调用方
 * 在日界线计算里反复猜符号。
 */
export function localOffsetMinutes(now: number): number {
  const at: number = Number.isFinite(now) && now > 0 ? now : Date.now();
  return -new Date(at).getTimezoneOffset();
}

/** 时间戳所在本地日期，格式 yyyy-MM-dd；时间戳非法时返回空串。 */
export function dayKeyOf(timestamp: number, offsetMinutes: number): string {
  if (!Number.isFinite(timestamp) || timestamp <= 0) {
    return '';
  }
  const offset: number = Number.isFinite(offsetMinutes) ? offsetMinutes : 0;
  const shifted: Date = new Date(timestamp + offset * 60 * 1000);
  const year: string = shifted.getUTCFullYear().toString().padStart(4, '0');
  return `${year}-${pad2(shifted.getUTCMonth() + 1)}-${pad2(shifted.getUTCDate())}`;
}

/** 日期键是否合法（含大小月与闰年校验）。 */
export function isDayKey(value: string): boolean {
  return dayStartMillis(value, 0) > 0;
}

/**
 * 本地日期键对应的起始毫秒。
 *
 * 用 UTC 构造再减偏移，避免设备时区与调用方时区不一致时出现跨日漂移；
 * 非法日期（如 2026-02-31）返回 0，而不是被 Date 自动顺延。
 */
export function dayStartMillis(dayKey: string, offsetMinutes: number): number {
  const parts: string[] = dayKey.split('-');
  if (parts.length !== 3 || parts[0].length !== 4) {
    return 0;
  }
  const year: number = Number(parts[0]);
  const month: number = Number(parts[1]);
  const day: number = Number(parts[2]);
  if (!Number.isInteger(year) || !Number.isInteger(month) || !Number.isInteger(day) ||
    month < 1 || month > 12 || day < 1 || day > 31) {
    return 0;
  }
  const utc: number = Date.UTC(year, month - 1, day);
  const check: Date = new Date(utc);
  if (check.getUTCFullYear() !== year || check.getUTCMonth() !== month - 1 ||
    check.getUTCDate() !== day) {
    return 0;
  }
  const offset: number = Number.isFinite(offsetMinutes) ? offsetMinutes : 0;
  return utc - offset * 60 * 1000;
}

/** 日期键对应的结束毫秒（含）。 */
export function dayEndMillis(dayKey: string, offsetMinutes: number): number {
  const start: number = dayStartMillis(dayKey, offsetMinutes);
  return start <= 0 ? 0 : start + DAY_MS - 1;
}

/** 结论标签；未知取值返回"未知"，不抛错。 */
export function archiveOutcomeLabel(outcome: string): string {
  switch (outcome) {
    case QueryOutcome.SUCCESS:
      return '成功';
    case QueryOutcome.FAILURE:
      return '失败';
    case QueryOutcome.UNSUPPORTED:
      return '不支持';
    case QueryOutcome.TIMEOUT:
      return '超时';
    default:
      return '未知';
  }
}

/** 来源标签；未知取值返回"未标注"。 */
export function archiveSourceLabel(source: string): string {
  switch (source) {
    case RefreshSource.INITIAL:
      return '首次进入';
    case RefreshSource.MANUAL:
      return '手动刷新';
    case RefreshSource.FOREGROUND:
      return '返回前台';
    case RefreshSource.SETTINGS:
      return '设置后查询';
    default:
      return '未标注';
  }
}

/**
 * 一条归档记录。
 *
 * 与 QueryRecord 同构，另加 note 字段：导入时如果序号冲突需要重新编号，原序号
 * 会写进 note，保证"这条记录原本是谁"仍可追溯。note 也承载归档时的说明。
 */
export class ArchiveEntry {
  public id: number = 0;
  public timestamp: number = 0;
  public source: string = RefreshSource.INITIAL;
  public outcome: string = QueryOutcome.UNKNOWN;
  public result: string = '';
  public supportResult: string = '待调用';
  public statusResult: string = '待调用';
  public errorCode: string = '';
  public errorMessage: string = '';
  public durationMillis: number = 0;
  public note: string = '';

  constructor(id: number = 0, timestamp: number = 0) {
    this.id = id;
    this.timestamp = timestamp;
  }

  clone(): ArchiveEntry {
    const copy: ArchiveEntry = new ArchiveEntry(this.id, this.timestamp);
    copy.source = this.source;
    copy.outcome = this.outcome;
    copy.result = this.result;
    copy.supportResult = this.supportResult;
    copy.statusResult = this.statusResult;
    copy.errorCode = this.errorCode;
    copy.errorMessage = this.errorMessage;
    copy.durationMillis = this.durationMillis;
    copy.note = this.note;
    return copy;
  }

  /** 是否可进入索引 / 可写入归档文件。字段边界与 schema1 的校验一致。 */
  isValid(): boolean {
    return Number.isSafeInteger(this.id) && this.id > 0 && this.id < Number.MAX_SAFE_INTEGER &&
      Number.isFinite(this.timestamp) && this.timestamp > 0 &&
      Number.isFinite(this.durationMillis) && this.durationMillis >= 0 &&
      isKnownSource(this.source) && isKnownOutcome(this.outcome) &&
      this.result.length <= ENTRY_TEXT_LIMIT &&
      this.supportResult.length <= ENTRY_TEXT_LIMIT &&
      this.statusResult.length <= ENTRY_TEXT_LIMIT &&
      this.errorCode.length <= ENTRY_CODE_LIMIT &&
      this.errorMessage.length <= ENTRY_MESSAGE_LIMIT &&
      this.note.length <= ENTRY_NOTE_LIMIT;
  }

  /** 是否是"有效样本"：成功或明确失败。未知、不支持、超时都不算。 */
  isValidSample(): boolean {
    return this.outcome === QueryOutcome.SUCCESS || this.outcome === QueryOutcome.FAILURE;
  }

  /** 是否带错误信息。 */
  hasError(): boolean {
    return this.errorCode.length > 0 || this.errorMessage.length > 0;
  }

  /** 距指定时刻的完整天数；时间非法或未来时间按 0 处理。 */
  ageDaysAt(now: number): number {
    if (!Number.isFinite(now) || now <= 0 || !Number.isFinite(this.timestamp)) {
      return 0;
    }
    return Math.floor(Math.max(0, now - this.timestamp) / DAY_MS);
  }

  /** 该记录所在的本地日期键。 */
  dayKey(offsetMinutes: number): string {
    return dayKeyOf(this.timestamp, offsetMinutes);
  }
}

/** 从持久化记录投影出归档记录；note 初始为空。 */
export function archiveEntryOf(record: QueryRecord): ArchiveEntry {
  const entry: ArchiveEntry = new ArchiveEntry(record.id, record.timestamp);
  entry.source = record.source;
  entry.outcome = record.outcome;
  entry.result = record.result;
  entry.supportResult = record.supportResult;
  entry.statusResult = record.statusResult;
  entry.errorCode = record.errorCode;
  entry.errorMessage = record.errorMessage;
  entry.durationMillis = record.durationMillis;
  return entry;
}

/** 批量投影，仅保留校验通过的记录；被跳过的条数由调用方用长度差判断。 */
export function archiveEntriesOf(records: QueryRecord[]): ArchiveEntry[] {
  const entries: ArchiveEntry[] = [];
  records.forEach((record: QueryRecord): void => {
    const entry: ArchiveEntry = archiveEntryOf(record);
    if (entry.isValid()) {
      entries.push(entry);
    }
  });
  return entries;
}

/** 带计数的分布项，供页面直接渲染，避免动态键。 */
export class CountEntry {
  public label: string = '';
  public count: number = 0;

  constructor(label: string = '', count: number = 0) {
    this.label = label;
    this.count = count;
  }
}

/**
 * 把固定顺序的计数数组包装成分布项。
 *
 * 默认保留 0 值：页面需要"来源/结果一行行都在"，而不是缺失的维度凭空消失。
 */
export function distributionOf(labels: string[], counts: number[], includeZero: boolean = true): CountEntry[] {
  const list: CountEntry[] = [];
  for (let index = 0; index < labels.length; index++) {
    const raw: number = index < counts.length ? counts[index] : 0;
    const count: number = Number.isFinite(raw) ? Math.max(0, raw) : 0;
    if (!includeZero && count === 0) {
      continue;
    }
    list.push(new CountEntry(labels[index], count));
  }
  return list;
}

/** 按计数降序、同计数按标签升序排列，便于"最多来源/最常见结果"阅读。 */
export function sortedDistribution(labels: string[], counts: number[]): CountEntry[] {
  const list: CountEntry[] = distributionOf(labels, counts, false);
  list.sort((left: CountEntry, right: CountEntry): number => {
    if (right.count !== left.count) {
      return right.count - left.count;
    }
    return left.label < right.label ? -1 : (left.label > right.label ? 1 : 0);
  });
  return list;
}

/**
 * 一天的归档桶。
 *
 * 桶本身有界：samples 只保留 sampleLimit 条副本，其余只累计到计数里。
 * add() 不依赖调用顺序，但"最近有效样本"按时间戳比较，重复时间用序号破平。
 */
export class ArchiveDay {
  public dayKey: string = '';
  public startMillis: number = 0;
  public endMillis: number = 0;
  public total: number = 0;
  public success: number = 0;
  public failure: number = 0;
  public unsupported: number = 0;
  public timeout: number = 0;
  public unknown: number = 0;
  /** 与 ARCHIVE_SOURCES 下标对齐。 */
  public sourceCounts: number[] = [];
  public samples: ArchiveEntry[] = [];
  public sampleLimit: number = 0;
  public latestValidId: number = -1;
  public latestValidAt: number = 0;
  public firstAt: number = 0;
  public lastAt: number = 0;

  constructor(dayKey: string = '', sampleLimit: number = 0) {
    this.dayKey = dayKey;
    this.sampleLimit = Math.max(0, sampleLimit);
    this.sourceCounts = new Array<number>(ARCHIVE_SOURCES.length).fill(0);
  }

  /** 有效样本数（成功 + 失败）。 */
  valid(): number {
    return this.success + this.failure;
  }

  /** 成功率百分比，一位小数；没有有效样本时为 0。 */
  successRate(): number {
    const base: number = this.valid();
    if (base <= 0) {
      return 0;
    }
    return Math.round((this.success / base) * 1000) / 10;
  }

  /** 某来源的条数；未知来源返回 0。 */
  sourceCount(source: string): number {
    const index: number = ARCHIVE_SOURCES.indexOf(source);
    if (index < 0 || index >= this.sourceCounts.length) {
      return 0;
    }
    return this.sourceCounts[index];
  }

  /** 某结论的条数。 */
  outcomeCount(outcome: string): number {
    switch (outcome) {
      case QueryOutcome.SUCCESS:
        return this.success;
      case QueryOutcome.FAILURE:
        return this.failure;
      case QueryOutcome.UNSUPPORTED:
        return this.unsupported;
      case QueryOutcome.TIMEOUT:
        return this.timeout;
      default:
        return this.unknown;
    }
  }

  /** 加入一条记录。样本与有效样本都受桶内上限约束。 */
  add(entry: ArchiveEntry): void {
    this.total++;
    switch (entry.outcome) {
      case QueryOutcome.SUCCESS:
        this.success++;
        break;
      case QueryOutcome.FAILURE:
        this.failure++;
        break;
      case QueryOutcome.UNSUPPORTED:
        this.unsupported++;
        break;
      case QueryOutcome.TIMEOUT:
        this.timeout++;
        break;
      default:
        this.unknown++;
        break;
    }
    const sourceIndex: number = ARCHIVE_SOURCES.indexOf(entry.source);
    if (sourceIndex >= 0 && sourceIndex < this.sourceCounts.length) {
      this.sourceCounts[sourceIndex]++;
    }
    if (this.firstAt === 0 || entry.timestamp < this.firstAt) {
      this.firstAt = entry.timestamp;
    }
    if (entry.timestamp > this.lastAt) {
      this.lastAt = entry.timestamp;
    }
    if (this.samples.length < this.sampleLimit) {
      this.samples.push(entry.clone());
    }
    if (entry.isValidSample()) {
      if (this.latestValidId < 0 || entry.timestamp > this.latestValidAt ||
        (entry.timestamp === this.latestValidAt && entry.id > this.latestValidId)) {
        this.latestValidId = entry.id;
        this.latestValidAt = entry.timestamp;
      }
    }
  }

  /** 未能进入样本的条数。 */
  sampleTruncated(): number {
    return Math.max(0, this.total - this.samples.length);
  }

  /** 来源分布；默认保留 0 值。 */
  sourceDistribution(includeZero: boolean = true): CountEntry[] {
    return distributionOf(ARCHIVE_SOURCES, this.sourceCounts, includeZero);
  }

  /** 结果分布。 */
  outcomeDistribution(includeZero: boolean = true): CountEntry[] {
    const counts: number[] = [this.success, this.failure, this.unsupported, this.timeout, this.unknown];
    return distributionOf(ARCHIVE_OUTCOMES, counts, includeZero);
  }

  /** 一句话摘要，供诊断/日志使用。 */
  summaryText(): string {
    const truncated: number = this.sampleTruncated();
    const tail: string = truncated > 0 ? `；另有 ${truncated} 条仅计入统计` : '';
    return `${this.dayKey}：共 ${this.total} 条（有效 ${this.valid()}），成功率 ${this.successRate()}%${tail}`;
  }
}

/** 某日详情查询结果。found=false 时 samples 必为空，且 notice 说明原因。 */
export class ArchiveDayDetail {
  public dayKey: string = '';
  public found: boolean = false;
  public total: number = 0;
  public samples: ArchiveEntry[] = [];
  public truncated: number = 0;
  public notice: string = '';

  constructor(dayKey: string = '') {
    this.dayKey = dayKey;
  }

  text(): string {
    if (!this.found) {
      return `${this.dayKey}：${this.notice}`;
    }
    const tail: string = this.truncated > 0 ? `（另有 ${this.truncated} 条仅计入统计）` : '';
    return `${this.dayKey}：共 ${this.total} 条，返回 ${this.samples.length} 条样本${tail}`;
  }
}

/** 索引边界。所有值在构建时会被夹到合法区间，不信任调用方传入 0 或负数。 */
export class IndexBounds {
  public maxDays: number = INDEX_MAX_DAYS;
  public samplesPerDay: number = INDEX_SAMPLES_PER_DAY;
  public recentValid: number = INDEX_RECENT_VALID;
  public trendPoints: number = INDEX_TREND_POINTS;

  constructor(maxDays: number = INDEX_MAX_DAYS, samplesPerDay: number = INDEX_SAMPLES_PER_DAY,
    recentValid: number = INDEX_RECENT_VALID, trendPoints: number = INDEX_TREND_POINTS) {
    this.maxDays = maxDays;
    this.samplesPerDay = samplesPerDay;
    this.recentValid = recentValid;
    this.trendPoints = trendPoints;
  }

  /** 返回夹取后的副本；原对象不变。 */
  normalized(): IndexBounds {
    return new IndexBounds(clampInt(this.maxDays, 1, 3660), clampInt(this.samplesPerDay, 1, 500),
      clampInt(this.recentValid, 1, 100), clampInt(this.trendPoints, 1, 365));
  }

  describe(): string {
    const safe: IndexBounds = this.normalized();
    return `最多 ${safe.maxDays} 天｜每日 ${safe.samplesPerDay} 条样本｜最近 ${safe.recentValid} 条有效样本｜趋势 ${safe.trendPoints} 天`;
  }
}

/** 夹取整数到 [min, max]；非数值回落到 min。 */
function clampInt(value: number, min: number, max: number): number {
  if (!Number.isFinite(value)) {
    return min;
  }
  return Math.min(max, Math.max(min, Math.round(value)));
}

/**
 * 有界归档索引。
 *
 * days 始终按日期从新到旧；recentValid 按时间从新到旧。被索引窗口挡掉的记录
 * 计入 droppedEntries，被字段校验拒绝的记录计入 rejectedEntries——两者都不计入
 * total，索引只描述"真正进入窗口的部分"。
 */
export class ArchiveIndex {
  public bounds: IndexBounds = new IndexBounds();
  public offsetMinutes: number = 0;
  public builtAt: number = 0;
  public days: ArchiveDay[] = [];
  public total: number = 0;
  public success: number = 0;
  public failure: number = 0;
  public unsupported: number = 0;
  public timeout: number = 0;
  public unknown: number = 0;
  /** 与 ARCHIVE_SOURCES 下标对齐。 */
  public sourceCounts: number[] = [];
  /** 与 ARCHIVE_OUTCOMES 下标对齐。 */
  public outcomeCounts: number[] = [];
  public recentValid: ArchiveEntry[] = [];
  public newestAt: number = 0;
  public oldestAt: number = 0;
  public rejectedEntries: number = 0;
  public droppedEntries: number = 0;
  public droppedDays: number = 0;
  public notices: string[] = [];

  constructor() {
    this.sourceCounts = new Array<number>(ARCHIVE_SOURCES.length).fill(0);
    this.outcomeCounts = new Array<number>(ARCHIVE_OUTCOMES.length).fill(0);
  }

  /** 索引中是否没有任何记录。 */
  isEmpty(): boolean {
    return this.total === 0;
  }

  /** 有效样本数（成功 + 失败）。 */
  validCount(): number {
    return this.success + this.failure;
  }

  /** 最近一条有效样本的序号；没有时返回 -1。 */
  latestValidId(): number {
    return this.recentValid.length > 0 ? this.recentValid[0].id : -1;
  }

  /** 按日期取桶；不存在返回 undefined（空态与"无此日"由 dayDetail 区分说明）。 */
  dayOf(dayKey: string): ArchiveDay | undefined {
    return this.days.find((day: ArchiveDay): boolean => day.dayKey === dayKey);
  }

  /**
   * 查询某日详情。
   *
   * 返回的 samples 是索引内保留的副本，最多 bounds.samplesPerDay 条；truncated
   * 明确告知还有多少条只进了统计，避免页面把"样本数"误当成"当天总数"。
   */
  dayDetail(dayKey: string): ArchiveDayDetail {
    const detail: ArchiveDayDetail = new ArchiveDayDetail(dayKey);
    const day: ArchiveDay | undefined = this.dayOf(dayKey);
    if (day === undefined) {
      if (this.isEmpty()) {
        detail.notice = '归档为空，尚无任何日期索引';
      } else if (!isDayKey(dayKey)) {
        detail.notice = '日期格式应为 yyyy-MM-dd';
      } else {
        const newest: string = this.days.length > 0 ? this.days[0].dayKey : '-';
        const oldest: string = this.days.length > 0 ? this.days[this.days.length - 1].dayKey : '-';
        detail.notice = `没有该日期的记录（索引窗口 ${oldest} 至 ${newest}）`;
      }
      return detail;
    }
    detail.found = true;
    detail.total = day.total;
    detail.samples = day.samples.map((entry: ArchiveEntry): ArchiveEntry => entry.clone());
    detail.truncated = day.sampleTruncated();
    if (detail.truncated > 0) {
      detail.notice = `当天只保留最近 ${day.samples.length} 条样本`;
    }
    return detail;
  }

  /** 全局来源分布。 */
  sourceDistribution(includeZero: boolean = true): CountEntry[] {
    return distributionOf(ARCHIVE_SOURCES, this.sourceCounts, includeZero);
  }

  /** 全局结果分布。 */
  outcomeDistribution(includeZero: boolean = true): CountEntry[] {
    return distributionOf(ARCHIVE_OUTCOMES, this.outcomeCounts, includeZero);
  }

  /** 日期键列表，从新到旧。 */
  dayKeys(): string[] {
    return this.days.map((day: ArchiveDay): string => day.dayKey);
  }

  /**
   * 按来源/结果筛出有命中的日期桶；空串表示该维度不过滤。
   * 这里只筛日期桶，不筛样本——样本查询用 dayDetail。
   */
  matchDays(source: string, outcome: string): ArchiveDay[] {
    return this.days.filter((day: ArchiveDay): boolean => {
      if (source.length > 0 && day.sourceCount(source) === 0) {
        return false;
      }
      if (outcome.length > 0 && day.outcomeCount(outcome) === 0) {
        return false;
      }
      return true;
    });
  }

  /** 空态说明；非空返回空串，便于调用方 `if (text.length > 0)` 判断。 */
  emptyState(): string {
    if (!this.isEmpty()) {
      return '';
    }
    if (this.rejectedEntries > 0 && this.droppedEntries > 0) {
      return `归档为空：${this.rejectedEntries} 条记录无效，${this.droppedEntries} 条超出索引窗口`;
    }
    if (this.rejectedEntries > 0) {
      return `归档为空：${this.rejectedEntries} 条记录均未通过字段校验`;
    }
    if (this.droppedEntries > 0) {
      return `归档为空：${this.droppedEntries} 条记录全部超出 ${this.bounds.maxDays} 天索引窗口`;
    }
    return '归档为空：还没有任何归档记录';
  }

  /** 顶部摘要；空索引直接返回空态说明。 */
  caption(): string {
    if (this.isEmpty()) {
      return this.emptyState();
    }
    const dropped: string = this.droppedEntries > 0 ? `｜窗口外 ${this.droppedEntries} 条` : '';
    return `归档索引｜${this.days.length} 天｜${this.total} 条｜有效 ${this.validCount()} 条${dropped}`;
  }
}

/**
 * 构建索引。
 *
 * 记录先按时间倒序（同时间按序号倒序），再按本地日期入桶。排序让"最近样本"
 * 与"每日样本"都自然取到最新；天数上限之后的更早日期整段丢弃并计数，而不是
 * 只丢样本。offsetMinutes 由调用方决定，便于在用例中固定时区。
 */
export function buildArchiveIndex(entries: ArchiveEntry[], bounds: IndexBounds = new IndexBounds(),
  offsetMinutes: number = 0, now: number = 0): ArchiveIndex {
  const index: ArchiveIndex = new ArchiveIndex();
  index.bounds = bounds.normalized();
  index.offsetMinutes = Number.isFinite(offsetMinutes) ? offsetMinutes : 0;
  index.builtAt = Number.isFinite(now) && now > 0 ? now : 0;

  const sorted: ArchiveEntry[] = entries.slice();
  sorted.sort((left: ArchiveEntry, right: ArchiveEntry): number => {
    if (right.timestamp !== left.timestamp) {
      return right.timestamp - left.timestamp;
    }
    return right.id - left.id;
  });

  const droppedDayKeys: string[] = [];
  sorted.forEach((entry: ArchiveEntry): void => {
    if (!entry.isValid()) {
      index.rejectedEntries++;
      return;
    }
    const key: string = dayKeyOf(entry.timestamp, index.offsetMinutes);
    let day: ArchiveDay | undefined = index.days.find((item: ArchiveDay): boolean =>
      item.dayKey === key);
    if (day === undefined) {
      if (index.days.length >= index.bounds.maxDays) {
        index.droppedEntries++;
        if (droppedDayKeys.indexOf(key) < 0) {
          droppedDayKeys.push(key);
        }
        return;
      }
      day = new ArchiveDay(key, index.bounds.samplesPerDay);
      day.startMillis = dayStartMillis(key, index.offsetMinutes);
      day.endMillis = dayEndMillis(key, index.offsetMinutes);
      index.days.push(day);
    }
    day.add(entry);
    index.total++;
    switch (entry.outcome) {
      case QueryOutcome.SUCCESS:
        index.success++;
        break;
      case QueryOutcome.FAILURE:
        index.failure++;
        break;
      case QueryOutcome.UNSUPPORTED:
        index.unsupported++;
        break;
      case QueryOutcome.TIMEOUT:
        index.timeout++;
        break;
      default:
        index.unknown++;
        break;
    }
    if (index.newestAt === 0 || entry.timestamp > index.newestAt) {
      index.newestAt = entry.timestamp;
    }
    if (index.oldestAt === 0 || entry.timestamp < index.oldestAt) {
      index.oldestAt = entry.timestamp;
    }
    if (entry.isValidSample() && index.recentValid.length < index.bounds.recentValid) {
      index.recentValid.push(entry.clone());
    }
  });
  index.droppedDays = droppedDayKeys.length;

  index.days.forEach((day: ArchiveDay): void => {
    for (let index2 = 0; index2 < ARCHIVE_SOURCES.length; index2++) {
      index.sourceCounts[index2] += day.sourceCounts[index2];
    }
    index.outcomeCounts[0] += day.success;
    index.outcomeCounts[1] += day.failure;
    index.outcomeCounts[2] += day.unsupported;
    index.outcomeCounts[3] += day.timeout;
    index.outcomeCounts[4] += day.unknown;
  });

  if (index.rejectedEntries > 0) {
    index.notices.push(`已忽略 ${index.rejectedEntries} 条未通过字段校验的记录`);
  }
  if (index.droppedEntries > 0) {
    index.notices.push(`已丢弃 ${index.droppedEntries} 条超出 ${index.bounds.maxDays} 天索引窗口的记录` +
      `（涉及 ${index.droppedDays} 个日期）`);
  }
  if (index.total > 0) {
    index.notices.push(`每日最多保留 ${index.bounds.samplesPerDay} 条样本，其余只计入统计`);
  }
  const empty: string = index.emptyState();
  if (empty.length > 0) {
    index.notices.push(empty);
  }
  return index;
}

/** 从持久化记录直接建索引；无效记录由索引统一计数，不在此处提前吞掉。 */
export function buildArchiveIndexFromRecords(records: QueryRecord[], bounds: IndexBounds = new IndexBounds(),
  offsetMinutes: number = 0, now: number = 0): ArchiveIndex {
  const entries: ArchiveEntry[] = records.map((record: QueryRecord): ArchiveEntry =>
    archiveEntryOf(record));
  return buildArchiveIndex(entries, bounds, offsetMinutes, now);
}

/** 趋势方向。UNKNOWN 表示"数据不足"，不是"持平"。 */
export enum TrendDirection {
  RISING = 'rising',
  FALLING = 'falling',
  STABLE = 'stable',
  UNKNOWN = 'unknown'
}

/** 趋势方向标签。 */
export function trendDirectionLabel(direction: TrendDirection): string {
  switch (direction) {
    case TrendDirection.RISING:
      return '上升';
    case TrendDirection.FALLING:
      return '下降';
    case TrendDirection.STABLE:
      return '基本持平';
    default:
      return '数据不足';
  }
}

/** 趋势中的一天。 */
export class TrendPoint {
  public dayKey: string = '';
  public total: number = 0;
  public valid: number = 0;
  public successRate: number = 0;
  public failure: number = 0;

  constructor(dayKey: string = '', total: number = 0, valid: number = 0,
    successRate: number = 0, failure: number = 0) {
    this.dayKey = dayKey;
    this.total = total;
    this.valid = valid;
    this.successRate = successRate;
    this.failure = failure;
  }
}

/** 跨日趋势。points 按日期升序，最多 bounds.trendPoints 天。 */
export class ArchiveTrend {
  public points: TrendPoint[] = [];
  public direction: TrendDirection = TrendDirection.UNKNOWN;
  /** 后半段与前半段的平均成功率差值（百分点）。 */
  public deltaRate: number = 0;
  public sampleDays: number = 0;

  text(): string {
    if (this.points.length === 0) {
      return '趋势数据不足：归档为空';
    }
    if (this.direction === TrendDirection.UNKNOWN) {
      return `趋势数据不足：只有 ${this.sampleDays} 个有效样本日（至少需要 2 个）`;
    }
    const first: TrendPoint = this.points[0];
    const last: TrendPoint = this.points[this.points.length - 1];
    const sign: string = this.deltaRate >= 0 ? '+' : '';
    return `${first.dayKey} → ${last.dayKey}｜成功率 ${first.successRate}% → ${last.successRate}%` +
      `｜${trendDirectionLabel(this.direction)}（${sign}${this.deltaRate} 个百分点）`;
  }
}

/** 前后两半平均成功率。 */
function meanRate(points: TrendPoint[]): number {
  if (points.length === 0) {
    return 0;
  }
  const total: number = points.reduce((sum: number, point: TrendPoint): number =>
    sum + point.successRate, 0);
  return total / points.length;
}

/**
 * 计算跨日趋势。
 *
 * 只取最近 bounds.trendPoints 天，且只把"有有效样本"的日期算进趋势——只有超时或
 * 不支持的日期成功率恒为 0，混进来会把趋势误判成下降。变化超过 10 个百分点才
 * 判为上升/下降，其余算持平。
 */
export function buildTrend(index: ArchiveIndex): ArchiveTrend {
  const trend: ArchiveTrend = new ArchiveTrend();
  const ascending: ArchiveDay[] = index.days.slice().reverse();
  const limit: number = index.bounds.trendPoints;
  const start: number = Math.max(0, ascending.length - limit);
  trend.points = ascending.slice(start).map((day: ArchiveDay): TrendPoint =>
    new TrendPoint(day.dayKey, day.total, day.valid(), day.successRate(), day.failure));

  const validPoints: TrendPoint[] = trend.points.filter((point: TrendPoint): boolean => point.valid > 0);
  trend.sampleDays = validPoints.length;
  if (validPoints.length < 2) {
    return trend;
  }
  const middle: number = Math.floor(validPoints.length / 2);
  const firstHalf: number = meanRate(validPoints.slice(0, middle));
  const secondHalf: number = meanRate(validPoints.slice(middle));
  trend.deltaRate = Math.round((secondHalf - firstHalf) * 10) / 10;
  if (trend.deltaRate > 10) {
    trend.direction = TrendDirection.RISING;
  } else if (trend.deltaRate < -10) {
    trend.direction = TrendDirection.FALLING;
  } else {
    trend.direction = TrendDirection.STABLE;
  }
  return trend;
}
