import { common, shortcutManager } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { CallRecord, clockText, ShortcutItem, ShortcutView } from '../model/ShortcutModels';
import { PlatformShortcutApi, ShortcutApi } from './ShortcutApi';
import { BatchStorage, PreferencesBatchStorage } from './BatchStorage';
import { BatchSpan, BatchTelemetry, PlatformBatchTelemetry } from './BatchTelemetry';
import { BatchItem, BatchJournal, BatchMode, BatchPlan, BatchPreview, BatchPreviewItem,
  copyBatch, copyJournal, copyPreview, decodeJournal } from './VisibilityBatch';

class ShortcutListener {
  public id: number;
  public callback: () => void;

  constructor(id: number, callback: () => void) {
    this.id = id;
    this.callback = callback;
  }
}

enum WriteResult {
  CONFIRMED,
  MISMATCH,
  PENDING,
  FAILED,
  STALE
}

export class ShortcutService {
  private api: ShortcutApi;
  private context: common.ApplicationContext | undefined = undefined;
  private view: ShortcutView = new ShortcutView();
  private listeners: ShortcutListener[] = [];
  private listenerSequence: number = 0;
  private recordSequence: number = 0;
  private generation: number = 0;
  private disposed: boolean = true;
  private initializing: boolean = false;
  private checking: boolean = false;
  private querying: boolean = false;
  private setting: boolean = false;
  private writingId: string = '';

  private batchStorage: BatchStorage;
  private journal: BatchJournal = new BatchJournal();
  private previewSequence: number = 0;
  private batchTimeoutMs: number;
  private terminalWrite: boolean = false;
  private telemetry: BatchTelemetry;
  private uncompletedWrites: string[] = [];

  constructor(api: ShortcutApi = new PlatformShortcutApi(),
    batchStorage: BatchStorage = new PreferencesBatchStorage(), batchTimeoutMs: number = 5000,
    telemetry: BatchTelemetry = new PlatformBatchTelemetry()) {
    this.api = api;
    this.batchStorage = batchStorage;
    this.batchTimeoutMs = batchTimeoutMs;
    this.telemetry = telemetry;
  }

  initialize(context: common.ApplicationContext): void {
    this.generation++;
    this.context = context;
    this.disposed = false;
    this.view = new ShortcutView();
    this.initializing = true;
    this.syncBusy();
    this.notify();
    this.startInitialization();
    void this.loadBatches();
  }

  dispose(): void {
    this.generation++;
    this.disposed = true;
    this.initializing = false;
    this.context = undefined;
    this.listeners = [];
    this.view = new ShortcutView();
  }

  subscribe(listener: () => void): number {
    const id: number = ++this.listenerSequence;
    this.listeners.push(new ShortcutListener(id, listener));
    return id;
  }

  unsubscribe(id: number): void {
    this.listeners = this.listeners.filter((entry: ShortcutListener) => entry.id !== id);
  }

  snapshot(): ShortcutView {
    const result: ShortcutView = new ShortcutView();
    result.support = this.view.support;
    result.supportError = this.view.supportError;
    result.supported = this.view.supported;
    result.checking = this.view.checking;
    result.querying = this.view.querying;
    result.busy = this.view.busy;
    result.settingId = this.view.settingId;
    result.batchMessage = this.view.batchMessage;
    result.batchReady = this.view.batchReady;
    result.batchLoading = this.view.batchLoading;
    result.batchError = this.view.batchError;
    result.batches = this.journal.batches.map((plan: BatchPlan) => copyBatch(plan));
    result.batchPreview = this.view.batchPreview === undefined ? undefined : copyPreview(this.view.batchPreview);
    result.queryError = this.view.queryError;
    result.lastQuery = this.view.lastQuery;
    result.items = this.view.items.map((item: ShortcutItem) => {
      const copy: ShortcutItem = new ShortcutItem(this.copyInfo(item.raw), item.title);
      copy.visible = item.visible;
      copy.visibleExplicit = item.visibleExplicit;
      copy.status = item.status;
      copy.error = item.error;
      return copy;
    });
    result.records = this.view.records.map((record: CallRecord) => new CallRecord(record.id,
      record.time, record.api, record.target, record.status, record.message));
    return result;
  }

  checkSupport(): void {
    const api: string = 'isShortcutSupported';
    if (!this.available(api, '当前设备', false)) {
      return;
    }
    const generation: number = this.generation;
    this.checking = true;
    this.view.support = '检测中';
    this.view.supportError = '';
    this.syncBusy();
    this.addRecord(api, '当前设备', '调用', '检测快捷方式支持情况');
    this.notify();
    try {
      if (!this.isCurrent(generation)) {
        return;
      }
      const supported: boolean = this.isShortcutSupported();
      if (!this.isCurrent(generation)) {
        return;
      }
      this.view.supported = supported;
      this.view.support = supported ? '支持' : '不支持';
      this.addRecord(api, '当前设备', '成功', `返回 ${supported}`);
    } catch (error) {
      if (this.isCurrent(generation)) {
        const message: string = this.errorText(error as BusinessError);
        this.view.supported = false;
        this.view.support = '检测失败';
        this.view.supportError = message;
        this.addRecord(api, '当前设备', '失败', message);
      }
    } finally {
      this.checking = false;
      this.syncBusy();
      this.notify();
      this.startInitialization();
    }
  }

  async refresh(): Promise<void> {
    if (!this.available('getAllShortcutInfoForSelf', '本应用', true)) {
      return;
    }
    await this.query(this.generation, '刷新快捷方式');
  }

  async setVisible(id: string, visible: boolean): Promise<void> {
    if (!this.available('setShortcutVisibleForSelf', id, true)) {
      return;
    }
    const generation: number = this.generation;
    this.setting = true;
    this.writingId = id;
    this.view.batchMessage = '正在设置';
    this.syncBusy();
    try {
      const result: WriteResult = await this.applyVisibility(generation, id, visible);
      if (this.isCurrent(generation)) {
        this.view.batchMessage = this.resultText(result);
      }
    } finally {
      this.finishSetting();
    }
  }

  async restoreAll(): Promise<void> {
    if (!this.available('setShortcutVisibleForSelf', '全部快捷方式', true)) {
      return;
    }
    const ids: string[] = this.view.items.filter((item: ShortcutItem) => item.visible === false)
      .map((item: ShortcutItem) => item.id);
    if (ids.length === 0) {
      this.view.batchMessage = '全部入口已显示';
      this.addRecord('恢复全部', '本应用', '未执行', '全部入口已显示');
      this.notify();
      return;
    }
    const generation: number = this.generation;
    this.setting = true;
    let completed: number = 0;
    this.addRecord('恢复全部', '本应用', '开始', `逐条恢复 ${ids.length} 项`);
    try {
      for (const id of ids) {
        if (!this.isCurrent(generation)) {
          return;
        }
        this.writingId = id;
        this.view.batchMessage = `正在恢复 ${completed + 1}/${ids.length}`;
        this.syncBusy();
        const result: WriteResult = await this.applyVisibility(generation, id, true);
        if (!this.isCurrent(generation)) {
          return;
        }
        if (result !== WriteResult.CONFIRMED) {
          this.view.batchMessage = `已恢复 ${completed}/${ids.length}，${this.resultText(result)}，已停止`;
          this.addRecord('恢复全部', id, '已停止', this.view.batchMessage);
          return;
        }
        completed++;
      }
      this.view.batchMessage = `已恢复 ${completed} 项`;
      this.addRecord('恢复全部', '本应用', '成功', this.view.batchMessage);
    } finally {
      this.finishSetting();
    }
  }

  async loadBatches(): Promise<void> {
    const context: common.ApplicationContext | undefined = this.context;
    if (context === undefined || this.disposed || this.view.batchLoading || this.setting) { return; }
    const generation: number = this.generation;
    this.view.batchLoading = true;
    this.view.batchReady = false;
    this.view.batchPreview = undefined;
    this.notify();
    try {
      const raw: string = await this.batchStorage.read(context);
      if (!this.isCurrent(generation)) { return; }
      this.journal = decodeJournal(raw);
      this.view.batchReady = true;
      this.view.batchError = '';
    } catch (_) {
      if (this.isCurrent(generation)) {
        this.view.batchError = '批次存档读取失败；不会覆盖或重放，请重试读取';
      }
    } finally {
      if (this.isCurrent(generation)) {
        this.view.batchLoading = false;
        this.notify();
      }
    }
  }

  cancelBatchPreview(): void {
    if (!this.setting) { this.view.batchPreview = undefined; this.notify(); }
  }

  /** A fresh query is part of preview; the original state is captured before any SDK write. */
  async previewBatch(ids: string[], target: boolean): Promise<void> {
    if (!this.batchAvailable() || ids.length === 0 || ids.length > 20 ||
      ids.some((id: string, index: number) => ids.indexOf(id) !== index)) { return; }
    const generation: number = this.generation;
    this.setting = true;
    this.view.batchPreview = undefined;
    this.syncBusy();
    try {
      if (!await this.query(generation, '批次预览前核对', this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
      const next: BatchJournal = copyJournal(this.journal);
      const plan: BatchPlan = new BatchPlan();
      if (next.sequence >= Number.MAX_SAFE_INTEGER) {
        this.view.batchMessage = '批次编号已达上限，未执行';
        return;
      }
      next.sequence += 1;
      plan.batchId = `batch-${next.sequence}`;
      plan.createdAt = Date.now();
      for (const id of ids) {
        const item: ShortcutItem | undefined = this.view.items.find((entry: ShortcutItem) => entry.id === id);
        if (item === undefined) { this.view.batchMessage = '所选入口已变化，请重新选择'; return; }
        const row: BatchItem = new BatchItem();
        row.id = id;
        row.target = target;
        row.originalKnown = item.visibleExplicit;
        row.originalVisible = item.visible;
        row.lastKnown = item.visibleExplicit;
        row.lastVisible = item.visible;
        plan.items.push(row);
      }
      next.batches.unshift(plan);
      next.batches = next.batches.slice(0, 5);
      if (!await this.persistJournal(next, generation)) { return; }
      this.makePreview(plan, 'apply');
      this.view.batchMessage = '请核对预览后确认；原值未知的项不能精确补偿';
    } finally {
      this.finishSetting();
    }
  }

  /** Reconciliation never writes to the platform. Unknown results cannot be retried blindly. */
  async reconcileBatch(batchId: string): Promise<void> {
    if (!this.batchAvailable()) { return; }
    const generation: number = this.generation;
    this.setting = true;
    this.view.batchPreview = undefined;
    this.syncBusy();
    try {
      if (!await this.query(generation, '批次未知结果核对', this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
      const next: BatchJournal = copyJournal(this.journal);
      const plan: BatchPlan | undefined = next.batches.find((entry: BatchPlan) => entry.batchId === batchId);
      if (plan === undefined) { return; }
      for (const row of plan.items) {
        const item: ShortcutItem | undefined = this.view.items.find((entry: ShortcutItem) => entry.id === row.id);
        if (item === undefined || !item.visibleExplicit) {
          if (row.attempt > 0 && row.result !== 'not-run') { row.result = 'unknown'; }
          if (row.restoreAttempt > 0) { row.restoreResult = 'unknown'; }
          continue;
        }
        if (this.uncompletedWrites.includes(row.id)) {
          if (row.attempt > 0) { row.result = 'unknown'; }
          if (row.restoreAttempt > 0) { row.restoreResult = 'unknown'; }
          continue;
        }
        if (row.result === 'unknown' || row.result === 'failed') {
          row.result = item.visible === row.target ? 'confirmed' : 'failed';
        }
        if (row.restoreResult === 'unknown' || row.restoreResult === 'failed') {
          row.restoreResult = item.visible === row.originalVisible ? 'confirmed' : 'failed';
        }
        // Do not replace the last owned observation here: compensation must still detect external changes.
      }
      plan.interrupted = false;
      await this.persistJournal(next, generation);
      if (this.isCurrent(generation)) { this.view.batchMessage = '核对完成；仅已确认失败项可重试，未知项仍不重放'; }
    } finally {
      this.finishSetting();
    }
  }

  async previewBatchRetry(batchId: string): Promise<void> {
    await this.previewExistingBatch(batchId, 'retry');
  }

  async previewBatchRestore(batchId: string): Promise<void> {
    await this.previewExistingBatch(batchId, 'restore');
  }

  private async previewExistingBatch(batchId: string, mode: BatchMode): Promise<void> {
    if (!this.batchAvailable()) { return; }
    const generation: number = this.generation;
    this.setting = true;
    this.view.batchPreview = undefined;
    this.syncBusy();
    try {
      if (!await this.query(generation, '重试/补偿预览前核对', this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
      const next: BatchJournal = copyJournal(this.journal);
      const plan: BatchPlan | undefined = next.batches.find((entry: BatchPlan) => entry.batchId === batchId);
      if (plan === undefined) { return; }
      if (mode === 'retry') {
        for (const row of plan.items) {
          if (row.result !== 'failed') { continue; }
          const item: ShortcutItem | undefined = this.view.items.find((entry: ShortcutItem) => entry.id === row.id);
          if (this.uncompletedWrites.includes(row.id) || item === undefined || !item.visibleExplicit) {
            row.result = 'unknown';
          } else if (item.visible === row.target) {
            row.result = 'confirmed';
          }
        }
        if (!await this.persistJournal(next, generation) || !this.isCurrent(generation)) { return; }
      }
      this.makePreview(plan, mode);
      this.view.batchMessage = mode === 'restore' ?
        '补偿不是系统原子回滚；原值未知不执行，外部改动须明确选择覆盖' :
        '仅重试已核对失败项；已确认、未知及未执行项均不会重写';
    } finally {
      this.finishSetting();
    }
  }

  private makePreview(plan: BatchPlan, mode: BatchMode): void {
    const preview: BatchPreview = new BatchPreview();
    preview.token = ++this.previewSequence;
    preview.batchId = plan.batchId;
    preview.mode = mode;
    for (const row of plan.items) {
      if (mode === 'retry' && (row.result !== 'failed' || row.retryBlocked)) { continue; }
      const item: ShortcutItem | undefined = this.view.items.find((entry: ShortcutItem) => entry.id === row.id);
      const entry: BatchPreviewItem = new BatchPreviewItem();
      entry.id = row.id;
      entry.currentKnown = item !== undefined && item.visibleExplicit;
      entry.currentVisible = item === undefined ? false : item.visible;
      entry.target = mode === 'restore' ? row.originalVisible : row.target;
      if (this.uncompletedWrites.includes(row.id)) {
        entry.eligible = false;
        entry.reason = '旧设置请求仍在途，不重复写入；稍后核对';
      } else if (mode !== 'apply' && row.retryBlocked) {
        entry.eligible = false;
        entry.reason = '权限/能力/无效ID错误已封闭重试，请修正条件后创建新预览';
      } else if (mode === 'restore' && (!row.originalKnown || row.attempt === 0)) {
        entry.eligible = false;
        entry.reason = row.originalKnown ? '原批次未执行，不补偿' : '原始visible未知，不能精确恢复';
      } else if (mode !== 'apply' && !entry.currentKnown) {
        entry.eligible = false;
        entry.reason = '当前visible未知，先核对，不重放';
      } else if (mode === 'restore' && entry.currentVisible === entry.target) {
        entry.eligible = false;
        entry.reason = '当前已是原态，无需写入';
      } else {
        entry.externalChange = mode === 'restore' && (!row.lastKnown || row.lastVisible !== entry.currentVisible);
        entry.reason = entry.externalChange ? '发现外部改动：需选择覆盖或保留' : '可执行';
      }
      preview.items.push(entry);
    }
    this.view.batchPreview = preview;
  }

  /** A token is single-use, session-local, and rechecked after confirmation. No journal is auto-replayed. */
  async executeBatchPreview(token: number, overrideExternal: boolean = false): Promise<void> {
    if (!this.batchAvailable()) { return; }
    const preview: BatchPreview | undefined = this.view.batchPreview;
    if (preview === undefined || preview.token !== token) { return; }
    const generation: number = this.generation;
    const span: BatchSpan | undefined = this.beginBatchSpan('execute');
    this.setting = true;
    this.view.batchPreview = undefined;
    this.syncBusy();
    try {
      if (!await this.query(generation, '确认后重新核对', this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
      for (const entry of preview.items) {
        const item: ShortcutItem | undefined = this.view.items.find((row: ShortcutItem) => row.id === entry.id);
        const known: boolean = item !== undefined && item.visibleExplicit;
        if (known !== entry.currentKnown || (known && item !== undefined && item.visible !== entry.currentVisible)) {
          this.view.batchMessage = '确认后状态变化，未执行；请重新预览';
          return;
        }
      }
      for (const entry of preview.items) {
        if (!this.isCurrent(generation)) { return; }
        if (!entry.eligible || (entry.externalChange && !overrideExternal)) { continue; }
        const next: BatchJournal = copyJournal(this.journal);
        const plan: BatchPlan | undefined = next.batches.find((row: BatchPlan) => row.batchId === preview.batchId);
        const row: BatchItem | undefined = plan?.items.find((item: BatchItem) => item.id === entry.id);
        if (row === undefined || plan === undefined) { return; }
        if (preview.mode === 'restore') {
          if (row.restoreAttempt >= 100) { continue; }
          row.restoreAttempt++;
          row.restoreResult = 'unknown';
        } else {
          if (row.attempt >= 100 || (preview.mode === 'retry' && row.result !== 'failed')) { continue; }
          row.attempt++;
          row.result = 'unknown';
        }
        plan.interrupted = true;
        // Write-ahead unknown marker is durable before the SDK can change anything.
        if (!await this.persistJournal(next, generation) || !this.isCurrent(generation)) { return; }
        this.writingId = entry.id;
        this.syncBusy();
        this.notify();
        const result: WriteResult = await this.applyVisibility(generation, entry.id, entry.target, true);
        if (!this.isCurrent(generation)) { return; }
        const completed: BatchJournal = copyJournal(this.journal);
        const completedPlan: BatchPlan | undefined = completed.batches
          .find((p: BatchPlan) => p.batchId === preview.batchId);
        const completedRow: BatchItem | undefined = completedPlan?.items.find((r: BatchItem) => r.id === entry.id);
        if (completedRow === undefined || completedPlan === undefined) { return; }
        const status = result === WriteResult.CONFIRMED ? 'confirmed' :
          (result === WriteResult.MISMATCH || result === WriteResult.FAILED ? 'failed' : 'unknown');
        if (preview.mode === 'restore') { completedRow.restoreResult = status; } else { completedRow.result = status; }
        completedRow.retryBlocked = this.terminalWrite;
        const observed: ShortcutItem | undefined = this.view.items.find((item: ShortcutItem) => item.id === entry.id);
        completedRow.lastKnown = this.view.queryError.length === 0 && observed !== undefined &&
          observed.visibleExplicit;
        if (observed !== undefined) { completedRow.lastVisible = observed.visible; }
        completedPlan.interrupted = false;
        if (!await this.persistJournal(completed, generation)) { return; }
      }
      this.view.batchMessage = '批次结束；逐项结果见下方，未知不代表失败，补偿不保证原子性';
    } finally {
      this.finishBatchSpan(span);
      this.finishSetting();
    }
  }

  private async bounded<T>(work: Promise<T>, timeoutMs: number): Promise<T> {
    if (timeoutMs <= 0) { return work; }
    let timer: number = -1;
    const timeout: Promise<T> = new Promise<T>((_, reject) => {
      timer = setTimeout(() => reject(new Error('batch-operation-timeout')), timeoutMs);
    });
    try { return await Promise.race([work, timeout]); } finally { clearTimeout(timer); }
  }

  private batchAvailable(): boolean {
    return this.view.batchReady && !this.view.batchLoading && this.available('显隐批次', '本应用', true);
  }

  private beginBatchSpan(stage: string): BatchSpan | undefined {
    try { return this.telemetry.begin(stage); } catch (_) { return undefined; }
  }

  private finishBatchSpan(span: BatchSpan | undefined): void {
    if (span !== undefined) { try { this.telemetry.finish(span); } catch (_) {} }
  }

  private async persistJournal(next: BatchJournal, generation: number): Promise<boolean> {
    const span: BatchSpan | undefined = this.beginBatchSpan('persist');
    try {
      await this.batchStorage.write(JSON.stringify(next));
      if (!this.isCurrent(generation)) { return false; }
      this.journal = next;
      this.view.batchError = '';
      this.notify();
      return true;
    } catch (_) {
      if (this.isCurrent(generation)) {
        this.view.batchReady = false;
        this.view.batchPreview = undefined;
        this.view.batchError = '批次存档写入失败，已停止；先重新读取/核对，禁止盲目重试';
        this.notify();
      }
      return false;
    } finally {
      this.finishBatchSpan(span);
    }
  }

  clearRecords(): void {
    if (this.disposed) {
      return;
    }
    this.view.records = [];
    this.notify();
  }

  recordNavigation(target: string, message: string, status: string = '成功'): void {
    if (this.disposed) {
      return;
    }
    this.addRecord('页面跳转', target, status, message);
    this.notify();
  }

  private isShortcutSupported(): boolean {
    return this.api.isShortcutSupported();
  }

  private getAllShortcutInfoForSelf(): Promise<shortcutManager.ShortcutInfo[]> {
    return this.api.getAllShortcutInfoForSelf();
  }

  private setShortcutVisibleForSelf(id: string, visible: boolean): Promise<void> {
    return this.api.setShortcutVisibleForSelf(id, visible);
  }

  private startInitialization(): void {
    if (!this.initializing || this.disposed || this.checking || this.querying || this.setting) {
      return;
    }
    this.initializing = false;
    const generation: number = this.generation;
    this.checkSupport();
    if (this.isCurrent(generation) && this.view.supported) {
      this.refresh();
    }
    if (this.isCurrent(generation)) { void this.loadBatches(); }
  }

  private available(api: string, target: string, requireSupport: boolean): boolean {
    if (this.disposed || this.context === undefined) {
      return false;
    }
    if (this.checking || this.querying || this.setting) {
      this.addRecord(api, target, '未执行', '操作中，请稍后');
      this.notify();
      return false;
    }
    if (api === 'setShortcutVisibleForSelf' && this.uncompletedWrites.length > 0) {
      this.addRecord(api, target, '未执行', '旧设置请求仍在途，先核对，不重复写入');
      this.notify();
      return false;
    }
    if (requireSupport && !this.view.supported) {
      this.addRecord(api, target, '未执行', this.view.support === '不支持' ? '设备不支持' : '请先检测支持情况');
      this.notify();
      return false;
    }
    return true;
  }

  private async query(generation: number, reason: string, timeoutMs: number = 0): Promise<boolean> {
    if (!this.isCurrent(generation)) {
      return false;
    }
    const api: string = 'getAllShortcutInfoForSelf';
    this.querying = true;
    this.view.queryError = '';
    this.syncBusy();
    this.addRecord(api, '本应用', '调用', reason);
    this.notify();
    try {
      if (!this.isCurrent(generation)) {
        return false;
      }
      const infos: shortcutManager.ShortcutInfo[] = await this.bounded(this.getAllShortcutInfoForSelf(), timeoutMs);
      if (!this.isCurrent(generation)) {
        return false;
      }
      const items: ShortcutItem[] = [];
      for (const info of infos) {
        const item: ShortcutItem = new ShortcutItem(this.copyInfo(info), this.resolveTitle(info));
        item.status = item.visibleExplicit ? '已读取' : '默认显示';
        items.push(item);
      }
      this.view.items = items;
      this.view.lastQuery = clockText(Date.now());
      this.addRecord(api, '本应用', '成功', `返回 ${items.length} 项`);
      return true;
    } catch (error) {
      if (this.isCurrent(generation)) {
        const message: string = this.errorText(error as BusinessError);
        this.view.queryError = message;
        this.addRecord(api, '本应用', '失败', message);
      }
      return false;
    } finally {
      this.querying = false;
      this.syncBusy();
      this.notify();
      this.startInitialization();
    }
  }

  private async applyVisibility(generation: number, id: string, visible: boolean,
    verifyRejected: boolean = false): Promise<WriteResult> {
    if (!this.isCurrent(generation)) {
      return WriteResult.STALE;
    }
    const api: string = 'setShortcutVisibleForSelf';
    this.updateItem(id, '设置中', '');
    this.addRecord(api, id, '调用', `visible=${visible}`);
    this.notify();
    if (!this.isCurrent(generation)) {
      return WriteResult.STALE;
    }
    let rejected: boolean = false;
    this.terminalWrite = false;
    try {
      const writing: Promise<void> = this.setShortcutVisibleForSelf(id, visible);
      if (verifyRejected) {
        this.uncompletedWrites.push(id);
        const settled = (): void => {
          this.uncompletedWrites = this.uncompletedWrites.filter((value: string) => value !== id);
        };
        void writing.then(settled, settled);
      }
      await this.bounded(writing, verifyRejected ? this.batchTimeoutMs : 0);
    } catch (error) {
      if (!this.isCurrent(generation)) {
        return WriteResult.STALE;
      }
      const message: string = this.errorText(error as BusinessError);
      this.updateItem(id, '设置失败', message);
      this.addRecord(api, id, '失败', message);
      if (!verifyRejected) { return WriteResult.FAILED; }
      const code: number = (error as BusinessError).code;
      this.terminalWrite = code === 201 || code === 202 || code === 801 || code === 17700070;
      rejected = true;
    }
    if (!this.isCurrent(generation)) {
      return WriteResult.STALE;
    }
    if (!rejected) { this.addRecord(api, id, '成功', `接口完成，visible=${visible}`); }
    this.updateItem(id, '待核对', '');
    const queried: boolean = await this.query(generation, `设置后回读：${id}`, verifyRejected ? this.batchTimeoutMs : 0);
    if (!this.isCurrent(generation)) {
      return WriteResult.STALE;
    }
    if (!queried) {
      const message: string = `回读失败：${this.view.queryError}`;
      this.updateItem(id, '待核对', message);
      this.addRecord('可见性核对', id, '待核对', message);
      return WriteResult.PENDING;
    }
    const item: ShortcutItem | undefined = this.view.items.find((entry: ShortcutItem) => entry.id === id);
    if (item === undefined || !item.visibleExplicit) {
      const message: string = item === undefined ? '回读未返回该快捷方式' : '回读未返回 visible';
      this.updateItem(id, '待核对', message);
      this.addRecord('可见性核对', id, '待核对', message);
      return WriteResult.PENDING;
    }
    if (item.visible !== visible) {
      const message: string = `期望 visible=${visible}，回读 visible=${item.visible}`;
      this.updateItem(id, '回读不一致', message);
      this.addRecord('可见性核对', id, '回读不一致', message);
      return verifyRejected && this.uncompletedWrites.includes(id) ? WriteResult.PENDING : WriteResult.MISMATCH;
    }
    this.updateItem(id, '回读一致', '');
    this.addRecord('可见性核对', id, '回读一致', `visible=${visible}`);
    return WriteResult.CONFIRMED;
  }

  /** Release the owning operation's gate even if initialize changed its generation while it awaited I/O. */
  private finishSetting(): void {
    this.setting = false;
    this.writingId = '';
    this.syncBusy();
    this.notify();
    this.startInitialization();
  }

  private resultText(result: WriteResult): string {
    switch (result) {
      case WriteResult.CONFIRMED: return '回读一致';
      case WriteResult.MISMATCH: return '回读不一致';
      case WriteResult.PENDING: return '已提交，待核对';
      case WriteResult.FAILED: return '设置失败';
      default: return '操作已结束';
    }
  }

  private updateItem(id: string, status: string, error: string): void {
    for (const item of this.view.items) {
      if (item.id === id) {
        item.status = status;
        item.error = error;
      }
    }
  }

  private resolveTitle(info: shortcutManager.ShortcutInfo): string {
    const context: common.ApplicationContext | undefined = this.context;
    const label: string = info.label === undefined ? '' : info.label;
    if (context === undefined) {
      return label.length > 0 ? label : info.id;
    }
    let resourceContext: common.Context = context;
    if (info.moduleName !== undefined && info.moduleName.length > 0) {
      try {
        resourceContext = context.createModuleContext(info.moduleName);
      } catch (error) {
        this.addRecord('createModuleContext', info.id, '失败', this.errorText(error as BusinessError));
      }
    }
    if (info.labelId !== undefined && info.labelId > 0) {
      try {
        return resourceContext.resourceManager.getStringSync(info.labelId);
      } catch (error) {
        this.addRecord('resourceManager.getStringSync', info.id, '失败', this.errorText(error as BusinessError));
      }
    }
    let resourceName: string = '';
    if (label.startsWith('$string:')) {
      resourceName = label.substring(8);
    } else if (label.startsWith('app.string.')) {
      resourceName = label.substring(11);
    } else if (label.startsWith('@string/')) {
      resourceName = label.substring(8);
    }
    if (resourceName.length > 0) {
      const numericResource: boolean = label.startsWith('$string:') && /^[0-9]+$/.test(resourceName);
      const api: string = numericResource ? 'resourceManager.getStringSync' : 'resourceManager.getStringByNameSync';
      try {
        if (numericResource) {
          return resourceContext.resourceManager.getStringSync(Number(resourceName));
        }
        return resourceContext.resourceManager.getStringByNameSync(resourceName);
      } catch (error) {
        this.addRecord(api, info.id, '失败', this.errorText(error as BusinessError));
      }
      return info.id;
    }
    return label.length > 0 ? label : info.id;
  }

  private copyInfo(source: shortcutManager.ShortcutInfo): shortcutManager.ShortcutInfo {
    const copy: shortcutManager.ShortcutInfo = {
      id: source.id,
      bundleName: source.bundleName,
      appIndex: source.appIndex,
      sourceType: source.sourceType,
      moduleName: source.moduleName,
      hostAbility: source.hostAbility,
      icon: source.icon,
      iconId: source.iconId,
      label: source.label,
      labelId: source.labelId,
      visible: source.visible
    };
    if (source.wants !== undefined) {
      const wants: shortcutManager.ShortcutWant[] = [];
      for (const want of source.wants) {
        const wantCopy: shortcutManager.ShortcutWant = {
          targetBundle: want.targetBundle,
          targetModule: want.targetModule,
          targetAbility: want.targetAbility
        };
        if (want.parameters !== undefined) {
          const parameters: shortcutManager.ParameterItem[] = [];
          for (const parameter of want.parameters) {
            const parameterCopy: shortcutManager.ParameterItem = {
              key: parameter.key,
              value: parameter.value
            };
            parameters.push(parameterCopy);
          }
          wantCopy.parameters = parameters;
        }
        wants.push(wantCopy);
      }
      copy.wants = wants;
    }
    return copy;
  }

  private isCurrent(generation: number): boolean {
    return !this.disposed && this.context !== undefined && generation === this.generation;
  }

  private syncBusy(): void {
    if (this.disposed) {
      return;
    }
    this.view.checking = this.checking;
    this.view.querying = this.querying;
    this.view.busy = this.checking || this.querying || this.setting;
    this.view.settingId = this.setting ? this.writingId : '';
  }

  private addRecord(api: string, target: string, status: string, message: string): void {
    if (this.disposed) {
      return;
    }
    this.view.records.unshift(new CallRecord(++this.recordSequence, clockText(Date.now()), api,
      target, status, message));
    if (this.view.records.length > 60) {
      this.view.records = this.view.records.slice(0, 60);
    }
  }

  private errorText(error: BusinessError): string {
    if (error === undefined || error === null) {
      return 'code=未提供；无错误详情';
    }
    const code: string = error.code === undefined ? '未提供' : `${error.code}`;
    const message: string = error.message === undefined || error.message.length === 0 ? `${error}` : error.message;
    return `code=${code}；${message}`;
  }

  private notify(): void {
    if (this.disposed) {
      return;
    }
    const generation: number = this.generation;
    const listeners: ShortcutListener[] = this.listeners.slice();
    for (const listener of listeners) {
      if (!this.isCurrent(generation)) {
        return;
      }
      try {
        listener.callback();
      } catch (error) {
      }
    }
  }
}

export const shortcutService: ShortcutService = new ShortcutService();
