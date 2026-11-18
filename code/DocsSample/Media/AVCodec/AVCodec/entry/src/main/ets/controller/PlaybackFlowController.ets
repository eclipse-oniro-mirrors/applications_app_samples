/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { common } from '@kit.AbilityKit';
import { PlaybackResult } from 'libplayer.so';
import { PlayerSettingsModel } from '../model/PlayerSettingsModel';
import { PlaybackHistoryCoordinator } from './PlaybackHistoryCoordinator';
import { PlaybackRecoveryModel, PlaybackRecoverySnapshot } from '../model/PlaybackRecoveryModel';
import { PlaybackMode } from '../model/PlaybackModeModel';
import { MediaTaskLease } from '../model/MediaTaskCoordinator';
import { PlaybackQueueController, PlaybackQueueRequest } from './PlaybackQueueController';
import { PlaybackFlowRuntime } from './PlaybackFlowRuntime';
import { PlaybackSessionController } from './PlaybackSessionController';
import { SeekRequestController, SeekRequestResult } from './SeekRequestController';
import { PlaybackStartupResult } from './PlaybackStartupController';
import { PlaybackFlowPhase, PlaybackFlowView, PlaybackCommandState } from './PlaybackFlowState';
import { PlaybackFlowEvent, PlaybackFlowNotice, PlaybackPreparingEvent, PlaybackLaunchingEvent,
  PlaybackNoticeEvent } from './PlaybackFlowEvent';
import Logger from '../common/utils/Logger';

const TAG: string = 'PlaybackFlow';
const RESUME_DELAY_MS: number = 300;

export interface PlaybackFlowOptions {
  settings: PlayerSettingsModel;
  smartFluency: boolean;
  autoRecovery: boolean;
  mode: PlaybackMode;
  muted: boolean;
}

export interface PlaybackFlowProgress {
  positionUs: number;
  durationUs: number;
  mediaDurationUs: number;
}

// 快照同步读取，事件同步派发；接收端只更新界面，不在事件内启动新任务。
// 控制器存活期间保存这些回调，页面离开时调用leave()取消待处理流程。
export interface PlaybackFlowHost {
  getContext: () => common.Context | undefined;
  isActive: () => boolean;
  getPath: () => string | null;
  setPath: (path: string) => void;
  getOptions: () => PlaybackFlowOptions;
  getProgress: () => PlaybackFlowProgress;
  seekTo: (positionUs: number) => Promise<SeekRequestResult>;
  onEvent: (event: PlaybackFlowEvent) => void;
}

@Observed
class PlaybackFlowState implements PlaybackCommandState {
  private currentPhase: PlaybackFlowPhase = 'idle';
  private speed: number = 1;
  private controlRevision: number = 0;
  private generation: number = 0;
  private path: string | null = null;

  get session(): number { return this.generation; }
  get activePath(): string | null { return this.path; }
  get commandRevision(): number { return this.controlRevision; }
  get phase(): PlaybackFlowPhase { return this.currentPhase; }
  get buttonEnabled(): boolean { return this.currentPhase === 'idle' || this.currentPhase === 'close_pending'; }
  get isStopping(): boolean { return this.currentPhase === 'stopping'; }
  get canStart(): boolean { return this.currentPhase === 'idle'; }
  get canControl(): boolean { return this.currentPhase === 'active'; }
  get requestedSpeed(): number { return this.speed; }

  // 编排阶段只由流程转换，Native编解码状态仍由Native维护。
  transition(phase: PlaybackFlowPhase): void {
    this.currentPhase = phase;
    ++this.controlRevision;
  }

  // 期望倍速由播放控制命令与恢复快照更新，Seek结束后按此值恢复。
  setRequestedSpeed(speed: number): void { this.speed = speed; }

  beginSession(): number { return ++this.generation; }
  setActivePath(path: string | null): void { this.path = path; }
}

export class PlaybackFlowController {
  private state: PlaybackFlowState = new PlaybackFlowState();
  private host: PlaybackFlowHost;
  private queue: PlaybackQueueController;
  private history: PlaybackHistoryCoordinator;
  private runtime: PlaybackFlowRuntime;
  private seeks: SeekRequestController;
  private session: PlaybackSessionController;
  private recovery: PlaybackRecoveryModel = new PlaybackRecoveryModel();
  private startupRevision: number = 0;
  private continuationRevision: number = 0;
  private lease: MediaTaskLease | undefined = undefined;
  private resumeTimer: number = 0;

  constructor(host: PlaybackFlowHost, queue: PlaybackQueueController,
    history: PlaybackHistoryCoordinator, seeks: SeekRequestController,
    session: PlaybackSessionController, runtime: PlaybackFlowRuntime) {
    this.host = host;
    this.queue = queue;
    this.history = history;
    this.runtime = runtime;
    this.seeks = seeks;
    this.session = session;
  }

  get view(): PlaybackFlowView { return this.state; }
  get commandState(): PlaybackCommandState { return this.state; }

  // 所有播放入口共用此方法；异步准备返回时重新核对任务代次。
  async play(positionUs: number = -1, snapshot?: PlaybackRecoverySnapshot): Promise<void> {
    if (!this.canStart()) { return; }
    const path: string | null = this.host.getPath();
    if (path === null) { this.notice('no_source'); return; }
    const generation: number = this.state.beginSession();
    const revision: number = ++this.startupRevision;
    ++this.continuationRevision;
    this.beginPreparation(path, snapshot);
    if (!await this.prepare(path, generation, revision, snapshot !== undefined)) { return; }
    if (!this.isPreparationCurrent(generation, revision) || !this.host.isActive() || this.state.isStopping) { return; }
    await this.launch(path, generation, positionUs, snapshot);
  }

  private canStart(): boolean {
    if (this.state.phase === 'close_pending') { this.notice('close_unconfirmed'); return false; }
    if (this.runtime.isTranscoding()) { this.notice('transcoding'); return false; }
    return this.state.canStart && !this.seeks.isBusy() && this.host.isActive();
  }

  private beginPreparation(path: string, snapshot?: PlaybackRecoverySnapshot): void {
    if (snapshot === undefined) { this.recovery.reset(); this.state.setRequestedSpeed(1); }
    this.seeks.resetStatistics();
    this.clearResumeTimer();
    this.state.transition('preparing');
    this.host.onEvent(new PlaybackPreparingEvent(path, snapshot !== undefined));
  }

  private async prepare(path: string, generation: number, revision: number, recovering: boolean): Promise<boolean> {
    try {
      await this.runtime.prepare(path, this.host.getContext());
    } catch (error) {
      if (!this.isPreparationCurrent(generation, revision)) { return false; }
      this.state.transition('idle');
      if (recovering) { this.host.onEvent(PlaybackFlowEvent.signal('recovery_failed')); }
      Logger.error(TAG, `Prepare playback URI failed: ${String(error)}`);
      this.notice('open');
      return false;
    }
    if (!this.isPreparationCurrent(generation, revision)) { return false; }
    return this.host.isActive() && !this.state.isStopping;
  }

  private isPreparationCurrent(generation: number, revision: number): boolean {
    return generation === this.state.session && revision === this.startupRevision;
  }

  private async launch(path: string, generation: number, positionUs: number,
    snapshot?: PlaybackRecoverySnapshot): Promise<void> {
    let failureShown: boolean = false;
    let completed: boolean = false;
    const options: PlaybackFlowOptions = this.host.getOptions();
    const result: PlaybackStartupResult = await this.runtime.launch(this.host.getContext(), path,
      options.settings, options.smartFluency, (lease: MediaTaskLease): void => {
        this.lease = lease;
        this.state.setActivePath(path);
        this.state.transition('starting');
        this.history.activate(path);
        this.host.onEvent(new PlaybackLaunchingEvent(snapshot !== undefined));
      }, (completion: PlaybackResult, cleanupPending: boolean): void => {
        completed = true;
        if (generation !== this.state.session) { return; }
        this.complete(path, generation, completion, cleanupPending, failureShown);
        failureShown = failureShown || (!completion.success && completion.reason !== 'stopped');
      });
    if (completed || generation !== this.state.session || this.state.isStopping || !this.host.isActive()) { return; }
    if (result.kind === 'rejected' || result.kind === 'close_pending') {
      this.lease = undefined; this.state.setActivePath(null); this.history.release();
    }
    if (result.kind === 'started') { this.started(path, generation, positionUs, snapshot); return; }
    failureShown = result.reason === 'invalid';
    this.state.transition(result.kind === 'releasing' ? 'releasing' :
      (result.kind === 'close_pending' ? 'close_pending' : 'idle'));
    if (snapshot !== undefined) { this.host.onEvent(PlaybackFlowEvent.signal('recovery_failed')); }
    if (failureShown) {
      this.host.onEvent(PlaybackFlowEvent.signal('start_failed'));
      Logger.error(TAG, 'Player initialization or startup failed');
    }
    this.notice(this.launchNotice(result));
  }

  private launchNotice(result: PlaybackStartupResult): PlaybackFlowNotice {
    if (result.reason === 'close_unconfirmed') { return 'close_unconfirmed'; }
    if (result.reason === 'busy') { return 'busy'; }
    if (result.reason === 'invalid') { return 'invalid'; }
    return result.reason === 'empty' ? 'empty' : 'open';
  }

  private started(path: string, generation: number, positionUs: number, snapshot?: PlaybackRecoverySnapshot): void {
    this.state.transition('active');
    if (snapshot !== undefined) { this.host.onEvent(PlaybackFlowEvent.signal('recovery_succeeded')); }
    this.host.onEvent(PlaybackFlowEvent.signal('started'));
    const options: PlaybackFlowOptions = this.host.getOptions();
    const resumeUs: number = positionUs >= 0 ? positionUs : this.history.getResumePosition(
      this.host.getProgress().mediaDurationUs, options.settings.resumeLastPosition);
    if (snapshot !== undefined) {
      this.state.setRequestedSpeed(snapshot.speed);
      this.runtime.restoreControls(snapshot.speed, snapshot.paused,
        options.muted ? 0 : options.settings.audioVolume / 100);
    }
    if (resumeUs > 0 || snapshot !== undefined) {
      this.resumeTimer = this.runtime.schedule((): void => {
        this.resumeTimer = 0;
        void this.restorePosition(path, generation, resumeUs, snapshot !== undefined);
      }, RESUME_DELAY_MS);
    }
  }

  private async restorePosition(path: string, generation: number, positionUs: number,
    recovering: boolean): Promise<void> {
    if (!this.isPlaying(path, generation)) { return; }
    const result: SeekRequestResult = await this.host.seekTo(Math.max(0, positionUs));
    if (result === 'completed' && this.isPlaying(path, generation)) {
      this.notice(recovering ? 'recovered' : 'resumed');
    }
  }

  private isPlaying(path: string, generation: number): boolean {
    return this.host.isActive() && this.state.canControl &&
      generation === this.state.session && path === this.state.activePath;
  }

  // 进度快照只归属于已启动的源，选择新文件不会转移旧进度。
  async persistProgress(positionUs: number, durationUs: number, force: boolean = false): Promise<void> {
    await this.history.persistProgress(positionUs, durationUs, force);
  }

  // 有效输出才生成恢复快照，人工停止后不再自动恢复。
  observe(positionUs: number, paused: boolean, hasOutput: boolean): void {
    this.recovery.observe(positionUs, this.state.requestedSpeed, paused, hasOutput);
  }

  // 离页时立即截取最终进度，后续界面重置不影响异步保存。
  leave(): void {
    const progress: PlaybackFlowProgress = this.host.getProgress();
    void this.session.stop();
    void this.stop();
    void this.persistProgress(progress.positionUs, progress.durationUs, true);
  }

  // 会话和页面的上一项、下一项共用队列规则与停止顺序。
  switchQueue(direction: number): void {
    if (!this.state.canControl || this.queue.paths.length < 2) { return; }
    const target: number = this.queue.adjacent(direction, this.host.getOptions().mode);
    if (target < 0 || target === this.queue.index) { return; }
    this.queue.requestSwitch(target);
    void this.stop();
  }

  // 取消准备和等待Seek使用独立代次，保留已启动任务的完成回调。
  async stop(): Promise<void> {
    ++this.startupRevision;
    ++this.continuationRevision;
    if (this.state.isStopping || this.state.phase === 'close_pending') { return; }
    const previousPhase: PlaybackFlowPhase = this.state.phase;
    this.state.transition('stopping');
    if (this.lease !== undefined) { this.runtime.cancelling(this.lease); }
    this.recovery.cancel();
    this.seeks.cancel();
    this.updateStoppingState();
    this.clearResumeTimer();
    this.host.onEvent(PlaybackFlowEvent.signal('stopping'));
    if (previousPhase === 'preparing') { await this.cancelPreparation(); return; }
    const generation: number = this.state.session;
    const path: string | null = this.state.activePath;
    await this.seeks.waitForIdle();
    if (generation !== this.state.session || path !== this.state.activePath || !this.state.isStopping) { return; }
    const progress: PlaybackFlowProgress = this.host.getProgress();
    const saving: Promise<void> = this.persistProgress(progress.positionUs, progress.durationUs, true);
    if (this.runtime.stop()) {
      Logger.info(TAG, 'Player stop requested');
    } else {
      this.state.transition(previousPhase);
      const nativeState: number = this.runtime.getState();
      Logger.error(TAG, `Player stop request rejected, state: ${nativeState}`);
      this.host.onEvent(PlaybackFlowEvent.signal('stop_rejected'));
    }
    await saving;
    await this.history.flush();
  }

  private async cancelPreparation(): Promise<void> {
    this.state.transition('idle');
    if (this.queue.pendingIndex >= 0 && this.host.isActive()) { await this.continuePending(); return; }
    this.queue.clearPending();
    await this.session.stop();
  }

  private updateStoppingState(): void {
    const progress: PlaybackFlowProgress = this.host.getProgress();
    this.session.updateState(this.runtime.stoppingState, this.state.requestedSpeed,
      progress.positionUs, progress.durationUs);
  }

  private complete(path: string, generation: number, result: PlaybackResult,
    cleanupPending: boolean, failureShown: boolean): void {
    this.lease = undefined;
    if (result.reason === 'error') { this.host.onEvent(PlaybackFlowEvent.signal('failure')); }
    const retry: PlaybackRecoverySnapshot | undefined = !cleanupPending && result.reason === 'error' &&
      this.host.getOptions().autoRecovery && !this.state.isStopping && this.host.isActive() ?
      this.recovery.takeRetry() : undefined;
    if (retry !== undefined) { this.host.onEvent(PlaybackFlowEvent.signal('recovery_pending')); }
    const progress: PlaybackFlowProgress = this.host.getProgress();
    if (result.reason === 'completed') {
      void this.history.complete(progress.durationUs, (): number => this.runtime.completedDuration());
    } else if (progress.durationUs > 0) {
      void this.persistProgress(progress.positionUs, progress.durationUs, true);
    }
    this.updateStoppingState();
    this.history.release();
    this.state.setActivePath(null);
    this.state.transition(cleanupPending ? 'close_pending' : 'idle');
    this.clearResumeTimer();
    this.seeks.cancel();
    this.host.onEvent(PlaybackFlowEvent.signal('finished'));
    if (cleanupPending) {
      ++this.continuationRevision;
      this.queue.clearPending();
      void this.session.stop();
      if (this.host.isActive()) { this.notice('close_unconfirmed'); }
      return;
    }
    if (!this.host.isActive()) { void this.session.stop(); return; }
    this.dispatchCompletion(path, generation, result, retry, failureShown);
  }

  private dispatchCompletion(path: string, generation: number, result: PlaybackResult,
    retry: PlaybackRecoverySnapshot | undefined, failureShown: boolean): void {
    if (retry !== undefined) {
      this.notice('recovering');
      void this.continuePlayback(generation, path, retry.positionUs, retry);
      return;
    }
    if (result.reason === 'error' && this.recovery.getAttemptCount() > 0) {
      this.host.onEvent(PlaybackFlowEvent.signal('recovery_failed'));
    }
    if (this.queue.pendingIndex >= 0) { void this.continuePending(); return; }
    if (!result.success && result.reason !== 'stopped' && !failureShown) { this.notice('invalid'); }
    const next: number = result.reason === 'completed' ? this.queue.next(this.host.getOptions().mode) : -1;
    if (next < 0) { void this.session.stop(); return; }
    this.queue.select(next);
    this.host.onEvent(PlaybackFlowEvent.signal('queue_changed'));
    void this.continuePlayback(generation, this.queue.paths[next], 0);
  }

  // 队列切换等待AVSession和Seek释放后，再核对源、目标和队列身份。
  async continuePending(): Promise<void> {
    const request: PlaybackQueueRequest | undefined = this.queue.takePending();
    if (request === undefined || !this.host.isActive()) { return; }
    const generation: number = this.state.session;
    const revision: number = this.continuationRevision;
    const queueVersion: number = this.queue.version;
    const source: string | null = this.host.getPath();
    await this.session.stop();
    await this.seeks.waitForIdle();
    if (!this.canContinue(generation, revision, queueVersion, source) || !this.queue.isCurrent(request)) { return; }
    this.queue.select(request.index);
    this.host.onEvent(PlaybackFlowEvent.signal('queue_changed'));
    this.host.setPath(request.path);
    await this.play(request.positionUs);
  }

  private async continuePlayback(generation: number, path: string, positionUs: number,
    snapshot?: PlaybackRecoverySnapshot): Promise<void> {
    const revision: number = this.continuationRevision;
    const source: string | null = this.host.getPath();
    const queueVersion: number = this.queue.version;
    await this.seeks.waitForIdle();
    if (!this.canContinue(generation, revision, queueVersion, source)) { return; }
    this.host.setPath(path);
    await this.play(positionUs, snapshot);
  }

  private canContinue(generation: number, revision: number, queueVersion: number, source: string | null): boolean {
    return generation === this.state.session && revision === this.continuationRevision &&
      source === this.host.getPath() && queueVersion === this.queue.version && this.host.isActive() &&
      this.state.canStart;
  }

  private clearResumeTimer(): void {
    if (this.resumeTimer !== 0) { this.runtime.cancelTimer(this.resumeTimer); this.resumeTimer = 0; }
  }

  private notice(notice: PlaybackFlowNotice): void {
    this.host.onEvent(new PlaybackNoticeEvent(notice));
  }
}
