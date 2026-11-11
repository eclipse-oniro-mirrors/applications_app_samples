import { QueryRecord, QueryRecordSink } from '../AutoStartupTypes';
import { exportRedacted, filterHistoryAdvanced, normalizeRecord, summarizeHistory } from '../AutoStartupHistory';
import { archiveEntryOf, buildArchiveIndex, dayKeyOf, isDayKey, localOffsetMinutes, IndexBounds } from './ArchiveIndex';
import { CleanupPreview, defaultRetentionPolicy, previewCleanup } from './RetentionPolicy';

export const ARCHIVE_SCHEMA: number = 1;
export const ARCHIVE_MAX_ENTRIES: number = 500;
export const ARCHIVE_MAX_BYTES: number = 1048576;
export const ARCHIVE_PENDING_LIMIT: number = 20;
export const ARCHIVE_PENDING_BYTES: number = 65536;
export const ARCHIVE_PAGE_SIZE: number = 50;

export class ArchiveFailure extends Error {
  public code: string;
  constructor(code: string, message: string = code) {
    super(message); this.name = 'ArchiveFailure'; this.code = code;
  }
}

export function archiveUtf8Bytes(text: string): number {
  let bytes = 0;
  for (let index = 0; index < text.length; index++) {
    const code = text.charCodeAt(index);
    if (code < 128) {
      bytes++;
    } else if (code < 2048) {
      bytes += 2;
    } else if (code >= 0xD800 && code <= 0xDBFF && index + 1 < text.length &&
      text.charCodeAt(index + 1) >= 0xDC00 && text.charCodeAt(index + 1) <= 0xDFFF) {
      bytes += 4; index++;
    } else { bytes += 3; }
  }
  return bytes;
}

/** Long-lived evidence intentionally excludes raw platform error explanations. */
export function archiveRecord(record: QueryRecord): QueryRecord {
  const valid = normalizeRecord(record);
  if (valid === undefined || valid.timestamp <= 0) { throw new ArchiveFailure('INVALID'); }
  valid.errorMessage = '';
  return valid;
}

export class ArchivedQuery {
  public archiveId: number;
  public record: QueryRecord;
  public savedAt: number;
  constructor(archiveId: number = 0, record: QueryRecord = new QueryRecord(), savedAt: number = 0) {
    this.archiveId = archiveId; this.record = record; this.savedAt = savedAt;
  }
  clone(): ArchivedQuery { return new ArchivedQuery(this.archiveId, this.record.clone(), this.savedAt); }
  evidenceKey(): string { return JSON.stringify(this.record); }
  viewRecord(): QueryRecord {
    const copy = this.record.clone(); copy.id = this.archiveId; return copy;
  }
}

export class ArchiveDocument {
  public schema: number = ARCHIVE_SCHEMA;
  public revision: number = 0;
  public nextId: number = 1;
  public automatic: boolean = false;
  public operationId: string = '';
  public rows: ArchivedQuery[] = [];
  clone(): ArchiveDocument {
    const copy = new ArchiveDocument();
    copy.schema = this.schema; copy.revision = this.revision; copy.nextId = this.nextId;
    copy.automatic = this.automatic; copy.operationId = this.operationId;
    copy.rows = this.rows.map((row: ArchivedQuery): ArchivedQuery => row.clone());
    return copy;
  }
}

/** Rebuild class instances from untrusted stored JSON before calling any methods. */
function checkedDocument(raw: ArchiveDocument): ArchiveDocument {
  if (raw === null || typeof raw !== 'object') { throw new ArchiveFailure('INVALID'); }
  if (raw.schema !== ARCHIVE_SCHEMA) { throw new ArchiveFailure('SCHEMA'); }
  if (!Number.isSafeInteger(raw.revision) || raw.revision < 0 ||
    !Number.isSafeInteger(raw.nextId) || raw.nextId < 1 || raw.nextId >= Number.MAX_SAFE_INTEGER ||
    typeof raw.automatic !== 'boolean' || typeof raw.operationId !== 'string' ||
    raw.operationId.length > 120 || !Array.isArray(raw.rows)) { throw new ArchiveFailure('INVALID'); }
  if (raw.rows.length > ARCHIVE_MAX_ENTRIES) { throw new ArchiveFailure('CAPACITY'); }
  const result = new ArchiveDocument();
  result.revision = raw.revision; result.nextId = raw.nextId;
  result.automatic = raw.automatic; result.operationId = raw.operationId;
  const ids = new Set<number>(); const keys = new Set<string>();
  raw.rows.forEach((row: ArchivedQuery): void => {
    if (row === null || typeof row !== 'object' || !Number.isSafeInteger(row.archiveId) ||
      row.archiveId < 1 || row.archiveId >= raw.nextId || ids.has(row.archiveId) ||
      !Number.isFinite(row.savedAt) || row.savedAt <= 0) { throw new ArchiveFailure('INVALID'); }
    const record = archiveRecord(row.record);
    if (row.record.errorMessage !== '') { throw new ArchiveFailure('PRIVACY'); }
    const copy = new ArchivedQuery(row.archiveId, record, row.savedAt);
    const key = copy.evidenceKey();
    if (keys.has(key)) { throw new ArchiveFailure('INVALID'); }
    ids.add(row.archiveId); keys.add(key); result.rows.push(copy);
  });
  return result;
}

export function encodeArchive(document: ArchiveDocument): string {
  const text = JSON.stringify(checkedDocument(document));
  if (archiveUtf8Bytes(text) > ARCHIVE_MAX_BYTES) { throw new ArchiveFailure('CAPACITY'); }
  return text;
}

export function decodeArchive(text: string): ArchiveDocument {
  if (archiveUtf8Bytes(text) > ARCHIVE_MAX_BYTES) { throw new ArchiveFailure('CAPACITY'); }
  let raw: ArchiveDocument;
  try {
    raw = JSON.parse(text) as ArchiveDocument;
  } catch (_) {
    throw new ArchiveFailure('INVALID');
  }
  const result = checkedDocument(raw);
  encodeArchive(result);
  return result;
}

export interface ArchiveStorage {
  /** Stable private store identity across reopened adapters; never rendered or logged. */
  identity?(): string;
  load(): Promise<ArchiveDocument>;
  commit(expectedRevision: number, document: ArchiveDocument): Promise<void>;
  close(): Promise<void>;
}
export interface ArchiveClipboardPort { writeText(text: string): Promise<void>; }
export enum ArchiveStage {
  DETACHED = 'detached', LOADING = 'loading', READY = 'ready', WRITING = 'writing',
  BLOCKED = 'blocked', CLOSED = 'closed'
}
export enum ArchiveActionCode {
  SAVED = 'saved', UNCHANGED = 'unchanged', FAILED = 'failed', BLOCKED = 'blocked',
  CAPACITY = 'capacity', INVALID = 'invalid', STALE = 'stale'
}
export class ArchiveAction {
  public success: boolean = false;
  public code: ArchiveActionCode = ArchiveActionCode.FAILED;
  public added: number = 0;
  public duplicates: number = 0;
  public removed: number = 0;
  public revision: number = 0;
  public message: string = '';
}
export class ArchiveSnapshot {
  public stage: ArchiveStage = ArchiveStage.DETACHED;
  public revision: number = 0;
  public automatic: boolean = false;
  public paused: boolean = false;
  public pending: number = 0;
  public pendingBytes: number = 0;
  public rejectedCaptures: number = 0;
  public bytes: number = 0;
  public canWrite: boolean = false;
  public notice: string = '归档尚未连接存储';
  public rows: ArchivedQuery[] = [];
}
export class ArchiveQuery {
  public source: string = '';
  public outcome: string = '';
  public day: string = '';
  public needle: string = '';
  public page: number = 0;
  clone(): ArchiveQuery {
    const copy = new ArchiveQuery(); copy.source = this.source; copy.outcome = this.outcome;
    copy.day = this.day; copy.needle = this.needle; copy.page = this.page; return copy;
  }
}
export class ArchiveView {
  public revision: number = 0;
  public total: number = 0;
  public matchedTotal: number = 0;
  public page: number = 0;
  public pageCount: number = 1;
  public rows: ArchivedQuery[] = [];
  public dayLines: string[] = [];
  public summary: string = '';
  public notice: string = '';
}
export class ArchiveCleanup {
  public revision: number = 0;
  public now: number = 0;
  public preview: CleanupPreview = new CleanupPreview();
}

let repositorySerial: number = 0;

/** One writer, committed-only views, and a bounded queue before the live ring evicts. */
export class StartupArchiveRepository implements QueryRecordSink {
  private document: ArchiveDocument = new ArchiveDocument();
  private storage: ArchiveStorage | undefined = undefined;
  private connector: (() => Promise<ArchiveStorage>) | undefined = undefined;
  private storageClosed: boolean = false;
  private connecting: Promise<boolean> | undefined = undefined;
  private stage: ArchiveStage = ArchiveStage.DETACHED;
  private notice: string = '归档尚未连接存储';
  private pending: QueryRecord[] = [];
  private paused: boolean = false;
  private rejectedCaptures: number = 0;
  private enabling: boolean = false;
  private disableRequested: boolean = false;
  private settingSequence: number = 0;
  private epoch: number = 0;
  private sequence: number = 0;
  private instanceId: number = ++repositorySerial;
  private chain: Promise<void> = Promise.resolve();
  private draining: boolean = false;
  private drainPromise: Promise<void> = Promise.resolve();
  private lastDrain: ArchiveAction = new ArchiveAction();
  private copySequence: number = 0;
  private cleanupIds: number[] = [];
  private cleanupRevision: number = -1;
  private cleanupTime: number = 0;
  private listeners: (() => void)[] = [];
  private clock: () => number;

  constructor(clock: () => number = (): number => Date.now()) { this.clock = clock; }

  snapshot(): ArchiveSnapshot {
    const copy = new ArchiveSnapshot(); copy.stage = this.stage; copy.revision = this.document.revision;
    copy.automatic = this.document.automatic; copy.paused = this.paused;
    copy.pending = this.pending.length; copy.pendingBytes = this.pendingByteCount();
    copy.rejectedCaptures = this.rejectedCaptures; copy.notice = this.notice;
    copy.bytes = archiveUtf8Bytes(encodeArchive(this.document)); copy.canWrite = this.writable();
    copy.rows = this.document.rows.map((row: ArchivedQuery): ArchivedQuery => row.clone());
    return copy;
  }

  subscribe(listener: () => void): () => void {
    const subscription = (): void => listener(); this.listeners.push(subscription);
    return (): void => {
      const index = this.listeners.indexOf(subscription);
      if (index >= 0) { this.listeners.splice(index, 1); }
    };
  }

  async attach(storage: ArchiveStorage): Promise<boolean> {
    const previous = this.storage;
    let sameStore = previous === storage;
    if (!sameStore && previous !== undefined && previous.identity !== undefined && storage.identity !== undefined) {
      const previousIdentity = previous.identity(); const nextIdentity = storage.identity();
      sameStore = previousIdentity.length > 0 && previousIdentity === nextIdentity;
    }
    if (previous !== undefined && !sameStore && this.pending.length > 0) {
      this.notice = '仍有待保存证据，请先重试；不会自动迁入另一存储'; this.notify(); return false;
    }
    const pendingRead = this.pending.length > 0;
    const epoch = ++this.epoch;
    this.storage = storage; this.storageClosed = false; this.stage = ArchiveStage.LOADING; this.enabling = false;
    this.paused = true; this.copySequence++; this.notify();
    let loaded = false;
    const task = this.chain.then(async (): Promise<void> => {
      if (epoch !== this.epoch) { return; }
      if (previous !== undefined && previous !== storage) {
        try { await previous.close(); } catch (_) { /* New storage still needs an explicit read. */ }
      }
      try {
        const read = checkedDocument(await storage.load()); encodeArchive(read);
        if (epoch !== this.epoch || storage !== this.storage) { return; }
        this.document = read; this.stage = ArchiveStage.READY;
        this.disableRequested = false; this.paused = pendingRead; loaded = true;
        this.notice = `已读取 ${read.rows.length} 条归档；不保存原始错误说明` +
          (pendingRead ? `；另有 ${this.pending.length} 条待确认，请明确重试保存` : '');
      } catch (_) {
        if (epoch !== this.epoch) { return; }
        this.stage = ArchiveStage.BLOCKED; this.paused = true;
        this.notice = '归档读取失败或版本无效；暂停写入，请重试读取，原库不覆盖';
      }
      this.notify();
    });
    this.chain = task.catch((): void => {});
    await task;
    return loaded;
  }

  setConnector(connector: () => Promise<ArchiveStorage>): void { this.connector = connector; }

  async reload(): Promise<boolean> {
    const storage = this.storage;
    if (storage !== undefined && !this.storageClosed) { return this.attach(storage); }
    const connector = this.connector;
    if (connector === undefined) { return false; }
    if (this.connecting !== undefined) { return this.connecting; }
    const epoch = this.epoch;
    const task = (async (): Promise<boolean> => {
      try {
        const opened = await connector();
        if (epoch !== this.epoch) { await opened.close(); return false; }
        const attached = await this.attach(opened);
        if (!attached && this.storage !== opened) { await opened.close(); }
        return attached;
      } catch (_) {
        if (epoch === this.epoch) {
          this.stage = ArchiveStage.BLOCKED; this.paused = true;
          this.notice = '归档连接失败，请重试读取；live查询仍可用'; this.notify();
        }
        return false;
      }
    })();
    this.connecting = task;
    try { return await task; } finally { if (this.connecting === task) { this.connecting = undefined; } }
  }

  save(records: QueryRecord[]): Promise<ArchiveAction> {
    let input: QueryRecord[];
    try {
      input = records.map((row: QueryRecord): QueryRecord => archiveRecord(row));
    } catch (_) {
      return Promise.resolve(this.failure(ArchiveActionCode.INVALID, '记录字段无效，未保存'));
    }
    if (input.length === 0) { return Promise.resolve(this.failure(ArchiveActionCode.INVALID, '当前范围没有可保存的记录')); }
    return this.mutate((candidate: ArchiveDocument): ArchiveAction => this.addRows(candidate, input));
  }

  async setAutomatic(enabled: boolean, seed: QueryRecord[] = []): Promise<ArchiveAction> {
    let input: QueryRecord[];
    try {
      input = enabled ? seed.map((row: QueryRecord): QueryRecord => archiveRecord(row)) : [];
    } catch (_) {
      return this.failure(ArchiveActionCode.INVALID, '记录字段无效，自动归档设置未改变');
    }
    const setting = ++this.settingSequence;
    this.disableRequested = !enabled; this.enabling = enabled && this.writable();
    const result = await this.mutate((candidate: ArchiveDocument): ArchiveAction => {
      const action = this.addRows(candidate, enabled ? input : []);
      candidate.automatic = enabled;
      action.message = enabled ? '已启用自动归档；仅已提交项可在重启后恢复' : '已停用自动归档';
      return action;
    });
    if (setting === this.settingSequence) {
      this.enabling = false;
      if (!result.success) {
        this.disableRequested = true;
        this.notice = '本会话已暂停自动采集，设置尚未保存；下次启动可能沿用旧设置';
      }
      // A capacity/backpressure pause raised during ENABLING survives a successful
      // settings commit. Only explicit retryPending is allowed to resume it.
      this.notify();
      if (result.success) { this.scheduleDrain(); }
    }
    return result;
  }

  capture(record: QueryRecord): void {
    if (!(this.document.automatic || this.enabling) || this.disableRequested) { return; }
    if (!this.writable() || this.paused) {
      this.rejectedCaptures++; this.notice = '自动归档已暂停；后续查询仍仅保留live最近20条'; this.notify(); return;
    }
    let copy: QueryRecord;
    try {
      copy = archiveRecord(record);
    } catch (_) {
      this.rejectedCaptures++; this.paused = true;
      this.notice = '新记录无效，自动归档已暂停；查询仍可用'; this.notify(); return;
    }
    const key = JSON.stringify(copy);
    if (this.document.rows.some((row: ArchivedQuery): boolean => row.evidenceKey() === key) ||
      this.pending.some((row: QueryRecord): boolean => JSON.stringify(row) === key)) { return; }
    if (this.pending.length >= ARCHIVE_PENDING_LIMIT ||
      this.pendingByteCount() + archiveUtf8Bytes(key) > ARCHIVE_PENDING_BYTES) {
      this.rejectedCaptures++; this.paused = true;
      this.notice = '待保存队列已满，自动归档已暂停；新查询尚未受理归档'; this.notify(); return;
    }
    this.pending.push(copy); this.notify();
    if (!this.enabling) { this.scheduleDrain(); }
  }

  async retryPending(): Promise<ArchiveAction> {
    if (this.stage === ArchiveStage.BLOCKED && !await this.reload()) {
      return this.failure(ArchiveActionCode.BLOCKED, '读取仍失败，未覆盖原库');
    }
    if (!this.writable()) { return this.failure(ArchiveActionCode.BLOCKED, '归档尚不可写'); }
    this.paused = false;
    this.scheduleDrain(); await this.drainPromise;
    if (this.pending.length === 0) {
      const result = new ArchiveAction(); result.success = true; result.code = ArchiveActionCode.UNCHANGED;
      result.revision = this.document.revision; result.message = '待保存队列已处理'; return result;
    }
    return this.lastDrain;
  }

  clear(expectedRevision: number): Promise<ArchiveAction> {
    return this.mutate((candidate: ArchiveDocument): ArchiveAction => {
      if (candidate.revision !== expectedRevision) { throw new ArchiveFailure('STALE'); }
      const result = new ArchiveAction(); result.removed = candidate.rows.length;
      candidate.rows = []; result.message = '已清空已保存归档；live历史未改变'; return result;
    });
  }

  previewCleanup(): ArchiveCleanup {
    const plan = new ArchiveCleanup(); plan.revision = this.document.revision; plan.now = this.clock();
    const entries = this.document.rows.map((row: ArchivedQuery) => archiveEntryOf(row.viewRecord()));
    plan.preview = previewCleanup(entries, plan.now, defaultRetentionPolicy());
    this.cleanupRevision = plan.revision; this.cleanupTime = plan.now;
    this.cleanupIds = plan.preview.deletedIds().slice();
    return plan;
  }

  applyCleanup(plan: ArchiveCleanup): Promise<ArchiveAction> {
    const requested = plan.preview.deletedIds().slice();
    const revision = plan.revision; const time = plan.now;
    return this.mutate((candidate: ArchiveDocument): ArchiveAction => {
      if (candidate.revision !== revision || this.cleanupRevision !== revision || this.cleanupTime !== time) {
        throw new ArchiveFailure('STALE');
      }
      if (requested.join(',') !== this.cleanupIds.join(',')) { throw new ArchiveFailure('INVALID'); }
      const ids = new Set<number>(this.cleanupIds);
      const result = new ArchiveAction();
      result.removed = candidate.rows.filter((row: ArchivedQuery): boolean => ids.has(row.archiveId)).length;
      candidate.rows = candidate.rows.filter((row: ArchivedQuery): boolean => !ids.has(row.archiveId));
      result.message = `已提交清理，删除 ${result.removed} 条`; return result;
    });
  }

  view(query: ArchiveQuery = new ArchiveQuery()): ArchiveView {
    const view = new ArchiveView(); view.revision = this.document.revision; view.total = this.document.rows.length;
    const rows = this.matching(query); view.matchedTotal = rows.length;
    view.pageCount = Math.max(1, Math.ceil(rows.length / ARCHIVE_PAGE_SIZE));
    view.page = Number.isFinite(query.page) ? Math.max(0, Math.min(view.pageCount - 1, Math.floor(query.page))) : 0;
    view.rows = rows.slice(view.page * ARCHIVE_PAGE_SIZE, (view.page + 1) * ARCHIVE_PAGE_SIZE)
      .map((row: ArchivedQuery): ArchivedQuery => row.clone());
    if (query.needle.length > 64 || query.day.length > 0 && !isDayKey(query.day)) {
      view.notice = '日期须为yyyy-MM-dd，检索最多64字符';
    }
    const offset = localOffsetMinutes(this.clock());
    const index = buildArchiveIndex(rows.map((row: ArchivedQuery) => archiveEntryOf(row.viewRecord())),
      new IndexBounds(), offset, this.clock());
    view.dayLines = index.days.map((day): string => `${day.dayKey}：${day.total} 条`);
    const summary = summarizeHistory(rows.map((row: ArchivedQuery): QueryRecord => row.viewRecord()), this.clock());
    view.summary = `范围 ${summary.total} 条｜成功 ${summary.success}｜失败 ${summary.failure}｜` +
      `不支持 ${summary.unsupported}｜超时 ${summary.timeout}｜未知 ${summary.unknown}`;
    return view;
  }

  exportText(query: ArchiveQuery = new ArchiveQuery()): string {
    if (this.stage === ArchiveStage.BLOCKED || this.stage === ArchiveStage.LOADING ||
      this.stage === ArchiveStage.DETACHED || this.stage === ArchiveStage.CLOSED) {
      throw new ArchiveFailure('BLOCKED');
    }
    const rows = this.matching(query);
    if (rows.length === 0) { throw new ArchiveFailure('EMPTY'); }
    return '本机查询证据归档（编号为归档编号；不证明实际开机拉起）\n' +
      exportRedacted(rows.map((row: ArchivedQuery): QueryRecord => row.viewRecord()), this.clock());
  }

  async copy(query: ArchiveQuery, clipboard: ArchiveClipboardPort): Promise<ArchiveAction> {
    const sequence = ++this.copySequence; const epoch = this.epoch;
    let text: string;
    try {
      text = this.exportText(query.clone());
    } catch (_) {
      return this.failure(ArchiveActionCode.INVALID, '当前范围不可导出，剪贴板未调用');
    }
    try {
      await clipboard.writeText(text);
      const result = new ArchiveAction(); result.success = true; result.code = ArchiveActionCode.SAVED;
      result.message = '脱敏归档已复制'; result.revision = this.document.revision;
      if (sequence === this.copySequence && epoch === this.epoch) { this.notice = result.message; this.notify(); }
      return result;
    } catch (_) {
      const result = new ArchiveAction(); result.code = ArchiveActionCode.FAILED; result.message = '复制失败，请重试';
      if (sequence === this.copySequence && epoch === this.epoch) { this.notice = result.message; this.notify(); }
      return result;
    }
  }

  async whenIdle(): Promise<void> { await this.chain; await this.drainPromise; }

  async close(): Promise<void> {
    const storage = this.storage; ++this.epoch; ++this.copySequence;
    this.disableRequested = true; this.enabling = false; this.paused = true; this.storageClosed = true;
    this.stage = ArchiveStage.CLOSED; this.notice = '归档已关闭；未提交项不承诺重启恢复'; this.notify();
    await this.chain; await this.drainPromise;
    if (storage !== undefined) { await storage.close(); }
  }

  private matching(query: ArchiveQuery): ArchivedQuery[] {
    if (query.needle.length > 64 || query.day.length > 0 && !isDayKey(query.day)) { return []; }
    const projected = this.document.rows.map((row: ArchivedQuery): QueryRecord => row.viewRecord());
    const selected = filterHistoryAdvanced(projected, query.source, query.outcome, 0, 0);
    const ids = new Set<number>(selected.map((record: QueryRecord): number => record.id));
    const offset = localOffsetMinutes(this.clock()); const needle = query.needle.trim();
    return this.document.rows.filter((row: ArchivedQuery): boolean => {
      if (!ids.has(row.archiveId)) { return false; }
      if (query.day.length > 0 && dayKeyOf(row.record.timestamp, offset) !== query.day) { return false; }
      if (needle.length > 0 && (needle.charAt(0) === '#' ?
        String(row.archiveId) !== needle.slice(1) : row.record.errorCode !== needle)) {
        return false;
      }
      return true;
    }).sort((left: ArchivedQuery, right: ArchivedQuery): number =>
      right.record.timestamp - left.record.timestamp || right.archiveId - left.archiveId);
  }

  private addRows(candidate: ArchiveDocument, input: QueryRecord[]): ArchiveAction {
    const action = new ArchiveAction();
    const keys = new Set<string>(candidate.rows.map((row: ArchivedQuery): string => row.evidenceKey()));
    input.forEach((record: QueryRecord): void => {
      const key = JSON.stringify(record);
      if (keys.has(key)) { action.duplicates++; return; }
      if (candidate.rows.length >= ARCHIVE_MAX_ENTRIES || candidate.nextId >= Number.MAX_SAFE_INTEGER - 1) {
        throw new ArchiveFailure('CAPACITY');
      }
      const now = this.clock();
      if (!Number.isFinite(now) || now <= 0) { throw new ArchiveFailure('INVALID'); }
      candidate.rows.push(new ArchivedQuery(candidate.nextId++, record.clone(), now));
      keys.add(key); action.added++;
    });
    action.message = `已保存 ${action.added} 条，重复 ${action.duplicates} 条；不保存原始错误说明`;
    return action;
  }

  private mutate(transform: (document: ArchiveDocument) => ArchiveAction): Promise<ArchiveAction> {
    const epoch = this.epoch; const storage = this.storage;
    const task = this.chain.then(async (): Promise<ArchiveAction> => {
      if (epoch !== this.epoch || storage !== this.storage) {
        return this.failure(ArchiveActionCode.STALE, '旧存储操作已作废', false);
      }
      if (storage === undefined || !this.writable()) { return this.failure(ArchiveActionCode.BLOCKED, '归档不可写，请先重试读取'); }
      const base = this.document.clone(); const candidate = base.clone();
      this.stage = ArchiveStage.WRITING; this.notify();
      if (epoch !== this.epoch || storage !== this.storage) {
        return this.failure(ArchiveActionCode.STALE, '旧存储操作已作废', false);
      }
      let action: ArchiveAction;
      try {
        action = transform(candidate);
        if (encodeArchive(candidate) === encodeArchive(base)) {
          action.success = true; action.code = ArchiveActionCode.UNCHANGED; action.revision = base.revision;
          this.stage = ArchiveStage.READY; this.notice = action.message; this.notify(); return action;
        }
        if (base.revision >= Number.MAX_SAFE_INTEGER - 1) { throw new ArchiveFailure('CAPACITY'); }
        candidate.revision = base.revision + 1;
        candidate.operationId = `archive-${candidate.revision}-${this.instanceId}-${epoch}-` +
          `${++this.sequence}-${this.clock()}`;
        encodeArchive(candidate);
      } catch (error) {
        this.stage = ArchiveStage.READY;
        const code = error instanceof ArchiveFailure ? error.code : 'INVALID';
        return this.failure(code === 'CAPACITY' ? ArchiveActionCode.CAPACITY :
          code === 'STALE' ? ArchiveActionCode.STALE : ArchiveActionCode.INVALID,
          code === 'CAPACITY' ? '归档容量已满，请先预览清理；原归档未改变' : code === 'STALE' ? '记录已更新，请重新预览或确认' : '输入无效，原归档未改变');
      }
      if (epoch !== this.epoch || storage !== this.storage) {
        return this.failure(ArchiveActionCode.STALE, '旧存储操作已作废', false);
      }
      try {
        await storage.commit(base.revision, candidate.clone());
      } catch (_) {
        if (epoch !== this.epoch) { return this.failure(ArchiveActionCode.STALE, '旧存储完成结果已忽略', false); }
        try {
          const confirmed = checkedDocument(await storage.load());
          if (epoch !== this.epoch || storage !== this.storage) {
            return this.failure(ArchiveActionCode.STALE, '旧存储完成结果已忽略', false);
          }
          if (encodeArchive(confirmed) !== encodeArchive(candidate)) {
            this.paused = true;
            if (encodeArchive(confirmed) !== encodeArchive(base)) {
              this.stage = ArchiveStage.BLOCKED;
              return this.failure(ArchiveActionCode.BLOCKED, '存储版本已变化，请重试读取；未覆盖其它写入');
            }
            this.stage = ArchiveStage.READY;
            return this.failure(ArchiveActionCode.FAILED, '保存失败，原归档未改变，待保存证据保留');
          }
        } catch (_) {
          if (epoch !== this.epoch || storage !== this.storage) {
            return this.failure(ArchiveActionCode.STALE, '旧存储完成结果已忽略', false);
          }
          this.stage = ArchiveStage.BLOCKED; this.paused = true;
          return this.failure(ArchiveActionCode.BLOCKED, '提交结果待确认，请重试读取；暂停继续写入');
        }
      }
      if (epoch !== this.epoch || storage !== this.storage) {
        return this.failure(ArchiveActionCode.STALE, '旧存储完成结果已忽略', false);
      }
      this.document = candidate; this.stage = ArchiveStage.READY;
      action.success = true; action.code = ArchiveActionCode.SAVED; action.revision = candidate.revision;
      this.notice = action.message; this.notify(); return action;
    });
    this.chain = task.then((): void => {}, (): void => {});
    return task;
  }

  private scheduleDrain(): void {
    if (this.draining || this.pending.length === 0 || this.paused || !this.writable()) { return; }
    this.draining = true;
    this.drainPromise = this.drain();
  }

  private async drain(): Promise<void> {
    try {
      while (this.pending.length > 0 && !this.paused && this.writable()) {
        const batch = this.pending.slice();
        const action = await this.save(batch); this.lastDrain = action;
        if (!action.success) { this.paused = true; break; }
        const keys = new Set<string>(batch.map((row: QueryRecord): string => JSON.stringify(row)));
        this.pending = this.pending.filter((row: QueryRecord): boolean => !keys.has(JSON.stringify(row)));
      }
    } finally { this.draining = false; this.notify(); }
  }

  private pendingByteCount(): number {
    return this.pending.reduce((sum: number, row: QueryRecord): number =>
      sum + archiveUtf8Bytes(JSON.stringify(row)), 0);
  }
  private writable(): boolean { return this.stage === ArchiveStage.READY || this.stage === ArchiveStage.WRITING; }
  private failure(code: ArchiveActionCode, message: string, publish: boolean = true): ArchiveAction {
    const result = new ArchiveAction();
    result.code = code;
    result.message = message;
    result.revision = this.document.revision;
    if (publish) { this.notice = message; this.notify(); }
    return result;
  }
  private notify(): void {
    this.listeners.slice().forEach((listener: () => void): void => {
      if (this.listeners.indexOf(listener) >= 0) { try { listener(); } catch (_) {} }
    });
  }
}

export const startupArchiveRepository: StartupArchiveRepository = new StartupArchiveRepository();
