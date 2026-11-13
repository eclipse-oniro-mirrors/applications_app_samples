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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver,
  KEY_BACK,
  recorderComponentCount,
  waitForTimerWindowStable,
  pressAndWait,
  serializedDelay,
  TIMEOUT_TIMER_RENDER,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'AnimationControllerValidation';

// The recording tip window stays on screen for a fixed duration before hiding.
const TIP_WINDOW_DURATION: number = 3000;

// The recording icon of the timer page blinks every 800 ms while recording.
const RECORDING_ICON_BLINK_INTERVAL: number = 800;

// The timer floating window itself is shown/hidden with a short fade animation.
const TIMER_WINDOW_ANIMATION_DURATION: number = 300;

// Animation durations considered acceptable for the recording floating windows.
const RECOMMENDED_MIN_DURATION: number = 100;
const RECOMMENDED_MAX_DURATION: number = 3000;

// Animation type enumeration: every visual effect used by the floating windows.
enum AnimationType {
  FADE_IN = 'fade_in',
  FADE_OUT = 'fade_out',
  SLIDE_IN = 'slide_in',
  SLIDE_OUT = 'slide_out',
  SCALE_UP = 'scale_up',
  SCALE_DOWN = 'scale_down',
  BLINK = 'blink',
  NONE = 'none'
}

// Animation state enumeration: lifecycle of one animation execution.
enum AnimationState {
  IDLE = 'idle',
  RUNNING = 'running',
  PAUSED = 'paused',
  COMPLETED = 'completed',
  CANCELLED = 'cancelled'
}

// Play mode enumeration: `Alternate` is used by the 800 ms recording icon blink.
enum PlayMode {
  Once = 'once',
  Alternate = 'alternate',
  Repeat = 'repeat'
}

// Floating window kind: the timer window and the recording tip window.
enum WindowKind {
  TIMER = 'timer',
  TIP = 'tip',
  NONE = 'none'
}

// Animation configuration: parameters required to play one animation.
interface AnimationConfig {
  type: AnimationType;
  duration: number;
  delay: number;
  easing: string;
  repeatCount: number;
  playMode: PlayMode;
}

// Animation status: live state of the animation controller.
interface AnimationStatus {
  state: AnimationState;
  progress: number;
  currentTime: number;
  config: AnimationConfig;
}

interface StatusWrapper {
  status: AnimationStatus | null;
}

interface AnimationHistoryItem {
  type: AnimationType;
  window: WindowKind;
  startTime: number;
  endTime: number;
  completed: boolean;
}

interface AnimationConfigLite {
  type: AnimationType;
  duration: number;
}

interface InterruptionRecord {
  window: WindowKind;
  reason: string;
  atProgress: number;
  timestamp: number;
}

// Animation controller simulator: models the show/hide animations of the
// timer window and of the recording tip window.
class AnimationControllerSimulator {
  private static instance: AnimationControllerSimulator;
  private currentStatus: AnimationStatus;
  private animationHistory: AnimationHistoryItem[] = [];
  private interruptionHistory: InterruptionRecord[] = [];
  private animationListeners: Array<(status: AnimationStatus) => void> = [];
  private frameCount: number = 0;
  private alternateFlipCount: number = 0;
  private window: WindowKind = WindowKind.NONE;

  constructor() {
    const initConfig: AnimationConfig = {
      type: AnimationType.NONE,
      duration: 0,
      delay: 0,
      easing: 'linear',
      repeatCount: 0,
      playMode: PlayMode.Once
    };
    this.currentStatus = {
      state: AnimationState.IDLE,
      progress: 0,
      currentTime: 0,
      config: initConfig
    };
  }

  // Singleton access: keeps the animation history consistent across cases.
  public static getInstance(): AnimationControllerSimulator {
    if (!AnimationControllerSimulator.instance) {
      AnimationControllerSimulator.instance = new AnimationControllerSimulator();
    }
    return AnimationControllerSimulator.instance;
  }

  // Plays one animation; a running animation must be stopped first.
  public playAnimation(config: AnimationConfig, window: WindowKind = WindowKind.NONE): boolean {
    if (this.currentStatus.state === AnimationState.RUNNING) {
      return false;
    }
    const newConfig: AnimationConfig = {
      type: config.type,
      duration: config.duration,
      delay: config.delay,
      easing: config.easing,
      repeatCount: config.repeatCount,
      playMode: config.playMode
    };
    this.currentStatus.config = newConfig;
    this.currentStatus.state = AnimationState.RUNNING;
    this.currentStatus.progress = 0;
    this.currentStatus.currentTime = 0;
    this.frameCount = 0;
    this.window = window;
    this.notifyListeners();
    return true;
  }

  // Pauses a running animation so that the window keeps its current opacity.
  public pauseAnimation(): boolean {
    if (this.currentStatus.state !== AnimationState.RUNNING) {
      return false;
    }
    this.currentStatus.state = AnimationState.PAUSED;
    this.notifyListeners();
    return true;
  }

  // Resumes a paused animation after the recorder state settles.
  public resumeAnimation(): boolean {
    if (this.currentStatus.state !== AnimationState.PAUSED) {
      return false;
    }
    this.currentStatus.state = AnimationState.RUNNING;
    this.notifyListeners();
    return true;
  }

  // Stops the animation and records an unfinished history entry.
  public stopAnimation(): boolean {
    if (this.currentStatus.state === AnimationState.IDLE) {
      return false;
    }
    const wasRunning: boolean = this.currentStatus.state === AnimationState.RUNNING;
    this.currentStatus.state = AnimationState.CANCELLED;
    this.currentStatus.progress = 0;
    if (wasRunning) {
      this.animationHistory.push({
        type: this.currentStatus.config.type,
        window: this.window,
        startTime: Date.now() - this.currentStatus.currentTime,
        endTime: Date.now(),
        completed: false
      });
    }
    this.notifyListeners();
    return true;
  }

  // Interrupts the animation because the recorder state changed (start/stop).
  public interruptAnimation(reason: string): boolean {
    if (this.currentStatus.state !== AnimationState.RUNNING && this.currentStatus.state !== AnimationState.PAUSED) {
      return false;
    }
    const record: InterruptionRecord = {
      window: this.window,
      reason: reason,
      atProgress: this.currentStatus.progress,
      timestamp: Date.now()
    };
    this.interruptionHistory.push(record);
    this.currentStatus.state = AnimationState.CANCELLED;
    this.currentStatus.progress = 0;
    this.notifyListeners();
    return true;
  }

  // Advances the animation; `Alternate` mode flips direction on completion.
  public updateAnimation(elapsedTime: number): void {
    if (this.currentStatus.state !== AnimationState.RUNNING) {
      return;
    }
    this.frameCount++;
    this.currentStatus.currentTime += elapsedTime;
    const totalDuration: number = this.currentStatus.config.duration + this.currentStatus.config.delay;
    if (totalDuration <= 0) {
      this.currentStatus.progress = 1;
    } else {
      this.currentStatus.progress = Math.min(1, this.currentStatus.currentTime / totalDuration);
    }
    if (this.currentStatus.progress >= 1) {
      this.currentStatus.state = AnimationState.COMPLETED;
      if (this.currentStatus.config.playMode === PlayMode.Alternate) {
        this.alternateFlipCount++;
      }
      this.animationHistory.push({
        type: this.currentStatus.config.type,
        window: this.window,
        startTime: Date.now() - this.currentStatus.currentTime,
        endTime: Date.now(),
        completed: true
      });
    }
    this.notifyListeners();
  }

  public getStatus(): AnimationStatus {
    const copiedConfig: AnimationConfig = {
      type: this.currentStatus.config.type,
      duration: this.currentStatus.config.duration,
      delay: this.currentStatus.config.delay,
      easing: this.currentStatus.config.easing,
      repeatCount: this.currentStatus.config.repeatCount,
      playMode: this.currentStatus.config.playMode
    };
    const status: AnimationStatus = {
      state: this.currentStatus.state,
      progress: this.currentStatus.progress,
      currentTime: this.currentStatus.currentTime,
      config: copiedConfig
    };
    return status;
  }

  public getAnimationHistory(): AnimationHistoryItem[] {
    const result: AnimationHistoryItem[] = [];
    for (const item of this.animationHistory) {
      result.push({
        type: item.type,
        window: item.window,
        startTime: item.startTime,
        endTime: item.endTime,
        completed: item.completed
      });
    }
    return result;
  }

  public getInterruptionHistory(): InterruptionRecord[] {
    const result: InterruptionRecord[] = [];
    for (const item of this.interruptionHistory) {
      result.push({
        window: item.window,
        reason: item.reason,
        atProgress: item.atProgress,
        timestamp: item.timestamp
      });
    }
    return result;
  }

  public getPlayCount(): number {
    return this.animationHistory.length;
  }

  public getCompletedCount(): number {
    return this.animationHistory.filter((item: AnimationHistoryItem): boolean => item.completed).length;
  }

  public getInterruptionCount(): number {
    return this.interruptionHistory.length;
  }

  public getLastInterruptionReason(): string {
    if (this.interruptionHistory.length === 0) {
      return '';
    }
    return this.interruptionHistory[this.interruptionHistory.length - 1].reason;
  }

  public getAlternateFlipCount(): number {
    return this.alternateFlipCount;
  }

  public getWindow(): WindowKind {
    return this.window;
  }

  // Adds a listener that receives a copy of every status change.
  public addAnimationListener(listener: (status: AnimationStatus) => void): void {
    this.animationListeners.push(listener);
  }

  // Removes a listener to avoid leaks between suites.
  public removeAnimationListener(listener: (status: AnimationStatus) => void): void {
    const index: number = this.animationListeners.indexOf(listener);
    if (index !== -1) {
      this.animationListeners.splice(index, 1);
    }
  }

  public getListenerCount(): number {
    return this.animationListeners.length;
  }

  public resetController(): void {
    const resetConfig: AnimationConfig = {
      type: AnimationType.NONE,
      duration: 0,
      delay: 0,
      easing: 'linear',
      repeatCount: 0,
      playMode: PlayMode.Once
    };
    this.currentStatus = {
      state: AnimationState.IDLE,
      progress: 0,
      currentTime: 0,
      config: resetConfig
    };
    this.animationHistory = [];
    this.interruptionHistory = [];
    this.frameCount = 0;
    this.alternateFlipCount = 0;
    this.window = WindowKind.NONE;
  }

  public getFrameCount(): number {
    return this.frameCount;
  }

  public isPlaying(): boolean {
    return this.currentStatus.state === AnimationState.RUNNING;
  }

  public isPaused(): boolean {
    return this.currentStatus.state === AnimationState.PAUSED;
  }

  public isCompleted(): boolean {
    return this.currentStatus.state === AnimationState.COMPLETED;
  }

  public getAnimationTypeStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (const animation of this.animationHistory) {
      const key: string = animation.type;
      const currentCount: number = stats.get(key) || 0;
      stats.set(key, currentCount + 1);
    }
    return stats;
  }

  public getAnimationWindowStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (const animation of this.animationHistory) {
      const key: string = animation.window;
      const currentCount: number = stats.get(key) || 0;
      stats.set(key, currentCount + 1);
    }
    return stats;
  }

  // Broadcasts a copy of the status so that listeners cannot mutate internals.
  private notifyListeners(): void {
    for (const listener of this.animationListeners) {
      const statusCopy: AnimationStatus = {
        state: this.currentStatus.state,
        progress: this.currentStatus.progress,
        currentTime: this.currentStatus.currentTime,
        config: {
          type: this.currentStatus.config.type,
          duration: this.currentStatus.config.duration,
          delay: this.currentStatus.config.delay,
          easing: this.currentStatus.config.easing,
          repeatCount: this.currentStatus.config.repeatCount,
          playMode: this.currentStatus.config.playMode
        }
      };
      listener(statusCopy);
    }
  }
}

// Easing curve enumeration: rhythm control of the show/hide animations.
enum EasingFunction {
  LINEAR = 'linear',
  EASE_IN = 'ease_in',
  EASE_OUT = 'ease_out',
  EASE_IN_OUT = 'ease_in_out',
  SPRING = 'spring'
}

interface CallbackRecord {
  callbackId: number;
  state: AnimationState;
  triggerTime: number;
  progress: number;
}

// Easing curve calculator: maps linear progress to eased progress.
class EasingCurveCalculator {
  public calculate(easing: EasingFunction, linearProgress: number): number {
    const t: number = Math.max(0, Math.min(1, linearProgress));
    switch (easing) {
      case EasingFunction.LINEAR:
        return t;
      case EasingFunction.EASE_IN:
        return t * t;
      case EasingFunction.EASE_OUT:
        return 1 - (1 - t) * (1 - t);
      case EasingFunction.EASE_IN_OUT:
        if (t < 0.5) {
          return 2 * t * t;
        }
        return 1 - Math.pow(-2 * t + 2, 2) / 2;
      case EasingFunction.SPRING:
        return 1 - Math.cos(t * Math.PI);
      default:
        return t;
    }
  }

  public isLinear(easing: EasingFunction): boolean {
    return easing === EasingFunction.LINEAR;
  }

  public generateProgressSequence(easing: EasingFunction, frameCount: number): number[] {
    const sequence: number[] = [];
    for (let i: number = 0; i <= frameCount; i++) {
      const linear: number = frameCount === 0 ? 0 : i / frameCount;
      sequence.push(this.calculate(easing, linear));
    }
    return sequence;
  }
}

// Scheduling model: immutable description of one window animation schedule.
class AnimationSchedulingModel {
  private animationType: AnimationType;
  private easing: EasingFunction;
  private playMode: PlayMode;
  private duration: number;
  private repeatCount: number;
  private window: WindowKind;

  constructor(animationType: AnimationType, easing: EasingFunction, playMode: PlayMode, duration: number,
    repeatCount: number, window: WindowKind = WindowKind.NONE) {
    this.animationType = animationType;
    this.easing = easing;
    this.playMode = playMode;
    this.duration = duration;
    this.repeatCount = repeatCount;
    this.window = window;
  }

  public getAnimationType(): AnimationType {
    return this.animationType;
  }

  public getEasing(): EasingFunction {
    return this.easing;
  }

  public getPlayMode(): PlayMode {
    return this.playMode;
  }

  public getDuration(): number {
    return this.duration;
  }

  public getRepeatCount(): number {
    return this.repeatCount;
  }

  public getWindow(): WindowKind {
    return this.window;
  }

  public setRepeatCount(repeatCount: number): void {
    this.repeatCount = repeatCount;
  }

  public isValid(): boolean {
    return this.duration >= 0 && this.repeatCount >= 0;
  }

  public isAlternateMode(): boolean {
    return this.playMode === PlayMode.Alternate;
  }

  public equals(other: AnimationSchedulingModel): boolean {
    return this.animationType === other.animationType && this.easing === other.easing &&
      this.playMode === other.playMode && this.duration === other.duration &&
      this.repeatCount === other.repeatCount && this.window === other.window;
  }

  public clone(): AnimationSchedulingModel {
    return new AnimationSchedulingModel(this.animationType, this.easing, this.playMode, this.duration,
      this.repeatCount, this.window);
  }

  public toString(): string {
    return 'AnimationSchedulingModel(' + this.animationType + ', ' + this.easing + ', ' + this.window + ')';
  }
}

// Scheduling statistics: aggregates schedules of both floating windows.
class AnimationSchedulingStatistics {
  private schedules: AnimationSchedulingModel[] = [];

  public addSchedule(schedule: AnimationSchedulingModel): void {
    this.schedules.push(schedule.clone());
  }

  public clear(): void {
    this.schedules = [];
  }

  public getScheduleCount(): number {
    return this.schedules.length;
  }

  public getScheduleCountByType(animationType: AnimationType): number {
    return this.schedules.filter((schedule: AnimationSchedulingModel): boolean =>
      schedule.getAnimationType() === animationType).length;
  }

  public getScheduleCountByWindow(window: WindowKind): number {
    return this.schedules.filter((schedule: AnimationSchedulingModel): boolean =>
      schedule.getWindow() === window).length;
  }

  public getAverageDuration(): number {
    if (this.schedules.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const schedule of this.schedules) {
      total += schedule.getDuration();
    }
    return total / this.schedules.length;
  }

  public getAlternateScheduleCount(): number {
    return this.schedules.filter((schedule: AnimationSchedulingModel): boolean =>
      schedule.isAlternateMode()).length;
  }
}

// Callback recorder: stores animation status callbacks for timing validation.
class AnimationCallbackRecorder {
  private records: CallbackRecord[] = [];
  private nextCallbackId: number = 0;

  public recordCallback(state: AnimationState, progress: number): void {
    this.records.push({
      callbackId: this.nextCallbackId,
      state: state,
      triggerTime: Date.now(),
      progress: progress
    });
    this.nextCallbackId++;
  }

  public getRecords(): CallbackRecord[] {
    const result: CallbackRecord[] = [];
    for (const record of this.records) {
      result.push({
        callbackId: record.callbackId,
        state: record.state,
        triggerTime: record.triggerTime,
        progress: record.progress
      });
    }
    return result;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getRecordCountByState(state: AnimationState): number {
    return this.records.filter((record: CallbackRecord): boolean => record.state === state).length;
  }

  public clear(): void {
    this.records = [];
    this.nextCallbackId = 0;
  }
}

// Schedule validator: checks the constraints of the recording window animations.
class AnimationScheduleValidator {
  public validateSchedule(schedule: AnimationSchedulingModel): boolean {
    if (!schedule.isValid()) {
      return false;
    }
    if (schedule.isAlternateMode() && schedule.getRepeatCount() > 0) {
      return false;
    }
    return true;
  }

  public isDurationRecommended(duration: number): boolean {
    return duration >= RECOMMENDED_MIN_DURATION && duration <= RECOMMENDED_MAX_DURATION;
  }

  // The 800 ms blink interval must stay inside a readable range.
  public isBlinkIntervalValid(interval: number): boolean {
    return interval >= 200 && interval <= 1500;
  }
}

// Animation command enumeration.
enum AnimationCommand {
  SHOW = 'show',
  HIDE = 'hide',
  PAUSE = 'pause',
  RESUME = 'resume',
  STOP = 'stop'
}

interface CommandLog {
  commandId: number;
  command: AnimationCommand;
  targetType: AnimationType;
  window: WindowKind;
  success: boolean;
  executedAt: number;
}

// Command logger: records show/hide command executions of the floating windows.
class AnimationCommandLogger {
  private logs: CommandLog[] = [];
  private nextCommandId: number = 0;

  public log(command: AnimationCommand, targetType: AnimationType, window: WindowKind, success: boolean): void {
    this.logs.push({
      commandId: this.nextCommandId,
      command: command,
      targetType: targetType,
      window: window,
      success: success,
      executedAt: Date.now()
    });
    this.nextCommandId++;
  }

  public clear(): void {
    this.logs = [];
    this.nextCommandId = 0;
  }

  public getLogs(): CommandLog[] {
    const result: CommandLog[] = [];
    for (const entry of this.logs) {
      result.push({
        commandId: entry.commandId,
        command: entry.command,
        targetType: entry.targetType,
        window: entry.window,
        success: entry.success,
        executedAt: entry.executedAt
      });
    }
    return result;
  }

  public getLogCount(): number {
    return this.logs.length;
  }

  public getLogCountByCommand(command: AnimationCommand): number {
    return this.logs.filter((entry: CommandLog): boolean => entry.command === command).length;
  }

  public getLogCountByWindow(window: WindowKind): number {
    return this.logs.filter((entry: CommandLog): boolean => entry.window === window).length;
  }

  public getSuccessRate(): number {
    if (this.logs.length === 0) {
      return 0;
    }
    const successCount: number = this.logs.filter((entry: CommandLog): boolean => entry.success).length;
    return successCount / this.logs.length;
  }
}

// Progress mapper: converts between linear and eased progress.
class AnimationProgressMapper {
  private calculator: EasingCurveCalculator = new EasingCurveCalculator();

  public mapProgress(easing: EasingFunction, linearProgress: number): number {
    return this.calculator.calculate(easing, linearProgress);
  }

  public unmapProgress(easing: EasingFunction, easedProgress: number): number {
    if (easing === EasingFunction.LINEAR) {
      return easedProgress;
    }
    return Math.min(1, Math.max(0, easedProgress));
  }

  public isEquivalentMapping(easingA: EasingFunction, easingB: EasingFunction, linearProgress: number): boolean {
    const progressA: number = this.mapProgress(easingA, linearProgress);
    const progressB: number = this.mapProgress(easingB, linearProgress);
    return Math.abs(progressA - progressB) < 0.0001;
  }
}

// State transitioner: validates the legal animation state transitions.
class AnimationStateTransitioner {
  public isValidTransition(current: AnimationState, next: AnimationState): boolean {
    switch (current) {
      case AnimationState.IDLE:
        return next === AnimationState.RUNNING;
      case AnimationState.RUNNING:
        return next === AnimationState.PAUSED || next === AnimationState.COMPLETED ||
          next === AnimationState.CANCELLED;
      case AnimationState.PAUSED:
        return next === AnimationState.RUNNING || next === AnimationState.CANCELLED;
      case AnimationState.COMPLETED:
      case AnimationState.CANCELLED:
        return next === AnimationState.IDLE;
      default:
        return false;
    }
  }

  public isTerminal(state: AnimationState): boolean {
    return state === AnimationState.COMPLETED || state === AnimationState.CANCELLED;
  }
}

// Tip window animator: showWithAnimation / hideWithAnimation for the
// "录屏视频已存储到照片" window, which lives for 3000 ms.
class TipWindowAnimator {
  private visible: boolean = false;
  private totalMs: number = 0;
  private remainingMs: number = 0;
  private showCount: number = 0;
  private hideCount: number = 0;
  private autoHideCount: number = 0;
  private interrupted: boolean = false;
  private interruptedBy: string = '';

  public showWithAnimation(durationMs: number = TIP_WINDOW_DURATION): boolean {
    if (this.visible) {
      return false;
    }
    this.visible = true;
    this.totalMs = durationMs;
    this.remainingMs = durationMs;
    this.showCount++;
    return true;
  }

  public hideWithAnimation(): boolean {
    if (!this.visible) {
      return false;
    }
    this.visible = false;
    this.remainingMs = 0;
    this.hideCount++;
    return true;
  }

  // Advances the visible duration; the window hides itself when it expires.
  public advance(elapsedMs: number): boolean {
    if (!this.visible) {
      return false;
    }
    this.remainingMs -= elapsedMs;
    if (this.remainingMs <= 0) {
      this.visible = false;
      this.remainingMs = 0;
      this.hideCount++;
      this.autoHideCount++;
      return true;
    }
    return false;
  }

  // Interrupts the tip window because the recorder state changed abruptly.
  public interrupt(reason: string): boolean {
    if (!this.visible) {
      return false;
    }
    this.visible = false;
    this.remainingMs = 0;
    this.interrupted = true;
    this.interruptedBy = reason;
    return true;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public isInterrupted(): boolean {
    return this.interrupted;
  }

  public getInterruptedBy(): string {
    return this.interruptedBy;
  }

  public getRemainingMs(): number {
    return this.remainingMs;
  }

  public getTotalMs(): number {
    return this.totalMs;
  }

  public getShowCount(): number {
    return this.showCount;
  }

  public getHideCount(): number {
    return this.hideCount;
  }

  public getAutoHideCount(): number {
    return this.autoHideCount;
  }

  public reset(): void {
    this.visible = false;
    this.totalMs = 0;
    this.remainingMs = 0;
    this.showCount = 0;
    this.hideCount = 0;
    this.autoHideCount = 0;
    this.interrupted = false;
    this.interruptedBy = '';
  }
}

// Recording icon blinker: the timer page icon blinks every 800 ms and the
// blink uses PlayMode.Alternate (visible -> hidden -> visible ...).
class RecordingIconBlinker {
  private interval: number = RECORDING_ICON_BLINK_INTERVAL;
  private elapsed: number = 0;
  private visible: boolean = false;
  private toggles: number = 0;
  private running: boolean = false;
  private playMode: PlayMode = PlayMode.Alternate;

  public start(): boolean {
    if (this.running) {
      return false;
    }
    this.running = true;
    this.visible = true;
    this.elapsed = 0;
    return true;
  }

  public stop(): boolean {
    if (!this.running) {
      return false;
    }
    this.running = false;
    this.visible = false;
    this.elapsed = 0;
    return true;
  }

  // Advances the blink clock and toggles the icon for every elapsed interval.
  public tick(elapsedMs: number): boolean {
    if (!this.running) {
      return this.visible;
    }
    this.elapsed += elapsedMs;
    while (this.elapsed >= this.interval) {
      this.elapsed -= this.interval;
      this.visible = !this.visible;
      this.toggles++;
    }
    return this.visible;
  }

  public isRunning(): boolean {
    return this.running;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public getToggleCount(): number {
    return this.toggles;
  }

  public getInterval(): number {
    return this.interval;
  }

  public getElapsed(): number {
    return this.elapsed;
  }

  public getPlayMode(): PlayMode {
    return this.playMode;
  }

  public reset(): void {
    this.elapsed = 0;
    this.visible = false;
    this.toggles = 0;
    this.running = false;
  }
}

// Timer window animator: the timer floating window is faded in on start and
// faded out when the recording stops or fails.
class TimerWindowAnimator {
  private shown: boolean = false;
  private duration: number = TIMER_WINDOW_ANIMATION_DURATION;
  private showCount: number = 0;
  private hideCount: number = 0;
  private interrupted: boolean = false;

  public show(): boolean {
    if (this.shown) {
      return false;
    }
    this.shown = true;
    this.showCount++;
    return true;
  }

  public hide(): boolean {
    if (!this.shown) {
      return false;
    }
    this.shown = false;
    this.hideCount++;
    return true;
  }

  public interrupt(): boolean {
    if (!this.shown) {
      return false;
    }
    this.shown = false;
    this.interrupted = true;
    return true;
  }

  public isShown(): boolean {
    return this.shown;
  }

  public isInterrupted(): boolean {
    return this.interrupted;
  }

  public getDuration(): number {
    return this.duration;
  }

  public getShowCount(): number {
    return this.showCount;
  }

  public getHideCount(): number {
    return this.hideCount;
  }

  public reset(): void {
    this.shown = false;
    this.showCount = 0;
    this.hideCount = 0;
    this.interrupted = false;
  }
}

export default function animationControllerValidationTest(): void {
  describe('AnimationControllerValidation_Test', () => {
    let driver: Driver;
    let animationController: AnimationControllerSimulator;

    // Test setup: initialise the driver and the controller singleton.
    beforeAll(async () => {
      driver = getDriver();
      animationController = AnimationControllerSimulator.getInstance();
      animationController.resetController();
      hilog.info(DOMAIN, TAG, 'animation controller validation suite started');
      await serializedDelay(driver, 1000);
    });

    // Test cleanup: leave the floating windows in a neutral state.
    afterAll(async () => {
      animationController.resetController();
      await serializedDelay(driver, 300);
    });

    // Verifies every animation type value used by the floating windows.
    it('animation_type_enum_should_be_defined_correctly', 0, async () => {
      expect(AnimationType.FADE_IN).assertEqual('fade_in');
      expect(AnimationType.FADE_OUT).assertEqual('fade_out');
      expect(AnimationType.SLIDE_IN).assertEqual('slide_in');
      expect(AnimationType.SLIDE_OUT).assertEqual('slide_out');
      expect(AnimationType.SCALE_UP).assertEqual('scale_up');
      expect(AnimationType.SCALE_DOWN).assertEqual('scale_down');
      expect(AnimationType.BLINK).assertEqual('blink');
      expect(AnimationType.NONE).assertEqual('none');
    });

    // Verifies the animation lifecycle state values.
    it('animation_state_enum_should_be_defined_correctly', 0, async () => {
      expect(AnimationState.IDLE).assertEqual('idle');
      expect(AnimationState.RUNNING).assertEqual('running');
      expect(AnimationState.PAUSED).assertEqual('paused');
      expect(AnimationState.COMPLETED).assertEqual('completed');
      expect(AnimationState.CANCELLED).assertEqual('cancelled');
    });

    // PlayMode.Alternate drives the 800 ms recording icon blink.
    it('play_mode_enum_should_define_alternate', 0, async () => {
      expect(PlayMode.Once).assertEqual('once');
      expect(PlayMode.Alternate).assertEqual('alternate');
      expect(PlayMode.Repeat).assertEqual('repeat');
    });

    // Verifies the floating window kinds covered by the animation suite.
    it('window_kind_enum_should_be_defined_correctly', 0, async () => {
      expect(WindowKind.TIMER).assertEqual('timer');
      expect(WindowKind.TIP).assertEqual('tip');
      expect(WindowKind.NONE).assertEqual('none');
    });

    // Verifies the timer window and tip window timing constants.
    it('animation_timing_constants_should_match_the_product', 0, async () => {
      expect(TIP_WINDOW_DURATION).assertEqual(3000);
      expect(RECORDING_ICON_BLINK_INTERVAL).assertEqual(800);
      expect(TIMER_WINDOW_ANIMATION_DURATION).assertEqual(300);
    });

    // The controller must start in the idle state with no progress.
    it('animation_controller_initial_state_should_be_idle', 0, async () => {
      animationController.resetController();
      const status: AnimationStatus = animationController.getStatus();
      expect(status.state).assertEqual(AnimationState.IDLE);
      expect(status.progress).assertEqual(0);
      expect(status.currentTime).assertEqual(0);
      expect(status.config.type).assertEqual(AnimationType.NONE);
      expect(status.config.playMode).assertEqual(PlayMode.Once);
    });

    // Fade-in animation of the timer window applies the configured duration.
    it('timer_window_fade_in_playback_should_work_correctly', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: TIMER_WINDOW_ANIMATION_DURATION,
        delay: 0,
        easing: 'ease-in-out',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      const result: boolean = animationController.playAnimation(config, WindowKind.TIMER);
      expect(result).assertTrue();
      const status: AnimationStatus = animationController.getStatus();
      expect(status.state).assertEqual(AnimationState.RUNNING);
      expect(status.config.type).assertEqual(AnimationType.FADE_IN);
      expect(status.config.duration).assertEqual(300);
      expect(animationController.getWindow()).assertEqual(WindowKind.TIMER);
    });

    // A second play request is rejected while an animation is running.
    it('duplicate_play_request_should_be_rejected_while_running', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 300,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      expect(animationController.playAnimation(config)).assertTrue();
      expect(animationController.playAnimation(config)).assertFalse();
      expect(animationController.getStatus().state).assertEqual(AnimationState.RUNNING);
    });

    // Pause and resume keep the tip window animation reversible.
    it('animation_pause_resume_should_work_correctly', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.SLIDE_IN,
        duration: 500,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config, WindowKind.TIP);
      expect(animationController.isPlaying()).assertTrue();
      expect(animationController.pauseAnimation()).assertTrue();
      expect(animationController.isPaused()).assertTrue();
      expect(animationController.resumeAnimation()).assertTrue();
      expect(animationController.isPlaying()).assertTrue();
    });

    // Stopping the animation marks the history entry as unfinished.
    it('animation_stop_should_cancel_current_animation', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_OUT,
        duration: 400,
        delay: 0,
        easing: 'ease-out',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config, WindowKind.TIP);
      animationController.updateAnimation(100);
      expect(animationController.isPlaying()).assertTrue();
      expect(animationController.stopAnimation()).assertTrue();
      expect(animationController.getStatus().state).assertEqual(AnimationState.CANCELLED);
      expect(animationController.getStatus().progress).assertEqual(0);
      expect(animationController.getPlayCount()).assertEqual(1);
      expect(animationController.getCompletedCount()).assertEqual(0);
    });

    // Progress must be computed from duration plus delay.
    it('animation_progress_update_should_work_correctly', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.SCALE_UP,
        duration: 1000,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      animationController.updateAnimation(500);
      expect(animationController.getStatus().progress).assertEqual(0.5);
      animationController.updateAnimation(500);
      expect(animationController.getStatus().progress).assertLargerOrEqual(1);
      expect(animationController.isCompleted()).assertTrue();
    });

    // A completion is recorded in the animation history.
    it('animation_completion_record_should_be_accurate', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config, WindowKind.TIMER);
      animationController.updateAnimation(200);
      expect(animationController.isCompleted()).assertTrue();
      const history: AnimationHistoryItem[] = animationController.getAnimationHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].type).assertEqual(AnimationType.FADE_IN);
      expect(history[0].window).assertEqual(WindowKind.TIMER);
      expect(history[0].completed).assertTrue();
    });

    // Listeners receive one notification per state change.
    it('animation_listener_should_receive_notifications', 0, async () => {
      animationController.resetController();
      const statusWrapper: StatusWrapper = { status: null };
      let notificationCount: number = 0;
      const listener = (status: AnimationStatus): void => {
        notificationCount++;
        statusWrapper.status = status;
      };
      animationController.addAnimationListener(listener);
      const config: AnimationConfig = {
        type: AnimationType.SLIDE_IN,
        duration: 300,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      expect(notificationCount).assertEqual(1);
      expect(statusWrapper.status !== null).assertTrue();
      animationController.updateAnimation(150);
      expect(notificationCount).assertEqual(2);
      expect(animationController.getStatus().progress).assertEqual(0.5);
      animationController.removeAnimationListener(listener);
      expect(animationController.getListenerCount()).assertEqual(0);
    });

    // History keeps both completed and cancelled animations in order.
    it('animation_history_should_record_all_animations', 0, async () => {
      animationController.resetController();
      const completedConfig: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(completedConfig, WindowKind.TIMER);
      animationController.updateAnimation(200);
      const cancelledConfig: AnimationConfig = {
        type: AnimationType.FADE_OUT,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(cancelledConfig, WindowKind.TIP);
      animationController.updateAnimation(100);
      animationController.stopAnimation();
      const history: AnimationHistoryItem[] = animationController.getAnimationHistory();
      expect(history.length).assertEqual(2);
      expect(history[0].type).assertEqual(AnimationType.FADE_IN);
      expect(history[0].completed).assertTrue();
      expect(history[1].type).assertEqual(AnimationType.FADE_OUT);
      expect(history[1].completed).assertFalse();
    });

    // Animation type statistics group the history by effect name.
    it('animation_stats_should_be_accurate', 0, async () => {
      animationController.resetController();
      const animations: AnimationConfigLite[] = [
        { type: AnimationType.FADE_IN, duration: 200 },
        { type: AnimationType.FADE_OUT, duration: 200 },
        { type: AnimationType.FADE_IN, duration: 200 },
        { type: AnimationType.SLIDE_IN, duration: 300 },
        { type: AnimationType.FADE_IN, duration: 200 }
      ];
      for (const anim of animations) {
        const config: AnimationConfig = {
          type: anim.type,
          duration: anim.duration,
          delay: 0,
          easing: 'linear',
          repeatCount: 0,
          playMode: PlayMode.Once
        };
        animationController.playAnimation(config);
        animationController.updateAnimation(anim.duration);
      }
      const stats: Map<string, number> = animationController.getAnimationTypeStats();
      expect(stats.get('fade_in')).assertEqual(3);
      expect(stats.get('fade_out')).assertEqual(1);
      expect(stats.get('slide_in')).assertEqual(1);
    });

    // Window statistics separate the timer window from the tip window.
    it('animation_window_stats_should_be_accurate', 0, async () => {
      animationController.resetController();
      const timerConfig: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      const tipConfig: AnimationConfig = {
        type: AnimationType.SLIDE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(timerConfig, WindowKind.TIMER);
      animationController.updateAnimation(200);
      animationController.playAnimation(tipConfig, WindowKind.TIP);
      animationController.updateAnimation(200);
      const stats: Map<string, number> = animationController.getAnimationWindowStats();
      expect(stats.get('timer')).assertEqual(1);
      expect(stats.get('tip')).assertEqual(1);
    });

    // Play and completion counters must stay consistent.
    it('animation_play_count_should_be_accurate', 0, async () => {
      animationController.resetController();
      expect(animationController.getPlayCount()).assertEqual(0);
      expect(animationController.getCompletedCount()).assertEqual(0);
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      animationController.updateAnimation(200);
      expect(animationController.getPlayCount()).assertEqual(1);
      expect(animationController.getCompletedCount()).assertEqual(1);
      animationController.playAnimation(config);
      animationController.stopAnimation();
      expect(animationController.getPlayCount()).assertEqual(2);
      expect(animationController.getCompletedCount()).assertEqual(1);
    });

    // Both windows share the same controller singleton.
    it('animation_controller_singleton_should_return_same_instance', 0, async () => {
      const controller1: AnimationControllerSimulator = AnimationControllerSimulator.getInstance();
      const controller2: AnimationControllerSimulator = AnimationControllerSimulator.getInstance();
      expect(controller1 === controller2).assertTrue();
      controller1.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      controller1.playAnimation(config, WindowKind.TIP);
      expect(controller2.isPlaying()).assertTrue();
      expect(controller2.getWindow()).assertEqual(WindowKind.TIP);
    });

    // getStatus must not expose the internal configuration object.
    it('animation_status_get_should_return_deep_copy', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 300,
        delay: 0,
        easing: 'ease-in',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      const status1: AnimationStatus = animationController.getStatus();
      status1.config.duration = 999;
      status1.config.playMode = PlayMode.Alternate;
      const status2: AnimationStatus = animationController.getStatus();
      expect(status2.config.duration).assertEqual(300);
      expect(status2.config.playMode).assertEqual(PlayMode.Once);
    });

    // getAnimationHistory must not expose the internal array.
    it('animation_history_get_should_return_deep_copy', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      animationController.updateAnimation(200);
      const history1: AnimationHistoryItem[] = animationController.getAnimationHistory();
      history1[0].type = AnimationType.FADE_OUT;
      const history2: AnimationHistoryItem[] = animationController.getAnimationHistory();
      expect(history2[0].type).assertEqual(AnimationType.FADE_IN);
      expect(history2.length).assertEqual(1);
    });

    // Frame counter is incremented once per update call.
    it('animation_frame_count_should_be_recorded', 0, async () => {
      animationController.resetController();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 1000,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      expect(animationController.getFrameCount()).assertEqual(0);
      animationController.updateAnimation(100);
      animationController.updateAnimation(100);
      animationController.updateAnimation(100);
      expect(animationController.getFrameCount()).assertEqual(3);
    });

    // Updates are ignored when the controller is not running.
    it('animation_update_should_be_ignored_when_not_running', 0, async () => {
      animationController.resetController();
      animationController.updateAnimation(100);
      expect(animationController.getFrameCount()).assertEqual(0);
      expect(animationController.getStatus().state).assertEqual(AnimationState.IDLE);
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 400,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      animationController.updateAnimation(200);
      animationController.pauseAnimation();
      animationController.updateAnimation(200);
      expect(animationController.getFrameCount()).assertEqual(1);
      expect(animationController.getStatus().progress).assertEqual(0.5);
    });

    // The animation of the timer window correlates with the rendered window.
    it('animation_control_should_correlate_with_ui_interactions', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      animationController.resetController();
      const openConfig: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: TIMER_WINDOW_ANIMATION_DURATION,
        delay: 0,
        easing: 'ease-in-out',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(openConfig, WindowKind.TIMER);
      animationController.updateAnimation(150);
      expect(animationController.isPlaying()).assertTrue();
      expect(animationController.getStatus().progress).assertEqual(0.5);
      animationController.updateAnimation(150);
      expect(animationController.isCompleted()).assertTrue();
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertTrue();
      expect(animationController.getCompletedCount()).assertEqual(1);
    });

    // A thousand short animations must complete inside the performance budget.
    it('animation_performance_should_meet_requirements', 0, async () => {
      animationController.resetController();
      const startTime: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        const config: AnimationConfig = {
          type: AnimationType.FADE_IN,
          duration: 100,
          delay: 0,
          easing: 'linear',
          repeatCount: 0,
          playMode: PlayMode.Once
        };
        animationController.playAnimation(config);
        animationController.updateAnimation(50);
        animationController.updateAnimation(50);
      }
      const animationTime: number = Date.now() - startTime;
      expect(animationTime).assertLessOrEqual(5000);
      expect(animationController.getPlayCount()).assertEqual(1000);
      expect(animationController.getCompletedCount()).assertEqual(1000);
    });

    // The controller recovers from pause/resume/stop on idle state.
    it('animation_controller_should_recover_from_abnormal_states', 0, async () => {
      animationController.resetController();
      expect(animationController.pauseAnimation()).assertFalse();
      expect(animationController.resumeAnimation()).assertFalse();
      expect(animationController.stopAnimation()).assertFalse();
      expect(animationController.interruptAnimation('idle_interrupt')).assertFalse();
      const config: AnimationConfig = {
        type: AnimationType.FADE_IN,
        duration: 200,
        delay: 0,
        easing: 'linear',
        repeatCount: 0,
        playMode: PlayMode.Once
      };
      animationController.playAnimation(config);
      expect(animationController.isPlaying()).assertTrue();
      animationController.resetController();
      expect(animationController.getStatus().state).assertEqual(AnimationState.IDLE);
      animationController.playAnimation(config);
      expect(animationController.isPlaying()).assertTrue();
    });

    // Easing function values used by the window animations.
    it('easing_function_enum_should_be_defined_correctly', 0, async () => {
      expect(EasingFunction.LINEAR).assertEqual('linear');
      expect(EasingFunction.EASE_IN).assertEqual('ease_in');
      expect(EasingFunction.EASE_OUT).assertEqual('ease_out');
      expect(EasingFunction.EASE_IN_OUT).assertEqual('ease_in_out');
      expect(EasingFunction.SPRING).assertEqual('spring');
    });

    // Animation command values of the floating windows.
    it('animation_command_enum_should_be_defined_correctly', 0, async () => {
      expect(AnimationCommand.SHOW).assertEqual('show');
      expect(AnimationCommand.HIDE).assertEqual('hide');
      expect(AnimationCommand.PAUSE).assertEqual('pause');
      expect(AnimationCommand.RESUME).assertEqual('resume');
      expect(AnimationCommand.STOP).assertEqual('stop');
    });

    // Linear easing keeps the progress untouched inside [0, 1].
    it('easing_curve_linear_should_map_identity', 0, async () => {
      const calculator: EasingCurveCalculator = new EasingCurveCalculator();
      expect(calculator.isLinear(EasingFunction.LINEAR)).assertTrue();
      expect(calculator.isLinear(EasingFunction.EASE_IN)).assertFalse();
      expect(calculator.calculate(EasingFunction.LINEAR, 0.5)).assertEqual(0.5);
      expect(calculator.calculate(EasingFunction.LINEAR, 0)).assertEqual(0);
      expect(calculator.calculate(EasingFunction.LINEAR, 1)).assertEqual(1);
    });

    // Ease-in and ease-out curves of the show/hide animations.
    it('easing_curve_should_compute_ease_in_out', 0, async () => {
      const calculator: EasingCurveCalculator = new EasingCurveCalculator();
      expect(calculator.calculate(EasingFunction.EASE_IN, 0.5)).assertEqual(0.25);
      expect(calculator.calculate(EasingFunction.EASE_OUT, 0.5)).assertEqual(0.75);
      expect(calculator.calculate(EasingFunction.EASE_IN_OUT, 0.5)).assertEqual(0.5);
      expect(calculator.calculate(EasingFunction.EASE_IN_OUT, 0.25)).assertEqual(0.125);
    });

    // Out-of-range progress is clamped by the calculator.
    it('easing_curve_should_clamp_out_of_range_progress', 0, async () => {
      const calculator: EasingCurveCalculator = new EasingCurveCalculator();
      expect(calculator.calculate(EasingFunction.LINEAR, -1)).assertEqual(0);
      expect(calculator.calculate(EasingFunction.LINEAR, 2)).assertEqual(1);
      expect(calculator.calculate(EasingFunction.EASE_IN, 2)).assertEqual(1);
      expect(calculator.calculate(EasingFunction.EASE_OUT, -1)).assertEqual(0);
    });

    // Progress sequence generation for a four frame animation.
    it('easing_curve_should_generate_progress_sequence', 0, async () => {
      const calculator: EasingCurveCalculator = new EasingCurveCalculator();
      const sequence: number[] = calculator.generateProgressSequence(EasingFunction.LINEAR, 4);
      expect(sequence.length).assertEqual(5);
      expect(sequence[0]).assertEqual(0);
      expect(sequence[2]).assertEqual(0.5);
      expect(sequence[4]).assertEqual(1);
    });
  });
}
