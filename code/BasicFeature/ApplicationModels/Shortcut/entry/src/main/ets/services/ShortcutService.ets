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

import { uiText } from '../i18n/Strings';
import { logWarning } from './Logger';
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
    if (!this.available(api, uiText("shortcut_text_0208"), false)) {
      return;
    }
    const generation: number = this.generation;
    this.checking = true;
    this.view.support = uiText("shortcut_text_0317");
    this.view.supportError = '';
    this.syncBusy();
    this.addRecord(api, uiText("shortcut_text_0208"), uiText("shortcut_text_0216"), uiText("shortcut_text_0315"));
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
      this.view.support = supported ? uiText("shortcut_text_0749") : uiText("shortcut_text_0133");
      this.addRecord(api, uiText("shortcut_text_0208"), uiText("shortcut_text_0161"), uiText("shortcut_text_0233", [String(supported)]));
    } catch (error) {
      if (this.isCurrent(generation)) {
        const message: string = this.errorText(error as BusinessError);
        this.view.supported = false;
        this.view.support = uiText("shortcut_text_0316");
        this.view.supportError = message;
        this.addRecord(api, uiText("shortcut_text_0208"), uiText("shortcut_text_0513"), message);
      }
    } finally {
      this.checking = false;
      this.syncBusy();
      this.notify();
      this.startInitialization();
    }
  }

  async refresh(): Promise<void> {
    if (!this.available('getAllShortcutInfoForSelf', uiText("shortcut_text_0068"), true)) {
      return;
    }
    await this.query(this.generation, uiText("shortcut_text_0534"));
  }

  async setVisible(id: string, visible: boolean): Promise<void> {
    if (!this.available('setShortcutVisibleForSelf', id, true)) {
      return;
    }
    const generation: number = this.generation;
    this.setting = true;
    this.writingId = id;
    this.view.batchMessage = uiText("shortcut_text_0748");
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
    if (!this.available('setShortcutVisibleForSelf', uiText("shortcut_text_0463"), true)) {
      return;
    }
    const ids: string[] = this.view.items.filter((item: ShortcutItem) => item.visible === false)
      .map((item: ShortcutItem) => item.id);
    if (ids.length === 0) {
      this.view.batchMessage = uiText("shortcut_text_0464");
      this.addRecord(uiText("shortcut_text_0281"), uiText("shortcut_text_0068"), uiText("shortcut_text_0589"), uiText("shortcut_text_0464"));
      this.notify();
      return;
    }
    const generation: number = this.generation;
    this.setting = true;
    let completed: number = 0;
    this.addRecord(uiText("shortcut_text_0281"), uiText("shortcut_text_0068"), uiText("shortcut_text_0352"), uiText("shortcut_text_0783", [String(ids.length)]));
    try {
      for (const id of ids) {
        if (!this.isCurrent(generation)) {
          return;
        }
        this.writingId = id;
        this.view.batchMessage = uiText("shortcut_text_0747", [String(completed + 1), String(ids.length)]);
        this.syncBusy();
        const result: WriteResult = await this.applyVisibility(generation, id, true);
        if (!this.isCurrent(generation)) {
          return;
        }
        if (result !== WriteResult.CONFIRMED) {
          this.view.batchMessage = uiText("shortcut_text_0659", [String(completed), String(ids.length), String(this.resultText(result))]);
          this.addRecord(uiText("shortcut_text_0281"), id, uiText("shortcut_text_0677"), this.view.batchMessage);
          return;
        }
        completed++;
      }
      this.view.batchMessage = uiText("shortcut_text_0658", [String(completed)]);
      this.addRecord(uiText("shortcut_text_0281"), uiText("shortcut_text_0068"), uiText("shortcut_text_0161"), this.view.batchMessage);
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
        this.view.batchError = uiText("shortcut_text_0417");
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
      if (!await this.query(generation, uiText("shortcut_text_0422"), this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
      const next: BatchJournal = copyJournal(this.journal);
      const plan: BatchPlan = new BatchPlan();
      if (next.sequence >= Number.MAX_SAFE_INTEGER) {
        this.view.batchMessage = uiText("shortcut_text_0416");
        return;
      }
      next.sequence += 1;
      plan.batchId = `batch-${next.sequence}`;
      plan.createdAt = Date.now();
      for (const id of ids) {
        const item: ShortcutItem | undefined = this.view.items.find((entry: ShortcutItem) => entry.id === id);
        if (item === undefined) { this.view.batchMessage = uiText("shortcut_text_0544"); return; }
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
      this.view.batchMessage = uiText("shortcut_text_0443");
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
      if (!await this.query(generation, uiText("shortcut_text_0421"), this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
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
      if (this.isCurrent(generation)) { this.view.batchMessage = uiText("shortcut_text_0267"); }
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
      if (!await this.query(generation, uiText("shortcut_text_0771"), this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
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
        uiText("shortcut_text_0126") :
        uiText("shortcut_text_0340");
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
        entry.reason = uiText("shortcut_text_0349");
      } else if (mode !== 'apply' && row.retryBlocked) {
        entry.eligible = false;
        entry.reason = uiText("shortcut_text_0466");
      } else if (mode === 'restore' && (!row.originalKnown || row.attempt === 0)) {
        entry.eligible = false;
        entry.reason = row.originalKnown ? uiText("shortcut_text_0713") : uiText("shortcut_text_0715");
      } else if (mode !== 'apply' && !entry.currentKnown) {
        entry.eligible = false;
        entry.reason = uiText("shortcut_text_0211");
      } else if (mode === 'restore' && entry.currentVisible === entry.target) {
        entry.eligible = false;
        entry.reason = uiText("shortcut_text_0210");
      } else {
        entry.externalChange = mode === 'restore' && (!row.lastKnown || row.lastVisible !== entry.currentVisible);
        entry.reason = entry.externalChange ? uiText("shortcut_text_0231") : uiText("shortcut_text_0361");
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
      if (!await this.query(generation, uiText("shortcut_text_0475"), this.batchTimeoutMs) || !this.isCurrent(generation)) { return; }
      for (const entry of preview.items) {
        const item: ShortcutItem | undefined = this.view.items.find((row: ShortcutItem) => row.id === entry.id);
        const known: boolean = item !== undefined && item.visibleExplicit;
        if (known !== entry.currentKnown || (known && item !== undefined && item.visible !== entry.currentVisible)) {
          this.view.batchMessage = uiText("shortcut_text_0476");
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
      this.view.batchMessage = uiText("shortcut_text_0419");
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
    return this.view.batchReady && !this.view.batchLoading && this.available(uiText("shortcut_text_0606"), uiText("shortcut_text_0068"), true);
  }

  private beginBatchSpan(stage: string): BatchSpan | undefined {
    try { return this.telemetry.begin(stage); } catch (_) {
      logWarning('Batch telemetry begin failed; operation remains authoritative');
      return undefined;
    }
  }

  private finishBatchSpan(span: BatchSpan | undefined): void {
    if (span !== undefined) {
      try { this.telemetry.finish(span); } catch (_) {
        logWarning('Batch telemetry finish failed; operation remains authoritative');
      }
    }
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
        this.view.batchError = uiText("shortcut_text_0418");
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

  recordNavigation(target: string, message: string, status: string = uiText("shortcut_text_0161")): void {
    if (this.disposed) {
      return;
    }
    this.addRecord(uiText("shortcut_text_0642"), target, status, message);
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
      this.addRecord(api, target, uiText("shortcut_text_0589"), uiText("shortcut_text_0142"));
      this.notify();
      return false;
    }
    if (api === 'setShortcutVisibleForSelf' && this.uncompletedWrites.length > 0) {
      this.addRecord(api, target, uiText("shortcut_text_0589"), uiText("shortcut_text_0350"));
      this.notify();
      return false;
    }
    if (requireSupport && !this.view.supported) {
      this.addRecord(api, target, uiText("shortcut_text_0589"), this.view.support === uiText("shortcut_text_0133") ? uiText("shortcut_text_0499") : uiText("shortcut_text_0449"));
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
    this.addRecord(api, uiText("shortcut_text_0068"), uiText("shortcut_text_0216"), reason);
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
        item.status = item.visibleExplicit ? uiText("shortcut_text_0651") : uiText("shortcut_text_0405");
        items.push(item);
      }
      this.view.items = items;
      this.view.lastQuery = clockText(Date.now());
      this.addRecord(api, uiText("shortcut_text_0068"), uiText("shortcut_text_0161"), uiText("shortcut_text_0234", [String(items.length)]));
      return true;
    } catch (error) {
      if (this.isCurrent(generation)) {
        const message: string = this.errorText(error as BusinessError);
        this.view.queryError = message;
        this.addRecord(api, uiText("shortcut_text_0068"), uiText("shortcut_text_0513"), message);
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
    this.updateItem(id, uiText("shortcut_text_0504"), '');
    this.addRecord(api, id, uiText("shortcut_text_0216"), `visible=${visible}`);
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
      this.updateItem(id, uiText("shortcut_text_0503"), message);
      this.addRecord(api, id, uiText("shortcut_text_0513"), message);
      if (!verifyRejected) { return WriteResult.FAILED; }
      const code: number = (error as BusinessError).code;
      this.terminalWrite = code === 201 || code === 202 || code === 801 || code === 17700070;
      rejected = true;
    }
    if (!this.isCurrent(generation)) {
      return WriteResult.STALE;
    }
    if (!rejected) { this.addRecord(api, id, uiText("shortcut_text_0161"), uiText("shortcut_text_0324", [String(visible)])); }
    this.updateItem(id, uiText("shortcut_text_0205"), '');
    const queried: boolean = await this.query(generation, uiText("shortcut_text_0502", [String(id)]), verifyRejected ? this.batchTimeoutMs : 0);
    if (!this.isCurrent(generation)) {
      return WriteResult.STALE;
    }
    if (!queried) {
      const message: string = uiText("shortcut_text_0291", [String(this.view.queryError)]);
      this.updateItem(id, uiText("shortcut_text_0205"), message);
      this.addRecord(uiText("shortcut_text_0358"), id, uiText("shortcut_text_0205"), message);
      return WriteResult.PENDING;
    }
    const item: ShortcutItem | undefined = this.view.items.find((entry: ShortcutItem) => entry.id === id);
    if (item === undefined || !item.visibleExplicit) {
      const message: string = item === undefined ? uiText("shortcut_text_0293") : uiText("shortcut_text_0292");
      this.updateItem(id, uiText("shortcut_text_0205"), message);
      this.addRecord(uiText("shortcut_text_0358"), id, uiText("shortcut_text_0205"), message);
      return WriteResult.PENDING;
    }
    if (item.visible !== visible) {
      const message: string = uiText("shortcut_text_0430", [String(visible), String(item.visible)]);
      this.updateItem(id, uiText("shortcut_text_0290"), message);
      this.addRecord(uiText("shortcut_text_0358"), id, uiText("shortcut_text_0290"), message);
      return verifyRejected && this.uncompletedWrites.includes(id) ? WriteResult.PENDING : WriteResult.MISMATCH;
    }
    this.updateItem(id, uiText("shortcut_text_0294"), '');
    this.addRecord(uiText("shortcut_text_0358"), id, uiText("shortcut_text_0294"), `visible=${visible}`);
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
      case WriteResult.CONFIRMED: return uiText("shortcut_text_0294");
      case WriteResult.MISMATCH: return uiText("shortcut_text_0290");
      case WriteResult.PENDING: return uiText("shortcut_text_0676");
      case WriteResult.FAILED: return uiText("shortcut_text_0503");
      default: return uiText("shortcut_text_0141");
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
        this.addRecord('createModuleContext', info.id, uiText("shortcut_text_0513"), this.errorText(error as BusinessError));
      }
    }
    if (info.labelId !== undefined && info.labelId > 0) {
      try {
        return resourceContext.resourceManager.getStringSync(info.labelId);
      } catch (error) {
        this.addRecord('resourceManager.getStringSync', info.id, uiText("shortcut_text_0513"), this.errorText(error as BusinessError));
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
        this.addRecord(api, info.id, uiText("shortcut_text_0513"), this.errorText(error as BusinessError));
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
      return "code=not provided; no error details";
    }
    const code: string = error.code === undefined ? 'not provided' : `${error.code}`;
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
      } catch (_) {
        logWarning('Shortcut listener failed; remaining listeners will still be notified');
      }
    }
  }
}

export const shortcutService: ShortcutService = new ShortcutService();
