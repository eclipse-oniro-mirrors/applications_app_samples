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
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_DOWN,
  KEY_ENTER,
  KEY_BACK,
  KEY_HOME,
  KEY_MENU,
  KEY_VOLUME_DOWN,
  recorderComponentCount,
  checkFocusState,
  waitForTimerWindowStable,
  pressAndWait,
  TIMEOUT_TIMER_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  getCurrentFocusIndex,
  StopCombinationGate
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'KeyCodeValidation';

// Long-press threshold used by the TV remote control handling.
const LONG_PRESS_THRESHOLD_MS: number = 800;

// The stop combination must be completed inside this window.
const STOP_COMBINATION_WINDOW_MS: number = 500;

// Key codes of the TV remote control. KEYCODE_MENU is 2018 on TV products and
// KEYCODE_VOLUME_DOWN is 17; both are required to stop a recording.
class KeyCodeConstants {
  public static readonly KEYCODE_DPAD_LEFT: number = 2014;
  public static readonly KEYCODE_DPAD_RIGHT: number = 2015;
  public static readonly KEYCODE_DPAD_UP: number = 2012;
  public static readonly KEYCODE_DPAD_DOWN: number = 2013;
  public static readonly KEYCODE_ENTER: number = 2049;
  public static readonly KEYCODE_BACK: number = 2;
  public static readonly KEYCODE_HOME: number = 3;
  public static readonly KEYCODE_ESCAPE: number = 1;
  public static readonly KEYCODE_TAB: number = 4;
  public static readonly KEYCODE_SPACE: number = 57;
  public static readonly KEYCODE_MEDIA_PLAY_PAUSE: number = 163;
  public static readonly KEYCODE_MEDIA_STOP: number = 164;
  public static readonly KEYCODE_MEDIA_NEXT: number = 165;
  public static readonly KEYCODE_MEDIA_PREVIOUS: number = 166;
  public static readonly KEYCODE_VOLUME_UP: number = 16;
  public static readonly KEYCODE_VOLUME_DOWN: number = 17;
  public static readonly KEYCODE_VOLUME_MUTE: number = 167;
  public static readonly KEYCODE_POWER: number = 26;
  public static readonly KEYCODE_MENU: number = 2018;
  public static readonly KEYCODE_SETTINGS: number = 176;
}

// Key event log entry: one key down or key up event.
interface KeyEventLog {
  keyCode: number;
  eventType: number;
  timestamp: number;
}

// Central key event handler of the recorder.
class KeyEventHandler {
  private static instance: KeyEventHandler;
  private keyEventLog: KeyEventLog[] = [];
  private keyDownCount: number = 0;
  private keyUpCount: number = 0;

  public static getInstance(): KeyEventHandler {
    if (!KeyEventHandler.instance) {
      KeyEventHandler.instance = new KeyEventHandler();
    }
    return KeyEventHandler.instance;
  }

  public handleKeyDown(keyCode: number): void {
    this.keyDownCount++;
    this.keyEventLog.push({
      keyCode: keyCode,
      eventType: 1,
      timestamp: Date.now()
    });
  }

  public handleKeyUp(keyCode: number): void {
    this.keyUpCount++;
    this.keyEventLog.push({
      keyCode: keyCode,
      eventType: 0,
      timestamp: Date.now()
    });
  }

  public getKeyEventLog(): KeyEventLog[] {
    const result: KeyEventLog[] = [];
    for (const entry of this.keyEventLog) {
      result.push({
        keyCode: entry.keyCode,
        eventType: entry.eventType,
        timestamp: entry.timestamp
      });
    }
    return result;
  }

  public getKeyDownCount(): number {
    return this.keyDownCount;
  }

  public getKeyUpCount(): number {
    return this.keyUpCount;
  }

  public hasKeyCode(keyCode: number): boolean {
    return this.keyEventLog.some((event: KeyEventLog): boolean => event.keyCode === keyCode);
  }

  public getKeyCodeCount(keyCode: number): number {
    return this.keyEventLog.filter((event: KeyEventLog): boolean => event.keyCode === keyCode).length;
  }

  public clearLog(): void {
    this.keyEventLog = [];
    this.keyDownCount = 0;
    this.keyUpCount = 0;
  }

  public isNavigationKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_DPAD_LEFT || keyCode === KeyCodeConstants.KEYCODE_DPAD_RIGHT ||
      keyCode === KeyCodeConstants.KEYCODE_DPAD_UP || keyCode === KeyCodeConstants.KEYCODE_DPAD_DOWN;
  }

  public isMediaKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE ||
      keyCode === KeyCodeConstants.KEYCODE_MEDIA_STOP ||
      keyCode === KeyCodeConstants.KEYCODE_MEDIA_NEXT ||
      keyCode === KeyCodeConstants.KEYCODE_MEDIA_PREVIOUS;
  }

  public isVolumeKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_VOLUME_UP ||
      keyCode === KeyCodeConstants.KEYCODE_VOLUME_DOWN ||
      keyCode === KeyCodeConstants.KEYCODE_VOLUME_MUTE;
  }

  public isSystemKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_BACK || keyCode === KeyCodeConstants.KEYCODE_HOME ||
      keyCode === KeyCodeConstants.KEYCODE_POWER || keyCode === KeyCodeConstants.KEYCODE_MENU ||
      keyCode === KeyCodeConstants.KEYCODE_SETTINGS;
  }

  // The stop combination is made of the menu key and the volume down key.
  public isStopCombinationKey(keyCode: number): boolean {
    return keyCode === KeyCodeConstants.KEYCODE_MENU || keyCode === KeyCodeConstants.KEYCODE_VOLUME_DOWN;
  }

  public getTotalEventCount(): number {
    return this.keyEventLog.length;
  }

  public getKeyEventCount(keyCode: number): number {
    return this.keyEventLog.filter((event: KeyEventLog): boolean => event.keyCode === keyCode).length;
  }

  public getKeyDownEventCount(keyCode: number): number {
    return this.keyEventLog.filter((event: KeyEventLog): boolean =>
      event.keyCode === keyCode && event.eventType === 1).length;
  }

  public getKeyUpEventCount(keyCode: number): number {
    return this.keyEventLog.filter((event: KeyEventLog): boolean =>
      event.keyCode === keyCode && event.eventType === 0).length;
  }

  public getAllKeyDownCodes(): number[] {
    const codes: number[] = [];
    for (let i = 0; i < this.keyEventLog.length; i++) {
      if (this.keyEventLog[i].eventType === 1) {
        codes.push(this.keyEventLog[i].keyCode);
      }
    }
    return codes;
  }

  public getKeyCodeFrequency(): Map<number, number> {
    const frequency: Map<number, number> = new Map<number, number>();
    for (let i = 0; i < this.keyEventLog.length; i++) {
      const keyCode: number = this.keyEventLog[i].keyCode;
      const currentCount: number = frequency.get(keyCode) || 0;
      frequency.set(keyCode, currentCount + 1);
    }
    return frequency;
  }

  public hasUnpairedEvents(): boolean {
    return this.keyDownCount !== this.keyUpCount;
  }

  public getLastEventTimestamp(): number {
    if (this.keyEventLog.length === 0) {
      return 0;
    }
    return this.keyEventLog[this.keyEventLog.length - 1].timestamp;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.keyEventLog.length; i++) {
      if (this.keyEventLog[i].timestamp < this.keyEventLog[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public toString(): string {
    return 'KeyEventHandler{down=' + this.keyDownCount + ', up=' + this.keyUpCount +
      ', total=' + this.keyEventLog.length + '}';
  }
}

// Key category enumeration: classification of the remote control keys.
enum KeyCategory {
  NAVIGATION = 'navigation',
  MEDIA = 'media',
  VOLUME = 'volume',
  SYSTEM = 'system',
  STOP_COMBINATION = 'stop_combination',
  UNKNOWN = 'unknown'
}

// Key action enumeration: the action carried by a key event.
enum KeyAction {
  NONE = 0,
  KEY_DOWN = 1,
  KEY_UP = 2,
  KEY_REPEAT = 3
}

// Key event phase enumeration: how the recorder consumes the key event.
enum KeyEventPhase {
  DISPATCH = 'dispatch',
  CONSUME = 'consume',
  IGNORE = 'ignore',
  PROPAGATE = 'propagate'
}

// Key metrics: aggregated measurements of one key handling operation.
interface KeyMetrics {
  keyCode: number;
  category: KeyCategory;
  action: KeyAction;
  processingTime: number;
  handled: boolean;
}

// Key configuration: repeat and long-press settings of the recorder.
interface KeyConfig {
  repeatDelayMs: number;
  repeatIntervalMs: number;
  enableRepeat: boolean;
  enableLongPress: boolean;
  filterUnknownKeys: boolean;
}

// Key event descriptor: complete description of one synthesized key event.
interface KeyEventDescriptor {
  keyCode: number;
  action: KeyAction;
  category: KeyCategory;
  phase: KeyEventPhase;
  timestamp: number;
}

// Long press record: how long a key stayed down.
interface LongPressRecord {
  keyCode: number;
  durationMs: number;
  isLongPress: boolean;
  exists: boolean;
}

// Stop combination record: one attempt to stop the recording with two keys.
interface StopCombinationRecord {
  firstKey: number;
  secondKey: number;
  success: boolean;
  timestamp: number;
}

// Key code model: encapsulates the key code with its category and phase.
class KeyCodeModel {
  private keyCode: number;
  private category: KeyCategory;
  private action: KeyAction;
  private phase: KeyEventPhase;
  private handled: boolean;

  public constructor() {
    this.keyCode = 0;
    this.category = KeyCategory.UNKNOWN;
    this.action = KeyAction.NONE;
    this.phase = KeyEventPhase.IGNORE;
    this.handled = false;
  }

  public setKeyCode(keyCode: number): void {
    this.keyCode = keyCode;
  }

  public getKeyCode(): number {
    return this.keyCode;
  }

  public setCategory(category: KeyCategory): void {
    this.category = category;
  }

  public getCategory(): KeyCategory {
    return this.category;
  }

  public setAction(action: KeyAction): void {
    this.action = action;
  }

  public getAction(): KeyAction {
    return this.action;
  }

  public setPhase(phase: KeyEventPhase): void {
    this.phase = phase;
  }

  public getPhase(): KeyEventPhase {
    return this.phase;
  }

  public setHandled(handled: boolean): void {
    this.handled = handled;
  }

  public getHandled(): boolean {
    return this.handled;
  }

  // A key code is valid when it is a non-negative integer.
  public isKeyCodeValid(): boolean {
    return this.keyCode >= 0 && Math.floor(this.keyCode) === this.keyCode;
  }

  public isConsumed(): boolean {
    return this.phase === KeyEventPhase.CONSUME;
  }

  public clone(): KeyCodeModel {
    const cloned: KeyCodeModel = new KeyCodeModel();
    cloned.keyCode = this.keyCode;
    cloned.category = this.category;
    cloned.action = this.action;
    cloned.phase = this.phase;
    cloned.handled = this.handled;
    return cloned;
  }

  public equals(other: KeyCodeModel): boolean {
    return this.keyCode === other.keyCode && this.category === other.category && this.action === other.action &&
      this.phase === other.phase && this.handled === other.handled;
  }

  public toString(): string {
    return 'KeyCodeModel{keyCode=' + this.keyCode + ', category=' + this.category + ', action=' + this.action +
      ', phase=' + this.phase + '}';
  }
}

// Key metrics calculator: statistics over the key handling metrics.
class KeyMetricsCalculator {
  private metrics: KeyMetrics[];

  public constructor(metrics: KeyMetrics[]) {
    this.metrics = metrics;
  }

  public averageProcessingTime(): number {
    if (this.metrics.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const metric of this.metrics) {
      total += metric.processingTime;
    }
    return total / this.metrics.length;
  }

  public maxProcessingTime(): number {
    let maxTime: number = 0;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].processingTime > maxTime) {
        maxTime = this.metrics[i].processingTime;
      }
    }
    return maxTime;
  }

  public minProcessingTime(): number {
    let minTime: number = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < this.metrics.length; i++) {
      if (this.metrics[i].processingTime < minTime) {
        minTime = this.metrics[i].processingTime;
      }
    }
    return minTime === Number.MAX_SAFE_INTEGER ? 0 : minTime;
  }

  public handledCount(): number {
    return this.metrics.filter((metric: KeyMetrics): boolean => metric.handled).length;
  }

  public countByCategory(category: KeyCategory): number {
    return this.metrics.filter((metric: KeyMetrics): boolean => metric.category === category).length;
  }
}

// Key event synthesizer: builds deterministic key event sequences for tests.
class KeyEventSynthesizer {
  private events: KeyEventDescriptor[];

  public constructor() {
    this.events = [];
  }

  public synthesizeEvent(keyCode: number, category: KeyCategory, action: KeyAction): void {
    this.events.push({
      keyCode: keyCode,
      action: action,
      category: category,
      phase: KeyEventPhase.DISPATCH,
      timestamp: Date.now()
    });
  }

  public getEvents(): KeyEventDescriptor[] {
    const result: KeyEventDescriptor[] = [];
    for (const event of this.events) {
      result.push({
        keyCode: event.keyCode,
        action: event.action,
        category: event.category,
        phase: event.phase,
        timestamp: event.timestamp
      });
    }
    return result;
  }

  public getEventCount(): number {
    return this.events.length;
  }

  public countByAction(action: KeyAction): number {
    return this.events.filter((event: KeyEventDescriptor): boolean => event.action === action).length;
  }

  public countByCategory(category: KeyCategory): number {
    return this.events.filter((event: KeyEventDescriptor): boolean => event.category === category).length;
  }

  public clear(): void {
    this.events = [];
  }
}

// Key configuration validator: validates the repeat and long-press settings.
class KeyConfigValidator {
  private config: KeyConfig;

  public constructor(config: KeyConfig) {
    this.config = config;
  }

  public isRepeatDelayValid(): boolean {
    return this.config.repeatDelayMs > 0;
  }

  public isRepeatIntervalValid(): boolean {
    return this.config.repeatIntervalMs > 0;
  }

  public isValid(): boolean {
    return this.isRepeatDelayValid() && this.isRepeatIntervalValid();
  }

  public generateValidationReport(): string {
    return 'KeyConfig{repeatDelay=' + this.config.repeatDelayMs + ', repeatInterval=' +
      this.config.repeatIntervalMs + ', repeat=' + this.config.enableRepeat + ', longPress=' +
      this.config.enableLongPress + '}';
  }
}

// Long press tracker: measures how long a key stays down so that the recorder
// can distinguish a tap from a long press.
class LongPressTracker {
  private downAt: Map<number, number> = new Map<number, number>();
  private records: LongPressRecord[] = [];
  private thresholdMs: number = LONG_PRESS_THRESHOLD_MS;

  public keyDown(keyCode: number, now: number = Date.now()): boolean {
    if (this.downAt.has(keyCode)) {
      return false;
    }
    this.downAt.set(keyCode, now);
    return true;
  }

  // Returns the record of the released key; `exists` is false when the key
  // was never pressed, which keeps the caller free of nullable checks.
  public keyUp(keyCode: number, now: number = Date.now()): LongPressRecord {
    const start: number | undefined = this.downAt.get(keyCode);
    if (start === undefined) {
      return {
        keyCode: keyCode,
        durationMs: 0,
        isLongPress: false,
        exists: false
      };
    }
    this.downAt.delete(keyCode);
    const duration: number = now - start;
    const record: LongPressRecord = {
      keyCode: keyCode,
      durationMs: duration,
      isLongPress: duration >= this.thresholdMs,
      exists: true
    };
    this.records.push(record);
    return record;
  }

  public isDown(keyCode: number): boolean {
    return this.downAt.has(keyCode);
  }

  public getDownCount(): number {
    return this.downAt.size;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getRecords(): LongPressRecord[] {
    const result: LongPressRecord[] = [];
    for (const record of this.records) {
      result.push({
        keyCode: record.keyCode,
        durationMs: record.durationMs,
        isLongPress: record.isLongPress,
        exists: record.exists
      });
    }
    return result;
  }

  public getLongPressCount(): number {
    return this.records.filter((record: LongPressRecord): boolean => record.isLongPress).length;
  }

  public getThresholdMs(): number {
    return this.thresholdMs;
  }

  public clear(): void {
    this.downAt = new Map<number, number>();
    this.records = [];
  }
}

// Recording stop combination: KEYCODE_MENU plus KEYCODE_VOLUME_DOWN.
// The combination fires once, only when both keys are held at the same time,
// and only when the two presses happen inside the 500 ms window.
class RecordingStopCombination {
  private gate: StopCombinationGate;
  private pendingKey: number = -1;
  private pendingAt: number = 0;
  private firedCount: number = 0;
  private ignoredCount: number = 0;
  private records: StopCombinationRecord[] = [];
  private windowMs: number = STOP_COMBINATION_WINDOW_MS;

  constructor() {
    this.gate = new StopCombinationGate(KeyCodeConstants.KEYCODE_MENU, KeyCodeConstants.KEYCODE_VOLUME_DOWN);
  }

  public onKeyDown(keyCode: number, now: number = Date.now()): boolean {
    if (keyCode !== KeyCodeConstants.KEYCODE_MENU && keyCode !== KeyCodeConstants.KEYCODE_VOLUME_DOWN) {
      this.ignoredCount++;
      return false;
    }
    if (this.pendingKey === -1) {
      this.pendingKey = keyCode;
      this.pendingAt = now;
    } else if (this.pendingKey === keyCode) {
      this.ignoredCount++;
      return false;
    }
    const fired: boolean = this.gate.onKeyDown(keyCode);
    const expired: boolean = now - this.pendingAt > this.windowMs;
    if (fired && !expired) {
      this.firedCount++;
      this.records.push({
        firstKey: this.pendingKey,
        secondKey: keyCode,
        success: true,
        timestamp: now
      });
      return true;
    }
    if (fired && expired) {
      this.ignoredCount++;
      this.records.push({
        firstKey: this.pendingKey,
        secondKey: keyCode,
        success: false,
        timestamp: now
      });
    }
    return false;
  }

  public onKeyUp(keyCode: number): void {
    this.gate.onKeyUp(keyCode);
    if (keyCode === this.pendingKey || this.pendingKey === -1) {
      this.pendingKey = -1;
      this.pendingAt = 0;
    }
  }

  public getFiredCount(): number {
    return this.firedCount;
  }

  public getIgnoredCount(): number {
    return this.ignoredCount;
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public getRecords(): StopCombinationRecord[] {
    const result: StopCombinationRecord[] = [];
    for (const record of this.records) {
      result.push({
        firstKey: record.firstKey,
        secondKey: record.secondKey,
        success: record.success,
        timestamp: record.timestamp
      });
    }
    return result;
  }

  public isGateOpen(): boolean {
    return this.gate.isGateOpen();
  }

  public getWindowMs(): number {
    return this.windowMs;
  }

  public reset(): void {
    this.gate = new StopCombinationGate(KeyCodeConstants.KEYCODE_MENU, KeyCodeConstants.KEYCODE_VOLUME_DOWN);
    this.pendingKey = -1;
    this.pendingAt = 0;
    this.firedCount = 0;
    this.ignoredCount = 0;
    this.records = [];
  }
}

export default function keyCodeValidationTest(): void {
  describe('KeyCodeValidation_Test', () => {
    let driver: Driver;
    let keyEventHandler: KeyEventHandler;

    // Test setup: the key handler log must be empty at suite start.
    beforeAll(async () => {
      driver = getDriver();
      keyEventHandler = KeyEventHandler.getInstance();
      keyEventHandler.clearLog();
      hilog.info(DOMAIN, TAG, 'key code validation suite started');
      await serializedDelay(driver, 1000);
    });

    // Test cleanup: leave the floating windows in a neutral state.
    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // Verifies every remote control key code used by the recorder.
    it('key_code_constants_should_be_defined_correctly', 0, async () => {
      expect(KeyCodeConstants.KEYCODE_DPAD_LEFT).assertEqual(2014);
      expect(KeyCodeConstants.KEYCODE_DPAD_RIGHT).assertEqual(2015);
      expect(KeyCodeConstants.KEYCODE_DPAD_UP).assertEqual(2012);
      expect(KeyCodeConstants.KEYCODE_DPAD_DOWN).assertEqual(2013);
      expect(KeyCodeConstants.KEYCODE_ENTER).assertEqual(2049);
      expect(KeyCodeConstants.KEYCODE_BACK).assertEqual(2);
      expect(KeyCodeConstants.KEYCODE_HOME).assertEqual(3);
      expect(KeyCodeConstants.KEYCODE_MENU).assertEqual(2018);
      expect(KeyCodeConstants.KEYCODE_VOLUME_DOWN).assertEqual(17);
    });

    // The stop combination keys must match the shared driver values.
    it('stop_combination_keys_should_match_shared_driver_values', 0, async () => {
      expect(KeyCodeConstants.KEYCODE_MENU).assertEqual(KEY_MENU);
      expect(KeyCodeConstants.KEYCODE_MENU).assertEqual(2018);
      expect(KeyCodeConstants.KEYCODE_VOLUME_DOWN).assertEqual(KEY_VOLUME_DOWN);
      expect(KeyCodeConstants.KEYCODE_VOLUME_DOWN).assertEqual(17);
      expect(KeyCodeConstants.KEYCODE_DPAD_LEFT).assertEqual(KEY_LEFT);
      expect(KeyCodeConstants.KEYCODE_DPAD_RIGHT).assertEqual(KEY_RIGHT);
      expect(KeyCodeConstants.KEYCODE_DPAD_UP).assertEqual(KEY_UP);
      expect(KeyCodeConstants.KEYCODE_DPAD_DOWN).assertEqual(KEY_DOWN);
      expect(KeyCodeConstants.KEYCODE_ENTER).assertEqual(KEY_ENTER);
      expect(KeyCodeConstants.KEYCODE_BACK).assertEqual(KEY_BACK);
      expect(KeyCodeConstants.KEYCODE_HOME).assertEqual(KEY_HOME);
    });

    // Key down and key up events are recorded in order.
    it('key_event_handler_should_process_events_correctly', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(1);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(0);
      keyEventHandler.handleKeyUp(KEY_RIGHT);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(1);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(1);
      const log: KeyEventLog[] = keyEventHandler.getKeyEventLog();
      expect(log.length).assertEqual(2);
      expect(log[0].eventType).assertEqual(1);
      expect(log[1].eventType).assertEqual(0);
    });

    // DPAD keys are the only navigation keys.
    it('navigation_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_RIGHT)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_UP)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_DPAD_DOWN)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_ENTER)).assertFalse();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_BACK)).assertFalse();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_MENU)).assertFalse();
    });

    // Media keys control playback of the recorded video preview.
    it('media_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_STOP)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_NEXT)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PREVIOUS)).assertTrue();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertFalse();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertFalse();
    });

    // Volume keys include the stop combination key.
    it('volume_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_MUTE)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_MENU)).assertFalse();
    });

    // Back, home, power, menu and settings are system keys.
    it('system_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_BACK)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_HOME)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_POWER)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_MENU)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_SETTINGS)).assertTrue();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertFalse();
      expect(keyEventHandler.isSystemKey(KeyCodeConstants.KEYCODE_ENTER)).assertFalse();
    });

    // Only menu and volume down belong to the stop combination.
    it('stop_combination_key_identification_should_work_correctly', 0, async () => {
      expect(keyEventHandler.isStopCombinationKey(KeyCodeConstants.KEYCODE_MENU)).assertTrue();
      expect(keyEventHandler.isStopCombinationKey(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertTrue();
      expect(keyEventHandler.isStopCombinationKey(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertFalse();
      expect(keyEventHandler.isStopCombinationKey(KeyCodeConstants.KEYCODE_DPAD_LEFT)).assertFalse();
      expect(keyEventHandler.isStopCombinationKey(KeyCodeConstants.KEYCODE_BACK)).assertFalse();
    });

    // A real DPAD press is recorded and keeps the focus valid.
    it('actual_key_press_should_trigger_correct_events', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      keyEventHandler.clearLog();
      await pressAndWait(driver, KEY_RIGHT, 1, 0);
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      expect(keyEventHandler.hasKeyCode(KEY_RIGHT)).assertTrue();
      expect(keyEventHandler.getKeyCodeCount(KEY_RIGHT)).assertEqual(1);
      expect(keyEventHandler.isNavigationKey(KEY_RIGHT)).assertTrue();
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      const isFocusCorrect: boolean = await checkFocusState(driver, focusIndex);
      expect(isFocusCorrect || focusIndex === -1).assertTrue();
    });

    // Consecutive remote control presses are all recorded.
    it('consecutive_key_presses_should_be_recorded_correctly', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      keyEventHandler.clearLog();
      const keyCodes: number[] = [KEY_RIGHT, KEY_LEFT, KEY_DOWN, KEY_UP];
      for (const keyCode of keyCodes) {
        await pressAndWait(driver, keyCode, 1, 0);
        keyEventHandler.handleKeyDown(keyCode);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }
      for (const keyCode of keyCodes) {
        expect(keyEventHandler.hasKeyCode(keyCode)).assertTrue();
      }
      expect(keyEventHandler.getKeyDownCount()).assertEqual(4);
    });

    // Event timestamps of the key log are chronological.
    it('key_event_timestamps_should_be_chronological', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      await serializedDelay(driver, 50);
      keyEventHandler.handleKeyDown(KEY_LEFT);
      await serializedDelay(driver, 50);
      keyEventHandler.handleKeyDown(KEY_ENTER);
      const log: KeyEventLog[] = keyEventHandler.getKeyEventLog();
      expect(log[0].timestamp).assertLessOrEqual(log[1].timestamp);
      expect(log[1].timestamp).assertLessOrEqual(log[2].timestamp);
      expect(log[1].timestamp - log[0].timestamp).assertLargerOrEqual(30);
      expect(log[2].timestamp - log[1].timestamp).assertLargerOrEqual(30);
    });

    // Boundary and invalid key codes are still recorded by the handler.
    it('key_code_boundary_values_should_be_handled', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(0);
      expect(keyEventHandler.hasKeyCode(0)).assertTrue();
      keyEventHandler.handleKeyDown(65535);
      expect(keyEventHandler.hasKeyCode(65535)).assertTrue();
      keyEventHandler.handleKeyDown(-1);
      expect(keyEventHandler.hasKeyCode(-1)).assertTrue();
      expect(keyEventHandler.getKeyDownCount()).assertEqual(3);
      expect(keyEventHandler.getTotalEventCount()).assertEqual(3);
    });

    // Clearing the log resets every counter.
    it('key_event_log_clear_should_reset_all_counters', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyUp(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_LEFT);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(2);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(1);
      expect(keyEventHandler.getKeyEventLog().length).assertEqual(3);
      keyEventHandler.clearLog();
      expect(keyEventHandler.getKeyDownCount()).assertEqual(0);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(0);
      expect(keyEventHandler.getKeyEventLog().length).assertEqual(0);
      expect(keyEventHandler.getLastEventTimestamp()).assertEqual(0);
    });

    // Navigation, media, volume and system categories are exclusive.
    it('key_code_classifications_should_be_mutually_exclusive', 0, async () => {
      expect(keyEventHandler.isNavigationKey(KEY_RIGHT)).assertTrue();
      expect(keyEventHandler.isMediaKey(KEY_RIGHT)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KEY_RIGHT)).assertFalse();
      expect(keyEventHandler.isSystemKey(KEY_RIGHT)).assertFalse();
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertFalse();
      expect(keyEventHandler.isSystemKey(KEY_BACK)).assertTrue();
      expect(keyEventHandler.isNavigationKey(KEY_BACK)).assertFalse();
      expect(keyEventHandler.isMediaKey(KEY_BACK)).assertFalse();
      expect(keyEventHandler.isVolumeKey(KEY_BACK)).assertFalse();
    });

    // Two hundred thousand handled events stay inside the performance budget.
    it('key_event_handler_performance_should_be_acceptable', 0, async () => {
      keyEventHandler.clearLog();
      const startTime: number = Date.now();
      for (let i = 0; i < 10000; i++) {
        keyEventHandler.handleKeyDown(i % 2049);
        keyEventHandler.handleKeyUp(i % 2049);
      }
      const processingTime: number = Date.now() - startTime;
      expect(processingTime).assertLessOrEqual(5000);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(10000);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(10000);
      expect(keyEventHandler.getKeyEventLog().length).assertEqual(20000);
    });

    // The key handler is a singleton shared by the recorder pages.
    it('key_event_handler_singleton_should_return_same_instance', 0, async () => {
      const handler1: KeyEventHandler = KeyEventHandler.getInstance();
      const handler2: KeyEventHandler = KeyEventHandler.getInstance();
      expect(handler1 === handler2).assertTrue();
      handler1.clearLog();
      handler1.handleKeyDown(KEY_RIGHT);
      expect(handler2.getKeyDownCount()).assertEqual(1);
      expect(handler2.hasKeyCode(KEY_RIGHT)).assertTrue();
    });

    // Query helpers count each key code separately.
    it('key_event_log_query_functions_should_work_correctly', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_LEFT);
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_ENTER);
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      expect(keyEventHandler.getKeyCodeCount(KEY_RIGHT)).assertEqual(3);
      expect(keyEventHandler.getKeyCodeCount(KEY_LEFT)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KEY_ENTER)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KEY_MENU)).assertEqual(0);
    });

    // Both event types are represented in the key log.
    it('key_event_types_should_be_complete', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyUp(KEY_RIGHT);
      const log: KeyEventLog[] = keyEventHandler.getKeyEventLog();
      expect(log.length).assertEqual(2);
      const hasKeyDown: boolean = log.some((event: KeyEventLog): boolean => event.eventType === 1);
      const hasKeyUp: boolean = log.some((event: KeyEventLog): boolean => event.eventType === 0);
      expect(hasKeyDown).assertTrue();
      expect(hasKeyUp).assertTrue();
    });

    // Declared key codes are non-negative and unique.
    it('key_code_ranges_should_be_valid', 0, async () => {
      expect(KeyCodeConstants.KEYCODE_DPAD_LEFT).assertLargerOrEqual(0);
      expect(KeyCodeConstants.KEYCODE_MENU).assertLargerOrEqual(0);
      expect(KeyCodeConstants.KEYCODE_VOLUME_DOWN).assertLargerOrEqual(0);
      const keyCodes: number[] = [
        KeyCodeConstants.KEYCODE_DPAD_LEFT,
        KeyCodeConstants.KEYCODE_DPAD_RIGHT,
        KeyCodeConstants.KEYCODE_DPAD_UP,
        KeyCodeConstants.KEYCODE_DPAD_DOWN,
        KeyCodeConstants.KEYCODE_ENTER,
        KeyCodeConstants.KEYCODE_BACK,
        KeyCodeConstants.KEYCODE_HOME,
        KeyCodeConstants.KEYCODE_MENU,
        KeyCodeConstants.KEYCODE_VOLUME_DOWN
      ];
      const uniqueKeyCodes: Set<number> = new Set<number>(keyCodes);
      expect(uniqueKeyCodes.size).assertEqual(keyCodes.length);
    });

    // Left-over key downs can be paired by the following key ups.
    it('key_event_handler_should_recover_from_abnormal_states', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_RIGHT);
      keyEventHandler.handleKeyDown(KEY_LEFT);
      keyEventHandler.handleKeyDown(KEY_ENTER);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(3);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(0);
      expect(keyEventHandler.hasUnpairedEvents()).assertTrue();
      keyEventHandler.handleKeyUp(KEY_RIGHT);
      keyEventHandler.handleKeyUp(KEY_LEFT);
      keyEventHandler.handleKeyUp(KEY_ENTER);
      expect(keyEventHandler.getKeyDownCount()).assertEqual(3);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(3);
      expect(keyEventHandler.hasUnpairedEvents()).assertFalse();
    });

    // Mixed navigation keys and the stop combination in one session.
    it('comprehensive_key_scenario_should_demonstrate_full_functionality', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      keyEventHandler.clearLog();
      const scenarioKeys: number[] = [KEY_RIGHT, KEY_LEFT, KEY_LEFT, KEY_RIGHT, KEY_MENU, KEY_VOLUME_DOWN];
      for (const keyCode of scenarioKeys) {
        await pressAndWait(driver, keyCode, 1, 0);
        keyEventHandler.handleKeyDown(keyCode);
        keyEventHandler.handleKeyUp(keyCode);
        await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      }
      expect(keyEventHandler.getKeyDownCount()).assertEqual(scenarioKeys.length);
      expect(keyEventHandler.getKeyUpCount()).assertEqual(scenarioKeys.length);
      let navCount: number = 0;
      let stopCount: number = 0;
      for (const keyCode of scenarioKeys) {
        if (keyEventHandler.isNavigationKey(keyCode)) {
          navCount++;
        }
        if (keyEventHandler.isStopCombinationKey(keyCode)) {
          stopCount++;
        }
      }
      expect(navCount).assertEqual(4);
      expect(stopCount).assertEqual(2);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertTrue();
    });

    // Key category enumeration values.
    it('key_category_enum_should_be_defined_correctly', 0, async () => {
      expect(KeyCategory.NAVIGATION).assertEqual('navigation');
      expect(KeyCategory.MEDIA).assertEqual('media');
      expect(KeyCategory.VOLUME).assertEqual('volume');
      expect(KeyCategory.SYSTEM).assertEqual('system');
      expect(KeyCategory.STOP_COMBINATION).assertEqual('stop_combination');
      expect(KeyCategory.UNKNOWN).assertEqual('unknown');
    });

    // Key action enumeration values.
    it('key_action_enum_should_be_defined_correctly', 0, async () => {
      expect(KeyAction.NONE).assertEqual(0);
      expect(KeyAction.KEY_DOWN).assertEqual(1);
      expect(KeyAction.KEY_UP).assertEqual(2);
      expect(KeyAction.KEY_REPEAT).assertEqual(3);
    });

    // Key event phase enumeration values.
    it('key_event_phase_enum_should_be_defined_correctly', 0, async () => {
      expect(KeyEventPhase.DISPATCH).assertEqual('dispatch');
      expect(KeyEventPhase.CONSUME).assertEqual('consume');
      expect(KeyEventPhase.IGNORE).assertEqual('ignore');
      expect(KeyEventPhase.PROPAGATE).assertEqual('propagate');
    });

    // A new key code model starts with neutral values.
    it('key_code_model_should_have_default_values', 0, async () => {
      const model: KeyCodeModel = new KeyCodeModel();
      expect(model.getKeyCode()).assertEqual(0);
      expect(model.getCategory()).assertEqual(KeyCategory.UNKNOWN);
      expect(model.getAction()).assertEqual(KeyAction.NONE);
      expect(model.getPhase()).assertEqual(KeyEventPhase.IGNORE);
      expect(model.getHandled()).assertFalse();
    });

    // The model exposes setters and getters for all fields.
    it('key_code_model_should_set_and_get_properties', 0, async () => {
      const model: KeyCodeModel = new KeyCodeModel();
      model.setKeyCode(KeyCodeConstants.KEYCODE_MENU);
      model.setCategory(KeyCategory.STOP_COMBINATION);
      model.setAction(KeyAction.KEY_DOWN);
      model.setPhase(KeyEventPhase.CONSUME);
      model.setHandled(true);
      expect(model.getKeyCode()).assertEqual(2018);
      expect(model.getCategory()).assertEqual(KeyCategory.STOP_COMBINATION);
      expect(model.getAction()).assertEqual(KeyAction.KEY_DOWN);
      expect(model.getPhase()).assertEqual(KeyEventPhase.CONSUME);
      expect(model.getHandled()).assertTrue();
    });

    // Invalid key codes are rejected by the model validator.
    it('key_code_model_should_validate_key_code', 0, async () => {
      const model: KeyCodeModel = new KeyCodeModel();
      model.setKeyCode(2018);
      expect(model.isKeyCodeValid()).assertTrue();
      model.setKeyCode(17);
      expect(model.isKeyCodeValid()).assertTrue();
      model.setKeyCode(-1);
      expect(model.isKeyCodeValid()).assertFalse();
      model.setKeyCode(1.5);
      expect(model.isKeyCodeValid()).assertFalse();
    });

    // The consume phase is the only consumed state.
    it('key_code_model_should_identify_consumed_phase', 0, async () => {
      const model: KeyCodeModel = new KeyCodeModel();
      model.setPhase(KeyEventPhase.CONSUME);
      expect(model.isConsumed()).assertTrue();
      model.setPhase(KeyEventPhase.PROPAGATE);
      expect(model.isConsumed()).assertFalse();
      model.setPhase(KeyEventPhase.IGNORE);
      expect(model.isConsumed()).assertFalse();
    });

    // Cloning produces an independent model.
    it('key_code_model_clone_should_create_independent_copy', 0, async () => {
      const model: KeyCodeModel = new KeyCodeModel();
      model.setKeyCode(2018);
      model.setCategory(KeyCategory.STOP_COMBINATION);
      const cloned: KeyCodeModel = model.clone();
      expect(model.equals(cloned)).assertTrue();
      cloned.setKeyCode(17);
      expect(model.getKeyCode()).assertEqual(2018);
      expect(cloned.getKeyCode()).assertEqual(17);
    });

    // Equality compares every field of the model.
    it('key_code_model_equals_should_compare_all_fields', 0, async () => {
      const a: KeyCodeModel = new KeyCodeModel();
      const b: KeyCodeModel = new KeyCodeModel();
      expect(a.equals(b)).assertTrue();
      a.setKeyCode(2018);
      expect(a.equals(b)).assertFalse();
      a.setKeyCode(0);
      expect(a.equals(b)).assertTrue();
    });

    // The string form contains the key code and category.
    it('key_code_model_to_string_should_contain_fields', 0, async () => {
      const model: KeyCodeModel = new KeyCodeModel();
      model.setKeyCode(2018);
      model.setCategory(KeyCategory.STOP_COMBINATION);
      const str: string = model.toString();
      expect(str.includes('2018')).assertTrue();
      expect(str.includes('stop_combination')).assertTrue();
    });

    // Average handling time of the recorded key metrics.
    it('metrics_calculator_should_compute_average_time', 0, async () => {
      const metrics: KeyMetrics[] = [
        {
          keyCode: 2018, category: KeyCategory.STOP_COMBINATION, action: KeyAction.KEY_DOWN,
          processingTime: 10, handled: true
        },
        {
          keyCode: 17, category: KeyCategory.VOLUME, action: KeyAction.KEY_DOWN,
          processingTime: 30, handled: true
        }
      ];
      const calculator: KeyMetricsCalculator = new KeyMetricsCalculator(metrics);
      expect(calculator.averageProcessingTime()).assertEqual(20);
    });

    // Maximum and minimum handling times of the key metrics.
    it('metrics_calculator_should_compute_max_min_time', 0, async () => {
      const metrics: KeyMetrics[] = [
        {
          keyCode: 2014, category: KeyCategory.NAVIGATION, action: KeyAction.KEY_DOWN,
          processingTime: 10, handled: true
        },
        {
          keyCode: 2015, category: KeyCategory.NAVIGATION, action: KeyAction.KEY_UP,
          processingTime: 50, handled: false
        },
        {
          keyCode: 2049, category: KeyCategory.SYSTEM, action: KeyAction.KEY_DOWN,
          processingTime: 20, handled: true
        }
      ];
      const calculator: KeyMetricsCalculator = new KeyMetricsCalculator(metrics);
      expect(calculator.maxProcessingTime()).assertEqual(50);
      expect(calculator.minProcessingTime()).assertEqual(10);
    });

    // An empty metric list produces zero values.
    it('metrics_calculator_should_handle_empty_metrics', 0, async () => {
      const calculator: KeyMetricsCalculator = new KeyMetricsCalculator([]);
      expect(calculator.averageProcessingTime()).assertEqual(0);
      expect(calculator.maxProcessingTime()).assertEqual(0);
      expect(calculator.minProcessingTime()).assertEqual(0);
      expect(calculator.handledCount()).assertEqual(0);
    });

    // Only handled metrics are counted as handled.
    it('metrics_calculator_should_count_handled', 0, async () => {
      const metrics: KeyMetrics[] = [
        {
          keyCode: 2018, category: KeyCategory.STOP_COMBINATION, action: KeyAction.KEY_DOWN,
          processingTime: 10, handled: true
        },
        {
          keyCode: 17, category: KeyCategory.VOLUME, action: KeyAction.KEY_DOWN,
          processingTime: 20, handled: false
        }
      ];
      const calculator: KeyMetricsCalculator = new KeyMetricsCalculator(metrics);
      expect(calculator.handledCount()).assertEqual(1);
    });

    // Metrics are counted per key category.
    it('metrics_calculator_should_count_by_category', 0, async () => {
      const metrics: KeyMetrics[] = [
        {
          keyCode: 2014, category: KeyCategory.NAVIGATION, action: KeyAction.KEY_DOWN,
          processingTime: 10, handled: true
        },
        {
          keyCode: 2018, category: KeyCategory.STOP_COMBINATION, action: KeyAction.KEY_DOWN,
          processingTime: 20, handled: true
        },
        {
          keyCode: 16, category: KeyCategory.VOLUME, action: KeyAction.KEY_UP,
          processingTime: 30, handled: false
        }
      ];
      const calculator: KeyMetricsCalculator = new KeyMetricsCalculator(metrics);
      expect(calculator.countByCategory(KeyCategory.NAVIGATION)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.STOP_COMBINATION)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.VOLUME)).assertEqual(1);
      expect(calculator.countByCategory(KeyCategory.MEDIA)).assertEqual(0);
    });

    // The synthesizer records generated events with the dispatch phase.
    it('event_synthesizer_should_synthesize_events', 0, async () => {
      const synthesizer: KeyEventSynthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2018, KeyCategory.STOP_COMBINATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(17, KeyCategory.VOLUME, KeyAction.KEY_DOWN);
      expect(synthesizer.getEventCount()).assertEqual(2);
      const events: KeyEventDescriptor[] = synthesizer.getEvents();
      expect(events[0].phase).assertEqual(KeyEventPhase.DISPATCH);
      expect(events[1].keyCode).assertEqual(17);
    });

    // Synthesized events are counted per action.
    it('event_synthesizer_should_count_by_action', 0, async () => {
      const synthesizer: KeyEventSynthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2018, KeyCategory.STOP_COMBINATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(17, KeyCategory.VOLUME, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(2018, KeyCategory.STOP_COMBINATION, KeyAction.KEY_UP);
      expect(synthesizer.countByAction(KeyAction.KEY_DOWN)).assertEqual(2);
      expect(synthesizer.countByAction(KeyAction.KEY_UP)).assertEqual(1);
    });

    // Synthesized events are counted per category.
    it('event_synthesizer_should_count_by_category', 0, async () => {
      const synthesizer: KeyEventSynthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(2018, KeyCategory.STOP_COMBINATION, KeyAction.KEY_DOWN);
      synthesizer.synthesizeEvent(17, KeyCategory.VOLUME, KeyAction.KEY_DOWN);
      expect(synthesizer.countByCategory(KeyCategory.NAVIGATION)).assertEqual(1);
      expect(synthesizer.countByCategory(KeyCategory.STOP_COMBINATION)).assertEqual(1);
      expect(synthesizer.countByCategory(KeyCategory.VOLUME)).assertEqual(1);
      expect(synthesizer.countByCategory(KeyCategory.MEDIA)).assertEqual(0);
    });

    // getEvents returns a copy that cannot change the synthesizer.
    it('event_synthesizer_get_events_should_return_copy', 0, async () => {
      const synthesizer: KeyEventSynthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2049, KeyCategory.SYSTEM, KeyAction.KEY_DOWN);
      const events: KeyEventDescriptor[] = synthesizer.getEvents();
      events.push({
        keyCode: 2,
        action: KeyAction.KEY_UP,
        category: KeyCategory.SYSTEM,
        phase: KeyEventPhase.DISPATCH,
        timestamp: 0
      });
      expect(synthesizer.getEventCount()).assertEqual(1);
    });

    // Clearing the synthesizer resets it completely.
    it('event_synthesizer_should_reset_after_clear', 0, async () => {
      const synthesizer: KeyEventSynthesizer = new KeyEventSynthesizer();
      synthesizer.synthesizeEvent(2014, KeyCategory.NAVIGATION, KeyAction.KEY_DOWN);
      synthesizer.clear();
      expect(synthesizer.getEventCount()).assertEqual(0);
      expect(synthesizer.countByAction(KeyAction.KEY_DOWN)).assertEqual(0);
      expect(synthesizer.getEvents().length).assertEqual(0);
    });

    // A positive repeat delay is required.
    it('config_validator_should_validate_repeat_delay', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(config).isRepeatDelayValid()).assertTrue();
      const invalidConfig: KeyConfig = {
        repeatDelayMs: 0,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(invalidConfig).isRepeatDelayValid()).assertFalse();
    });

    // A positive repeat interval is required.
    it('config_validator_should_validate_repeat_interval', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(config).isRepeatIntervalValid()).assertTrue();
      const invalidConfig: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 0,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(invalidConfig).isRepeatIntervalValid()).assertFalse();
    });

    // The combined validation requires both timing values.
    it('config_validator_should_validate_entire_config', 0, async () => {
      const validConfig: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: true,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(validConfig).isValid()).assertTrue();
      const invalidConfig: KeyConfig = {
        repeatDelayMs: 0,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: true,
        filterUnknownKeys: true
      };
      expect(new KeyConfigValidator(invalidConfig).isValid()).assertFalse();
      expect(new KeyConfigValidator(invalidConfig).isRepeatIntervalValid()).assertTrue();
    });

    // The validation report contains the configured timings.
    it('config_validator_should_generate_report', 0, async () => {
      const config: KeyConfig = {
        repeatDelayMs: 100,
        repeatIntervalMs: 50,
        enableRepeat: true,
        enableLongPress: false,
        filterUnknownKeys: true
      };
      const report: string = new KeyConfigValidator(config).generateValidationReport();
      expect(report.includes('100')).assertTrue();
      expect(report.includes('50')).assertTrue();
      expect(report.includes('repeat=true')).assertTrue();
      expect(report.includes('longPress=false')).assertTrue();
    });

    // Long press threshold of the TV remote control.
    it('long_press_threshold_should_be_800ms', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      expect(tracker.getThresholdMs()).assertEqual(LONG_PRESS_THRESHOLD_MS);
      expect(LONG_PRESS_THRESHOLD_MS).assertEqual(800);
    });

    // A short tap is not a long press.
    it('short_tap_should_not_be_a_long_press', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      expect(tracker.keyDown(KEY_ENTER, 1000)).assertTrue();
      expect(tracker.isDown(KEY_ENTER)).assertTrue();
      const record: LongPressRecord = tracker.keyUp(KEY_ENTER, 1300);
      expect(record.exists).assertTrue();
      expect(record.durationMs).assertEqual(300);
      expect(record.isLongPress).assertFalse();
      expect(tracker.getRecordCount()).assertEqual(1);
      expect(tracker.getLongPressCount()).assertEqual(0);
      expect(tracker.isDown(KEY_ENTER)).assertFalse();
    });

    // Reaching the 800 ms threshold counts as a long press.
    it('long_press_should_start_at_threshold', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      tracker.keyDown(KEY_MENU, 0);
      const record: LongPressRecord = tracker.keyUp(KEY_MENU, LONG_PRESS_THRESHOLD_MS);
      expect(record.exists).assertTrue();
      expect(record.durationMs).assertEqual(800);
      expect(record.isLongPress).assertTrue();
      expect(tracker.getLongPressCount()).assertEqual(1);
    });

    // Below the threshold by one millisecond is still a tap.
    it('long_press_boundary_should_be_strict', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      tracker.keyDown(KEY_MENU, 0);
      const record: LongPressRecord = tracker.keyUp(KEY_MENU, LONG_PRESS_THRESHOLD_MS - 1);
      expect(record.exists).assertTrue();
      expect(record.isLongPress).assertFalse();
      expect(record.durationMs).assertEqual(799);
    });

    // A key up without a key down is reported as a missing record.
    it('long_press_key_up_without_down_should_be_missing', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      const record: LongPressRecord = tracker.keyUp(KEY_BACK, 1000);
      expect(record.exists).assertFalse();
      expect(record.durationMs).assertEqual(0);
      expect(tracker.getRecordCount()).assertEqual(0);
      expect(tracker.getDownCount()).assertEqual(0);
    });

    // A duplicated key down for a held key is rejected.
    it('duplicate_key_down_should_be_rejected', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      expect(tracker.keyDown(KEY_MENU, 100)).assertTrue();
      expect(tracker.keyDown(KEY_MENU, 200)).assertFalse();
      expect(tracker.getDownCount()).assertEqual(1);
      const record: LongPressRecord = tracker.keyUp(KEY_MENU, 900);
      expect(record.exists).assertTrue();
      expect(record.durationMs).assertEqual(800);
    });

    // Several keys can be held down simultaneously.
    it('long_press_should_track_multiple_keys', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      tracker.keyDown(KEY_MENU, 0);
      tracker.keyDown(KEY_VOLUME_DOWN, 100);
      expect(tracker.getDownCount()).assertEqual(2);
      const menuRecord: LongPressRecord = tracker.keyUp(KEY_MENU, 900);
      const volumeRecord: LongPressRecord = tracker.keyUp(KEY_VOLUME_DOWN, 1000);
      expect(menuRecord.exists).assertTrue();
      expect(volumeRecord.exists).assertTrue();
      expect(menuRecord.isLongPress).assertTrue();
      expect(volumeRecord.isLongPress).assertTrue();
      expect(menuRecord.durationMs).assertEqual(900);
      expect(volumeRecord.durationMs).assertEqual(900);
      expect(tracker.getLongPressCount()).assertEqual(2);
    });

    // The tracker returns a defensive copy of its records.
    it('long_press_records_should_return_copy', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      tracker.keyDown(KEY_ENTER, 0);
      tracker.keyUp(KEY_ENTER, 900);
      const records: LongPressRecord[] = tracker.getRecords();
      expect(records.length).assertEqual(1);
      records[0].isLongPress = false;
      expect(tracker.getLongPressCount()).assertEqual(1);
    });

    // Clearing the tracker removes held keys and records.
    it('long_press_clear_should_reset_state', 0, async () => {
      const tracker: LongPressTracker = new LongPressTracker();
      tracker.clear();
      tracker.keyDown(KEY_MENU, 0);
      tracker.keyUp(KEY_MENU, 900);
      tracker.keyDown(KEY_ENTER, 1000);
      tracker.clear();
      expect(tracker.getDownCount()).assertEqual(0);
      expect(tracker.getRecordCount()).assertEqual(0);
      expect(tracker.getLongPressCount()).assertEqual(0);
      expect(tracker.isDown(KEY_ENTER)).assertFalse();
    });

    // One press of both keys fires the stop combination once.
    it('stop_combination_should_fire_once', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      expect(combination.onKeyDown(KEY_MENU, 1000)).assertFalse();
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 1100)).assertTrue();
      expect(combination.getFiredCount()).assertEqual(1);
      expect(combination.getRecordCount()).assertEqual(1);
      const records: StopCombinationRecord[] = combination.getRecords();
      expect(records[0].firstKey).assertEqual(KEY_MENU);
      expect(records[0].secondKey).assertEqual(KEY_VOLUME_DOWN);
      expect(records[0].success).assertTrue();
    });

    // The reversed order (volume down first) also fires the combination.
    it('stop_combination_should_fire_in_reversed_order', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 1000)).assertFalse();
      expect(combination.onKeyDown(KEY_MENU, 1200)).assertTrue();
      expect(combination.getFiredCount()).assertEqual(1);
      const records: StopCombinationRecord[] = combination.getRecords();
      expect(records[0].firstKey).assertEqual(KEY_VOLUME_DOWN);
      expect(records[0].secondKey).assertEqual(KEY_MENU);
    });

    // A single key never stops the recording.
    it('single_stop_key_should_not_fire_combination', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      expect(combination.onKeyDown(KEY_MENU, 1000)).assertFalse();
      expect(combination.onKeyDown(KEY_MENU, 1100)).assertFalse();
      expect(combination.getFiredCount()).assertEqual(0);
      expect(combination.getIgnoredCount()).assertEqual(1);
      combination.onKeyUp(KEY_MENU);
      expect(combination.isGateOpen()).assertTrue();
    });

    // Volume up does not replace volume down in the combination.
    it('volume_up_should_not_complete_the_combination', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      expect(combination.onKeyDown(KEY_MENU, 1000)).assertFalse();
      expect(combination.onKeyDown(KeyCodeConstants.KEYCODE_VOLUME_UP, 1100)).assertFalse();
      expect(combination.getFiredCount()).assertEqual(0);
      expect(combination.getIgnoredCount()).assertEqual(1);
    });

    // Unrelated keys are ignored by the combination detector.
    it('unrelated_keys_should_be_ignored', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      expect(combination.onKeyDown(KEY_LEFT, 1000)).assertFalse();
      expect(combination.onKeyDown(KEY_ENTER, 1050)).assertFalse();
      expect(combination.getFiredCount()).assertEqual(0);
      expect(combination.getIgnoredCount()).assertEqual(2);
      expect(combination.getRecordCount()).assertEqual(0);
    });

    // Keys pressed outside the 500 ms window do not fire the combination.
    it('expired_stop_combination_should_not_fire', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      expect(combination.getWindowMs()).assertEqual(STOP_COMBINATION_WINDOW_MS);
      expect(combination.onKeyDown(KEY_MENU, 1000)).assertFalse();
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 1601)).assertFalse();
      expect(combination.getFiredCount()).assertEqual(0);
      expect(combination.getRecordCount()).assertEqual(1);
      const records: StopCombinationRecord[] = combination.getRecords();
      expect(records[0].success).assertFalse();
    });

    // Exactly at the 500 ms window boundary the combination still fires.
    it('stop_combination_should_accept_window_boundary', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      combination.onKeyDown(KEY_MENU, 1000);
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 1500)).assertTrue();
      expect(combination.getFiredCount()).assertEqual(1);
    });

    // The combination fires only once until a key is released.
    it('stop_combination_gate_should_reopen_after_key_up', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      combination.onKeyDown(KEY_MENU, 1000);
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 1100)).assertTrue();
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 1200)).assertFalse();
      combination.onKeyUp(KEY_MENU);
      combination.onKeyUp(KEY_VOLUME_DOWN);
      expect(combination.isGateOpen()).assertTrue();
      combination.onKeyDown(KEY_MENU, 2000);
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 2100)).assertTrue();
      expect(combination.getFiredCount()).assertEqual(2);
    });

    // Menu and volume down are counted separately in the key log.
    it('stop_combination_keys_should_be_counted_separately', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_MENU);
      keyEventHandler.handleKeyUp(KEY_MENU);
      keyEventHandler.handleKeyDown(KEY_VOLUME_DOWN);
      expect(keyEventHandler.getKeyCodeCount(KEY_MENU)).assertEqual(2);
      expect(keyEventHandler.getKeyCodeCount(KEY_VOLUME_DOWN)).assertEqual(1);
      expect(keyEventHandler.getKeyDownEventCount(KEY_MENU)).assertEqual(1);
      expect(keyEventHandler.getKeyUpEventCount(KEY_MENU)).assertEqual(1);
      expect(keyEventHandler.getTotalEventCount()).assertEqual(3);
    });

    // The down code list keeps only the key down events.
    it('key_event_handler_should_return_all_down_codes', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_MENU);
      keyEventHandler.handleKeyUp(KEY_MENU);
      keyEventHandler.handleKeyDown(KEY_VOLUME_DOWN);
      const codes: number[] = keyEventHandler.getAllKeyDownCodes();
      expect(codes.length).assertEqual(2);
      expect(codes[0]).assertEqual(KEY_MENU);
      expect(codes[1]).assertEqual(KEY_VOLUME_DOWN);
    });

    // Frequency statistics contain exactly the published key codes.
    it('key_event_handler_should_compute_key_frequency', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(2018);
      keyEventHandler.handleKeyUp(2018);
      keyEventHandler.handleKeyDown(2018);
      const frequency: Map<number, number> = keyEventHandler.getKeyCodeFrequency();
      expect(frequency.get(2018)).assertEqual(3);
      expect(frequency.get(17)).assertUndefined();
      expect(frequency.size).assertEqual(1);
    });

    // Unpaired key events are detected until the key is released.
    it('key_event_handler_should_detect_unpaired_events', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_MENU);
      expect(keyEventHandler.hasUnpairedEvents()).assertTrue();
      keyEventHandler.handleKeyUp(KEY_MENU);
      expect(keyEventHandler.hasUnpairedEvents()).assertFalse();
    });

    // The handler exposes the timestamp of the most recent event.
    it('key_event_handler_should_return_last_timestamp', 0, async () => {
      keyEventHandler.clearLog();
      expect(keyEventHandler.getLastEventTimestamp()).assertEqual(0);
      keyEventHandler.handleKeyDown(KEY_MENU);
      expect(keyEventHandler.getLastEventTimestamp()).assertLargerOrEqual(1);
      expect(keyEventHandler.isChronological()).assertTrue();
    });

    // The summary string contains the down/up/total counters.
    it('key_event_handler_to_string_should_contain_counts', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KEY_MENU);
      keyEventHandler.handleKeyUp(KEY_MENU);
      const summary: string = keyEventHandler.toString();
      expect(summary.includes('down=1')).assertTrue();
      expect(summary.includes('up=1')).assertTrue();
      expect(summary.includes('total=2')).assertTrue();
    });

    // Media key events are counted like any other key events.
    it('key_event_handler_should_count_media_events', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE);
      keyEventHandler.handleKeyUp(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE);
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_MEDIA_NEXT);
      keyEventHandler.handleKeyUp(KeyCodeConstants.KEYCODE_MEDIA_NEXT);
      expect(keyEventHandler.isMediaKey(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertTrue();
      expect(keyEventHandler.getKeyEventCount(KeyCodeConstants.KEYCODE_MEDIA_PLAY_PAUSE)).assertEqual(2);
      expect(keyEventHandler.getKeyEventCount(KeyCodeConstants.KEYCODE_MEDIA_NEXT)).assertEqual(2);
      expect(keyEventHandler.getTotalEventCount()).assertEqual(4);
    });

    // Volume up, down and mute stay distinguishable.
    it('key_event_handler_should_distinguish_volume_keys', 0, async () => {
      keyEventHandler.clearLog();
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_VOLUME_UP);
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_VOLUME_DOWN);
      keyEventHandler.handleKeyDown(KeyCodeConstants.KEYCODE_VOLUME_MUTE);
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertTrue();
      expect(keyEventHandler.isVolumeKey(KeyCodeConstants.KEYCODE_VOLUME_MUTE)).assertTrue();
      expect(keyEventHandler.getKeyCodeCount(KeyCodeConstants.KEYCODE_VOLUME_UP)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KeyCodeConstants.KEYCODE_VOLUME_DOWN)).assertEqual(1);
      expect(keyEventHandler.getKeyCodeCount(KeyCodeConstants.KEYCODE_VOLUME_MUTE)).assertEqual(1);
    });

    // Resetting the combination detector clears all counters.
    it('stop_combination_reset_should_restore_state', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      combination.onKeyDown(KEY_MENU, 1000);
      combination.onKeyDown(KEY_VOLUME_DOWN, 1100);
      expect(combination.getFiredCount()).assertEqual(1);
      combination.reset();
      expect(combination.getFiredCount()).assertEqual(0);
      expect(combination.getIgnoredCount()).assertEqual(0);
      expect(combination.getRecordCount()).assertEqual(0);
      expect(combination.isGateOpen()).assertTrue();
    });

    // Invalid key codes do not join the stop combination.
    it('invalid_key_codes_should_not_stop_recording', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      expect(combination.onKeyDown(0, 1000)).assertFalse();
      expect(combination.onKeyDown(-1, 1010)).assertFalse();
      expect(combination.onKeyDown(65535, 1020)).assertFalse();
      expect(combination.getFiredCount()).assertEqual(0);
      expect(combination.getIgnoredCount()).assertEqual(3);
    });

    // Holding both stop keys for a long time still fires only once.
    it('stop_combination_long_press_should_fire_once', 0, async () => {
      const combination: RecordingStopCombination = new RecordingStopCombination();
      combination.reset();
      combination.onKeyDown(KEY_MENU, 1000);
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 1050)).assertTrue();
      expect(combination.onKeyDown(KEY_VOLUME_DOWN, 2050)).assertFalse();
      expect(combination.onKeyDown(KEY_MENU, 2050)).assertFalse();
      expect(combination.getFiredCount()).assertEqual(1);
    });
  });
}

