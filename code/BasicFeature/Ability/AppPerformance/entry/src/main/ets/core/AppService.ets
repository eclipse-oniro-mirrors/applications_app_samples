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

import { common } from '@kit.AbilityKit';
import { util } from '@kit.ArkTS';
import { localize, message, setTextContext } from './TextMessages';
import { AppState, CallRecord, LaunchSample, MaintenanceFlow, MaintenanceStep, EvictionResult,
  emptyAppState, SnapFlag, ContentLoadGroup, StepStatus, FlowStatus, ConfigStatus,
  IntegrityStatus, CallStatus, statusText } from './Types';
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
    return message('ap_ui_call_failed');
  }
  return typeof error.message === 'string' && error.message.length > 0 ? shortText(error.message) :
    message('ap_ui_call_failed');
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
    (value.group === ContentLoadGroup.ENABLED || value.group === ContentLoadGroup.DISABLED ||
      value.group === ContentLoadGroup.INITIAL) && nonNegative(value.at) &&
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
    this.startupGroup = this.state.snapFlag === SnapFlag.ENABLED ? ContentLoadGroup.ENABLED :
      (this.state.snapFlag === SnapFlag.DISABLED ? ContentLoadGroup.DISABLED : ContentLoadGroup.INITIAL);
    this.launchId = platform.randomId();
    this.environment = platform.environment();
    this.state.deviceText = this.environment;
  }

  static fromPlatform(platform: AppPlatform): AppService {
    return new AppService(platform);
  }

  static initialize(context: common.UIAbilityContext): AppService {
    setTextContext(context);
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
      // The UI formats this once; its trailing workload preview is opaque payload data.
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
      failure.check.findings.push(state === undefined ?
        message('ap_dynamic_the_selected_series_is_absent_or_its_metadata_was_evicted') :
        message('ap_dynamic_invalid_report_format'));
      return failure;
    }
    const records = this.recordsForSeries(state);
    const missing: number = state.recordIds.length - records.length;
    return exportReport(records, new ReportMeta(message('ap_dynamic_selected_series_history_report'),
      this.platform.wallNow(), message('ap_dynamic_selected_series_only_workload_mode_planned_runs',
        [state.workloadId, localize(state.mode), state.repetitions]),
      message('ap_dynamic_state_started_finished_available_missing',
        [localize(state.phase), state.startedCount, state.recordIds.length, records.length, missing, state.message])),
      format);
  }

  /** Historical selection feedback belongs to its controller, never to the current experiment notice. */
  async copySeriesHistoryReport(ownerId: string, format: ReportFormat): Promise<boolean> {
    if (this.disposed) { return false; }
    const report = this.seriesHistoryReport(ownerId, format);
    return report.ok ? await this.copyTextResult(report.text, '', false) : false;
  }

  startExperimentSeries(workloadId: string, mode: string,
    repetitions: number = SERIES_DEFAULT_REPETITIONS): SeriesStartResult {
    if (this.disposed) {
      return new SeriesStartResult(false, '', message('ap_dynamic_the_service_has_been_disposed'));
    }
    if (workloadOf(workloadId) === undefined || ['control', 'files', 'modules'].indexOf(mode) < 0 ||
      !validSeriesCount(repetitions)) {
      return new SeriesStartResult(false, '',
        message('ap_dynamic_invalid_workload_mode_or_repetition_count_1_10_allowed'));
    }
    if (this.isExperimentBusy()) {
      return new SeriesStartResult(false, '',
        message('ap_dynamic_an_experiment_or_system_request_is_already_in_flight'));
    }
    if (this.store === undefined) {
      return new SeriesStartResult(false, '', message('ap_dynamic_storage_is_unavailable_the_series_was_not_started'));
    }
    const state = new ExperimentSeriesState();
    state.ownerId = `series-${this.platform.randomId()}`;
    state.workloadId = workloadId;
    state.mode = mode;
    state.repetitions = repetitions;
    state.startedAt = this.platform.wallNow();
    state.message =
      message('ap_dynamic_preparing_to_save_the_series_plan_stop_on_failure_or_changed_conditions_wit');
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
    return new SeriesStartResult(true, state.ownerId,
      message('ap_dynamic_series_accepted_waiting_for_the_plan_to_be_saved'));
  }

  stopExperimentSeries(ownerId: string): boolean {
    const state = this.ownedSeries(ownerId);
    if (state === undefined || !seriesActive(state.phase) || state.stopRequested || state.cancelRequested) {
      return false;
    }
    state.stopRequested = true;
    state.phase = SeriesPhase.STOPPING;
    state.message = message('ap_dynamic_stop_requested_after_this_run_the_current_sdk_wait_is_not_cancelled');
    this.persist(); this.emit();
    return true;
  }

  cancelExperimentSeries(ownerId: string): boolean {
    const state = this.ownedSeries(ownerId);
    if (state === undefined || !seriesActive(state.phase) || state.cancelRequested) { return false; }
    state.cancelRequested = true;
    state.phase = SeriesPhase.CANCELLING;
    state.message =
      message('ap_dynamic_local_waiting_cancelled_the_sdk_request_is_not_cancelled_and_remaining_runs');
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
      this.state.notice = message('ap_dynamic_series_report_not_generated_the_series_is_absent_or_has_been_replaced');
      this.emit();
      return false;
    }
    const records = this.seriesRecords(ownerId);
    const meta = new ReportMeta(message('ap_dynamic_real_repeated_experiment_series_report'), this.platform.wallNow(),
      message('ap_dynamic_this_series_only_workload_mode_planned_runs',
        [state.workloadId, localize(state.mode), state.repetitions]),
      message('ap_dynamic_state_started_finished_available_missing_save',
        [localize(state.phase), state.startedCount, state.recordIds.length, records.length,
          state.missingRecordIds.length, localize(state.saveState), state.message]));
    const report = exportReport(records, meta, ReportFormat.MARKDOWN);
    if (!report.ok) {
      this.state.notice = message('ap_dynamic_series_report_not_generated', [report.check.summary()]);
      this.emit();
      return false;
    }
    const copied = await this.copyTextResult(report.text, ownerId);
    if (copied && this.series?.ownerId === ownerId) {
      this.state.notice = message('ap_dynamic_this_series_analysis_report_copied_markdown'); this.emit();
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
      state.message = saved ?
        message('ap_dynamic_a_write_failed_during_the_series_later_runs_were_stopped_and_the_current_te') :
        message('ap_dynamic_storage_write_failed_later_runs_were_stopped_unsaved_results_remain_in_memo');
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
        state.message = message('ap_dynamic_preparing_real_experiment', [state.activeIteration, state.repetitions]);
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
          current.message =
            message('ap_dynamic_a_run_was_not_accepted_the_series_stopped_without_fabricating_a_record_or_r');
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
        state.message = message('ap_dynamic_series_execution_failed_and_stopped_inspect_the_actual_stage_records');
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
      state.message =
        message('ap_dynamic_this_run_failed_timed_out_or_is_missing_the_series_stopped_without_automati');
    } else {
      if (state.baselineRecordId.length === 0) {
        state.baselineRecordId = record.id;
      } else {
        const baseline = this.ledger.all().find((item: ExperimentRecord): boolean =>
          item.id === state.baselineRecordId);
        if (baseline === undefined || !compareRecords(baseline, record).comparable) {
          state.conditionChanged = true;
          state.phase = SeriesPhase.CONDITION_CHANGED;
          state.message =
            message('ap_dynamic_sampling_conditions_or_resource_contents_changed_stopped_without_combining');
        }
      }
      if (!state.conditionChanged) {
        state.phase = state.stopRequested ? SeriesPhase.STOPPED :
          state.recordIds.length >= state.repetitions ? SeriesPhase.COMPLETED : SeriesPhase.RUNNING;
        state.message = state.phase === SeriesPhase.COMPLETED ?
          message('ap_dynamic_all_planned_runs_completed_every_sample_came_from_a_real_experiment') :
          state.stopRequested ? message('ap_dynamic_this_run_completed_remaining_runs_stopped_as_requested') :
            message('ap_dynamic_run_committed_waiting_for_save_before_continuing', [state.recordIds.length]);
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
      moduleMessage = message('ap_dynamic_modules', [this.state.modules.length]);
    } else {
      moduleMessage = message('ap_dynamic_module_discovery_failed');
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
      this.state.targetMessage = message('ap_dynamic_files', [files.length, moduleMessage]);
      this.finishCall(id, 'success', 0, message('ap_dynamic_files_35', [files.length]));
    } catch (error) {
      this.state.files = [];
      this.state.targetMessage =
        message('ap_dynamic_file_discovery_failed_file_names_can_be_entered_manually', [moduleMessage]);
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
        this.state.configStatus = ConfigStatus.INVALID;
        this.state.configTargets = [];
        this.finishCall(id, 'error', LOCAL_ERROR, message('ap_dynamic_missing_evictfilepages'));
        return;
      }
      const names = config.evictFilePages;
      if (names.length === 0 || names.length > TARGET_LIMIT ||
        names.some((name: string): boolean => typeof name !== 'string' || !validFileName(name))) {
        this.state.configStatus = ConfigStatus.INVALID;
        this.state.configTargets = [];
        this.finishCall(id, 'error', LOCAL_ERROR, message('ap_dynamic_invalid_file_list'));
        return;
      }
      this.state.configStatus = ConfigStatus.VALID;
      this.state.configTargets = names.slice();
      this.finishCall(id, 'success', 0, message('ap_dynamic_items', [names.length]));
    } catch (error) {
      this.state.configStatus = ConfigStatus.READ_FAILED;
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
      series.message = message('ap_dynamic_running_real_experiment', [series.startedCount, series.repetitions]);
    }
    this.flowToken = token;
    const flow = new MaintenanceFlow();
    flow.id = this.nextFlowId++;
    flow.mode = mode;
    try {
      await this.executeFlow(flow, spec, token);
    } catch (error) {
      this.stopFlow(flow, FlowStatus.EXECUTION_ERROR);
    } finally {
      if (flow.endedAt === 0) { this.stopFlow(flow, FlowStatus.UNFINISHED); }
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
    flow.status = FlowStatus.RUNNING;
    flow.startedAt = this.platform.wallNow();
    flow.steps = [
      this.newStep('discover', message('ap_dynamic_discover_targets')),
      this.newStep('config', message('ap_dynamic_validate_configuration')),
      this.newStep('warm', message('ap_dynamic_read_workload')),
      this.newStep('evict', normalized === 'control' ? message('ap_dynamic_control_no_eviction_request') :
        (normalized === 'modules' ? message('ap_dynamic_evict_modules') : message('ap_ui_evict_file_pages'))),
      this.newStep('reread', message('ap_dynamic_re_read_and_verify_the_business_resource')),
      this.newStep('configAgain', message('ap_dynamic_re_read_configuration'))
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
      this.stopFlow(flow, FlowStatus.NO_TARGETS);
      return;
    }

    const configured: boolean = await this.runFlowStep(flow, 1, async (): Promise<boolean> => {
      this.checkConfig();
      flow.steps[1].detail =
        message('ap_dynamic_items_55', [statusText(this.state.configStatus), this.state.configTargets.length]);
      const installed: boolean = normalized !== 'files' || this.state.configTargets.every((name: string): boolean =>
        this.state.files.indexOf(name) >= 0);
      if (!installed) {
        flow.steps[1].detail +=
          message('ap_dynamic_configured_targets_were_not_confirmed_in_the_installation_directory');
      }
      return this.state.configStatus === ConfigStatus.VALID && installed;
    });
    if (!configured) {
      this.stopFlow(flow, FlowStatus.INVALID_CONFIG);
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
        flow.steps[2].detail = message('ap_dynamic_bytes_fnv_loaded', [bytes.length, flow.digestBefore]);
        return true;
      } catch (error) {
        flow.steps[2].detail = message('ap_dynamic_read_failed', [errorCode(error as CallError)]);
        return false;
      }
    });
    if (!warmed) {
      this.stopFlow(flow, FlowStatus.WORKLOAD_FAILED);
      return;
    }

    const evicted: boolean = await this.runFlowStep(flow, 3, async (): Promise<boolean> => {
      if (normalized === 'control') {
        flow.steps[3].detail =
          message('ap_dynamic_control_no_eviction_api_called_used_as_a_reference_under_matching_condition');
        return true;
      }
      const modules: boolean = normalized === 'modules';
      const targets: string[] = modules ? moduleTargets.slice() : fileTargets.slice();
      if (targets.length === 0) {
        flow.steps[3].detail = modules ? message('ap_dynamic_no_available_module_targets') :
          message('ap_dynamic_no_available_file_targets');
        return false;
      }
      const request: EvictionResult = await this.requestEviction(targets, modules, token);
      const ok: boolean = request.status === 'success';
      const latest = this.state.latestMemory;
      flow.steps[3].detail = latest === undefined ? message('ap_dynamic_no_eviction_result') :
        `${message(modules ? 'ap_ui_modules' : 'ap_ui_files')} · ${statusText(latest.status)} · ${latest.message}`;
      return ok;
    });
    if (!evicted) {
      this.stopFlow(flow, FlowStatus.EVICTION_FAILED);
      return;
    }

    await this.runFlowStep(flow, 4, async (): Promise<boolean> => {
      try {
        const bytes: Uint8Array = await this.readFlowResource(spec, token);
        flow.afterBytes = bytes.length;
        flow.digestAfter = this.digest(bytes);
        const same: boolean = flow.afterBytes === flow.beforeBytes && flow.digestAfter === flow.digestBefore;
        flow.integrity = same ? IntegrityStatus.RESOURCE_MATCH : IntegrityStatus.RESOURCE_MISMATCH;
        flow.steps[4].detail =
          message('ap_dynamic_bytes_fnv', [flow.afterBytes, flow.digestAfter, statusText(flow.integrity)]);
        return same;
      } catch (error) {
        flow.integrity = IntegrityStatus.RESOURCE_READ_FAILED;
        flow.steps[4].detail = message('ap_dynamic_re_read_failed', [errorCode(error as CallError)]);
        return false;
      }
    });
    await this.runFlowStep(flow, 5, async (): Promise<boolean> => {
      try {
        const text: string = this.platform.readConfig().trim();
        const same: boolean = text === configText;
        flow.steps[5].detail = same ?
          message('ap_dynamic_configuration_re_read_matches_this_does_not_prove_fewer_resident_pages') :
          message('ap_dynamic_configuration_re_read_differs_from_the_first_read');
        return same;
      } catch (error) {
        flow.steps[5].detail = message('ap_dynamic_verification_read_failed', [errorCode(error as CallError)]);
        return false;
      }
    });
    if (this.executor.reason().length > 0) { this.stopFlow(flow, FlowStatus.STOPPED); return; }
    const complete: boolean = flow.steps.every((step: MaintenanceStep): boolean => step.status === StepStatus.SUCCESS);
    flow.status = complete ? FlowStatus.COMPLETED : FlowStatus.COMPLETED_WITH_FAILURES;
    const modeText: string = localize(normalized);
    flow.notice = complete ?
      message('ap_dynamic_flow_completed_business_resource_length_and_checksum_compared_eviction_effe',
        [modeText, statusText(flow.integrity)]) :
      message('ap_dynamic_flow_ended_inspect_failed_stages_an_unobserved_resident_page_change_must_no',
        [modeText, statusText(flow.integrity)]);
    flow.endedAt = this.platform.wallNow();
    this.state.maintenanceBusy = false;
    this.state.notice = statusText(flow.status);
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
      missing.push(message('ap_dynamic_the_flow_did_not_finish_normally_and_is_not_a_successful_sample'));
    }
    missing.push(message('ap_dynamic_resident_pages_are_not_observable_eviction_effects_are_not_quantified'));
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
      this.state.notice = message('ap_dynamic_external_records_cannot_be_appended_while_a_series_holds_the_lease');
      this.emit();
      return;
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
    if (this.isExperimentBusy()) {
      this.state.notice =
        message('ap_dynamic_the_ledger_cannot_be_cleared_while_an_experiment_or_system_request_is_in_fl');
      this.emit();
      return;
    }
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
      this.block('getRawFileContent', 'sample.txt', message('ap_dynamic_reading_the_resource'));
      return;
    }
    this.state.resourceBusy = true;
    const id = this.beginCall('getRawFileContent', 'sample.txt');
    try {
      const bytes = await this.platform.readResource();
      const text = util.TextDecoder.create('utf-8').decodeToString(bytes);
      this.baseline = new Uint8Array(bytes);
      this.state.resourceText = message('ap_dynamic_bytes', [bytes.length, text.trim().slice(0, 1000)]);
      this.state.resourceBusy = false;
      this.state.notice = message('ap_dynamic_read_succeeded');
      this.finishCall(id, 'success', 0, message('ap_dynamic_bytes_93', [bytes.length]));
    } catch (error) {
      this.state.resourceBusy = false;
      this.state.resourceText = message('ap_dynamic_read_failed_92');
      this.state.notice = message('ap_dynamic_read_failed_92');
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
    }
  }

  async verifyResource(): Promise<void> {
    if (this.isExperimentBusy()) {
      this.block('getRawFileContent', message('ap_dynamic_sample_txt_verification'),
        message('ap_dynamic_reading_the_resource'));
      return;
    }
    const baseline = this.baseline;
    if (baseline === undefined) {
      this.block('getRawFileContent', message('ap_dynamic_sample_txt_verification'),
        message('ap_dynamic_read_the_resource_first'));
      return;
    }
    this.state.resourceBusy = true;
    const id = this.beginCall('getRawFileContent', message('ap_dynamic_sample_txt_verification'));
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
      const result = same ? message('ap_dynamic_verification_matches') :
        message('ap_dynamic_verification_does_not_match');
      this.state.resourceBusy = false;
      this.state.resourceText = message('ap_dynamic_bytes_98', [result, bytes.length]);
      this.state.notice = result;
      this.finishCall(id, 'success', 0, result);
    } catch (error) {
      this.state.resourceBusy = false;
      this.state.resourceText = message('ap_dynamic_verification_failed');
      this.state.notice = message('ap_dynamic_verification_failed');
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
      this.block(modules ? 'evictModuleFilePages' : 'evictFilePages', targets.join(','),
        message('ap_dynamic_the_previous_call_is_still_waiting'));
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
    const target: SnapFlag = flag ? SnapFlag.ENABLED : SnapFlag.DISABLED;
    if (this.seriesLease.length > 0) {
      this.block(api, target,
        message('ap_dynamic_hypersnap_settings_cannot_be_changed_while_an_experiment_series_holds_the_l'));
      return;
    }
    if (!this.platform.canSetSnap()) {
      this.block(api, target, message('ap_dynamic_upgrade_the_system'));
      return;
    }
    const id = this.beginCall(api, target);
    try {
      this.platform.setSnapEnabled(flag);
    } catch (error) {
      this.state.notice = message('ap_dynamic_setting_failed');
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return;
    }
    this.state.snapFlag = target;
    this.state.snapAt = this.platform.wallNow();
    this.state.notice = message(flag ? 'ap_dynamic_enabled' : 'ap_dynamic_disabled');
    this.finishCall(id, 'success', 0, message(flag ? 'ap_dynamic_enabled' : 'ap_dynamic_disabled'));
  }

  rebuildSnap(reason: string): void {
    const api = 'requestRebuildHyperSnap';
    const target = shortText(reason, 200) || message('ap_ui_manual_rebuild');
    if (this.seriesLease.length > 0) {
      this.block(api, target,
        message('ap_dynamic_hypersnap_cannot_be_rebuilt_while_an_experiment_series_holds_the_lease'));
      return;
    }
    if (this.rebuildWaitSeconds() > 0) {
      this.block(api, target, message('ap_dynamic_wait_seconds', [this.rebuildWaitSeconds()]));
      return;
    }
    if (!this.platform.canRebuildSnap()) {
      this.block(api, target, message('ap_dynamic_upgrade_the_system'));
      return;
    }
    const id = this.beginCall(api, target);
    try {
      this.platform.rebuildSnap();
    } catch (error) {
      this.state.notice = message('ap_dynamic_rebuild_request_failed');
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return;
    }
    this.lastRebuildMono = this.platform.now();
    this.state.rebuildAt = this.platform.wallNow();
    this.state.notice = message('ap_dynamic_rebuild_request_succeeded');
    this.finishCall(id, 'success', 0, message('ap_dynamic_rebuild_request_succeeded'));
    this.startCooldownClock();
  }

  clearLogs(): void {
    this.state.logs = this.state.logs.filter((record: CallRecord): boolean => this.activeCalls.has(record.id));
    if (this.state.latestMemory !== undefined && !this.activeCalls.has(this.state.latestMemory.id)) {
      this.state.latestMemory = undefined;
    }
    this.state.notice = message('ap_dynamic_call_records_cleared');
    this.persist();
    this.emit();
  }

  clearLaunches(): void {
    this.state.launches = [];
    this.state.notice = message('ap_dynamic_launch_records_cleared');
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
      this.block('setData', message('ap_dynamic_clipboard'),
        message('ap_dynamic_too_many_calls_are_in_flight'), publishNotice);
      return false;
    }
    const id = this.beginCall('setData', message('ap_dynamic_clipboard'));
    try {
      await this.platform.copyText(text);
      if (publishNotice && (noticeOwnerId.length === 0 || this.series?.ownerId === noticeOwnerId)) {
        this.state.notice = message('ap_dynamic_copied');
      }
      this.finishCall(id, 'success', 0, message('ap_dynamic_copied'));
      return true;
    } catch (error) {
      if (publishNotice && (noticeOwnerId.length === 0 || this.series?.ownerId === noticeOwnerId)) {
        this.state.notice = message('ap_dynamic_copy_failed');
      }
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return false;
    }
  }

  /** Export the same workload/mode/result selection shown by the ledger view. */
  async copyAnalysisReport(workloadId: string, mode: string, failedOnly: boolean): Promise<boolean> {
    if (this.disposed) { return false; }
    if (workloadOf(workloadId) === undefined || ['control', 'files', 'modules'].indexOf(mode) < 0) {
      this.state.notice = message('ap_dynamic_report_not_generated_invalid_workload_or_mode');
      this.emit();
      return false;
    }
    const records = this.ledger.all().filter((record: ExperimentRecord): boolean =>
      record.workloadId === workloadId && record.mode === mode && (!failedOnly || !record.complete()));
    const meta = new ReportMeta(message('ap_dynamic_application_performance_experiment_report'),
      this.platform.wallNow(),
      message('ap_dynamic_workload_mode', [workloadId, localize(mode),
        message(failedOnly ? 'ap_ui_failed_missing_records_only' : 'ap_dynamic_all_results')]), '');
    const outcome = exportReport(records, meta, ReportFormat.MARKDOWN);
    if (!outcome.ok) {
      this.state.notice = message('ap_dynamic_report_not_generated', [outcome.check.summary()]);
      this.emit();
      return false;
    }
    const copied = await this.copyTextResult(outcome.text);
    if (copied) {
      this.state.notice = message('ap_dynamic_analysis_report_copied_markdown');
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
        series.message =
          message('ap_dynamic_foreground_background_state_changed_series_stopped_and_local_waiting_cancel');
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
      appVersion: this.appVersion || 'unavailable'
    };
    this.state.launches.unshift(sample);
    this.state.launches = this.state.launches.slice(0, LAUNCH_LIMIT);
    this.persist();
    this.emit();
  }

  private readBundleInfo(publish: boolean = true): BundleSnapshot | undefined {
    const id = this.beginCall('getBundleInfoForSelfSync', message('ap_dynamic_this_application'), publish);
    try {
      const info = this.platform.bundleInfo();
      this.appVersion = info.versionName;
      this.state.deviceText = `${this.environment} · APP ${this.appVersion}`;
      this.finishCall(id, 'success', 0,
        message('ap_dynamic_modules_124', [info.modules.length, info.versionName]), publish);
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
        return { values: [], error: message('ap_dynamic_invalid_target') };
      }
      const value = targets[index].trim();
      if (value.length === 0 || (!modules && !validFileName(value))) {
        return {
          values: [],
          error: modules ? message('ap_dynamic_select_a_module') : message('ap_dynamic_enter_a_so_hap_or_hsp_file_name')
        };
      }
      if (modules && this.state.modules.indexOf(value) < 0) {
        return { values: [], error: message('ap_dynamic_select_a_discovered_module') };
      }
      if (values.indexOf(value) < 0) {
        values.push(value);
      }
      if (values.length > TARGET_LIMIT) {
        return { values: [], error: message('ap_dynamic_at_most_32_items') };
      }
    }
    return {
      values: values,
      error: values.length === 0 ?
        (modules ? message('ap_dynamic_select_a_module') : message('ap_dynamic_enter_a_file_name')) : ''
    };
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
      this.block(api, validation.values.join(', '), message('ap_dynamic_the_previous_call_is_still_waiting'));
      return false;
    }
    const available = modules ? this.platform.canEvictModules() : this.platform.canEvictFiles();
    if (!available) {
      this.block(api, validation.values.join(', '), message('ap_dynamic_upgrade_the_system'));
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
      this.state.notice = message('ap_ui_call_succeeded');
      this.finishCall(id, 'success', 0, message('ap_ui_call_succeeded'));
      return true;
    } catch (error) {
      this.state.memoryBusy = false;
      this.state.notice = message('ap_ui_call_failed');
      this.finishCall(id, 'error', errorCode(error as CallError), errorMessage(error as CallError));
      return false;
    }
  }

  private executorChanged(): void {
    if (this.executor.reason() === 'timeout') {
      this.activeCalls.forEach((waiting: ActiveCall): void => {
        if (waiting.record.kind === 'pending' &&
          ['evictFilePages', 'evictModuleFilePages'].indexOf(waiting.record.api) >= 0) {
          waiting.record.kind = 'timeout'; waiting.record.status = CallStatus.TIMEOUT;
          waiting.record.elapsed = Math.max(0, this.platform.now() - waiting.started);
          waiting.record.code = LOCAL_ERROR;
          waiting.record.message = message('ap_dynamic_still_waiting_for_the_system_response');
          this.state.notice = message('ap_dynamic_wait_timed_out'); this.persist();
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
    step.status = StepStatus.RUNNING;
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
    step.status = this.executor.reason() === 'timeout' ? StepStatus.TIMEOUT :
      this.executor.reason() === 'cancelled' ? StepStatus.CANCELLED : ok ? StepStatus.SUCCESS : StepStatus.FAILED;
    this.emit();
    return ok;
  }

  private stopFlow(flow: MaintenanceFlow, status: FlowStatus): void {
    flow.steps.forEach((step: MaintenanceStep): void => {
      if (step.status === StepStatus.PENDING) {
        step.status = StepStatus.SKIPPED;
      }
    });
    flow.status = this.executor.reason() === 'timeout' ? FlowStatus.TIMEOUT :
      this.executor.reason() === 'cancelled' ? FlowStatus.CANCELLED : status;
    flow.endedAt = this.platform.wallNow();
    flow.notice =
      message('ap_dynamic_flow_incomplete_each_stage_result_was_retained_and_unexecuted_stages_marked');
    this.state.maintenanceBusy = false;
    this.state.notice = statusText(status);
    this.emit();
  }

  private beginCall(api: string, target: string, publish: boolean = true): number {
    const id = this.nextCallId++;
    const started = this.platform.now();
    const record: CallRecord = {
      id: id,
      api: api,
      target: shortText(target, 4096),
      status: CallStatus.CALLING,
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
    record.status = kind === 'success' ? CallStatus.SUCCEEDED : CallStatus.FAILED;
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
      status: CallStatus.BLOCKED,
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
        this.state.storageMessage = message('ap_dynamic_stored_data_reset');
        return;
      }
      if ((stored.snapFlag === SnapFlag.ENABLED || stored.snapFlag === SnapFlag.DISABLED) &&
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
            restored.status = CallStatus.PROCESS_ENDED;
            restored.code = LOCAL_ERROR;
            restored.message = message('ap_dynamic_process_ended');
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
      this.state.storageMessage = message('ap_dynamic_storage_read_failed');
    }
  }

  /** Each caller receives this exact snapshot's acknowledgement, unlike whenSaved's drain-only API. */
  private persist(): Promise<boolean> {
    const store = this.store;
    const ownerId = this.seriesLease;
    if (store === undefined) {
      this.state.storageMessage = message('ap_dynamic_storage_unavailable');
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
      this.state.storageMessage = message('ap_dynamic_storage_write_failed');
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
        this.state.storageMessage = message('ap_dynamic_storage_write_failed');
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
    throw new Error('AppService has not been initialized');
  }
  return singleton;
}
