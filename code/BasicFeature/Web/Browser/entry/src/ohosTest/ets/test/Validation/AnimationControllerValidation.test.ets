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

import { describe, it, expect, beforeAll, afterAll, beforeEach } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import TestLogger from '../Shared/TestLogger';
import {
  getDriver, startBrowserApp, serializedDelay, componentByIdExists,
  waitForId, countById, TIMEOUT_TAB_SWITCH, TIMEOUT_COMPONENT, TIMEOUT_APP_LAUNCH,
  DELAY_TAB_OPERATION, DELAY_TOUCH_EVENT, ID_INPUT_URL, ID_NAV_BACK,
  ID_NAV_REFRESH, ID_ACTION_ADD, progressVisibleAfter, progressResetAfterComplete
} from '../Shared/BrowserTestKit';
import { MockClock } from '../Shared/BrowserMock';

const MAX_DELTA_MS: number = 100;

const TAG: string = 'BrowserAnimationControllerValidationTest';

/* ------------------------------------------------------------------ */
/* Animation constants shared by the tab strip and the title bar.      */
/* ------------------------------------------------------------------ */

const TAB_SWITCH_DURATION_MS: number = 240;
const PROGRESS_DURATION_MS: number = 180;
const PRESS_FEEDBACK_DURATION_MS: number = 120;
const DEFAULT_DELAY_MS: number = 0;
const MAX_ANIMATION_COUNT: number = 6;
const SIXTY_HZ: number = 60;
const NINETY_HZ: number = 90;
const ONE_TWENTY_HZ: number = 120;
const FRAME_BUDGET_60HZ: number = 16.67;
const FRAME_BUDGET_90HZ: number = 11.11;
const FRAME_BUDGET_120HZ: number = 8.33;
const TOLERANCE_FRAME_BUDGET: number = 0.05;
const TOLERANCE_INTERPOLATION: number = 0.0001;
const TOLERANCE_OVERSHOOT: number = 1.0;
const TAB_INDEX_MAX: number = 9;
const PROGRESS_MIN: number = 0;
const PROGRESS_MAX: number = 100;

/* ------------------------------------------------------------------ */
/* Animation state machine vocabulary.                                */
/* ------------------------------------------------------------------ */

enum AnimationState {
  IDLE = 0,
  RUNNING = 1,
  PAUSED = 2,
  FINISHED = 3,
  CANCELLED = 4
}

enum AnimationCurve {
  LINEAR = 0,
  EASE_IN = 1,
  EASE_OUT = 2,
  EASE_IN_OUT = 3,
  OVERSHOOT = 4
}

enum AnimationKind {
  TAB_SWITCH = 0,
  PROGRESS_BAR = 1,
  PRESS_FEEDBACK = 2
}

enum CallbackPhase {
  START = 0,
  FRAME = 1,
  PAUSE = 2,
  RESUME = 3,
  FINISH = 4,
  CANCEL = 5
}

interface AnimationSpec {
  id: string;
  kind: AnimationKind;
  durationMs: number;
  delayMs: number;
  curve: AnimationCurve;
  from: number;
  to: number;
}

interface AnimationFrame {
  animationId: string;
  frameIndex: number;
  elapsedMs: number;
  fraction: number;
  value: number;
  completed: boolean;
  timestamp: number;
}

interface CallbackEntry {
  animationId: string;
  phase: CallbackPhase;
  sequence: number;
}

interface ScheduleResult {
  accepted: boolean;
  reason: string;
}

function stateName(state: AnimationState): string {
  if (state === AnimationState.IDLE) {
    return 'idle';
  }
  if (state === AnimationState.RUNNING) {
    return 'running';
  }
  if (state === AnimationState.PAUSED) {
    return 'paused';
  }
  if (state === AnimationState.FINISHED) {
    return 'finished';
  }
  return 'cancelled';
}

function phaseName(phase: CallbackPhase): string {
  if (phase === CallbackPhase.START) {
    return 'start';
  }
  if (phase === CallbackPhase.FRAME) {
    return 'frame';
  }
  if (phase === CallbackPhase.PAUSE) {
    return 'pause';
  }
  if (phase === CallbackPhase.RESUME) {
    return 'resume';
  }
  if (phase === CallbackPhase.FINISH) {
    return 'finish';
  }
  return 'cancel';
}

function curveName(curve: AnimationCurve): string {
  if (curve === AnimationCurve.LINEAR) {
    return 'linear';
  }
  if (curve === AnimationCurve.EASE_IN) {
    return 'ease-in';
  }
  if (curve === AnimationCurve.EASE_OUT) {
    return 'ease-out';
  }
  if (curve === AnimationCurve.EASE_IN_OUT) {
    return 'ease-in-out';
  }
  return 'overshoot';
}

function clamp01(value: number): number {
  if (value < 0) {
    return 0;
  }
  if (value > 1) {
    return 1;
  }
  return value;
}

function clampRange(value: number, minimum: number, maximum: number): number {
  if (value < minimum) {
    return minimum;
  }
  if (value > maximum) {
    return maximum;
  }
  return value;
}

function roundTo(value: number, digits: number): number {
  const factor: number = Math.pow(10, digits);
  return Math.round(value * factor) / factor;
}

/* ------------------------------------------------------------------ */
/* Interpolation library used by the three browser animations.         */
/* ------------------------------------------------------------------ */

class EasingLibrary {
  static linear(t: number): number {
    return clamp01(t);
  }

  static easeIn(t: number): number {
    const value: number = clamp01(t);
    return value * value;
  }

  static easeOut(t: number): number {
    const value: number = clamp01(t);
    return 1 - (1 - value) * (1 - value);
  }

  static easeInOut(t: number): number {
    const value: number = clamp01(t);
    if (value < 0.5) {
      return 2 * value * value;
    }
    return 1 - 2 * (1 - value) * (1 - value);
  }

  static overshoot(t: number): number {
    const value: number = clamp01(t);
    const c1: number = 1.70158;
    const c3: number = c1 + 1;
    return 1 + c3 * Math.pow(value - 1, 3) + c1 * Math.pow(value - 1, 2);
  }

  static apply(curve: AnimationCurve, t: number): number {
    if (curve === AnimationCurve.EASE_IN) {
      return EasingLibrary.easeIn(t);
    }
    if (curve === AnimationCurve.EASE_OUT) {
      return EasingLibrary.easeOut(t);
    }
    if (curve === AnimationCurve.EASE_IN_OUT) {
      return EasingLibrary.easeInOut(t);
    }
    if (curve === AnimationCurve.OVERSHOOT) {
      return EasingLibrary.overshoot(t);
    }
    return EasingLibrary.linear(t);
  }

  /** Samples a curve into `count` normalized points, endpoints included. */
  static sample(curve: AnimationCurve, count: number): number[] {
    const result: number[] = [];
    const safeCount: number = count < 2 ? 2 : count;
    for (let index = 0; index < safeCount; index++) {
      const t: number = index / (safeCount - 1);
      result.push(EasingLibrary.apply(curve, t));
    }
    return result;
  }

  /** Checks that a curve never moves backwards between two samples. */
  static isMonotonic(curve: AnimationCurve, count: number): boolean {
    const points: number[] = EasingLibrary.sample(curve, count);
    for (let index = 1; index < points.length; index++) {
      if (points[index] + TOLERANCE_INTERPOLATION < points[index - 1]) {
        return false;
      }
    }
    return true;
  }
}

/* ------------------------------------------------------------------ */
/* Frame budgeting of the display panel.                              */
/* ------------------------------------------------------------------ */

class RefreshBudget {
  static budgetFor(refreshHz: number): number {
    if (refreshHz <= 0) {
      return FRAME_BUDGET_60HZ;
    }
    return 1000 / refreshHz;
  }

  /** Number of frames a duration needs, ceil semantics like the render loop. */
  static framesFor(durationMs: number, refreshHz: number): number {
    if (durationMs <= 0) {
      return 0;
    }
    const budget: number = RefreshBudget.budgetFor(refreshHz);
    return Math.ceil(durationMs / budget);
  }

  static isWithinBudget(frameMs: number, refreshHz: number): boolean {
    return frameMs <= RefreshBudget.budgetFor(refreshHz) + TOLERANCE_FRAME_BUDGET;
  }

  static refreshRateForBudget(budgetMs: number): number {
    if (budgetMs <= 0) {
      return SIXTY_HZ;
    }
    return Math.round(1000 / budgetMs);
  }

  static slowestFrame(frames: number[], refreshHz: number): number {
    let slowest: number = 0;
    for (let index = 0; index < frames.length; index++) {
      if (frames[index] > slowest) {
        slowest = frames[index];
      }
    }
    return slowest;
  }

  static droppedFrames(frames: number[], refreshHz: number): number {
    let dropped: number = 0;
    for (let index = 0; index < frames.length; index++) {
      if (!RefreshBudget.isWithinBudget(frames[index], refreshHz)) {
        dropped += 1;
      }
    }
    return dropped;
  }
}

/* ------------------------------------------------------------------ */
/* Callback bookkeeping.                                              */
/* ------------------------------------------------------------------ */

class CallbackLog {
  entries: CallbackEntry[] = [];
  private sequence: number = 0;

  record(animationId: string, phase: CallbackPhase): number {
    this.sequence += 1;
    this.entries.push({
      animationId: animationId,
      phase: phase,
      sequence: this.sequence
    });
    return this.sequence;
  }

  size(): number {
    return this.entries.length;
  }

  phases(): CallbackPhase[] {
    return this.entries.map((entry: CallbackEntry) => entry.phase);
  }

  phaseNames(): string[] {
    return this.entries.map((entry: CallbackEntry) => phaseName(entry.phase));
  }

  countPhase(phase: CallbackPhase): number {
    let count: number = 0;
    for (let index = 0; index < this.entries.length; index++) {
      if (this.entries[index].phase === phase) {
        count += 1;
      }
    }
    return count;
  }

  ids(): string[] {
    return this.entries.map((entry: CallbackEntry) => entry.animationId);
  }

  firstPhase(): CallbackPhase {
    if (this.entries.length === 0) {
      return CallbackPhase.START;
    }
    return this.entries[0].phase;
  }

  lastPhase(): CallbackPhase {
    if (this.entries.length === 0) {
      return CallbackPhase.FRAME;
    }
    return this.entries[this.entries.length - 1].phase;
  }

  clear(): void {
    this.entries = [];
    this.sequence = 0;
  }
}

class AnimationListener {
  log: CallbackLog = new CallbackLog();
  throwOnFrame: boolean = false;
  frameAttempts: number = 0;
  startCount: number = 0;
  finishCount: number = 0;

  onStart(animationId: string): void {
    this.startCount += 1;
    this.log.record(animationId, CallbackPhase.START);
  }

  onFrame(animationId: string, frame: AnimationFrame): void {
    this.frameAttempts += 1;
    if (this.throwOnFrame) {
      throw new Error(`listener failure for ${animationId} frame ${frame.frameIndex}`);
    }
    this.log.record(animationId, CallbackPhase.FRAME);
  }

  onPause(animationId: string): void {
    this.log.record(animationId, CallbackPhase.PAUSE);
  }

  onResume(animationId: string): void {
    this.log.record(animationId, CallbackPhase.RESUME);
  }

  onFinish(animationId: string): void {
    this.finishCount += 1;
    this.log.record(animationId, CallbackPhase.FINISH);
  }

  onCancel(animationId: string): void {
    this.log.record(animationId, CallbackPhase.CANCEL);
  }

  reset(): void {
    this.log.clear();
    this.throwOnFrame = false;
    this.frameAttempts = 0;
    this.startCount = 0;
    this.finishCount = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Single animation controller: the state machine under test.         */
/* ------------------------------------------------------------------ */

class AnimationController {
  spec: AnimationSpec;
  state: AnimationState = AnimationState.IDLE;
  elapsedMs: number = 0;
  delayRemainingMs: number = 0;
  frameCount: number = 0;
  value: number = 0;
  listener: AnimationListener | null = null;
  callbackFailures: number = 0;
  private clock: MockClock;

  constructor(spec: AnimationSpec, listener: AnimationListener | null = null,
    clock: MockClock | null = null) {
    this.spec = spec;
    this.listener = listener;
    this.clock = clock === null ? new MockClock() : clock;
    this.value = spec.from;
    this.delayRemainingMs = spec.delayMs > 0 ? spec.delayMs : 0;
  }

  private duration(): number {
    return this.spec.durationMs > 0 ? this.spec.durationMs : 0;
  }

  private safeListenerStart(): void {
    if (this.listener === null) {
      return;
    }
    try {
      this.listener.onStart(this.spec.id);
    } catch (error) {
      this.callbackFailures += 1;
      TestLogger.exception(TAG, 'listener.onStart', error as Error);
    }
  }

  private safeListenerFrame(frame: AnimationFrame): void {
    if (this.listener === null) {
      return;
    }
    try {
      this.listener.onFrame(this.spec.id, frame);
    } catch (error) {
      this.callbackFailures += 1;
      TestLogger.exception(TAG, 'listener.onFrame', error as Error);
    }
  }

  private safeListenerPhase(phase: CallbackPhase): void {
    if (this.listener === null) {
      return;
    }
    try {
      if (phase === CallbackPhase.PAUSE) {
        this.listener.onPause(this.spec.id);
      } else if (phase === CallbackPhase.RESUME) {
        this.listener.onResume(this.spec.id);
      } else if (phase === CallbackPhase.FINISH) {
        this.listener.onFinish(this.spec.id);
      } else if (phase === CallbackPhase.CANCEL) {
        this.listener.onCancel(this.spec.id);
      }
    } catch (error) {
      this.callbackFailures += 1;
      TestLogger.exception(TAG, `listener.${phaseName(phase)}`, error as Error);
    }
  }

  /** Starts from any state, re-entry requestionally restarts the timeline. */
  start(): boolean {
    if (this.spec.durationMs < 0) {
      return false;
    }
    this.elapsedMs = 0;
    this.frameCount = 0;
    this.value = this.spec.from;
    this.delayRemainingMs = this.spec.delayMs > 0 ? this.spec.delayMs : 0;
    this.safeListenerStart();
    if (this.duration() === 0) {
      this.state = AnimationState.FINISHED;
      this.value = this.spec.to;
      this.safeListenerPhase(CallbackPhase.FINISH);
      return true;
    }
    this.state = AnimationState.RUNNING;
    return true;
  }

  pause(): boolean {
    if (this.state !== AnimationState.RUNNING) {
      return false;
    }
    this.state = AnimationState.PAUSED;
    this.safeListenerPhase(CallbackPhase.PAUSE);
    return true;
  }

  resume(): boolean {
    if (this.state !== AnimationState.PAUSED) {
      return false;
    }
    this.state = AnimationState.RUNNING;
    this.safeListenerPhase(CallbackPhase.RESUME);
    return true;
  }

  cancel(): boolean {
    if (this.state === AnimationState.CANCELLED || this.state === AnimationState.FINISHED ||
      this.state === AnimationState.IDLE) {
      return false;
    }
    this.state = AnimationState.CANCELLED;
    this.safeListenerPhase(CallbackPhase.CANCEL);
    return true;
  }

  /** Feeds one render tick; returns null when nothing was painted. */
  tick(deltaMs: number): AnimationFrame | null {
    if (this.state !== AnimationState.RUNNING) {
      return null;
    }
    let remaining: number = deltaMs > 0 ? deltaMs : 0;
    if (remaining === 0) {
      return null;
    }
    if (remaining > MAX_DELTA_MS) {
      remaining = MAX_DELTA_MS;
    }
    if (this.delayRemainingMs > 0) {
      if (remaining <= this.delayRemainingMs) {
        this.delayRemainingMs -= remaining;
        return null;
      }
      remaining -= this.delayRemainingMs;
      this.delayRemainingMs = 0;
    }
    this.elapsedMs += remaining;
    this.frameCount += 1;
    const fraction: number = clamp01(this.elapsedMs / this.duration());
    const eased: number = EasingLibrary.apply(this.spec.curve, fraction);
    this.value = this.spec.from + (this.spec.to - this.spec.from) * eased;
    const completed: boolean = this.elapsedMs >= this.duration();
    if (completed) {
      this.elapsedMs = this.duration();
      this.value = this.spec.to;
      this.state = AnimationState.FINISHED;
    }
    const frame: AnimationFrame = {
      animationId: this.spec.id,
      frameIndex: this.frameCount,
      elapsedMs: this.elapsedMs,
      fraction: completed ? 1 : fraction,
      value: this.value,
      completed: completed,
      timestamp: this.clock.advance(remaining)
    };
    this.safeListenerFrame(frame);
    if (completed) {
      this.safeListenerPhase(CallbackPhase.FINISH);
    }
    return frame;
  }

  fraction(): number {
    if (this.duration() === 0) {
      return this.state === AnimationState.FINISHED ? 1 : 0;
    }
    return clamp01(this.elapsedMs / this.duration());
  }

  isActive(): boolean {
    return this.state === AnimationState.RUNNING || this.state === AnimationState.PAUSED;
  }

  reset(): void {
    this.state = AnimationState.IDLE;
    this.elapsedMs = 0;
    this.frameCount = 0;
    this.value = this.spec.from;
    this.delayRemainingMs = this.spec.delayMs > 0 ? this.spec.delayMs : 0;
    this.callbackFailures = 0;
  }

  describe(): string {
    return `${this.spec.id}:${stateName(this.state)}@${roundTo(this.elapsedMs, 2)}`;
  }
}

/**
 * Drives a controller until it stops running.
 *
 * A render tick is capped at MAX_DELTA_MS, so a single call cannot finish an
 * animation whose duration is longer than one frame budget. This helper feeds
 * the ticks the render loop would produce and returns the last painted frame.
 */
function driveToEnd(controller: AnimationController): AnimationFrame | null {
  let last: AnimationFrame | null = null;
  let guard: number = 0;
  while (controller.state === AnimationState.RUNNING && guard < 10000) {
    last = controller.tick(MAX_DELTA_MS);
    guard += 1;
  }
  return last;
}

/* ------------------------------------------------------------------ */
/* Concurrency layer: several animations ticking on one render loop.   */
/* ------------------------------------------------------------------ */

class AnimationScheduler {
  controllers: AnimationController[] = [];
  maxConcurrent: number = MAX_ANIMATION_COUNT;
  completionOrder: string[] = [];
  rejectedIds: string[] = [];
  listener: AnimationListener | null = null;

  constructor(maxConcurrent: number = MAX_ANIMATION_COUNT,
    listener: AnimationListener | null = null) {
    this.maxConcurrent = maxConcurrent <= 0 ? 1 : maxConcurrent;
    this.listener = listener;
  }

  add(spec: AnimationSpec): ScheduleResult {
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].spec.id === spec.id) {
        this.rejectedIds.push(spec.id);
        return { accepted: false, reason: 'duplicate id' };
      }
    }
    if (this.controllers.length >= this.maxConcurrent) {
      this.rejectedIds.push(spec.id);
      return { accepted: false, reason: 'capacity reached' };
    }
    this.controllers.push(new AnimationController(spec, this.listener));
    return { accepted: true, reason: 'ok' };
  }

  remove(id: string): boolean {
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].spec.id === id) {
        this.controllers.splice(index, 1);
        return true;
      }
    }
    return false;
  }

  startAll(): number {
    let started: number = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].start()) {
        started += 1;
      }
    }
    return started;
  }

  /** Ticks every controller and appends newly finished ids to the order list. */
  tickAll(deltaMs: number): number {
    let painted: number = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      const controller: AnimationController = this.controllers[index];
      const wasFinished: boolean = controller.state === AnimationState.FINISHED;
      const frame: AnimationFrame | null = controller.tick(deltaMs);
      if (frame !== null) {
        painted += 1;
      }
      if (!wasFinished && controller.state === AnimationState.FINISHED) {
        this.completionOrder.push(controller.spec.id);
      }
    }
    return painted;
  }

  pauseAll(): number {
    let paused: number = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].pause()) {
        paused += 1;
      }
    }
    return paused;
  }

  resumeAll(): number {
    let resumed: number = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].resume()) {
        resumed += 1;
      }
    }
    return resumed;
  }

  cancelAll(): number {
    let cancelled: number = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].cancel()) {
        cancelled += 1;
      }
    }
    return cancelled;
  }

  activeCount(): number {
    let active: number = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].isActive()) {
        active += 1;
      }
    }
    return active;
  }

  runningCount(): number {
    let running: number = 0;
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].state === AnimationState.RUNNING) {
        running += 1;
      }
    }
    return running;
  }

  find(id: string): AnimationController | null {
    for (let index = 0; index < this.controllers.length; index++) {
      if (this.controllers[index].spec.id === id) {
        return this.controllers[index];
      }
    }
    return null;
  }

  ids(): string[] {
    return this.controllers.map((controller: AnimationController) => controller.spec.id);
  }

  reset(): void {
    this.controllers = [];
    this.completionOrder = [];
    this.rejectedIds = [];
  }
}

/* ------------------------------------------------------------------ */
/* Browser specific animations.                                       */
/* ------------------------------------------------------------------ */

class TabSwitchAnimator {
  controller: AnimationController;
  fromIndex: number = 0;
  toIndex: number = 0;

  constructor(fromIndex: number = 0, toIndex: number = 1,
    listener: AnimationListener | null = null) {
    this.fromIndex = fromIndex;
    this.toIndex = toIndex;
    this.controller = new AnimationController({
      id: `tab-switch-${fromIndex}-${toIndex}`,
      kind: AnimationKind.TAB_SWITCH,
      durationMs: TAB_SWITCH_DURATION_MS,
      delayMs: DEFAULT_DELAY_MS,
      curve: AnimationCurve.EASE_OUT,
      from: fromIndex,
      to: toIndex
    }, listener);
  }

  start(): boolean {
    return this.controller.start();
  }

  advanceToEnd(): AnimationFrame | null {
    return driveToEnd(this.controller);
  }

  /** The tab strip snaps to the nearest integer index once released. */
  projectedIndex(): number {
    return Math.round(this.controller.value);
  }

  offsetFromTarget(): number {
    return Math.abs(this.toIndex - this.controller.value);
  }
}

class ProgressBarAnimator {
  controller: AnimationController;
  visible: boolean = true;

  constructor(fromProgress: number = 0, toProgress: number = 100,
    listener: AnimationListener | null = null) {
    this.controller = new AnimationController({
      id: 'progress-bar',
      kind: AnimationKind.PROGRESS_BAR,
      durationMs: PROGRESS_DURATION_MS,
      delayMs: DEFAULT_DELAY_MS,
      curve: AnimationCurve.LINEAR,
      from: clampRange(fromProgress, PROGRESS_MIN, PROGRESS_MAX),
      to: clampRange(toProgress, PROGRESS_MIN, PROGRESS_MAX)
    }, listener);
  }

  start(): boolean {
    return this.controller.start();
  }

  step(deltaMs: number): number {
    this.controller.tick(deltaMs);
    this.visible = progressVisibleAfter(this.controller.value);
    return roundTo(this.controller.value, 2);
  }

  complete(): void {
    driveToEnd(this.controller);
    this.controller.value = progressResetAfterComplete(this.controller.value);
    this.visible = progressVisibleAfter(100);
  }

  percent(): number {
    return roundTo(this.controller.value, 2);
  }
}

class PressFeedbackAnimator {
  controller: AnimationController;
  pressed: boolean = false;
  pressCount: number = 0;

  constructor(listener: AnimationListener | null = null) {
    this.controller = new AnimationController({
      id: 'press-feedback',
      kind: AnimationKind.PRESS_FEEDBACK,
      durationMs: PRESS_FEEDBACK_DURATION_MS,
      delayMs: DEFAULT_DELAY_MS,
      curve: AnimationCurve.EASE_IN,
      from: 0,
      to: 1
    }, listener);
  }

  pressDown(): boolean {
    this.pressed = true;
    this.pressCount += 1;
    return this.controller.start();
  }

  pressUp(): boolean {
    if (!this.pressed) {
      return false;
    }
    this.pressed = false;
    this.pressCount += 1;
    this.controller.cancel();
    this.controller.reset();
    return true;
  }

  /** Opacity of the pressed overlay, 0 means fully transparent. */
  overlayOpacity(): number {
    return roundTo(clamp01(this.controller.value), 3);
  }

  toggle(times: number): number {
    let toggles: number = 0;
    for (let index = 0; index < times; index++) {
      if (index % 2 === 0) {
        this.pressDown();
      } else {
        this.pressUp();
      }
      toggles += 1;
    }
    return toggles;
  }
}

class AnimationTelemetry {
  frameDurations: number[] = [];
  overshootCount: number = 0;
  cancelCount: number = 0;
  finishCount: number = 0;

  recordFrame(frame: AnimationFrame, frameMs: number): void {
    this.frameDurations.push(frameMs);
    if (frame.value > 1 || frame.value < 0) {
      this.overshootCount += 1;
    }
  }

  recordPhase(phase: CallbackPhase): void {
    if (phase === CallbackPhase.FINISH) {
      this.finishCount += 1;
    } else if (phase === CallbackPhase.CANCEL) {
      this.cancelCount += 1;
    }
  }

  frameCount(): number {
    return this.frameDurations.length;
  }

  averageFrameMs(): number {
    if (this.frameDurations.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let index = 0; index < this.frameDurations.length; index++) {
      total += this.frameDurations[index];
    }
    return roundTo(total / this.frameDurations.length, 3);
  }

  reset(): void {
    this.frameDurations = [];
    this.overshootCount = 0;
    this.cancelCount = 0;
    this.finishCount = 0;
  }
}

/* ------------------------------------------------------------------ */
/* Test suite.                                                        */
/* ------------------------------------------------------------------ */

export default function browserAnimationControllerValidationTest() {
  describe('browserAnimationControllerValidationTest', () => {
    let driver: Driver = getDriver();

    beforeAll(async () => {
      TestLogger.info(TAG, 'animation controller validation suite begin');
      TestLogger.resetSteps(TAG);
      await startBrowserApp();
    });

    beforeEach(() => {
      TestLogger.info(TAG, 'next validation case');
    });

    afterAll(() => {
      TestLogger.info(TAG, TestLogger.summary(TAG));
    });

    it('Animation_State_001', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_001');
      TestLogger.step(TAG, 'a freshly built controller is idle and parked at its from value');
      const controller: AnimationController = new AnimationController({
        id: 'state-001', kind: AnimationKind.TAB_SWITCH, durationMs: TAB_SWITCH_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 4
      });
      TestLogger.info(TAG, `initial state=${stateName(controller.state)} value=${controller.value}`);
      expect(controller.state).assertEqual(AnimationState.IDLE);
      expect(controller.value).assertEqual(0);
      expect(controller.frameCount).assertEqual(0);
      expect(controller.isActive()).assertFalse();
      TestLogger.pass(TAG, 'Animation_State_001');
    });

    it('Animation_State_002', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_002');
      TestLogger.step(TAG, 'start moves the controller into the running state once');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-002', kind: AnimationKind.TAB_SWITCH, durationMs: TAB_SWITCH_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.EASE_OUT, from: 0, to: 2
      }, listener);
      expect(controller.start()).assertTrue();
      TestLogger.info(TAG, `after start state=${stateName(controller.state)}`);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      expect(controller.isActive()).assertTrue();
      expect(listener.startCount).assertEqual(1);
      expect(listener.log.firstPhase()).assertEqual(CallbackPhase.START);
      TestLogger.pass(TAG, 'Animation_State_002');
    });

    it('Animation_State_003', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_003');
      TestLogger.step(TAG, 'a full duration tick finishes the animation exactly at the target');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-003', kind: AnimationKind.TAB_SWITCH, durationMs: TAB_SWITCH_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 1, to: 5
      }, listener);
      controller.start();
      const frame: AnimationFrame | null = driveToEnd(controller);
      TestLogger.info(TAG, `finished value=${controller.value} frames=${controller.frameCount}`);
      expect(frame === null).assertFalse();
      expect(controller.state).assertEqual(AnimationState.FINISHED);
      expect(controller.value).assertEqual(5);
      expect(controller.isActive()).assertFalse();
      expect(listener.finishCount).assertEqual(1);
      expect(listener.log.lastPhase()).assertEqual(CallbackPhase.FINISH);
      TestLogger.pass(TAG, 'Animation_State_003');
    });

    it('Animation_State_004', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_004');
      TestLogger.step(TAG, 'pause is accepted while running and keeps the elapsed time');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-004', kind: AnimationKind.PROGRESS_BAR, durationMs: PROGRESS_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      }, listener);
      controller.start();
      controller.tick(60);
      const elapsedBeforePause: number = controller.elapsedMs;
      expect(controller.pause()).assertTrue();
      TestLogger.info(TAG, `paused at ${elapsedBeforePause} ms, state=${stateName(controller.state)}`);
      expect(controller.state).assertEqual(AnimationState.PAUSED);
      expect(controller.elapsedMs).assertEqual(elapsedBeforePause);
      expect(listener.log.countPhase(CallbackPhase.PAUSE)).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_State_004');
    });

    it('Animation_State_005', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_005');
      TestLogger.step(TAG, 'pausing an idle controller is rejected and emits no pause callback');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-005', kind: AnimationKind.PRESS_FEEDBACK, durationMs: PRESS_FEEDBACK_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.EASE_IN, from: 0, to: 1
      }, listener);
      expect(controller.pause()).assertFalse();
      TestLogger.info(TAG, `idle controller pause result=false state=${stateName(controller.state)}`);
      expect(controller.state).assertEqual(AnimationState.IDLE);
      expect(listener.log.size()).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_State_005');
    });

    it('Animation_State_006', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_006');
      TestLogger.step(TAG, 'resume returns a paused animation to running without resetting it');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-006', kind: AnimationKind.PROGRESS_BAR, durationMs: PROGRESS_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      }, listener);
      controller.start();
      controller.tick(45);
      controller.pause();
      expect(controller.resume()).assertTrue();
      TestLogger.info(TAG, `resumed elapsed=${controller.elapsedMs} state=${stateName(controller.state)}`);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      expect(controller.elapsedMs).assertEqual(45);
      expect(listener.log.countPhase(CallbackPhase.RESUME)).assertEqual(1);
      const frame: AnimationFrame | null = controller.tick(45);
      expect(frame === null).assertFalse();
      expect(controller.elapsedMs).assertEqual(90);
      TestLogger.pass(TAG, 'Animation_State_006');
    });

    it('Animation_State_007', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_007');
      TestLogger.step(TAG, 'resuming an already running animation is a no-op');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-007', kind: AnimationKind.TAB_SWITCH, durationMs: TAB_SWITCH_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.EASE_IN_OUT, from: 0, to: 3
      }, listener);
      controller.start();
      expect(controller.resume()).assertFalse();
      TestLogger.info(TAG, `second resume rejected, pause callbacks=${listener.log.countPhase(CallbackPhase.RESUME)}`);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      expect(listener.log.countPhase(CallbackPhase.RESUME)).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_State_007');
    });

    it('Animation_State_008', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_008');
      TestLogger.step(TAG, 'cancel stops a running animation and freezes the painted value');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-008', kind: AnimationKind.PRESS_FEEDBACK, durationMs: PRESS_FEEDBACK_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      }, listener);
      controller.start();
      controller.tick(30);
      const frozen: number = controller.value;
      expect(controller.cancel()).assertTrue();
      TestLogger.info(TAG, `cancelled value=${frozen} state=${stateName(controller.state)}`);
      expect(controller.state).assertEqual(AnimationState.CANCELLED);
      expect(controller.value).assertEqual(frozen);
      expect(controller.tick(500) === null).assertTrue();
      expect(listener.log.countPhase(CallbackPhase.CANCEL)).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_State_008');
    });

    it('Animation_State_009', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_009');
      TestLogger.step(TAG, 'cancel is idempotent and an idle controller rejects cancellation');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-009', kind: AnimationKind.TAB_SWITCH, durationMs: TAB_SWITCH_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      }, listener);
      expect(controller.cancel()).assertFalse();
      controller.start();
      expect(controller.cancel()).assertTrue();
      expect(controller.cancel()).assertFalse();
      TestLogger.info(TAG, `cancel callback count=${listener.log.countPhase(CallbackPhase.CANCEL)}`);
      expect(listener.log.countPhase(CallbackPhase.CANCEL)).assertEqual(1);
      expect(controller.state).assertEqual(AnimationState.CANCELLED);
      TestLogger.pass(TAG, 'Animation_State_009');
    });

    it('Animation_State_010', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_010');
      TestLogger.step(TAG, 'cancelling a finished animation keeps it finished without a callback');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-010', kind: AnimationKind.PROGRESS_BAR, durationMs: PROGRESS_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      }, listener);
      controller.start();
      driveToEnd(controller);
      expect(controller.cancel()).assertFalse();
      TestLogger.info(TAG, `finished animation cancel rejected, state=${stateName(controller.state)}`);
      expect(controller.state).assertEqual(AnimationState.FINISHED);
      expect(listener.log.countPhase(CallbackPhase.CANCEL)).assertEqual(0);
      expect(listener.finishCount).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_State_010');
    });

    it('Animation_State_011', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_011');
      TestLogger.step(TAG, 'restarting after finish resets elapsed frames and emits a new start');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'state-011', kind: AnimationKind.TAB_SWITCH, durationMs: TAB_SWITCH_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.EASE_OUT, from: 2, to: 6
      }, listener);
      controller.start();
      driveToEnd(controller);
      expect(controller.start()).assertTrue();
      TestLogger.info(TAG, `restarted frames=${controller.frameCount} elapsed=${controller.elapsedMs}`);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      expect(controller.frameCount).assertEqual(0);
      expect(controller.elapsedMs).assertEqual(0);
      expect(controller.value).assertEqual(2);
      expect(listener.startCount).assertEqual(2);
      expect(listener.finishCount).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_State_011');
    });

    it('Animation_State_012', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_State_012');
      TestLogger.step(TAG, 'reset returns a cancelled controller to the pristine idle state');
      const controller: AnimationController = new AnimationController({
        id: 'state-012', kind: AnimationKind.PRESS_FEEDBACK, durationMs: PRESS_FEEDBACK_DURATION_MS,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      controller.start();
      controller.tick(40);
      controller.cancel();
      controller.reset();
      TestLogger.info(TAG, `after reset state=${stateName(controller.state)} value=${controller.value}`);
      expect(controller.state).assertEqual(AnimationState.IDLE);
      expect(controller.elapsedMs).assertEqual(0);
      expect(controller.frameCount).assertEqual(0);
      expect(controller.value).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_State_012');
    });

    it('Animation_Duration_013', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Duration_013');
      TestLogger.step(TAG, 'a zero duration animation finishes synchronously on start');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'duration-013', kind: AnimationKind.TAB_SWITCH, durationMs: 0,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 7
      }, listener);
      expect(controller.start()).assertTrue();
      TestLogger.info(TAG, `zero duration state=${stateName(controller.state)} value=${controller.value}`);
      expect(controller.state).assertEqual(AnimationState.FINISHED);
      expect(controller.value).assertEqual(7);
      expect(controller.tick(16) === null).assertTrue();
      expect(listener.startCount).assertEqual(1);
      expect(listener.finishCount).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_Duration_013');
    });

    it('Animation_Duration_014', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Duration_014');
      TestLogger.step(TAG, 'a negative duration is rejected before the state machine moves');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'duration-014', kind: AnimationKind.PROGRESS_BAR, durationMs: -1,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      }, listener);
      expect(controller.start()).assertFalse();
      TestLogger.info(TAG, `negative duration state=${stateName(controller.state)}`);
      expect(controller.state).assertEqual(AnimationState.IDLE);
      expect(controller.frameCount).assertEqual(0);
      expect(listener.log.size()).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_Duration_014');
    });

    it('Animation_Duration_015', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Duration_015');
      TestLogger.step(TAG, 'two half ticks land exactly on the duration boundary');
      const controller: AnimationController = new AnimationController({
        id: 'duration-015', kind: AnimationKind.TAB_SWITCH, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 10
      });
      controller.start();
      controller.tick(100);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      expect(controller.value).assertEqual(5);
      const frame: AnimationFrame | null = controller.tick(100);
      TestLogger.info(TAG, `boundary frame completed=${frame === null ? 'null' : frame.completed}`);
      expect(controller.state).assertEqual(AnimationState.FINISHED);
      expect(controller.value).assertEqual(10);
      expect(frame === null).assertFalse();
      if (frame !== null) {
        expect(frame.completed).assertTrue();
        expect(frame.fraction).assertEqual(1);
      }
      TestLogger.pass(TAG, 'Animation_Duration_015');
    });

    it('Animation_Duration_016', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Duration_016');
      TestLogger.step(TAG, 'a tick larger than the duration clamps both time and value');
      const controller: AnimationController = new AnimationController({
        id: 'duration-016', kind: AnimationKind.TAB_SWITCH, durationMs: 60,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 3, to: 9
      });
      controller.start();
      const frame: AnimationFrame | null = controller.tick(600);
      TestLogger.info(TAG, `overshoot tick elapsed=${controller.elapsedMs} value=${controller.value}`);
      expect(frame === null).assertFalse();
      expect(controller.elapsedMs).assertEqual(60);
      expect(controller.value).assertEqual(9);
      expect(controller.fraction()).assertEqual(1);
      expect(controller.state).assertEqual(AnimationState.FINISHED);
      TestLogger.pass(TAG, 'Animation_Duration_016');
    });

    it('Animation_Duration_017', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Duration_017');
      TestLogger.step(TAG, 'refresh budgets match the three supported display panels');
      const budget60: number = RefreshBudget.budgetFor(SIXTY_HZ);
      const budget90: number = RefreshBudget.budgetFor(NINETY_HZ);
      const budget120: number = RefreshBudget.budgetFor(ONE_TWENTY_HZ);
      TestLogger.info(TAG, `budgets 60=${budget60} 90=${budget90} 120=${budget120}`);
      expect(Math.abs(budget60 - FRAME_BUDGET_60HZ)).assertLess(TOLERANCE_FRAME_BUDGET);
      expect(Math.abs(budget90 - FRAME_BUDGET_90HZ)).assertLess(TOLERANCE_FRAME_BUDGET);
      expect(Math.abs(budget120 - FRAME_BUDGET_120HZ)).assertLess(TOLERANCE_FRAME_BUDGET);
      expect(RefreshBudget.refreshRateForBudget(budget60)).assertEqual(60);
      TestLogger.pass(TAG, 'Animation_Duration_017');
    });

    it('Animation_Duration_018', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Duration_018');
      TestLogger.step(TAG, 'frame count of a tab switch animation uses ceil semantics');
      const frames60: number = RefreshBudget.framesFor(TAB_SWITCH_DURATION_MS, SIXTY_HZ);
      const frames120: number = RefreshBudget.framesFor(TAB_SWITCH_DURATION_MS, ONE_TWENTY_HZ);
      TestLogger.info(TAG, `tab switch frames 60Hz=${frames60} 120Hz=${frames120}`);
      expect(frames60).assertEqual(15);
      expect(frames120).assertEqual(29);
      expect(RefreshBudget.framesFor(0, SIXTY_HZ)).assertEqual(0);
      expect(RefreshBudget.framesFor(-5, SIXTY_HZ)).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_Duration_018');
    });

    it('Animation_Duration_019', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Duration_019');
      TestLogger.step(TAG, 'frame budget analysis reports slow frames without hiding jitter');
      const frames: number[] = [8, 16, 16.5, 25, 40, 12];
      const slowest: number = RefreshBudget.slowestFrame(frames, SIXTY_HZ);
      const dropped: number = RefreshBudget.droppedFrames(frames, SIXTY_HZ);
      TestLogger.info(TAG, `slowest=${slowest} dropped=${dropped}`);
      expect(slowest).assertEqual(40);
      expect(dropped).assertEqual(2);
      expect(RefreshBudget.isWithinBudget(16.5, SIXTY_HZ)).assertTrue();
      expect(RefreshBudget.isWithinBudget(17.5, SIXTY_HZ)).assertFalse();
      TestLogger.pass(TAG, 'Animation_Duration_019');
    });

    it('Animation_Interpolation_020', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Interpolation_020');
      TestLogger.step(TAG, 'linear interpolation returns the exact midpoint');
      const midpoint: number = EasingLibrary.apply(AnimationCurve.LINEAR, 0.5);
      TestLogger.info(TAG, `linear midpoint=${midpoint}`);
      expect(Math.abs(midpoint - 0.5)).assertLess(TOLERANCE_INTERPOLATION);
      expect(EasingLibrary.apply(AnimationCurve.LINEAR, 0)).assertEqual(0);
      expect(EasingLibrary.apply(AnimationCurve.LINEAR, 1)).assertEqual(1);
      expect(EasingLibrary.apply(AnimationCurve.LINEAR, -2)).assertEqual(0);
      expect(EasingLibrary.apply(AnimationCurve.LINEAR, 3)).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_Interpolation_020');
    });

    it('Animation_Interpolation_021', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Interpolation_021');
      TestLogger.step(TAG, 'ease-in starts slower than linear but ends at the same point');
      const quarter: number = EasingLibrary.easeIn(0.25);
      const half: number = EasingLibrary.easeIn(0.5);
      TestLogger.info(TAG, `ease-in quarter=${quarter} half=${half}`);
      expect(quarter).assertLess(0.25);
      expect(half).assertLess(0.5);
      expect(EasingLibrary.easeIn(1)).assertEqual(1);
      expect(EasingLibrary.isMonotonic(AnimationCurve.EASE_IN, 21)).assertTrue();
      TestLogger.pass(TAG, 'Animation_Interpolation_021');
    });

    it('Animation_Interpolation_022', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Interpolation_022');
      TestLogger.step(TAG, 'ease-out overtakes linear during the first half');
      const quarter: number = EasingLibrary.easeOut(0.25);
      const threeQuarters: number = EasingLibrary.easeOut(0.75);
      TestLogger.info(TAG, `ease-out quarter=${quarter} threeQuarters=${threeQuarters}`);
      expect(quarter).assertLarger(0.25);
      expect(threeQuarters).assertLarger(0.75);
      expect(EasingLibrary.easeOut(1)).assertEqual(1);
      expect(EasingLibrary.isMonotonic(AnimationCurve.EASE_OUT, 21)).assertTrue();
      TestLogger.pass(TAG, 'Animation_Interpolation_022');
    });

    it('Animation_Interpolation_023', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Interpolation_023');
      TestLogger.step(TAG, 'ease-in-out is symmetric around the midpoint');
      const low: number = EasingLibrary.easeInOut(0.25);
      const high: number = EasingLibrary.easeInOut(0.75);
      TestLogger.info(TAG, `ease-in-out low=${low} high=${high}`);
      expect(Math.abs(low - 0.125)).assertLess(TOLERANCE_INTERPOLATION);
      expect(Math.abs(high - 0.875)).assertLess(TOLERANCE_INTERPOLATION);
      expect(Math.abs((low + high) - 1)).assertLess(TOLERANCE_INTERPOLATION);
      expect(EasingLibrary.easeInOut(0.5)).assertEqual(0.5);
      TestLogger.pass(TAG, 'Animation_Interpolation_023');
    });

    it('Animation_Interpolation_024', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Interpolation_024');
      TestLogger.step(TAG, 'overshoot crosses 1 in the middle and settles exactly on 1');
      const middle: number = EasingLibrary.overshoot(0.75);
      let peak: number = 0;
      for (let index = 0; index <= 100; index++) {
        const value: number = EasingLibrary.overshoot(index / 100);
        if (value > peak) {
          peak = value;
        }
      }
      TestLogger.info(TAG, `overshoot middle=${middle} peak=${peak}`);
      expect(middle).assertLarger(1);
      expect(peak).assertLarger(1);
      expect(peak).assertLess(1 + TOLERANCE_OVERSHOOT);
      expect(EasingLibrary.overshoot(1)).assertEqual(1);
      expect(Math.abs(EasingLibrary.overshoot(0))).assertLess(TOLERANCE_INTERPOLATION);
      TestLogger.pass(TAG, 'Animation_Interpolation_024');
    });

    it('Animation_Interpolation_025', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Interpolation_025');
      TestLogger.step(TAG, 'curve sampling keeps endpoints and a stable point count');
      const points: number[] = EasingLibrary.sample(AnimationCurve.EASE_IN_OUT, 11);
      TestLogger.info(TAG, `sample size=${points.length} first=${points[0]} last=${points[10]}`);
      expect(points.length).assertEqual(11);
      expect(points[0]).assertEqual(0);
      expect(points[10]).assertEqual(1);
      expect(EasingLibrary.sample(AnimationCurve.LINEAR, 1).length).assertEqual(2);
      expect(EasingLibrary.sample(AnimationCurve.LINEAR, 0).length).assertEqual(2);
      TestLogger.pass(TAG, 'Animation_Interpolation_025');
    });

    it('Animation_CancelReentry_026', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_CancelReentry_026');
      TestLogger.step(TAG, 'cancel followed by start rebuilds a clean timeline');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'reentry-026', kind: AnimationKind.TAB_SWITCH, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 4
      }, listener);
      controller.start();
      controller.tick(80);
      controller.cancel();
      expect(controller.start()).assertTrue();
      TestLogger.info(TAG, `reentry state=${stateName(controller.state)} elapsed=${controller.elapsedMs}`);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      expect(controller.elapsedMs).assertEqual(0);
      expect(controller.frameCount).assertEqual(0);
      expect(controller.value).assertEqual(0);
      expect(listener.startCount).assertEqual(2);
      expect(listener.log.countPhase(CallbackPhase.CANCEL)).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_CancelReentry_026');
    });

    it('Animation_CancelReentry_027', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_CancelReentry_027');
      TestLogger.step(TAG, 're-entrant start while running restarts instead of stacking');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'reentry-027', kind: AnimationKind.PROGRESS_BAR, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      }, listener);
      controller.start();
      controller.tick(100);
      expect(controller.value).assertEqual(50);
      controller.start();
      TestLogger.info(TAG, `second start elapsed=${controller.elapsedMs} value=${controller.value}`);
      expect(controller.elapsedMs).assertEqual(0);
      expect(controller.value).assertEqual(0);
      expect(controller.frameCount).assertEqual(0);
      expect(listener.startCount).assertEqual(2);
      TestLogger.pass(TAG, 'Animation_CancelReentry_027');
    });

    it('Animation_CancelReentry_028', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_CancelReentry_028');
      TestLogger.step(TAG, 'restart keeps the immutable spec of the controller');
      const controller: AnimationController = new AnimationController({
        id: 'reentry-028', kind: AnimationKind.TAB_SWITCH, durationMs: 240,
        delayMs: 0, curve: AnimationCurve.EASE_OUT, from: 2, to: 8
      });
      controller.start();
      controller.tick(100);
      controller.start();
      TestLogger.info(TAG, `spec id=${controller.spec.id} curve=${curveName(controller.spec.curve)}`);
      expect(controller.spec.id).assertEqual('reentry-028');
      expect(controller.spec.from).assertEqual(2);
      expect(controller.spec.to).assertEqual(8);
      expect(controller.spec.durationMs).assertEqual(240);
      expect(controller.spec.kind).assertEqual(AnimationKind.TAB_SWITCH);
      TestLogger.pass(TAG, 'Animation_CancelReentry_028');
    });

    it('Animation_Delay_029', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_029');
      TestLogger.step(TAG, 'a delayed animation consumes ticks before painting any progress');
      const controller: AnimationController = new AnimationController({
        id: 'delay-029', kind: AnimationKind.PROGRESS_BAR, durationMs: 100,
        delayMs: 50, curve: AnimationCurve.LINEAR, from: 0, to: 100
      });
      controller.start();
      expect(controller.tick(20) === null).assertTrue();
      expect(controller.delayRemainingMs).assertEqual(30);
      expect(controller.elapsedMs).assertEqual(0);
      controller.tick(30);
      TestLogger.info(TAG, `delay consumed remaining=${controller.delayRemainingMs}`);
      expect(controller.delayRemainingMs).assertEqual(0);
      expect(controller.elapsedMs).assertEqual(0);
      const frame: AnimationFrame | null = controller.tick(25);
      expect(frame === null).assertFalse();
      expect(controller.elapsedMs).assertEqual(25);
      expect(controller.value).assertEqual(25);
      TestLogger.pass(TAG, 'Animation_Delay_029');
    });

    it('Animation_Delay_030', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_030');
      TestLogger.step(TAG, 'a tick larger than the delay carries the surplus into the timeline');
      const controller: AnimationController = new AnimationController({
        id: 'delay-030', kind: AnimationKind.TAB_SWITCH, durationMs: 200,
        delayMs: 40, curve: AnimationCurve.LINEAR, from: 0, to: 10
      });
      controller.start();
      const frame: AnimationFrame | null = controller.tick(100);
      TestLogger.info(TAG, `surplus elapsed=${controller.elapsedMs} value=${controller.value}`);
      expect(frame === null).assertFalse();
      expect(controller.elapsedMs).assertEqual(60);
      expect(controller.value).assertEqual(3);
      expect(controller.delayRemainingMs).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_Delay_030');
    });

    it('Animation_Delay_031', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_031');
      TestLogger.step(TAG, 'a zero delta tick paints nothing and keeps the frame count');
      const controller: AnimationController = new AnimationController({
        id: 'delay-031', kind: AnimationKind.PRESS_FEEDBACK, durationMs: 120,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      controller.start();
      const frame: AnimationFrame | null = controller.tick(0);
      TestLogger.info(TAG, `zero delta frame=${frame === null ? 'null' : 'painted'}`);
      expect(frame === null).assertTrue();
      expect(controller.frameCount).assertEqual(0);
      expect(controller.elapsedMs).assertEqual(0);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      TestLogger.pass(TAG, 'Animation_Delay_031');
    });

    it('Animation_Delay_032', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_032');
      TestLogger.step(TAG, 'a negative delta is treated as zero and cannot rewind time');
      const controller: AnimationController = new AnimationController({
        id: 'delay-032', kind: AnimationKind.TAB_SWITCH, durationMs: 240,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 6
      });
      controller.start();
      expect(controller.tick(-100) === null).assertTrue();
      TestLogger.info(TAG, `negative delta elapsed=${controller.elapsedMs}`);
      expect(controller.elapsedMs).assertEqual(0);
      expect(controller.value).assertEqual(0);
      expect(controller.frameCount).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_Delay_032');
    });

    it('Animation_Delay_033', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_033');
      TestLogger.step(TAG, 'a huge delta is capped by the maximum tick budget');
      const controller: AnimationController = new AnimationController({
        id: 'delay-033', kind: AnimationKind.PROGRESS_BAR, durationMs: 5000,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      });
      controller.start();
      controller.tick(999999);
      TestLogger.info(TAG, `capped elapsed=${controller.elapsedMs} value=${controller.value}`);
      expect(controller.elapsedMs).assertEqual(MAX_DELTA_MS);
      expect(controller.value).assertEqual(2);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      TestLogger.pass(TAG, 'Animation_Delay_033');
    });

    it('Animation_Delay_034', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_034');
      TestLogger.step(TAG, 'pausing during a delay keeps the remaining delay intact');
      const controller: AnimationController = new AnimationController({
        id: 'delay-034', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 80, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      controller.start();
      controller.tick(30);
      controller.pause();
      const remaining: number = controller.delayRemainingMs;
      controller.resume();
      TestLogger.info(TAG, `delay remaining after pause/resume=${controller.delayRemainingMs}`);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      expect(controller.delayRemainingMs).assertEqual(remaining);
      expect(remaining).assertEqual(50);
      expect(controller.elapsedMs).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_Delay_034');
    });

    it('Animation_Delay_035', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_035');
      TestLogger.step(TAG, 'cancelling during a delay freezes the from value');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'delay-035', kind: AnimationKind.PRESS_FEEDBACK, durationMs: 120,
        delayMs: 60, curve: AnimationCurve.EASE_IN, from: 0, to: 1
      }, listener);
      controller.start();
      controller.tick(20);
      expect(controller.cancel()).assertTrue();
      TestLogger.info(TAG, `cancelled in delay value=${controller.value}`);
      expect(controller.value).assertEqual(0);
      expect(controller.state).assertEqual(AnimationState.CANCELLED);
      expect(listener.log.countPhase(CallbackPhase.CANCEL)).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_Delay_035');
    });

    it('Animation_Delay_036', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Delay_036');
      TestLogger.step(TAG, 'a finished controller ignores every further tick');
      const controller: AnimationController = new AnimationController({
        id: 'delay-036', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      controller.start();
      controller.tick(100);
      expect(controller.tick(50) === null).assertTrue();
      TestLogger.info(TAG, `post finish frames=${controller.frameCount} value=${controller.value}`);
      expect(controller.frameCount).assertEqual(1);
      expect(controller.value).assertEqual(1);
      expect(controller.elapsedMs).assertEqual(100);
      TestLogger.pass(TAG, 'Animation_Delay_036');
    });

    it('Animation_Concurrency_037', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Concurrency_037');
      TestLogger.step(TAG, 'scheduler starts two independent animations together');
      const scheduler: AnimationScheduler = new AnimationScheduler(4);
      expect(scheduler.add({
        id: 'conc-a', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      }).accepted).assertTrue();
      expect(scheduler.add({
        id: 'conc-b', kind: AnimationKind.PROGRESS_BAR, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      }).accepted).assertTrue();
      expect(scheduler.startAll()).assertEqual(2);
      TestLogger.info(TAG, `active=${scheduler.activeCount()} running=${scheduler.runningCount()}`);
      expect(scheduler.activeCount()).assertEqual(2);
      expect(scheduler.runningCount()).assertEqual(2);
      expect(scheduler.tickAll(100)).assertEqual(2);
      expect(scheduler.activeCount()).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_Concurrency_037');
    });

    it('Animation_Concurrency_038', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Concurrency_038');
      TestLogger.step(TAG, 'duplicate animation ids are rejected by the scheduler');
      const scheduler: AnimationScheduler = new AnimationScheduler(4);
      const first: ScheduleResult = scheduler.add({
        id: 'dup-id', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      const second: ScheduleResult = scheduler.add({
        id: 'dup-id', kind: AnimationKind.PROGRESS_BAR, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      });
      TestLogger.info(TAG, `first=${first.reason} second=${second.reason}`);
      expect(first.accepted).assertTrue();
      expect(second.accepted).assertFalse();
      expect(second.reason).assertEqual('duplicate id');
      expect(scheduler.controllers.length).assertEqual(1);
      expect(scheduler.rejectedIds.length).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_Concurrency_038');
    });

    it('Animation_Concurrency_039', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Concurrency_039');
      TestLogger.step(TAG, 'scheduler enforces its concurrency ceiling');
      const scheduler: AnimationScheduler = new AnimationScheduler(2);
      expect(scheduler.add({
        id: 'cap-1', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      }).accepted).assertTrue();
      expect(scheduler.add({
        id: 'cap-2', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 1, to: 2
      }).accepted).assertTrue();
      const third: ScheduleResult = scheduler.add({
        id: 'cap-3', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 2, to: 3
      });
      TestLogger.info(TAG, `third accepted=${third.accepted} reason=${third.reason}`);
      expect(third.accepted).assertFalse();
      expect(third.reason).assertEqual('capacity reached');
      expect(scheduler.ids().length).assertEqual(2);
      TestLogger.pass(TAG, 'Animation_Concurrency_039');
    });

    it('Animation_Concurrency_040', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Concurrency_040');
      TestLogger.step(TAG, 'removing a scheduled animation frees its slot');
      const scheduler: AnimationScheduler = new AnimationScheduler(1);
      scheduler.add({
        id: 'remove-a', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      expect(scheduler.add({
        id: 'remove-b', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 1, to: 2
      }).accepted).assertFalse();
      expect(scheduler.remove('remove-a')).assertTrue();
      expect(scheduler.remove('remove-a')).assertFalse();
      TestLogger.info(TAG, `after removal ids=${scheduler.ids().join(',')}`);
      expect(scheduler.controllers.length).assertEqual(0);
      expect(scheduler.add({
        id: 'remove-b', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 1, to: 2
      }).accepted).assertTrue();
      TestLogger.pass(TAG, 'Animation_Concurrency_040');
    });

    it('Animation_Concurrency_041', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Concurrency_041');
      TestLogger.step(TAG, 'pauseAll and resumeAll operate on every scheduled animation');
      const scheduler: AnimationScheduler = new AnimationScheduler(4);
      scheduler.add({
        id: 'all-a', kind: AnimationKind.TAB_SWITCH, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      scheduler.add({
        id: 'all-b', kind: AnimationKind.PROGRESS_BAR, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      });
      scheduler.startAll();
      scheduler.tickAll(50);
      expect(scheduler.pauseAll()).assertEqual(2);
      TestLogger.info(TAG, `paused active=${scheduler.activeCount()} running=${scheduler.runningCount()}`);
      expect(scheduler.runningCount()).assertEqual(0);
      expect(scheduler.activeCount()).assertEqual(2);
      expect(scheduler.resumeAll()).assertEqual(2);
      expect(scheduler.runningCount()).assertEqual(2);
      TestLogger.pass(TAG, 'Animation_Concurrency_041');
    });

    it('Animation_Concurrency_042', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Concurrency_042');
      TestLogger.step(TAG, 'cancelAll stops both running and paused animations');
      const scheduler: AnimationScheduler = new AnimationScheduler(4);
      scheduler.add({
        id: 'cancel-a', kind: AnimationKind.TAB_SWITCH, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      scheduler.add({
        id: 'cancel-b', kind: AnimationKind.PRESS_FEEDBACK, durationMs: 200,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      scheduler.startAll();
      scheduler.controllers[1].pause();
      expect(scheduler.cancelAll()).assertEqual(2);
      TestLogger.info(TAG, `cancelAll active=${scheduler.activeCount()}`);
      expect(scheduler.activeCount()).assertEqual(0);
      expect(scheduler.controllers[0].state).assertEqual(AnimationState.CANCELLED);
      expect(scheduler.controllers[1].state).assertEqual(AnimationState.CANCELLED);
      expect(scheduler.cancelAll()).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_Concurrency_042');
    });

    it('Animation_Concurrency_043', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Concurrency_043');
      TestLogger.step(TAG, 'completion order follows the shorter animation first');
      const scheduler: AnimationScheduler = new AnimationScheduler(4);
      scheduler.add({
        id: 'order-long', kind: AnimationKind.TAB_SWITCH, durationMs: 300,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      scheduler.add({
        id: 'order-short', kind: AnimationKind.PRESS_FEEDBACK, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 1
      });
      scheduler.startAll();
      scheduler.tickAll(100);
      expect(scheduler.completionOrder.length).assertEqual(1);
      expect(scheduler.completionOrder[0]).assertEqual('order-short');
      scheduler.tickAll(MAX_DELTA_MS);
      scheduler.tickAll(100);
      TestLogger.info(TAG, `completion order=${scheduler.completionOrder.join(',')}`);
      expect(scheduler.completionOrder.length).assertEqual(2);
      expect(scheduler.completionOrder[1]).assertEqual('order-long');
      TestLogger.pass(TAG, 'Animation_Concurrency_043');
    });

    it('Animation_Callback_044', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Callback_044');
      TestLogger.step(TAG, 'subscriber order is start, frame, frame, finish');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'callback-044', kind: AnimationKind.PROGRESS_BAR, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 100
      }, listener);
      controller.start();
      controller.tick(50);
      controller.tick(50);
      const phases: string[] = listener.log.phaseNames();
      TestLogger.info(TAG, `callback phases=${phases.join('>')}`);
      expect(phases.length).assertEqual(4);
      expect(phases[0]).assertEqual('start');
      expect(phases[1]).assertEqual('frame');
      expect(phases[2]).assertEqual('frame');
      expect(phases[3]).assertEqual('finish');
      expect(listener.log.countPhase(CallbackPhase.FRAME)).assertEqual(2);
      expect(listener.log.countPhase(CallbackPhase.FINISH)).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_Callback_044');
    });

    it('Animation_Callback_045', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Callback_045');
      TestLogger.step(TAG, 'a throwing frame listener is isolated and the animation continues');
      const listener: AnimationListener = new AnimationListener();
      listener.throwOnFrame = true;
      const controller: AnimationController = new AnimationController({
        id: 'callback-045', kind: AnimationKind.TAB_SWITCH, durationMs: 100,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 10
      }, listener);
      controller.start();
      const frame: AnimationFrame | null = controller.tick(50);
      TestLogger.info(TAG, `frame painted despite listener failure=${frame !== null} failures=${controller.callbackFailures}`);
      expect(frame === null).assertFalse();
      expect(controller.callbackFailures).assertEqual(1);
      expect(listener.frameAttempts).assertEqual(1);
      expect(controller.frameCount).assertEqual(1);
      expect(controller.state).assertEqual(AnimationState.RUNNING);
      const second: AnimationFrame | null = controller.tick(50);
      expect(second === null).assertFalse();
      expect(controller.state).assertEqual(AnimationState.FINISHED);
      expect(controller.callbackFailures).assertEqual(2);
      TestLogger.pass(TAG, 'Animation_Callback_045');
    });

    it('Animation_Callback_046', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Callback_046');
      TestLogger.step(TAG, 'frame indexes are strictly increasing from one');
      const listener: AnimationListener = new AnimationListener();
      const controller: AnimationController = new AnimationController({
        id: 'callback-046', kind: AnimationKind.TAB_SWITCH, durationMs: 120,
        delayMs: 0, curve: AnimationCurve.LINEAR, from: 0, to: 12
      }, listener);
      controller.start();
      const indexes: number[] = [];
      for (let index = 0; index < 6; index++) {
        const frame: AnimationFrame | null = controller.tick(20);
        if (frame !== null) {
          indexes.push(frame.frameIndex);
        }
      }
      TestLogger.info(TAG, `frame indexes=${indexes.join(',')}`);
      expect(indexes.length).assertEqual(6);
      expect(indexes[0]).assertEqual(1);
      expect(indexes[5]).assertEqual(6);
      expect(controller.state).assertEqual(AnimationState.FINISHED);
      expect(listener.log.countPhase(CallbackPhase.FRAME)).assertEqual(6);
      TestLogger.pass(TAG, 'Animation_Callback_046');
    });

    it('Animation_Callback_047', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_Callback_047');
      TestLogger.step(TAG, 'telemetry aggregates frames averages and overshoot samples');
      const telemetry: AnimationTelemetry = new AnimationTelemetry();
      telemetry.recordFrame({
        animationId: 'telemetry', frameIndex: 1, elapsedMs: 16, fraction: 0.1,
        value: 0.5, completed: false, timestamp: 1
      }, 16);
      telemetry.recordFrame({
        animationId: 'telemetry', frameIndex: 2, elapsedMs: 32, fraction: 0.2,
        value: 1.4, completed: false, timestamp: 2
      }, 12);
      telemetry.recordPhase(CallbackPhase.FINISH);
      telemetry.recordPhase(CallbackPhase.CANCEL);
      TestLogger.info(TAG, `telemetry frames=${telemetry.frameCount()} avg=${telemetry.averageFrameMs()}`);
      expect(telemetry.frameCount()).assertEqual(2);
      expect(telemetry.averageFrameMs()).assertEqual(14);
      expect(telemetry.overshootCount).assertEqual(1);
      expect(telemetry.finishCount).assertEqual(1);
      expect(telemetry.cancelCount).assertEqual(1);
      telemetry.reset();
      expect(telemetry.frameCount()).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_Callback_047');
    });

    it('Animation_TabSwitch_048', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_048');
      TestLogger.step(TAG, 'forward tab switch animates from the source index to the target index');
      const listener: AnimationListener = new AnimationListener();
      const animator: TabSwitchAnimator = new TabSwitchAnimator(0, 3, listener);
      expect(animator.start()).assertTrue();
      const frame: AnimationFrame | null = animator.advanceToEnd();
      TestLogger.info(TAG, `tab switch value=${animator.controller.value} projected=${animator.projectedIndex()}`);
      expect(frame === null).assertFalse();
      expect(animator.controller.state).assertEqual(AnimationState.FINISHED);
      expect(animator.controller.value).assertEqual(3);
      expect(animator.projectedIndex()).assertEqual(3);
      expect(animator.offsetFromTarget()).assertEqual(0);
      expect(listener.finishCount).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_TabSwitch_048');
    });

    it('Animation_TabSwitch_049', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_049');
      TestLogger.step(TAG, 'switch the same index produces a stable zero travel animation');
      const animator: TabSwitchAnimator = new TabSwitchAnimator(4, 4);
      animator.start();
      animator.controller.tick(TAB_SWITCH_DURATION_MS / 2);
      TestLogger.info(TAG, `same index mid value=${animator.controller.value}`);
      expect(animator.controller.value).assertEqual(4);
      expect(animator.projectedIndex()).assertEqual(4);
      expect(animator.offsetFromTarget()).assertEqual(0);
      animator.advanceToEnd();
      expect(animator.controller.value).assertEqual(4);
      TestLogger.pass(TAG, 'Animation_TabSwitch_049');
    });

    it('Animation_TabSwitch_050', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_050');
      TestLogger.step(TAG, 'the tab strip snaps to the nearest integer during a switch');
      const animator: TabSwitchAnimator = new TabSwitchAnimator(2, 5);
      animator.start();
      animator.controller.tick(TAB_SWITCH_DURATION_MS / 2);
      const midValue: number = animator.controller.value;
      const projected: number = animator.projectedIndex();
      TestLogger.info(TAG, `mid value=${midValue} projected=${projected}`);
      expect(midValue).assertLarger(2);
      expect(midValue).assertLess(5);
      expect(projected >= 2 && projected <= 5).assertTrue();
      expect(animator.offsetFromTarget()).assertLarger(0);
      TestLogger.pass(TAG, 'Animation_TabSwitch_050');
    });

    it('Animation_TabSwitch_051', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_TabSwitch_051');
      TestLogger.step(TAG, 'tab switch accepts the highest valid tab index');
      const animator: TabSwitchAnimator = new TabSwitchAnimator(0, TAB_INDEX_MAX);
      animator.start();
      animator.advanceToEnd();
      TestLogger.info(TAG, `max target projected=${animator.projectedIndex()}`);
      expect(animator.projectedIndex()).assertEqual(TAB_INDEX_MAX);
      expect(animator.controller.spec.to).assertEqual(9);
      expect(animator.controller.spec.kind).assertEqual(AnimationKind.TAB_SWITCH);
      TestLogger.pass(TAG, 'Animation_TabSwitch_051');
    });

    it('Animation_ProgressBar_052', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_ProgressBar_052');
      TestLogger.step(TAG, 'progress bar advances linearly across three ticks');
      const animator: ProgressBarAnimator = new ProgressBarAnimator(0, 100);
      animator.start();
      const first: number = animator.step(60);
      const second: number = animator.step(60);
      const third: number = animator.step(60);
      TestLogger.info(TAG, `progress steps=${first},${second},${third}`);
      expect(first).assertEqual(33.33);
      expect(second).assertEqual(66.67);
      expect(third).assertEqual(100);
      expect(animator.visible).assertFalse();
      TestLogger.pass(TAG, 'Animation_ProgressBar_052');
    });

    it('Animation_ProgressBar_053', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_ProgressBar_053');
      TestLogger.step(TAG, 'a completed progress bar resets to zero and hides itself');
      const animator: ProgressBarAnimator = new ProgressBarAnimator(0, 100);
      animator.start();
      animator.complete();
      TestLogger.info(TAG, `completed percent=${animator.percent()} visible=${animator.visible}`);
      expect(animator.percent()).assertEqual(0);
      expect(animator.visible).assertFalse();
      expect(animator.controller.state).assertEqual(AnimationState.FINISHED);
      expect(progressVisibleAfter(100)).assertFalse();
      expect(progressResetAfterComplete(100)).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_ProgressBar_053');
    });

    it('Animation_ProgressBar_054', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_ProgressBar_054');
      TestLogger.step(TAG, 'progress values below one hundred keep the bar visible');
      const animator: ProgressBarAnimator = new ProgressBarAnimator(0, 100);
      animator.start();
      animator.step(90);
      TestLogger.info(TAG, `progress=${animator.percent()} visible=${animator.visible}`);
      expect(animator.percent()).assertEqual(50);
      expect(animator.visible).assertTrue();
      expect(progressVisibleAfter(99)).assertTrue();
      expect(progressResetAfterComplete(99)).assertEqual(99);
      TestLogger.pass(TAG, 'Animation_ProgressBar_054');
    });

    it('Animation_PressFeedback_055', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_PressFeedback_055');
      TestLogger.step(TAG, 'press down ramps the overlay opacity towards one');
      const animator: PressFeedbackAnimator = new PressFeedbackAnimator();
      expect(animator.pressDown()).assertTrue();
      driveToEnd(animator.controller);
      TestLogger.info(TAG, `overlay opacity=${animator.overlayOpacity()} pressed=${animator.pressed}`);
      expect(animator.pressed).assertTrue();
      expect(animator.overlayOpacity()).assertEqual(1);
      expect(animator.pressCount).assertEqual(1);
      expect(animator.controller.state).assertEqual(AnimationState.FINISHED);
      TestLogger.pass(TAG, 'Animation_PressFeedback_055');
    });

    it('Animation_PressFeedback_056', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_PressFeedback_056');
      TestLogger.step(TAG, 'release cancels the press animation and clears the pressed flag');
      const listener: AnimationListener = new AnimationListener();
      const animator: PressFeedbackAnimator = new PressFeedbackAnimator(listener);
      animator.pressDown();
      animator.controller.tick(40);
      expect(animator.pressUp()).assertTrue();
      TestLogger.info(TAG, `after release pressed=${animator.pressed} opacity=${animator.overlayOpacity()}`);
      expect(animator.pressed).assertFalse();
      expect(animator.overlayOpacity()).assertEqual(0);
      expect(animator.controller.state).assertEqual(AnimationState.IDLE);
      expect(listener.log.countPhase(CallbackPhase.CANCEL)).assertEqual(1);
      TestLogger.pass(TAG, 'Animation_PressFeedback_056');
    });

    it('Animation_PressFeedback_057', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_PressFeedback_057');
      TestLogger.step(TAG, 'rapid press toggles keep a balanced pressed state');
      const animator: PressFeedbackAnimator = new PressFeedbackAnimator();
      const toggles: number = animator.toggle(9);
      TestLogger.info(TAG, `toggles=${toggles} pressed=${animator.pressed} count=${animator.pressCount}`);
      expect(toggles).assertEqual(9);
      expect(animator.pressed).assertTrue();
      expect(animator.pressCount).assertEqual(9);
      expect(animator.controller.state).assertEqual(AnimationState.RUNNING);
      TestLogger.pass(TAG, 'Animation_PressFeedback_057');
    });

    it('Animation_PressFeedback_058', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_PressFeedback_058');
      TestLogger.step(TAG, 'release without a preceding press is rejected');
      const animator: PressFeedbackAnimator = new PressFeedbackAnimator();
      expect(animator.pressUp()).assertFalse();
      TestLogger.info(TAG, `idle release rejected, pressed=${animator.pressed}`);
      expect(animator.pressed).assertFalse();
      expect(animator.pressCount).assertEqual(0);
      expect(animator.overlayOpacity()).assertEqual(0);
      TestLogger.pass(TAG, 'Animation_PressFeedback_058');
    });

    it('Animation_UI_059', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_UI_059');
      TestLogger.step(TAG, 'the title bar url field is present before any animation starts');
      // The Web window of the sample may still be settling right after the
      // launch requested in beforeAll, therefore poll before asserting.
      const visible: boolean = await waitForId(driver, ID_INPUT_URL, TIMEOUT_APP_LAUNCH);
      await serializedDelay(driver, DELAY_TOUCH_EVENT);
      TestLogger.info(TAG, `title bar input visible=${visible}`);
      expect(visible).assertTrue();
      const exists: boolean = await componentByIdExists(driver, ID_INPUT_URL);
      expect(exists).assertTrue();
      TestLogger.pass(TAG, 'Animation_UI_059');
    });

    it('Animation_UI_060', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_UI_060');
      TestLogger.step(TAG, 'navigation buttons remain queryable while animations idle');
      const backCount: number = await countById(driver, ID_NAV_BACK);
      const refreshCount: number = await countById(driver, ID_NAV_REFRESH);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      TestLogger.info(TAG, `back=${backCount} refresh=${refreshCount}`);
      expect(backCount).assertLarger(0);
      expect(refreshCount).assertLarger(0);
      TestLogger.pass(TAG, 'Animation_UI_060');
    });

    it('Animation_UI_061', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_UI_061');
      TestLogger.step(TAG, 'a tab switch animation is driven through the real render loop');
      const animator: TabSwitchAnimator = new TabSwitchAnimator(0, 1);
      animator.start();
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH / 4);
      const midValue: number = animator.controller.value;
      await serializedDelay(driver, TIMEOUT_TAB_SWITCH / 2);
      animator.advanceToEnd();
      TestLogger.info(TAG, `mid=${midValue} final=${animator.projectedIndex()}`);
      expect(animator.projectedIndex()).assertEqual(1);
      expect(animator.controller.state).assertEqual(AnimationState.FINISHED);
      TestLogger.pass(TAG, 'Animation_UI_061');
    });

    it('Animation_UI_062', 0, async () => {
      TestLogger.caseBegin(TAG, 'Animation_UI_062');
      TestLogger.step(TAG, 'add tab button is present and keeps the add animation target valid');
      const addExists: boolean = await componentByIdExists(driver, ID_ACTION_ADD);
      await serializedDelay(driver, DELAY_TAB_OPERATION);
      TestLogger.info(TAG, `add button exists=${addExists}`);
      expect(addExists).assertTrue();
      const animator: TabSwitchAnimator = new TabSwitchAnimator(0, 1);
      animator.start();
      const frame: AnimationFrame | null = animator.advanceToEnd();
      expect(frame === null).assertFalse();
      expect(animator.controller.spec.to).assertLess(TAB_INDEX_MAX + 1);
      TestLogger.pass(TAG, 'Animation_UI_062');
    });
  });
}
