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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_DOWN, KEY_UP, miracastComponentCount, isIndexPageVisible,
  waitForPageStable, waitForPlayerPage, waitForServiceConnected, countComponentsById,
  getPlayerTileCount, pressAndWait, serializedDelay, triggerMiracastHome, launchPlayerPage,
  safeBack, ID_SWITCH_BTN, TIMEOUT_PAGE_RENDER, TIMEOUT_PLAYER_RENDER, DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP, MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'ComprehensiveRegressionSuite';

enum RegressionStep {
  START_SERVICE = 'start_service',
  DISCOVER = 'discover',
  PERMISSION = 'permission',
  SESSION = 'session',
  SCREEN = 'screen',
  PLAY = 'play',
  PAUSE = 'pause',
  MUTE = 'mute',
  UNMUTE = 'unmute',
  STOP = 'stop',
  RELEASE = 'release'
}

enum RegressionPermission {
  FOREVER = 0,
  ONCE = 1,
  CANCEL = 2
}

interface StepOutcome {
  step: RegressionStep;
  ok: boolean;
  errCode: number;
  returnValue: number;
  durationMs: number;
}

// 端到端回归流程模型：start -> discover -> permission -> session -> screen -> play -> pause -> mute
// -> unmute -> stop -> release，每一步都校验前置条件并记录 IDL 返回码
class RegressionFlowModel {
  private outcomes: StepOutcome[] = [];
  private serviceStarted: boolean = false;
  private deviceId: string = '';
  private sessionOpen: boolean = false;
  private screenId: number = -1;
  private playing: boolean = false;
  private paused: boolean = false;
  private muted: boolean = false;
  private released: boolean = false;
  private injectedFailure: RegressionStep | null = null;
  public injectFailure(step: RegressionStep): void { this.injectedFailure = step; }
  public clearInjectedFailure(): void { this.injectedFailure = null; }
  private record(step: RegressionStep, ok: boolean, durationMs: number): StepOutcome {
    const outcome: StepOutcome = {
      step: step, ok: ok, errCode: ok ? 0 : -1, returnValue: ok ? 0 : -1, durationMs: durationMs
    };
    this.outcomes.push(outcome);
    return outcome;
  }
  private isInjected(step: RegressionStep): boolean { return this.injectedFailure === step; }
  public startService(durationMs: number): StepOutcome {
    const ok: boolean = !this.serviceStarted && !this.isInjected(RegressionStep.START_SERVICE);
    if (ok) { this.serviceStarted = true; }
    return this.record(RegressionStep.START_SERVICE, ok, durationMs);
  }
  public discover(deviceId: string, durationMs: number): StepOutcome {
    const ok: boolean = this.serviceStarted && this.deviceId.length === 0 && deviceId.length > 0 &&
      !this.isInjected(RegressionStep.DISCOVER);
    if (ok) { this.deviceId = deviceId; }
    return this.record(RegressionStep.DISCOVER, ok, durationMs);
  }
  public requestPermission(permission: RegressionPermission, durationMs: number): StepOutcome {
    const ok: boolean = this.deviceId.length > 0 && permission !== RegressionPermission.CANCEL &&
      !this.isInjected(RegressionStep.PERMISSION);
    return this.record(RegressionStep.PERMISSION, ok, durationMs);
  }
  public openSession(durationMs: number): StepOutcome {
    const ok: boolean = this.deviceId.length > 0 && !this.sessionOpen && !this.isInjected(RegressionStep.SESSION);
    if (ok) { this.sessionOpen = true; }
    return this.record(RegressionStep.SESSION, ok, durationMs);
  }
  public bindScreen(screenId: number, durationMs: number): StepOutcome {
    const ok: boolean = this.sessionOpen && screenId >= 0 && !this.isInjected(RegressionStep.SCREEN);
    if (ok) { this.screenId = screenId; }
    return this.record(RegressionStep.SCREEN, ok, durationMs);
  }
  public play(durationMs: number): StepOutcome {
    const ok: boolean = this.screenId >= 0 && !this.playing && !this.isInjected(RegressionStep.PLAY);
    if (ok) { this.playing = true; this.paused = false; this.released = false; }
    return this.record(RegressionStep.PLAY, ok, durationMs);
  }
  public pause(durationMs: number): StepOutcome {
    const ok: boolean = this.playing && !this.paused && !this.isInjected(RegressionStep.PAUSE);
    if (ok) { this.paused = true; }
    return this.record(RegressionStep.PAUSE, ok, durationMs);
  }
  public mute(durationMs: number): StepOutcome {
    const ok: boolean = this.playing && !this.muted && !this.isInjected(RegressionStep.MUTE);
    if (ok) { this.muted = true; }
    return this.record(RegressionStep.MUTE, ok, durationMs);
  }
  public unmute(durationMs: number): StepOutcome {
    const ok: boolean = this.muted && !this.isInjected(RegressionStep.UNMUTE);
    if (ok) { this.muted = false; }
    return this.record(RegressionStep.UNMUTE, ok, durationMs);
  }
  public stop(durationMs: number): StepOutcome {
    const ok: boolean = this.playing && !this.isInjected(RegressionStep.STOP);
    if (ok) { this.playing = false; this.paused = false; this.muted = false; }
    return this.record(RegressionStep.STOP, ok, durationMs);
  }
  public release(durationMs: number): StepOutcome {
    const ok: boolean = this.sessionOpen && !this.playing && !this.isInjected(RegressionStep.RELEASE);
    if (ok) {
      this.released = true;
      this.sessionOpen = false;
      this.screenId = -1;
      this.deviceId = '';
    }
    return this.record(RegressionStep.RELEASE, ok, durationMs);
  }
  public runFullFlow(deviceId: string): StepOutcome[] {
    this.startService(10);
    this.discover(deviceId, 20);
    this.requestPermission(RegressionPermission.FOREVER, 30);
    this.openSession(40);
    this.bindScreen(5, 50);
    this.play(60);
    this.pause(70);
    this.mute(80);
    this.unmute(90);
    this.stop(100);
    this.release(110);
    return this.getOutcomes();
  }
  public getOutcomes(): StepOutcome[] {
    const copy: StepOutcome[] = [];
    for (let i = 0; i < this.outcomes.length; i++) { copy.push(this.outcomes[i]); }
    return copy;
  }
  public getOutcomeCount(): number { return this.outcomes.length; }
  public getCurrentStep(): RegressionStep {
    return this.outcomes.length === 0 ? RegressionStep.START_SERVICE : this.outcomes[this.outcomes.length - 1].step;
  }
  public isServiceStarted(): boolean { return this.serviceStarted; }
  public isSessionOpen(): boolean { return this.sessionOpen; }
  public isPlaying(): boolean { return this.playing; }
  public isMuted(): boolean { return this.muted; }
  public isReleased(): boolean { return this.released; }
  public getScreenId(): number { return this.screenId; }
  public getDeviceId(): string { return this.deviceId; }
  public isComplete(): boolean { return this.released; }
  public reset(): void {
    this.outcomes = [];
    this.serviceStarted = false; this.deviceId = ''; this.sessionOpen = false; this.screenId = -1;
    this.playing = false; this.paused = false; this.muted = false; this.released = false;
    this.injectedFailure = null;
  }
}

// 回归记录器：保存断言结果与耗时样本，生成回归摘要
class RegressionRecorder {
  private static instance: RegressionRecorder | null = null;
  private assertions: string[] = [];
  private failed: string[] = [];
  private durations: Map<string, number[]> = new Map<string, number[]>();
  public static getInstance(): RegressionRecorder {
    if (RegressionRecorder.instance === null) { RegressionRecorder.instance = new RegressionRecorder(); }
    return RegressionRecorder.instance;
  }
  public recordAssertion(name: string, passed: boolean): void {
    this.assertions.push(name);
    if (!passed) { this.failed.push(name); }
  }
  public recordDuration(step: string, durationMs: number): void {
    const samples: number[] | undefined = this.durations.get(step);
    if (samples === undefined) {
      const created: number[] = [durationMs];
      this.durations.set(step, created);
      return;
    }
    samples.push(durationMs);
  }
  public getAssertionCount(): number { return this.assertions.length; }
  public getPassedCount(): number { return this.assertions.length - this.failed.length; }
  public getFailedCount(): number { return this.failed.length; }
  public getPassRate(): number {
    return this.assertions.length === 0 ? 0 : this.getPassedCount() / this.assertions.length;
  }
  public getFailedNames(): string[] { return this.failed; }
  public getSampleCount(step: string): number {
    const samples: number[] | undefined = this.durations.get(step);
    return samples === undefined ? 0 : samples.length;
  }
  public getAverageDuration(step: string): number {
    const samples: number[] | undefined = this.durations.get(step);
    if (samples === undefined || samples.length === 0) { return 0; }
    let total: number = 0;
    for (let i = 0; i < samples.length; i++) { total += samples[i]; }
    return total / samples.length;
  }
  public getMaxDuration(step: string): number {
    const samples: number[] | undefined = this.durations.get(step);
    if (samples === undefined) { return 0; }
    let max: number = 0;
    for (let i = 0; i < samples.length; i++) { max = Math.max(max, samples[i]); }
    return max;
  }
  public getMinDuration(step: string): number {
    const samples: number[] | undefined = this.durations.get(step);
    if (samples === undefined || samples.length === 0) { return 0; }
    let min: number = Number.MAX_SAFE_INTEGER;
    for (let i = 0; i < samples.length; i++) { min = Math.min(min, samples[i]); }
    return min;
  }
  public buildSummary(): string {
    return 'RegressionReport(total=' + this.getAssertionCount() + ', passed=' + this.getPassedCount() +
      ', failed=' + this.getFailedCount() + ')';
  }
  public clear(): void { this.assertions = []; this.failed = []; this.durations = new Map<string, number[]>(); }
}

// 回归校验器：校验步骤顺序、返回码约定与必选步骤覆盖
class RegressionValidator {
  private expectedOrder: RegressionStep[] = [
    RegressionStep.START_SERVICE, RegressionStep.DISCOVER, RegressionStep.PERMISSION,
    RegressionStep.SESSION, RegressionStep.SCREEN, RegressionStep.PLAY, RegressionStep.PAUSE,
    RegressionStep.MUTE, RegressionStep.UNMUTE, RegressionStep.STOP, RegressionStep.RELEASE
  ];
  public getExpectedStepCount(): number { return this.expectedOrder.length; }
  public getExpectedOrder(): RegressionStep[] {
    const copy: RegressionStep[] = [];
    for (let i = 0; i < this.expectedOrder.length; i++) { copy.push(this.expectedOrder[i]); }
    return copy;
  }
  public isOrderRespected(outcomes: StepOutcome[]): boolean {
    if (outcomes.length !== this.expectedOrder.length) { return false; }
    for (let i = 0; i < outcomes.length; i++) {
      if (outcomes[i].step !== this.expectedOrder[i]) { return false; }
    }
    return true;
  }
  public allSucceeded(outcomes: StepOutcome[]): boolean {
    if (outcomes.length === 0) { return false; }
    for (let i = 0; i < outcomes.length; i++) {
      if (!outcomes[i].ok) { return false; }
    }
    return true;
  }
  public isReturnContractRespected(outcome: StepOutcome): boolean {
    if (outcome.ok) { return outcome.errCode === 0 && outcome.returnValue === 0; }
    return outcome.errCode === -1 && outcome.returnValue === -1;
  }
  public findFailedStep(outcomes: StepOutcome[]): RegressionStep | null {
    for (let i = 0; i < outcomes.length; i++) {
      if (!outcomes[i].ok) { return outcomes[i].step; }
    }
    return null;
  }
  public getSuccessCount(outcomes: StepOutcome[]): number {
    let count: number = 0;
    for (let i = 0; i < outcomes.length; i++) {
      if (outcomes[i].ok) { count++; }
    }
    return count;
  }
}

export default function comprehensiveRegressionSuite(): void {
  describe('ComprehensiveRegression_Suite', () => {
    let driver: Driver;
    let recorder: RegressionRecorder;
    beforeAll(async () => {
      driver = getDriver();
      recorder = RegressionRecorder.getInstance();
      recorder.clear();
      Log.info(TAG, 'regression suite start');
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, recorder.buildSummary());
    });

    it('flow_starts_with_service_start_step', 0, async () => {
      const flow = new RegressionFlowModel();
      const outcome: StepOutcome = flow.startService(12);
      expect(outcome.step).assertEqual(RegressionStep.START_SERVICE); expect(outcome.ok).assertTrue();
      expect(outcome.errCode).assertEqual(0); expect(flow.isServiceStarted()).assertTrue();
    });
    it('duplicate_service_start_returns_minus_one', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10);
      const outcome: StepOutcome = flow.startService(10);
      expect(outcome.ok).assertFalse();
      expect(outcome.errCode).assertEqual(-1); expect(outcome.returnValue).assertEqual(-1);
    });
    it('discovery_requires_started_service', 0, async () => {
      const flow = new RegressionFlowModel();
      const outcome: StepOutcome = flow.discover('device-100', 15);
      expect(outcome.ok).assertFalse();
      expect(flow.getDeviceId()).assertEqual('');
    });
    it('discovery_records_device_id_once', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10);
      expect(flow.discover('device-101', 20).ok).assertTrue(); expect(flow.discover('device-102', 20).ok).assertFalse();
      expect(flow.getDeviceId()).assertEqual('device-101');
    });
    it('permission_cancel_blocks_session', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-103', 20);
      const outcome: StepOutcome = flow.requestPermission(RegressionPermission.CANCEL, 30);
      expect(outcome.ok).assertFalse();
      expect(flow.isSessionOpen()).assertFalse();
    });
    it('permission_once_allows_session', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-104', 20);
      expect(flow.requestPermission(RegressionPermission.ONCE, 30).ok).assertTrue();
      expect(flow.openSession(40).ok).assertTrue(); expect(flow.isSessionOpen()).assertTrue();
    });
    it('session_open_is_idempotent_guarded', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-105', 20);
      flow.requestPermission(RegressionPermission.FOREVER, 30); flow.openSession(40);
      expect(flow.openSession(40).ok).assertFalse();
      expect(flow.isSessionOpen()).assertTrue();
    });
    it('screen_bind_requires_open_session', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-106', 20);
      expect(flow.bindScreen(1, 50).ok).assertFalse();
      expect(flow.getScreenId()).assertEqual(-1);
    });
    it('screen_bind_rejects_negative_id', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-107', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40);
      expect(flow.bindScreen(-1, 50).ok).assertFalse();
      expect(flow.getScreenId()).assertEqual(-1);
    });
    it('screen_bind_accepts_valid_id', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-108', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40);
      expect(flow.bindScreen(77, 50).ok).assertTrue();
      expect(flow.getScreenId()).assertEqual(77);
    });
    it('play_requires_screen', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-109', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40);
      expect(flow.play(60).ok).assertFalse();
      expect(flow.isPlaying()).assertFalse();
    });
    it('pause_requires_playing_state', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-110', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40); flow.bindScreen(1, 50);
      expect(flow.pause(70).ok).assertFalse(); flow.play(60);
      expect(flow.pause(70).ok).assertTrue();
    });
    it('mute_and_unmute_toggle_audio_state', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-111', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40); flow.bindScreen(2, 50); flow.play(60);
      expect(flow.mute(80).ok).assertTrue(); expect(flow.isMuted()).assertTrue();
      expect(flow.unmute(90).ok).assertTrue(); expect(flow.isMuted()).assertFalse();
    });
    it('unmute_without_mute_is_rejected', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-112', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40); flow.bindScreen(3, 50); flow.play(60);
      expect(flow.unmute(90).ok).assertFalse();
      expect(flow.isMuted()).assertFalse();
    });
    it('stop_clears_playing_and_mute_state', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-113', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40); flow.bindScreen(4, 50);
      flow.play(60); flow.mute(80);
      expect(flow.stop(100).ok).assertTrue(); expect(flow.isPlaying()).assertFalse(); expect(flow.isMuted()).assertFalse();
    });
    it('release_requires_stopped_playback', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-114', 20);
      flow.requestPermission(RegressionPermission.ONCE, 30); flow.openSession(40); flow.bindScreen(5, 50); flow.play(60);
      expect(flow.release(110).ok).assertFalse(); flow.stop(100);
      expect(flow.release(110).ok).assertTrue(); expect(flow.isReleased()).assertTrue();
    });
    it('release_clears_session_and_screen', 0, async () => {
      const flow = new RegressionFlowModel(); flow.startService(10); flow.discover('device-115', 20);
      flow.requestPermission(RegressionPermission.FOREVER, 30); flow.openSession(40); flow.bindScreen(6, 50);
      flow.play(60); flow.pause(70); flow.stop(100); flow.release(110);
      expect(flow.isSessionOpen()).assertFalse(); expect(flow.getScreenId()).assertEqual(-1);
      expect(flow.getDeviceId()).assertEqual(''); expect(flow.isComplete()).assertTrue();
    });
    it('full_flow_executes_all_eleven_steps', 0, async () => {
      const flow = new RegressionFlowModel(); const outcomes: StepOutcome[] = flow.runFullFlow('device-116');
      expect(outcomes.length).assertEqual(11); expect(flow.isComplete()).assertTrue();
      expect(flow.getCurrentStep()).assertEqual(RegressionStep.RELEASE);
      expect(outcomes[10].durationMs).assertEqual(110);
      const validator = new RegressionValidator(); expect(validator.allSucceeded(outcomes)).assertTrue(); expect(validator.getSuccessCount(outcomes)).assertEqual(11);
    });
    it('validator_respects_expected_step_order', 0, async () => {
      const flow = new RegressionFlowModel(); const validator = new RegressionValidator();
      const outcomes: StepOutcome[] = flow.runFullFlow('device-117');
      expect(validator.isOrderRespected(outcomes)).assertTrue(); expect(validator.getExpectedStepCount()).assertEqual(11);
      expect(validator.getExpectedOrder()[0]).assertEqual(RegressionStep.START_SERVICE);
    });
    it('validator_detects_wrong_step_order', 0, async () => {
      const validator = new RegressionValidator(); const outcomes: StepOutcome[] = [];
      const first: StepOutcome = { step: RegressionStep.PLAY, ok: true, errCode: 0, returnValue: 0, durationMs: 1 };
      outcomes.push(first);
      expect(validator.isOrderRespected(outcomes)).assertFalse(); expect(validator.allSucceeded(outcomes)).assertTrue();
    });
    it('validator_checks_idl_return_contract', 0, async () => {
      const validator = new RegressionValidator();
      const success: StepOutcome = { step: RegressionStep.PLAY, ok: true, errCode: 0, returnValue: 0, durationMs: 10 };
      const failure: StepOutcome = { step: RegressionStep.PLAY, ok: false, errCode: -1, returnValue: -1, durationMs: 10 };
      const broken: StepOutcome = { step: RegressionStep.PLAY, ok: true, errCode: -1, returnValue: 0, durationMs: 10 };
      expect(validator.isReturnContractRespected(success)).assertTrue(); expect(validator.isReturnContractRespected(failure)).assertTrue(); expect(validator.isReturnContractRespected(broken)).assertFalse();
    });
    it('recorder_tracks_pass_and_fail_counts', 0, async () => {
      const local = RegressionRecorder.getInstance(); local.clear();
      local.recordAssertion('flow_start', true); local.recordAssertion('flow_screen', true); local.recordAssertion('flow_stop', false);
      expect(local.getAssertionCount()).assertEqual(3); expect(local.getPassedCount()).assertEqual(2);
      expect(local.getFailedCount()).assertEqual(1); expect(local.getFailedNames().length).assertEqual(1);
    });
    it('recorder_pass_rate_reflects_records', 0, async () => {
      const local = RegressionRecorder.getInstance(); local.clear();
      local.recordAssertion('a', true); local.recordAssertion('b', true); local.recordAssertion('c', true); local.recordAssertion('d', false);
      expect(local.getPassRate()).assertEqual(0.75);
      expect(local.buildSummary()).assertContain('total=4'); expect(local.buildSummary()).assertContain('failed=1');
    });
    it('recorder_collects_duration_statistics', 0, async () => {
      const local = RegressionRecorder.getInstance(); local.clear();
      local.recordDuration('screen', 100); local.recordDuration('screen', 300); local.recordDuration('screen', 200);
      expect(local.getSampleCount('screen')).assertEqual(3); expect(local.getAverageDuration('screen')).assertEqual(200);
      expect(local.getMaxDuration('screen')).assertEqual(300); expect(local.getMinDuration('screen')).assertEqual(100);
    });
    it('recorder_returns_zero_for_unknown_metric', 0, async () => {
      const local = RegressionRecorder.getInstance(); local.clear();
      expect(local.getSampleCount('missing')).assertEqual(0); expect(local.getAverageDuration('missing')).assertEqual(0);
      expect(local.getMinDuration('missing')).assertEqual(0);
    });
    it('recorder_singleton_is_stable', 0, async () => {
      const first: RegressionRecorder = RegressionRecorder.getInstance();
      const second: RegressionRecorder = RegressionRecorder.getInstance();
      expect(first === second).assertTrue();
    });
    it('regression_validator_handles_empty_outcomes', 0, async () => {
      const validator = new RegressionValidator(); const outcomes: StepOutcome[] = [];
      expect(validator.allSucceeded(outcomes)).assertFalse(); expect(validator.isOrderRespected(outcomes)).assertFalse();
      expect(validator.findFailedStep(outcomes) === null).assertTrue(); expect(validator.getSuccessCount(outcomes)).assertEqual(0);
      expect(validator.getExpectedOrder().length).assertEqual(11);
    });
    it('regression_full_flow_remains_repeatable', 0, async () => {
      const flow = new RegressionFlowModel(); const validator = new RegressionValidator();
      expect(validator.allSucceeded(flow.runFullFlow('device-120'))).assertTrue(); flow.reset();
      expect(flow.getOutcomeCount()).assertEqual(0);
      const secondRun: StepOutcome[] = flow.runFullFlow('device-121');
      expect(secondRun.length).assertEqual(11); expect(validator.allSucceeded(secondRun)).assertTrue();
    });
    it('regression_release_is_not_repeatable', 0, async () => {
      const flow = new RegressionFlowModel(); flow.runFullFlow('device-122');
      const secondRelease: StepOutcome = flow.release(110);
      expect(secondRelease.ok).assertFalse(); expect(secondRelease.errCode).assertEqual(-1);
      expect(flow.getOutcomeCount()).assertEqual(12); expect(flow.isComplete()).assertTrue();
    });
    it('regression_state_snapshot_after_failure', 0, async () => {
      const flow = new RegressionFlowModel(); flow.injectFailure(RegressionStep.STOP);
      const outcomes: StepOutcome[] = flow.runFullFlow('device-124'); const validator = new RegressionValidator();
      expect(validator.findFailedStep(outcomes)).assertEqual(RegressionStep.STOP); expect(flow.isPlaying()).assertTrue();
      expect(flow.getScreenId()).assertEqual(5); expect(flow.isSessionOpen()).assertTrue();
      flow.clearInjectedFailure(); expect(flow.stop(100).ok).assertTrue(); expect(flow.release(110).ok).assertTrue(); expect(flow.isComplete()).assertTrue();
    });
    it('regression_iterates_rounds_without_state_leak', 0, async () => {
      const flow = new RegressionFlowModel(); const validator = new RegressionValidator();
      for (let round = 0; round < 5; round++) {
        flow.reset(); const outcomes: StepOutcome[] = flow.runFullFlow('loop-device-' + round);
        expect(outcomes.length).assertEqual(11); expect(validator.allSucceeded(outcomes)).assertTrue();
      }
      expect(flow.isComplete()).assertTrue();
    });
    it('regression_bounded_ui_operation_duration', 0, async () => {
      await triggerMiracastHome(driver); const start: number = Date.now();
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(Date.now() - start).assertLessOrEqual(8000);
      recorder.recordDuration('home_render', Date.now() - start); expect(recorder.getSampleCount('home_render')).assertLargerOrEqual(1);
    });
    it('regression_after_all_keeps_summary_consistent', 0, async () => {
      const local = RegressionRecorder.getInstance();
      expect(local.buildSummary()).assertContain('RegressionReport');
      expect(local.getPassRate()).assertLargerOrEqual(0); expect(local.getPassRate()).assertLessOrEqual(1);
      recorder.recordDuration('suite_tail', 5); expect(recorder.getSampleCount('suite_tail')).assertLargerOrEqual(1);
    });
  });
}
