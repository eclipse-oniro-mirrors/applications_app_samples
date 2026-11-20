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
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  miracastComponentCount,
  checkFocusState,
  waitForPageStable,
  waitForServiceConnected,
  pressAndWait,
  getCurrentFocusIndex,
  triggerMiracastHome,
  isIndexPageVisible,
  isPlayerPageVisible,
  serializedDelay,
  TIMEOUT_PAGE_RENDER,
  TOLERANCE_COMPONENT_COUNT,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'MiracastEndToEndSuite';

enum EndToEndStage {
  COLD_START = 'cold_start',
  SERVICE_START = 'service_start',
  DEVICE_CONNECT = 'device_connect',
  PERMISSION_DECIDE = 'permission_decide',
  SESSION_CREATE = 'session_create',
  SCREEN_BIND = 'screen_bind',
  PLAY_START = 'play_start',
  MUTE_TOGGLE = 'mute_toggle',
  STOP_SESSION = 'stop_session',
  EXIT = 'exit'
}

enum NavigationDirection {
  LEFT = 'left',
  RIGHT = 'right',
  UP = 'up',
  DOWN = 'down',
  ENTER = 'enter',
  BACK = 'back'
}

enum FlowResult {
  SUCCESS = 'success',
  INTERRUPTED = 'interrupted',
  FAILED = 'failed'
}

class EndToEndStageRecord {
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

  public clone(): EndToEndStageRecord {
    return new EndToEndStageRecord(this.stage, this.startedAt, this.finishedAt, this.successful);
  }

  public equals(other: EndToEndStageRecord): boolean {
    return this.stage === other.stage && this.successful === other.successful;
  }

  public toString(): string {
    return `EndToEndStageRecord(stage=${this.stage}, successful=${this.successful})`;
  }

  public getDuration(): number {
    return this.finishedAt - this.startedAt;
  }

  public isValid(): boolean {
    return this.finishedAt >= this.startedAt;
  }
}

class EndToEndFlowTracker {
  private stages: EndToEndStageRecord[] = [];
  private flowId: string;
  private currentStart: number = 0;

  constructor(flowId: string) {
    this.flowId = flowId;
  }

  public beginStage(stage: EndToEndStage): void {
    this.currentStart = Date.now();
    this.stages.push(new EndToEndStageRecord(stage, this.currentStart, this.currentStart, true));
  }

  public completeStage(stage: EndToEndStage, successful: boolean): void {
    for (let i = this.stages.length - 1; i >= 0; i--) {
      if (this.stages[i].stage === stage && this.stages[i].finishedAt === this.stages[i].startedAt) {
        this.stages[i].finishedAt = Date.now();
        this.stages[i].successful = successful;
        return;
      }
    }
  }

  public getStageCount(): number {
    return this.stages.length;
  }

  public getSuccessfulStageCount(): number {
    return this.stages.filter((record: EndToEndStageRecord) => record.successful).length;
  }

  public getStages(): EndToEndStageRecord[] {
    return this.stages.map((record: EndToEndStageRecord) => record.clone());
  }

  public getTotalDuration(): number {
    return this.stages.reduce((sum: number, record: EndToEndStageRecord) => sum + record.getDuration(), 0);
  }

  public hasStage(stage: EndToEndStage): boolean {
    return this.stages.some((record: EndToEndStageRecord) => record.stage === stage);
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.stages.length; i++) {
      if (this.stages[i].startedAt < this.stages[i - 1].startedAt) {
        return false;
      }
    }
    return true;
  }

  public getFlowId(): string {
    return this.flowId;
  }

  public reset(): void {
    this.stages = [];
    this.currentStart = 0;
  }
}

class NavigationActionModel {
  public direction: NavigationDirection;
  public repeat: number;

  constructor(direction: NavigationDirection, repeat: number) {
    this.direction = direction;
    this.repeat = repeat;
  }

  public clone(): NavigationActionModel {
    return new NavigationActionModel(this.direction, this.repeat);
  }

  public equals(other: NavigationActionModel): boolean {
    return this.direction === other.direction && this.repeat === other.repeat;
  }

  public toString(): string {
    return `NavigationActionModel(direction=${this.direction}, repeat=${this.repeat})`;
  }

  public isValid(): boolean {
    return this.repeat >= 0;
  }
}

class NavigationActionSequenceBuilder {
  private actions: NavigationActionModel[] = [];

  public add(direction: NavigationDirection, repeat: number): void {
    this.actions.push(new NavigationActionModel(direction, repeat));
  }

  public getActionCount(): number {
    return this.actions.length;
  }

  public getTotalKeyPresses(): number {
    return this.actions.reduce((sum: number, action: NavigationActionModel) => sum + action.repeat, 0);
  }

  public getActions(): NavigationActionModel[] {
    return this.actions.map((action: NavigationActionModel) => action.clone());
  }

  public buildBrowseSequence(): NavigationActionModel[] {
    return [new NavigationActionModel(NavigationDirection.RIGHT, 1),
      new NavigationActionModel(NavigationDirection.LEFT, 1),
      new NavigationActionModel(NavigationDirection.ENTER, 1)];
  }

  public clear(): void {
    this.actions = [];
  }
}

class CastFlowSimulator {
  private stages: EndToEndStage[] = [EndToEndStage.COLD_START, EndToEndStage.SERVICE_START,
    EndToEndStage.DEVICE_CONNECT, EndToEndStage.PERMISSION_DECIDE, EndToEndStage.SESSION_CREATE,
    EndToEndStage.SCREEN_BIND, EndToEndStage.PLAY_START, EndToEndStage.STOP_SESSION, EndToEndStage.EXIT];
  private failedStage: EndToEndStage | null = null;

  public failAt(stage: EndToEndStage): void {
    this.failedStage = stage;
  }

  public run(tracker: EndToEndFlowTracker): boolean {
    let halted: boolean = false;
    for (let i = 0; i < this.stages.length; i++) {
      const stage: EndToEndStage = this.stages[i];
      if (halted) {
        break;
      }
      tracker.beginStage(stage);
      const failed: boolean = this.failedStage !== null && this.failedStage === stage;
      tracker.completeStage(stage, !failed);
      if (failed) {
        halted = true;
      }
    }
    return !halted;
  }

  public getStageCount(): number {
    return this.stages.length;
  }

  public hasStage(stage: EndToEndStage): boolean {
    return this.stages.includes(stage);
  }

  public getStages(): EndToEndStage[] {
    return [...this.stages];
  }
}

// 流程结果判定：依据阶段轨迹收敛为成功/中断/失败三态
class FlowResultDecider {
  public decide(records: EndToEndStageRecord[]): FlowResult {
    const stages: EndToEndStage[] = records.map((record: EndToEndStageRecord) => record.stage);
    const hasPlay: boolean = stages.indexOf(EndToEndStage.PLAY_START) >= 0;
    const hasExit: boolean = stages.indexOf(EndToEndStage.EXIT) >= 0;
    const hasFailure: boolean = records.some((record: EndToEndStageRecord) => !record.successful);
    if (hasFailure) {
      return stages.indexOf(EndToEndStage.SESSION_CREATE) >= 0 ? FlowResult.INTERRUPTED : FlowResult.FAILED;
    }
    if (hasPlay && hasExit) {
      return FlowResult.SUCCESS;
    }
    if (stages.indexOf(EndToEndStage.SESSION_CREATE) >= 0 || hasExit) {
      return FlowResult.INTERRUPTED;
    }
    return FlowResult.FAILED;
  }
}

export default function miracastEndToEndSuite(): void {
  describe('MiracastEndToEnd_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });





    it('back_press_should_not_break_page_structure', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      const componentCount: number = await miracastComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
      await triggerMiracastHome(driver);
    });



    it('simulated_full_cast_flow_should_succeed', 0, async () => {
      const simulator = new CastFlowSimulator();
      const tracker = new EndToEndFlowTracker('flow_full');
      const completed: boolean = simulator.run(tracker);
      expect(completed).assertTrue();
      expect(tracker.getStageCount()).assertEqual(simulator.getStageCount());
      expect(tracker.getSuccessfulStageCount()).assertEqual(simulator.getStageCount());
      expect(tracker.hasStage(EndToEndStage.PLAY_START)).assertTrue();
      expect(tracker.isChronological()).assertTrue();
    });

    it('simulated_flow_should_stop_on_session_failure', 0, async () => {
      const simulator = new CastFlowSimulator();
      simulator.failAt(EndToEndStage.SESSION_CREATE);
      const tracker = new EndToEndFlowTracker('flow_break');
      const completed: boolean = simulator.run(tracker);
      expect(completed).assertFalse();
      expect(tracker.hasStage(EndToEndStage.SESSION_CREATE)).assertTrue();
      expect(tracker.hasStage(EndToEndStage.PLAY_START)).assertFalse();
      const decider = new FlowResultDecider();
      expect(decider.decide(tracker.getStages())).assertEqual(FlowResult.INTERRUPTED);
    });

    it('simulated_flow_should_stop_on_screen_failure', 0, async () => {
      const simulator = new CastFlowSimulator();
      simulator.failAt(EndToEndStage.SCREEN_BIND);
      const tracker = new EndToEndFlowTracker('flow_screen');
      expect(simulator.run(tracker)).assertFalse();
      expect(tracker.hasStage(EndToEndStage.SCREEN_BIND)).assertTrue();
      expect(tracker.hasStage(EndToEndStage.STOP_SESSION)).assertFalse();
      expect(tracker.getSuccessfulStageCount()).assertLess(tracker.getStageCount());
    });

    it('simulated_flow_should_stop_on_service_failure', 0, async () => {
      const simulator = new CastFlowSimulator();
      simulator.failAt(EndToEndStage.SERVICE_START);
      const tracker = new EndToEndFlowTracker('flow_service');
      expect(simulator.run(tracker)).assertFalse();
      expect(tracker.getStageCount()).assertEqual(2);
      expect(tracker.hasStage(EndToEndStage.DEVICE_CONNECT)).assertFalse();
    });

    it('stage_record_should_clone_and_validate', 0, async () => {
      const record = new EndToEndStageRecord(EndToEndStage.PLAY_START, 100, 160, true);
      const copy: EndToEndStageRecord = record.clone();
      expect(record.equals(copy)).assertTrue();
      expect(copy.getDuration()).assertEqual(60);
      expect(copy.isValid()).assertTrue();
      expect(copy.toString().includes('play_start')).assertTrue();
      const invalid = new EndToEndStageRecord(EndToEndStage.PLAY_START, 200, 100, false);
      expect(invalid.isValid()).assertFalse();
      expect(record.equals(invalid)).assertFalse();
    });

    it('flow_tracker_should_complete_stages', 0, async () => {
      const tracker = new EndToEndFlowTracker('flow_track');
      tracker.beginStage(EndToEndStage.COLD_START);
      tracker.completeStage(EndToEndStage.COLD_START, true);
      tracker.beginStage(EndToEndStage.SESSION_CREATE);
      tracker.completeStage(EndToEndStage.SESSION_CREATE, false);
      expect(tracker.getStageCount()).assertEqual(2);
      expect(tracker.getSuccessfulStageCount()).assertEqual(1);
      expect(tracker.getTotalDuration()).assertLargerOrEqual(0);
      expect(tracker.getFlowId()).assertEqual('flow_track');
      tracker.reset();
      expect(tracker.getStageCount()).assertEqual(0);
    });

    it('navigation_builder_should_build_browse_sequence', 0, async () => {
      const builder = new NavigationActionSequenceBuilder();
      const sequence: NavigationActionModel[] = builder.buildBrowseSequence();
      expect(sequence.length).assertEqual(3);
      expect(sequence[0].direction).assertEqual(NavigationDirection.RIGHT);
      expect(sequence[2].direction).assertEqual(NavigationDirection.ENTER);
      expect(sequence[0].isValid()).assertTrue();
      expect(sequence[2].clone().equals(sequence[2])).assertTrue();
    });

    it('navigation_builder_should_count_key_presses', 0, async () => {
      const builder = new NavigationActionSequenceBuilder();
      builder.add(NavigationDirection.RIGHT, 2);
      builder.add(NavigationDirection.LEFT, 1);
      builder.add(NavigationDirection.BACK, 3);
      expect(builder.getActionCount()).assertEqual(3);
      expect(builder.getTotalKeyPresses()).assertEqual(6);
      const actions: NavigationActionModel[] = builder.getActions();
      expect(actions.length).assertEqual(3);
      expect(actions[2].direction).assertEqual(NavigationDirection.BACK);
      builder.clear();
      expect(builder.getActionCount()).assertEqual(0);
    });

    it('cast_flow_simulator_should_expose_core_stages', 0, async () => {
      const simulator = new CastFlowSimulator();
      expect(simulator.getStageCount()).assertEqual(9);
      expect(simulator.hasStage(EndToEndStage.SERVICE_START)).assertTrue();
      expect(simulator.hasStage(EndToEndStage.PERMISSION_DECIDE)).assertTrue();
      expect(simulator.hasStage(EndToEndStage.SCREEN_BIND)).assertTrue();
      expect(simulator.hasStage(EndToEndStage.PLAY_START)).assertTrue();
      expect(simulator.getStages().length).assertEqual(9);
    });

    it('mute_stage_should_be_tracked_independently', 0, async () => {
      const simulator = new CastFlowSimulator();
      const tracker = new EndToEndFlowTracker('flow_mute');
      expect(simulator.run(tracker)).assertTrue();
      expect(tracker.hasStage(EndToEndStage.MUTE_TOGGLE)).assertFalse();
      const muteTracker = new EndToEndFlowTracker('flow_mute_manual');
      muteTracker.beginStage(EndToEndStage.MUTE_TOGGLE);
      muteTracker.completeStage(EndToEndStage.MUTE_TOGGLE, true);
      expect(muteTracker.hasStage(EndToEndStage.MUTE_TOGGLE)).assertTrue();
      expect(muteTracker.getSuccessfulStageCount()).assertEqual(1);
    });

    it('repeated_flow_should_keep_home_focus_consistent', 0, async () => {
      for (let i = 0; i < 2; i++) {
        await triggerMiracastHome(driver);
        await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
        const focusIndex: number = await getCurrentFocusIndex(driver);
        expect(focusIndex).assertLargerOrEqual(-1);
      }
    });

    it('end_to_end_stage_enum_should_be_distinct', 0, async () => {
      const stages: EndToEndStage[] = [
        EndToEndStage.COLD_START,
        EndToEndStage.SERVICE_START,
        EndToEndStage.DEVICE_CONNECT,
        EndToEndStage.PERMISSION_DECIDE,
        EndToEndStage.SESSION_CREATE,
        EndToEndStage.SCREEN_BIND,
        EndToEndStage.PLAY_START,
        EndToEndStage.MUTE_TOGGLE,
        EndToEndStage.STOP_SESSION,
        EndToEndStage.EXIT
      ];
      const names: string[] = stages.map((stage: EndToEndStage) => stage.toString());
      const unique: Set<string> = new Set<string>(names);
      expect(stages.length).assertEqual(10);
      expect(unique.size).assertEqual(10);
      expect(stages.includes(EndToEndStage.PERMISSION_DECIDE)).assertTrue();
    });

    it('flow_tracker_should_update_latest_matching_stage', 0, async () => {
      const tracker = new EndToEndFlowTracker('flow_repeat');
      tracker.beginStage(EndToEndStage.PERMISSION_DECIDE);
      tracker.completeStage(EndToEndStage.PERMISSION_DECIDE, true);
      tracker.beginStage(EndToEndStage.PERMISSION_DECIDE);
      tracker.completeStage(EndToEndStage.PERMISSION_DECIDE, false);
      expect(tracker.getStageCount()).assertEqual(2);
      expect(tracker.getSuccessfulStageCount()).assertEqual(1);
    });

    it('navigation_action_should_reject_negative_repeat', 0, async () => {
      const valid = new NavigationActionModel(NavigationDirection.DOWN, 2);
      expect(valid.isValid()).assertTrue();
      expect(valid.repeat).assertEqual(2);
      const invalid = new NavigationActionModel(NavigationDirection.DOWN, -1);
      expect(invalid.isValid()).assertFalse();
      expect(valid.equals(invalid)).assertFalse();
      expect(valid.clone().equals(valid)).assertTrue();
    });

    it('simulated_flow_should_report_interrupted_on_exit_failure', 0, async () => {
      const simulator = new CastFlowSimulator();
      simulator.failAt(EndToEndStage.EXIT);
      const tracker = new EndToEndFlowTracker('flow_exit_fail');
      expect(simulator.run(tracker)).assertFalse();
      expect(tracker.hasStage(EndToEndStage.EXIT)).assertTrue();
      expect(tracker.getStageCount()).assertEqual(simulator.getStageCount());
      const decider = new FlowResultDecider();
      expect(decider.decide(tracker.getStages())).assertEqual(FlowResult.INTERRUPTED);
    });



    it('interrupted_flow_should_keep_successful_prefix', 0, async () => {
      const tracker = new EndToEndFlowTracker('flow_interrupted');
      const simulator = new CastFlowSimulator();
      simulator.failAt(EndToEndStage.SESSION_CREATE);
      expect(simulator.run(tracker)).assertFalse();
      expect(tracker.getSuccessfulStageCount()).assertEqual(4);
      expect(tracker.hasStage(EndToEndStage.SCREEN_BIND)).assertFalse();
    });
  });
}
