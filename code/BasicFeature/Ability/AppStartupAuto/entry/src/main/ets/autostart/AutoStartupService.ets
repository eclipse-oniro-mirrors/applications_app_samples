import { BusinessError } from '@kit.BasicServicesKit';
import { AutoStartupApi, QueryClock, SystemQueryClock, systemAutoStartupApi, elapsedNow } from './AutoStartupRuntime';
import { RevisitSession, RevisitStage, RevisitTracker, REVISIT_TIMEOUT_MS } from './revisit/RevisitTracker';
import { StartupTelemetry, SystemStartupTelemetry, safeBegin, safeEnd, safeEvent } from './Telemetry';
import { HistoryFilter, HistoryScope, scopedHistory } from './history/HistoryView';
import { QueryOutcome, QueryPhase, QueryRecord, QueryRecordSink, QuerySnapshot, RefreshSource, SupportState } from './AutoStartupTypes';
import {
  boundedMessage, compareLatestRecords, exportRedacted, filterHistory, filterHistoryAdvanced,
  HistoryComparison, HistoryLoadResult, HistoryStorage, HistorySummary, parseHistory, serializeHistory, summarizeHistory
} from './AutoStartupHistory';

class QueryAttempt {
  id: number;
  source: RefreshSource;
  startedAt: number;
  terminal: boolean = false;
  public revisitId: string = '';

  constructor(id: number, source: RefreshSource, startedAt: number) {
    this.id = id;
    this.source = source;
    this.startedAt = startedAt;
  }
}

export class AutoStartupService {
  private api: AutoStartupApi;
  private clock: QueryClock;
  private current: QuerySnapshot = new QuerySnapshot();
  private history: QueryRecord[] = [];
  private listeners: (() => void)[] = [];
  private attempt: QueryAttempt | null = null;
  private nextId: number = 0;
  private timeoutId: number = -1;
  private foreground: boolean = false;
  private disposed: boolean = false;
  private deferredRefresh: RefreshSource | null = null;
  private historyStore: HistoryStorage | undefined = undefined;
  private historyChain: Promise<void> = Promise.resolve();
  private historyMessage: string = '';
  private historyFilter: string = '全部';
  private historyWriteSeq: number = 0;
  private historyReadFailed: boolean = false;
  private historyStorageEpoch: number = 0;
  private historyWritesPending: number = 0;
  private revisit: RevisitTracker = new RevisitTracker();
  private revisitStore: HistoryStorage | undefined = undefined;
  private revisitChain: Promise<void> = Promise.resolve();
  private revisitSaveNotice: string = '';
  private revisitWriteSeq: number = 0;
  private revisitReadFailed: boolean = false;
  private revisitStorageEpoch: number = 0;
  private revisitWritesPending: number = 0;
  private telemetry: StartupTelemetry;
  private recordSink: QueryRecordSink | undefined = undefined;
  private recordSinkNotice: string = '';

  constructor(api: AutoStartupApi = systemAutoStartupApi, clock: QueryClock = new SystemQueryClock(),
    historyStore?: HistoryStorage, telemetry: StartupTelemetry = new SystemStartupTelemetry()) {
    this.api = api;
    this.clock = clock;
    this.telemetry = telemetry;
    if (historyStore !== undefined) {
      this.attachHistory(historyStore);
    }
  }

  snapshot(): QuerySnapshot {
    return this.current.clone();
  }

  /** Invoked once for an actual terminal record, before the live ring can evict it. */
  attachRecordSink(sink: QueryRecordSink | undefined): void {
    this.recordSink = sink;
    this.recordSinkNotice = '';
  }

  records(filter: string = ''): QueryRecord[] {
    const all: QueryRecord[] = this.history.map((record: QueryRecord): QueryRecord => record.clone());
    return filterHistory(all, filter);
  }

  historyNotice(): string {
    return [this.historyMessage, this.recordSinkNotice].filter((line: string): boolean => line.length > 0).join('\n');
  }

  currentHistoryFilter(): string {
    return this.historyFilter;
  }

  setHistoryFilter(filter: string): void {
    this.historyFilter = filter;
    this.notify();
  }

  exportHistory(): string {
    return exportRedacted(this.history, this.clock.now());
  }

  historySummary(): HistorySummary {
    return summarizeHistory(this.history, this.clock.now());
  }

  historyComparison(): HistoryComparison {
    return compareLatestRecords(this.history);
  }

  filteredHistory(source: string, outcome: string, fromMillis: number, toMillis: number): QueryRecord[] {
    const rows: QueryRecord[] = this.history.map((record: QueryRecord): QueryRecord => record.clone());
    return filterHistoryAdvanced(rows, source, outcome, fromMillis, toMillis);
  }

  historyScope(filter: HistoryFilter, beforeId: number = 0, afterId: number = 0): HistoryScope {
    return scopedHistory(this.history, filter, this.clock.now(), beforeId, afterId);
  }

  latestValidRecord(): QueryRecord | undefined {
    const found = this.history.find((record: QueryRecord): boolean =>
      record.outcome === QueryOutcome.SUCCESS);
    return found === undefined ? undefined : found.clone();
  }

  whenSaved(): Promise<void> {
    return this.historyChain;
  }

  /** Attaches durable storage and restores the last bounded snapshot synchronously. */
  attachHistory(store: HistoryStorage): void {
    this.historyStore = store;
    const epoch = ++this.historyStorageEpoch;
    if (this.historyWritesPending > 0) {
      // Native writes cannot be cancelled. Drain the active write, invalidate queued
      // snapshots, then read the actual disk value rather than an obsolete value.
      this.historyReadFailed = true;
      this.historyMessage = '历史写入尚在结束，完成后重新读取；此期间不覆盖存档';
      this.historyChain = this.historyChain.then((): void => {
        if (epoch !== this.historyStorageEpoch || store !== this.historyStore) { return; }
        this.restoreHistory();
        this.notify();
      });
    } else {
      this.restoreHistory();
    }
    this.notify();
  }

  revisitSnapshot(): RevisitSession { return this.revisit.snapshot(); }
  revisitNotice(): string { return this.revisitSaveNotice || this.revisit.notice(); }
  whenRevisitSaved(): Promise<void> { return this.revisitChain; }
  revisitArchive(): RevisitSession[] { return this.revisit.archived(); }
  revisitReadBlocked(): boolean { return this.revisitReadFailed; }

  private rebaseFromRevisit(): void {
    const sessions = [this.revisit.snapshot()].concat(this.revisit.archived());
    sessions.forEach((item: RevisitSession): void => {
      this.nextId = Math.max(this.nextId, item.lastQueryId);
      const samples = item.attempts.slice();
      if (item.before !== undefined) { samples.push(item.before); }
      if (item.after !== undefined) { samples.push(item.after); }
      samples.forEach((sample: QueryRecord): void => { this.nextId = Math.max(this.nextId, sample.id); });
    });
  }

  attachRevisit(store: HistoryStorage): void {
    this.revisitStore = store;
    const epoch = ++this.revisitStorageEpoch;
    if (this.revisitWritesPending > 0) {
      // A native flush already in progress cannot be cancelled. Invalidate queued snapshots,
      // wait for that flush, then explicitly reread the actual disk value before unblocking.
      this.revisitReadFailed = true;
      this.revisitSaveNotice = '回访写入尚在结束，完成后重新读取；此期间不覆盖存档';
      this.revisitChain = this.revisitChain.then((): void => this.readRevisit(store, epoch));
      this.notify();
      return;
    }
    this.readRevisit(store, epoch);
  }

  private readRevisit(store: HistoryStorage, epoch: number): void {
    if (epoch !== this.revisitStorageEpoch || store !== this.revisitStore) { return; }
    try {
      this.revisit.restore(store.read(), this.clock.now());
      this.revisitReadFailed = false;
      this.rebaseFromRevisit();
      this.revisitSaveNotice = '';
      if (this.foreground) { this.resumeRevisit(); }
      safeEvent(this.telemetry, 'revisit_restore', 0, 'success');
    } catch (_) {
      this.revisitReadFailed = true;
      this.revisitSaveNotice = '回访读取失败或存档无效；暂停回访写入，请重试读取，原存档未覆盖';
      safeEvent(this.telemetry, 'revisit_restore', 0, 'failure');
    }
    this.notify();
  }

  retryRevisitRead(): void {
    if (this.revisitStore !== undefined && this.revisitReadFailed) {
      this.attachRevisit(this.revisitStore);
    }
  }

  /** UI requires explicit confirmation before replacing unread/corrupt private data. */
  discardUnreadRevisit(): void {
    if (!this.revisitReadFailed) { return; }
    this.revisitStorageEpoch++;
    this.revisit = new RevisitTracker();
    this.revisitReadFailed = false;
    this.revisitSaveNotice = '';
    this.persistRevisit();
    safeEvent(this.telemetry, 'revisit_reset', 0, 'explicit_discard');
    this.notify();
  }

  /** Explicit arming: opening the guidance page alone does not create a session. */
  beginRevisit(): boolean {
    if (this.revisitReadFailed) { this.notify(); return false; }
    const before = this.history[0];
    if (this.attempt !== null || !this.revisit.canGuide() || before === undefined ||
      before.outcome !== QueryOutcome.SUCCESS || this.clock.now() - before.timestamp > REVISIT_TIMEOUT_MS) {
      this.revisitSaveNotice = '请先完成一次成功刷新（10分钟内），取消旧回访后再开始';
      this.notify();
      return false;
    }
    this.revisit.begin(before, 2, this.clock.now());
    this.revisitSaveNotice = '';
    safeEvent(this.telemetry, 'revisit_arm', before.id, 'guided');
    this.persistRevisit();
    this.notify();
    return true;
  }

  cancelRevisit(): void {
    if (this.revisitReadFailed) { return; }
    this.revisit.cancel(this.clock.now());
    this.deferredRefresh = null;
    this.persistRevisit();
    safeEvent(this.telemetry, 'revisit_cancel', 0, 'cancelled');
    this.notify();
  }

  retryRevisitQuery(): void {
    if (this.revisitReadFailed) { return; }
    this.revisit.checkExpiry(this.clock.now());
    if (this.attempt === null && this.revisit.retry()) {
      this.refresh(RefreshSource.SETTINGS);
    }
    this.persistRevisit();
    this.notify();
  }

  retryPersistence(): void {
    this.persistHistory();
    this.persistRevisit();
  }

  /** Retry a failed read without discarding queries already collected in memory. */
  retryHistoryRead(): void {
    const store = this.historyStore;
    if (store === undefined || this.attempt !== null || this.historyWritesPending > 0 || !this.historyReadFailed) {
      return;
    }
    try {
      const loaded = parseHistory(store.read(), this.clock.now());
      const live = this.history.map((row: QueryRecord): QueryRecord => row.clone());
      const used = new Set<number>(live.map((row: QueryRecord): number => row.id));
      let maximum = Math.max(this.nextId,
        loaded.records.reduce((max: number, row: QueryRecord): number => Math.max(max, row.id), 0));
      loaded.records.forEach((row: QueryRecord): void => {
        if (used.has(row.id)) { row.id = ++maximum; }
        used.add(row.id);
      });
      this.historyReadFailed = false;
      this.history = live.concat(loaded.records).sort((a: QueryRecord, b: QueryRecord): number =>
        b.timestamp - a.timestamp).slice(0, 20);
      this.rebaseNextId();
      this.historyMessage = loaded.notice;
      this.persistHistory();
    } catch (_) { this.historyMessage = '历史记录读取失败，可重试读取；内存结果保留'; }
    this.notify();
  }

  private persistRevisit(): void {
    const store = this.revisitStore;
    if (store === undefined || this.revisitReadFailed) { return; }
    const raw = this.revisit.serialize();
    const sequence = ++this.revisitWriteSeq;
    const epoch = this.revisitStorageEpoch;
    this.revisitWritesPending++;
    this.revisitChain = this.revisitChain.then(async (): Promise<void> => {
      if (this.revisitReadFailed || this.revisitStore !== store || epoch !== this.revisitStorageEpoch) {
        this.revisitWritesPending--;
        return;
      }
      try {
        await store.write(raw);
        if (sequence === this.revisitWriteSeq && epoch === this.revisitStorageEpoch) { this.revisitSaveNotice = ''; }
        safeEvent(this.telemetry, 'revisit_save', sequence, 'success');
      } catch (_) {
        if (sequence === this.revisitWriteSeq && epoch === this.revisitStorageEpoch) {
          this.revisitSaveNotice = '回访保存失败，可重试保存；内存流程仍可继续';
        }
        safeEvent(this.telemetry, 'revisit_save', sequence, 'failure');
      } finally { this.revisitWritesPending--; }
      this.notify();
    });
  }

  subscribe(listener: () => void): () => void {
    this.disposed = false;
    const subscription = (): void => listener();
    this.listeners.push(subscription);
    return (): void => {
      const index = this.listeners.indexOf(subscription);
      if (index >= 0) {
        this.listeners.splice(index, 1);
      }
    };
  }

  refresh(source: RefreshSource): void {
    if (this.disposed) {
      return;
    }
    if (source === RefreshSource.INITIAL) {
      if (this.current.phase !== QueryPhase.IDLE) { return; }
      this.foreground = true;
      if (!this.revisitReadFailed && this.revisit.snapshot().stage === RevisitStage.LEFT) {
        this.revisit.markReturned(this.clock.now());
        this.persistRevisit();
      }
      if (!this.revisitReadFailed && this.revisit.snapshot().stage === RevisitStage.RETURNED) {
        source = RefreshSource.SETTINGS;
      }
    }
    const session = this.revisit.snapshot();
    if (source === RefreshSource.SETTINGS && session.sessionId.length > 0) {
      if (this.revisitReadFailed || session.stage !== RevisitStage.RETURNED) { return; }
      if (this.attempt !== null && !this.attempt.terminal && this.attempt.revisitId === session.sessionId) {
        return; // Explicit recheck + repeated foreground must not queue a second query for the same return.
      }
    }
    if (this.attempt !== null) {
      if ((source === RefreshSource.FOREGROUND || source === RefreshSource.SETTINGS) &&
        this.deferredRefresh !== RefreshSource.SETTINGS) {
        this.deferredRefresh = source;
      }
      return;
    }
    this.deferredRefresh = null;
    const next = new QuerySnapshot();
    next.lastValue = this.current.lastValue;
    next.lastSampleTime = this.current.lastSampleTime;
    next.phase = QueryPhase.CHECKING;
    next.pending = true;
    this.current = next;
    const attempt = new QueryAttempt(this.reserveId(), source, elapsedNow(this.clock));
    if (source === RefreshSource.SETTINGS && this.revisit.snapshot().stage === RevisitStage.RETURNED) {
      attempt.revisitId = this.revisit.snapshot().sessionId;
      this.revisit.bindQuery(attempt.id);
      this.persistRevisit();
    }
    this.attempt = attempt;
    safeBegin(this.telemetry, 'query', attempt.id);
    try {
      const supported = this.api.isAutoStartupSupported();
      this.current.supportResult = supported ? 'true' : 'false';
      if (!supported) {
        this.current.phase = QueryPhase.UNSUPPORTED;
        this.current.support = SupportState.UNSUPPORTED;
        this.current.statusResult = '未调用';
        this.appendRecord(attempt, '设备不支持');
        this.release(attempt);
        return;
      }
      this.current.support = SupportState.SUPPORTED;
      this.current.phase = QueryPhase.QUERYING;
      this.current.statusResult = '调用中';
      const request = this.api.getAutoStartupStatusForSelf();
      this.timeoutId = this.clock.setTimeout((): void => this.onTimeout(attempt), 5000);
      request.then((value: boolean): void => {
        this.onSuccess(attempt, value);
      }, (error: BusinessError): void => {
        this.onFailure(attempt, error, false);
      });
      this.notify();
    } catch (error) {
      this.onFailure(attempt, error as BusinessError, this.current.phase === QueryPhase.CHECKING);
    }
  }

  clearRecords(): void {
    this.history = [];
    this.persistHistory();
    this.notify();
  }

  onForeground(): void {
    this.disposed = false;
    if (this.foreground) {
      return;
    }
    this.foreground = true;
    if (!this.resumeRevisit()) {
      this.refresh(this.current.phase === QueryPhase.IDLE ? RefreshSource.INITIAL : RefreshSource.FOREGROUND);
    }
  }

  private resumeRevisit(): boolean {
    if (this.revisitReadFailed) { return false; }
    if (this.revisit.snapshot().stage === RevisitStage.LEFT) {
      this.revisit.markReturned(this.clock.now());
      this.persistRevisit();
      safeEvent(this.telemetry, 'revisit_return', 0, this.revisit.snapshot().stage);
    } else {
      const before = this.revisit.snapshot().stage;
      this.revisit.checkExpiry(this.clock.now());
      if (before !== this.revisit.snapshot().stage) { this.persistRevisit(); }
    }
    if (this.revisit.snapshot().stage === RevisitStage.RETURNED) {
      this.refresh(RefreshSource.SETTINGS);
      return true;
    }
    return false;
  }

  onBackground(): void {
    this.foreground = false;
    if (!this.revisitReadFailed && this.revisit.snapshot().stage === RevisitStage.GUIDED) {
      this.revisit.markLeft(this.clock.now());
      this.persistRevisit();
      safeEvent(this.telemetry, 'revisit_left', 0, 'background_observed');
    }
  }

  dispose(): void {
    this.disposed = true;
    this.foreground = false;
    this.deferredRefresh = null;
    this.listeners = [];
    this.clearTimeout();
    if (this.attempt !== null && !this.attempt.terminal) {
      this.attempt.terminal = true;
      safeEnd(this.telemetry, 'query', this.attempt.id, 'disposed');
    }
    this.revisit.clearNativeBinding();
    this.persistRevisit();
    this.current = new QuerySnapshot();
    this.current.pending = this.attempt !== null;
    // 原生调用仍占用单飞位置，完成回调负责释放。
  }

  private onSuccess(attempt: QueryAttempt, value: boolean): void {
    if (this.attempt !== attempt) {
      return;
    }
    if (!attempt.terminal && !this.disposed) {
      this.clearTimeout();
      this.current.phase = QueryPhase.SUCCEEDED;
      this.current.value = value;
      this.current.lastValue = value;
      this.current.statusResult = value ? 'true' : 'false';
      this.appendRecord(attempt, value ? '已开启' : '未开启');
      this.current.lastSampleTime = this.current.sampleTime;
    }
    this.release(attempt);
  }

  private onFailure(attempt: QueryAttempt, error: BusinessError, checking: boolean): void {
    if (this.attempt !== attempt) {
      return;
    }
    if (!attempt.terminal && !this.disposed) {
      this.clearTimeout();
      const code = error && error.code !== undefined ? String(error.code) : 'UNKNOWN';
      this.current.errorCode = code;
      this.current.errorMessage = error && typeof error.message === 'string' ? error.message : String(error);
      this.current.phase = this.errorPhase(code);
      if (checking) {
        this.current.supportResult = '异常';
        this.current.statusResult = '未调用';
        this.current.support = SupportState.FAILED;
      } else {
        this.current.statusResult = code;
      }
      if (this.current.phase === QueryPhase.UNSUPPORTED) {
        if (checking) {
          this.current.support = SupportState.UNSUPPORTED;
        }
        this.appendRecord(attempt, checking ? '设备不支持' : '查询不支持');
      } else {
        this.appendRecord(attempt, checking ? '检测失败' : '查询失败');
      }
    }
    this.release(attempt);
  }

  private errorPhase(code: string): QueryPhase {
    switch (code) {
      case '801':
        return QueryPhase.UNSUPPORTED;
      case '16000050':
        return QueryPhase.FAILED;
      default:
        return QueryPhase.FAILED;
    }
  }

  private onTimeout(attempt: QueryAttempt): void {
    if (this.attempt !== attempt || attempt.terminal || this.disposed) {
      return;
    }
    this.timeoutId = -1;
    this.current.phase = QueryPhase.TIMEOUT;
    this.current.errorCode = 'TIMEOUT';
    this.current.errorMessage = '系统响应等待超时';
    this.appendRecord(attempt, '等待超时');
    this.notify();
  }

  private appendRecord(attempt: QueryAttempt, result: string): void {
    attempt.terminal = true;
    const now = this.clock.now();
    this.current.sampleTime = now;
    const record = new QueryRecord();
    record.id = attempt.id;
    record.timestamp = now;
    record.source = attempt.source;
    record.result = result;
    record.supportResult = this.current.supportResult;
    record.statusResult = this.current.statusResult;
    record.errorCode = this.current.errorCode;
    record.errorMessage = boundedMessage(this.current.errorMessage);
    record.durationMillis = Math.max(0, elapsedNow(this.clock) - attempt.startedAt);
    record.outcome = this.outcomeOf(record.result, record.errorCode);
    safeEnd(this.telemetry, 'query', attempt.id, record.outcome);
    if (attempt.revisitId.length > 0) {
      const accepted = this.revisit.acceptQuery(attempt.revisitId, record, now);
      safeEvent(this.telemetry, 'revisit_recheck', attempt.id, accepted ? 'associated' : 'ignored');
      this.persistRevisit();
    }
    const sink = this.recordSink;
    if (sink !== undefined) {
      try {
        sink.capture(record.clone()); this.recordSinkNotice = '';
      } catch (_) {
        this.recordSinkNotice = '归档采集失败；实际查询仍可用，请查看live历史并重试保存';
      }
    }
    this.history.unshift(record);
    if (this.history.length > 20) {
      this.history.pop();
    }
    this.persistHistory();
  }

  private outcomeOf(result: string, errorCode: string): QueryOutcome {
    if (result === '已开启' || result === '未开启') {
      return QueryOutcome.SUCCESS;
    }
    if (result === '设备不支持' || result === '查询不支持') {
      return QueryOutcome.UNSUPPORTED;
    }
    if (result === '等待超时' || errorCode === 'TIMEOUT') {
      return QueryOutcome.TIMEOUT;
    }
    return QueryOutcome.FAILURE;
  }

  private restoreHistory(): void {
    const store = this.historyStore;
    if (store === undefined) {
      return;
    }
    try {
      const raw: string = store.read();
      const loaded: HistoryLoadResult = parseHistory(raw, this.clock.now());
      this.historyReadFailed = false;
      this.history = loaded.records;
      this.historyMessage = loaded.notice;
      this.rebaseNextId();
    } catch (error) {
      this.history = [];
      this.historyReadFailed = true;
      this.historyMessage = '历史记录读取失败，内存查询可用；重试读取前不覆盖原存档';
    }
  }

  /** Restored IDs may already be in use; the next attempt must continue above the maximum. */
  private rebaseNextId(): void {
    let maximum: number = 0;
    this.history.forEach((record: QueryRecord): void => {
      if (record.id > maximum) {
        maximum = record.id;
      }
    });
    this.nextId = Math.max(this.nextId, maximum);
    this.rebaseFromRevisit();
  }

  private reserveId(): number {
    this.nextId += 1;
    if (!Number.isSafeInteger(this.nextId) || this.nextId >= Number.MAX_SAFE_INTEGER - 1) {
      // 极端情况下重排恢复记录，保留相对时间顺序，并让下一 ID 继续安全递增。
      for (let index = this.history.length - 1; index >= 0; index--) {
        this.history[index].id = this.history.length - index;
      }
      this.nextId = this.history.length + 1;
    }
    return this.nextId;
  }

  private persistHistory(): void {
    const store = this.historyStore;
    if (store === undefined || this.historyReadFailed) {
      return;
    }
    let snapshot: string = '';
    try {
      snapshot = serializeHistory(this.history, this.clock.now());
    } catch (error) {
      this.historyMessage = '历史记录序列化失败，查询结果仍保留在内存';
      return;
    }
    const seq: number = ++this.historyWriteSeq;
    const epoch = this.historyStorageEpoch;
    this.historyWritesPending++;
    this.historyChain = this.historyChain.then(async (): Promise<void> => {
      if (epoch !== this.historyStorageEpoch || store !== this.historyStore || this.historyReadFailed) {
        this.historyWritesPending--;
        return;
      }
      try {
        await store.write(snapshot);
        safeEvent(this.telemetry, 'history_save', seq, 'success');
        if (seq === this.historyWriteSeq && epoch === this.historyStorageEpoch && this.historyMessage.length > 0) {
          this.historyMessage = '';
          this.notify();
        }
      } catch (error) {
        safeEvent(this.telemetry, 'history_save', seq, 'failure');
        if (seq === this.historyWriteSeq && epoch === this.historyStorageEpoch) {
          this.historyMessage = '历史记录保存失败，本次查询结果仍可用';
          this.notify();
        }
      } finally { this.historyWritesPending--; }
    });
  }

  private release(attempt: QueryAttempt): void {
    if (this.attempt !== attempt) {
      return;
    }
    this.attempt = null;
    this.current.pending = false;
    if (!this.disposed && this.foreground) {
      const deferred = this.deferredRefresh;
      if (deferred !== null) {
        this.refresh(deferred);
        return;
      }
      if (this.current.phase === QueryPhase.IDLE) {
        this.refresh(RefreshSource.INITIAL);
        return;
      }
    }
    this.notify();
  }

  private clearTimeout(): void {
    if (this.timeoutId >= 0) {
      this.clock.clearTimeout(this.timeoutId);
      this.timeoutId = -1;
    }
  }

  private notify(): void {
    const listeners = this.listeners.slice();
    listeners.forEach((listener: () => void): void => {
      if (this.listeners.indexOf(listener) >= 0) {
        try {
          listener();
        } catch (error) {
          // 单个页面回调异常时，继续通知其他订阅。
        }
      }
    });
  }
}

export const autoStartupService = new AutoStartupService();
