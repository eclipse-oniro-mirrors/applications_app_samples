import { common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { AppState, CallRecord, LaunchSample, MaintenanceFlow, MaintenanceStep, EvictionResult,
  emptyAppState } from './Types';
import { WorkloadSpec, workloadOf, verifyWorkload } from './WorkloadCatalog';
import { ExecutorClock, SafeExecutor } from './SafeExecutor';
import { AppPlatform, AppStateStore, BundleSnapshot, NativeAppPlatform } from './AppPlatform';
import { ExperimentLedger, ExperimentRecord, compareRecords, restoreRecords } from './ExperimentLedger';
import { ExperimentSeriesState, SeriesStartResult, SeriesPhase, SERIES_DEFAULT_REPETITIONS,
  seriesActive, validSeriesCount, restoreExperimentSeries } from './ExperimentSeries';
import { flowCompleted, recordOfFlow } from './ExperimentRecorder';
import { ReportFormat, ReportMeta, ExportOutcome, exportReport } from './report/ReportExport';
import { SERIES_HISTORY_LIMIT, SeriesComparison, restoreSeriesHistory, inputSeriesOwner,
  compareSeriesSamples } from './SeriesHistory';

interface CallError extends Error {
  code: number;
}

export interface StoredState {
  schema: number;
  nextId: number;
  snapFlag: string;
  snapAt: number;
  rebuildAt: number;
  logs: CallRecord[];
  launches: LaunchSample[];
  experiments?: ExperimentRecord[];
  series?: ExperimentSeriesState;
  seriesHistory?: ExperimentSeriesState[];
}

interface OptimizerConfig {
  evictFilePages: string[];
}

interface ActiveCall {
  record: CallRecord;
  started: number;
}

interface TargetValidation {
  values: string[];
  error: string;
}

const LOG_LIMIT: number = 100;
const LAUNCH_LIMIT: number = 60;
const TARGET_LIMIT: number = 32;
const MEMORY_TIMEOUT_MS: number = 10000;
const REBUILD_COOLDOWN_MS: number = 10000;
const LOCAL_ERROR: number = -1;
let singleton: AppService | undefined = undefined;

function shortText(value: string, limit: number = 160): string {
  return value.replace(/[\r\n\t]+/g, ' ').trim().slice(0, limit);
}

function errorCode(error: CallError): number {
  if (error === null || error === undefined) {
    return LOCAL_ERROR;
  }
  return typeof error.code === 'number' && Number.isFinite(error.code) ? error.code : LOCAL_ERROR;
}

function errorMessage(error: CallError): string {
  if (error === null || error === undefined) {
    return '调用失败';
  }
  return typeof error.message === 'string' && error.message.length > 0 ? shortText(error.message) : '调用失败';
}

function cloneCall(value: CallRecord): CallRecord {
  return {
    id: value.id,
    api: value.api,
    target: value.target,
    status: value.status,
    kind: value.kind,
    at: value.at,
    elapsed: value.elapsed,
    code: value.code,
    message: value.message,
    late: value.late
  };
}

function cloneLaunch(value: LaunchSample): LaunchSample {
  return {
    id: value.id,
    group: value.group,
    at: value.at,
    contentMs: value.contentMs,
    device: value.device,
    appVersion: value.appVersion
  };
}

function nonNegative(value: number): boolean {
  return typeof value === 'number' && Number.isFinite(value) && value >= 0;
}

function validFileName(value: string): boolean {
  return value.length > 0 && value.length <= 255 && !/[\/\\:\u0000-\u001f]/.test(value) &&
    /^.+\.(so|hap|hsp)$/.test(value);
}

function validCall(value: CallRecord): boolean {
  if (value === null || typeof value !== 'object') {
    return false;
  }
  return Number.isSafeInteger(value.id) && value.id > 0 && value.id < Number.MAX_SAFE_INTEGER &&
    typeof value.api === 'string' && value.api.length <= 120 && typeof value.target === 'string' &&
    value.target.length <= 4096 && typeof value.status === 'string' && typeof value.kind === 'string' &&
    ['pending', 'success', 'error', 'blocked', 'timeout'].indexOf(value.kind) >= 0 &&
    nonNegative(value.at) && nonNegative(value.elapsed) && typeof value.code === 'number' &&
    Number.isFinite(value.code) && typeof value.message === 'string' && value.message.length <= 1024 &&
    typeof value.late === 'boolean';
}

function validLaunch(value: LaunchSample): boolean {
  if (value === null || typeof value !== 'object') {
    return false;
  }
  return typeof value.id === 'string' && value.id.length > 0 && value.id.length <= 160 &&
    ['启用', '禁用', '初始'].indexOf(value.group) >= 0 && nonNegative(value.at) &&
    nonNegative(value.contentMs) && typeof value.device === 'string' && value.device.length <= 1024 &&
    typeof value.appVersion === 'string' && value.appVersion.length <= 256;
}

class PlatformClock implements ExecutorClock {
  private platform: AppPlatform;

  constructor(platform: AppPlatform) {
    this.platform = platform;
  }

  setTimeout(action: () => void, delay: number): number {
    return this.platform.setTimeout(action, delay);
  }

  clearTimeout(id: number): void {
    this.platform.clearTimeout(id);
  }
}

export class AppService {
  private readonly platform: AppPlatform;
  private state: AppState = emptyAppState();
  private store: AppStateStore | undefined = undefined;
  private flushChain: Promise<void> = Promise.resolve();
  private listeners: Map<number, () => void> = new Map<number, () => void>();
  private nextListenerId: number = 1;
  private nextCallId: number = 1;
  private nextFlowId: number = 1;
  private activeCalls: Map<number, ActiveCall> = new Map<number, ActiveCall>();
  private memoryTimers: Map<number, number> = new Map<number, number>();
  private disposed: boolean = false;
  private baseline: Uint8Array | undefined = undefined;
  private ledger: ExperimentLedger = new ExperimentLedger();
  private lastRebuildMono: number = -REBUILD_COOLDOWN_MS;
  private cooldownTimer: number = -1;
  private startupMono: number;
  private startupWall: number;
  private startupGroup: string;
  private launchId: string;
  private contentMarked: boolean = false;
  private appVersion: string = '';
  private environment: string = '';
  private readonly executor: SafeExecutor;
  private flowToken: number = 0;
  private series: ExperimentSeriesState | undefined = undefined;
  private history: ExperimentSeriesState[] = [];
  private seriesLease: string = '';
  private seriesPermit: string = '';
  private seriesDriving: boolean = false;
  private seriesWriteFailed: boolean = false;
  private seriesTaskOwner: string = '';
  private seriesTask: Promise<void> = Promise.resolve();
  private seriesCommit: Promise<boolean> = Promise.resolve(true);

  private constructor(platform: AppPlatform) {
    this.platform = platform;
    this.executor = new SafeExecutor(new PlatformClock(platform), (): void => { this.executorChanged(); });
    this.startupMono = platform.now();
    this.startupWall = platform.wallNow();
    this.restore();
    this.startupGroup = this.state.snapFlag === '启用' ? '启用' :
      (this.state.snapFlag === '禁用' ? '禁用' : '初始');
    this.launchId = platform.randomId();
    this.environment = platform.environment();
    this.state.deviceText = this.environment;
  }

  static fromPlatform(platform: AppPlatform): AppService {
    return new AppService(platform);
  }

  static initialize(context: common.UIAbilityContext): AppService {
    if (singleton === undefined) {
      singleton = new AppService(new NativeAppPlatform(context));
    }
    return singleton;
  }

  getState(): AppState {
    return {
      deviceText: this.state.deviceText,
      foreground: this.state.foreground,
      files: this.state.files.slice(),
      modules: this.state.modules.slice(),
      targetMessage: this.state.targetMessage,
      configText: this.state.configText,
      configStatus: this.state.configStatus,
      configTargets: this.state.configTargets.slice(),
      maintenance: this.state.maintenance === undefined ? undefined : this.state.maintenance.clone(),
      maintenanceBusy: this.state.maintenanceBusy,
      memoryBusy: this.state.memoryBusy,
      resourceBusy: this.state.resourceBusy,
      resourceText: this.state.resourceText,
      latestMemory: this.state.latestMemory === undefined ? undefined : cloneCall(this.state.latestMemory),
      snapFlag: this.state.snapFlag,
      snapAt: this.state.snapAt,
      rebuildAt: this.state.rebuildAt,
      rebuildWaitSeconds: this.rebuildWaitSeconds(),
      logs: this.state.logs.map((value: CallRecord): CallRecord => cloneCall(value)),
      launches: this.state.launches.map((value: LaunchSample): LaunchSample => cloneLaunch(value)),
      storageMessage: this.state.storageMessage,
      notice: this.state.notice
    };
  }

  subscribe(listener: () => void): number {
    const id = this.nextListenerId++;
    this.listeners.set(id, listener);
    return id;
  }

  unsubscribe(id: number): void {
    this.listeners.delete(id);
  }

  whenSaved(): Promise<void> {
    return this.flushChain;
  }

  isExperimentBusy(): boolean {
    return this.seriesLease.length > 0 || this.executor.busy() || this.state.resourceBusy;
  }

  isQuarantined(): boolean { return this.executor.quarantined(); }

  cancelExperiment(): void {
    if (this.seriesLease.length > 0) {
      this.cancelExperimentSeries(this.seriesLease);
    } else {
      this.executor.cancel();
    }
  }

  seriesState(): ExperimentSeriesState | undefined {
    return this.series === undefined ? undefined : this.snapshotSeriesState(this.series);
  }

  private snapshotSeriesState(state: ExperimentSeriesState): ExperimentSeriesState {
    const copy = state.clone();
    copy.leaseHeld = this.seriesLease === state.ownerId;
    copy.waitingForSdk = copy.leaseHeld && this.executor.quarantined();
    const records = this.recordsForSeries(state);
    copy.missingRecordIds = copy.recordIds.filter((id: string): boolean =>
      !records.some((record: ExperimentRecord): boolean => record.id === id));
    return copy;
  }

  /** Returns only real ledger records referenced by the selected series, in execution order. */
  seriesRecords(ownerId: string): ExperimentRecord[] {
    const state = this.series;
    return state === undefined || state.ownerId !== ownerId ? [] : this.recordsForSeries(state);
  }

  private recordsForSeries(state: ExperimentSeriesState): ExperimentRecord[] {
    const all = this.ledger.all();
    const result: ExperimentRecord[] = [];
    state.recordIds.forEach((id: string): void => {
      const record = all.find((item: ExperimentRecord): boolean => item.id === id &&
        item.workloadId === state.workloadId && item.mode === state.mode);
      if (record !== undefined) { result.push(record); }
    });
    return result;
  }

  seriesHistory(): ExperimentSeriesState[] {
    return this.history.map((state: ExperimentSeriesState): ExperimentSeriesState => this.snapshotSeriesState(state));
  }

  seriesHistoryRecords(ownerId: string): ExperimentRecord[] {
    const state = this.history.find((item: ExperimentSeriesState): boolean => item.ownerId === ownerId);
    return state === undefined ? [] : this.recordsForSeries(state);
  }

  compareExperimentSeries(leftOwnerId: string, rightOwnerId: string): SeriesComparison {
    const left = this.history.find((state: ExperimentSeriesState): boolean => state.ownerId === leftOwnerId);
    const right = this.history.find((state: ExperimentSeriesState): boolean => state.ownerId === rightOwnerId);
    return compareSeriesSamples(left, right, this.ledger.all());
  }

  seriesHistoryReport(ownerId: string, format: ReportFormat): ExportOutcome {
    const state = this.history.find((item: ExperimentSeriesState): boolean => item.ownerId === ownerId);
    if (state === undefined || [ReportFormat.MARKDOWN, ReportFormat.CSV].indexOf(format) < 0) {
      const failure = new ExportOutcome(); failure.format = format;
      failure.check.findings.push(state === undefined ? '所选系列不存在或元信息已淘汰' : '报告格式无效');
      return failure;
    }
    const records = this.recordsForSeries(state);
    const missing: number = state.recordIds.length - records.length;
    return exportReport(records, new ReportMeta('所选系列历史报告', this.platform.wallNow(),
      `仅所选系列；负载 ${state.workloadId}；模式 ${state.mode}；计划 ${state.repetitions} 次`,
      `状态 ${state.phase}；实际开始 ${state.startedCount}；已结束 ${state.recordIds.length}；` +
      `可用 ${records.length}；缺失 ${missing}；${state.message}`), format);
  }

  /** Historical selection feedback belongs to its controller, never to the current experiment notice. */
  async copySeriesHistoryReport(ownerId: string, format: ReportFormat): Promise<boolean> {
    if (this.disposed) { return false; }
    const report = this.seriesHistoryReport(ownerId, format);
    return report.ok ? await this.copyTextResult(report.text, '', false) : false;
  }

  startExperimentSeries(workloadId: string, mode: string,
    repetitions: number = SERIES_DEFAULT_REPETITIONS): SeriesStartResult {
    if (this.disposed) { return new SeriesStartResult(false, '', '服务已释放'); }
    if (workloadOf(workloadId) === undefined || ['control', 'files', 'modules'].indexOf(mode) < 0 ||
      !validSeriesCount(repetitions)) { return new SeriesStartResult(false, '', '负载、模式或重复次数无效（允许1–10次）'); }
    if (this.isExperimentBusy()) { return new SeriesStartResult(false, '', '已有实验或系统请求在途'); }
    if (this.store === undefined) { return new SeriesStartResult(false, '', '存储不可用，未开始系列'); }
    const state = new ExperimentSeriesState();
    state.ownerId = `series-${this.platform.randomId()}`;
    state.workloadId = workloadId;
    state.mode = mode;
    state.repetitions = repetitions;
    state.startedAt = this.platform.wallNow();
    state.message = '准备保存系列计划；失败或条件变化即停止，不自动重试';
    this.series = state;
    this.history.unshift(state);
    this.history = this.history.slice(0, SERIES_HISTORY_LIMIT);
    this.seriesLease = state.ownerId;
    this.seriesDriving = true;
    this.seriesWriteFailed = false;
    this.seriesTaskOwner = state.ownerId;
    const saved = this.persist();
    this.seriesTask = this.driveSeries(state.ownerId, saved);
    this.emit();
    return new SeriesStartResult(true, state.ownerId, '系列已接受，等待计划保存');
  }

  stopExperimentSeries(ownerId: string): boolean {
    const state = this.ownedSeries(ownerId);
    if (state === undefined || !seriesActive(state.phase) || state.stopRequested || state.cancelRequested) {
      return false;
    }
    state.stopRequested = true;
    state.phase = SeriesPhase.STOPPING;
    state.message = '已请求本次完成后停止；不取消当前SDK等待';
    this.persist(); this.emit();
    return true;
  }

  cancelExperimentSeries(ownerId: string): boolean {
    const state = this.ownedSeries(ownerId);
    if (state === undefined || !seriesActive(state.phase) || state.cancelRequested) { return false; }
    state.cancelRequested = true;
    state.phase = SeriesPhase.CANCELLING;
    state.message = '已取消本地等待；不会取消SDK或自动继续剩余次数';
    this.executor.cancel();
    this.persist(); this.emit();
    return true;
  }

  /** Local scheduling finished; an unsettled SDK can still hold the global lease. */
  whenSeriesFinished(ownerId: string): Promise<void> {
    return this.seriesTaskOwner === ownerId ? this.seriesTask : Promise.resolve();
  }

  async copySeriesAnalysisReport(ownerId: string): Promise<boolean> {
    if (this.disposed) { return false; }
    const state = this.seriesState();
    if (state === undefined || state.ownerId !== ownerId) {
      this.state.notice = '系列报告未生成：系列不存在或已被新系列替换'; this.emit(); return false;
    }
    const records = this.seriesRecords(ownerId);
    const meta = new ReportMeta('真实重复实验系列报告', this.platform.wallNow(),
      `仅本系列；负载 ${state.workloadId}；模式 ${state.mode}；计划 ${state.repetitions} 次`,
      `状态 ${state.phase}；实际开始 ${state.startedCount} 次；已结束 ${state.recordIds.length} 次；` +
      `可用 ${records.length} 条；缺失 ${state.missingRecordIds.length} 条；保存 ${state.saveState}；${state.message}`);
    const report = exportReport(records, meta, ReportFormat.MARKDOWN);
    if (!report.ok) {
      this.state.notice = `系列报告未生成：${report.check.summary()}`; this.emit(); return false;
    }
    const copied = await this.copyTextResult(report.text, ownerId);
    if (copied && this.series?.ownerId === ownerId) {
      this.state.notice = '已复制本系列分析报告（Markdown）'; this.emit();
    }
    return copied;
  }

  private ownedSeries(ownerId: string): ExperimentSeriesState | undefined {
    return ownerId.length > 0 && this.seriesLease === ownerId && this.series?.ownerId === ownerId ?
      this.series : undefined;
  }

  private seriesSaveResult(ownerId: string, saved: boolean): void {
    const state = this.ownedSeries(ownerId);
    if (state === undefined) { return; }
    state.saveState = saved ? 'saved' : 'failed';
    if (!saved || this.seriesWriteFailed) {
      state.phase = SeriesPhase.SAVE_FAILED;
      state.activeIteration = 0;
      state.endedAt = this.platform.wallNow();
      state.message = saved ? '系列期间曾出现写入失败，已停止后续次数；当前终态快照已保存' :
        '存储写入失败，已停止后续次数；当前未落盘结果仅保留在内存，可复制报告';
      this.state.notice = state.message;
    }
    this.emit();
  }

  private async saveSeries(ownerId: string): Promise<boolean> {
    const state = this.ownedSeries(ownerId);
    if (state === undefined) { return false; }
    state.saveState = 'saving';
    const saved = await this.persist();
    this.seriesSaveResult(ownerId, saved);
    return saved && !this.seriesWriteFailed;
  }

  private async driveSeries(ownerId: string, initialSave: Promise<boolean>): Promise<void> {
    try {
      const initial = await initialSave;
      this.seriesSaveResult(ownerId, initial);
      if (!initial || this.seriesWriteFailed) { return; }
      while (!this.disposed) {
        const state = this.ownedSeries(ownerId);
        if (state === undefined || !seriesActive(state.phase) || state.stopRequested ||
          state.cancelRequested || state.conditionChanged || state.recordIds.length >= state.repetitions) { break; }
        state.phase = SeriesPhase.PREPARING;
        state.activeIteration = state.recordIds.length + 1;
        state.message = `准备第 ${state.activeIteration} / ${state.repetitions} 次真实实验`;
        if (!await this.saveSeries(ownerId)) { break; }
        const current = this.ownedSeries(ownerId);
        if (current === undefined || current.stopRequested || current.cancelRequested ||
          current.conditionChanged || this.disposed) {
          break;
        }
        // Synchronously consumed by runExperiment before its first await. No UI receives this permission.
        this.seriesPermit = ownerId;
        const record = await this.runExperiment(current.workloadId, current.mode);
        this.seriesPermit = '';
        if (record === undefined) {
          current.phase = SeriesPhase.FAILED;
          current.message = '单次实验未被接受，系列已停止；未制造记录或自动重试';
          break;
        }
        const committed = await this.seriesCommit;
        this.seriesSaveResult(ownerId, committed);
        if (!committed || this.seriesWriteFailed) { break; }
      }
    } catch (error) {
      const state = this.ownedSeries(ownerId);
      if (state !== undefined) {
        state.phase = SeriesPhase.FAILED;
        state.message = '系列执行异常，已停止；请查看实际阶段记录';
        this.executor.cancel();
      }
    } finally {
      const state = this.ownedSeries(ownerId);
      if (state !== undefined) {
        this.seriesPermit = '';
        if (seriesActive(state.phase)) {
          state.phase = state.conditionChanged ? SeriesPhase.CONDITION_CHANGED :
            state.cancelRequested || this.disposed ? SeriesPhase.CANCELLED :
            state.recordIds.length >= state.repetitions ? SeriesPhase.COMPLETED : SeriesPhase.STOPPED;
        }
        state.activeIteration = 0;
        state.endedAt = this.platform.wallNow();
        if (state.phase !== SeriesPhase.SAVE_FAILED || state.saveState === 'saved') { await this.saveSeries(ownerId); }
        this.seriesDriving = false;
        this.releaseSeriesLease();
        this.emit();
      }
    }
  }

  private releaseSeriesLease(): void {
    const state = this.series;
    if (!this.seriesDriving && state !== undefined && !seriesActive(state.phase) &&
      !this.executor.busy() && !this.state.resourceBusy && this.seriesLease === state.ownerId) {
      this.seriesLease = '';
    }
  }

  private attachSeriesRecord(ownerId: string, record: ExperimentRecord): void {
    const state = this.ownedSeries(ownerId);
    if (state === undefined) { return; }
    state.recordIds.push(record.id);
    state.activeIteration = 0;
    state.saveState = 'saving';
    if (state.conditionChanged) {
      state.phase = SeriesPhase.CONDITION_CHANGED;
    } else if (state.cancelRequested || this.disposed) {
      state.phase = SeriesPhase.CANCELLED;
    } else if (!record.complete()) {
      state.phase = SeriesPhase.FAILED;
      state.message = '本次实验失败、超时或缺失，系列已停止；不会自动重试';
    } else {
      if (state.baselineRecordId.length === 0) {
        state.baselineRecordId = record.id;
      } else {
        const baseline = this.ledger.all().find((item: ExperimentRecord): boolean =>
          item.id === state.baselineRecordId);
        if (baseline === undefined || !compareRecords(baseline, record).comparable) {
          state.conditionChanged = true;
          state.phase = SeriesPhase.CONDITION_CHANGED;
          state.message = '采样条件或资源内容发生变化，已停止；不同条件不会合并为同条件结论';
        }
      }
      if (!state.conditionChanged) {
        state.phase = state.stopRequested ? SeriesPhase.STOPPED :
          state.recordIds.length >= state.repetitions ? SeriesPhase.COMPLETED : SeriesPhase.RUNNING;
        state.message = state.phase === SeriesPhase.COMPLETED ? '计划次数已完成，所有样本由真实实验生成' :
          state.stopRequested ? '本次已完成，按请求停止剩余次数' : `已提交第 ${state.recordIds.length} 次，等待保存后继续`;
      }
    }
    if (!seriesActive(state.phase)) { state.endedAt = this.platform.wallNow(); }
  }

  dispose(): void {
    if (this.seriesLease.length > 0) {
      this.cancelExperimentSeries(this.seriesLease);
    } else {
      this.executor.cancel();
    }
    this.disposed = true;
    this.memoryTimers.forEach((timer: number): void => {
      this.platform.clearTimeout(timer);
    });
    this.memoryTimers.clear();
    if (this.cooldownTimer >= 0) {
      this.platform.clearInterval(this.cooldownTimer);
      this.cooldownTimer = -1;
    }
    this.listeners.clear();
  }

  refreshTargets(): void {
    let moduleMessage = '';
    const bundle = this.readBundleInfo();
    if (bundle !== undefined) {
      this.state.modules = [];
      bundle.modules.forEach((module: string): void => {
        if (module.length > 0 && this.state.modules.indexOf(module) < 0) {
          this.state.modules.push(module);
        }
      });
      moduleMessage = `${this.state.modules.length} 个模块`;
    } else {
      moduleMessage = '模块读取失败';
    }

    const id = this.beginCall('listFileSync', 'bundleCodeDir');
    try {
      const names = this.platform.listFiles();
      const files: string[] = [];
      names.forEach((path: string): void => {
        const name = path.slice(path.lastIndexOf('/') + 1);
        if (validFileName(name) && files.indexOf(name) < 0) {
          files.push(name);
        }
      });
      this.state.files = files.sort();
      this.state.targetMessage = `${files.length} 个文件 · ${moduleMessage}`;
      this.finishCall(id, 'success', 0, `${files.length} 个文件`);
    } catch (error) {
      this.state.files = [];
      this.state.targetMessage = `文件读取失败 · ${moduleMessage} · 可手动输入文件名`;
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
    }
  }

  checkConfig(): void {
    const id = this.beginCall('getRawFileContentSync', 'memory_optimizer.json');
    try {
      const text = this.platform.readConfig();
      this.state.configText = text.trim();
      const config = JSON.parse(text) as OptimizerConfig;
      if (config === null || typeof config !== 'object' || !Array.isArray(config.evictFilePages)) {
        this.state.configStatus = '配置无效';
        this.state.configTargets = [];
        this.finishCall(id, 'error', LOCAL_ERROR, '缺少 evictFilePages');
        return;
      }
      const names = config.evictFilePages;
      if (names.length === 0 || names.length > TARGET_LIMIT ||
        names.some((name: string): boolean => typeof name !== 'string' || !validFileName(name))) {
        this.state.configStatus = '配置无效';
        this.state.configTargets = [];
        this.finishCall(id, 'error', LOCAL_ERROR, '文件列表无效');
        return;
      }
      this.state.configStatus = '配置有效';
      this.state.configTargets = names.slice();
      this.finishCall(id, 'success', 0, `${names.length} 项`);
    } catch (error) {
      this.state.configStatus = '配置读取失败';
      this.state.configTargets = [];
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
    }
  }

  /**
   * Runs the real maintenance recipe: discover targets, validate the shipped
   * config, load a representative resource, evict the configured files and
   * re-read the config. Every step reports its own result; the final note makes
   * clear that a successful request or config re-read is not proof that resident
   * pages dropped.
   */
  async runMaintenanceFlow(mode: string = 'files'): Promise<void> {
    await this.runExperiment('W-TEXT', mode);
  }

  /** The lab and the original maintenance UI share this single production execution path. */
  async runExperiment(workloadId: string, mode: string): Promise<ExperimentRecord | undefined> {
    const ownerId: string = this.seriesPermit;
    this.seriesPermit = '';
    if (this.seriesLease.length > 0 && ownerId !== this.seriesLease) { return undefined; }
    const spec = workloadOf(workloadId);
    if (this.disposed || this.executor.busy() || this.state.resourceBusy || spec === undefined ||
      ['control', 'files', 'modules'].indexOf(mode) < 0) { return undefined; }
    const token: number = this.executor.acquire();
    if (token === 0) { return undefined; }
    const series = this.ownedSeries(ownerId);
    if (series !== undefined) {
      series.startedCount++;
      series.phase = SeriesPhase.RUNNING;
      series.message = `正在第 ${series.startedCount} / ${series.repetitions} 次真实实验`;
    }
    this.flowToken = token;
    const flow = new MaintenanceFlow();
    flow.id = this.nextFlowId++;
    flow.mode = mode;
    try {
      await this.executeFlow(flow, spec, token);
    } catch (error) {
      this.stopFlow(flow, '已停止：执行异常');
    } finally {
      if (flow.endedAt === 0) { this.stopFlow(flow, '已停止：执行未结束'); }
      this.state.maintenanceBusy = false;
      this.executor.release(token); this.flowToken = 0;
    }
    const record = this.recordExperiment(flow, spec, ownerId);
    this.emit();
    return record;
  }

  private async executeFlow(flow: MaintenanceFlow, spec: WorkloadSpec, token: number): Promise<void> {
    const normalized: string = flow.mode;
    const foregroundAtStart: boolean = this.state.foreground;
    flow.status = '运行中';
    flow.startedAt = this.platform.wallNow();
    flow.steps = [
      this.newStep('discover', '发现目标'),
      this.newStep('config', '校验配置'),
      this.newStep('warm', '读取工作负载'),
      this.newStep('evict', normalized === 'control' ? '对照组（不下发回收）' :
        (normalized === 'modules' ? '回收模块' : '回收文件页')),
      this.newStep('reread', '重读业务资源并校验'),
      this.newStep('configAgain', '回读配置')
    ];
    this.state.maintenance = flow;
    this.state.maintenanceBusy = true;
    this.emit();

    const discovered: boolean = await this.runFlowStep(flow, 0, async (): Promise<boolean> => {
      this.refreshTargets();
      const ok: boolean = this.state.files.length > 0 || this.state.modules.length > 0;
      flow.steps[0].detail = this.state.targetMessage;
      return ok;
    });
    if (!discovered) {
      this.stopFlow(flow, '已停止：未发现可用目标');
      return;
    }

    const configured: boolean = await this.runFlowStep(flow, 1, async (): Promise<boolean> => {
      this.checkConfig();
      flow.steps[1].detail = `${this.state.configStatus} · ${this.state.configTargets.length} 项`;
      const installed: boolean = normalized !== 'files' || this.state.configTargets.every((name: string): boolean =>
        this.state.files.indexOf(name) >= 0);
      if (!installed) { flow.steps[1].detail += ' · 配置目标未在安装目录证实'; }
      return this.state.configStatus === '配置有效' && installed;
    });
    if (!configured) {
      this.stopFlow(flow, '已停止：配置无效，未下发回收');
      return;
    }

    const configText: string = this.state.configText;
    const fileTargets: string[] = this.state.configTargets.slice();
    const moduleTargets: string[] = this.state.modules.slice();
    flow.condition = JSON.stringify([this.environment, this.appVersion, foregroundAtStart,
      spec.id, spec.rawFile, this.state.files.slice().sort(), moduleTargets.slice().sort(),
      fileTargets.slice().sort()]);
    const warmed: boolean = await this.runFlowStep(flow, 2, async (): Promise<boolean> => {
      try {
        const bytes: Uint8Array = await this.readFlowResource(spec, token);
        flow.beforeBytes = bytes.length;
        flow.digestBefore = this.digest(bytes);
        flow.steps[2].detail = `${bytes.length} 字节 · FNV ${flow.digestBefore} 已读入`;
        return true;
      } catch (error) {
        flow.steps[2].detail = `读取失败：${errorCode(error as CallError)}`;
        return false;
      }
    });
    if (!warmed) {
      this.stopFlow(flow, '已停止：工作负载读取失败，未下发回收');
      return;
    }

    const evicted: boolean = await this.runFlowStep(flow, 3, async (): Promise<boolean> => {
      if (normalized === 'control') {
        flow.steps[3].detail = '对照组：未调用回收接口，作为同条件参照';
        return true;
      }
      const modules: boolean = normalized === 'modules';
      const targets: string[] = modules ? moduleTargets.slice() : fileTargets.slice();
      if (targets.length === 0) {
        flow.steps[3].detail = modules ? '无可用模块目标' : '无可用文件目标';
        return false;
      }
      const request: EvictionResult = await this.requestEviction(targets, modules, token);
      const ok: boolean = request.status === 'success';
      const latest = this.state.latestMemory;
      flow.steps[3].detail = latest === undefined ? '无回收结果' :
        `${modules ? '模块' : '文件'} · ${latest.status} · ${latest.message}`;
      return ok;
    });
    if (!evicted) {
      this.stopFlow(flow, '已停止：回收请求失败或被拦截');
      return;
    }

    await this.runFlowStep(flow, 4, async (): Promise<boolean> => {
      try {
        const bytes: Uint8Array = await this.readFlowResource(spec, token);
        flow.afterBytes = bytes.length;
        flow.digestAfter = this.digest(bytes);
        const same: boolean = flow.afterBytes === flow.beforeBytes && flow.digestAfter === flow.digestBefore;
        flow.integrity = same ? '业务资源校验一致' : '业务资源校验不一致';
        flow.steps[4].detail = `${flow.afterBytes} 字节 · FNV ${flow.digestAfter} · ${flow.integrity}`;
        return same;
      } catch (error) {
        flow.integrity = '业务资源重读失败';
        flow.steps[4].detail = `重读失败：${errorCode(error as CallError)}`;
        return false;
      }
    });
    await this.runFlowStep(flow, 5, async (): Promise<boolean> => {
      try {
        const text: string = this.platform.readConfig().trim();
        const same: boolean = text === configText;
        flow.steps[5].detail = same ? '配置回读一致；不代表驻留页已下降' : '配置回读与首次不一致';
        return same;
      } catch (error) {
        flow.steps[5].detail = `回读失败：${errorCode(error as CallError)}`;
        return false;
      }
    });
    if (this.executor.reason().length > 0) { this.stopFlow(flow, '已停止'); return; }
    const complete: boolean = flow.steps.every((step: MaintenanceStep): boolean => step.status === '成功');
    flow.status = complete ? '已完成' : '已完成（含失败）';
    const modeText: string = normalized === 'control' ? '对照组' : (normalized === 'modules' ? '模块回收' : '文件回收');
    flow.notice = complete ?
      `${modeText}流程已完成；业务资源长度与校验值已比对，${flow.integrity}；回收效果仍需独立观测。` :
      `流程已结束（${modeText}），${flow.integrity}；请查看失败阶段，未观测到驻留页变化时不得判定为零回收。`;
    flow.endedAt = this.platform.wallNow();
    this.state.maintenanceBusy = false;
    this.state.notice = flow.status;
    this.emit();
  }

  private async readFlowResource(spec: WorkloadSpec, token: number): Promise<Uint8Array> {
    const result = await this.executor.wait(token, (): Promise<Uint8Array> => this.platform.readResource(spec.rawFile));
    if (result.status !== 'success' || result.value === undefined) {
      if (result.error !== undefined) { throw result.error; }
      throw new Error(result.status);
    }
    const check = verifyWorkload(spec, result.value);
    if (!check.ok) { throw new Error(check.headline); }
    return result.value;
  }

  /** Every accepted run, including early stop, contributes exactly one terminal record. */
  private recordExperiment(flow: MaintenanceFlow, spec: WorkloadSpec, ownerId: string = ''): ExperimentRecord {
    const missing: string[] = [];
    if (!flowCompleted(flow)) {
      missing.push('流程未正常结束，结论不作成功样本');
    }
    missing.push('驻留页不可观测，回收效果不量化');
    const record: ExperimentRecord = recordOfFlow(flow, spec.id, spec.label, missing);
    record.id = this.platform.randomId();
    record.asset = spec.rawFile;
    record.condition = flow.condition;
    record.requestStatus = flow.mode === 'control' ? 'not-requested' : flow.steps[3].status;
    const stored = this.ledger.append(record);
    // This one snapshot contains the real record, its series reference and progress together.
    this.attachSeriesRecord(ownerId, stored);
    const saved = this.persist();
    if (this.ownedSeries(ownerId) !== undefined) { this.seriesCommit = saved; }
    return stored;
  }

  /** 账本快照（副本，调用方不能改内部状态）。 */
  ledgerRecords(): ExperimentRecord[] {
    return this.ledger.all();
  }

  /** 追加一条实验记录并落盘。 */
  appendExperiment(record: ExperimentRecord): void {
    if (this.seriesLease.length > 0) {
      this.state.notice = '系列占用期间不能追加外部记录'; this.emit(); return;
    }
    this.ledger.append(record);
    this.persist();
    this.emit();
  }

  /** 脱敏导出文本。 */
  exportLedger(): string {
    return this.ledger.exportText();
  }

  /** 清空账本并落盘。 */
  clearLedger(): void {
    if (this.isExperimentBusy()) { this.state.notice = '实验或系统请求在途，不能清空账本'; this.emit(); return; }
    this.ledger.clear();
    this.persist();
    this.emit();
  }

  private digest(bytes: Uint8Array): string {
    let hash: number = 2166136261;
    for (let index = 0; index < bytes.length; index++) {
      hash ^= bytes[index];
      hash = Math.imul(hash, 16777619) >>> 0;
    }
    return hash.toString(16).padStart(8, '0');
  }

  async readResource(): Promise<void> {
    if (this.isExperimentBusy()) {
      this.block('getRawFileContent', 'sample.txt', '资源读取中');
      return;
    }
    this.state.resourceBusy = true;
    const id = this.beginCall('getRawFileContent', 'sample.txt');
    try {
      const bytes = await this.platform.readResource();
      const text = util.TextDecoder.create('utf-8').decodeToString(bytes);
      this.baseline = new Uint8Array(bytes);
      this.state.resourceText = `${bytes.length} 字节 · ${text.trim().slice(0, 1000)}`;
      this.state.resourceBusy = false;
      this.state.notice = '读取成功';
      this.finishCall(id, 'success', 0, `${bytes.length} 字节`);
    } catch (error) {
      this.state.resourceBusy = false;
      this.state.resourceText = '读取失败';
      this.state.notice = '读取失败';
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
    }
  }

  async verifyResource(): Promise<void> {
    if (this.isExperimentBusy()) {
      this.block('getRawFileContent', 'sample.txt · 校验', '资源读取中');
      return;
    }
    const baseline = this.baseline;
    if (baseline === undefined) {
      this.block('getRawFileContent', 'sample.txt · 校验', '请先读取资源');
      return;
    }
    this.state.resourceBusy = true;
    const id = this.beginCall('getRawFileContent', 'sample.txt · 校验');
    try {
      const bytes = await this.platform.readResource();
      let same = bytes.length === baseline.length;
      if (same) {
        for (let index = 0; index < bytes.length; index++) {
          if (bytes[index] !== baseline[index]) {
            same = false;
            break;
          }
        }
      }
      const result = same ? '校验一致' : '校验不一致';
      this.state.resourceBusy = false;
      this.state.resourceText = `${result} · ${bytes.length} 字节`;
      this.state.notice = result;
      this.finishCall(id, 'success', 0, result);
    } catch (error) {
      this.state.resourceBusy = false;
      this.state.resourceText = '校验失败';
      this.state.notice = '校验失败';
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
    }
  }

  async evictFiles(targets: string[]): Promise<EvictionResult> {
    return this.requestEviction(targets, false);
  }

  async evictModules(targets: string[]): Promise<EvictionResult> {
    return this.requestEviction(targets, true);
  }

  private async requestEviction(targets: string[], modules: boolean, owner: number = 0): Promise<EvictionResult> {
    const result = new EvictionResult();
    if (this.disposed || (owner === 0 && this.isExperimentBusy())) {
      this.block(modules ? 'evictModuleFilePages' : 'evictFilePages', targets.join(','), '上一调用仍在等待');
      return result;
    }
    const token: number = owner === 0 ? this.executor.acquire() : owner;
    const waiting = await this.executor.wait(token, (): Promise<boolean> => this.evict(targets, modules));
    const latest = this.state.latestMemory;
    result.status = waiting.status === 'success' ? (waiting.value === true ? 'success' :
      latest?.kind === 'blocked' ? 'not-dispatched' : 'rejected') : waiting.status;
    result.dispatched = latest !== undefined && latest.kind !== 'blocked';
    result.inFlight = this.executor.quarantined();
    result.code = latest === undefined ? -1 : latest.code;
    result.recordId = latest === undefined ? 0 : latest.id;
    if (owner === 0) { this.executor.release(token); }
    return result;
  }

  setSnapEnabled(flag: boolean): void {
    const api = 'setHyperSnapEnabled';
    const target = flag ? '启用' : '禁用';
    if (this.seriesLease.length > 0) {
      this.block(api, target, '实验系列占用期间不能更改快启设置'); return;
    }
    if (!this.platform.canSetSnap()) {
      this.block(api, target, '请升级系统');
      return;
    }
    const id = this.beginCall(api, target);
    try {
      this.platform.setSnapEnabled(flag);
    } catch (error) {
      this.state.notice = '设置失败';
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return;
    }
    this.state.snapFlag = target;
    this.state.snapAt = this.platform.wallNow();
    this.state.notice = `已${target}`;
    this.finishCall(id, 'success', 0, `已${target}`);
  }

  rebuildSnap(reason: string): void {
    const api = 'requestRebuildHyperSnap';
    const target = shortText(reason, 200) || '手动重建';
    if (this.seriesLease.length > 0) {
      this.block(api, target, '实验系列占用期间不能重建快启'); return;
    }
    if (this.rebuildWaitSeconds() > 0) {
      this.block(api, target, `请等待 ${this.rebuildWaitSeconds()} 秒`);
      return;
    }
    if (!this.platform.canRebuildSnap()) {
      this.block(api, target, '请升级系统');
      return;
    }
    const id = this.beginCall(api, target);
    try {
      this.platform.rebuildSnap();
    } catch (error) {
      this.state.notice = '重建请求失败';
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return;
    }
    this.lastRebuildMono = this.platform.now();
    this.state.rebuildAt = this.platform.wallNow();
    this.state.notice = '重建请求成功';
    this.finishCall(id, 'success', 0, '重建请求成功');
    this.startCooldownClock();
  }

  clearLogs(): void {
    this.state.logs = this.state.logs.filter((record: CallRecord): boolean => this.activeCalls.has(record.id));
    if (this.state.latestMemory !== undefined && !this.activeCalls.has(this.state.latestMemory.id)) {
      this.state.latestMemory = undefined;
    }
    this.state.notice = '日志已清空';
    this.persist();
    this.emit();
  }

  clearLaunches(): void {
    this.state.launches = [];
    this.state.notice = '启动记录已清空';
    this.persist();
    this.emit();
  }

  async copyText(text: string): Promise<void> {
    await this.copyTextResult(text);
  }

  private async copyTextResult(text: string, noticeOwnerId: string = '',
    publishNotice: boolean = true): Promise<boolean> {
    if (this.disposed) { return false; }
    if (this.activeCalls.size >= 32) {
      this.block('setData', '剪贴板', '在途调用过多', publishNotice);
      return false;
    }
    const id = this.beginCall('setData', '剪贴板');
    try {
      await this.platform.copyText(text);
      if (publishNotice && (noticeOwnerId.length === 0 || this.series?.ownerId === noticeOwnerId)) {
        this.state.notice = '已复制';
      }
      this.finishCall(id, 'success', 0, '已复制');
      return true;
    } catch (error) {
      if (publishNotice && (noticeOwnerId.length === 0 || this.series?.ownerId === noticeOwnerId)) {
        this.state.notice = '复制失败';
      }
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return false;
    }
  }

  /** Export the same workload/mode/result selection shown by the ledger view. */
  async copyAnalysisReport(workloadId: string, mode: string, failedOnly: boolean): Promise<boolean> {
    if (this.disposed) { return false; }
    if (workloadOf(workloadId) === undefined || ['control', 'files', 'modules'].indexOf(mode) < 0) {
      this.state.notice = '报告未生成：负载或模式无效';
      this.emit();
      return false;
    }
    const records = this.ledger.all().filter((record: ExperimentRecord): boolean =>
      record.workloadId === workloadId && record.mode === mode && (!failedOnly || !record.complete()));
    const meta = new ReportMeta('应用性能实验报告', this.platform.wallNow(),
      `负载 ${workloadId}；模式 ${mode}；${failedOnly ? '仅失败/缺失记录' : '全部结果'}`, '');
    const outcome = exportReport(records, meta, ReportFormat.MARKDOWN);
    if (!outcome.ok) {
      this.state.notice = `报告未生成：${outcome.check.summary()}`;
      this.emit();
      return false;
    }
    const copied = await this.copyTextResult(outcome.text);
    if (copied) {
      this.state.notice = '已复制分析报告（Markdown）';
      this.emit();
    }
    return copied;
  }

  setForeground(flag: boolean): void {
    if (this.state.foreground !== flag) {
      this.state.foreground = flag;
      const series = this.ownedSeries(this.seriesLease);
      if (series !== undefined && seriesActive(series.phase)) {
        series.conditionChanged = true;
        series.phase = SeriesPhase.CONDITION_CHANGED;
        series.message = '前后台状态发生变化，已停止系列；当前本地等待已取消，SDK可能仍在途';
        this.executor.cancel();
        this.persist();
      }
      this.emit();
    }
  }

  markContentLoaded(): void {
    if (this.contentMarked) {
      return;
    }
    const contentMs = Math.max(0, this.platform.now() - this.startupMono);
    this.contentMarked = true;
    if (this.appVersion.length === 0) {
      this.readBundleInfo(false);
    }
    const sample: LaunchSample = {
      id: this.launchId,
      group: this.startupGroup,
      at: this.startupWall,
      contentMs: contentMs,
      device: this.environment,
      appVersion: this.appVersion || '读取失败'
    };
    this.state.launches.unshift(sample);
    this.state.launches = this.state.launches.slice(0, LAUNCH_LIMIT);
    this.persist();
    this.emit();
  }

  private readBundleInfo(publish: boolean = true): BundleSnapshot | undefined {
    const id = this.beginCall('getBundleInfoForSelfSync', '本应用', publish);
    try {
      const info = this.platform.bundleInfo();
      this.appVersion = info.versionName;
      this.state.deviceText = `${this.environment} · APP ${this.appVersion}`;
      this.finishCall(id, 'success', 0, `${info.modules.length} 个模块 · ${info.versionName}`, publish);
      return info;
    } catch (error) {
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError), publish);
      return undefined;
    }
  }

  private validateTargets(targets: string[], modules: boolean): TargetValidation {
    const values: string[] = [];
    for (let index = 0; index < targets.length; index++) {
      if (typeof targets[index] !== 'string') {
        return { values: [], error: '目标无效' };
      }
      const value = targets[index].trim();
      if (value.length === 0 || (!modules && !validFileName(value))) {
        return { values: [], error: modules ? '请选择模块' : '请输入 .so、.hap 或 .hsp 文件名' };
      }
      if (modules && this.state.modules.indexOf(value) < 0) {
        return { values: [], error: '请选择真实模块' };
      }
      if (values.indexOf(value) < 0) {
        values.push(value);
      }
      if (values.length > TARGET_LIMIT) {
        return { values: [], error: '最多 32 项' };
      }
    }
    return { values: values, error: values.length === 0 ? (modules ? '请选择模块' : '请输入文件名') : '' };
  }

  private async evict(targets: string[], modules: boolean): Promise<boolean> {
    const api = modules ? 'evictModuleFilePages' : 'evictFilePages';
    const validation = this.validateTargets(targets, modules);
    const target = shortText(targets.join(', '), 4096);
    if (validation.error.length > 0) {
      this.block(api, target, validation.error);
      return false;
    }
    if (this.state.memoryBusy) {
      this.block(api, validation.values.join(', '), '上一调用仍在等待');
      return false;
    }
    const available = modules ? this.platform.canEvictModules() : this.platform.canEvictFiles();
    if (!available) {
      this.block(api, validation.values.join(', '), '请升级系统');
      return false;
    }
    this.state.memoryBusy = true;
    const id = this.beginCall(api, validation.values.join(', '));
    const active = this.activeCalls.get(id);
    if (active !== undefined) {
      this.state.latestMemory = active.record;
    }
    this.emit();
    try {
      if (modules) {
        await this.platform.evictModules(validation.values);
      } else {
        await this.platform.evictFiles(validation.values);
      }
      this.state.memoryBusy = false;
      this.state.notice = '调用成功';
      this.finishCall(id, 'success', 0, '调用成功');
      return true;
    } catch (error) {
      this.state.memoryBusy = false;
      this.state.notice = '调用失败';
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return false;
    }
  }

  private executorChanged(): void {
    if (this.executor.reason() === 'timeout') {
      this.activeCalls.forEach((waiting: ActiveCall): void => {
        if (waiting.record.kind === 'pending' &&
          ['evictFilePages', 'evictModuleFilePages'].indexOf(waiting.record.api) >= 0) {
          waiting.record.kind = 'timeout'; waiting.record.status = '等待超时';
          waiting.record.elapsed = Math.max(0, this.platform.now() - waiting.started);
          waiting.record.code = LOCAL_ERROR; waiting.record.message = '仍在等待系统返回';
          this.state.notice = '等待超时'; this.persist();
        }
      });
    }
    this.releaseSeriesLease();
    this.emit();
  }

  private newStep(key: string, label: string): MaintenanceStep {
    const step: MaintenanceStep = new MaintenanceStep();
    step.key = key;
    step.label = label;
    return step;
  }

  private async runFlowStep(flow: MaintenanceFlow, index: number,
    action: () => Promise<boolean>): Promise<boolean> {
    if (this.disposed || this.executor.reason().length > 0) {
      return false;
    }
    const step: MaintenanceStep = flow.steps[index];
    step.status = '运行中';
    this.emit();
    const started: number = this.platform.now();
    let ok: boolean = false;
    try {
      ok = await action();
    } catch (error) {
      ok = false;
      if (step.detail.length === 0) {
        step.detail = errorMessage(error as CallError);
      }
    }
    step.elapsed = Math.max(0, this.platform.now() - started);
    step.status = this.executor.reason() === 'timeout' ? '超时' :
      this.executor.reason() === 'cancelled' ? '已取消' : ok ? '成功' : '失败';
    this.emit();
    return ok;
  }

  private stopFlow(flow: MaintenanceFlow, message: string): void {
    flow.steps.forEach((step: MaintenanceStep): void => {
      if (step.status === '待执行') {
        step.status = '跳过';
      }
    });
    flow.status = this.executor.reason() === 'timeout' ? '已超时（系统请求未取消）' :
      this.executor.reason() === 'cancelled' ? '已取消（仅本地等待）' : message;
    flow.endedAt = this.platform.wallNow();
    flow.notice = '流程未完成；已保留每阶段结果，未执行阶段标记为跳过。';
    this.state.maintenanceBusy = false;
    this.state.notice = message;
    this.emit();
  }

  private beginCall(api: string, target: string, publish: boolean = true): number {
    const id = this.nextCallId++;
    const started = this.platform.now();
    const record: CallRecord = {
      id: id,
      api: api,
      target: shortText(target, 4096),
      status: '调用中',
      kind: 'pending',
      at: this.platform.wallNow(),
      elapsed: 0,
      code: 0,
      message: '',
      late: false
    };
    this.activeCalls.set(id, { record: record, started: started });
    this.state.logs.unshift(record);
    this.trimLogs();
    if (publish) {
      this.persist();
      this.emit();
    }
    return id;
  }

  private finishCall(id: number, kind: string, code: number, message: string, publish: boolean = true): void {
    const active = this.activeCalls.get(id);
    if (active === undefined) {
      return;
    }
    const record = active.record;
    record.elapsed = Math.max(0, this.platform.now() - active.started);
    const memory = record.api === 'evictFilePages' || record.api === 'evictModuleFilePages';
    record.late = record.kind === 'timeout' || (memory && record.elapsed >= MEMORY_TIMEOUT_MS);
    record.kind = kind;
    record.status = kind === 'success' ? '调用成功' : '调用失败';
    record.code = code;
    record.message = shortText(message);
    this.activeCalls.delete(id);
    this.trimLogs();
    if (publish) {
      this.persist();
      this.emit();
    }
  }

  private block(api: string, target: string, message: string, publishNotice: boolean = true): void {
    const record: CallRecord = {
      id: this.nextCallId++,
      api: api,
      target: shortText(target, 4096),
      status: '已拦截',
      kind: 'blocked',
      at: this.platform.wallNow(),
      elapsed: 0,
      code: LOCAL_ERROR,
      message: shortText(message),
      late: false
    };
    this.state.logs.unshift(record);
    if (api === 'evictFilePages' || api === 'evictModuleFilePages') {
      this.state.latestMemory = record;
    }
    if (publishNotice) { this.state.notice = shortText(message); }
    this.trimLogs();
    this.persist();
    this.emit();
  }

  private trimLogs(): void {
    while (this.state.logs.length > LOG_LIMIT) {
      let removeIndex = this.state.logs.length - 1;
      while (removeIndex >= 0 && this.activeCalls.has(this.state.logs[removeIndex].id)) {
        removeIndex--;
      }
      if (removeIndex < 0) {
        removeIndex = this.state.logs.length - 1;
      }
      this.state.logs.splice(removeIndex, 1);
    }
  }

  private rebuildWaitSeconds(): number {
    return Math.max(0, Math.ceil((REBUILD_COOLDOWN_MS - (this.platform.now() - this.lastRebuildMono)) / 1000));
  }

  private startCooldownClock(): void {
    if (this.cooldownTimer >= 0) {
      this.platform.clearInterval(this.cooldownTimer);
    }
    this.cooldownTimer = this.platform.setInterval((): void => {
      if (this.rebuildWaitSeconds() === 0) {
        this.platform.clearInterval(this.cooldownTimer);
        this.cooldownTimer = -1;
      }
      this.emit();
    }, 1000);
  }

  private emit(): void {
    if (this.disposed) {
      return;
    }
    this.listeners.forEach((listener: () => void): void => {
      try {
        listener();
      } catch (error) {
        // A view listener must not change an SDK result.
      }
    });
  }

  private restore(): void {
    try {
      const store = this.platform.openStore();
      this.store = store;
      const value = store.read();
      if (typeof value !== 'string' || value.length === 0) {
        return;
      }
      const stored = JSON.parse(value) as StoredState;
      if (stored === null || typeof stored !== 'object' || stored.schema !== 2) {
        this.state.storageMessage = '存储数据已重置';
        return;
      }
      if (['启用', '禁用'].indexOf(stored.snapFlag) >= 0 &&
        nonNegative(stored.snapAt) && stored.snapAt > 0) {
        this.state.snapFlag = stored.snapFlag;
        this.state.snapAt = stored.snapAt;
      }
      this.state.rebuildAt = nonNegative(stored.rebuildAt) ? stored.rebuildAt : 0;
      if (Number.isSafeInteger(stored.nextId) && stored.nextId > 0 && stored.nextId < Number.MAX_SAFE_INTEGER) {
        this.nextCallId = stored.nextId;
      }
      if (Array.isArray(stored.logs)) {
        const seenIds: Set<number> = new Set<number>();
        stored.logs.slice(0, LOG_LIMIT).forEach((record: CallRecord): void => {
          if (!validCall(record) || seenIds.has(record.id)) {
            return;
          }
          seenIds.add(record.id);
          this.nextCallId = Math.max(this.nextCallId, record.id + 1);
          const restored = cloneCall(record);
          if (restored.kind === 'pending' || restored.kind === 'timeout') {
            restored.kind = 'error';
            restored.status = '进程已结束';
            restored.code = LOCAL_ERROR;
            restored.message = '进程已结束';
            restored.late = false;
          }
          this.state.logs.push(restored);
        });
      }
      if (Array.isArray(stored.launches)) {
        const seenLaunches: Set<string> = new Set<string>();
        stored.launches.slice(0, LAUNCH_LIMIT).forEach((sample: LaunchSample): void => {
          if (validLaunch(sample) && !seenLaunches.has(sample.id)) {
            seenLaunches.add(sample.id);
            this.state.launches.push(cloneLaunch(sample));
          }
        });
      }
      const latest = this.state.logs.find((record: CallRecord): boolean =>
        record.api === 'evictFilePages' || record.api === 'evictModuleFilePages');
      this.state.latestMemory = latest === undefined ? undefined : cloneCall(latest);
      this.ledger.restore(restoreRecords(stored.experiments, this.platform.wallNow()));
      this.series = restoreExperimentSeries(stored.series, this.ledger.all(), this.platform.wallNow());
      const rejectedOwner: string = this.series === undefined ? inputSeriesOwner(stored.series) : '';
      this.history = restoreSeriesHistory(stored.seriesHistory, this.series, this.ledger.all(),
        this.platform.wallNow(), rejectedOwner);
    } catch (error) {
      this.state.storageMessage = '存储读取失败';
    }
  }

  /** Each caller receives this exact snapshot's acknowledgement, unlike whenSaved's drain-only API. */
  private persist(): Promise<boolean> {
    const store = this.store;
    const ownerId = this.seriesLease;
    if (store === undefined) {
      this.state.storageMessage = '存储不可用';
      if (ownerId.length > 0) { this.seriesWriteFailed = true; }
      return Promise.resolve(false);
    }
    let snapshot = '';
    try {
      const data: StoredState = {
        schema: 2,
        nextId: this.nextCallId,
        snapFlag: this.state.snapFlag,
        snapAt: this.state.snapAt,
        rebuildAt: this.state.rebuildAt,
        logs: this.state.logs.slice(0, LOG_LIMIT).map((record: CallRecord): CallRecord => cloneCall(record)),
        launches: this.state.launches.slice(0, LAUNCH_LIMIT).map((sample: LaunchSample): LaunchSample =>
          cloneLaunch(sample)),
        experiments: this.ledger.all(),
        series: this.series === undefined ? undefined : this.series.clone(),
        seriesHistory: this.history.map((state: ExperimentSeriesState): ExperimentSeriesState => state.clone())
      };
      snapshot = JSON.stringify(data);
    } catch (error) {
      this.state.storageMessage = '存储写入失败';
      if (ownerId.length > 0) { this.seriesWriteFailed = true; }
      return Promise.resolve(false);
    }
    const saved: Promise<boolean> = this.flushChain.then(async (): Promise<boolean> => {
      try {
        await store.write(snapshot);
        if (this.state.storageMessage.length > 0) {
          this.state.storageMessage = '';
          this.emit();
        }
        return true;
      } catch (error) {
        this.state.storageMessage = '存储写入失败';
        if (ownerId.length > 0 && this.seriesLease === ownerId) { this.seriesWriteFailed = true; }
        this.emit();
        return false;
      }
    });
    this.flushChain = saved.then((): void => {});
    return saved;
  }
}

export function createAppService(context: common.UIAbilityContext): AppService {
  return AppService.initialize(context);
}

export function getAppService(): AppService {
  if (singleton === undefined) {
    throw new Error('AppService 尚未初始化');
  }
  return singleton;
}
