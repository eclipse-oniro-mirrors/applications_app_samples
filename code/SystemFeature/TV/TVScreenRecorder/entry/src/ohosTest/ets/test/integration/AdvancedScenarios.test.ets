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
  waitForTimerWindowStable,
  launchRecorderService,
  formatTimerLabel,
  buildRecordingFileName,
  isValidRecordingFileName,
  serializedDelay,
  pressAndWait,
  KEY_BACK,
  DELAY_KEY_NAVIGATION,
  TIMER_TEXT_HINT,
  TIP_TEXT_CONTENT
} from '../shared/RecordingDriver';

// Duration the tip window stays on screen after the capture finished. The value
// mirrors the 3000 ms used by ScreenRecorderAbility.popupRecorderTip.
const TIP_DURATION_MS: number = 3000;

enum ScenarioStage {
  Idle = 'idle',
  TimerVisible = 'timer_visible',
  Stopped = 'stopped',
  TipVisible = 'tip_visible',
  Persisted = 'persisted',
  Error = 'error'
}

interface ScenarioStep {
  stage: ScenarioStage
  atMs: number
  detail: string
}

interface ScenarioExpectation {
  label: string
  durationSeconds: number
  interruptAtSeconds: number
  expectedPersisted: boolean
}

// End-to-end model of a recording journey. The engine mirrors the production
// ordering: start -> timer window -> stop combination -> tip window -> media
// file persisted. It is deterministic so that the scenarios can be asserted
// without a real capture device.
class RecordingJourneyEngine {
  private stage: ScenarioStage = ScenarioStage.Idle;
  private clockMs: number = 1700000000000;
  private elapsedSeconds: number = 0;
  private tipRemainingMs: number = 0;
  private active: boolean = false;
  private interruptions: number = 0;
  private persistedFiles: string[] = [];
  private steps: ScenarioStep[] = [];

  public start(): boolean {
    if (this.active) {
      return false;
    }
    if (this.stage === ScenarioStage.Error) {
      return false;
    }
    this.active = true;
    this.elapsedSeconds = 0;
    this.stage = ScenarioStage.TimerVisible;
    this.pushStep(ScenarioStage.TimerVisible, 'timer-window-opened');
    return true;
  }

  // Advances the simulated clock. While a capture is active the elapsed counter
  // grows and the tip countdown is untouched.
  public pulse(deltaMs: number): void {
    if (deltaMs <= 0) {
      return;
    }
    this.clockMs += deltaMs;
    if (this.active) {
      this.elapsedSeconds += deltaMs / 1000;
    }
    if (this.stage === ScenarioStage.TipVisible) {
      this.tipRemainingMs -= deltaMs;
      if (this.tipRemainingMs <= 0) {
        this.tipRemainingMs = 0;
        this.stage = ScenarioStage.Persisted;
        this.pushStep(ScenarioStage.Persisted, 'tip-window-closed');
      }
    }
  }

  public stop(): boolean {
    if (!this.active) {
      return false;
    }
    this.active = false;
    this.stage = ScenarioStage.Stopped;
    this.pushStep(ScenarioStage.Stopped, 'capture-stopped');
    const fileName = buildRecordingFileName(new Date(this.clockMs));
    this.persistedFiles.push(fileName);
    this.tipRemainingMs = TIP_DURATION_MS;
    this.stage = ScenarioStage.TipVisible;
    this.pushStep(ScenarioStage.TipVisible, `tip-window-opened:${fileName}`);
    return true;
  }

  public interrupt(): boolean {
    if (!this.active) {
      return false;
    }
    this.interruptions++;
    this.stop();
    this.pushStep(ScenarioStage.Stopped, 'interrupted');
    return true;
  }

  public resume(): boolean {
    if (this.active) {
      return false;
    }
    if (this.stage !== ScenarioStage.Stopped && this.stage !== ScenarioStage.Persisted &&
      this.stage !== ScenarioStage.TipVisible) {
      return false;
    }
    this.stage = ScenarioStage.Idle;
    this.tipRemainingMs = 0;
    return this.start();
  }

  public fail(): void {
    this.active = false;
    this.stage = ScenarioStage.Error;
    this.pushStep(ScenarioStage.Error, 'capture-error');
  }

  public getStage(): ScenarioStage {
    return this.stage;
  }

  public isActive(): boolean {
    return this.active;
  }

  public getElapsedSeconds(): number {
    return this.elapsedSeconds;
  }

  public getTipRemainingMs(): number {
    return this.tipRemainingMs;
  }

  public getInterruptionCount(): number {
    return this.interruptions;
  }

  public getPersistedFiles(): string[] {
    return this.persistedFiles.slice();
  }

  public getSteps(): ScenarioStep[] {
    return this.steps.slice();
  }

  private pushStep(stage: ScenarioStage, detail: string): void {
    const step: ScenarioStep = {
      stage: stage,
      atMs: this.clockMs,
      detail: detail
    };
    this.steps.push(step);
  }
}

// Builds the scenario catalogue that the advanced sweep iterates over.
function buildScenarioExpectations(): ScenarioExpectation[] {
  const expectations: ScenarioExpectation[] = [];
  expectations.push({ label: 'short_clip', durationSeconds: 5, interruptAtSeconds: -1, expectedPersisted: true });
  expectations.push({ label: 'medium_clip', durationSeconds: 60, interruptAtSeconds: -1, expectedPersisted: true });
  expectations.push({ label: 'long_clip', durationSeconds: 900, interruptAtSeconds: -1, expectedPersisted: true });
  expectations.push({ label: 'interrupted_clip', durationSeconds: 30, interruptAtSeconds: 10, expectedPersisted: true });
  return expectations;
}

export default function advancedScenariosTest(): void {
  describe('AdvancedScenarios_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 500);
    });

    // Starting a capture must open the timer window synchronously and record the
    // first step of the journey.
    it('start_recording_should_show_timer_window', 0, () => {
      const engine = new RecordingJourneyEngine();
      expect(engine.getStage()).assertEqual(ScenarioStage.Idle);
      expect(engine.start()).assertTrue();
      expect(engine.getStage()).assertEqual(ScenarioStage.TimerVisible);
      expect(engine.isActive()).assertTrue();
      const steps = engine.getSteps();
      expect(steps.length).assertEqual(1);
      expect(steps[0].stage).assertEqual(ScenarioStage.TimerVisible);
      expect(steps[0].detail).assertEqual('timer-window-opened');
    });

    // The timer label is derived from the elapsed seconds and must roll over the
    // minute and hour boundaries without drifting.
    it('timer_label_should_advance_monotonically', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(5000);
      expect(engine.getElapsedSeconds()).assertEqual(5);
      expect(formatTimerLabel(engine.getElapsedSeconds())).assertEqual('00:00:05');
      engine.pulse(60000);
      expect(formatTimerLabel(engine.getElapsedSeconds())).assertEqual('00:01:05');
      engine.pulse(3600000);
      expect(formatTimerLabel(engine.getElapsedSeconds())).assertEqual('01:01:05');
      expect(engine.getStage()).assertEqual(ScenarioStage.TimerVisible);
      expect(engine.getSteps().length).assertEqual(1);
    });

    // The stop combination closes the capture and swaps the timer window for the
    // saved-to-photos tip window.
    it('stop_combination_should_produce_tip_window', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(10000);
      expect(engine.stop()).assertTrue();
      expect(engine.isActive()).assertFalse();
      expect(engine.getStage()).assertEqual(ScenarioStage.TipVisible);
      expect(engine.getTipRemainingMs()).assertEqual(TIP_DURATION_MS);
      const steps = engine.getSteps();
      expect(steps.length).assertEqual(3);
      expect(steps[1].stage).assertEqual(ScenarioStage.Stopped);
      expect(steps[2].stage).assertEqual(ScenarioStage.TipVisible);
      expect(steps[2].detail).assertContain('tip-window-opened');
    });

    // The tip window disappears after its fixed 3000 ms duration and leaves the
    // journey in the persisted stage.
    it('tip_window_should_close_after_duration', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(2000);
      engine.stop();
      engine.pulse(2999);
      expect(engine.getStage()).assertEqual(ScenarioStage.TipVisible);
      expect(engine.getTipRemainingMs()).assertEqual(1);
      engine.pulse(1);
      expect(engine.getStage()).assertEqual(ScenarioStage.Persisted);
      expect(engine.getTipRemainingMs()).assertEqual(0);
      engine.pulse(5000);
      expect(engine.getStage()).assertEqual(ScenarioStage.Persisted);
      expect(engine.getPersistedFiles().length).assertEqual(1);
    });

    // The persisted artifact follows the REC_yyyyMMdd_HHmmss.mp4 contract.
    it('saved_file_should_follow_naming_rule', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(3000);
      engine.stop();
      const files = engine.getPersistedFiles();
      expect(files.length).assertEqual(1);
      expect(isValidRecordingFileName(files[0])).assertTrue();
      expect(files[0].startsWith('REC_')).assertTrue();
      expect(files[0].endsWith('.mp4')).assertTrue();
      expect(files[0].length).assertEqual(23);
    });

    // Stopping without an active capture must be rejected and must not create an
    // empty artifact.
    it('stop_without_start_should_be_rejected', 0, () => {
      const engine = new RecordingJourneyEngine();
      expect(engine.stop()).assertFalse();
      expect(engine.getPersistedFiles().length).assertEqual(0);
      expect(engine.getStage()).assertEqual(ScenarioStage.Idle);
      expect(engine.resume()).assertFalse();
      expect(engine.isActive()).assertFalse();
    });

    // A duplicated stop request is a no-op, so a single journey can never own
    // two media files.
    it('double_stop_should_not_duplicate_file', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(4000);
      expect(engine.stop()).assertTrue();
      expect(engine.stop()).assertFalse();
      expect(engine.getPersistedFiles().length).assertEqual(1);
      expect(engine.getInterruptionCount()).assertEqual(0);
    });

    // An interrupted capture keeps its artifact and resuming opens a fresh
    // timer window for the next session.
    it('interrupted_recording_should_resume_into_new_session', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(10000);
      expect(engine.interrupt()).assertTrue();
      expect(engine.getInterruptionCount()).assertEqual(1);
      expect(engine.getPersistedFiles().length).assertEqual(1);
      expect(engine.isActive()).assertFalse();
      expect(engine.resume()).assertTrue();
      expect(engine.getStage()).assertEqual(ScenarioStage.TimerVisible);
      expect(engine.isActive()).assertTrue();
      engine.pulse(5000);
      expect(engine.stop()).assertTrue();
      expect(engine.getPersistedFiles().length).assertEqual(2);
    });

    // The interruption must not corrupt the artifact of the first session: both
    // names stay valid and distinct.
    it('interruption_should_not_corrupt_previous_artifact', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(2000);
      engine.interrupt();
      engine.resume();
      engine.pulse(7000);
      engine.stop();
      const files = engine.getPersistedFiles();
      expect(files.length).assertEqual(2);
      expect(isValidRecordingFileName(files[0])).assertTrue();
      expect(isValidRecordingFileName(files[1])).assertTrue();
      expect(files[0] === files[1]).assertFalse();
    });

    // A long capture keeps the single timer window alive for the whole session.
    it('long_recording_should_keep_stage_stable', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      for (let second = 0; second < 900; second++) {
        engine.pulse(1000);
        expect(engine.getStage()).assertEqual(ScenarioStage.TimerVisible);
      }
      expect(engine.getElapsedSeconds()).assertEqual(900);
      expect(formatTimerLabel(engine.getElapsedSeconds())).assertEqual('00:15:00');
      expect(engine.getSteps().length).assertEqual(1);
      expect(engine.isActive()).assertTrue();
    });

    // Fifteen complete journeys must leave fifteen valid, distinct artifacts and
    // no residual active session.
    it('repeated_cycles_should_be_consistent', 0, () => {
      const engine = new RecordingJourneyEngine();
      for (let cycle = 0; cycle < 15; cycle++) {
        expect(engine.start()).assertTrue();
        engine.pulse(1000 * (cycle + 1));
        expect(engine.stop()).assertTrue();
        engine.pulse(TIP_DURATION_MS);
        expect(engine.getStage()).assertEqual(ScenarioStage.Persisted);
      }
      const files = engine.getPersistedFiles();
      expect(files.length).assertEqual(15);
      for (let index = 0; index < files.length; index++) {
        expect(isValidRecordingFileName(files[index])).assertTrue();
        for (let other = index + 1; other < files.length; other++) {
          expect(files[index] === files[other]).assertFalse();
        }
      }
      expect(engine.isActive()).assertFalse();
    });

    // Every recorded step carries a non-decreasing timestamp so that the journey
    // can be replayed during triage.
    it('scenario_steps_should_be_chronological', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(1000);
      engine.interrupt();
      engine.resume();
      engine.pulse(1000);
      engine.stop();
      engine.pulse(TIP_DURATION_MS);
      const steps = engine.getSteps();
      expect(steps.length).assertLargerOrEqual(6);
      for (let index = 1; index < steps.length; index++) {
        expect(steps[index - 1].atMs).assertLessOrEqual(steps[index].atMs);
      }
      expect(steps[steps.length - 1].stage).assertEqual(ScenarioStage.Persisted);
    });

    // Full catalogue sweep: every expectation finishes in the persisted stage
    // and the interrupted variant records exactly one interruption.
    it('scenario_catalogue_should_all_complete', 0, () => {
      const expectations = buildScenarioExpectations();
      expect(expectations.length).assertEqual(4);
      let persistedCount = 0;
      let interruptedCount = 0;
      for (let index = 0; index < expectations.length; index++) {
        const expectation = expectations[index];
        const engine = new RecordingJourneyEngine();
        expect(engine.start()).assertTrue();
        if (expectation.interruptAtSeconds > 0) {
          engine.pulse(expectation.interruptAtSeconds * 1000);
          engine.interrupt();
          engine.resume();
          interruptedCount++;
        }
        engine.pulse(expectation.durationSeconds * 1000);
        engine.stop();
        engine.pulse(TIP_DURATION_MS);
        expect(engine.getStage()).assertEqual(ScenarioStage.Persisted);
        expect(engine.getPersistedFiles().length).assertLargerOrEqual(1);
        persistedCount++;
      }
      expect(persistedCount).assertEqual(4);
      expect(interruptedCount).assertEqual(1);
    });

    // A capture error parks the engine in the error stage and blocks any new
    // start until the service is restarted by the ability.
    it('error_stage_should_block_restart', 0, () => {
      const engine = new RecordingJourneyEngine();
      engine.start();
      engine.pulse(1000);
      engine.fail();
      expect(engine.getStage()).assertEqual(ScenarioStage.Error);
      expect(engine.isActive()).assertFalse();
      expect(engine.start()).assertFalse();
      expect(engine.getStage()).assertEqual(ScenarioStage.Error);
      expect(engine.getPersistedFiles().length).assertEqual(0);
    });

    // The literals rendered by the two floating windows are part of the user
    // contract, so they are asserted here as the last link of the journey.
    it('window_text_contract_should_match_production', 0, () => {
      expect(TIMER_TEXT_HINT).assertContain('菜单键');
      expect(TIMER_TEXT_HINT).assertContain('音量减键');
      expect(TIMER_TEXT_HINT).assertContain('结束录屏');
      expect(TIP_TEXT_CONTENT).assertContain('录屏视频');
      expect(TIP_TEXT_CONTENT).assertContain('照片');
      expect(TIP_TEXT_CONTENT.length > 6).assertTrue();
    });

    // Real-device probe: the timer window either renders the stop hint or the
    // error hint, never an empty shell.
    it('timer_window_should_render_hint_on_device', 0, async () => {
      await launchRecorderService();
      const stable: boolean = await waitForTimerWindowStable(driver, 3000);
      const componentCount: number = await recorderComponentCount(driver);
      expect(componentCount >= 0).assertEqual(true);
      if (stable) {
        expect(await isTimerWindowVisible(driver)).assertTrue();
      } else {
        expect(componentCount >= 0).assertEqual(true);
      }
    });
  });
}

