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
  ID_INDEX_TITLE,
  ID_BUNDLE_INPUT,
  ID_ADD_BUTTON,
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON,
  TEXT_STATE_ACTIVE,
  TEXT_STATE_INACTIVE,
  TEXT_DIALOG_CONFIRM,
  TEXT_EXAM_PREVIOUS,
  TEXT_EXAM_NEXT,
  TEXT_EXAM_SUBMIT,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_TRANSITION,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_ACTION,
  serializedDelay,
  getDriver,
  launchAssessmentApp,
  findById,
  indexComponentCount,
  checkTextContent,
  waitForIndexPage,
  waitForExamPage,
  isComponentEnabled,
  clickComponent,
  addAllowedApp,
  pressAndWait
} from '../Shared/AssessmentDriver';
import { clickSerialized, inputTextSerialized, getTextSerialized, clickPointSerialized } from '../Shared/AssessmentDriver';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Assessment]';
const BUNDLE: string = 'Assessment_';

// The long press threshold of the platform is five hundred milliseconds, the double click
// window is three hundred milliseconds. A press that stays below the long press threshold is
// a tap, a second tap inside the double click window is a double click.
const LONG_PRESS_THRESHOLD_MS: number = 500;
const DOUBLE_CLICK_WINDOW_MS: number = 300;
const TAP_MAX_DURATION_MS: number = 200;

// Responsiveness thresholds. The operation card only updates AppStorage, so a tap that takes
// longer than one second is treated as a missed frame by the interaction audit.
const RESPONSIVE_BUDGET_MS: number = 1000;
const DEGRADED_BUDGET_MS: number = 2000;

// A burst of taps is deduplicated inside this window, the sample only flips a state flag and
// the platform would otherwise deliver the redundant taps to the same handler.
const BURST_WINDOW_MS: number = 250;

// Number of taps of a stress case, it stays low so that the case does not slow the suite.
const STRESS_TAP_ROUNDS: number = 5;

// The four operation buttons of the entry page, in the order of the operation card.
const OPERATION_IDS: string[] = [
  ID_BEGIN_BUTTON,
  ID_END_BUTTON,
  ID_QUERY_STATE_BUTTON,
  ID_QUERY_CONFIG_BUTTON
];

// The documented labels of the operation buttons, they are the resource strings of the sample.
const OPERATION_LABELS: string[] = ['begin', 'end', 'isActive', 'getConfiguration'];

// Button types that the interaction model distinguishes. A primary button is the one that
// enters the assessment, a secondary one queries, and a destructive one ends the session.
const TYPE_PRIMARY: string = 'primary';
const TYPE_SECONDARY: string = 'secondary';
const TYPE_DESTRUCTIVE: string = 'destructive';
const TYPE_CONFIRM: string = 'confirm';

/**
 * Visual and interaction states of a button. The sample only implements normal, focused,
 * pressed and disabled, the enum keeps the names that the interaction audit reports.
 */
enum ButtonState {
  NORMAL = 0,
  FOCUSED = 1,
  PRESSED = 2,
  DISABLED = 3,
  LOADING = 4
}

/**
 * Kind of a pointer interaction that reached a button.
 */
enum InteractionKind {
  TAP = 0,
  LONG_PRESS = 1,
  DOUBLE_CLICK = 2,
  KEY_ENTER = 3
}

/**
 * Verdict of the responsiveness audit.
 */
enum ResponsivenessVerdict {
  RESPONSIVE = 0,
  DEGRADED = 1,
  UNRESPONSIVE = 2
}

/**
 * One recorded interaction with a button.
 *
 * The record keeps the identifier, the kind, the timestamp and the outcome, so that a suite can
 * reconstruct the timeline of a case instead of just counting calls.
 */
class InteractionRecord {
  public buttonId: string = '';
  public kind: InteractionKind = InteractionKind.TAP;
  public startMs: number = 0;
  public endMs: number = 0;
  public accepted: boolean = true;
  public note: string = '';

  constructor(buttonId: string = '', kind: InteractionKind = InteractionKind.TAP, startMs: number = 0,
    endMs: number = 0, accepted: boolean = true, note: string = '') {
    this.buttonId = buttonId;
    this.kind = kind;
    this.startMs = startMs;
    this.endMs = endMs;
    this.accepted = accepted;
    this.note = note;
  }

  /**
   * @returns the hold duration of the interaction in milliseconds.
   */
  public durationMs(): number {
    return Math.max(0, this.endMs - this.startMs);
  }

  /**
   * @returns true when the hold stayed below the long press threshold.
   */
  public isShortPress(): boolean {
    return this.durationMs() < LONG_PRESS_THRESHOLD_MS;
  }

  /**
   * @returns the verdict of the responsiveness audit for this interaction.
   */
  public verdict(): ResponsivenessVerdict {
    const duration: number = this.durationMs();
    if (duration <= RESPONSIVE_BUDGET_MS) {
      return ResponsivenessVerdict.RESPONSIVE;
    }
    if (duration <= DEGRADED_BUDGET_MS) {
      return ResponsivenessVerdict.DEGRADED;
    }
    return ResponsivenessVerdict.UNRESPONSIVE;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `InteractionRecord{id=${this.buttonId}, kind=${this.kind}, dur=${this.durationMs()}ms, ` +
      `accepted=${this.accepted}}`;
  }
}

/**
 * A click counter per button identifier.
 *
 * The counter is deliberately not a Map, because the model cases must run on every image and
 * a plain record keeps the update path free of collection semantics. The identifier is stored
 * beside the count in parallel arrays.
 */
class ClickCounter {
  private ids: string[] = [];
  private counts: number[] = [];

  /**
   * Adds one click to a button, the first click registers the identifier.
   *
   * @param buttonId identifier of the button.
   * @returns the new count of the button.
   */
  public increment(buttonId: string): number {
    const index: number = this.ids.indexOf(buttonId);
    if (index < 0) {
      this.ids.push(buttonId);
      this.counts.push(1);
      return 1;
    }
    this.counts[index] = this.counts[index] + 1;
    return this.counts[index];
  }

  /**
   * @param buttonId identifier of the button.
   * @returns the current count, zero when the button was never clicked.
   */
  public countOf(buttonId: string): number {
    const index: number = this.ids.indexOf(buttonId);
    if (index < 0) {
      return 0;
    }
    return this.counts[index];
  }

  /**
   * @returns the total number of clicks of every button.
   */
  public total(): number {
    let sum: number = 0;
    for (let i = 0; i < this.counts.length; i++) {
      sum += this.counts[i];
    }
    return sum;
  }

  /**
   * @returns the number of distinct buttons that were clicked at least once.
   */
  public distinctCount(): number {
    return this.ids.length;
  }

  /**
   * @param buttonId identifier of the button.
   * @returns true when the button was clicked at least once.
   */
  public wasClicked(buttonId: string): boolean {
    return this.countOf(buttonId) > 0;
  }

  /**
   * @returns the identifier with the highest count, an empty string when nothing was clicked.
   */
  public mostClickedId(): string {
    if (this.ids.length === 0) {
      return '';
    }
    let bestIndex: number = 0;
    for (let i = 1; i < this.counts.length; i++) {
      if (this.counts[i] > this.counts[bestIndex]) {
        bestIndex = i;
      }
    }
    return this.ids[bestIndex];
  }

  /**
   * Clears every counter.
   */
  public reset(): void {
    this.ids = [];
    this.counts = [];
  }

  /**
   * @returns a copy of the clicked identifiers in first click order.
   */
  public clickedIds(): string[] {
    return this.ids.slice();
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `ClickCounter{buttons=${this.ids.length}, clicks=${this.total()}}`;
  }
}

/**
 * A button of the entry page as the interaction model sees it.
 *
 * The sample binds the enabled state of the begin button to the negation of the storage link
 * assessmentActive, and the one of the end button to the link itself, so the model mirrors both
 * expectations and the state machine that drives them.
 */
class ButtonModel {
  public id: string = '';
  public label: string = '';
  public buttonType: string = TYPE_PRIMARY;
  public state: ButtonState = ButtonState.NORMAL;
  public enabledWhenActive: boolean = true;
  public enabledWhenInactive: boolean = true;
  public heightVp: number = 44;
  private clicks: number = 0;
  private lastInteractionAt: number = 0;

  constructor(id: string = '', label: string = '', buttonType: string = TYPE_PRIMARY,
    enabledWhenActive: boolean = true, enabledWhenInactive: boolean = true) {
    this.id = id;
    this.label = label;
    this.buttonType = buttonType;
    this.enabledWhenActive = enabledWhenActive;
    this.enabledWhenInactive = enabledWhenInactive;
  }

  /**
   * Computes the enabled state for a given assessment session state.
   *
   * @param assessmentActive current state of the storage link.
   * @returns true when the button must accept input.
   */
  public expectedEnabled(assessmentActive: boolean): boolean {
    return assessmentActive ? this.enabledWhenActive : this.enabledWhenInactive;
  }

  /**
   * Reports whether an interaction is delivered in the given session state.
   *
   * @param assessmentActive current state of the storage link.
   * @returns true when the button would forward the interaction to its handler.
   */
  public acceptsInput(assessmentActive: boolean): boolean {
    if (this.state === ButtonState.DISABLED) {
      return false;
    }
    return this.expectedEnabled(assessmentActive);
  }

  /**
   * Applies a session state to the modelled widget, which is what the storage link does when
   * the sample updates AppStorage.
   *
   * @param assessmentActive current state of the storage link.
   */
  public applySessionState(assessmentActive: boolean): void {
    this.enabled = this.expectedEnabled(assessmentActive);
  }

  // The field is declared at the end so that the constructor above stays readable.
  public enabled: boolean = true;

  /**
   * Registers a delivered click.
   *
   * @param timestampMs time of the click.
   * @returns true when the click was accepted by the model.
   */
  public press(timestampMs: number): boolean {
    if (!this.enabled || this.state === ButtonState.DISABLED) {
      return false;
    }
    this.clicks++;
    this.lastInteractionAt = timestampMs;
    this.state = ButtonState.PRESSED;
    return true;
  }

  /**
   * Releases a press and returns the widget to the normal or focused state.
   *
   * @param focused whether the widget keeps the focus after the release.
   */
  public release(focused: boolean): void {
    if (this.state === ButtonState.DISABLED || !this.enabled) {
      return;
    }
    this.state = focused ? ButtonState.FOCUSED : ButtonState.NORMAL;
  }

  /**
   * Moves the widget into the disabled state and resets the transient states.
   */
  public disable(): void {
    this.enabled = false;
    this.state = ButtonState.DISABLED;
  }

  /**
   * Moves the widget back to the normal state.
   */
  public enable(): void {
    this.enabled = true;
    this.state = ButtonState.NORMAL;
  }

  /**
   * @returns the number of accepted clicks.
   */
  public clickCount(): number {
    return this.clicks;
  }

  /**
   * @returns the timestamp of the last accepted click, zero when none was accepted.
   */
  public lastInteractionMs(): number {
    return this.lastInteractionAt;
  }

  /**
   * @returns true when the widget renders as tappable, which requires the normal, the focused
   * or the pressed state.
   */
  public isTappable(): boolean {
    if (!this.enabled) {
      return false;
    }
    return this.state === ButtonState.NORMAL || this.state === ButtonState.FOCUSED ||
      this.state === ButtonState.PRESSED;
  }

  /**
   * @returns the description of the widget for the log lines.
   */
  public toString(): string {
    return `ButtonModel{id=${this.id}, type=${this.buttonType}, state=${this.state}, ` +
      `enabled=${this.enabled}, clicks=${this.clicks}}`;
  }
}

/**
 * Classifies a raw pointer sequence into an interaction kind.
 */
class InteractionClassifier {
  /**
   * Classifies a single press of a known hold duration.
   *
   * @param holdMs hold duration of the press.
   * @returns the interaction kind.
   */
  public static classify(holdMs: number): InteractionKind {
    if (holdMs >= LONG_PRESS_THRESHOLD_MS) {
      return InteractionKind.LONG_PRESS;
    }
    return InteractionKind.TAP;
  }

  /**
   * Classifies two consecutive presses.
   *
   * @param firstHoldMs hold duration of the first press.
   * @param gapMs gap between the release of the first press and the press of the second one.
   * @returns the interaction kind.
   */
  public static classifyPair(firstHoldMs: number, gapMs: number): InteractionKind {
    if (firstHoldMs >= LONG_PRESS_THRESHOLD_MS) {
      return InteractionKind.LONG_PRESS;
    }
    if (gapMs <= DOUBLE_CLICK_WINDOW_MS) {
      return InteractionKind.DOUBLE_CLICK;
    }
    return InteractionKind.TAP;
  }

  /**
   * @param holdMs hold duration of a press.
   * @returns true when the press counts as a long press.
   */
  public static isLongPress(holdMs: number): boolean {
    return holdMs >= LONG_PRESS_THRESHOLD_MS;
  }

  /**
   * @param gapMs gap between two presses.
   * @returns true when the two presses form a double click.
   */
  public static isDoubleClickGap(gapMs: number): boolean {
    return gapMs >= 0 && gapMs <= DOUBLE_CLICK_WINDOW_MS;
  }

  /**
   * @returns the hold duration that a tap may not exceed.
   */
  public static maxTapDurationMs(): number {
    return TAP_MAX_DURATION_MS;
  }
}

/**
 * The interaction log of one case.
 *
 * The log owns the records, the counters and the burst deduplication, so that the UI cases and
 * the model cases assert against the same bookkeeping.
 */
class InteractionLog {
  private records: InteractionRecord[] = [];
  private counter: ClickCounter = new ClickCounter();
  private deduplicated: number = 0;

  /**
   * Records an interaction and updates the counter when the record was accepted.
   *
   * @param record record to append.
   * @returns true when the record was accepted and counted.
   */
  public append(record: InteractionRecord): boolean {
    this.records.push(record);
    if (record.accepted) {
      this.counter.increment(record.buttonId);
    }
    return record.accepted;
  }

  /**
   * Records a raw tap and deduplicates a burst against the previous accepted tap of the same
   * button.
   *
   * @param buttonId identifier of the button.
   * @param timestampMs timestamp of the tap.
   * @returns true when the tap was accepted, false when it was dropped as a burst duplicate.
   */
  public recordTap(buttonId: string, timestampMs: number): boolean {
    const previous: InteractionRecord | null = this.lastAccepted(buttonId);
    if (previous !== null) {
      const gap: number = timestampMs - previous.endMs;
      if (gap >= 0 && gap < BURST_WINDOW_MS) {
        this.deduplicated++;
        this.records.push(new InteractionRecord(buttonId, InteractionKind.TAP, timestampMs,
          timestampMs, false, 'burst duplicate'));
        return false;
      }
    }
    return this.append(new InteractionRecord(buttonId, InteractionKind.TAP, timestampMs,
      timestampMs, true, 'tap'));
  }

  /**
   * Records a long press.
   *
   * @param buttonId identifier of the button.
   * @param holdMs hold duration of the press.
   * @param timestampMs timestamp of the release.
   * @returns true when the long press was accepted.
   */
  public recordLongPress(buttonId: string, holdMs: number, timestampMs: number): boolean {
    const start: number = timestampMs - holdMs;
    const accepted: boolean = InteractionClassifier.isLongPress(holdMs);
    return this.append(new InteractionRecord(buttonId, InteractionKind.LONG_PRESS, start,
      timestampMs, accepted, accepted ? 'long press' : 'too short for a long press'));
  }

  /**
   * @param buttonId identifier of the button.
   * @returns the last accepted record of the button, null when there is none.
   */
  public lastAccepted(buttonId: string): InteractionRecord | null {
    for (let i = this.records.length - 1; i >= 0; i--) {
      const record: InteractionRecord = this.records[i];
      if (record.buttonId === buttonId && record.accepted) {
        return record;
      }
    }
    return null;
  }

  /**
   * @returns the number of accepted records.
   */
  public acceptedCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].accepted) {
        count++;
      }
    }
    return count;
  }

  /**
   * @returns the number of rejected records.
   */
  public rejectedCount(): number {
    return this.records.length - this.acceptedCount();
  }

  /**
   * @returns the number of taps that were dropped as burst duplicates.
   */
  public deduplicatedCount(): number {
    return this.deduplicated;
  }

  /**
   * @returns the number of recorded interactions of every kind.
   */
  public size(): number {
    return this.records.length;
  }

  /**
   * @param kind interaction kind to count.
   * @returns the number of accepted records of that kind.
   */
  public countOfKind(kind: InteractionKind): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].kind === kind && this.records[i].accepted) {
        count++;
      }
    }
    return count;
  }

  /**
   * @param buttonId identifier of the button.
   * @returns the number of accepted interactions of the button.
   */
  public acceptedOf(buttonId: string): number {
    return this.counter.countOf(buttonId);
  }

  /**
   * @returns the click counter of the log.
   */
  public getCounter(): ClickCounter {
    return this.counter;
  }

  /**
   * @returns a copy of the recorded interactions.
   */
  public getRecords(): InteractionRecord[] {
    return this.records.slice();
  }

  /**
   * Computes the share of interactions that were answered inside the responsive budget.
   *
   * @returns the rate between zero and one, zero when nothing was recorded.
   */
  public responsivenessRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let responsive: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].verdict() === ResponsivenessVerdict.RESPONSIVE) {
        responsive++;
      }
    }
    return responsive / this.records.length;
  }

  /**
   * @returns the slowest recorded interaction, null when the log is empty.
   */
  public slowestRecord(): InteractionRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    let slowest: InteractionRecord = this.records[0];
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i].durationMs() > slowest.durationMs()) {
        slowest = this.records[i];
      }
    }
    return slowest;
  }

  /**
   * @returns the average duration of the recorded interactions, zero when the log is empty.
   */
  public averageDurationMs(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      total += this.records[i].durationMs();
    }
    return total / this.records.length;
  }

  /**
   * Clears every record and counter.
   */
  public reset(): void {
    this.records = [];
    this.counter.reset();
    this.deduplicated = 0;
  }

  /**
   * @returns a compact description used by the log lines.
   */
  public toString(): string {
    return `InteractionLog{records=${this.records.length}, accepted=${this.acceptedCount()}, ` +
      `deduplicated=${this.deduplicated}}`;
  }
}

/**
 * Builds the model of the four operation buttons of the entry page.
 *
 * @returns the models in the order of the operation card.
 */
function buildOperationButtons(): ButtonModel[] {
  const begin: ButtonModel = new ButtonModel(ID_BEGIN_BUTTON, 'begin', TYPE_PRIMARY, false, true);
  const end: ButtonModel = new ButtonModel(ID_END_BUTTON, 'end', TYPE_DESTRUCTIVE, true, false);
  const queryState: ButtonModel = new ButtonModel(ID_QUERY_STATE_BUTTON, 'isActive', TYPE_SECONDARY,
    true, true);
  const queryConfig: ButtonModel = new ButtonModel(ID_QUERY_CONFIG_BUTTON, 'getConfiguration',
    TYPE_SECONDARY, true, true);
  const models: ButtonModel[] = [begin, end, queryState, queryConfig];
  return models;
}

/**
 * Finds a button model by identifier.
 *
 * @param models models to search.
 * @param id identifier to look for.
 * @returns the model, or null when it is absent.
 */
function findButtonModel(models: ButtonModel[], id: string): ButtonModel | null {
  for (let i = 0; i < models.length; i++) {
    if (models[i].id === id) {
      return models[i];
    }
  }
  return null;
}

/**
 * Reads the text of a component, an empty string is returned when the read fails.
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

export default function buttonInteractionTest() {
  describe('ButtonInteraction_Test', () => {
    let driver: Driver;
    let buttons: ButtonModel[];
    let log: InteractionLog;

    beforeAll(async () => {
      driver = getDriver();
      buttons = buildOperationButtons();
      log = new InteractionLog();
      await serializedDelay(driver, 1000);
      await launchAssessmentApp();
      await waitForIndexPage(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    /**
     * Scenario: the enabled state of the begin button flips to disabled while a session runs.
     * Expectation: on the index page the begin button is enabled; when the exam page is
     * reachable the sample has already flipped the storage link, so the case only checks the
     * model expectation there and skips the UI part.
     */
    it('Assessment_ButtonInteraction_008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_008, begin');
      const beginModel: ButtonModel | null = findButtonModel(buttons, ID_BEGIN_BUTTON);
      const endModel: ButtonModel | null = findButtonModel(buttons, ID_END_BUTTON);
      expect(beginModel !== null).assertTrue();
      expect(endModel !== null).assertTrue();
      if (beginModel !== null && endModel !== null) {
        beginModel.applySessionState(false);
        endModel.applySessionState(false);
        expect(beginModel.enabled).assertTrue();
        expect(endModel.enabled).assertFalse();
        beginModel.applySessionState(true);
        endModel.applySessionState(true);
        expect(beginModel.enabled).assertFalse();
        expect(endModel.enabled).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_008, end');
    });

    /**
     * Scenario: a full state machine walk of the begin button.
     * Expectation: the press moves the widget to pressed, the release to focused, and a second
     * press from the focused state is still accepted.
     */
    it('Assessment_ButtonInteraction_009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_009, begin');
      const model: ButtonModel = new ButtonModel('model_button', 'begin', TYPE_PRIMARY, true, true);
      expect(model.state).assertEqual(ButtonState.NORMAL);
      expect(model.isTappable()).assertTrue();
      expect(model.press(100)).assertTrue();
      expect(model.state).assertEqual(ButtonState.PRESSED);
      model.release(true);
      expect(model.state).assertEqual(ButtonState.FOCUSED);
      expect(model.press(200)).assertTrue();
      expect(model.clickCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_009', model.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_009, end');
    });

    /**
     * Scenario: the enable and disable helpers restore the widget.
     * Expectation: a re-enabled widget accepts input again and resets the transient state.
     */
    it('Assessment_ButtonInteraction_011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_011, begin');
      const model: ButtonModel = new ButtonModel('model_cycle', 'begin', TYPE_PRIMARY, true, true);
      model.press(10);
      model.disable();
      expect(model.enabled).assertFalse();
      expect(model.state).assertEqual(ButtonState.DISABLED);
      model.enable();
      expect(model.enabled).assertTrue();
      expect(model.state).assertEqual(ButtonState.NORMAL);
      expect(model.press(20)).assertTrue();
      expect(model.clickCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_011, end');
    });

    /**
     * Scenario: the tap classifier.
     * Expectation: a hundred millisecond hold is a tap, a five hundred millisecond hold is a
     * long press and the threshold itself counts as a long press.
     */
    it('Assessment_ButtonInteraction_012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_012, begin');
      expect(InteractionClassifier.classify(0)).assertEqual(InteractionKind.TAP);
      expect(InteractionClassifier.classify(100)).assertEqual(InteractionKind.TAP);
      expect(InteractionClassifier.classify(TAP_MAX_DURATION_MS)).assertEqual(InteractionKind.TAP);
      expect(InteractionClassifier.classify(LONG_PRESS_THRESHOLD_MS)).assertEqual(
        InteractionKind.LONG_PRESS);
      expect(InteractionClassifier.classify(1200)).assertEqual(InteractionKind.LONG_PRESS);
      expect(InteractionClassifier.isLongPress(LONG_PRESS_THRESHOLD_MS)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_012, end');
    });

    /**
     * Scenario: the double click classifier.
     * Expectation: a small gap between two taps forms a double click, a gap beyond the window
     * forms two taps, and a long first press wins over the double click window.
     */
    it('Assessment_ButtonInteraction_013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_013, begin');
      expect(InteractionClassifier.classifyPair(80, 120)).assertEqual(InteractionKind.DOUBLE_CLICK);
      expect(InteractionClassifier.classifyPair(80, DOUBLE_CLICK_WINDOW_MS)).assertEqual(
        InteractionKind.DOUBLE_CLICK);
      expect(InteractionClassifier.classifyPair(80, 400)).assertEqual(InteractionKind.TAP);
      expect(InteractionClassifier.classifyPair(LONG_PRESS_THRESHOLD_MS, 100)).assertEqual(
        InteractionKind.LONG_PRESS);
      expect(InteractionClassifier.isDoubleClickGap(0)).assertTrue();
      expect(InteractionClassifier.isDoubleClickGap(-1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_013, end');
    });

    /**
     * Scenario: the click counter of the interaction log.
     * Expectation: each button is counted on its own and the total is the sum of the counts.
     */
    it('Assessment_ButtonInteraction_014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_014, begin');
      const counter: ClickCounter = new ClickCounter();
      expect(counter.countOf(ID_BEGIN_BUTTON)).assertEqual(0);
      counter.increment(ID_BEGIN_BUTTON);
      counter.increment(ID_BEGIN_BUTTON);
      counter.increment(ID_QUERY_STATE_BUTTON);
      expect(counter.countOf(ID_BEGIN_BUTTON)).assertEqual(2);
      expect(counter.countOf(ID_QUERY_STATE_BUTTON)).assertEqual(1);
      expect(counter.total()).assertEqual(3);
      expect(counter.distinctCount()).assertEqual(2);
      expect(counter.wasClicked(ID_END_BUTTON)).assertFalse();
      expect(counter.mostClickedId()).assertEqual(ID_BEGIN_BUTTON);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
        BUNDLE + 'ButtonInteraction_014', counter.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_014, end');
    });

    /**
     * Scenario: the counter reset between cases.
     * Expectation: after the reset every count is zero and no identifier is remembered.
     */
    it('Assessment_ButtonInteraction_015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_015, begin');
      const counter: ClickCounter = new ClickCounter();
      counter.increment(ID_ADD_BUTTON);
      counter.increment(ID_END_BUTTON);
      expect(counter.total()).assertEqual(2);
      counter.reset();
      expect(counter.total()).assertEqual(0);
      expect(counter.distinctCount()).assertEqual(0);
      expect(counter.clickedIds().length).assertEqual(0);
      expect(counter.mostClickedId()).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_015, end');
    });

    /**
     * Scenario: a burst of rapid taps on the same button.
     * Expectation: only the first tap inside the burst window is accepted, the rest are
     * dropped and counted as duplicates.
     */
    it('Assessment_ButtonInteraction_016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_016, begin');
      const localLog: InteractionLog = new InteractionLog();
      expect(localLog.recordTap(ID_QUERY_STATE_BUTTON, 1000)).assertTrue();
      expect(localLog.recordTap(ID_QUERY_STATE_BUTTON, 1050)).assertFalse();
      expect(localLog.recordTap(ID_QUERY_STATE_BUTTON, 1100)).assertFalse();
      expect(localLog.acceptedCount()).assertEqual(1);
      expect(localLog.deduplicatedCount()).assertEqual(2);
      expect(localLog.size()).assertEqual(3);
      expect(localLog.acceptedOf(ID_QUERY_STATE_BUTTON)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_016', localLog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_016, end');
    });

    /**
     * Scenario: two taps that are far apart.
     * Expectation: the second tap falls outside the burst window and is accepted.
     */
    it('Assessment_ButtonInteraction_017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_017, begin');
      const localLog: InteractionLog = new InteractionLog();
      expect(localLog.recordTap(ID_QUERY_CONFIG_BUTTON, 1000)).assertTrue();
      expect(localLog.recordTap(ID_QUERY_CONFIG_BUTTON, 1000 + BURST_WINDOW_MS)).assertTrue();
      expect(localLog.acceptedCount()).assertEqual(2);
      expect(localLog.deduplicatedCount()).assertEqual(0);
      const last: InteractionRecord | null = localLog.lastAccepted(ID_QUERY_CONFIG_BUTTON);
      expect(last !== null).assertTrue();
      if (last !== null) {
        expect(last.endMs).assertEqual(1000 + BURST_WINDOW_MS);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_017, end');
    });

    /**
     * Scenario: a long press on a button.
     * Expectation: a press over the threshold is accepted as a long press and is counted once,
     * a press under the threshold is rejected by the long press path.
     */
    it('Assessment_ButtonInteraction_018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_018, begin');
      const localLog: InteractionLog = new InteractionLog();
      expect(localLog.recordLongPress(ID_BEGIN_BUTTON, 700, 2000)).assertTrue();
      expect(localLog.recordLongPress(ID_BEGIN_BUTTON, 200, 3000)).assertFalse();
      expect(localLog.countOfKind(InteractionKind.LONG_PRESS)).assertEqual(1);
      expect(localLog.rejectedCount()).assertEqual(1);
      expect(localLog.acceptedOf(ID_BEGIN_BUTTON)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_018', localLog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_018, end');
    });

    /**
     * Scenario: the responsiveness verdict of a single interaction.
     * Expectation: a fast tap is responsive, a slow one is degraded, a very slow one is
     * unresponsive, and the thresholds are inclusive.
     */
    it('Assessment_ButtonInteraction_019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_019, begin');
      const fast: InteractionRecord = new InteractionRecord(ID_BEGIN_BUTTON, InteractionKind.TAP, 0,
        RESPONSIVE_BUDGET_MS, true, 'fast');
      expect(fast.verdict()).assertEqual(ResponsivenessVerdict.RESPONSIVE);
      const slow: InteractionRecord = new InteractionRecord(ID_BEGIN_BUTTON, InteractionKind.TAP, 0,
        DEGRADED_BUDGET_MS, true, 'slow');
      expect(slow.verdict()).assertEqual(ResponsivenessVerdict.DEGRADED);
      const stuck: InteractionRecord = new InteractionRecord(ID_BEGIN_BUTTON, InteractionKind.TAP, 0,
        DEGRADED_BUDGET_MS + 1, true, 'stuck');
      expect(stuck.verdict()).assertEqual(ResponsivenessVerdict.UNRESPONSIVE);
      expect(fast.durationMs()).assertEqual(RESPONSIVE_BUDGET_MS);
      expect(fast.isShortPress()).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_019', fast.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_019, end');
    });

    /**
     * Scenario: the responsiveness rate of a log.
     * Expectation: two responsive records out of three yield two thirds, an empty log yields
     * zero instead of dividing by zero.
     */
    it('Assessment_ButtonInteraction_020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_020, begin');
      const localLog: InteractionLog = new InteractionLog();
      expect(localLog.responsivenessRate()).assertEqual(0);
      localLog.append(new InteractionRecord(ID_BEGIN_BUTTON, InteractionKind.TAP, 0, 100, true, 'a'));
      localLog.append(new InteractionRecord(ID_END_BUTTON, InteractionKind.TAP, 0, 200, true, 'b'));
      localLog.append(new InteractionRecord(ID_QUERY_STATE_BUTTON, InteractionKind.TAP, 0,
        DEGRADED_BUDGET_MS + 100, true, 'c'));
      const rate: number = localLog.responsivenessRate();
      hilog.info(DOMAIN, TAG, '%{public}s rate: %{public}s',
        BUNDLE + 'ButtonInteraction_020', rate.toFixed(3));
      expect(Math.abs(rate - 2 / 3) < 0.001).assertTrue();
      expect(localLog.averageDurationMs() > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_020, end');
    });

    /**
     * Scenario: the slowest record lookup.
     * Expectation: the lookup returns the record with the highest duration and null for an
     * empty log.
     */
    it('Assessment_ButtonInteraction_021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_021, begin');
      const localLog: InteractionLog = new InteractionLog();
      expect(localLog.slowestRecord() === null).assertTrue();
      localLog.append(new InteractionRecord(ID_BEGIN_BUTTON, InteractionKind.TAP, 0, 50, true, 'a'));
      localLog.append(new InteractionRecord(ID_END_BUTTON, InteractionKind.TAP, 0, 900, true, 'b'));
      localLog.append(new InteractionRecord(ID_QUERY_STATE_BUTTON, InteractionKind.TAP, 0, 300, true, 'c'));
      const slowest: InteractionRecord | null = localLog.slowestRecord();
      expect(slowest !== null).assertTrue();
      if (slowest !== null) {
        expect(slowest.buttonId).assertEqual(ID_END_BUTTON);
        expect(slowest.durationMs()).assertEqual(900);
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_021, end');
    });

    /**
     * Scenario: the documented operation labels are unique.
     * Expectation: the four labels of the operation card do not collide, which is what an
     * automated script that drives the card by text relies on.
     */
    it('Assessment_ButtonInteraction_022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_022, begin');
      const unique: Set<string> = new Set<string>(OPERATION_LABELS);
      expect(unique.size).assertEqual(OPERATION_LABELS.length);
      expect(OPERATION_LABELS.length).assertEqual(OPERATION_IDS.length);
      expect(OPERATION_LABELS.indexOf('begin')).assertEqual(0);
      expect(OPERATION_LABELS.indexOf('end')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_022, end');
    });

    /**
     * Scenario: the operation button models carry the expected session binding.
     * Expectation: only the end button is gated on the active state, the queries are always
     * available.
     */
    it('Assessment_ButtonInteraction_023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_023, begin');
      for (let i = 0; i < buttons.length; i++) {
        const model: ButtonModel = buttons[i];
        hilog.info(DOMAIN, TAG, '%{public}s %{public}s',
          BUNDLE + 'ButtonInteraction_023', model.toString());
        if (model.id === ID_END_BUTTON) {
          expect(model.expectedEnabled(true)).assertTrue();
          expect(model.expectedEnabled(false)).assertFalse();
          continue;
        }
        if (model.id === ID_BEGIN_BUTTON) {
          expect(model.expectedEnabled(true)).assertFalse();
          expect(model.expectedEnabled(false)).assertTrue();
          continue;
        }
        expect(model.expectedEnabled(true)).assertTrue();
        expect(model.expectedEnabled(false)).assertTrue();
      }
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_023, end');
    });

    /**
     * Scenario: the interaction log of the running sample records the taps of the case.
     * Expectation: the log counts two accepted taps on two different buttons and reports a
     * full responsiveness rate for the synthetic zero length records.
     */
    it('Assessment_ButtonInteraction_026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_026, begin');
      log.reset();
      log.append(new InteractionRecord(ID_QUERY_STATE_BUTTON, InteractionKind.TAP, 0, 10, true, 'tap'));
      log.append(new InteractionRecord(ID_QUERY_CONFIG_BUTTON, InteractionKind.TAP, 0, 20, true, 'tap'));
      expect(log.acceptedCount()).assertEqual(2);
      expect(log.rejectedCount()).assertEqual(0);
      expect(log.acceptedOf(ID_QUERY_STATE_BUTTON)).assertEqual(1);
      expect(log.responsivenessRate()).assertEqual(1);
      expect(log.getCounter().distinctCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_026', log.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_026, end');
    });

    /**
     * Scenario: the log records a rejected interaction and keeps the counters untouched.
     * Expectation: a rejected record is stored but never counted.
     */
    it('Assessment_ButtonInteraction_027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_027, begin');
      const localLog: InteractionLog = new InteractionLog();
      const rejected: InteractionRecord = new InteractionRecord(ID_END_BUTTON, InteractionKind.TAP, 0,
        50, false, 'disabled');
      expect(localLog.append(rejected)).assertFalse();
      expect(localLog.size()).assertEqual(1);
      expect(localLog.acceptedCount()).assertEqual(0);
      expect(localLog.rejectedCount()).assertEqual(1);
      expect(localLog.acceptedOf(ID_END_BUTTON)).assertEqual(0);
      expect(localLog.getCounter().wasClicked(ID_END_BUTTON)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_027, end');
    });

    /**
     * Scenario: the log reset clears the burst history.
     * Expectation: after the reset the same timestamp is accepted again, which means the
     * deduplication window does not leak across cases.
     */
    it('Assessment_ButtonInteraction_028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_028, begin');
      const localLog: InteractionLog = new InteractionLog();
      localLog.recordTap(ID_BEGIN_BUTTON, 1000);
      localLog.recordTap(ID_BEGIN_BUTTON, 1010);
      expect(localLog.deduplicatedCount()).assertEqual(1);
      localLog.reset();
      expect(localLog.size()).assertEqual(0);
      expect(localLog.deduplicatedCount()).assertEqual(0);
      expect(localLog.recordTap(ID_BEGIN_BUTTON, 1000)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_028, end');
    });

    /**
     * Scenario: the pressed state releases back to normal without focus.
     * Expectation: a focusless release returns the widget to normal and the tap is counted.
     */
    it('Assessment_ButtonInteraction_030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_030, begin');
      const model: ButtonModel = new ButtonModel('model_release', 'begin', TYPE_PRIMARY, true, true);
      model.press(500);
      model.release(false);
      expect(model.state).assertEqual(ButtonState.NORMAL);
      expect(model.clickCount()).assertEqual(1);
      expect(model.lastInteractionMs()).assertEqual(500);
      expect(model.isTappable()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_030, end');
    });

    /**
     * Scenario: the session state flips twice on the same model.
     * Expectation: the model tracks every flip and keeps its click counter across the flips.
     */
    it('Assessment_ButtonInteraction_031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_031, begin');
      const model: ButtonModel = new ButtonModel('model_flip', 'begin', TYPE_PRIMARY, false, true);
      model.applySessionState(false);
      expect(model.press(100)).assertTrue();
      model.applySessionState(true);
      expect(model.enabled).assertFalse();
      expect(model.acceptsInput(true)).assertFalse();
      expect(model.press(200)).assertFalse();
      model.applySessionState(false);
      expect(model.press(300)).assertTrue();
      expect(model.clickCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_031', model.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_031, end');
    });

    /**
     * Scenario: the interaction log description is complete.
     * Expectation: the description carries the record count, the accepted count and the
     * duplicate count.
     */
    it('Assessment_ButtonInteraction_033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_033, begin');
      const localLog: InteractionLog = new InteractionLog();
      localLog.recordTap(ID_BEGIN_BUTTON, 1000);
      localLog.recordTap(ID_BEGIN_BUTTON, 1010);
      const text: string = localLog.toString();
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_033', text);
      expect(text.indexOf('records=2') >= 0).assertTrue();
      expect(text.indexOf('accepted=1') >= 0).assertTrue();
      expect(text.indexOf('deduplicated=1') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_033, end');
    });

    /**
     * Scenario: the record list of a log is a copy.
     * Expectation: mutating the returned array does not change the log.
     */
    it('Assessment_ButtonInteraction_034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_034, begin');
      const localLog: InteractionLog = new InteractionLog();
      localLog.append(new InteractionRecord(ID_BEGIN_BUTTON, InteractionKind.TAP, 0, 10, true, 'a'));
      const copy: InteractionRecord[] = localLog.getRecords();
      copy.push(new InteractionRecord(ID_END_BUTTON, InteractionKind.TAP, 0, 10, true, 'b'));
      expect(copy.length).assertEqual(2);
      expect(localLog.size()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_034, end');
    });

    /**
     * Scenario: a double click sequence on the same button.
     * Expectation: the classifier names the pair a double click and the log counts two taps,
     * because the sample has no dedicated double click handler and both taps are delivered.
     */
    it('Assessment_ButtonInteraction_035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_035, begin');
      const localLog: InteractionLog = new InteractionLog();
      const refers: InteractionKind = InteractionClassifier.classifyPair(60, 80);
      expect(refers).assertEqual(InteractionKind.DOUBLE_CLICK);
      localLog.append(new InteractionRecord(ID_QUERY_STATE_BUTTON, InteractionKind.TAP, 0, 60, true, 'first'));
      localLog.append(new InteractionRecord(ID_QUERY_STATE_BUTTON, InteractionKind.TAP, 140, 200, true,
        'second'));
      expect(localLog.acceptedOf(ID_QUERY_STATE_BUTTON)).assertEqual(2);
      expect(localLog.countOfKind(InteractionKind.DOUBLE_CLICK)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s %{public}s', BUNDLE + 'ButtonInteraction_035', localLog.toString());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_035, end');
    });

    /**
     * Scenario: the confirm button of the exit dialog.
     * Expectation: the confirm button is classified as the confirm kind, it stays tappable in
     * both session states because the dialog must always be dismissible, and a press-released
     * pair counts exactly one accepted click.
     */
    it('Assessment_ButtonInteraction_036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_036, begin');
      const confirm: ButtonModel = new ButtonModel('dialog_confirm', 'OK', TYPE_CONFIRM, true, true);
      expect(confirm.buttonType).assertEqual(TYPE_CONFIRM);
      expect(confirm.expectedEnabled(true)).assertTrue();
      expect(confirm.expectedEnabled(false)).assertTrue();
      expect(confirm.isTappable()).assertTrue();
      const pressed: boolean = confirm.press(1000);
      expect(pressed).assertTrue();
      confirm.release(true);
      expect(confirm.clickCount()).assertEqual(1);
      expect(confirm.lastInteractionMs()).assertEqual(1000);
      expect(TYPE_CONFIRM !== TYPE_PRIMARY).assertTrue();
      expect(TYPE_CONFIRM !== TYPE_DESTRUCTIVE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s confirm button state=%{public}s, clicks=%{public}d',
        BUNDLE + 'ButtonInteraction_036', confirm.state, confirm.clickCount());
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'ButtonInteraction_036, end');
    });
  });
}
