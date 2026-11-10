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

import { AppConstants, AppLogger, StringResources } from 'common';
import {
  IrCode,
  IrCodeCompiler,
  IrCompileResult,
  IrSendQueue,
  SendFrame,
  SendJob,
  SendProgress,
  SendSource,
  SendState,
  SendStep,
  SendTicket,
  TransmitErrorMapper,
  TransmitResult,
  TransmitResultCode
} from 'ircore';
import {
  Device,
  DeviceDao,
  DeviceExpectedState,
  ExpectedStateDao,
  ExpectedStateService,
  IrCodeDao,
  KeyDao,
  KeySemantic,
  PowerState,
  Room,
  RoomDao,
  RoomKey,
  Scene,
  SceneDao,
  SceneRunResult,
  SceneStep,
  SceneStepDao,
  SceneValidation,
  SceneValidator,
  SendLog,
  SendLogDao
} from 'room';

/** AppLogger scope used by every log line emitted from this view model. */
const LOG_SCOPE: string = 'ConsoleViewModel';
/** Send-log result markers written to the send_log table. */
const LOG_SUCCESS: string = 'SUCCESS';
const LOG_FAILED: string = 'FAILED';
/** How long the send-result toast stays visible, in milliseconds. */
const TOAST_DURATION_MS: number = 2000;
/** Step index sentinel meaning the expected-state correction was manual, not part of a scene step. */
const MANUAL_CORRECT_STEP_INDEX: number = -1;
/** Conversion factor from microseconds to milliseconds for IR frame durations. */
const MICROSECONDS_PER_MS: number = 1000;
/** Prefix used to build scene run identifiers. */
const RUN_ID_PREFIX: string = 'run-';
/** Prefix used to build manual resend send-log identifiers. */
const LOG_ID_PREFIX: string = 'log-';
/** Identifier segment inserted between a run id and its log sequence number. */
const LOG_ID_RUN_SEGMENT: string = '-log-';

/**
 * Maps queued job steps back to visible step rows.
 * Only steps that actually enter a SendJob (key and IR code resolved) get a meta entry.
 */
class JobStepMeta {
  /** Index of the matching StepProgressView row in the UI list. */
  public viewIndex: number = 0;
  /** Target device of the queued step. */
  public deviceId: string = '';
  /** Target key of the queued step. */
  public keyId: string = '';
  /** Key semantic used to update the expected state after a successful send. */
  public semantic: KeySemantic = KeySemantic.POWER_ON;
  /** Resolved carrier frequency in Hz applied to the compiled frames. */
  public frequencyHz: number = 0;
  /** Short summary of the compiled pattern, stored in send-log rows. */
  public patternSummary: string = 'frames=0,len=0'; // Matches the format produced by patternSummary().
  /** Total IR duration of the compiled frames, stored in send-log rows. */
  public durationMs: number = 0;
}

/** UI-facing view model rendered by DeviceCard for a single device. */
@ObservedV2
export class DeviceView {
  /** The device entity loaded from the database. */
  @Trace public device: Device = new Device();
  /** Current expected power state used by the correct flow. */
  @Trace public expected: DeviceExpectedState = new DeviceExpectedState();
  /** Keys registered on the device, used to pick the primary key. */
  @Trace public keys: RoomKey[] = [];
  /** Primary key id used by the manual resend action. */
  @Trace public primaryKeyId: string = '';
}

/** UI-facing progress state for a single scene step row in RunProgressPanel. */
@ObservedV2
export class StepProgressView {
  /** Display index of the step, numbered from zero over visible steps. */
  @Trace public index: number = 0;
  /** Resolved device name shown on the row. */
  @Trace public deviceName: string = '';
  /** Resolved key label shown on the row. */
  @Trace public keyLabel: string = '';
  /** Current send state of the step. */
  @Trace public state: SendState = SendState.PENDING;
  /** Failure or result message shown under a failed row. */
  @Trace public message: string = '';
}

/**
 * Observable view model backing the console page.
 * It loads rooms, devices and scenes, drives scene runs and manual resends
 * through IrSendQueue, and persists one send log per executed step.
 */
@ObservedV2
export class ConsoleViewModel {
  /** Room currently selected in the console. */
  @Trace public roomId: string = '';
  /** Display name of the selected room. */
  @Trace public roomName: string = '';
  /** Device views rendered as DeviceCard list items. */
  @Trace public devices: DeviceView[] = [];
  /** Scenes available in the selected room, rendered by SceneBar. */
  @Trace public scenes: Scene[] = [];
  /** Step rows rendered by RunProgressPanel for the latest run. */
  @Trace public steps: StepProgressView[] = [];
  /** True while a scene run or retry is executing. */
  @Trace public running: boolean = false;
  /** True when the console is opened from the read-only entry. */
  @Trace public readOnly: boolean = true;
  /** Current toast text shown by SendResultToast. */
  @Trace public toastText: string = '';
  /** Visibility flag of SendResultToast. */
  @Trace public toastVisible: boolean = false;
  /** Identifier of the latest scene run, used to match retry requests. */
  @Trace public lastRunId: string = '';
  /** Indexes of steps that failed in the latest run. */
  @Trace public failedIndexes: number[] = [];
  /** Human-readable summary of the latest run, e.g. "2/3 steps sent". */
  @Trace public lastRunSummary: string = '';

  private queue: IrSendQueue = IrSendQueue.getInstance();
  private lastJob: SendJob | undefined = undefined;
  private lastJobMeta: JobStepMeta[] = [];
  private toastTimer: number = -1;
  private logSequence: number = 0;
  private resendState: SendState = SendState.PENDING;
  private resendResultCode: TransmitResultCode = TransmitResultCode.UNKNOWN;

  /** Queue progress listener that forwards job progress to the visible step rows. */
  private progressListener: (ticketId: string, progress: SendProgress) => void =
    (_ticketId: string, progress: SendProgress): void => {
      this.handleProgress(progress);
    };

  /** Progress listener used only while a manual resend is in flight. */
  private resendListener: (ticketId: string, progress: SendProgress) => void =
    (_ticketId: string, progress: SendProgress): void => {
      // The resend flow only needs the final state, so it just records values here.
      this.resendState = progress.state;
      this.resendResultCode = progress.resultCode;
    };

  /** Enables or disables the read-only guard that blocks all send actions. */
  setReadOnly(value: boolean): void {
    this.readOnly = value;
  }

  /** Returns the current read-only flag. */
  isReadOnly(): boolean {
    return this.readOnly;
  }

  /** Loads the first room as the default console context, or clears state when none exists. */
  async loadDefaultRoom(): Promise<void> {
    AppLogger.info(LOG_SCOPE, 'Loading default room');
    const rooms: Room[] = await RoomDao.list();
    // Without rooms the console shows an empty but usable shell.
    if (rooms.length === 0) {
      AppLogger.warn(LOG_SCOPE, 'No rooms available, clearing console state');
      this.clearRoomState();
      return;
    }
    await this.load(rooms[0].id);
  }

  /** Loads the given room together with its device views and scene list. */
  async load(roomId: string): Promise<void> {
    AppLogger.info(LOG_SCOPE, `Loading room, roomId=${roomId}`);
    const room: Room | undefined = await RoomDao.get(roomId);
    this.roomId = roomId;
    // A missing room row still renders, but without a display name.
    this.roomName = room !== undefined ? room.name : '';

    const deviceList: Device[] = await DeviceDao.listByRoom(roomId);
    const views: DeviceView[] = [];
    for (let i = 0; i < deviceList.length; i++) {
      const device: Device = deviceList[i];
      const view: DeviceView = new DeviceView();
      view.device = device;
      // Load keys first so the primary key can be resolved for resend.
      view.keys = await KeyDao.listByDevice(device.id);
      view.primaryKeyId = ConsoleViewModel.pickPrimaryKey(view.keys);
      const expected: DeviceExpectedState | undefined = await ExpectedStateDao.get(device.id);
      if (expected !== undefined) {
        view.expected = expected;
      } else {
        // Fall back to a blank expected state so the card always has a model.
        const blank: DeviceExpectedState = new DeviceExpectedState();
        blank.deviceId = device.id;
        view.expected = blank;
      }
      views.push(view);
    }
    this.devices = views;
    this.scenes = await SceneDao.listByRoom(roomId);
    // Reset the previous run so stale rows never leak into the new room.
    this.steps = [];
    this.failedIndexes = [];
    this.lastRunSummary = '';
    this.lastRunId = '';
    this.lastJob = undefined;
    this.lastJobMeta = [];
    AppLogger.info(LOG_SCOPE, `Room loaded, roomId=${roomId}, devices=${views.length}, scenes=${this.scenes.length}`);
  }

  /** Applies a manual expected-state correction and refreshes the matching device view. */
  async correctExpected(deviceId: string, power: PowerState): Promise<void> {
    AppLogger.info(LOG_SCOPE, `Correcting expected state, deviceId=${deviceId}, power=${power}`);
    // A sequence of -1 marks the correction as manual rather than scene driven.
    const next: DeviceExpectedState =
      await ExpectedStateService.correct(deviceId, power, MANUAL_CORRECT_STEP_INDEX);
    const target: DeviceView | undefined = this.findDeviceView(deviceId);
    if (target !== undefined) {
      target.expected = next;
    } else {
      AppLogger.warn(LOG_SCOPE, `Device view not found for correction, deviceId=${deviceId}`);
    }
    AppLogger.info(LOG_SCOPE, `Expected state corrected, deviceId=${deviceId}, power=${power}`);
  }

  /** Validates and executes the given scene, returning the run result for the caller. */
  async runScene(sceneId: string): Promise<SceneRunResult> {
    AppLogger.info(LOG_SCOPE, `Running scene, sceneId=${sceneId}`);
    const result: SceneRunResult = new SceneRunResult();
    // Read-only mode must never reach the IR queue.
    if (this.readOnly) {
      AppLogger.warn(LOG_SCOPE, `Scene run rejected, read-only mode, sceneId=${sceneId}`);
      result.ok = false;
      result.message = StringResources.get($r('app.string.msg_read_only_send'));
      return result;
    }
    if (this.running || this.queue.isBusy()) {
      AppLogger.warn(LOG_SCOPE, `Scene run rejected, sender busy, sceneId=${sceneId}`);
      result.ok = false;
      result.message = StringResources.get($r('app.string.msg_busy_running'));
      return result;
    }

    const validation: SceneValidation = await SceneValidator.validate(sceneId);
    if (!validation.valid) {
      AppLogger.warn(LOG_SCOPE,
        `Scene validation failed, sceneId=${sceneId}, issues=${validation.messages.length}`);
      result.ok = false;
      result.message = validation.messages.length > 0 ?
        validation.messages.join('; ') : StringResources.get($r('app.string.msg_invalid_scene'));
      return result;
    }

    const sceneSteps: SceneStep[] = await SceneStepDao.listByScene(sceneId);
    const runId: string = `${RUN_ID_PREFIX}${Date.now()}`;
    const job: SendJob = new SendJob();
    job.sceneRunId = runId;
    job.source = SendSource.SCENE;

    const views: StepProgressView[] = [];
    const allMeta: JobStepMeta[] = [];
    const jobMeta: JobStepMeta[] = [];

    // Resolve keys, IR codes and frames for every enabled step before sending.
    for (let i = 0; i < sceneSteps.length; i++) {
      const sceneStep: SceneStep = sceneSteps[i];
      // Disabled steps are skipped entirely and never appear in the UI list.
      if (!sceneStep.enabled) {
        continue;
      }
      const view: StepProgressView = new StepProgressView();
      view.index = views.length;
      view.deviceName = this.deviceName(sceneStep.deviceId);
      const key: RoomKey | undefined = await KeyDao.get(sceneStep.keyId);
      view.keyLabel = key !== undefined ? key.label : sceneStep.keyId;
      views.push(view);

      const meta: JobStepMeta = new JobStepMeta();
      meta.viewIndex = view.index;
      meta.deviceId = sceneStep.deviceId;
      meta.keyId = sceneStep.keyId;
      allMeta.push(meta);

      if (key === undefined) {
        AppLogger.warn(LOG_SCOPE, `Scene step key missing, sceneId=${sceneId}, keyId=${sceneStep.keyId}`);
        view.state = SendState.FAILED;
        view.message = StringResources.get($r('app.string.msg_scene_key_missing'));
        continue;
      }
      meta.semantic = key.semantic;
      const code: IrCode | undefined = await IrCodeDao.get(key.irCodeId);
      if (code === undefined) {
        AppLogger.warn(LOG_SCOPE, `Scene step IR code missing, sceneId=${sceneId}, keyId=${key.id}`);
        view.state = SendState.FAILED;
        view.message = StringResources.get($r('app.string.msg_ir_code_missing'));
        continue;
      }
      // Fall back to the default carrier when the stored frequency is invalid.
      meta.frequencyHz =
        code.frequencyHz > 0 ? code.frequencyHz : AppConstants.DEFAULT_FREQUENCY_HZ;
      const compiled: IrCompileResult = IrCodeCompiler.compile(code);
      if (!compiled.ok) {
        AppLogger.warn(LOG_SCOPE, `Scene step compile failed, sceneId=${sceneId}, keyId=${key.id}`);
        view.state = SendState.FAILED;
        view.message = compiled.message.length > 0 ? compiled.message :
          StringResources.get($r('app.string.msg_ir_compile_failed'));
        continue;
      }
      meta.patternSummary = ConsoleViewModel.patternSummary(compiled);
      meta.durationMs = ConsoleViewModel.framesDurationMs(compiled);
      const sendStep: SendStep = new SendStep();
      sendStep.index = job.steps.length;
      sendStep.deviceId = sceneStep.deviceId;
      sendStep.keyId = sceneStep.keyId;
      sendStep.frames = ConsoleViewModel.buildFrames(compiled, meta.frequencyHz);
      sendStep.delayMs = sceneStep.delayMs;
      job.steps.push(sendStep);
      jobMeta.push(meta);
    }

    this.steps = views;
    this.failedIndexes = [];
    this.lastRunId = runId;

    // Nothing was sendable: persist logs for the failed rows and bail out.
    if (job.steps.length === 0) {
      AppLogger.warn(LOG_SCOPE, `Scene has no sendable steps, runId=${runId}`);
      this.lastJob = undefined;
      this.lastJobMeta = [];
      this.running = false;
      await this.applyResults(allMeta, runId);
      result.ok = false;
      result.runId = runId;
      result.message = StringResources.get($r('app.string.msg_scene_no_steps'));
      result.failedStepIndexes = this.failedIndexes.slice();
      return result;
    }

    this.running = true;
    AppLogger.info(LOG_SCOPE, `Scene run started, runId=${runId}, steps=${job.steps.length}`);
    const accepted: boolean = await this.executeJob(job, jobMeta);
    this.running = false;
    if (!accepted) {
      AppLogger.error(LOG_SCOPE, `Scene job enqueue rejected, runId=${runId}`);
      result.ok = false;
      result.runId = runId;
      result.message = StringResources.get($r('app.string.msg_busy'));
      return result;
    }

    await this.applyResults(allMeta, runId);
    result.ok = this.failedIndexes.length === 0;
    result.runId = runId;
    result.message = result.ok ? StringResources.get($r('app.string.msg_scene_done')) :
      StringResources.get($r('app.string.msg_scene_partial'));
    result.failedStepIndexes = this.failedIndexes.slice();
    AppLogger.info(LOG_SCOPE,
      `Scene run finished, runId=${runId}, ok=${result.ok}, failed=${this.failedIndexes.length}`);
    return result;
  }

  /** Scene bar entry: runs the scene and toasts the outcome. */
  async runSceneWithFeedback(sceneId: string): Promise<void> {
    AppLogger.info(LOG_SCOPE, `Running scene with feedback, sceneId=${sceneId}`);
    const result: SceneRunResult = await this.runScene(sceneId);
    this.showToast(result.message, TOAST_DURATION_MS);
  }

  /** Re-sends only the steps that failed in the run identified by runId. */
  async retryFailed(runId: string): Promise<SceneRunResult> {
    AppLogger.info(LOG_SCOPE, `Retrying failed steps, runId=${runId}`);
    const result: SceneRunResult = new SceneRunResult();
    if (this.readOnly) {
      AppLogger.warn(LOG_SCOPE, `Retry rejected, read-only mode, runId=${runId}`);
      result.ok = false;
      result.message = StringResources.get($r('app.string.msg_read_only_send'));
      return result;
    }
    const savedJob: SendJob | undefined = this.lastJob;
    // The retry only applies to the latest run while there are failed steps.
    if (runId !== this.lastRunId || savedJob === undefined ||
      this.failedIndexes.length === 0) {
      AppLogger.warn(LOG_SCOPE, `Retry has no matching run or failures, runId=${runId}`);
      result.ok = false;
      result.message = StringResources.get($r('app.string.msg_no_retry'));
      return result;
    }
    if (this.running || this.queue.isBusy()) {
      AppLogger.warn(LOG_SCOPE, `Retry rejected, sender busy, runId=${runId}`);
      result.ok = false;
      result.runId = runId;
      result.message = StringResources.get($r('app.string.msg_busy_running'));
      return result;
    }

    const previousJob: SendJob = savedJob;
    const job: SendJob = new SendJob();
    job.sceneRunId = runId;
    job.source = SendSource.SCENE;
    const metas: JobStepMeta[] = [];
    // Rebuild the job from the previous frames so no re-compilation is needed.
    for (let i = 0; i < previousJob.steps.length; i++) {
      const meta: JobStepMeta = this.lastJobMeta[i];
      if (this.failedIndexes.indexOf(meta.viewIndex) < 0) {
        continue;
      }
      const previous: SendStep = previousJob.steps[i];
      const sendStep: SendStep = new SendStep();
      sendStep.index = job.steps.length;
      sendStep.deviceId = previous.deviceId;
      sendStep.keyId = previous.keyId;
      sendStep.frames = previous.frames;
      sendStep.delayMs = previous.delayMs;
      job.steps.push(sendStep);
      metas.push(meta);
    }
    if (job.steps.length === 0) {
      AppLogger.warn(LOG_SCOPE, `Retry found no sendable steps, runId=${runId}`);
      result.ok = false;
      result.runId = runId;
      result.message = StringResources.get($r('app.string.msg_no_retry'));
      return result;
    }

    // Reset retried rows to PENDING so the panel reflects the new attempt.
    for (let i = 0; i < metas.length; i++) {
      const view: StepProgressView = this.steps[metas[i].viewIndex];
      view.state = SendState.PENDING;
      view.message = '';
    }

    this.running = true;
    AppLogger.info(LOG_SCOPE, `Retry started, runId=${runId}, steps=${job.steps.length}`);
    const accepted: boolean = await this.executeJob(job, metas);
    this.running = false;
    if (!accepted) {
      AppLogger.error(LOG_SCOPE, `Retry enqueue rejected, runId=${runId}`);
      result.ok = false;
      result.runId = runId;
      result.message = StringResources.get($r('app.string.msg_busy'));
      return result;
    }

    await this.applyResults(metas, runId);
    result.ok = this.failedIndexes.length === 0;
    result.runId = runId;
    result.message = result.ok ? StringResources.get($r('app.string.msg_scene_done')) :
      StringResources.get($r('app.string.msg_scene_partial'));
    result.failedStepIndexes = this.failedIndexes.slice();
    AppLogger.info(LOG_SCOPE,
      `Retry finished, runId=${runId}, ok=${result.ok}, failed=${this.failedIndexes.length}`);
    return result;
  }

  /** Sends the primary key of the given device as a manual resend and updates expected state. */
  async resendDevice(deviceId: string): Promise<TransmitResult> {
    AppLogger.info(LOG_SCOPE, `Manual resend requested, deviceId=${deviceId}`);
    const result: TransmitResult = new TransmitResult();
    if (this.readOnly) {
      AppLogger.warn(LOG_SCOPE, `Manual resend rejected, read-only mode, deviceId=${deviceId}`);
      result.code = TransmitResultCode.NO_EMITTER;
      result.durationMs = 0;
      result.message = StringResources.get($r('app.string.msg_read_only_send'));
      this.showToast(StringResources.get($r('app.string.msg_read_only_send')), TOAST_DURATION_MS);
      return result;
    }
    if (this.running || this.queue.isBusy()) {
      AppLogger.warn(LOG_SCOPE, `Manual resend rejected, sender busy, deviceId=${deviceId}`);
      result.code = TransmitResultCode.BUSY;
      result.durationMs = 0;
      result.message = TransmitErrorMapper.toUserText(TransmitResultCode.BUSY);
      return result;
    }

    const deviceView: DeviceView | undefined = this.findDeviceView(deviceId);
    if (deviceView === undefined) {
      AppLogger.warn(LOG_SCOPE, `Manual resend device missing, deviceId=${deviceId}`);
      result.code = TransmitResultCode.PARAM_ERROR;
      result.message = StringResources.get($r('app.string.msg_device_missing'));
      return result;
    }
    if (deviceView.primaryKeyId.length === 0) {
      AppLogger.warn(LOG_SCOPE, `Manual resend has no primary key, deviceId=${deviceId}`);
      result.code = TransmitResultCode.PARAM_ERROR;
      result.message = StringResources.get($r('app.string.msg_device_no_keys'));
      return result;
    }

    const key: RoomKey | undefined = await KeyDao.get(deviceView.primaryKeyId);
    if (key === undefined) {
      AppLogger.warn(LOG_SCOPE, `Manual resend key missing, deviceId=${deviceId}`);
      result.code = TransmitResultCode.PARAM_ERROR;
      result.message = StringResources.get($r('app.string.msg_key_missing'));
      return result;
    }
    const code: IrCode | undefined = await IrCodeDao.get(key.irCodeId);
    if (code === undefined) {
      AppLogger.warn(LOG_SCOPE, `Manual resend IR code missing, keyId=${key.id}`);
      result.code = TransmitResultCode.PARAM_ERROR;
      result.message = StringResources.get($r('app.string.msg_ir_code_missing'));
      return result;
    }
    // Fall back to the default carrier when the stored frequency is invalid.
    const frequencyHz: number =
      code.frequencyHz > 0 ? code.frequencyHz : AppConstants.DEFAULT_FREQUENCY_HZ;
    const compiled: IrCompileResult = IrCodeCompiler.compile(code);
    if (!compiled.ok) {
      AppLogger.warn(LOG_SCOPE, `Manual resend compile failed, keyId=${key.id}`);
      result.code = TransmitResultCode.PARAM_ERROR;
      result.durationMs = 0;
      result.message = compiled.message.length > 0 ?
        compiled.message : TransmitErrorMapper.toUserText(TransmitResultCode.PARAM_ERROR);
      return result;
    }

    const job: SendJob = new SendJob();
    job.source = SendSource.MANUAL;
    const sendStep: SendStep = new SendStep();
    sendStep.index = 0;
    sendStep.deviceId = deviceId;
    sendStep.keyId = key.id;
    sendStep.frames = ConsoleViewModel.buildFrames(compiled, frequencyHz);
    job.steps.push(sendStep);

    // Track the outcome via a dedicated listener for the duration of the send.
    this.resendState = SendState.PENDING;
    this.resendResultCode = TransmitResultCode.UNKNOWN;
    this.queue.offProgress(this.resendListener);
    this.queue.onProgress(this.resendListener);
    const startedAt: number = Date.now();
    const ticket: SendTicket = this.queue.enqueue(job);
    if (!ticket.accepted) {
      AppLogger.warn(LOG_SCOPE, `Manual resend enqueue rejected, deviceId=${deviceId}`);
      this.queue.offProgress(this.resendListener);
      result.code = TransmitResultCode.BUSY;
      result.durationMs = 0;
      result.message = TransmitErrorMapper.toUserText(TransmitResultCode.BUSY);
      return result;
    }
    await this.queue.waitIdle();
    this.queue.offProgress(this.resendListener);

    const success: boolean = this.isResendSuccess();
    result.code = success ? TransmitResultCode.OK : this.resendResultCode;
    result.durationMs = Date.now() - startedAt;
    result.message = TransmitErrorMapper.toUserText(result.code);
    AppLogger.info(LOG_SCOPE,
      `Manual resend finished, deviceId=${deviceId}, code=${result.code}, durationMs=${result.durationMs}`);

    // Persist one send log row for the manual resend.
    const log: SendLog = new SendLog();
    this.logSequence++;
    log.id = `${LOG_ID_PREFIX}${this.logSequence}-${Date.now()}`;
    log.timestamp = Date.now();
    log.roomId = this.roomId;
    log.deviceId = deviceId;
    log.keyId = key.id;
    log.frequencyHz = frequencyHz;
    log.patternSummary = ConsoleViewModel.patternSummary(compiled);
    log.result = success ? LOG_SUCCESS : LOG_FAILED;
    log.durationMs = result.durationMs;
    log.sceneRunId = '';
    await SendLogDao.insert(log);
    AppLogger.info(LOG_SCOPE, `Manual send log persisted, logId=${log.id}, result=${log.result}`);

    // A successful key send moves the expected state forward.
    if (success) {
      const next: DeviceExpectedState =
        await ExpectedStateService.applyKey(deviceId, key.semantic);
      const target: DeviceView | undefined = this.findDeviceView(deviceId);
      if (target !== undefined) {
        target.expected = next;
      }
      AppLogger.info(LOG_SCOPE, `Expected state updated after resend, deviceId=${deviceId}`);
    }
    return result;
  }

  /** Shows the toast for the given duration, replacing any pending hide timer. */
  showToast(text: string, visibleMs: number): void {
    this.toastText = text;
    this.toastVisible = true;
    // Clear the previous timer so a fast follow-up toast is not hidden early.
    if (this.toastTimer >= 0) {
      clearTimeout(this.toastTimer);
    }
    this.toastTimer = setTimeout(() => {
      this.toastVisible = false;
      this.toastTimer = -1;
    }, visibleMs);
  }

  /** Returns true when the tracked resend progress ended in SUCCESS. */
  private isResendSuccess(): boolean {
    return this.resendState === SendState.SUCCESS;
  }

  /** Enqueues the job, waits for the queue to drain, and reports whether it was accepted. */
  private async executeJob(job: SendJob, jobMeta: JobStepMeta[]): Promise<boolean> {
    this.lastJob = job;
    this.lastJobMeta = jobMeta;
    // Re-attach the listener so late registrations never miss progress events.
    this.queue.offProgress(this.progressListener);
    this.queue.onProgress(this.progressListener);
    const ticket: SendTicket = this.queue.enqueue(job);
    if (!ticket.accepted) {
      this.queue.offProgress(this.progressListener);
      return false;
    }
    await this.queue.waitIdle();
    this.queue.offProgress(this.progressListener);
    return true;
  }

  /** Persists one send log per queued step and applies expected state for successes. */
  private async applyResults(metas: JobStepMeta[], runId: string): Promise<void> {
    for (let i = 0; i < metas.length; i++) {
      const meta: JobStepMeta = metas[i];
      const view: StepProgressView = this.steps[meta.viewIndex];
      const success: boolean = view.state === SendState.SUCCESS;

      const log: SendLog = new SendLog();
      this.logSequence++;
      log.id = `${runId}${LOG_ID_RUN_SEGMENT}${this.logSequence}`;
      log.timestamp = Date.now();
      log.roomId = this.roomId;
      log.deviceId = meta.deviceId;
      log.keyId = meta.keyId;
      log.frequencyHz = meta.frequencyHz;
      log.patternSummary = meta.patternSummary;
      log.result = success ? LOG_SUCCESS : LOG_FAILED;
      log.durationMs = meta.durationMs;
      log.sceneRunId = runId;
      await SendLogDao.insert(log);
      AppLogger.info(LOG_SCOPE,
        `Send log persisted, runId=${runId}, stepIndex=${meta.viewIndex}, result=${log.result}`);

      // A successful key send moves the expected state forward.
      if (success) {
        const next: DeviceExpectedState =
          await ExpectedStateService.applyKey(meta.deviceId, meta.semantic);
        const deviceView: DeviceView | undefined = this.findDeviceView(meta.deviceId);
        if (deviceView !== undefined) {
          deviceView.expected = next;
        }
      }
    }
    this.recomputeRunState();
  }

  /** Maps queue progress for the active job onto the visible step row. */
  private handleProgress(progress: SendProgress): void {
    // Ignore progress that does not belong to the current job or view list.
    if (progress.stepIndex < 0 || progress.stepIndex >= this.lastJobMeta.length) {
      return;
    }
    const viewIndex: number = this.lastJobMeta[progress.stepIndex].viewIndex;
    if (viewIndex < 0 || viewIndex >= this.steps.length) {
      return;
    }
    const view: StepProgressView = this.steps[viewIndex];
    if (progress.state === SendState.SENDING) {
      AppLogger.info(LOG_SCOPE, `Step sending, stepIndex=${progress.stepIndex}`);
      view.state = SendState.SENDING;
      view.message = '';
    } else if (progress.state === SendState.SUCCESS) {
      AppLogger.info(LOG_SCOPE,
        `Step success, stepIndex=${progress.stepIndex}, code=${progress.resultCode}`);
      view.state = SendState.SUCCESS;
      view.message = TransmitErrorMapper.toUserText(progress.resultCode);
    } else if (progress.state === SendState.FAILED) {
      AppLogger.warn(LOG_SCOPE,
        `Step failed, stepIndex=${progress.stepIndex}, code=${progress.resultCode}`);
      view.state = SendState.FAILED;
      view.message = TransmitErrorMapper.toUserText(progress.resultCode);
    }
  }

  /** Recomputes failed indexes and the human-readable run summary from step rows. */
  private recomputeRunState(): void {
    const failed: number[] = [];
    let successCount: number = 0;
    // Any row that is not SUCCESS counts as failed for retry purposes.
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].state === SendState.SUCCESS) {
        successCount++;
      } else {
        failed.push(i);
      }
    }
    this.failedIndexes = failed;
    this.lastRunSummary = StringResources.format($r('app.string.msg_run_summary'),
      successCount, this.steps.length);
  }

  /** Finds the device view matching the given device id. */
  private findDeviceView(deviceId: string): DeviceView | undefined {
    for (let i = 0; i < this.devices.length; i++) {
      if (this.devices[i].device.id === deviceId) {
        return this.devices[i];
      }
    }
    return undefined;
  }

  /** Returns the display name of a device, falling back to its raw id. */
  private deviceName(deviceId: string): string {
    const view: DeviceView | undefined = this.findDeviceView(deviceId);
    return view !== undefined ? view.device.name : deviceId;
  }

  /** Clears every room-scoped field when no room is available. */
  private clearRoomState(): void {
    this.roomId = '';
    this.roomName = '';
    this.devices = [];
    this.scenes = [];
    this.steps = [];
    this.failedIndexes = [];
    this.lastRunId = '';
    this.lastRunSummary = '';
    this.lastJob = undefined;
    this.lastJobMeta = [];
  }

  /** Picks the primary key: the POWER_ON key when present, otherwise the first key. */
  private static pickPrimaryKey(keys: RoomKey[]): string {
    for (let i = 0; i < keys.length; i++) {
      if (keys[i].semantic === KeySemantic.POWER_ON) {
        return keys[i].id;
      }
    }
    return keys.length > 0 ? keys[0].id : '';
  }

  /** Converts compiled frames into send frames using the resolved carrier frequency. */
  private static buildFrames(compiled: IrCompileResult, frequencyHz: number): SendFrame[] {
    const frames: SendFrame[] = [];
    for (let i = 0; i < compiled.frames.length; i++) {
      const frame: SendFrame = new SendFrame();
      frame.frequencyHz = frequencyHz;
      frame.pattern = compiled.frames[i].pattern;
      frames.push(frame);
    }
    return frames;
  }

  /** Builds a compact "frames=N,len=M" summary used in send-log rows. */
  private static patternSummary(compiled: IrCompileResult): string {
    const firstLength: number =
      compiled.frames.length > 0 ? compiled.frames[0].pattern.length : 0;
    return `frames=${compiled.frames.length},len=${firstLength}`;
  }

  /** Sums the frame durations and converts the total from microseconds to milliseconds. */
  private static framesDurationMs(compiled: IrCompileResult): number {
    let totalUs: number = 0;
    for (let i = 0; i < compiled.frames.length; i++) {
      totalUs += compiled.frames[i].durationUs;
    }
    return Math.round(totalUs / MICROSECONDS_PER_MS);
  }
}
