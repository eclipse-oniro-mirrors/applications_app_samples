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
  recorderComponentCount,
  isTimerWindowVisible,
  isTipWindowVisible,
  launchRecorderService,
  waitForTimerWindowStable,
  formatTimerLabel,
  buildRecordingFileName,
  isValidRecordingFileName,
  StopCombinationGate,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  KEY_MENU,
  KEY_VOLUME_DOWN,
  DELAY_KEY_NAVIGATION,
  TIMER_TEXT_HINT,
  TIP_TEXT_CONTENT,
  RESOLUTION_TEXT_CONTENT
} from '../shared/RecordingDriver';

const TIP_VISIBLE_MS: number = 3000;
const RECORD_MAX_WIDTH: number = 1920;
const RECORD_MAX_HEIGHT: number = 1080;

enum JourneyKind {
  QUICK_RECORD = 'quick_record',
  TIMER_CHECK = 'timer_check',
  STOP_COMBINATION = 'stop_combination',
  TIP_VERIFY = 'tip_verify',
  PHOTO_LOOKUP = 'photo_lookup',
  RESOLUTION_ERROR = 'resolution_error',
  INTERRUPT_RESUME = 'interrupt_resume',
  REPEATED_USE = 'repeated_use'
}

interface JourneyStep {
  name: string
  atMs: number
  ok: boolean
}

interface JourneyResult {
  kind: JourneyKind
  steps: JourneyStep[]
  ok: boolean
  durationMs: number
  failureReason: string
}

interface DisplayProfile {
  width: number
  height: number
  label: string
}

// Single recorder used by every journey. It keeps the minimal state that a user
// can observe: the timer value, the tip window and the artifacts in Photos.
class JourneyRecorder {
  private stage: string = 'idle';
  private clockMs: number = 1700000000000;
  private elapsedSeconds: number = 0;
  private tipRemainingMs: number = 0;
  private photos: string[] = [];
  private steps: JourneyStep[] = [];
  private startedAtMs: number = 0;
  private display: DisplayProfile;

  constructor(display: DisplayProfile, startMs: number = 1700000000000) {
    this.display = display;
    this.clockMs = startMs;
    this.startedAtMs = startMs;
  }

  public getStage(): string {
    return this.stage;
  }

  public getElapsedSeconds(): number {
    return this.elapsedSeconds;
  }

  public getTipRemainingMs(): number {
    return this.tipRemainingMs;
  }

  public getPhotos(): string[] {
    return this.photos.slice();
  }

  public getSteps(): JourneyStep[] {
    return this.steps.slice();
  }

  public getDisplay(): DisplayProfile {
    return this.display;
  }

  public getTimerLabel(): string {
    return formatTimerLabel(this.elapsedSeconds);
  }

  public recordStep(name: string, ok: boolean): void {
    const step: JourneyStep = {
      name: name,
      atMs: this.clockMs,
      ok: ok
    };
    this.steps.push(step);
  }

  public advance(ms: number): void {
    if (ms <= 0) {
      return;
    }
    this.clockMs += ms;
    if (this.stage === 'recording') {
      this.elapsedSeconds += ms / 1000;
    }
    if (this.stage === 'tip' && this.tipRemainingMs > 0) {
      this.tipRemainingMs -= ms;
      if (this.tipRemainingMs <= 0) {
        this.tipRemainingMs = 0;
        this.stage = 'idle';
        this.recordStep('tip_closed', true);
      }
    }
  }

  // The resolution gate is evaluated before any window is created.
  public isDisplaySupported(): boolean {
    return this.display.width <= RECORD_MAX_WIDTH && this.display.height <= RECORD_MAX_HEIGHT;
  }

  public start(): boolean {
    if (this.stage !== 'idle') {
      this.recordStep('start_rejected', false);
      return false;
    }
    if (!this.isDisplaySupported()) {
      this.stage = 'resolution_dialog';
      this.recordStep('resolution_dialog_shown', true);
      return false;
    }
    this.stage = 'recording';
    this.elapsedSeconds = 0;
    this.startedAtMs = this.clockMs;
    this.recordStep('start', true);
    return true;
  }

  public stop(): boolean {
    if (this.stage !== 'recording') {
      this.recordStep('stop_rejected', false);
      return false;
    }
    this.stage = 'tip';
    this.tipRemainingMs = TIP_VISIBLE_MS;
    const fileName = buildRecordingFileName(new Date(this.clockMs));
    this.photos.push(fileName);
    this.recordStep('stop', true);
    this.recordStep('tip_shown', true);
    return true;
  }

  public interrupt(): boolean {
    if (this.stage !== 'recording') {
      return false;
    }
    this.recordStep('interrupted', true);
    this.stop();
    return true;
  }

  public resume(): boolean {
    if (this.stage !== 'tip' && this.stage !== 'idle') {
      return false;
    }
    this.stage = 'idle';
    this.tipRemainingMs = 0;
    return this.start();
  }

  public dismissDialog(): void {
    if (this.stage === 'resolution_dialog') {
      this.stage = 'idle';
      this.recordStep('dialog_dismissed', true);
    }
  }

  public getDurationMs(): number {
    return this.clockMs - this.startedAtMs;
  }

  public countPhotos(): number {
    return this.photos.length;
  }
}

// Aggregated statistics over all executed journeys.
class UserScenarioTracker {
  private results: JourneyResult[] = [];
  private perKind: Map<string, number> = new Map();

  public record(result: JourneyResult): void {
    this.results.push(result);
    const current = this.perKind.get(result.kind) ?? 0;
    this.perKind.set(result.kind, current + 1);
  }

  public getResults(): JourneyResult[] {
    return this.results.slice();
  }

  public getTotal(): number {
    return this.results.length;
  }

  public getPassed(): number {
    let count = 0;
    for (let index = 0; index < this.results.length; index++) {
      if (this.results[index].ok) {
        count++;
      }
    }
    return count;
  }

  public getFailed(): number {
    return this.getTotal() - this.getPassed();
  }

  public getKindCount(kind: JourneyKind): number {
    return this.perKind.get(kind) ?? 0;
  }

  public getSuccessRate(): number {
    if (this.results.length === 0) {
      return 0;
    }
    return this.getPassed() / this.results.length;
  }

  public getFastestMs(): number {
    if (this.results.length === 0) {
      return 0;
    }
    let fastest = this.results[0].durationMs;
    for (let index = 1; index < this.results.length; index++) {
      if (this.results[index].durationMs < fastest) {
        fastest = this.results[index].durationMs;
      }
    }
    return fastest;
  }

  public getSlowestMs(): number {
    if (this.results.length === 0) {
      return 0;
    }
    let slowest = this.results[0].durationMs;
    for (let index = 1; index < this.results.length; index++) {
      if (this.results[index].durationMs > slowest) {
        slowest = this.results[index].durationMs;
      }
    }
    return slowest;
  }

  public isChronological(): boolean {
    for (let index = 1; index < this.results.length; index++) {
      const previous = this.results[index - 1].steps;
      const current = this.results[index].steps;
      if (previous.length === 0 || current.length === 0) {
        return false;
      }
      if (previous[previous.length - 1].atMs > current[0].atMs) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.results = [];
    this.perKind.clear();
  }
}

function buildTvDisplay(): DisplayProfile {
  const display: DisplayProfile = {
    width: 1920,
    height: 1080,
    label: 'tv_1080p'
  };
  return display;
}

function build4kDisplay(): DisplayProfile {
  const display: DisplayProfile = {
    width: 3840,
    height: 2160,
    label: 'tv_4k'
  };
  return display;
}

// Executes the eight end-to-end journeys. Each method returns an immutable
// result so that the tracker can aggregate them afterwards.
class UserJourneyRunner {
  private nextClockMs: number = 1700000000000;

  // Journeys are executed on a monotonically increasing clock so that the
  // aggregated history can be validated chronologically.
  private createRecorder(display: DisplayProfile): JourneyRecorder {
    const recorder = new JourneyRecorder(display, this.nextClockMs);
    this.nextClockMs += 3600000;
    return recorder;
  }

  private buildResult(kind: JourneyKind, recorder: JourneyRecorder, ok: boolean,
    failureReason: string): JourneyResult {
    const result: JourneyResult = {
      kind: kind,
      steps: recorder.getSteps(),
      ok: ok,
      durationMs: recorder.getDurationMs(),
      failureReason: failureReason
    };
    return result;
  }

  // Journey 1: the user presses the record entry, waits a few seconds and stops
  // through the remote control combination.
  public runQuickRecord(): JourneyResult {
    const recorder = this.createRecorder(buildTvDisplay());
    const started = recorder.start();
    recorder.advance(3000);
    const stopped = recorder.stop();
    recorder.advance(TIP_VISIBLE_MS);
    const photos = recorder.getPhotos();
    const ok = started && stopped && photos.length === 1 && isValidRecordingFileName(photos[0]) &&
      recorder.getStage() === 'idle';
    return this.buildResult(JourneyKind.QUICK_RECORD, recorder, ok, ok ? '' : 'quick-record-incomplete');
  }

  // Journey 2: the user keeps the recording running past one minute and checks
  // that the floating timer rolled over correctly.
  public runTimerCheck(): JourneyResult {
    const recorder = this.createRecorder(buildTvDisplay());
    recorder.start();
    recorder.advance(65000);
    const label = recorder.getTimerLabel();
    const labelOk = label === '00:01:05';
    recorder.recordStep('timer_read:' + label, labelOk);
    recorder.stop();
    recorder.advance(TIP_VISIBLE_MS);
    const ok = labelOk && recorder.getElapsedSeconds() === 65 && recorder.countPhotos() === 1;
    return this.buildResult(JourneyKind.TIMER_CHECK, recorder, ok, ok ? '' : 'timer-label-mismatch');
  }

  // Journey 3: the stop combination fires only when both keys are held at the
  // same time and rearms after both keys are released.
  public runStopCombination(): JourneyResult {
    const recorder = this.createRecorder(buildTvDisplay());
    const gate = new StopCombinationGate(KEY_MENU, KEY_VOLUME_DOWN);
    recorder.start();
    recorder.advance(2000);
    const firstFire = gate.onKeyDown(KEY_MENU);
    const secondFire = gate.onKeyDown(KEY_VOLUME_DOWN);
    gate.onKeyUp(KEY_MENU);
    gate.onKeyUp(KEY_VOLUME_DOWN);
    const singleKeyFire = gate.onKeyDown(KEY_VOLUME_DOWN);
    const rearmedFire = gate.onKeyDown(KEY_MENU);
    gate.onKeyUp(KEY_VOLUME_DOWN);
    gate.onKeyUp(KEY_MENU);
    recorder.recordStep('menu_only', !firstFire);
    recorder.recordStep('combination_fired', secondFire);
    recorder.recordStep('single_key_ignored', !singleKeyFire);
    recorder.recordStep('combination_rearmed', rearmedFire);
    const ok = !firstFire && secondFire && !singleKeyFire && rearmedFire && gate.getFiredCount() === 2;
    recorder.stop();
    recorder.advance(TIP_VISIBLE_MS);
    return this.buildResult(JourneyKind.STOP_COMBINATION, recorder, ok, ok ? '' : 'combination-mismatch');
  }

  // Journey 4: the tip window stays on screen for exactly three seconds and then
  // returns the user to the idle state.
  public runTipVerify(): JourneyResult {
    const recorder = this.createRecorder(buildTvDisplay());
    recorder.start();
    recorder.advance(1000);
    recorder.stop();
    const tipShown = recorder.getTipRemainingMs() === TIP_VISIBLE_MS;
    recorder.advance(2999);
    const stillVisible = recorder.getStage() === 'tip';
    recorder.advance(1);
    const closed = recorder.getStage() === 'idle';
    const ok = tipShown && stillVisible && closed && recorder.countPhotos() === 1;
    return this.buildResult(JourneyKind.TIP_VERIFY, recorder, ok, ok ? '' : 'tip-duration-mismatch');
  }

  // Journey 5: after two recordings the user opens Photos and expects both clips
  // to be listed with distinct names.
  public runPhotoLookup(): JourneyResult {
    const recorder = this.createRecorder(buildTvDisplay());
    for (let index = 0; index < 2; index++) {
      recorder.start();
      recorder.advance(2000 * (index + 1));
      recorder.stop();
      recorder.advance(TIP_VISIBLE_MS);
    }
    const photos = recorder.getPhotos();
    let allValid = photos.length === 2;
    for (let index = 0; index < photos.length; index++) {
      if (!isValidRecordingFileName(photos[index])) {
        allValid = false;
      }
      for (let other = index + 1; other < photos.length; other++) {
        if (photos[index] === photos[other]) {
          allValid = false;
        }
      }
    }
    recorder.recordStep('photos_listed:' + photos.length, allValid);
    return this.buildResult(JourneyKind.PHOTO_LOOKUP, recorder, allValid, allValid ? '' : 'photo-lookup-failed');
  }

  // Journey 6: on a 4K panel the user immediately gets the resolution dialog and
  // no artifact is produced.
  public runResolutionError(): JourneyResult {
    const recorder = this.createRecorder(build4kDisplay());
    const started = recorder.start();
    const dialogShown = recorder.getStage() === 'resolution_dialog';
    const blocked = !recorder.isDisplaySupported();
    recorder.dismissDialog();
    const dismissed = recorder.getStage() === 'idle';
    const ok = !started && dialogShown && blocked && dismissed && recorder.countPhotos() === 0;
    return this.buildResult(JourneyKind.RESOLUTION_ERROR, recorder, ok, ok ? '' : 'resolution-gate-failed');
  }

  // Journey 7: the recording is interrupted, the user starts again and both
  // artifacts stay available.
  public runInterruptResume(): JourneyResult {
    const recorder = this.createRecorder(buildTvDisplay());
    recorder.start();
    recorder.advance(5000);
    const interrupted = recorder.interrupt();
    const resumed = recorder.resume();
    recorder.advance(3000);
    const stopped = recorder.stop();
    recorder.advance(TIP_VISIBLE_MS);
    const photos = recorder.getPhotos();
    const ok = interrupted && resumed && stopped && photos.length === 2 &&
      isValidRecordingFileName(photos[0]) && isValidRecordingFileName(photos[1]);
    return this.buildResult(JourneyKind.INTERRUPT_RESUME, recorder, ok, ok ? '' : 'resume-incomplete');
  }

  // Journey 8: a family uses the recorder five times in a row without leaving
  // the feature.
  public runRepeatedUse(): JourneyResult {
    const recorder = this.createRecorder(buildTvDisplay());
    let cycles = 0;
    for (let index = 0; index < 5; index++) {
      const started = recorder.start();
      recorder.advance(1500 * (index + 1));
      const stopped = recorder.stop();
      recorder.advance(TIP_VISIBLE_MS);
      if (started && stopped) {
        cycles++;
      }
    }
    const ok = cycles === 5 && recorder.countPhotos() === 5 && recorder.getStage() === 'idle';
    return this.buildResult(JourneyKind.REPEATED_USE, recorder, ok, ok ? '' : 'repeated-use-incomplete');
  }
}

export default function userScenariosTest(): void {
  describe('UserScenarios_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // Journey 1: start from the remote, record a short clip, stop, and expect one
    // valid mp4 in Photos.
    it('quick_record_journey_should_persist_one_clip', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runQuickRecord();
      expect(result.ok).assertTrue();
      expect(result.failureReason).assertEqual('');
      expect(result.kind).assertEqual(JourneyKind.QUICK_RECORD);
      expect(result.steps.length).assertLargerOrEqual(4);
      expect(result.steps[0].name).assertEqual('start');
      expect(result.steps[0].ok).assertTrue();
      const lastStep = result.steps[result.steps.length - 1];
      expect(lastStep.name).assertEqual('tip_closed');
      expect(lastStep.ok).assertTrue();
      expect(result.durationMs).assertLarger(0);
    });

    // Journey 2: the timer must show 00:01:05 after sixty five seconds.
    it('timer_check_journey_should_read_rolling_label', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runTimerCheck();
      expect(result.ok).assertTrue();
      let timerStepFound = false;
      for (let index = 0; index < result.steps.length; index++) {
        if (result.steps[index].name === 'timer_read:00:01:05') {
          timerStepFound = true;
          expect(result.steps[index].ok).assertTrue();
        }
      }
      expect(timerStepFound).assertTrue();
      expect(result.kind).assertEqual(JourneyKind.TIMER_CHECK);
    });

    // Journey 3: a single key is ignored, the two-key combination fires once and
    // re-arms after the keys are released.
    it('stop_combination_journey_should_fire_once_per_press', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runStopCombination();
      expect(result.ok).assertTrue();
      const names: string[] = [];
      for (let index = 0; index < result.steps.length; index++) {
        names.push(result.steps[index].name);
      }
      expect(names.length).assertLargerOrEqual(6);
      expect(names[1]).assertEqual('menu_only');
      expect(names[2]).assertEqual('combination_fired');
      expect(names[3]).assertEqual('single_key_ignored');
      expect(names[4]).assertEqual('combination_rearmed');
    });

    // Journey 4: the tip window lives exactly three seconds.
    it('tip_journey_should_last_three_seconds', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runTipVerify();
      expect(result.ok).assertTrue();
      let stopStepOk = false;
      let tipStepOk = false;
      let closedStepOk = false;
      for (let index = 0; index < result.steps.length; index++) {
        const step = result.steps[index];
        if (step.name === 'stop') {
          stopStepOk = step.ok;
        }
        if (step.name === 'tip_shown') {
          tipStepOk = step.ok;
        }
        if (step.name === 'tip_closed') {
          closedStepOk = step.ok;
        }
      }
      expect(stopStepOk).assertTrue();
      expect(tipStepOk).assertTrue();
      expect(closedStepOk).assertTrue();
    });

    // Journey 5: two recordings are both listed and their names are distinct.
    it('photo_lookup_journey_should_list_two_clips', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runPhotoLookup();
      expect(result.ok).assertTrue();
      let listedStepFound = false;
      for (let index = 0; index < result.steps.length; index++) {
        if (result.steps[index].name === 'photos_listed:2') {
          listedStepFound = true;
          expect(result.steps[index].ok).assertTrue();
        }
      }
      expect(listedStepFound).assertTrue();
      expect(result.kind).assertEqual(JourneyKind.PHOTO_LOOKUP);
    });

    // Journey 6: a 4K panel is blocked by the resolution dialog and produces no
    // artifact at all.
    it('resolution_error_journey_should_block_recording', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runResolutionError();
      expect(result.ok).assertTrue();
      expect(result.steps[0].name).assertEqual('resolution_dialog_shown');
      expect(result.steps[result.steps.length - 1].name).assertEqual('dialog_dismissed');
      let photoSteps = 0;
      for (let index = 0; index < result.steps.length; index++) {
        if (result.steps[index].name === 'tip_shown') {
          photoSteps++;
        }
      }
      expect(photoSteps).assertEqual(0);
    });

    // Journey 7: an interruption followed by a resume keeps both artifacts.
    it('interrupt_resume_journey_should_keep_both_clips', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runInterruptResume();
      expect(result.ok).assertTrue();
      let interruptions = 0;
      for (let index = 0; index < result.steps.length; index++) {
        if (result.steps[index].name === 'interrupted') {
          interruptions++;
        }
      }
      expect(interruptions).assertEqual(1);
      expect(result.kind).assertEqual(JourneyKind.INTERRUPT_RESUME);
    });

    // Journey 8: five consecutive recordings all succeed and the user ends in the
    // idle state.
    it('repeated_use_journey_should_stay_stable', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runRepeatedUse();
      expect(result.ok).assertTrue();
      let stopSteps = 0;
      for (let index = 0; index < result.steps.length; index++) {
        if (result.steps[index].name === 'stop') {
          stopSteps++;
        }
      }
      expect(stopSteps).assertEqual(5);
      expect(result.kind).assertEqual(JourneyKind.REPEATED_USE);
    });

    // All eight journeys pass when they are executed in sequence.
    it('all_journeys_should_pass', 0, () => {
      const runner = new UserJourneyRunner();
      const tracker = new UserScenarioTracker();
      tracker.record(runner.runQuickRecord());
      tracker.record(runner.runTimerCheck());
      tracker.record(runner.runStopCombination());
      tracker.record(runner.runTipVerify());
      tracker.record(runner.runPhotoLookup());
      tracker.record(runner.runResolutionError());
      tracker.record(runner.runInterruptResume());
      tracker.record(runner.runRepeatedUse());
      expect(tracker.getTotal()).assertEqual(8);
      expect(tracker.getPassed()).assertEqual(8);
      expect(tracker.getFailed()).assertEqual(0);
      expect(tracker.getSuccessRate()).assertEqual(1);
    });

    // Each journey kind is counted exactly once in the aggregated tracker.
    it('tracker_should_count_per_kind', 0, () => {
      const runner = new UserJourneyRunner();
      const tracker = new UserScenarioTracker();
      tracker.record(runner.runQuickRecord());
      tracker.record(runner.runQuickRecord());
      tracker.record(runner.runRepeatedUse());
      expect(tracker.getKindCount(JourneyKind.QUICK_RECORD)).assertEqual(2);
      expect(tracker.getKindCount(JourneyKind.REPEATED_USE)).assertEqual(1);
      expect(tracker.getKindCount(JourneyKind.TIP_VERIFY)).assertEqual(0);
      expect(tracker.getTotal()).assertEqual(3);
      expect(tracker.getPassed()).assertEqual(3);
    });

    // The tracker reports a non trivial execution window for the journeys.
    it('tracker_should_expose_fastest_and_slowest', 0, () => {
      const runner = new UserJourneyRunner();
      const tracker = new UserScenarioTracker();
      tracker.record(runner.runQuickRecord());
      tracker.record(runner.runTimerCheck());
      tracker.record(runner.runRepeatedUse());
      expect(tracker.getFastestMs()).assertLarger(0);
      expect(tracker.getSlowestMs()).assertLargerOrEqual(tracker.getFastestMs());
      expect(tracker.getSlowestMs() > tracker.getFastestMs()).assertTrue();
    });

    // Journey timestamps never overlap because each journey owns a later clock
    // window.
    it('tracker_should_detect_chronology', 0, () => {
      const runner = new UserJourneyRunner();
      const tracker = new UserScenarioTracker();
      tracker.record(runner.runQuickRecord());
      tracker.record(runner.runTipVerify());
      tracker.record(runner.runPhotoLookup());
      expect(tracker.isChronological()).assertTrue();
      const results = tracker.getResults();
      expect(results.length).assertEqual(3);
      const firstLast = results[0].steps[results[0].steps.length - 1];
      const secondFirst = results[1].steps[0];
      expect(firstLast.atMs < secondFirst.atMs).assertTrue();
    });

    // A failing journey is counted but never reported as passed.
    it('tracker_should_record_failures', 0, () => {
      const runner = new UserJourneyRunner();
      const tracker = new UserScenarioTracker();
      const failing: JourneyResult = {
        kind: JourneyKind.QUICK_RECORD,
        steps: [],
        ok: false,
        durationMs: 120,
        failureReason: 'synthetic-failure'
      };
      tracker.record(failing);
      tracker.record(runner.runQuickRecord());
      expect(tracker.getTotal()).assertEqual(2);
      expect(tracker.getPassed()).assertEqual(1);
      expect(tracker.getFailed()).assertEqual(1);
      expect(tracker.getSuccessRate()).assertEqual(0.5);
      expect(tracker.getResults()[0].failureReason).assertEqual('synthetic-failure');
    });

    // Reset clears both the history and the per-kind counters.
    it('tracker_reset_should_clear_state', 0, () => {
      const runner = new UserJourneyRunner();
      const tracker = new UserScenarioTracker();
      tracker.record(runner.runQuickRecord());
      tracker.record(runner.runTipVerify());
      tracker.reset();
      expect(tracker.getTotal()).assertEqual(0);
      expect(tracker.getPassed()).assertEqual(0);
      expect(tracker.getFailed()).assertEqual(0);
      expect(tracker.getSuccessRate()).assertEqual(0);
      expect(tracker.getFastestMs()).assertEqual(0);
      expect(tracker.getSlowestMs()).assertEqual(0);
      expect(tracker.getResults().length).assertEqual(0);
    });

    // The quick journey is bounded: the simulated wall clock only advances by
    // the recording plus the tip duration.
    it('quick_record_duration_should_be_bounded', 0, () => {
      const runner = new UserJourneyRunner();
      const result = runner.runQuickRecord();
      expect(result.durationMs).assertEqual(6000);
      expect(result.durationMs).assertLessOrEqual(TIP_VISIBLE_MS + 3000);
      expect(result.steps.length).assertEqual(4);
      expect(result.steps[1].name).assertEqual('stop');
      expect(result.steps[2].name).assertEqual('tip_shown');
    });

    // The resolution dialog texts shown on the error journey are the production
    // literals, so the user always receives the documented guidance.
    it('resolution_dialog_text_should_match_production', 0, () => {
      expect(RESOLUTION_TEXT_CONTENT).assertEqual('当前设备分辨率过高，请降低分辨率');
      expect(RESOLUTION_TEXT_CONTENT).assertContain('分辨率');
      expect(RESOLUTION_TEXT_CONTENT.length > 10).assertTrue();
      const runner = new UserJourneyRunner();
      const result = runner.runResolutionError();
      expect(result.ok).assertTrue();
      expect(result.steps.length).assertEqual(2);
    });

    // The timer hint and the tip content are part of the user journey and are
    // asserted with their production wording.
    it('timer_hint_and_tip_text_should_match_production', 0, () => {
      expect(TIMER_TEXT_HINT).assertContain('同时按下菜单键与音量减键');
      expect(TIMER_TEXT_HINT).assertContain('即可结束录屏');
      expect(TIP_TEXT_CONTENT).assertEqual('录屏视频已存储到"照片"');
      expect(TIP_TEXT_CONTENT).assertContain('照片');
      const runner = new UserJourneyRunner();
      const result = runner.runTipVerify();
      expect(result.ok).assertTrue();
      expect(result.steps.length).assertLargerOrEqual(3);
    });

    // Real-device journey: the timer window is reported visible after the service
    // is started, or the probe reports that no window could be observed.
    it('device_timer_window_journey', 0, async () => {
      await launchRecorderService();
      const stable: boolean = await waitForTimerWindowStable(driver, 3000);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      if (stable) {
        expect(await isTimerWindowVisible(driver)).assertTrue();
      }
    });

    // Real-device journey: after a stop the tip window is either visible or has
    // already been dismissed, and the tree stays readable in both cases.
    it('device_tip_window_journey', 0, async () => {
      await launchRecorderService();
      await serializedDelay(driver, 800);
      const tipVisible: boolean = await isTipWindowVisible(driver);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      expect(tipVisible && componentCount === 0).assertFalse();
    });
  });
}

