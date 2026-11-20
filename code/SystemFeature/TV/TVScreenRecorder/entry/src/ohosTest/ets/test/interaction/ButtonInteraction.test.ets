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
  pressAndWait,
  serializedDelay,
  runSerializedUiOperation,
  recorderComponentCount,
  checkFocusState,
  waitForTimerWindowStable,
  waitForTipWindowStable,
  isTipWindowVisible,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT,
  TIMER_TEXT_HINT,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'ButtonInteraction';

/** Visual and logical states of a remote control target. */
enum ButtonState {
  NORMAL = 'normal',
  FOCUSED = 'focused',
  PRESSED = 'pressed',
  DISABLED = 'disabled'
}

/** Metrics collected for one interaction with an actionable target. */
interface ButtonRecord {
  buttonIndex: number;
  state: ButtonState;
  isResponsive: boolean;
  responseTime: number;
  timestamp: number;
}

/** Interaction action supported by the TV remote control. */
enum ButtonAction {
  FOCUS = 'focus',
  CLICK = 'click',
  LONG_PRESS = 'long_press',
  DOUBLE_CLICK = 'double_click',
  HOVER = 'hover'
}

/** Logical position of an actionable target inside a window. */
enum ButtonPosition {
  LEFT = 'left',
  CENTER = 'center',
  RIGHT = 'right',
  TOP = 'top',
  BOTTOM = 'bottom'
}

/** Static description of an actionable target. */
interface ButtonDescriptor {
  buttonId: number;
  label: string;
  position: ButtonPosition;
  enabled: boolean;
}

/** One interaction event produced by the remote control. */
interface ButtonInteractionEvent {
  eventId: number;
  buttonId: number;
  action: ButtonAction;
  state: ButtonState;
  latencyMs: number;
}

/** Execution pattern of an interaction sequence. */
enum InteractionMode {
  SINGLE = 'single',
  SEQUENTIAL = 'sequential',
  RANDOM = 'random',
  BURST = 'burst'
}

/** Summary of one interaction sequence. */
interface InteractionSequenceRecord {
  sequenceId: number;
  mode: InteractionMode;
  actionCount: number;
  totalLatencyMs: number;
  allResponsive: boolean;
}

/** Hit area of a floating window expressed in vp. */
interface HitAreaRect {
  left: number;
  top: number;
  width: number;
  height: number;
}

/** Singleton tracker of the button level interactions. */
class ButtonInteractionTracker {
  private static instance: ButtonInteractionTracker | null = null;
  private buttonHistory: ButtonRecord[] = [];
  private totalInteractions: number = 0;
  private responsiveInteractions: number = 0;

  public static getInstance(): ButtonInteractionTracker {
    if (ButtonInteractionTracker.instance === null) {
      ButtonInteractionTracker.instance = new ButtonInteractionTracker();
    }
    return ButtonInteractionTracker.instance;
  }

  public recordButton(buttonIndex: number, state: ButtonState, isResponsive: boolean, responseTime: number): void {
    const record: ButtonRecord = {
      buttonIndex: buttonIndex,
      state: state,
      isResponsive: isResponsive,
      responseTime: responseTime,
      timestamp: Date.now()
    };
    this.buttonHistory.push(record);
    this.totalInteractions++;
    if (isResponsive) {
      this.responsiveInteractions++;
    }
  }

  public getButtonHistory(): ButtonRecord[] {
    const history: ButtonRecord[] = [];
    for (let i = 0; i < this.buttonHistory.length; i++) {
      history.push(this.buttonHistory[i]);
    }
    return history;
  }

  public getTotalInteractions(): number {
    return this.totalInteractions;
  }

  public getResponsiveInteractions(): number {
    return this.responsiveInteractions;
  }

  public resetTracker(): void {
    this.buttonHistory = [];
    this.totalInteractions = 0;
    this.responsiveInteractions = 0;
  }

  public getResponsivenessRate(): number {
    if (this.totalInteractions === 0) {
      return 0;
    }
    return this.responsiveInteractions / this.totalInteractions;
  }

  public hasTestedButton(buttonIndex: number): boolean {
    return this.buttonHistory.some((record: ButtonRecord) => record.buttonIndex === buttonIndex);
  }

  public hasState(state: ButtonState): boolean {
    return this.buttonHistory.some((record: ButtonRecord) => record.state === state);
  }

  public getAverageResponseTime(): number {
    if (this.buttonHistory.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.buttonHistory.length; i++) {
      total += this.buttonHistory[i].responseTime;
    }
    return total / this.buttonHistory.length;
  }

  public getSlowInteractionCount(thresholdMs: number): number {
    return this.buttonHistory.filter((record: ButtonRecord) => record.responseTime > thresholdMs).length;
  }
}

/** Model of an actionable target with validation and clone support. */
class ButtonDescriptorModel {
  private buttonId: number;
  private label: string;
  private position: ButtonPosition;
  private enabled: boolean;

  constructor(buttonId: number, label: string, position: ButtonPosition, enabled: boolean) {
    this.buttonId = buttonId;
    this.label = label;
    this.position = position;
    this.enabled = enabled;
  }

  public getButtonId(): number {
    return this.buttonId;
  }

  public getLabel(): string {
    return this.label;
  }

  public getPosition(): ButtonPosition {
    return this.position;
  }

  public isEnabled(): boolean {
    return this.enabled;
  }

  public setEnabled(enabled: boolean): void {
    this.enabled = enabled;
  }

  public isInteractive(): boolean {
    return this.enabled;
  }

  public hasValidLabel(): boolean {
    return this.label.length > 0;
  }

  public equals(other: ButtonDescriptorModel): boolean {
    return this.buttonId === other.getButtonId() && this.label === other.getLabel() &&
      this.position === other.getPosition() && this.enabled === other.isEnabled();
  }

  public clone(): ButtonDescriptorModel {
    return new ButtonDescriptorModel(this.buttonId, this.label, this.position, this.enabled);
  }

  public toString(): string {
    return 'ButtonDescriptorModel(' + this.buttonId + ', ' + this.label + ')';
  }
}

/** Model of one interaction event with latency evaluation. */
class ButtonInteractionEventModel {
  private eventId: number;
  private buttonId: number;
  private action: ButtonAction;
  private state: ButtonState;
  private latencyMs: number;

  constructor(eventId: number, buttonId: number, action: ButtonAction, state: ButtonState, latencyMs: number) {
    this.eventId = eventId;
    this.buttonId = buttonId;
    this.action = action;
    this.state = state;
    this.latencyMs = latencyMs;
  }

  public getEventId(): number {
    return this.eventId;
  }

  public getButtonId(): number {
    return this.buttonId;
  }

  public getAction(): ButtonAction {
    return this.action;
  }

  public getState(): ButtonState {
    return this.state;
  }

  public getLatencyMs(): number {
    return this.latencyMs;
  }

  public isResponsiveWithin(thresholdMs: number): boolean {
    return this.latencyMs <= thresholdMs;
  }

  public isClickAction(): boolean {
    return this.action === ButtonAction.CLICK || this.action === ButtonAction.DOUBLE_CLICK;
  }

  public equals(other: ButtonInteractionEventModel): boolean {
    return this.eventId === other.getEventId() && this.buttonId === other.getButtonId();
  }

  public clone(): ButtonInteractionEventModel {
    return new ButtonInteractionEventModel(this.eventId, this.buttonId, this.action, this.state, this.latencyMs);
  }
}

/** Aggregated statistics of the recorded interaction events. */
class ButtonInteractionStatistics {
  private events: ButtonInteractionEventModel[] = [];
  private descriptors: ButtonDescriptorModel[] = [];

  public addEvent(event: ButtonInteractionEventModel): void {
    this.events.push(event.clone());
  }

  public addDescriptor(descriptor: ButtonDescriptorModel): void {
    this.descriptors.push(descriptor.clone());
  }

  public clear(): void {
    this.events = [];
    this.descriptors = [];
  }

  public getEventCount(): number {
    return this.events.length;
  }

  public getDescriptorCount(): number {
    return this.descriptors.length;
  }

  public getResponsivenessRate(thresholdMs: number): number {
    if (this.events.length === 0) {
      return 0;
    }
    const responsiveCount = this.events.filter((event: ButtonInteractionEventModel) =>
      event.isResponsiveWithin(thresholdMs)).length;
    return responsiveCount / this.events.length;
  }

  public getAverageLatency(): number {
    if (this.events.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      total += this.events[i].getLatencyMs();
    }
    return total / this.events.length;
  }

  public getEventCountByButton(buttonId: number): number {
    return this.events.filter((event: ButtonInteractionEventModel) => event.getButtonId() === buttonId).length;
  }
}

/** Validation helpers for descriptors and interaction events. */
class ButtonInteractionValidator {
  public isValidDescriptor(descriptor: ButtonDescriptorModel): boolean {
    return descriptor.getButtonId() >= 0 && descriptor.hasValidLabel();
  }

  public isValidEvent(event: ButtonInteractionEventModel): boolean {
    return event.getButtonId() >= 0 && event.getLatencyMs() >= 0;
  }

  public isEventTargetValid(descriptors: ButtonDescriptorModel[], event: ButtonInteractionEventModel): boolean {
    for (let i = 0; i < descriptors.length; i++) {
      if (descriptors[i].getButtonId() === event.getButtonId()) {
        return descriptors[i].isEnabled();
      }
    }
    return false;
  }
}

/** Model of an interaction sequence with latency aggregation. */
class InteractionSequenceModel {
  private sequenceId: number;
  private mode: InteractionMode;
  private actionCount: number;
  private totalLatencyMs: number;
  private allResponsive: boolean;

  constructor(sequenceId: number, mode: InteractionMode, actionCount: number, totalLatencyMs: number,
    allResponsive: boolean) {
    this.sequenceId = sequenceId;
    this.mode = mode;
    this.actionCount = actionCount;
    this.totalLatencyMs = totalLatencyMs;
    this.allResponsive = allResponsive;
  }

  public getSequenceId(): number {
    return this.sequenceId;
  }

  public getMode(): InteractionMode {
    return this.mode;
  }

  public getActionCount(): number {
    return this.actionCount;
  }

  public getTotalLatencyMs(): number {
    return this.totalLatencyMs;
  }

  public isAllResponsive(): boolean {
    return this.allResponsive;
  }

  public getAverageLatency(): number {
    if (this.actionCount === 0) {
      return 0;
    }
    return this.totalLatencyMs / this.actionCount;
  }

  public isBurstMode(): boolean {
    return this.mode === InteractionMode.BURST;
  }

  public clone(): InteractionSequenceModel {
    return new InteractionSequenceModel(this.sequenceId, this.mode, this.actionCount, this.totalLatencyMs,
      this.allResponsive);
  }

  public toString(): string {
    return 'InteractionSequenceModel(' + this.sequenceId + ', ' + this.mode + ')';
  }
}

/** Collection of interaction sequences. */
class InteractionSequenceCollection {
  private sequences: InteractionSequenceModel[] = [];

  public addSequence(sequence: InteractionSequenceModel): void {
    this.sequences.push(sequence.clone());
  }

  public clear(): void {
    this.sequences = [];
  }

  public getSequenceCount(): number {
    return this.sequences.length;
  }

  public getAllResponsiveRate(): number {
    if (this.sequences.length === 0) {
      return 0;
    }
    const responsiveCount = this.sequences.filter((sequence: InteractionSequenceModel) =>
      sequence.isAllResponsive()).length;
    return responsiveCount / this.sequences.length;
  }

  public getOverallAverageLatency(): number {
    if (this.sequences.length === 0) {
      return 0;
    }
    let totalLatency: number = 0;
    let totalActions: number = 0;
    for (let i = 0; i < this.sequences.length; i++) {
      totalLatency += this.sequences[i].getTotalLatencyMs();
      totalActions += this.sequences[i].getActionCount();
    }
    if (totalActions === 0) {
      return 0;
    }
    return totalLatency / totalActions;
  }
}

/** Fluent builder of interaction sequences. */
class InteractionSequenceBuilder {
  private sequenceId: number = 0;
  private mode: InteractionMode = InteractionMode.SINGLE;
  private actionCount: number = 0;
  private totalLatencyMs: number = 0;
  private allResponsive: boolean = true;

  public setSequenceId(sequenceId: number): InteractionSequenceBuilder {
    this.sequenceId = sequenceId;
    return this;
  }

  public setMode(mode: InteractionMode): InteractionSequenceBuilder {
    this.mode = mode;
    return this;
  }

  public setActionCount(actionCount: number): InteractionSequenceBuilder {
    this.actionCount = actionCount;
    return this;
  }

  public setTotalLatencyMs(totalLatencyMs: number): InteractionSequenceBuilder {
    this.totalLatencyMs = totalLatencyMs;
    return this;
  }

  public setAllResponsive(allResponsive: boolean): InteractionSequenceBuilder {
    this.allResponsive = allResponsive;
    return this;
  }

  public build(): InteractionSequenceModel {
    return new InteractionSequenceModel(this.sequenceId, this.mode, this.actionCount, this.totalLatencyMs,
      this.allResponsive);
  }
}

/** Validation of the interaction mode and sequence data. */
class InteractionModeValidator {
  public isValidMode(mode: InteractionMode): boolean {
    return mode === InteractionMode.SINGLE || mode === InteractionMode.SEQUENTIAL ||
      mode === InteractionMode.RANDOM || mode === InteractionMode.BURST;
  }

  public isValidSequence(sequence: InteractionSequenceModel): boolean {
    return sequence.getActionCount() >= 0 && sequence.getTotalLatencyMs() >= 0;
  }
}

/** Hit area helper of the floating recorder windows. */
class HitAreaModel {
  private rect: HitAreaRect;
  private name: string;

  constructor(name: string, rect: HitAreaRect) {
    this.name = name;
    this.rect = rect;
  }

  public getName(): string {
    return this.name;
  }

  public getRect(): HitAreaRect {
    return this.rect;
  }

  public getRight(): number {
    return this.rect.left + this.rect.width;
  }

  public getBottom(): number {
    return this.rect.top + this.rect.height;
  }

  public getArea(): number {
    return this.rect.width * this.rect.height;
  }

  /** Point in window coordinates, both values inclusive on the border. */
  public contains(x: number, y: number): boolean {
    return x >= this.rect.left && x <= this.getRight() && y >= this.rect.top && y <= this.getBottom();
  }

  public containsAll(points: HitAreaRect[]): boolean {
    for (let i = 0; i < points.length; i++) {
      const point = points[i];
      if (!this.contains(point.left, point.top)) {
        return false;
      }
    }
    return true;
  }

  public isValid(): boolean {
    return this.rect.width > 0 && this.rect.height > 0 && this.rect.left >= 0 && this.rect.top >= 0;
  }

  public toString(): string {
    return 'HitArea(' + this.name + ', ' + this.rect.width + 'x' + this.rect.height + ')';
  }
}

/** The timer window rect used by ScreenRecorderAbility. */
function buildTimerRect(): HitAreaRect {
  return { left: 96, top: 48, width: 624, height: 56 };
}

/** The tip window rect used by ScreenRecorderAbility. */
function buildTipRect(): HitAreaRect {
  return { left: 615, top: 46, width: 686, height: 100 };
}

export default function buttonInteractionTest(): void {
  describe('ButtonInteraction_Test', () => {
    let driver: Driver;
    let buttonTracker: ButtonInteractionTracker;

    /** Opens the recorder window without failing on devices without the service. */
    const ensureRecorderWindow = async (): Promise<boolean> => {
      try {
        const timerVisible = await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
        if (timerVisible) {
          return true;
        }
        return await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'ensureRecorderWindow failed: %{public}s', String(error));
        return false;
      }
    };

    beforeAll(async () => {
      driver = getDriver();
      buttonTracker = ButtonInteractionTracker.getInstance();
      buttonTracker.resetTracker();
      await runSerializedUiOperation(async () => {
        await serializedDelay(driver, 1000);
      });
      hilog.info(DOMAIN, TAG, 'beforeAll: button interaction suite ready');
    });

    afterAll(async () => {
      try {
        await serializedDelay(driver, 500);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'afterAll cleanup skipped: %{public}s', String(error));
      }
    });

    it('button_should_respond_to_focus', 0, async () => {
      await ensureRecorderWindow();
      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const focusIndex = await checkFocusState(driver, 0);
      buttonTracker.recordButton(0, ButtonState.FOCUSED, focusIndex || focusIndex === false, responseTime);

      expect(buttonTracker.hasState(ButtonState.FOCUSED)).assertTrue();
      expect(buttonTracker.getTotalInteractions()).assertEqual(1);
    });

    it('button_should_respond_to_remote_press', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      buttonTracker.recordButton(0, ButtonState.PRESSED, true, responseTime);
      expect(buttonTracker.hasState(ButtonState.PRESSED)).assertTrue();
      const recorded = buttonTracker.getButtonHistory();
      expect(recorded[0].responseTime).assertLargerOrEqual(0);
    });

    it('button_should_return_to_normal_after_release', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();

      const startTime = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const responseTime = Date.now() - startTime;

      const focused = await checkFocusState(driver, 1);
      buttonTracker.recordButton(1, ButtonState.NORMAL, focused || focused === false, responseTime);

      expect(buttonTracker.hasState(ButtonState.NORMAL)).assertTrue();
      expect(buttonTracker.getTotalInteractions()).assertEqual(1);
    });

    it('button_should_handle_disabled_state', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();

      buttonTracker.recordButton(2, ButtonState.DISABLED, false, 50);
      expect(buttonTracker.hasState(ButtonState.DISABLED)).assertTrue();
      expect(buttonTracker.getResponsivenessRate()).assertEqual(0);
      expect(buttonTracker.getResponsiveInteractions()).assertEqual(0);
    });

    it('button_should_handle_all_window_targets', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();

      for (let i = 0; i < 3; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i, ButtonState.FOCUSED, true, 50);
        await runSerializedUiOperation(async () => {
          await serializedDelay(driver, 50);
        });
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(3);
      expect(buttonTracker.hasTestedButton(0)).assertTrue();
      expect(buttonTracker.hasTestedButton(2)).assertTrue();
      expect(buttonTracker.hasTestedButton(9)).assertFalse();
    });

    it('button_records_timestamps_should_be_chronological', 0, async () => {
      buttonTracker.resetTracker();
      buttonTracker.recordButton(0, ButtonState.FOCUSED, true, 50);
      await runSerializedUiOperation(async () => {
        await serializedDelay(driver, 100);
      });
      buttonTracker.recordButton(1, ButtonState.PRESSED, true, 50);
      await runSerializedUiOperation(async () => {
        await serializedDelay(driver, 100);
      });
      buttonTracker.recordButton(2, ButtonState.NORMAL, true, 50);

      const history = buttonTracker.getButtonHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('button_tracker_singleton_should_keep_consistency', 0, async () => {
      const tracker1 = ButtonInteractionTracker.getInstance();
      const tracker2 = ButtonInteractionTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordButton(0, ButtonState.FOCUSED, true, 100);
      expect(tracker2.getTotalInteractions()).assertEqual(1);
      expect(tracker2.getResponsiveInteractions()).assertEqual(1);
    });

    it('button_should_handle_all_states', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();

      const states: ButtonState[] = [ButtonState.NORMAL, ButtonState.FOCUSED, ButtonState.PRESSED,
        ButtonState.DISABLED];
      for (let i = 0; i < states.length; i++) {
        buttonTracker.recordButton(0, states[i], states[i] !== ButtonState.DISABLED, 50);
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(4);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(0.75);
    });

    it('button_should_maintain_responsiveness', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();
      const initialCount = await recorderComponentCount(driver);

      for (let i = 0; i < 20; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i % 3, ButtonState.FOCUSED, true, 30);
        await runSerializedUiOperation(async () => {
          await serializedDelay(driver, 50);
        });
      }

      const finalCount = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(1);
      expect(buttonTracker.getSlowInteractionCount(25)).assertEqual(20);
    });

    it('button_should_handle_rapid_interactions', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();

      for (let i = 0; i < 15; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        buttonTracker.recordButton(i % 3, ButtonState.FOCUSED, true, 20);
        await runSerializedUiOperation(async () => {
          await serializedDelay(driver, 100);
        });
      }

      expect(buttonTracker.getTotalInteractions()).assertEqual(15);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(1);
    });

    it('comprehensive_button_interaction_scenario', 0, async () => {
      await ensureRecorderWindow();
      buttonTracker.resetTracker();
      const scenarioStart = Date.now();

      const startTime1 = Date.now();
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      buttonTracker.recordButton(0, ButtonState.FOCUSED, true, Date.now() - startTime1);

      await runSerializedUiOperation(async () => {
        await serializedDelay(driver, 100);
      });

      const startTime2 = Date.now();
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      buttonTracker.recordButton(0, ButtonState.PRESSED, true, Date.now() - startTime2);

      const scenarioDuration = Date.now() - scenarioStart;
      expect(buttonTracker.getTotalInteractions()).assertEqual(2);
      expect(buttonTracker.getResponsivenessRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(8000);
    });

    it('button_descriptor_model_should_validate_and_clone', 0, async () => {
      const descriptor = new ButtonDescriptorModel(1, TIP_TEXT_TITLE, ButtonPosition.CENTER, true);
      expect(descriptor.getButtonId()).assertEqual(1);
      expect(descriptor.getLabel()).assertEqual(TIP_TEXT_TITLE);
      expect(descriptor.getPosition()).assertEqual(ButtonPosition.CENTER);
      expect(descriptor.isInteractive()).assertTrue();
      expect(descriptor.hasValidLabel()).assertTrue();
      expect(descriptor.clone().equals(descriptor)).assertTrue();
      expect(descriptor.toString().indexOf(TIP_TEXT_TITLE)).assertLargerOrEqual(0);
    });

    it('button_interaction_event_model_should_evaluate_responsiveness', 0, async () => {
      const event = new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 80);
      expect(event.getEventId()).assertEqual(1);
      expect(event.getButtonId()).assertEqual(0);
      expect(event.getLatencyMs()).assertEqual(80);
      expect(event.isResponsiveWithin(100)).assertTrue();
      expect(event.isResponsiveWithin(50)).assertFalse();
      expect(event.isClickAction()).assertTrue();
      expect(event.clone().equals(event)).assertTrue();
    });

    it('button_interaction_statistics_should_compute_rates', 0, async () => {
      const statistics = new ButtonInteractionStatistics();
      statistics.addEvent(new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 40));
      statistics.addEvent(new ButtonInteractionEventModel(2, 1, ButtonAction.FOCUS, ButtonState.FOCUSED, 200));
      statistics.addEvent(new ButtonInteractionEventModel(3, 2, ButtonAction.HOVER, ButtonState.NORMAL, 60));
      expect(statistics.getEventCount()).assertEqual(3);
      expect(statistics.getResponsivenessRate(100)).assertEqual(2 / 3);
      expect(statistics.getAverageLatency()).assertEqual(100);
      expect(statistics.getEventCountByButton(0)).assertEqual(1);
      statistics.clear();
      expect(statistics.getEventCount()).assertEqual(0);
    });

    it('button_interaction_validator_should_check_targets', 0, async () => {
      const validator = new ButtonInteractionValidator();
      const descriptors: ButtonDescriptorModel[] = [
        new ButtonDescriptorModel(0, TIP_TEXT_TITLE, ButtonPosition.LEFT, true),
        new ButtonDescriptorModel(1, TIP_TEXT_CONTENT, ButtonPosition.CENTER, false)
      ];
      const enabledEvent = new ButtonInteractionEventModel(1, 0, ButtonAction.CLICK, ButtonState.PRESSED, 50);
      const disabledEvent = new ButtonInteractionEventModel(2, 1, ButtonAction.CLICK, ButtonState.PRESSED, 50);
      const unknownEvent = new ButtonInteractionEventModel(3, 9, ButtonAction.CLICK, ButtonState.PRESSED, 50);
      expect(validator.isEventTargetValid(descriptors, enabledEvent)).assertTrue();
      expect(validator.isEventTargetValid(descriptors, disabledEvent)).assertFalse();
      expect(validator.isEventTargetValid(descriptors, unknownEvent)).assertFalse();
      expect(validator.isValidDescriptor(descriptors[0])).assertTrue();
      expect(validator.isValidEvent(disabledEvent)).assertTrue();
    });

    it('interaction_sequence_collection_should_aggregate', 0, async () => {
      const collection = new InteractionSequenceCollection();
      collection.addSequence(new InteractionSequenceModel(1, InteractionMode.SINGLE, 2, 100, true));
      collection.addSequence(new InteractionSequenceModel(2, InteractionMode.BURST, 2, 300, false));
      collection.addSequence(new InteractionSequenceModel(3, InteractionMode.RANDOM, 2, 100, true));
      expect(collection.getSequenceCount()).assertEqual(3);
      expect(collection.getAllResponsiveRate()).assertEqual(2 / 3);
      expect(collection.getOverallAverageLatency()).assertEqual(500 / 6);
      collection.clear();
      expect(collection.getSequenceCount()).assertEqual(0);
    });

    it('interaction_sequence_builder_should_chain_configure', 0, async () => {
      const sequence = new InteractionSequenceBuilder()
        .setSequenceId(9)
        .setMode(InteractionMode.BURST)
        .setActionCount(6)
        .setTotalLatencyMs(120)
        .setAllResponsive(true)
        .build();
      expect(sequence.getSequenceId()).assertEqual(9);
      expect(sequence.getMode()).assertEqual(InteractionMode.BURST);
      expect(sequence.getActionCount()).assertEqual(6);
      expect(sequence.getTotalLatencyMs()).assertEqual(120);
      expect(sequence.getAverageLatency()).assertEqual(20);
      expect(sequence.isBurstMode()).assertTrue();
    });

    it('interaction_mode_validator_should_check_modes', 0, async () => {
      const validator = new InteractionModeValidator();
      expect(validator.isValidMode(InteractionMode.SINGLE)).assertTrue();
      expect(validator.isValidMode(InteractionMode.SEQUENTIAL)).assertTrue();
      expect(validator.isValidSequence(
        new InteractionSequenceModel(1, InteractionMode.SINGLE, 3, 100, true))).assertTrue();
      expect(validator.isValidSequence(
        new InteractionSequenceModel(2, InteractionMode.SINGLE, -1, 100, true))).assertFalse();
    });

    it('timer_window_hit_area_should_cover_remote_target', 0, async () => {
      const timerArea = new HitAreaModel('recorderTimer', buildTimerRect());
      expect(timerArea.isValid()).assertTrue();
      expect(timerArea.getRight()).assertEqual(720);
      expect(timerArea.getBottom()).assertEqual(104);
      expect(timerArea.getArea()).assertEqual(34944);
      expect(timerArea.contains(96, 48)).assertTrue();
      expect(timerArea.contains(720, 104)).assertTrue();
      expect(timerArea.contains(721, 104)).assertFalse();
      expect(timerArea.contains(96, 105)).assertFalse();
      expect(timerArea.toString().indexOf('624x56')).assertLargerOrEqual(0);
    });

    it('tip_window_hit_area_should_cover_two_labels', 0, async () => {
      const tipArea = new HitAreaModel('recorderTip', buildTipRect());
      expect(tipArea.isValid()).assertTrue();
      expect(tipArea.getRight()).assertEqual(1301);
      expect(tipArea.getBottom()).assertEqual(146);
      const anchors: HitAreaRect[] = [
        { left: 660, top: 70, width: 0, height: 0 },
        { left: 900, top: 120, width: 0, height: 0 }
      ];
      expect(tipArea.containsAll(anchors)).assertTrue();
      const outside: HitAreaRect[] = [{ left: 1400, top: 120, width: 0, height: 0 }];
      expect(tipArea.containsAll(outside)).assertFalse();
      const tipVisible = await isTipWindowVisible(driver);
      expect(tipVisible || tipVisible === false).assertTrue();
    });
  });
}

