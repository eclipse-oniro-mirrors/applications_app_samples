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

import { afterAll, beforeAll, describe, expect, it } from '@ohos/hypium';
import { Component, Driver } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  DELAY_AFTER_ACTION,
  DELAY_KEY_NAVIGATION,
  DELAY_TOUCH_EVENT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_BUNDLE_INPUT,
  ID_INDEX_TITLE,
  ID_QUERY_CONFIG_BUTTON,
  ID_QUERY_STATE_BUTTON,
  KEY_BACK,
  TEXT_STATE_INACTIVE,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  findById,
  findComponentsByType,
  getDriver,
  indexComponentCount,
  isComponentEnabled,
  launchAssessmentApp,
  measureActionMs,
  pressAndWait,
  runSerializedUiOperation,
  serializedDelay,
  typeBundleName,
  waitForIndexPage
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The gesture thresholds of the platform. A press that ends inside the touch slop and below the
// tap budget is a tap, a press that stays inside the slop for the long press budget is a long
// press, and a move that leaves the slop is a drag or a swipe depending on its velocity.
const TOUCH_SLOP_VP: number = 8;
const TAP_MAX_DURATION_MS: number = 200;
const LONG_PRESS_DURATION_MS: number = 500;
const DOUBLE_TAP_WINDOW_MS: number = 300;
const FLING_MIN_VELOCITY_VP_S: number = 200;
const PINCH_MIN_SCALE_DELTA: number = 0.1;
const SCROLL_AXIS_RATIO: number = 1.5;

// The gesture speed that the driver uses for a swipe, in pixels per second. The value stays in
// the middle of the accepted range so that the swipe is not mistaken for a fling.
const SWIPE_SPEED_PX_S: number = 800;

// Distances of the synthetic swipe gestures. The vertical swipe is longer than the touch slop
// by a wide margin so that the direction is unambiguous.
const SWIPE_DISTANCE_VP: number = 160;
const DRAG_DISTANCE_VP: number = 40;
const TAP_JITTER_VP: number = 3;

// Responsiveness budget of one delivered gesture. The entry page only updates state, a gesture
// that needs more than one second is treated as degraded by the interaction audit.
const GESTURE_BUDGET_MS: number = 1000;

// Number of samples that a stress case records, it stays low so that the suite stays fast.
const STRESS_GESTURE_ROUNDS: number = 12;

// Alpha of the confidence that a recognizer reports when the sample only half matches.
const CONFIDENCE_HIGH: number = 0.9;
const CONFIDENCE_LOW: number = 0.4;

// The page root of the entry page is a List, its touch area covers the whole viewport.
const ENTRY_SCROLL_CONTAINER: string = 'List';

/**
 * Kind of a gesture that the recognizers of this suite can classify.
 */
enum GestureKind {
  TAP = 0,
  LONG_PRESS = 1,
  DOUBLE_TAP = 2,
  DRAG = 3,
  SWIPE = 4,
  PINCH = 5,
  UNKNOWN = 6
}

/**
 * Lifecycle state of the long press timer of one press.
 */
enum PressTimerState {
  IDLE = 0,
  ARMED = 1,
  FIRED = 2,
  CANCELLED = 3
}

/**
 * What a pointer move means for the scroll container of the entry page.
 */
enum ScrollVerdict {
  TAP = 0,
  LIST_SCROLL = 1,
  ITEM_DRAG = 2,
  IGNORED = 3
}

/**
 * One recorded gesture sample. The class is a plain data carrier, the classification is done by
 * GestureClassifier so that the same sample can be replayed against several threshold tables.
 */
interface GestureSample {
  startX: number;
  startY: number;
  endX: number;
  endY: number;
  durationMs: number;
  pointerCount: number;
  secondTapGapMs: number;
}

/**
 * One entry of the recognition log.
 */
interface GestureLogEntry {
  seq: number;
  kind: GestureKind;
  recognized: boolean;
  durationMs: number;
  reason: string;
}

/**
 * One candidate that reached the conflict resolver.
 */
interface RecognitionCandidate {
  kind: GestureKind;
  confidence: number;
  priority: number;
}

/**
 * Threshold table of the recognizer. The defaults mirror the platform values, a case may build
 * a tighter or a looser table to prove that the classifier follows the table it was given.
 */
class GestureThresholds {
  public slopVp: number = TOUCH_SLOP_VP;
  public tapMaxMs: number = TAP_MAX_DURATION_MS;
  public longPressMs: number = LONG_PRESS_DURATION_MS;
  public doubleTapWindowMs: number = DOUBLE_TAP_WINDOW_MS;
  public flingVelocity: number = FLING_MIN_VELOCITY_VP_S;
  public pinchScaleDelta: number = PINCH_MIN_SCALE_DELTA;

  /**
   * @param slopVp movement that still counts as a tap.
   * @param tapMaxMs maximum duration of a tap.
   * @param longPressMs duration that turns a still press into a long press.
   */
  constructor(slopVp: number = TOUCH_SLOP_VP, tapMaxMs: number = TAP_MAX_DURATION_MS,
    longPressMs: number = LONG_PRESS_DURATION_MS) {
    this.slopVp = slopVp;
    this.tapMaxMs = tapMaxMs;
    this.longPressMs = longPressMs;
  }

  /**
   * @returns a copy of the table, a case can mutate the copy without touching the default.
   */
  public copy(): GestureThresholds {
    const clone: GestureThresholds = new GestureThresholds(this.slopVp, this.tapMaxMs, this.longPressMs);
    clone.doubleTapWindowMs = this.doubleTapWindowMs;
    clone.flingVelocity = this.flingVelocity;
    clone.pinchScaleDelta = this.pinchScaleDelta;
    return clone;
  }

  /**
   * @returns true when every threshold is positive, which is the validity rule of the table.
   */
  public isValid(): boolean {
    const positive: boolean = this.slopVp > 0 && this.tapMaxMs > 0 && this.longPressMs > 0 &&
      this.doubleTapWindowMs > 0 && this.flingVelocity > 0 && this.pinchScaleDelta > 0;
    return positive;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `GestureThresholds{slop=${this.slopVp}vp, tap=${this.tapMaxMs}ms, ` +
      `longPress=${this.longPressMs}ms}`;
  }
}

/**
 * Builds synthetic gesture samples that mirror the gestures a user performs on the entry page.
 */
class GesturePlanner {
  /**
   * @param x anchor x of the gesture.
   * @param y anchor y of the gesture.
   * @returns a tap sample that ends inside the touch slop.
   */
  public static tap(x: number, y: number): GestureSample {
    return {
      startX: x,
      startY: y,
      endX: x + TAP_JITTER_VP,
      endY: y - TAP_JITTER_VP,
      durationMs: 80,
      pointerCount: 1,
      secondTapGapMs: 0
    };
  }

  /**
   * @param x anchor x of the gesture.
   * @param y anchor y of the gesture.
   * @param holdMs duration of the press.
   * @returns a long press sample that does not move.
   */
  public static longPress(x: number, y: number, holdMs: number = LONG_PRESS_DURATION_MS): GestureSample {
    return {
      startX: x,
      startY: y,
      endX: x,
      endY: y,
      durationMs: holdMs,
      pointerCount: 1,
      secondTapGapMs: 0
    };
  }

  /**
   * @param x anchor x of the gesture.
   * @param y anchor y of the gesture.
   * @param gapMs pause between the two taps.
   * @returns a double tap sample, the second tap is expressed through the gap field.
   */
  public static doubleTap(x: number, y: number, gapMs: number = 120): GestureSample {
    return {
      startX: x,
      startY: y,
      endX: x + 1,
      endY: y + 1,
      durationMs: 60,
      pointerCount: 1,
      secondTapGapMs: gapMs
    };
  }

  /**
   * @param x anchor x of the gesture.
   * @param y anchor y of the gesture.
   * @param dx horizontal travel.
   * @param dy vertical travel.
   * @param durationMs travel time.
   * @returns a drag or swipe sample.
   */
  public static move(x: number, y: number, dx: number, dy: number, durationMs: number): GestureSample {
    return {
      startX: x,
      startY: y,
      endX: x + dx,
      endY: y + dy,
      durationMs: durationMs,
      pointerCount: 1,
      secondTapGapMs: 0
    };
  }

  /**
   * @param x anchor x of the pinch.
   * @param y anchor y of the pinch.
   * @param travelVp travel of one finger.
   * @returns a two finger pinch sample.
   */
  public static pinch(x: number, y: number, travelVp: number): GestureSample {
    return {
      startX: x,
      startY: y,
      endX: x + travelVp,
      endY: y + travelVp,
      durationMs: 400,
      pointerCount: 2,
      secondTapGapMs: 0
    };
  }
}

/**
 * Classifies gesture samples against a threshold table.
 */
class GestureClassifier {
  private thresholds: GestureThresholds;

  /**
   * @param thresholds threshold table used by the classifier.
   */
  constructor(thresholds: GestureThresholds = new GestureThresholds()) {
    this.thresholds = thresholds;
  }

  /**
   * @param sample sample to measure.
   * @returns the euclidean travel of the pointer in vp.
   */
  public travelDistance(sample: GestureSample): number {
    const dx: number = sample.endX - sample.startX;
    const dy: number = sample.endY - sample.startY;
    return Math.sqrt(dx * dx + dy * dy);
  }

  /**
   * @param sample sample to measure.
   * @returns the pointer velocity in vp per second, zero when the duration is not positive.
   */
  public velocity(sample: GestureSample): number {
    if (sample.durationMs <= 0) {
      return 0;
    }
    return this.travelDistance(sample) / (sample.durationMs / 1000);
  }

  /**
   * @param sample sample to inspect.
   * @returns true when the sample stays inside the touch slop.
   */
  public isInsideSlop(sample: GestureSample): boolean {
    return this.travelDistance(sample) <= this.thresholds.slopVp;
  }

  /**
   * @param sample sample to inspect.
   * @returns true when the sample is a single pointer press short enough for a tap.
   */
  public isTap(sample: GestureSample): boolean {
    const singlePointer: boolean = sample.pointerCount === 1;
    const shortEnough: boolean = sample.durationMs <= this.thresholds.tapMaxMs;
    const inside: boolean = this.isInsideSlop(sample);
    return singlePointer && shortEnough && inside;
  }

  /**
   * @param sample sample to inspect.
   * @returns true when the sample is a still press that lasted the long press budget.
   */
  public isLongPress(sample: GestureSample): boolean {
    const singlePointer: boolean = sample.pointerCount === 1;
    const longEnough: boolean = sample.durationMs >= this.thresholds.longPressMs;
    return singlePointer && longEnough && this.isInsideSlop(sample);
  }

  /**
   * @param sample sample to inspect.
   * @returns true when the sample is a two finger gesture.
   */
  public isPinch(sample: GestureSample): boolean {
    if (sample.pointerCount !== 2) {
      return false;
    }
    return this.travelDistance(sample) >= this.thresholds.pinchScaleDelta * 100;
  }

  /**
   * @param sample sample to inspect.
   * @returns true when the sample describes two taps inside the double tap window.
   */
  public isDoubleTap(sample: GestureSample): boolean {
    if (sample.secondTapGapMs <= 0) {
      return false;
    }
    if (sample.secondTapGapMs > this.thresholds.doubleTapWindowMs) {
      return false;
    }
    return this.isInsideSlop(sample);
  }

  /**
   * @param sample sample to inspect.
   * @returns true when the sample travels far enough and fast enough to be a fling.
   */
  public isSwipe(sample: GestureSample): boolean {
    if (sample.pointerCount !== 1) {
      return false;
    }
    if (this.isInsideSlop(sample)) {
      return false;
    }
    return this.velocity(sample) >= this.thresholds.flingVelocity;
  }

  /**
   * @param sample sample to inspect.
   * @returns true when the sample leaves the slop without the speed of a fling.
   */
  public isDrag(sample: GestureSample): boolean {
    if (sample.pointerCount !== 1) {
      return false;
    }
    if (this.isInsideSlop(sample)) {
      return false;
    }
    return this.velocity(sample) < this.thresholds.flingVelocity;
  }

  /**
   * Classifies a sample, the order of the checks encodes the precedence of the recognizers.
   *
   * @param sample sample to classify.
   * @returns the gesture kind of the sample.
   */
  public classify(sample: GestureSample): GestureKind {
    if (this.isPinch(sample)) {
      return GestureKind.PINCH;
    }
    if (sample.pointerCount !== 1) {
      return GestureKind.UNKNOWN;
    }
    if (this.isDoubleTap(sample)) {
      return GestureKind.DOUBLE_TAP;
    }
    if (this.isLongPress(sample)) {
      return GestureKind.LONG_PRESS;
    }
    if (this.isTap(sample)) {
      return GestureKind.TAP;
    }
    if (this.isSwipe(sample)) {
      return GestureKind.SWIPE;
    }
    if (this.isDrag(sample)) {
      return GestureKind.DRAG;
    }
    return GestureKind.UNKNOWN;
  }

  /**
   * Explains why a sample was classified the way it was, the text is used by the log lines.
   *
   * @param sample sample to classify.
   * @returns a reason text that carries the decisive threshold.
   */
  public reason(sample: GestureSample): string {
    const distance: number = this.travelDistance(sample);
    const velocity: number = this.velocity(sample);
    if (sample.pointerCount !== 1) {
      return `pointers=${sample.pointerCount}`;
    }
    if (distance > this.thresholds.slopVp) {
      if (velocity >= this.thresholds.flingVelocity) {
        return `travel=${distance.toFixed(1)}vp, velocity=${velocity.toFixed(0)}vp/s`;
      }
      return `travel=${distance.toFixed(1)}vp below fling velocity`;
    }
    return `travel=${distance.toFixed(1)}vp inside slop, duration=${sample.durationMs}ms`;
  }
}

/**
 * The priority that the platform assigns to a recognizer when several of them claim a sample.
 * A higher value wins, an exclusive recognizer wins over every non exclusive one.
 */
class GesturePriority {
  public static readonly LOW: number = 0;
  public static readonly NORMAL: number = 1;
  public static readonly HIGH: number = 2;
  public static readonly EXCLUSIVE: number = 3;

  /**
   * @param kind gesture kind to rank.
   * @returns the priority that the entry page assigns to the recognizer of that kind.
   */
  public static of(kind: GestureKind): number {
    if (kind === GestureKind.LONG_PRESS) {
      return GesturePriority.EXCLUSIVE;
    }
    if (kind === GestureKind.PINCH) {
      return GesturePriority.HIGH;
    }
    if (kind === GestureKind.TAP || kind === GestureKind.DOUBLE_TAP) {
      return GesturePriority.NORMAL;
    }
    if (kind === GestureKind.SWIPE || kind === GestureKind.DRAG) {
      return GesturePriority.LOW;
    }
    return GesturePriority.LOW;
  }
}

/**
 * Resolves the winner when several recognizers report a candidate for the same sample.
 *
 * The rules are the documented ones: the highest priority wins, a tie is broken by the higher
 * confidence, and a full tie is broken by the registration order so that the decision is
 * deterministic.
 */
class GestureConflictResolver {
  private decisions: RecognitionCandidate[] = [];
  private decided: GestureKind = GestureKind.UNKNOWN;

  /**
   * @param candidates candidates in registration order.
   * @returns the winning gesture kind, UNKNOWN when there is no candidate.
   */
  public resolve(candidates: RecognitionCandidate[]): GestureKind {
    this.decisions = [];
    this.decided = GestureKind.UNKNOWN;
    if (candidates.length === 0) {
      return this.decided;
    }
    let winner: RecognitionCandidate = candidates[0];
    this.decisions.push(winner);
    for (let i = 1; i < candidates.length; i++) {
      const current: RecognitionCandidate = candidates[i];
      if (this.outranks(current, winner)) {
        winner = current;
        this.decisions.push(current);
      }
    }
    this.decided = winner.kind;
    return this.decided;
  }

  /**
   * @param challenger candidate that wants to replace the current winner.
   * @param incumbent current winner.
   * @returns true when the challenger wins under the documented rules.
   */
  private outranks(challenger: RecognitionCandidate, incumbent: RecognitionCandidate): boolean {
    if (challenger.priority > incumbent.priority) {
      return true;
    }
    if (challenger.priority < incumbent.priority) {
      return false;
    }
    return challenger.confidence > incumbent.confidence;
  }

  /**
   * @returns the kind that the last resolve call selected.
   */
  public getDecision(): GestureKind {
    return this.decided;
  }

  /**
   * @returns the candidates that replaced the previous winner, in resolution order.
   */
  public getDecisions(): RecognitionCandidate[] {
    return this.decisions.slice();
  }

  /**
   * Builds a candidate list for one sample with the classifier, every accepted recognizer
   * reports the same high confidence so that only the priority decides.
   *
   * @param classifier classifier that judges the sample.
   * @param sample sample to judge.
   * @returns the candidates that claim the sample.
   */
  public static candidatesOf(classifier: GestureClassifier, sample: GestureSample): RecognitionCandidate[] {
    const candidates: RecognitionCandidate[] = [];
    const kind: GestureKind = classifier.classify(sample);
    if (kind === GestureKind.UNKNOWN) {
      return candidates;
    }
    const candidate: RecognitionCandidate = {
      kind: kind,
      confidence: CONFIDENCE_HIGH,
      priority: GesturePriority.of(kind)
    };
    candidates.push(candidate);
    return candidates;
  }
}

/**
 * Decides whether a pointer move belongs to the scroll container or to the item under it.
 *
 * The entry page root is a List with a spring edge effect, so every vertical move competes with
 * the scroll gesture of the container, while a horizontal move on the duration chips must not
 * start a scroll.
 */
class ScrollTapDiscriminator {
  private thresholds: GestureThresholds;

  /**
   * @param thresholds threshold table of the recognizer.
   */
  constructor(thresholds: GestureThresholds = new GestureThresholds()) {
    this.thresholds = thresholds;
  }

  /**
   * @param dx horizontal travel.
   * @param dy vertical travel.
   * @returns true when the vertical travel dominates the horizontal travel.
   */
  public isVerticalDominant(dx: number, dy: number): boolean {
    return Math.abs(dy) > Math.abs(dx) * SCROLL_AXIS_RATIO;
  }

  /**
   * @param dx horizontal travel.
   * @param dy vertical travel.
   * @returns true when the horizontal travel dominates the vertical travel.
   */
  public isHorizontalDominant(dx: number, dy: number): boolean {
    return Math.abs(dx) > Math.abs(dy) * SCROLL_AXIS_RATIO;
  }

  /**
   * @param sample sample to judge.
   * @returns the verdict for the scroll container of the entry page.
   */
  public judge(sample: GestureSample): ScrollVerdict {
    const dx: number = sample.endX - sample.startX;
    const dy: number = sample.endY - sample.startY;
    if (sample.pointerCount !== 1) {
      return ScrollVerdict.IGNORED;
    }
    // A move that stays inside the touch slop never reaches the scroll container, the tapped
    // item keeps the gesture.
    if (this.travelDistance(sample) <= this.thresholds.slopVp) {
      return ScrollVerdict.TAP;
    }
    if (this.isVerticalDominant(dx, dy)) {
      return ScrollVerdict.LIST_SCROLL;
    }
    if (this.isHorizontalDominant(dx, dy)) {
      return ScrollVerdict.ITEM_DRAG;
    }
    return ScrollVerdict.IGNORED;
  }

  /**
   * @param sample sample to measure.
   * @returns the travel distance of the sample.
   */
  public travelDistance(sample: GestureSample): number {
    const dx: number = sample.endX - sample.startX;
    const dy: number = sample.endY - sample.startY;
    return Math.sqrt(dx * dx + dy * dy);
  }

  /**
   * @param sample sample to judge.
   * @returns true when the move must scroll the page list.
   */
  public startsListScroll(sample: GestureSample): boolean {
    return this.judge(sample) === ScrollVerdict.LIST_SCROLL;
  }

  /**
   * @param sample sample to judge.
   * @returns true when the move stays on the item and must reach its click handler.
   */
  public keepsItemTap(sample: GestureSample): boolean {
    return this.judge(sample) === ScrollVerdict.TAP;
  }
}

/**
 * Mirrors the long press timer of the platform. The timer is armed on press down, fires after
 * the long press budget, and is cancelled as soon as the pointer leaves the touch slop.
 */
class LongPressTimer {
  private state: PressTimerState = PressTimerState.IDLE;
  private elapsedMs: number = 0;
  private budgetMs: number = LONG_PRESS_DURATION_MS;
  private slopVp: number = TOUCH_SLOP_VP;
  private fireCount: number = 0;

  /**
   * @param budgetMs duration after which the timer fires.
   * @param slopVp movement that still counts as a still press.
   */
  constructor(budgetMs: number = LONG_PRESS_DURATION_MS, slopVp: number = TOUCH_SLOP_VP) {
    this.budgetMs = budgetMs;
    this.slopVp = slopVp;
  }

  /**
   * Arms the timer at press down.
   *
   * @returns the new state.
   */
  public arm(): PressTimerState {
    this.state = PressTimerState.ARMED;
    this.elapsedMs = 0;
    return this.state;
  }

  /**
   * Advances the timer.
   *
   * @param deltaMs time that passed since the last tick.
   * @returns the new state.
   */
  public tick(deltaMs: number): PressTimerState {
    if (this.state !== PressTimerState.ARMED) {
      return this.state;
    }
    this.elapsedMs += deltaMs;
    if (this.elapsedMs >= this.budgetMs) {
      this.state = PressTimerState.FIRED;
      this.fireCount++;
    }
    return this.state;
  }

  /**
   * Cancels the timer because the pointer moved.
   *
   * @param travelVp travel distance of the pointer.
   * @returns true when the timer was cancelled by this move.
   */
  public onMove(travelVp: number): boolean {
    if (this.state !== PressTimerState.ARMED) {
      return false;
    }
    if (travelVp <= this.slopVp) {
      return false;
    }
    this.state = PressTimerState.CANCELLED;
    return true;
  }

  /**
   * Cancels the timer because the pointer was lifted.
   *
   * @returns true when the timer was still armed.
   */
  public release(): boolean {
    if (this.state !== PressTimerState.ARMED) {
      return false;
    }
    this.state = PressTimerState.CANCELLED;
    return true;
  }

  /**
   * @returns the current state.
   */
  public getState(): PressTimerState {
    return this.state;
  }

  /**
   * @returns the elapsed time since the timer was armed.
   */
  public getElapsedMs(): number {
    return this.elapsedMs;
  }

  /**
   * @returns how often the timer fired since it was created.
   */
  public getFireCount(): number {
    return this.fireCount;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `LongPressTimer{state=${this.state}, elapsed=${this.elapsedMs}ms, fires=${this.fireCount}}`;
  }
}

/**
 * Records the gestures of the suite and derives the recognition statistics.
 */
class GestureRecognitionLog {
  private entries: GestureLogEntry[] = [];
  private sequence: number = 0;

  /**
   * Appends an entry.
   *
   * @param kind gesture kind of the entry.
   * @param recognized true when the gesture was recognized by the page.
   * @param durationMs duration of the gesture.
   * @param reason reason text of the classification.
   * @returns the sequence number of the new entry.
   */
  public add(kind: GestureKind, recognized: boolean, durationMs: number, reason: string): number {
    this.sequence++;
    const entry: GestureLogEntry = {
      seq: this.sequence,
      kind: kind,
      recognized: recognized,
      durationMs: durationMs,
      reason: reason
    };
    this.entries.push(entry);
    return this.sequence;
  }

  /**
   * @returns the number of recorded gestures.
   */
  public count(): number {
    return this.entries.length;
  }

  /**
   * @returns the number of recognized gestures.
   */
  public recognizedCount(): number {
    let recognized: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].recognized) {
        recognized++;
      }
    }
    return recognized;
  }

  /**
   * @returns the recognition rate, zero when nothing was recorded.
   */
  public recognitionRate(): number {
    if (this.entries.length === 0) {
      return 0;
    }
    return this.recognizedCount() / this.entries.length;
  }

  /**
   * @param kind gesture kind to count.
   * @returns the number of entries of that kind.
   */
  public countOf(kind: GestureKind): number {
    let count: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].kind === kind) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns the average gesture duration, zero when nothing was recorded.
   */
  public averageDuration(): number {
    if (this.entries.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      total += this.entries[i].durationMs;
    }
    return total / this.entries.length;
  }

  /**
   * @returns the longest gesture duration, zero when nothing was recorded.
   */
  public longestDuration(): number {
    let longest: number = 0;
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].durationMs > longest) {
        longest = this.entries[i].durationMs;
      }
    }
    return longest;
  }

  /**
   * @returns a copy of the entries.
   */
  public getEntries(): GestureLogEntry[] {
    return this.entries.slice();
  }

  /**
   * Drops every entry.
   */
  public clear(): void {
    this.entries = [];
    this.sequence = 0;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `GestureRecognitionLog{count=${this.entries.length}, ` +
      `recognized=${this.recognizedCount()}, rate=${this.recognitionRate().toFixed(2)}}`;
  }
}

/**
 * Reads the text of a component, an empty string is returned when the read fails because the
 * component dropped out of the tree between the lookup and the read.
 *
 * @param component component to read.
 * @returns the text of the component.
 */
async function readTextSafely(component: Component): Promise<string> {
  try {
    return await getTextSerialized(component);
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'readTextSafely failed: %{public}s', err.message);
    return '';
  }
}

/**
 * Starts the sample and waits until the entry page is rendered.
 *
 * @param driver driver of the running case.
 * @returns true when the entry page is rendered.
 */
async function guardEntryPage(driver: Driver): Promise<boolean> {
  await launchAssessmentApp();
  const rendered: boolean = await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
  if (!rendered) {
    hilog.warn(DOMAIN, TAG, 'guardEntryPage: the entry page is not rendered, the case is skipped');
  }
  return rendered;
}

/**
 * Delivers a swipe through the driver inside the UI operation queue.
 *
 * @param driver driver of the running case.
 * @param fromX start x in pixels.
 * @param fromY start y in pixels.
 * @param toX end x in pixels.
 * @param toY end y in pixels.
 * @returns true when the swipe was delivered.
 */
async function serializedSwipe(driver: Driver, fromX: number, fromY: number, toX: number,
  toY: number): Promise<boolean> {
  try {
    await runSerializedUiOperation(async () => {
      await driver.swipe(fromX, fromY, toX, toY, SWIPE_SPEED_PX_S);
    });
    await serializedDelay(driver, DELAY_TOUCH_EVENT);
    return true;
  } catch (error) {
    const err: Error = error instanceof Error ? error : new Error(String(error));
    hilog.warn(DOMAIN, TAG, 'serializedSwipe failed: %{public}s', err.message);
    return false;
  }
}

/**
 * Clicks a component and measures how long the click took.
 *
 * @param component component to click.
 * @returns the elapsed milliseconds, minus one when the click failed.
 */
async function clickAndMeasure(component: Component | null): Promise<number> {
  if (component === null) {
    return -1;
  }
  const elapsed: number = await measureActionMs(async () => {
    await clickSerialized(component);
  });
  return elapsed;
}

export default function gestureRecognitionTest() {
  describe('GestureRecognition_Test', () => {
    let driver: Driver;
    let thresholds: GestureThresholds;
    let classifier: GestureClassifier;
    let log: GestureRecognitionLog;

    beforeAll(async () => {
      driver = getDriver();
      thresholds = new GestureThresholds();
      classifier = new GestureClassifier(thresholds);
      log = new GestureRecognitionLog();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: a short press that ends inside the touch slop.
     * Expectation: the classifier reports a tap and the sample is not a long press.
     */
    it('Assessment_GestureRecognition_002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_002, begin');
      const sample: GestureSample = GesturePlanner.tap(100, 200);
      expect(classifier.isTap(sample)).assertTrue();
      expect(classifier.isLongPress(sample)).assertFalse();
      expect(classifier.classify(sample)).assertEqual(GestureKind.TAP);
      expect(classifier.travelDistance(sample) <= thresholds.slopVp).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_002, end');
    });

    /**
     * Scenario: a still press that reaches the long press budget.
     * Expectation: the classifier reports a long press, the tap budget is exceeded so the tap
     * recognizer no longer claims the sample.
     */
    it('Assessment_GestureRecognition_003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_003, begin');
      const sample: GestureSample = GesturePlanner.longPress(100, 200, LONG_PRESS_DURATION_MS);
      expect(classifier.isLongPress(sample)).assertTrue();
      expect(classifier.isTap(sample)).assertFalse();
      expect(classifier.classify(sample)).assertEqual(GestureKind.LONG_PRESS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_003, end');
    });

    /**
     * Scenario: a slow move that leaves the touch slop.
     * Expectation: the classifier reports a drag because the velocity stays below the fling
     * threshold.
     */
    it('Assessment_GestureRecognition_004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_004, begin');
      const sample: GestureSample = GesturePlanner.move(100, 200, 0, DRAG_DISTANCE_VP, 800);
      expect(classifier.isDrag(sample)).assertTrue();
      expect(classifier.isSwipe(sample)).assertFalse();
      expect(classifier.classify(sample)).assertEqual(GestureKind.DRAG);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'GestureRecognition_004', classifier.reason(sample));
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_004, end');
    });

    /**
     * Scenario: a fast move that leaves the touch slop.
     * Expectation: the classifier reports a swipe, the velocity is above the fling threshold.
     */
    it('Assessment_GestureRecognition_005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_005, begin');
      const sample: GestureSample = GesturePlanner.move(100, 400, 0, -SWIPE_DISTANCE_VP, 100);
      expect(classifier.isSwipe(sample)).assertTrue();
      expect(classifier.isDrag(sample)).assertFalse();
      expect(classifier.velocity(sample) > thresholds.flingVelocity).assertTrue();
      expect(classifier.classify(sample)).assertEqual(GestureKind.SWIPE);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_005, end');
    });

    /**
     * Scenario: a two finger gesture that spreads the fingers.
     * Expectation: the pinch recognizer claims the sample and the single pointer recognizers
     * stay silent.
     */
    it('Assessment_GestureRecognition_006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_006, begin');
      const sample: GestureSample = GesturePlanner.pinch(200, 300, 60);
      expect(classifier.isPinch(sample)).assertTrue();
      expect(classifier.isTap(sample)).assertFalse();
      expect(classifier.isSwipe(sample)).assertFalse();
      expect(classifier.classify(sample)).assertEqual(GestureKind.PINCH);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_006, end');
    });

    /**
     * Scenario: a second tap that arrives inside the double tap window.
     * Expectation: the sample is classified as a double tap, not as two independent taps.
     */
    it('Assessment_GestureRecognition_007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_007, begin');
      const sample: GestureSample = GesturePlanner.doubleTap(150, 250, 120);
      expect(classifier.isDoubleTap(sample)).assertTrue();
      expect(classifier.classify(sample)).assertEqual(GestureKind.DOUBLE_TAP);
      const later: GestureSample = GesturePlanner.doubleTap(150, 250, DOUBLE_TAP_WINDOW_MS + 1);
      expect(classifier.isDoubleTap(later)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_007, end');
    });

    /**
     * Scenario: a second tap that arrives after the double tap window.
     * Expectation: the sample degrades to a single tap, the double tap recognizer rejects it.
     */
    it('Assessment_GestureRecognition_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_008, begin');
      const sample: GestureSample = GesturePlanner.doubleTap(150, 250, DOUBLE_TAP_WINDOW_MS + 50);
      expect(classifier.isDoubleTap(sample)).assertFalse();
      expect(classifier.isTap(sample)).assertTrue();
      expect(classifier.classify(sample)).assertEqual(GestureKind.TAP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_008, end');
    });

    /**
     * Scenario: a press that starts short but drifts beyond the touch slop.
     * Expectation: the tap recognizer rejects the sample because the travel is out of bounds.
     */
    it('Assessment_GestureRecognition_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_009, begin');
      const sample: GestureSample = GesturePlanner.move(100, 100, 0, TOUCH_SLOP_VP + 12, 100);
      expect(classifier.isInsideSlop(sample)).assertFalse();
      expect(classifier.isTap(sample)).assertFalse();
      expect(classifier.travelDistance(sample) > thresholds.slopVp).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_009, end');
    });

    /**
     * Scenario: the travel distance of a diagonal move.
     * Expectation: the distance follows the euclidean norm, a three four five triangle yields
     * exactly five units of travel.
     */
    it('Assessment_GestureRecognition_010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_010, begin');
      const sample: GestureSample = GesturePlanner.move(0, 0, 3, 4, 100);
      expect(Math.abs(classifier.travelDistance(sample) - 5) < 0.001).assertTrue();
      const straight: GestureSample = GesturePlanner.move(0, 0, 10, 0, 100);
      expect(Math.abs(classifier.travelDistance(straight) - 10) < 0.001).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_010, end');
    });

    /**
     * Scenario: the velocity of a sample with a zero duration.
     * Expectation: the velocity guard returns zero instead of dividing by zero.
     */
    it('Assessment_GestureRecognition_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_011, begin');
      const sample: GestureSample = GesturePlanner.move(0, 0, 100, 0, 0);
      expect(classifier.velocity(sample)).assertEqual(0);
      expect(classifier.isSwipe(sample)).assertFalse();
      const negative: GestureSample = GesturePlanner.move(0, 0, 100, 0, -50);
      expect(classifier.velocity(negative)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_011, end');
    });

    /**
     * Scenario: the long press timer is armed by a press down.
     * Expectation: the timer leaves the idle state and reports no elapsed time.
     */
    it('Assessment_GestureRecognition_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_012, begin');
      const timer: LongPressTimer = new LongPressTimer();
      expect(timer.getState()).assertEqual(PressTimerState.IDLE);
      timer.arm();
      expect(timer.getState()).assertEqual(PressTimerState.ARMED);
      expect(timer.getElapsedMs()).assertEqual(0);
      expect(timer.getFireCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'GestureRecognition_012', timer.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_012, end');
    });

    /**
     * Scenario: the long press timer reaches its budget in steps.
     * Expectation: the timer fires exactly once when the elapsed time reaches five hundred
     * milliseconds and further ticks do not fire it again.
     */
    it('Assessment_GestureRecognition_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_013, begin');
      const timer: LongPressTimer = new LongPressTimer();
      timer.arm();
      for (let i = 0; i < 4; i++) {
        timer.tick(100);
        expect(timer.getState()).assertEqual(PressTimerState.ARMED);
      }
      timer.tick(100);
      expect(timer.getState()).assertEqual(PressTimerState.FIRED);
      timer.tick(100);
      expect(timer.getFireCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'GestureRecognition_013', timer.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_013, end');
    });

    /**
     * Scenario: the pointer leaves the touch slop before the long press budget expires.
     * Expectation: the timer cancels, so the press becomes a drag instead of a long press.
     */
    it('Assessment_GestureRecognition_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_014, begin');
      const timer: LongPressTimer = new LongPressTimer();
      timer.arm();
      timer.tick(200);
      const cancelled: boolean = timer.onMove(TOUCH_SLOP_VP + 6);
      expect(cancelled).assertTrue();
      expect(timer.getState()).assertEqual(PressTimerState.CANCELLED);
      timer.tick(1000);
      expect(timer.getFireCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_014, end');
    });

    /**
     * Scenario: a small jitter inside the touch slop while the timer is armed.
     * Expectation: the timer stays armed because the move does not leave the slop.
     */
    it('Assessment_GestureRecognition_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_015, begin');
      const timer: LongPressTimer = new LongPressTimer();
      timer.arm();
      expect(timer.onMove(TOUCH_SLOP_VP - 1)).assertFalse();
      expect(timer.getState()).assertEqual(PressTimerState.ARMED);
      timer.tick(LONG_PRESS_DURATION_MS);
      expect(timer.getState()).assertEqual(PressTimerState.FIRED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_015, end');
    });

    /**
     * Scenario: the timer is released before it fires.
     * Expectation: the release cancels the timer and a second release reports that there was
     * nothing left to cancel.
     */
    it('Assessment_GestureRecognition_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_016, begin');
      const timer: LongPressTimer = new LongPressTimer();
      timer.arm();
      expect(timer.release()).assertTrue();
      expect(timer.release()).assertFalse();
      expect(timer.getState()).assertEqual(PressTimerState.CANCELLED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_016, end');
    });

    /**
     * Scenario: the priority table of the recognizers.
     * Expectation: long press is exclusive and outranks the pinch, which in turn outranks the
     * tap and the swipe recognizers.
     */
    it('Assessment_GestureRecognition_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_017, begin');
      expect(GesturePriority.of(GestureKind.LONG_PRESS)).assertEqual(GesturePriority.EXCLUSIVE);
      expect(GesturePriority.of(GestureKind.PINCH)).assertEqual(GesturePriority.HIGH);
      expect(GesturePriority.of(GestureKind.TAP)).assertEqual(GesturePriority.NORMAL);
      expect(GesturePriority.of(GestureKind.DOUBLE_TAP)).assertEqual(GesturePriority.NORMAL);
      expect(GesturePriority.of(GestureKind.SWIPE)).assertEqual(GesturePriority.LOW);
      expect(GesturePriority.of(GestureKind.DRAG)).assertEqual(GesturePriority.LOW);
      expect(GesturePriority.of(GestureKind.UNKNOWN)).assertEqual(GesturePriority.LOW);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_017, end');
    });

    /**
     * Scenario: two candidates share the priority but differ in confidence.
     * Expectation: the resolver picks the more confident candidate.
     */
    it('Assessment_GestureRecognition_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_018, begin');
      const resolver: GestureConflictResolver = new GestureConflictResolver();
      const candidates: RecognitionCandidate[] = [
        { kind: GestureKind.TAP, confidence: CONFIDENCE_LOW, priority: GesturePriority.NORMAL },
        { kind: GestureKind.DOUBLE_TAP, confidence: CONFIDENCE_HIGH, priority: GesturePriority.NORMAL }
      ];
      expect(resolver.resolve(candidates)).assertEqual(GestureKind.DOUBLE_TAP);
      expect(resolver.getDecisions().length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_018, end');
    });

    /**
     * Scenario: a confident low priority candidate competes with a low confidence high
     * priority candidate.
     * Expectation: the priority wins over the confidence, which is the documented rule.
     */
    it('Assessment_GestureRecognition_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_019, begin');
      const resolver: GestureConflictResolver = new GestureConflictResolver();
      const candidates: RecognitionCandidate[] = [
        { kind: GestureKind.SWIPE, confidence: 1, priority: GesturePriority.LOW },
        { kind: GestureKind.LONG_PRESS, confidence: CONFIDENCE_LOW, priority: GesturePriority.EXCLUSIVE }
      ];
      expect(resolver.resolve(candidates)).assertEqual(GestureKind.LONG_PRESS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_019, end');
    });

    /**
     * Scenario: an identical priority and confidence pair.
     * Expectation: the first registered candidate keeps the decision, so the resolution is
     * deterministic for repeated runs.
     */
    it('Assessment_GestureRecognition_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_020, begin');
      const resolver: GestureConflictResolver = new GestureConflictResolver();
      const candidates: RecognitionCandidate[] = [
        { kind: GestureKind.TAP, confidence: CONFIDENCE_HIGH, priority: GesturePriority.NORMAL },
        { kind: GestureKind.DOUBLE_TAP, confidence: CONFIDENCE_HIGH, priority: GesturePriority.NORMAL }
      ];
      expect(resolver.resolve(candidates)).assertEqual(GestureKind.TAP);
      expect(resolver.getDecision()).assertEqual(GestureKind.TAP);
      expect(resolver.getDecisions().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_020, end');
    });

    /**
     * Scenario: the resolver is handed an empty candidate list.
     * Expectation: the decision stays unknown and no decision is recorded.
     */
    it('Assessment_GestureRecognition_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_021, begin');
      const resolver: GestureConflictResolver = new GestureConflictResolver();
      expect(resolver.resolve([])).assertEqual(GestureKind.UNKNOWN);
      expect(resolver.getDecision()).assertEqual(GestureKind.UNKNOWN);
      expect(resolver.getDecisions().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_021, end');
    });

    /**
     * Scenario: candidates are built from a classified sample.
     * Expectation: a tap sample produces exactly one tap candidate with the normal priority.
     */
    it('Assessment_GestureRecognition_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_022, begin');
      const candidates: RecognitionCandidate[] =
        GestureConflictResolver.candidatesOf(classifier, GesturePlanner.tap(10, 10));
      expect(candidates.length).assertEqual(1);
      expect(candidates[0].kind).assertEqual(GestureKind.TAP);
      expect(candidates[0].priority).assertEqual(GesturePriority.NORMAL);
      const unknown: RecognitionCandidate[] =
        GestureConflictResolver.candidatesOf(classifier, GesturePlanner.pinch(0, 0, 1));
      expect(unknown.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_022, end');
    });

    /**
     * Scenario: a vertical pointer move over the entry page list.
     * Expectation: the discriminator hands the move to the scroll container, not to the item.
     */
    it('Assessment_GestureRecognition_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_023, begin');
      const discriminator: ScrollTapDiscriminator = new ScrollTapDiscriminator();
      const sample: GestureSample = GesturePlanner.move(200, 500, 6, -SWIPE_DISTANCE_VP, 120);
      expect(discriminator.startsListScroll(sample)).assertTrue();
      expect(discriminator.keepsItemTap(sample)).assertFalse();
      expect(discriminator.judge(sample)).assertEqual(ScrollVerdict.LIST_SCROLL);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_023, end');
    });

    /**
     * Scenario: a horizontal move over the duration chip row.
     * Expectation: the move is reported as an item drag so that the list must not scroll.
     */
    it('Assessment_GestureRecognition_024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_024, begin');
      const discriminator: ScrollTapDiscriminator = new ScrollTapDiscriminator();
      const sample: GestureSample = GesturePlanner.move(300, 240, SWIPE_DISTANCE_VP, 4, 200);
      expect(discriminator.startsListScroll(sample)).assertFalse();
      expect(discriminator.judge(sample)).assertEqual(ScrollVerdict.ITEM_DRAG);
      expect(discriminator.isHorizontalDominant(SWIPE_DISTANCE_VP, 4)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_024, end');
    });

    /**
     * Scenario: a still press on a whitelist row.
     * Expectation: the discriminator keeps the tap so that the remove button receives it.
     */
    it('Assessment_GestureRecognition_025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_025, begin');
      const discriminator: ScrollTapDiscriminator = new ScrollTapDiscriminator();
      const sample: GestureSample = GesturePlanner.tap(320, 700);
      expect(discriminator.keepsItemTap(sample)).assertTrue();
      expect(discriminator.judge(sample)).assertEqual(ScrollVerdict.TAP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_025, end');
    });

    /**
     * Scenario: a two finger move over the list.
     * Expectation: the discriminator ignores it because the list only handles single pointer
     * scrolling.
     */
    it('Assessment_GestureRecognition_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_026, begin');
      const discriminator: ScrollTapDiscriminator = new ScrollTapDiscriminator();
      const sample: GestureSample = GesturePlanner.pinch(200, 400, 40);
      expect(discriminator.judge(sample)).assertEqual(ScrollVerdict.IGNORED);
      expect(discriminator.startsListScroll(sample)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_026, end');
    });

    /**
     * Scenario: a diagonal move that fits neither axis rule.
     * Expectation: the move leaves the slop but is neither a scroll nor an item drag.
     */
    it('Assessment_GestureRecognition_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_027, begin');
      const discriminator: ScrollTapDiscriminator = new ScrollTapDiscriminator();
      const sample: GestureSample = GesturePlanner.move(100, 100, 60, 60, 300);
      expect(discriminator.isVerticalDominant(60, 60)).assertFalse();
      expect(discriminator.isHorizontalDominant(60, 60)).assertFalse();
      expect(discriminator.judge(sample)).assertEqual(ScrollVerdict.IGNORED);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_027, end');
    });

    /**
     * Scenario: the recognition log of a mixed gesture burst.
     * Expectation: the rate, the counts and the duration statistics follow the recorded
     * entries exactly.
     */
    it('Assessment_GestureRecognition_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_028, begin');
      log.clear();
      log.add(GestureKind.TAP, true, 80, 'tap');
      log.add(GestureKind.SWIPE, true, 120, 'swipe');
      log.add(GestureKind.PINCH, false, 400, 'pinch');
      expect(log.count()).assertEqual(3);
      expect(log.recognizedCount()).assertEqual(2);
      expect(log.averageDuration()).assertEqual(200);
      expect(log.longestDuration()).assertEqual(400);
      expect(Math.abs(log.recognitionRate() - 2 / 3) < 0.0001).assertTrue();
      expect(log.countOf(GestureKind.TAP)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'GestureRecognition_028', log.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_028, end');
    });

    /**
     * Scenario: the recognition log is cleared.
     * Expectation: every counter resets to zero and the description is stable.
     */
    it('Assessment_GestureRecognition_029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_029, begin');
      log.clear();
      log.add(GestureKind.DRAG, true, 300, 'drag');
      expect(log.count()).assertEqual(1);
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.recognizedCount()).assertEqual(0);
      expect(log.recognitionRate()).assertEqual(0);
      expect(log.averageDuration()).assertEqual(0);
      expect(log.getEntries().length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_029, end');
    });

    /**
     * Scenario: a press that lasts exactly the tap budget.
     * Expectation: the boundary is inclusive, so the press is still classified as a tap.
     */
    it('Assessment_GestureRecognition_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_030, begin');
      const sample: GestureSample = {
        startX: 0,
        startY: 0,
        endX: 0,
        endY: 0,
        durationMs: TAP_MAX_DURATION_MS,
        pointerCount: 1,
        secondTapGapMs: 0
      };
      expect(classifier.isTap(sample)).assertTrue();
      expect(classifier.classify(sample)).assertEqual(GestureKind.TAP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_030, end');
    });

    /**
     * Scenario: a press one millisecond above the tap budget that stays inside the slop.
     * Expectation: the sample is neither a tap nor a long press, so the classifier reports an
     * unknown gesture.
     */
    it('Assessment_GestureRecognition_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_031, begin');
      const sample: GestureSample = {
        startX: 0,
        startY: 0,
        endX: 0,
        endY: 0,
        durationMs: TAP_MAX_DURATION_MS + 1,
        pointerCount: 1,
        secondTapGapMs: 0
      };
      expect(classifier.isTap(sample)).assertFalse();
      expect(classifier.isLongPress(sample)).assertFalse();
      expect(classifier.classify(sample)).assertEqual(GestureKind.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_031, end');
    });

    /**
     * Scenario: a press that lasts exactly the long press budget.
     * Expectation: the boundary is inclusive again, the sample is a long press.
     */
    it('Assessment_GestureRecognition_032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_032, begin');
      const sample: GestureSample = GesturePlanner.longPress(40, 40, LONG_PRESS_DURATION_MS);
      expect(sample.durationMs).assertEqual(LONG_PRESS_DURATION_MS);
      expect(classifier.isLongPress(sample)).assertTrue();
      expect(classifier.classify(sample)).assertEqual(GestureKind.LONG_PRESS);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_032, end');
    });

    /**
     * Scenario: a move exactly at the fling velocity threshold.
     * Expectation: the boundary is inclusive, so the move is a swipe rather than a drag.
     */
    it('Assessment_GestureRecognition_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_033, begin');
      const sample: GestureSample = GesturePlanner.move(0, 0, 0, 40, 200);
      expect(Math.abs(classifier.velocity(sample) - thresholds.flingVelocity) < 0.001).assertTrue();
      expect(classifier.isSwipe(sample)).assertTrue();
      expect(classifier.isDrag(sample)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_033, end');
    });

    /**
     * Scenario: a move just below the fling velocity threshold.
     * Expectation: the sample is a drag, which is the gesture that the list uses for a slow
     * scroll drag.
     */
    it('Assessment_GestureRecognition_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_034, begin');
      const sample: GestureSample = GesturePlanner.move(0, 0, 0, 40, 210);
      expect(classifier.velocity(sample) < thresholds.flingVelocity).assertTrue();
      expect(classifier.isDrag(sample)).assertTrue();
      expect(classifier.classify(sample)).assertEqual(GestureKind.DRAG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_034, end');
    });

    /**
     * Scenario: a three finger gesture.
     * Expectation: the classifier reports an unknown gesture because no recognizer of the page
     * handles three pointers.
     */
    it('Assessment_GestureRecognition_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_035, begin');
      const sample: GestureSample = {
        startX: 100,
        startY: 100,
        endX: 120,
        endY: 120,
        durationMs: 200,
        pointerCount: 3,
        secondTapGapMs: 0
      };
      expect(classifier.isPinch(sample)).assertFalse();
      expect(classifier.classify(sample)).assertEqual(GestureKind.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_035, end');
    });

    /**
     * Scenario: a tighter threshold table is handed to a second classifier.
     * Expectation: the same sample that is a tap under the default table becomes a long press
     * under a table with a lower long press budget.
     */
    it('Assessment_GestureRecognition_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_036, begin');
      const tight: GestureThresholds = new GestureThresholds();
      tight.longPressMs = 150;
      const tightClassifier: GestureClassifier = new GestureClassifier(tight);
      const sample: GestureSample = {
        startX: 0,
        startY: 0,
        endX: 0,
        endY: 0,
        durationMs: 180,
        pointerCount: 1,
        secondTapGapMs: 0
      };
      expect(classifier.isLongPress(sample)).assertFalse();
      expect(tightClassifier.isLongPress(sample)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_036, end');
    });

    /**
     * Scenario: a copy of the threshold table is mutated.
     * Expectation: the original table keeps its values, so the shared default cannot be
     * corrupted by a single case.
     */
    it('Assessment_GestureRecognition_037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_037, begin');
      const copy: GestureThresholds = thresholds.copy();
      copy.slopVp = 40;
      copy.tapMaxMs = 900;
      expect(thresholds.slopVp).assertEqual(TOUCH_SLOP_VP);
      expect(thresholds.tapMaxMs).assertEqual(TAP_MAX_DURATION_MS);
      expect(copy.slopVp).assertEqual(40);
      expect(copy.isValid()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'GestureRecognition_037', copy.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_037, end');
    });

    /**
     * Scenario: the reason text of a classification.
     * Expectation: a swipe reason carries the travel and the velocity, a tap reason carries the
     * duration.
     */
    it('Assessment_GestureRecognition_038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_038, begin');
      const swipeReason: string = classifier.reason(GesturePlanner.move(0, 0, 0, -120, 100));
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'GestureRecognition_038', swipeReason);
      expect(swipeReason.indexOf('velocity') >= 0).assertTrue();
      const tapReason: string = classifier.reason(GesturePlanner.tap(5, 5));
      expect(tapReason.indexOf('inside slop') >= 0).assertTrue();
      expect(tapReason.indexOf('duration') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_038, end');
    });

    /**
     * Scenario: the pinch recognizer is judged against the scale delta.
     * Expectation: a small two finger travel below the scale delta is rejected while a large
     * one is accepted.
     */
    it('Assessment_GestureRecognition_039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_039, begin');
      const small: GestureSample = GesturePlanner.pinch(100, 100, 2);
      const large: GestureSample = GesturePlanner.pinch(100, 100, 80);
      expect(classifier.isPinch(small)).assertFalse();
      expect(classifier.isPinch(large)).assertTrue();
      expect(classifier.classify(large)).assertEqual(GestureKind.PINCH);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_039, end');
    });

    /**
     * Scenario: a gesture sequence is replayed against the log.
     * Expectation: the log records the same number of entries as the sequence and the rate is
     * one because every sample is classified.
     */
    it('Assessment_GestureRecognition_046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_046, begin');
      log.clear();
      const samples: GestureSample[] = [
        GesturePlanner.tap(10, 10),
        GesturePlanner.longPress(20, 20),
        GesturePlanner.move(0, 0, 0, -120, 100),
        GesturePlanner.pinch(0, 0, 60)
      ];
      for (let i = 0; i < samples.length; i++) {
        const kind: GestureKind = classifier.classify(samples[i]);
        log.add(kind, kind !== GestureKind.UNKNOWN, samples[i].durationMs,
          classifier.reason(samples[i]));
      }
      expect(log.count()).assertEqual(4);
      expect(log.recognitionRate()).assertEqual(1);
      expect(log.countOf(GestureKind.TAP)).assertEqual(1);
      expect(log.countOf(GestureKind.PINCH)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'GestureRecognition_046', log.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_046, end');
    });

    /**
     * Scenario: the same gesture is replayed on the running page three times.
     * Expectation: the classification is stable across replays, which is what the interaction
     * audit needs to compare runs.
     */
    it('Assessment_GestureRecognition_050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_050, begin');
      const sample: GestureSample = GesturePlanner.move(0, 0, 0, 40, 210);
      const first: GestureKind = classifier.classify(sample);
      const second: GestureKind = classifier.classify(sample);
      const third: GestureKind = classifier.classify(sample);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual(GestureKind.DRAG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_050, end');
    });

    /**
     * Scenario: the priority of an unknown gesture.
     * Expectation: an unknown gesture shares the lowest priority, so it never wins a conflict.
     */
    it('Assessment_GestureRecognition_054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_054, begin');
      const resolver: GestureConflictResolver = new GestureConflictResolver();
      const candidates: RecognitionCandidate[] = [
        { kind: GestureKind.UNKNOWN, confidence: 1, priority: GesturePriority.of(GestureKind.UNKNOWN) },
        { kind: GestureKind.TAP, confidence: CONFIDENCE_LOW, priority: GesturePriority.NORMAL }
      ];
      expect(resolver.resolve(candidates)).assertEqual(GestureKind.TAP);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_054, end');
    });

    /**
     * Scenario: the resolver is called twice with different candidate lists.
     * Expectation: the second call replaces the recorded decision instead of appending to it.
     */
    it('Assessment_GestureRecognition_055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_055, begin');
      const resolver: GestureConflictResolver = new GestureConflictResolver();
      const first: RecognitionCandidate[] = [
        { kind: GestureKind.TAP, confidence: CONFIDENCE_HIGH, priority: GesturePriority.NORMAL }
      ];
      expect(resolver.resolve(first)).assertEqual(GestureKind.TAP);
      const second: RecognitionCandidate[] = [
        { kind: GestureKind.SWIPE, confidence: CONFIDENCE_HIGH, priority: GesturePriority.LOW }
      ];
      expect(resolver.resolve(second)).assertEqual(GestureKind.SWIPE);
      expect(resolver.getDecisions().length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_055, end');
    });

    /**
     * Scenario: the touch slop guard of the discriminator for a move right at the boundary.
     * Expectation: a move exactly at the slop is still a tap, one unit further is not.
     */
    it('Assessment_GestureRecognition_056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_056, begin');
      const discriminator: ScrollTapDiscriminator = new ScrollTapDiscriminator();
      const atBoundary: GestureSample = GesturePlanner.move(0, 0, TOUCH_SLOP_VP, 0, 100);
      const beyond: GestureSample = GesturePlanner.move(0, 0, TOUCH_SLOP_VP + 1, 0, 100);
      expect(discriminator.travelDistance(atBoundary)).assertEqual(TOUCH_SLOP_VP);
      expect(discriminator.judge(atBoundary)).assertEqual(ScrollVerdict.TAP);
      expect(discriminator.judge(beyond)).assertEqual(ScrollVerdict.ITEM_DRAG);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_056, end');
    });

    /**
     * Scenario: the log description is used in a triage.
     * Expectation: the description carries the entry count, the recognized count and the rate.
     */
    it('Assessment_GestureRecognition_057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_057, begin');
      log.clear();
      log.add(GestureKind.TAP, true, 80, 'tap');
      log.add(GestureKind.TAP, true, 90, 'tap');
      log.add(GestureKind.DRAG, false, 400, 'drag');
      const text: string = log.toString();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'GestureRecognition_057', text);
      expect(text.indexOf('count=3') >= 0).assertTrue();
      expect(text.indexOf('recognized=2') >= 0).assertTrue();
      expect(log.getEntries()[2].recognized).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'GestureRecognition_057, end');
    });
  });
}

/**
 * Counts the remove buttons of the whitelist, every whitelist entry carries exactly one. The
 * helper is the coarse signal that a burst of taps did not grow the list.
 *
 * @returns the number of rendered remove buttons.
 */
async function countRemoveButtons(driver: Driver): Promise<number> {
  const buttons: Component[] = await findComponentsByType(driver, 'Button');
  let count: number = 0;
  for (let i = 0; i < buttons.length; i++) {
    const content: string = await readTextSafely(buttons[i]);
    if (content === 'Remove') {
      count++;
    }
  }
  return count;
}
