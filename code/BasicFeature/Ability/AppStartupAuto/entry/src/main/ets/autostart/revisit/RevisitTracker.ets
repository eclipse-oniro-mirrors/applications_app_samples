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

import { formatResource, localText, recordValueLabel } from '../text/LocalizedText';
import { RecordValue } from '../RecordValues';

/**
 * 设置回访跟踪。
 *
 * 自启开关在系统设置里，应用无法直接感知用户是否真的改了设置。这里只做三件
 * 可验证的事：记录"何时离开、去了哪、何时回来"，回来后重新查询，并给出前后
 * 对比。全程不假装能读到系统设置的中间状态。
 */

import { QueryOutcome, QueryRecord, RefreshSource } from '../AutoStartupTypes';
import { normalizeRecord } from '../AutoStartupHistory';

/** 回访阶段。 */
export enum RevisitStage {
  /** 未开始。 */
  IDLE = 'idle',
  /** 已展示指引，等待用户离开。 */
  GUIDED = 'guided',
  /** 已离开应用。 */
  LEFT = 'left',
  /** 已返回应用。 */
  RETURNED = 'returned',
  /** 返回后已重新查询。 */
  RECHECKED = 'rechecked',
  /** 用户取消。 */
  CANCELLED = 'cancelled',
  /** 离开后超过等待上限仍未返回。 */
  EXPIRED = 'expired'
}

/** 一次回访的完整事实。 */
export class RevisitSession {
  public sessionId: string = '';
  public createdAt: number = 0;
  public expectedQueryId: number = 0;
  public lastQueryId: number = 0;
  public stage: RevisitStage = RevisitStage.IDLE;
  /** 离开时间。 */
  public leftAt: number = 0;
  /** 返回时间。 */
  public returnedAt: number = 0;
  /** 重新查询完成时间。 */
  public recheckedAt: number = 0;
  /** 离开前样本。 */
  public before: QueryRecord | undefined = undefined;
  /** 返回后样本。 */
  public after: QueryRecord | undefined = undefined;
  /** Bounded retry facts; old schema-1 snapshots may omit this field. */
  public attempts: QueryRecord[] = [];
  /** 引导文案版本，便于判断"用户看的是哪一版指引"。 */
  public guidanceRevision: number = 1;
  /** 是否由用户主动取消。 */
  public cancelled: boolean = false;
  /** 结论：改变 / 未改变 / 无法判断。 */
  public conclusion: string = localText('startup_text_0619');

  clone(): RevisitSession {
    const copy: RevisitSession = new RevisitSession();
    copy.sessionId = this.sessionId;
    copy.createdAt = this.createdAt;
    copy.expectedQueryId = this.expectedQueryId;
    copy.lastQueryId = this.lastQueryId;
    copy.stage = this.stage;
    copy.leftAt = this.leftAt;
    copy.returnedAt = this.returnedAt;
    copy.recheckedAt = this.recheckedAt;
    copy.before = this.before === undefined ? undefined : this.before.clone();
    copy.after = this.after === undefined ? undefined : this.after.clone();
    copy.attempts = this.attempts.map((record: QueryRecord): QueryRecord => record.clone());
    copy.guidanceRevision = this.guidanceRevision;
    copy.cancelled = this.cancelled;
    copy.conclusion = this.conclusion;
    return copy;
  }
}

/** 前后对比结果。 */
export class RevisitComparison {
  public comparable: boolean = false;
  public changed: boolean = false;
  public beforeValue: string = '';
  public afterValue: string = '';
  /** 无法比较时的原因。 */
  public reason: string = '';
  /** 间隔毫秒；任一侧缺失时为 0。 */
  public elapsed: number = 0;

  summary(): string {
    if (!this.comparable) {
      return formatResource('startup_format_281a18257fa1', [String(this.reason)]);
    }
    return this.changed ? formatResource('startup_format_c9944c764225', [String(recordValueLabel(this.beforeValue)), String(recordValueLabel(this.afterValue))]) :
      formatResource('startup_format_d4a54bda281d', [String(recordValueLabel(this.afterValue))]);
  }
}

/** 离开后等待返回的上限，超过即判过期。 */
export const REVISIT_TIMEOUT_MS: number = 10 * 60 * 1000;
export const REVISIT_ARCHIVE_LIMIT: number = 10;
export const REVISIT_ARCHIVE_AGE_MS: number = 30 * 24 * 60 * 60 * 1000;
export const REVISIT_ATTEMPT_LIMIT: number = 5;

/** 结果值归一化；null 表示"没查到"，不能当成 false。 */
export function valueText(value: boolean | null): string {
  if (value === null) {
    return RecordValue.NOT_QUERIED;
  }
  return value ? RecordValue.ENABLED : RecordValue.DISABLED;
}

/** 单条记录是否可作为对比依据。 */
export function isComparableRecord(record: QueryRecord | undefined): boolean {
  if (record === undefined) {
    return false;
  }
  if (record.outcome !== QueryOutcome.SUCCESS) {
    return false;
  }
  return record.result === RecordValue.ENABLED || record.result === RecordValue.DISABLED;
}

/** 对比两条样本。任一侧不是有效成功样本时明确给出原因。 */
export function compareSamples(before: QueryRecord | undefined,
  after: QueryRecord | undefined): RevisitComparison {
  const comparison: RevisitComparison = new RevisitComparison();
  if (before === undefined) {
    comparison.reason = localText('startup_text_0623');
    return comparison;
  }
  if (after === undefined) {
    comparison.reason = localText('startup_text_0624');
    return comparison;
  }
  if (!isComparableRecord(before)) {
    comparison.reason = formatResource('startup_format_76f9984881c9', [String(before.outcome as string)]);
    return comparison;
  }
  if (!isComparableRecord(after)) {
    comparison.reason = formatResource('startup_format_37b386bb4012', [String(after.outcome as string)]);
    return comparison;
  }
  comparison.comparable = true;
  comparison.beforeValue = before.result;
  comparison.afterValue = after.result;
  comparison.changed = before.result !== after.result;
  comparison.elapsed = Math.max(0, after.timestamp - before.timestamp);
  return comparison;
}

class RevisitArchive {
  public schema: number = 1;
  public session: RevisitSession = new RevisitSession();
  public sessions?: RevisitSession[];
  public serial?: number;
}

/** 回访协调器：只推进状态，不读写系统设置。 */
export class RevisitTracker {
  private session: RevisitSession = new RevisitSession();
  private serial: number = 0;
  private lastNotice: string = '';
  private sessions: RevisitSession[] = [];

  archived(): RevisitSession[] {
    return this.sessions.map((session: RevisitSession): RevisitSession => session.clone());
  }

  private archiveTerminal(now: number): void {
    const stage = this.session.stage;
    if (stage !== RevisitStage.RECHECKED && stage !== RevisitStage.CANCELLED && stage !== RevisitStage.EXPIRED) {
      return;
    }
    const id = this.session.sessionId;
    if (id.length === 0) { return; }
    this.sessions = this.sessions.filter((item: RevisitSession): boolean => item.sessionId !== id &&
      now - item.recheckedAt <= REVISIT_ARCHIVE_AGE_MS);
    if (now - this.session.recheckedAt > REVISIT_ARCHIVE_AGE_MS) { return; }
    this.sessions.unshift(this.session.clone());
    this.sessions = this.sessions.slice(0, REVISIT_ARCHIVE_LIMIT);
  }

  /** 开始一轮回访：记录离开前样本。 */
  begin(before: QueryRecord | undefined, guidanceRevision: number, now: number): RevisitSession {
    this.archiveTerminal(now);
    this.serial += 1;
    const created: RevisitSession = new RevisitSession();
    created.sessionId = `revisit-${now}-${this.serial}`;
    created.createdAt = now;
    created.stage = RevisitStage.GUIDED;
    created.before = before === undefined ? undefined : before.clone();
    created.guidanceRevision = guidanceRevision;
    created.conclusion = localText('startup_text_0619');
    this.session = created;
    this.lastNotice = localText('startup_text_0627');
    return created.clone();
  }

  /** 仅 UIAbility.onBackground 确认离开。普通页面跳转不是系统设置离开。 */
  markLeft(now: number): RevisitSession {
    const current: RevisitSession = this.session;
    if (current.stage !== RevisitStage.GUIDED) {
      this.lastNotice = formatResource('startup_format_0fd646867503', [String(current.stage as string)]);
      return current.clone();
    }
    current.stage = RevisitStage.LEFT;
    current.leftAt = now;
    this.lastNotice = localText('startup_text_0630');
    return current.clone();
  }

  /** 用户返回应用。 */
  markReturned(now: number): RevisitSession {
    const current: RevisitSession = this.session;
    if (current.stage !== RevisitStage.LEFT) {
      this.lastNotice = formatResource('startup_format_8bc74e078a5a', [String(current.stage as string)]);
      return current.clone();
    }
    this.checkExpiry(now);
    // checkExpiry 会改写会话阶段，必须重新读取而不能依赖局部变量的旧收窄结果。
    if (this.session.stage === RevisitStage.EXPIRED) {
      return this.session.clone();
    }
    current.stage = RevisitStage.RETURNED;
    current.returnedAt = now;
    this.lastNotice = localText('startup_text_0632');
    return current.clone();
  }

  /** 返回后完成重新查询。 */
  markRechecked(after: QueryRecord | undefined, now: number): RevisitSession {
    const current: RevisitSession = this.session;
    if (current.stage !== RevisitStage.RETURNED) {
      this.lastNotice = formatResource('startup_format_8b42835338f8', [String(current.stage as string)]);
      return current.clone();
    }
    current.stage = RevisitStage.RECHECKED;
    current.recheckedAt = now;
    current.after = after === undefined ? undefined : after.clone();
    if (after !== undefined) {
      current.attempts.push(after.clone());
      current.attempts = current.attempts.slice(-REVISIT_ATTEMPT_LIMIT);
    }
    current.conclusion = compareSamples(current.before, current.after).summary();
    this.lastNotice = localText('startup_text_0634');
    this.archiveTerminal(now);
    return current.clone();
  }

  bindQuery(id: number): void {
    if (this.session.stage === RevisitStage.RETURNED && this.session.expectedQueryId === 0 &&
      Number.isSafeInteger(id) && id > 0) {
      this.session.expectedQueryId = id;
      this.session.lastQueryId = id;
    }
  }

  acceptQuery(sessionId: string, record: QueryRecord, now: number): boolean {
    this.checkExpiry(now);
    if (this.session.sessionId === sessionId && this.session.stage === RevisitStage.RETURNED &&
      record.id === this.session.expectedQueryId && record.source === RefreshSource.SETTINGS &&
      record.timestamp >= this.session.returnedAt) {
      this.markRechecked(record, now);
      return true;
    }
    return false;
  }

  clearNativeBinding(): void {
    if (this.session.stage === RevisitStage.RETURNED) { this.session.expectedQueryId = 0; }
  }

  retry(): boolean {
    if (this.session.stage === RevisitStage.RECHECKED && !this.isCompleted()) {
      this.session.stage = RevisitStage.RETURNED;
      this.session.expectedQueryId = 0;
      return true;
    }
    return this.session.stage === RevisitStage.RETURNED;
  }

  /** 用户取消。取消不产生对比，也不写入历史。 */
  cancel(now: number): RevisitSession {
    const current: RevisitSession = this.session;
    if (current.stage === RevisitStage.IDLE || current.stage === RevisitStage.CANCELLED ||
      current.stage === RevisitStage.EXPIRED || (current.stage === RevisitStage.RECHECKED && this.isCompleted())) {
      return current.clone();
    }
    current.expectedQueryId = 0;
    current.stage = RevisitStage.CANCELLED;
    current.cancelled = true;
    current.recheckedAt = now;
    current.conclusion = localText('startup_text_0635');
    this.lastNotice = localText('startup_text_0636');
    this.archiveTerminal(now);
    return current.clone();
  }

  /** 检查是否已超过等待上限。 */
  checkExpiry(now: number): RevisitSession {
    const current: RevisitSession = this.session;
    if ((current.stage !== RevisitStage.LEFT && current.stage !== RevisitStage.RETURNED &&
      !(current.stage === RevisitStage.RECHECKED && !this.isCompleted())) || current.leftAt <= 0) {
      return current.clone();
    }
    if (now - current.leftAt < REVISIT_TIMEOUT_MS) {
      return current.clone();
    }
    current.stage = RevisitStage.EXPIRED;
    current.expectedQueryId = 0;
    current.recheckedAt = now;
    current.conclusion = localText('startup_text_0637');
    this.lastNotice = localText('startup_text_0638');
    this.archiveTerminal(now);
    return current.clone();
  }

  /** 是否可以把当前轮次计入"回访完成"。 */
  isCompleted(): boolean {
    return this.session.stage === RevisitStage.RECHECKED &&
      compareSamples(this.session.before, this.session.after).comparable;
  }

  /** 当前是否允许发起"去设置"入口。 */
  canGuide(): boolean {
    return this.session.stage === RevisitStage.IDLE || this.session.stage === RevisitStage.CANCELLED ||
      this.session.stage === RevisitStage.EXPIRED || this.session.stage === RevisitStage.RECHECKED;
  }

  /** 生成一条"设置后查询"来源的记录所需字段。 */
  sourceForRecord(): RefreshSource {
    return RefreshSource.SETTINGS;
  }

  snapshot(): RevisitSession {
    return this.session.clone();
  }

  notice(): string {
    return this.lastNotice;
  }

  /** 回访一句话结论，供页面直接展示。 */
  conclusionText(): string {
    return this.session.conclusion;
  }

  /** 是否处于"用户已离开、尚未返回"的可等待状态。 */
  isWaiting(): boolean {
    return this.session.stage === RevisitStage.LEFT;
  }

  /** 距离过期的剩余毫秒；不在等待态返回 -1。 */
  remainingMillis(now: number): number {
    if (this.session.stage !== RevisitStage.LEFT || this.session.leftAt <= 0) {
      return -1;
    }
    return Math.max(0, REVISIT_TIMEOUT_MS - (now - this.session.leftAt));
  }

  /** Separate bounded JSON schema 1, not the illustrative TSV history schema. */
  serialize(): string {
    const stored = new RevisitArchive();
    stored.session = this.session;
    stored.sessions = this.sessions;
    stored.serial = this.serial;
    return JSON.stringify(stored);
  }

  restore(raw: string, now: number): void {
    if (raw.length === 0) { this.reset(); this.sessions = []; return; }
    if (raw.length > 256000) { throw new Error('Invalid revisit size'); }
    const stored = JSON.parse(raw) as RevisitArchive;
    if (stored === null || typeof stored !== 'object' || stored.schema !== 1 ||
      (stored.sessions !== undefined && (!Array.isArray(stored.sessions) ||
        stored.sessions.length > REVISIT_ARCHIVE_LIMIT)) ||
      (stored.serial !== undefined && (!Number.isSafeInteger(stored.serial) || stored.serial < 0 ||
        stored.serial >= Number.MAX_SAFE_INTEGER))) {
      throw new Error('Invalid revisit archive');
    }
    const current = this.decodeSession(stored.session, now);
    const seen = new Set<string>();
    const archived: RevisitSession[] = [];
    const items: RevisitSession[] = stored.sessions === undefined ? [] : stored.sessions;
    items.forEach((item: RevisitSession): void => {
      const copy = this.decodeSession(item, now);
      if (seen.has(copy.sessionId) || (copy.stage !== RevisitStage.RECHECKED &&
        copy.stage !== RevisitStage.CANCELLED && copy.stage !== RevisitStage.EXPIRED)) {
        throw new Error('Invalid terminal revisit');
      }
      seen.add(copy.sessionId);
      if (now - copy.recheckedAt <= REVISIT_ARCHIVE_AGE_MS) { archived.push(copy); }
    });
    // Commit only after the complete archive validates; a failed read cannot erase memory.
    this.session = current;
    this.sessions = archived;
    this.serial = stored.serial === undefined ? 0 : stored.serial;
    [current].concat(archived).forEach((item: RevisitSession): void => {
      const tail = Number(item.sessionId.split('-').pop());
      if (Number.isSafeInteger(tail) && tail > this.serial && tail < Number.MAX_SAFE_INTEGER) { this.serial = tail; }
    });
    this.checkExpiry(now);
    this.archiveTerminal(now);
    this.lastNotice = localText('startup_text_0639');
  }

  private decodeSession(item: RevisitSession, now: number): RevisitSession {
    const stages: string[] = [RevisitStage.IDLE, RevisitStage.GUIDED, RevisitStage.LEFT,
      RevisitStage.RETURNED, RevisitStage.RECHECKED, RevisitStage.CANCELLED, RevisitStage.EXPIRED];
    if (item === null || typeof item !== 'object' ||
      typeof item.sessionId !== 'string' || item.sessionId.length > 100 ||
      stages.indexOf(item.stage) < 0 || typeof item.cancelled !== 'boolean' ||
      typeof item.conclusion !== 'string' || item.conclusion.length > 512 ||
      !Number.isSafeInteger(item.expectedQueryId) || item.expectedQueryId < 0 ||
      !Number.isSafeInteger(item.guidanceRevision) || item.guidanceRevision < 1) {
      throw new Error('Invalid revisit archive');
    }
    const times: number[] = [item.createdAt, item.leftAt, item.returnedAt, item.recheckedAt];
    if (times.some((time: number): boolean => !Number.isFinite(time) || time < 0 || time > now)) {
      throw new Error('Invalid revisit times');
    }
    const copy = new RevisitSession();
    copy.sessionId = item.sessionId;
    copy.createdAt = item.createdAt;
    copy.stage = item.stage;
    copy.leftAt = item.leftAt;
    copy.returnedAt = item.returnedAt;
    copy.recheckedAt = item.recheckedAt;
    copy.before = item.before === undefined ? undefined : normalizeRecord(item.before);
    copy.after = item.after === undefined ? undefined : normalizeRecord(item.after);
    if ((item.before !== undefined && copy.before === undefined) ||
      (item.after !== undefined && copy.after === undefined) ||
      (copy.stage === RevisitStage.LEFT && copy.leftAt === 0) ||
      (copy.stage === RevisitStage.RETURNED && copy.returnedAt < copy.leftAt)) {
      throw new Error('Invalid revisit samples');
    }
    if (item.attempts !== undefined &&
      (!Array.isArray(item.attempts) || item.attempts.length > REVISIT_ATTEMPT_LIMIT)) {
      throw new Error('Invalid revisit attempts');
    }
    const attempts: QueryRecord[] = item.attempts === undefined ? [] : item.attempts;
    const ids = new Set<number>();
    attempts.forEach((record: QueryRecord): void => {
      const attempt = normalizeRecord(record);
      if (attempt === undefined || ids.has(attempt.id) || attempt.source !== RefreshSource.SETTINGS ||
        attempt.timestamp < copy.returnedAt || attempt.timestamp > now) { throw new Error('Invalid revisit attempt'); }
      ids.add(attempt.id);
      copy.attempts.push(attempt);
    });
    if (copy.after !== undefined && (copy.after.source !== RefreshSource.SETTINGS ||
      copy.after.timestamp < copy.returnedAt || copy.after.timestamp > now ||
      (copy.before !== undefined && copy.after.id === copy.before.id))) { throw new Error('Invalid revisit after'); }
    if (copy.before !== undefined && copy.before.timestamp > copy.createdAt) {
      throw new Error('Invalid revisit before');
    }
    if (copy.leftAt > 0 && copy.leftAt < copy.createdAt) { throw new Error('Invalid revisit departure'); }
    if ((copy.stage === RevisitStage.RETURNED || copy.stage === RevisitStage.RECHECKED) &&
      (copy.leftAt === 0 || copy.returnedAt < copy.leftAt)) { throw new Error('Invalid revisit return'); }
    copy.guidanceRevision = item.guidanceRevision;
    copy.cancelled = item.cancelled;
    if (copy.cancelled !== (copy.stage === RevisitStage.CANCELLED)) { throw new Error('Invalid cancellation fact'); }
    if (copy.stage === RevisitStage.EXPIRED && copy.recheckedAt === 0) {
      copy.recheckedAt = Math.min(now, copy.leftAt + REVISIT_TIMEOUT_MS); // Legacy schema-1 expiry had no ended time.
    }
    copy.lastQueryId = item.lastQueryId === undefined ? item.expectedQueryId : item.lastQueryId;
    if (!Number.isSafeInteger(copy.lastQueryId) || copy.lastQueryId < 0 ||
      copy.lastQueryId >= Number.MAX_SAFE_INTEGER) {
      throw new Error('Invalid allocated revisit query');
    }
    copy.lastQueryId = Math.max(copy.lastQueryId, item.expectedQueryId);
    copy.expectedQueryId = 0; // No native request survives process death.
    copy.conclusion = localText('startup_text_0619');
    if (copy.stage === RevisitStage.RECHECKED) { copy.conclusion = compareSamples(copy.before, copy.after).summary(); }
    if (copy.stage === RevisitStage.CANCELLED) { copy.conclusion = localText('startup_text_0635'); }
    if (copy.stage === RevisitStage.EXPIRED) { copy.conclusion = localText('startup_text_0637'); }
    return copy;
  }

  /** 重置为初始状态。 */
  reset(): void {
    this.session = new RevisitSession();
    this.lastNotice = '';
  }
}
