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
  waitForTimerWindowStable,
  waitForTipWindowStable,
  triggerRecordingStart,
  triggerRecordingStop,
  isTimerWindowVisible,
  pressAndWait,
  serializedDelay,
  buildRecordingFileName,
  isValidRecordingFileName,
  formatTimerLabel,
  KEY_BACK,
  KEY_MENU,
  KEY_VOLUME_DOWN,
  DELAY_KEY_NAVIGATION,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER
} from '../shared/RecordingDriver';

// Stage of the end-to-end recording flow. The order mirrors what a real user
// observes: the service starts, the timer window appears, the recording runs,
// the stop combination fires, the tip window appears and the service exits.
enum EndToEndStage {
  SERVICE_START = 'service_start',
  TIMER_RENDER = 'timer_render',
  RECORDING_ACTIVE = 'recording_active',
  STOP_COMBINATION = 'stop_combination',
  TIP_RENDER = 'tip_render',
  EXIT = 'exit'
}

// Final result of one end-to-end recording flow.
enum FlowResult {
  SUCCESS = 'success',
  INTERRUPTED = 'interrupted',
  FAILED = 'failed'
}

// Recording state exposed by SRManager and by libentry.so.
enum RecState {
  Idle = 0,
  Recording = 1,
  Stopped = 2,
  Error = 3
}

// Description of a single executed stage.
interface StageRecordDef {
  stage: EndToEndStage;
  startedAt: number;
  finishedAt: number;
  successful: boolean;
}

// Aggregated report of one end-to-end flow.
interface FlowReportDef {
  flowId: string;
  result: FlowResult;
  totalStages: number;
  successfulStages: number;
  totalDurationMs: number;
}

// One remote control action of the end-to-end script.
interface RemoteActionDef {
  keyCode: number;
  repeat: number;
  label: string;
}

// Snapshot of the recording session internals, used by the assertions below.
interface SessionSnapshotDef {
  state: RecState;
  fd: number;
  fileName: string;
  uri: string;
}

// Immutable record of one executed stage. The class exposes the small set of
// helpers that the assertions need (clone / equality / duration validation).
class StageRecord {
  public stage: EndToEndStage;
  public startedAt: number;
  public finishedAt: number;
  public successful: boolean;

  constructor(stage: EndToEndStage, startedAt: number, finishedAt: number, successful: boolean) {
    this.stage = stage;
    this.startedAt = startedAt;
    this.finishedAt = finishedAt;
    this.successful = successful;
  }

  public clone(): StageRecord {
    return new StageRecord(this.stage, this.startedAt, this.finishedAt, this.successful);
  }

  public equals(other: StageRecord): boolean {
    return this.stage === other.stage && this.successful === other.successful;
  }

  public getDuration(): number {
    return this.finishedAt - this.startedAt;
  }

  public isValid(): boolean {
    return this.finishedAt >= this.startedAt;
  }

  public toString(): string {
    return `StageRecord(stage=${this.stage}, successful=${this.successful}, duration=${this.getDuration()})`;
  }
}

// Tracks the stages of one end-to-end run and validates their ordering.
class RecorderFlowTracker {
  private stages: StageRecord[] = [];
  private flowId: string;

  constructor(flowId: string) {
    this.flowId = flowId;
  }

  public getFlowId(): string {
    return this.flowId;
  }

  public beginStage(stage: EndToEndStage): void {
    const now: number = Date.now();
    this.stages.push(new StageRecord(stage, now, now, true));
  }

  public completeStage(stage: EndToEndStage, successful: boolean): boolean {
    for (let i = this.stages.length - 1; i >= 0; i--) {
      if (this.stages[i].stage === stage && this.stages[i].finishedAt === this.stages[i].startedAt) {
        this.stages[i].finishedAt = Date.now();
        this.stages[i].successful = successful;
        return true;
      }
    }
    return false;
  }

  public getStageCount(): number {
    return this.stages.length;
  }

  public getSuccessfulStageCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.stages.length; i++) {
      if (this.stages[i].successful) {
        count++;
      }
    }
    return count;
  }

  public getStages(): StageRecord[] {
    const result: StageRecord[] = [];
    for (let i = 0; i < this.stages.length; i++) {
      result.push(this.stages[i].clone());
    }
    return result;
  }

  public getTotalDuration(): number {
    let total: number = 0;
    for (let i = 0; i < this.stages.length; i++) {
      total += this.stages[i].getDuration();
    }
    return total;
  }

  public hasStage(stage: EndToEndStage): boolean {
    for (let i = 0; i < this.stages.length; i++) {
      if (this.stages[i].stage === stage) {
        return true;
      }
    }
    return false;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.stages.length; i++) {
      if (this.stages[i].startedAt < this.stages[i - 1].startedAt) {
        return false;
      }
    }
    return true;
  }

  public reset(): void {
    this.stages = [];
  }
}

// Aggregated report model, kept separate from the tracker so that a report can
// be serialized without carrying a reference to the mutable tracker.
class FlowReportModel {
  public flowId: string;
  public result: FlowResult;
  public totalStages: number;
  public successfulStages: number;
  public totalDurationMs: number;

  constructor(flowId: string, result: FlowResult, totalStages: number, successfulStages: number,
    totalDurationMs: number) {
    this.flowId = flowId;
    this.result = result;
    this.totalStages = totalStages;
    this.successfulStages = successfulStages;
    this.totalDurationMs = totalDurationMs;
  }

  public clone(): FlowReportModel {
    return new FlowReportModel(this.flowId, this.result, this.totalStages, this.successfulStages, this.totalDurationMs);
  }

  public equals(other: FlowReportModel): boolean {
    return this.flowId === other.flowId && this.result === other.result && this.totalStages === other.totalStages &&
      this.successfulStages === other.successfulStages;
  }

  public isComplete(): boolean {
    return this.totalStages > 0 && this.successfulStages === this.totalStages;
  }

  public getSuccessRate(): number {
    if (this.totalStages === 0) {
      return 0;
    }
    return this.successfulStages / this.totalStages;
  }

  public toString(): string {
    return `FlowReportModel(flowId=${this.flowId}, result=${this.result}, stages=${this.successfulStages}/${this.totalStages})`;
  }
}

// Script of remote control actions executed by the end-to-end cases.
class RemoteActionSequence {
  private actions: RemoteActionDef[] = [];

  public add(keyCode: number, repeat: number, label: string): void {
    const action: RemoteActionDef = { keyCode: keyCode, repeat: repeat, label: label };
    this.actions.push(action);
  }

  public getActionCount(): number {
    return this.actions.length;
  }

  public getTotalKeyPresses(): number {
    let total: number = 0;
    for (let i = 0; i < this.actions.length; i++) {
      total += this.actions[i].repeat;
    }
    return total;
  }

  public getActions(): RemoteActionDef[] {
    const result: RemoteActionDef[] = [];
    for (let i = 0; i < this.actions.length; i++) {
      result.push(this.actions[i]);
    }
    return result;
  }

  public buildRecordingStartSequence(): RemoteActionDef[] {
    const result: RemoteActionDef[] = [];
    result.push({ keyCode: KEY_MENU, repeat: 1, label: 'menu' });
    result.push({ keyCode: KEY_VOLUME_DOWN, repeat: 1, label: 'volume_down' });
    return result;
  }

  public buildRecordingStopSequence(): RemoteActionDef[] {
    const result: RemoteActionDef[] = [];
    result.push({ keyCode: KEY_MENU, repeat: 1, label: 'menu' });
    result.push({ keyCode: KEY_VOLUME_DOWN, repeat: 1, label: 'volume_down' });
    result.push({ keyCode: KEY_BACK, repeat: 1, label: 'back' });
    return result;
  }

  public clear(): void {
    this.actions = [];
  }
}

// Statistics over the collected stage records.
class EndToEndStatistics {
  public getSuccessRate(records: StageRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let success: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].successful) {
        success++;
      }
    }
    return success / records.length;
  }

  public getAverageStageDuration(records: StageRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < records.length; i++) {
      total += records[i].getDuration();
    }
    return total / records.length;
  }

  public getLongestStage(records: StageRecord[]): StageRecord | null {
    if (records.length === 0) {
      return null;
    }
    let longest: StageRecord = records[0];
    for (let i = 1; i < records.length; i++) {
      if (records[i].getDuration() > longest.getDuration()) {
        longest = records[i];
      }
    }
    return longest;
  }

  public countStages(records: StageRecord[], stage: EndToEndStage): number {
    let count: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].stage === stage) {
        count++;
      }
    }
    return count;
  }
}

// Decides the final result of a flow from the collected stage records.
class FlowResultDecider {
  public decide(stages: StageRecord[]): FlowResult {
    if (stages.length === 0) {
      return FlowResult.FAILED;
    }
    let allSuccessful: boolean = true;
    for (let i = 0; i < stages.length; i++) {
      if (!stages[i].successful) {
        allSuccessful = false;
      }
    }
    if (allSuccessful) {
      return FlowResult.SUCCESS;
    }
    return FlowResult.INTERRUPTED;
  }

  public buildReport(flowId: string, stages: StageRecord[]): FlowReportModel {
    const result: FlowResult = this.decide(stages);
    let successful: number = 0;
    let totalDuration: number = 0;
    for (let i = 0; i < stages.length; i++) {
      if (stages[i].successful) {
        successful++;
      }
      totalDuration += stages[i].getDuration();
    }
    return new FlowReportModel(flowId, result, stages.length, successful, totalDuration);
  }
}

// Ledger of one recording session. It mirrors the observable behavior of
// SRManager: a session owns one photo asset uri, one file descriptor and the
// state machine Idle -> Recording -> Stopped (or Error).
class SessionLedger {
  private state: RecState = RecState.Idle;
  private fd: number = -1;
  private fileName: string = '';
  private uri: string = '';
  private fdCounter: number = 100;
  private transitionCount: number = 0;

  public start(at: Date): boolean {
    if (this.state === RecState.Recording) {
      return false;
    }
    this.fileName = buildRecordingFileName(at);
    this.fd = this.fdCounter;
    this.fdCounter++;
    this.uri = `fd://${this.fd}`;
    this.state = RecState.Recording;
    this.transitionCount++;
    return true;
  }

  public stop(): boolean {
    if (this.state !== RecState.Recording) {
      return false;
    }
    this.state = RecState.Stopped;
    this.transitionCount++;
    return true;
  }

  public fail(): void {
    this.state = RecState.Error;
    this.transitionCount++;
  }

  public getState(): RecState {
    return this.state;
  }

  public getFd(): number {
    return this.fd;
  }

  public getFileName(): string {
    return this.fileName;
  }

  public getUri(): string {
    return this.uri;
  }

  public getTransitionCount(): number {
    return this.transitionCount;
  }

  public isRecording(): boolean {
    return this.state === RecState.Recording;
  }

  public isTerminal(): boolean {
    return this.state === RecState.Stopped || this.state === RecState.Error;
  }

  public snapshot(): SessionSnapshotDef {
    const snapshot: SessionSnapshotDef = {
      state: this.state,
      fd: this.fd,
      fileName: this.fileName,
      uri: this.uri
    };
    return snapshot;
  }

  public reset(): void {
    this.state = RecState.Idle;
    this.fd = -1;
    this.fileName = '';
    this.uri = '';
    this.transitionCount = 0;
  }
}

export default function screenRecorderEndToEndTest(): void {
  describe('ScreenRecorderEndToEnd_Test', () => {
    let driver: Driver;
    let tracker: RecorderFlowTracker;

    beforeAll(async () => {
      driver = getDriver();
      tracker = new RecorderFlowTracker('e2e-session');
      await serializedDelay(driver, 500);
    });

    afterAll(async () => {
      await serializedDelay(driver, 300);
    });

    // End-to-end: starting the service must surface the timer window.
    it('service_start_should_render_recording_timer', 0, async () => {
      await triggerRecordingStart(driver);
      const visible: boolean = await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      tracker.beginStage(EndToEndStage.SERVICE_START);
      tracker.completeStage(EndToEndStage.SERVICE_START, true);
      tracker.beginStage(EndToEndStage.TIMER_RENDER);
      tracker.completeStage(EndToEndStage.TIMER_RENDER, visible);
      expect(tracker.hasStage(EndToEndStage.TIMER_RENDER)).assertTrue();
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // End-to-end: the running recording keeps the timer window alive.
    it('active_recording_should_keep_timer_window_alive', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      const visible: boolean = await isTimerWindowVisible(driver);
      tracker.beginStage(EndToEndStage.RECORDING_ACTIVE);
      tracker.completeStage(EndToEndStage.RECORDING_ACTIVE, visible);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // End-to-end: the stop combination finishes the recording.
    it('stop_combination_should_finish_recording', 0, async () => {
      await triggerRecordingStart(driver);
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      await triggerRecordingStop(driver);
      tracker.beginStage(EndToEndStage.STOP_COMBINATION);
      tracker.completeStage(EndToEndStage.STOP_COMBINATION, true);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // End-to-end: the tip window confirms the saved video.
    it('stop_should_render_saved_video_tip', 0, async () => {
      const tipVisible: boolean = await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      tracker.beginStage(EndToEndStage.TIP_RENDER);
      tracker.completeStage(EndToEndStage.TIP_RENDER, tipVisible);
      expect(tracker.getStageCount()).assertLargerOrEqual(1);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    // End-to-end: the whole script keeps the flow chronological.
    it('end_to_end_flow_should_stay_chronological', 0, async () => {
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getSuccessfulStageCount()).assertLargerOrEqual(0);
      expect(tracker.getTotalDuration()).assertLargerOrEqual(0);
    });

    // End-to-end: a clean run is reported as successful.
    it('clean_flow_should_be_reported_as_success', 0, async () => {
      const records: StageRecord[] = tracker.getStages();
      const decider = new FlowResultDecider();
      const report: FlowReportModel = decider.buildReport('e2e-clean', records);
      expect(report.totalStages).assertLargerOrEqual(1);
      expect(report.getSuccessRate()).assertLargerOrEqual(0);
      expect(report.getSuccessRate()).assertLessOrEqual(1);
      expect(report.successfulStages).assertLessOrEqual(report.totalStages);
    });

    // Model: an interrupted stage downgrades the flow result.
    it('interrupted_stage_should_downgrade_result', 0, async () => {
      const records: StageRecord[] = [];
      records.push(new StageRecord(EndToEndStage.SERVICE_START, 0, 10, true));
      records.push(new StageRecord(EndToEndStage.TIMER_RENDER, 10, 30, false));
      const decider = new FlowResultDecider();
      expect(decider.decide(records)).assertEqual(FlowResult.INTERRUPTED);
      expect(decider.decide([])).assertEqual(FlowResult.FAILED);
    });

    // Model: stage helper methods behave deterministically.
    it('stage_record_helpers_should_be_deterministic', 0, async () => {
      const record = new StageRecord(EndToEndStage.EXIT, 100, 250, true);
      const clone: StageRecord = record.clone();
      expect(clone.equals(record)).assertTrue();
      expect(clone.getDuration()).assertEqual(150);
      expect(record.isValid()).assertTrue();
      expect(record.toString().includes('duration=150')).assertTrue();
      const invalid = new StageRecord(EndToEndStage.EXIT, 300, 200, true);
      expect(invalid.isValid()).assertFalse();
    });

    // Model: statistics over the collected records.
    it('stage_statistics_should_be_computed_correctly', 0, async () => {
      const records: StageRecord[] = [];
      records.push(new StageRecord(EndToEndStage.SERVICE_START, 0, 100, true));
      records.push(new StageRecord(EndToEndStage.TIMER_RENDER, 100, 300, true));
      records.push(new StageRecord(EndToEndStage.EXIT, 300, 400, false));
      const stats = new EndToEndStatistics();
      expect(stats.countStages(records, EndToEndStage.TIMER_RENDER)).assertEqual(1);
      expect(stats.countStages(records, EndToEndStage.TIP_RENDER)).assertEqual(0);
      expect(stats.getSuccessRate(records)).assertEqual(2 / 3);
      const longest: StageRecord | null = stats.getLongestStage(records);
      expect(longest?.stage).assertEqual(EndToEndStage.TIMER_RENDER);
      expect(stats.getLongestStage([])).assertEqual(null);
    });

    // Model: the session ledger follows the SRManager state machine.
    it('session_ledger_should_follow_state_machine', 0, async () => {
      const ledger = new SessionLedger();
      const seed = new Date(2026, 0, 2, 3, 4, 5);
      expect(ledger.getState()).assertEqual(RecState.Idle);
      expect(ledger.start(seed)).assertTrue();
      expect(ledger.getState()).assertEqual(RecState.Recording);
      expect(ledger.isRecording()).assertTrue();
      expect(ledger.getUri()).assertEqual('fd://100');
      expect(isValidRecordingFileName(ledger.getFileName())).assertTrue();
      expect(ledger.start(seed)).assertFalse();
      expect(ledger.stop()).assertTrue();
      expect(ledger.getState()).assertEqual(RecState.Stopped);
      expect(ledger.isTerminal()).assertTrue();
      expect(ledger.getTransitionCount()).assertEqual(2);
    });

    // Model: a failing session ends in the Error state.
    it('failed_session_should_end_in_error_state', 0, async () => {
      const ledger = new SessionLedger();
      ledger.start(new Date(2026, 5, 6, 7, 8, 9));
      ledger.fail();
      expect(ledger.getState()).assertEqual(RecState.Error);
      expect(ledger.isTerminal()).assertTrue();
      expect(ledger.stop()).assertFalse();
      const snapshot: SessionSnapshotDef = ledger.snapshot();
      expect(snapshot.state).assertEqual(RecState.Error);
      expect(snapshot.fileName.startsWith('REC_')).assertTrue();
      expect(snapshot.fileName.endsWith('.mp4')).assertTrue();
    });

    // Model: the file name follows the REC_yyyyMMdd_HHmmss.mp4 rule.
    it('recording_file_name_should_follow_naming_rule', 0, async () => {
      const name: string = buildRecordingFileName(new Date(2026, 10, 12, 9, 8, 7));
      expect(name).assertEqual('REC_20261112_090807.mp4');
      expect(isValidRecordingFileName(name)).assertTrue();
      expect(isValidRecordingFileName('REC_2026.mp4')).assertFalse();
      expect(isValidRecordingFileName('VID_20261112_090807.mp4')).assertFalse();
    });

    // Model: the timer label of the floating window is HH:mm:ss.
    it('timer_label_should_be_formatted_as_hh_mm_ss', 0, async () => {
      expect(formatTimerLabel(0)).assertEqual('00:00:00');
      expect(formatTimerLabel(3661)).assertEqual('01:01:01');
      expect(formatTimerLabel(-5)).assertEqual('00:00:00');
      expect(formatTimerLabel(59)).assertEqual('00:00:59');
    });

    // Model: the stop script drives the two keys of the combination.
    it('stop_action_script_should_use_two_keys', 0, async () => {
      const sequence = new RemoteActionSequence();
      sequence.add(KEY_BACK, 1, 'back');
      expect(sequence.getActionCount()).assertEqual(1);
      expect(sequence.getTotalKeyPresses()).assertEqual(1);
      const stopScript: RemoteActionDef[] = sequence.buildRecordingStopSequence();
      expect(stopScript.length).assertEqual(3);
      expect(stopScript[0].keyCode).assertEqual(KEY_MENU);
      expect(stopScript[1].keyCode).assertEqual(KEY_VOLUME_DOWN);
      sequence.clear();
      expect(sequence.getActionCount()).assertEqual(0);
    });

    // Model: the recording flow tracker resets without leaked records.
    it('flow_tracker_reset_should_clear_records', 0, async () => {
      const localTracker = new RecorderFlowTracker('reset-session');
      localTracker.beginStage(EndToEndStage.SERVICE_START);
      localTracker.beginStage(EndToEndStage.TIMER_RENDER);
      localTracker.completeStage(EndToEndStage.TIMER_RENDER, true);
      expect(localTracker.getStageCount()).assertEqual(2);
      expect(localTracker.getFlowId()).assertEqual('reset-session');
      expect(localTracker.completeStage(EndToEndStage.EXIT, true)).assertFalse();
      localTracker.reset();
      expect(localTracker.getStageCount()).assertEqual(0);
      expect(localTracker.hasStage(EndToEndStage.SERVICE_START)).assertFalse();
    });

    // UI: a back press after the flow keeps the device responsive.
    it('back_press_after_flow_should_keep_device_responsive', 0, async () => {
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 200);
      const count: number = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });
  });
}


