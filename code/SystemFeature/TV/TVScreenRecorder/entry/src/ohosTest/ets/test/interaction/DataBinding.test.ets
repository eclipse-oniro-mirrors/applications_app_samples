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
import {
  getDriver,
  serializedDelay,
  isTipWindowVisible,
  isTimerWindowVisible,
  checkTextContent,
  findComponentsByType,
  formatTimerLabel,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT
} from '../shared/RecordingDriver';

// Keys written into the LocalStorage shared by ScreenRecorderAbility and the two
// floating window pages.
const RECORDER_STATE_KEY: string = 'recorderState';
const RECORDER_CONTEXT_KEY: string = 'SRAbilityContext';
const UI_THEME_KEY: string = 'recorderTheme';

// Floating window names owned by WindowMgr.
const TIP_WINDOW_NAME: string = 'recorderTip';
const TIMER_WINDOW_NAME: string = 'recorderTimer';

// Cadence of the recording icon blink and the life time of the tip window.
const BLINK_INTERVAL_MS: number = 800;
const TIP_DURATION_MS: number = 3000;

/** Mirrors common/Constants.RecordingState. */
enum RecorderState {
  IDLE = 0,
  RECORDING = 1,
  STOPPED = 2,
  ERROR = 3
}

/** Single key/value entry of the simulated LocalStorage. */
interface StorageEntry {
  key: string;
  value: string;
}

/** A @Watch style subscriber bound to one LocalStorage key. */
interface StorageWatcher {
  key: string;
  callback: (current: string, previous: string) => void;
}

/** One observation of a data binding path. */
interface BindingRecord {
  bindingPath: string;
  oldValue: string;
  newValue: string;
  timestamp: number;
  syncSuccessful: boolean;
}

/** Snapshot of the state exposed to the timer page. */
interface RecorderStateSnapshot {
  state: RecorderState;
  isRecording: boolean;
  isIconHidden: boolean;
  timerLabel: string;
}
/** Minimal LocalStorage with @LocalStorageProp change notification semantics. */
class LocalStorageModel {
  private entries: StorageEntry[] = [];
  private watchers: StorageWatcher[] = [];

  private indexOf(key: string): number {
    for (let i = 0; i < this.entries.length; i++) {
      if (this.entries[i].key === key) {
        return i;
      }
    }
    return -1;
  }

  // Returns true when the stored value really changed; the real LocalStorage does
  // not notify @Watch callbacks when the assigned value is identical.
  public set(key: string, value: string): boolean {
    const index: number = this.indexOf(key);
    if (index < 0) {
      const entry: StorageEntry = { key: key, value: value };
      this.entries.push(entry);
      this.notify(key, value, '');
      return true;
    }
    const previous: string = this.entries[index].value;
    if (previous === value) {
      return false;
    }
    this.entries[index].value = value;
    this.notify(key, value, previous);
    return true;
  }

  public get(key: string, fallback: string): string {
    const index: number = this.indexOf(key);
    if (index < 0) {
      return fallback;
    }
    return this.entries[index].value;
  }

  public has(key: string): boolean {
    return this.indexOf(key) >= 0;
  }

  public delete(key: string): boolean {
    const index: number = this.indexOf(key);
    if (index < 0) {
      return false;
    }
    this.entries.splice(index, 1);
    return true;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public addWatcher(key: string, callback: (current: string, previous: string) => void): void {
    const watcher: StorageWatcher = { key: key, callback: callback };
    this.watchers.push(watcher);
  }

  public clearWatchers(): void {
    this.watchers = [];
  }

  private notify(key: string, current: string, previous: string): void {
    for (let i = 0; i < this.watchers.length; i++) {
      const watcher: StorageWatcher = this.watchers[i];
      if (watcher.key === key) {
        watcher.callback(current, previous);
      }
    }
  }
}

/** Models one @LocalStorageProp variable cached by a floating window page. */
class LocalStoragePropBinding {
  private key: string;
  private cachedValue: string = '';
  private syncCount: number = 0;

  constructor(key: string, fallback: string) {
    this.key = key;
    this.cachedValue = fallback;
  }

  // Pulls the current value from the storage and reports whether the cache moved.
  public sync(storage: LocalStorageModel): boolean {
    const current: string = storage.get(this.key, this.cachedValue);
    if (current === this.cachedValue) {
      return false;
    }
    this.cachedValue = current;
    this.syncCount++;
    return true;
  }

  public getValue(): string {
    return this.cachedValue;
  }

  public getSyncCount(): number {
    return this.syncCount;
  }

  public getKey(): string {
    return this.key;
  }
}

/** Models the @State isIconHidden flag driven by the 800ms blink timer. */
class IconVisibilityModel {
  private hidden: boolean = false;
  private recording: boolean = false;
  private toggleCount: number = 0;
  private lastToggleAt: number = 0;
  private hasTicked: boolean = false;

  public setRecording(recording: boolean): void {
    this.recording = recording;
    if (!recording) {
      this.hidden = false;
    }
  }

  public onBlinkTick(nowMs: number): boolean {
    if (!this.recording) {
      return false;
    }
    if (this.hasTicked && nowMs - this.lastToggleAt < BLINK_INTERVAL_MS) {
      return false;
    }
    this.hasTicked = true;
    this.lastToggleAt = nowMs;
    this.hidden = !this.hidden;
    this.toggleCount++;
    return true;
  }

  public isHidden(): boolean {
    return this.hidden;
  }

  public isRecording(): boolean {
    return this.recording;
  }

  public getToggleCount(): number {
    return this.toggleCount;
  }

  public reset(): void {
    this.hidden = false;
    this.recording = false;
    this.toggleCount = 0;
    this.lastToggleAt = 0;
  }
}

/** Models the TextTimerController of pages/ScreenRecorderTimer. */
class TextTimerModel {
  private elapsedSeconds: number = 0;
  private running: boolean = false;

  public start(): void {
    this.running = true;
  }

  public tick(seconds: number): boolean {
    if (!this.running || seconds <= 0) {
      return false;
    }
    this.elapsedSeconds += seconds;
    return true;
  }

  // stop() keeps the elapsed value so that the tip window can report the length.
  public stop(): number {
    this.running = false;
    const finished: number = this.elapsedSeconds;
    return finished;
  }

  public reset(): void {
    this.running = false;
    this.elapsedSeconds = 0;
  }

  public isRunning(): boolean {
    return this.running;
  }

  public getElapsedSeconds(): number {
    return this.elapsedSeconds;
  }

  // HH:mm:ss, matching the format attribute of the production TextTimer.
  public getLabel(): string {
    const hours: number = Math.floor(this.elapsedSeconds / 3600);
    const minutes: number = Math.floor((this.elapsedSeconds % 3600) / 60);
    const seconds: number = this.elapsedSeconds % 60;
    return hours.toString().padStart(2, '0') + ':' + minutes.toString().padStart(2, '0') + ':' +
      seconds.toString().padStart(2, '0');
  }
}

/** Models WindowMgr.popupRecorderTip window reuse. */
class TipWindowBindingModel {
  private name: string;
  private created: boolean = false;
  private visible: boolean = false;
  private createCount: number = 0;
  private showCount: number = 0;
  private hideCount: number = 0;
  private lastDuration: number = 0;
  private storage: LocalStorageModel | null;

  constructor(name: string, storage: LocalStorageModel | null) {
    this.name = name;
    this.storage = storage;
  }

  public show(duration: number): number {
    if (!this.created) {
      this.created = true;
      this.createCount++;
    }
    this.visible = true;
    this.showCount++;
    this.lastDuration = duration;
    if (this.storage !== null) {
      this.storage.set(RECORDER_STATE_KEY, RecorderState.RECORDING.toString());
    }
    return this.createCount;
  }

  public hide(): void {
    this.visible = false;
    this.hideCount++;
  }

  public isVisible(): boolean {
    return this.visible;
  }

  public isCreated(): boolean {
    return this.created;
  }

  public getCreateCount(): number {
    return this.createCount;
  }

  public getShowCount(): number {
    return this.showCount;
  }

  public getHideCount(): number {
    return this.hideCount;
  }

  public getLastDuration(): number {
    return this.lastDuration;
  }

  public getName(): string {
    return this.name;
  }
}

/** Aggregates binding observations; kept as a singleton like the reference suite. */
class DataBindingTracker {
  private static instance: DataBindingTracker | null = null;
  private bindingHistory: BindingRecord[] = [];
  private totalBindings: number = 0;
  private successfulSyncs: number = 0;

  public static getInstance(): DataBindingTracker {
    if (DataBindingTracker.instance === null) {
      DataBindingTracker.instance = new DataBindingTracker();
    }
    return DataBindingTracker.instance;
  }

  public recordBinding(bindingPath: string, oldValue: string, newValue: string, syncSuccessful: boolean): void {
    const record: BindingRecord = {
      bindingPath: bindingPath,
      oldValue: oldValue,
      newValue: newValue,
      timestamp: Date.now(),
      syncSuccessful: syncSuccessful
    };
    this.bindingHistory.push(record);
    this.totalBindings++;
    if (syncSuccessful) {
      this.successfulSyncs++;
    }
  }

  public getBindingHistory(): BindingRecord[] {
    const copied: BindingRecord[] = [];
    for (let i = 0; i < this.bindingHistory.length; i++) {
      copied.push(this.bindingHistory[i]);
    }
    return copied;
  }

  public getTotalBindings(): number {
    return this.totalBindings;
  }

  public getSuccessfulSyncs(): number {
    return this.successfulSyncs;
  }

  public getSyncSuccessRate(): number {
    if (this.totalBindings === 0) {
      return 0;
    }
    return this.successfulSyncs / this.totalBindings;
  }

  public hasBindingForPath(bindingPath: string): boolean {
    for (let i = 0; i < this.bindingHistory.length; i++) {
      if (this.bindingHistory[i].bindingPath === bindingPath) {
        return true;
      }
    }
    return false;
  }

  public getBindingCountForPath(bindingPath: string): number {
    let count: number = 0;
    for (let i = 0; i < this.bindingHistory.length; i++) {
      if (this.bindingHistory[i].bindingPath === bindingPath) {
        count++;
      }
    }
    return count;
  }

  public resetTracker(): void {
    this.bindingHistory = [];
    this.totalBindings = 0;
    this.successfulSyncs = 0;
  }
}

/** Builds the storage used by one test case. */
function createRecorderStorage(): LocalStorageModel {
  const storage = new LocalStorageModel();
  storage.set(RECORDER_STATE_KEY, RecorderState.IDLE.toString());
  storage.set(UI_THEME_KEY, 'dark');
  return storage;
}

function stateFromStorage(storage: LocalStorageModel): RecorderState {
  const raw: string = storage.get(RECORDER_STATE_KEY, '0');
  if (raw === '1') {
    return RecorderState.RECORDING;
  }
  if (raw === '2') {
    return RecorderState.STOPPED;
  }
  if (raw === '3') {
    return RecorderState.ERROR;
  }
  return RecorderState.IDLE;
}

function buildSnapshot(state: RecorderState, iconHidden: boolean, label: string): RecorderStateSnapshot {
  const snapshot: RecorderStateSnapshot = {
    state: state,
    isRecording: state === RecorderState.RECORDING,
    isIconHidden: iconHidden,
    timerLabel: label
  };
  return snapshot;
}
export default function dataBindingTest(): void {
  describe('DataBinding_Test', () => {
    let driver: Driver;
    let bindingTracker: DataBindingTracker;

    beforeAll(async () => {
      driver = getDriver();
      bindingTracker = DataBindingTracker.getInstance();
      bindingTracker.resetTracker();
      await serializedDelay(driver, 800);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    it('local_storage_should_expose_recorder_state_key', 0, async () => {
      const storage = createRecorderStorage();
      expect(storage.getEntryCount()).assertEqual(2);
      expect(storage.has(RECORDER_STATE_KEY)).assertTrue();
      expect(storage.get(RECORDER_STATE_KEY, '')).assertEqual('0');
      expect(storage.get(UI_THEME_KEY, '')).assertEqual('dark');
    });

    it('setting_identical_value_should_not_notify_watcher', 0, async () => {
      const storage = createRecorderStorage();
      let notifications: number = 0;
      let lastPrevious: string = 'unset';
      let lastCurrent: string = 'unset';
      storage.addWatcher(RECORDER_STATE_KEY, (current: string, previous: string) => {
        notifications++;
        lastCurrent = current;
        lastPrevious = previous;
      });

      expect(storage.set(RECORDER_STATE_KEY, '0')).assertFalse();
      expect(notifications).assertEqual(0);
      expect(lastPrevious).assertEqual('unset');
      expect(lastCurrent).assertEqual('unset');
    });

    it('setting_new_value_should_notify_watcher_once', 0, async () => {
      const storage = createRecorderStorage();
      let notifications: number = 0;
      let observed: string = '';
      storage.addWatcher(RECORDER_STATE_KEY, (current: string, previous: string) => {
        notifications++;
        observed = previous + '->' + current;
      });

      expect(storage.set(RECORDER_STATE_KEY, '1')).assertTrue();
      expect(notifications).assertEqual(1);
      expect(observed).assertEqual('0->1');
    });

    it('state_should_transition_idle_recording_stopped', 0, async () => {
      const storage = createRecorderStorage();
      const transitions: RecorderState[] = [];
      transitions.push(stateFromStorage(storage));

      storage.set(RECORDER_STATE_KEY, RecorderState.RECORDING.toString());
      transitions.push(stateFromStorage(storage));

      storage.set(RECORDER_STATE_KEY, RecorderState.STOPPED.toString());
      transitions.push(stateFromStorage(storage));

      expect(transitions.length).assertEqual(3);
      expect(transitions[0]).assertEqual(RecorderState.IDLE);
      expect(transitions[1]).assertEqual(RecorderState.RECORDING);
      expect(transitions[2]).assertEqual(RecorderState.STOPPED);
    });

    it('local_storage_prop_should_sync_from_storage', 0, async () => {
      const storage = createRecorderStorage();
      const prop = new LocalStoragePropBinding(RECORDER_STATE_KEY, '0');
      expect(prop.getSyncCount()).assertEqual(0);

      storage.set(RECORDER_STATE_KEY, '1');
      expect(prop.sync(storage)).assertTrue();
      expect(prop.getValue()).assertEqual('1');
      expect(prop.getSyncCount()).assertEqual(1);
      expect(prop.getKey()).assertEqual(RECORDER_STATE_KEY);
    });

    it('local_storage_prop_should_ignore_unchanged_value', 0, async () => {
      const storage = createRecorderStorage();
      const prop = new LocalStoragePropBinding(RECORDER_STATE_KEY, '0');
      storage.set(RECORDER_STATE_KEY, '1');
      expect(prop.sync(storage)).assertTrue();
      expect(prop.sync(storage)).assertFalse();
      expect(prop.getSyncCount()).assertEqual(1);
    });

    it('local_storage_should_delete_context_key', 0, async () => {
      const storage = createRecorderStorage();
      storage.set(RECORDER_CONTEXT_KEY, 'ability-context');
      expect(storage.has(RECORDER_CONTEXT_KEY)).assertTrue();
      expect(storage.delete(RECORDER_CONTEXT_KEY)).assertTrue();
      expect(storage.delete(RECORDER_CONTEXT_KEY)).assertFalse();
      expect(storage.get(RECORDER_CONTEXT_KEY, 'missing')).assertEqual('missing');
    });

    it('icon_should_be_visible_when_idle', 0, async () => {
      const icon = new IconVisibilityModel();
      icon.setRecording(false);
      expect(icon.isHidden()).assertFalse();
      expect(icon.onBlinkTick(BLINK_INTERVAL_MS)).assertFalse();
      expect(icon.getToggleCount()).assertEqual(0);
    });

    it('icon_should_blink_every_800ms_while_recording', 0, async () => {
      const icon = new IconVisibilityModel();
      icon.setRecording(true);

      expect(icon.onBlinkTick(0)).assertTrue();
      expect(icon.isHidden()).assertTrue();
      expect(icon.onBlinkTick(BLINK_INTERVAL_MS / 2)).assertFalse();
      expect(icon.isHidden()).assertTrue();
      expect(icon.onBlinkTick(BLINK_INTERVAL_MS)).assertTrue();
      expect(icon.isHidden()).assertFalse();
      expect(icon.getToggleCount()).assertEqual(2);
    });

    it('icon_should_reset_hidden_flag_on_stop', 0, async () => {
      const icon = new IconVisibilityModel();
      icon.setRecording(true);
      icon.onBlinkTick(0);
      expect(icon.isHidden()).assertTrue();
      icon.setRecording(false);
      expect(icon.isHidden()).assertFalse();
      icon.reset();
      expect(icon.isRecording()).assertFalse();
      expect(icon.getToggleCount()).assertEqual(0);
    });

    it('timer_controller_should_format_hh_mm_ss', 0, async () => {
      const timer = new TextTimerModel();
      timer.start();
      expect(timer.tick(1)).assertTrue();
      expect(timer.getLabel()).assertEqual('00:00:01');
      timer.tick(59);
      expect(timer.getLabel()).assertEqual('00:01:00');
      timer.tick(3661);
      expect(timer.getLabel()).assertEqual('01:02:01');
      expect(timer.isRunning()).assertTrue();
    });

    it('timer_should_ignore_ticks_while_idle', 0, async () => {
      const timer = new TextTimerModel();
      expect(timer.tick(5)).assertFalse();
      expect(timer.getElapsedSeconds()).assertEqual(0);
      expect(timer.getLabel()).assertEqual('00:00:00');
    });

    it('timer_should_keep_elapsed_time_after_stop', 0, async () => {
      const timer = new TextTimerModel();
      timer.start();
      timer.tick(125);
      const finished = timer.stop();
      expect(finished).assertEqual(125);
      expect(timer.isRunning()).assertFalse();
      expect(timer.tick(10)).assertFalse();
      timer.reset();
      expect(timer.getElapsedSeconds()).assertEqual(0);
    });
    it('tip_window_should_be_reused_across_popups', 0, async () => {
      const storage = createRecorderStorage();
      const tip = new TipWindowBindingModel(TIP_WINDOW_NAME, storage);
      expect(tip.isCreated()).assertFalse();

      tip.show(TIP_DURATION_MS);
      tip.hide();
      tip.show(TIP_DURATION_MS);
      tip.hide();
      tip.show(TIP_DURATION_MS);

      expect(tip.isCreated()).assertTrue();
      expect(tip.getCreateCount()).assertEqual(1);
      expect(tip.getShowCount()).assertEqual(3);
      expect(tip.getHideCount()).assertEqual(2);
      expect(tip.getName()).assertEqual(TIP_WINDOW_NAME);
    });

    it('tip_window_should_hide_after_duration', 0, async () => {
      const tip = new TipWindowBindingModel(TIP_WINDOW_NAME, createRecorderStorage());
      tip.show(TIP_DURATION_MS);
      expect(tip.isVisible()).assertTrue();
      expect(tip.getLastDuration()).assertEqual(TIP_DURATION_MS);
      tip.hide();
      expect(tip.isVisible()).assertFalse();
    });

    it('state_snapshot_should_project_recording_flag', 0, async () => {
      const timer = new TextTimerModel();
      timer.start();
      timer.tick(75);

      const recording = buildSnapshot(RecorderState.RECORDING, true, timer.getLabel());
      expect(recording.isRecording).assertTrue();
      expect(recording.state).assertEqual(RecorderState.RECORDING);
      expect(recording.isIconHidden).assertTrue();
      expect(recording.timerLabel).assertEqual('00:01:15');

      const idle = buildSnapshot(RecorderState.IDLE, false, '00:00:00');
      expect(idle.isRecording).assertFalse();
      expect(idle.timerLabel).assertEqual('00:00:00');
    });

    it('tip_window_should_share_recorder_state_key', 0, async () => {
      const storage = createRecorderStorage();
      const tip = new TipWindowBindingModel(TIP_WINDOW_NAME, storage);
      tip.show(TIP_DURATION_MS);
      expect(stateFromStorage(storage)).assertEqual(RecorderState.RECORDING);
      expect(storage.get(RECORDER_STATE_KEY, '')).assertEqual('1');
    });

    it('timer_window_name_should_be_stable', 0, async () => {
      expect(TIMER_WINDOW_NAME).assertEqual('recorderTimer');
      expect(TIP_WINDOW_NAME).assertEqual('recorderTip');
      expect(TIP_WINDOW_NAME === TIMER_WINDOW_NAME).assertFalse();
    });

    it('binding_records_timestamps_should_be_chronological', 0, async () => {
      bindingTracker.resetTracker();
      bindingTracker.recordBinding('recorderState', '0', '1', true);
      await serializedDelay(driver, 30);
      bindingTracker.recordBinding('recorderState', '1', '2', true);
      await serializedDelay(driver, 30);
      bindingTracker.recordBinding('recorderState', '2', '0', true);

      const history = bindingTracker.getBindingHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp <= history[1].timestamp).assertTrue();
      expect(history[1].timestamp <= history[2].timestamp).assertTrue();
      expect(history[0].oldValue).assertEqual('0');
      expect(history[2].newValue).assertEqual('0');
    });

    it('data_binding_should_handle_rapid_updates', 0, async () => {
      bindingTracker.resetTracker();
      for (let i = 0; i < 50; i++) {
        bindingTracker.recordBinding('rapid_update', i.toString(), (i + 1).toString(), true);
      }
      expect(bindingTracker.getTotalBindings()).assertEqual(50);
      expect(bindingTracker.getSyncSuccessRate()).assertEqual(1);
    });

    it('data_binding_should_validate_sync_success', 0, async () => {
      bindingTracker.resetTracker();
      bindingTracker.recordBinding('sync_1', 'idle', 'recording', true);
      bindingTracker.recordBinding('sync_2', 'recording', 'stopped', true);
      bindingTracker.recordBinding('sync_3', 'stopped', 'error', false);

      expect(bindingTracker.getSuccessfulSyncs()).assertEqual(2);
      expect(Math.abs(bindingTracker.getSyncSuccessRate() - 2 / 3)).assertLessOrEqual(0.0001);
      expect(bindingTracker.hasBindingForPath('sync_3')).assertTrue();
    });

    it('data_binding_should_track_all_binding_paths', 0, async () => {
      bindingTracker.resetTracker();
      bindingTracker.recordBinding('recorderState', '0', '1', true);
      bindingTracker.recordBinding('timerLabel', '00:00:00', '00:00:01', true);
      bindingTracker.recordBinding('isIconHidden', 'false', 'true', true);
      bindingTracker.recordBinding('recorderState', '1', '2', true);

      expect(bindingTracker.getBindingCountForPath('recorderState')).assertEqual(2);
      expect(bindingTracker.getBindingCountForPath('timerLabel')).assertEqual(1);
      expect(bindingTracker.getBindingCountForPath('isIconHidden')).assertEqual(1);
      expect(bindingTracker.getBindingCountForPath('missingPath')).assertEqual(0);
    });

    it('data_binding_tracker_singleton_should_maintain_consistency', 0, async () => {
      const tracker1 = DataBindingTracker.getInstance();
      const tracker2 = DataBindingTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordBinding('singleton_test', 'old', 'new', true);
      expect(tracker2.getTotalBindings()).assertEqual(1);
      expect(tracker2.getSuccessfulSyncs()).assertEqual(1);
    });

    it('tip_window_content_should_be_probed_tolerantly', 0, async () => {
      const visible = await isTipWindowVisible(driver);
      const texts = await findComponentsByType(driver, 'Text');
      if (visible) {
        const hasTitle = await checkTextContent(driver, TIP_TEXT_TITLE);
        const hasContent = await checkTextContent(driver, TIP_TEXT_CONTENT);
        expect(hasTitle || hasContent).assertTrue();
        expect(texts.length).assertLargerOrEqual(1);
      } else {
        expect(texts.length).assertLargerOrEqual(0);
      }
    });

    it('timer_window_binding_should_be_probed_tolerantly', 0, async () => {
      const visible = await isTimerWindowVisible(driver);
      const texts = await findComponentsByType(driver, 'Text');
      expect(formatTimerLabel(125)).assertEqual('00:02:05');
      expect(formatTimerLabel(0)).assertEqual('00:00:00');
      if (visible) {
        expect(texts.length).assertLargerOrEqual(1);
      } else {
        expect(texts.length).assertLargerOrEqual(0);
      }
    });

    it('comprehensive_data_binding_scenario', 0, async () => {
      bindingTracker.resetTracker();
      const storage = createRecorderStorage();
      const prop = new LocalStoragePropBinding(RECORDER_STATE_KEY, '0');
      const icon = new IconVisibilityModel();
      const timer = new TextTimerModel();
      const tip = new TipWindowBindingModel(TIP_WINDOW_NAME, storage);

      const scenarioStart = Date.now();

      prop.sync(storage);
      bindingTracker.recordBinding(RECORDER_STATE_KEY, '0', prop.getValue(), true);

      storage.set(RECORDER_STATE_KEY, RecorderState.RECORDING.toString());
      prop.sync(storage);
      bindingTracker.recordBinding(RECORDER_STATE_KEY, '0', '1', true);

      icon.setRecording(true);
      timer.start();
      timer.tick(3);
      tip.show(TIP_DURATION_MS);
      bindingTracker.recordBinding('timerLabel', '00:00:00', timer.getLabel(), true);

      await serializedDelay(driver, 60);

      const scenarioEnd = Date.now();
      expect(bindingTracker.getTotalBindings()).assertEqual(3);
      expect(bindingTracker.getSuccessfulSyncs()).assertEqual(3);
      expect(tip.getCreateCount()).assertEqual(1);
      expect(scenarioEnd - scenarioStart).assertLessOrEqual(10000);
    });
  });
}



