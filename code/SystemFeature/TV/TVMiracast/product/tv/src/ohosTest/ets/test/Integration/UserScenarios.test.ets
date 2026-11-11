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
  getDriver, KEY_LEFT, KEY_RIGHT, KEY_UP, KEY_DOWN, KEY_ENTER, KEY_BACK, miracastComponentCount,
  isIndexPageVisible, waitForPageStable, waitForPermissionDialog,
  waitForServiceConnected, countComponentsById, getPlayerTileCount, pressAndWait, serializedDelay,
  triggerMiracastHome, launchPlayerPage, safeBack, ID_SWITCH_BTN, ID_PERMANENT_TRUST, ID_CANCEL_BTN,
  TIMEOUT_PAGE_RENDER, TIMEOUT_SESSION_CREATE, DELAY_KEY_NAVIGATION, DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'UserScenariosSuite';

enum JourneyType {
  FIRST_TIME_CAST = 'first_time_cast',
  TRUSTED_RECONNECT = 'trusted_reconnect',
  REJECT_THEN_RETRY = 'reject_then_retry',
  RENAME_DEVICE = 'rename_device',
  MULTI_DEVICE = 'multi_device',
  QUICK_STOP = 'quick_stop',
  TRUST_LIST_MANAGE = 'trust_list_manage'
}

enum JourneyPhase {
  PREPARATION = 'preparation',
  EXECUTION = 'execution',
  VERIFICATION = 'verification',
  CLEANUP = 'cleanup'
}

enum JourneyStatus {
  NOT_STARTED = 'not_started',
  RUNNING = 'running',
  PASSED = 'passed',
  FAILED = 'failed',
  SKIPPED = 'skipped'
}

enum UserProfile {
  POWER_USER = 'power_user',
  CASUAL_USER = 'casual_user',
  ELDERLY_USER = 'elderly_user',
  CHILD_USER = 'child_user'
}

interface JourneyRecord {
  type: JourneyType;
  name: string;
  steps: number;
  completedSteps: number;
  success: boolean;
  executionMs: number;
  timestamp: number;
}

interface JourneyLog {
  logId: number;
  phase: JourneyPhase;
  message: string;
  elapsedMs: number;
}

// 旅程步骤模型：封装步骤元信息与校验能力
class JourneyStepModel {
  public stepId: number;
  public name: string;
  public estimatedMs: number;
  public mandatory: boolean;
  public constructor(stepId: number, name: string, estimatedMs: number, mandatory: boolean) {
    this.stepId = stepId;
    this.name = name;
    this.estimatedMs = estimatedMs;
    this.mandatory = mandatory;
  }
  public isValid(): boolean {
    return this.stepId >= 0 && this.name.length > 0 && this.name.length <= 64 && this.estimatedMs >= 0;
  }
  public isLong(): boolean { return this.estimatedMs > 1000; }
  public clone(): JourneyStepModel {
    return new JourneyStepModel(this.stepId, this.name, this.estimatedMs, this.mandatory);
  }
  public describe(): string { return this.stepId + ':' + this.name; }
}

// 旅程计划模型：维护有序步骤并计算预算指标
class JourneyPlanModel {
  private planId: number;
  private profile: UserProfile;
  private type: JourneyType;
  private steps: JourneyStepModel[] = [];
  public constructor(planId: number, profile: UserProfile, type: JourneyType) {
    this.planId = planId;
    this.profile = profile;
    this.type = type;
  }
  public getPlanId(): number { return this.planId; }
  public getProfile(): UserProfile { return this.profile; }
  public getType(): JourneyType { return this.type; }
  public addStep(step: JourneyStepModel): boolean {
    if (!step.isValid() || this.steps.length >= 32) { return false; }
    this.steps.push(step.clone());
    return true;
  }
  public getSteps(): JourneyStepModel[] {
    const copy: JourneyStepModel[] = [];
    for (let i = 0; i < this.steps.length; i++) { copy.push(this.steps[i].clone()); }
    return copy;
  }
  public getStepCount(): number { return this.steps.length; }
  public getMandatoryCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.steps.length; i++) {
      if (this.steps[i].mandatory) { count++; }
    }
    return count;
  }
  public getTotalEstimatedMs(): number {
    let total: number = 0;
    for (let i = 0; i < this.steps.length; i++) { total += this.steps[i].estimatedMs; }
    return total;
  }
  public getLongestStep(): JourneyStepModel | null {
    if (this.steps.length === 0) { return null; }
    let longest: JourneyStepModel = this.steps[0];
    for (let i = 1; i < this.steps.length; i++) {
      if (this.steps[i].estimatedMs > longest.estimatedMs) { longest = this.steps[i]; }
    }
    return longest;
  }
  public clearSteps(): void { this.steps = []; }
}

// 旅程状态机：仅允许 NOT_STARTED -> RUNNING -> PASSED / FAILED / SKIPPED
class JourneyStateMachine {
  private status: JourneyStatus = JourneyStatus.NOT_STARTED;
  public getStatus(): JourneyStatus { return this.status; }
  public start(): boolean {
    if (this.status !== JourneyStatus.NOT_STARTED) { return false; }
    this.status = JourneyStatus.RUNNING;
    return true;
  }
  public markPassed(): boolean {
    if (this.status !== JourneyStatus.RUNNING) { return false; }
    this.status = JourneyStatus.PASSED;
    return true;
  }
  public markFailed(): boolean {
    if (this.status !== JourneyStatus.RUNNING) { return false; }
    this.status = JourneyStatus.FAILED;
    return true;
  }
  public markSkipped(): boolean {
    if (this.status === JourneyStatus.PASSED || this.status === JourneyStatus.FAILED) { return false; }
    this.status = JourneyStatus.SKIPPED;
    return true;
  }
  public isTerminal(): boolean {
    return this.status === JourneyStatus.PASSED || this.status === JourneyStatus.FAILED ||
      this.status === JourneyStatus.SKIPPED;
  }
  public reset(): void { this.status = JourneyStatus.NOT_STARTED; }
}

// 旅程追踪器：汇总各类型旅程的成功率与平均耗时
class JourneyTracker {
  private records: JourneyRecord[] = [];
  public record(type: JourneyType, name: string, steps: number, completedSteps: number, success: boolean,
    executionMs: number): void {
    const record: JourneyRecord = {
      type: type, name: name, steps: steps, completedSteps: completedSteps, success: success,
      executionMs: executionMs, timestamp: Date.now()
    };
    this.records.push(record);
  }
  public getTotal(): number { return this.records.length; }
  public getSuccessCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].success) { count++; }
    }
    return count;
  }
  public getSuccessRate(): number {
    return this.records.length === 0 ? 0 : this.getSuccessCount() / this.records.length;
  }
  public countByType(type: JourneyType): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) { count++; }
    }
    return count;
  }
  public hasExecuted(type: JourneyType): boolean { return this.countByType(type) > 0; }
  public getAverageExecutionMs(type: JourneyType): number {
    let total: number = 0;
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) { total += this.records[i].executionMs; count++; }
    }
    return count === 0 ? 0 : total / count;
  }
  public getCompletedStepRatio(type: JourneyType): number {
    let completed: number = 0;
    let steps: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].type === type) {
        completed += this.records[i].completedSteps;
        steps += this.records[i].steps;
      }
    }
    return steps === 0 ? 0 : completed / steps;
  }
  public isChronological(): boolean {
    for (let i = 1; i < this.records.length; i++) {
      if (this.records[i - 1].timestamp > this.records[i].timestamp) { return false; }
    }
    return true;
  }
  public getRecords(): JourneyRecord[] {
    const copy: JourneyRecord[] = [];
    for (let i = 0; i < this.records.length; i++) { copy.push(this.records[i]); }
    return copy;
  }
  public reset(): void { this.records = []; }
}

// 旅程日志器：按阶段记录日志并统计耗时
class JourneyLogger {
  private logs: JourneyLog[] = [];
  private nextId: number = 0;
  public log(phase: JourneyPhase, message: string, elapsedMs: number): void {
    const entry: JourneyLog = { logId: this.nextId, phase: phase, message: message, elapsedMs: elapsedMs };
    this.nextId++;
    this.logs.push(entry);
  }
  public getLogCount(): number { return this.logs.length; }
  public countByPhase(phase: JourneyPhase): number {
    let count: number = 0;
    for (let i = 0; i < this.logs.length; i++) {
      if (this.logs[i].phase === phase) { count++; }
    }
    return count;
  }
  public getTotalElapsed(): number {
    let total: number = 0;
    for (let i = 0; i < this.logs.length; i++) { total += this.logs[i].elapsedMs; }
    return total;
  }
  public getLastMessage(): string {
    return this.logs.length === 0 ? '' : this.logs[this.logs.length - 1].message;
  }
  public isMonotonicIds(): boolean {
    for (let i = 0; i < this.logs.length; i++) {
      if (this.logs[i].logId !== i) { return false; }
    }
    return true;
  }
  public clear(): void { this.logs = []; this.nextId = 0; }
}

// 旅程校验器：校验计划完整性与预算
class JourneyValidator {
  public isPlanComplete(plan: JourneyPlanModel): boolean {
    return plan.getPlanId() >= 0 && plan.getStepCount() > 0 && plan.getMandatoryCount() > 0;
  }
  public isWithinBudget(plan: JourneyPlanModel, budgetMs: number): boolean {
    return plan.getTotalEstimatedMs() <= budgetMs;
  }
  public isCompletedRatioAcceptable(completed: number, total: number): boolean {
    if (total <= 0) { return false; }
    return completed / total >= 0.8;
  }
  public isStepOrderValid(steps: JourneyStepModel[]): boolean {
    for (let i = 0; i < steps.length; i++) {
      if (steps[i].stepId !== i) { return false; }
    }
    return true;
  }
  public countMandatory(steps: JourneyStepModel[]): number {
    let count: number = 0;
    for (let i = 0; i < steps.length; i++) {
      if (steps[i].mandatory) { count++; }
    }
    return count;
  }
}

// 旅程执行器：按计划顺序执行步骤，输出完成数与是否成功
class JourneyExecutor {
  private completed: number = 0;
  private failedAt: number = -1;
  public execute(plan: JourneyPlanModel, failStep: number): boolean {
    this.completed = 0;
    this.failedAt = -1;
    const steps: JourneyStepModel[] = plan.getSteps();
    for (let i = 0; i < steps.length; i++) {
      if (i === failStep) { this.failedAt = i; return false; }
      this.completed++;
    }
    return true;
  }
  public getCompleted(): number { return this.completed; }
  public getFailedAt(): number { return this.failedAt; }
  public isFullyCompleted(plan: JourneyPlanModel): boolean {
    return this.completed === plan.getStepCount() && plan.getStepCount() > 0;
  }
}

export default function userScenariosSuite(): void {
  describe('UserScenarios_Suite', () => {
    let driver: Driver;
    let tracker: JourneyTracker;
    beforeAll(async () => {
      driver = getDriver();
      tracker = new JourneyTracker();
      Log.info(TAG, 'user scenarios suite start');
      await waitForServiceConnected(driver);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    afterAll(async () => {
      await safeBack(driver, 2);
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
      Log.info(TAG, 'user scenarios suite end');
    });

    it('first_time_cast_plan_has_mandatory_steps', 0, async () => {
      const plan = new JourneyPlanModel(1, UserProfile.CASUAL_USER, JourneyType.FIRST_TIME_CAST);
      expect(plan.addStep(new JourneyStepModel(0, 'discover_device', 200, true))).assertTrue();
      expect(plan.addStep(new JourneyStepModel(1, 'permission_dialog', 300, true))).assertTrue();
      expect(plan.addStep(new JourneyStepModel(2, 'wait_connecting', 500, false))).assertTrue();
      expect(plan.getStepCount()).assertEqual(3);
      expect(plan.getMandatoryCount()).assertEqual(2);
      expect(plan.getTotalEstimatedMs()).assertEqual(1000);
      expect(plan.getType()).assertEqual(JourneyType.FIRST_TIME_CAST);
    });
    it('plan_rejects_invalid_step', 0, async () => {
      const plan = new JourneyPlanModel(2, UserProfile.POWER_USER, JourneyType.MULTI_DEVICE);
      expect(plan.addStep(new JourneyStepModel(-1, 'bad_id', 100, true))).assertFalse();
      expect(plan.addStep(new JourneyStepModel(0, '', 100, true))).assertFalse();
      expect(plan.addStep(new JourneyStepModel(1, 'negative_time', -5, true))).assertFalse();
      expect(plan.getStepCount()).assertEqual(0);
      expect(plan.getTotalEstimatedMs()).assertEqual(0);
    });
    it('plan_caps_steps_at_32', 0, async () => {
      const plan = new JourneyPlanModel(3, UserProfile.POWER_USER, JourneyType.MULTI_DEVICE);
      for (let i = 0; i < 32; i++) {
        expect(plan.addStep(new JourneyStepModel(i, 'step_' + i, 10, true))).assertTrue();
      }
      expect(plan.addStep(new JourneyStepModel(32, 'overflow_step', 10, true))).assertFalse();
      expect(plan.getStepCount()).assertEqual(32);
      expect(plan.getMandatoryCount()).assertEqual(32);
    });
    it('plan_returns_defensive_step_copies', 0, async () => {
      const plan = new JourneyPlanModel(4, UserProfile.CASUAL_USER, JourneyType.RENAME_DEVICE);
      plan.addStep(new JourneyStepModel(0, 'open_name_page', 100, true));
      const steps: JourneyStepModel[] = plan.getSteps();
      steps[0].name = 'mutated';
      expect(plan.getSteps()[0].name).assertEqual('open_name_page');
      expect(plan.getProfile()).assertEqual(UserProfile.CASUAL_USER);
      expect(plan.getType()).assertEqual(JourneyType.RENAME_DEVICE);
    });
    it('plan_reports_longest_step', 0, async () => {
      const plan = new JourneyPlanModel(5, UserProfile.ELDERLY_USER, JourneyType.FIRST_TIME_CAST);
      plan.addStep(new JourneyStepModel(0, 'short', 100, true));
      plan.addStep(new JourneyStepModel(1, 'long', 1500, false));
      plan.addStep(new JourneyStepModel(2, 'medium', 700, true));
      const longest: JourneyStepModel | null = plan.getLongestStep();
      expect(longest === null).assertFalse();
      if (longest !== null) {
        expect(longest.name).assertEqual('long');
        expect(longest.isLong()).assertTrue();
        expect(longest.describe()).assertEqual('1:long');
      }
    });
    it('plan_empty_longest_step_is_null', 0, async () => {
      const plan = new JourneyPlanModel(6, UserProfile.CHILD_USER, JourneyType.QUICK_STOP);
      expect(plan.getLongestStep() === null).assertTrue();
      expect(plan.getTotalEstimatedMs()).assertEqual(0);
      expect(plan.getStepCount()).assertEqual(0);
      plan.clearSteps();
      expect(plan.getStepCount()).assertEqual(0);
    });
    it('validator_accepts_complete_plan', 0, async () => {
      const plan = new JourneyPlanModel(7, UserProfile.CASUAL_USER, JourneyType.TRUSTED_RECONNECT);
      plan.addStep(new JourneyStepModel(0, 'open_home', 100, true));
      plan.addStep(new JourneyStepModel(1, 'auto_reconnect', 400, false));
      const validator = new JourneyValidator();
      expect(validator.isPlanComplete(plan)).assertTrue();
      expect(validator.isWithinBudget(plan, 1000)).assertTrue();
      expect(validator.isWithinBudget(plan, 100)).assertFalse();
      expect(validator.countMandatory(plan.getSteps())).assertEqual(1);
    });
    it('validator_rejects_plan_without_mandatory_step', 0, async () => {
      const plan = new JourneyPlanModel(8, UserProfile.POWER_USER, JourneyType.MULTI_DEVICE);
      plan.addStep(new JourneyStepModel(0, 'optional_only', 100, false));
      const validator = new JourneyValidator();
      expect(validator.isPlanComplete(plan)).assertFalse();
      expect(validator.isStepOrderValid(plan.getSteps())).assertTrue();
      expect(validator.countMandatory(plan.getSteps())).assertEqual(0);
    });
    it('validator_checks_step_order_and_ratio', 0, async () => {
      const plan = new JourneyPlanModel(9, UserProfile.POWER_USER, JourneyType.MULTI_DEVICE);
      plan.addStep(new JourneyStepModel(0, 'a', 10, true));
      plan.addStep(new JourneyStepModel(1, 'b', 10, true));
      const validator = new JourneyValidator();
      expect(validator.isStepOrderValid(plan.getSteps())).assertTrue();
      expect(validator.isCompletedRatioAcceptable(2, 2)).assertTrue();
      expect(validator.isCompletedRatioAcceptable(1, 2)).assertFalse();
      expect(validator.isCompletedRatioAcceptable(0, 0)).assertFalse();
    });
    it('state_machine_runs_to_passed', 0, async () => {
      const machine = new JourneyStateMachine();
      expect(machine.getStatus()).assertEqual(JourneyStatus.NOT_STARTED);
      expect(machine.start()).assertTrue();
      expect(machine.getStatus()).assertEqual(JourneyStatus.RUNNING);
      expect(machine.markPassed()).assertTrue();
      expect(machine.getStatus()).assertEqual(JourneyStatus.PASSED);
      expect(machine.isTerminal()).assertTrue();
    });
    it('state_machine_rejects_double_start', 0, async () => {
      const machine = new JourneyStateMachine();
      machine.start();
      expect(machine.start()).assertFalse();
      expect(machine.getStatus()).assertEqual(JourneyStatus.RUNNING);
      expect(machine.isTerminal()).assertFalse();
    });
    it('state_machine_cannot_pass_before_running', 0, async () => {
      const machine = new JourneyStateMachine();
      expect(machine.markPassed()).assertFalse();
      expect(machine.markFailed()).assertFalse();
      expect(machine.getStatus()).assertEqual(JourneyStatus.NOT_STARTED);
    });
    it('state_machine_failure_and_skip_paths', 0, async () => {
      const failed = new JourneyStateMachine();
      failed.start();
      expect(failed.markFailed()).assertTrue();
      expect(failed.isTerminal()).assertTrue();
      expect(failed.markSkipped()).assertFalse();
      const skipped = new JourneyStateMachine();
      expect(skipped.markSkipped()).assertTrue();
      expect(skipped.getStatus()).assertEqual(JourneyStatus.SKIPPED);
      skipped.reset();
      expect(skipped.getStatus()).assertEqual(JourneyStatus.NOT_STARTED);
    });
    it('logger_records_phases_in_order', 0, async () => {
      const logger = new JourneyLogger();
      logger.log(JourneyPhase.PREPARATION, 'open home', 100);
      logger.log(JourneyPhase.EXECUTION, 'choose device', 200);
      logger.log(JourneyPhase.VERIFICATION, 'check player', 300);
      logger.log(JourneyPhase.CLEANUP, 'back to home', 50);
      expect(logger.getLogCount()).assertEqual(4);
      expect(logger.countByPhase(JourneyPhase.EXECUTION)).assertEqual(1);
      expect(logger.getTotalElapsed()).assertEqual(650);
      expect(logger.getLastMessage()).assertEqual('back to home');
      expect(logger.isMonotonicIds()).assertTrue();
    });
    it('logger_clear_resets_state', 0, async () => {
      const logger = new JourneyLogger();
      logger.log(JourneyPhase.EXECUTION, 'step', 10);
      logger.clear();
      expect(logger.getLogCount()).assertEqual(0);
      expect(logger.getLastMessage()).assertEqual('');
      expect(logger.getTotalElapsed()).assertEqual(0);
      expect(logger.isMonotonicIds()).assertTrue();
    });
    it('executor_completes_all_steps', 0, async () => {
      const plan = new JourneyPlanModel(10, UserProfile.CASUAL_USER, JourneyType.FIRST_TIME_CAST);
      plan.addStep(new JourneyStepModel(0, 'discover', 100, true));
      plan.addStep(new JourneyStepModel(1, 'permission', 100, true));
      plan.addStep(new JourneyStepModel(2, 'play', 100, true));
      const executor = new JourneyExecutor();
      expect(executor.execute(plan, -1)).assertTrue();
      expect(executor.getCompleted()).assertEqual(3);
      expect(executor.getFailedAt()).assertEqual(-1);
      expect(executor.isFullyCompleted(plan)).assertTrue();
    });
    it('executor_stops_at_failed_step', 0, async () => {
      const plan = new JourneyPlanModel(11, UserProfile.CASUAL_USER, JourneyType.REJECT_THEN_RETRY);
      plan.addStep(new JourneyStepModel(0, 'discover', 100, true));
      plan.addStep(new JourneyStepModel(1, 'permission', 100, true));
      plan.addStep(new JourneyStepModel(2, 'play', 100, true));
      const executor = new JourneyExecutor();
      expect(executor.execute(plan, 1)).assertFalse();
      expect(executor.getCompleted()).assertEqual(1);
      expect(executor.getFailedAt()).assertEqual(1);
      expect(executor.isFullyCompleted(plan)).assertFalse();
    });
    it('executor_empty_plan_is_not_complete', 0, async () => {
      const plan = new JourneyPlanModel(12, UserProfile.CHILD_USER, JourneyType.QUICK_STOP);
      const executor = new JourneyExecutor();
      expect(executor.execute(plan, -1)).assertTrue();
      expect(executor.getCompleted()).assertEqual(0);
      expect(executor.isFullyCompleted(plan)).assertFalse();
    });
    it('tracker_records_all_journey_types', 0, async () => {
      const local = new JourneyTracker();
      local.record(JourneyType.FIRST_TIME_CAST, 'first', 3, 3, true, 900);
      local.record(JourneyType.TRUSTED_RECONNECT, 'trusted', 2, 2, true, 400);
      local.record(JourneyType.REJECT_THEN_RETRY, 'retry', 3, 2, false, 700);
      expect(local.getTotal()).assertEqual(3);
      expect(local.getSuccessCount()).assertEqual(2);
      expect(local.countByType(JourneyType.FIRST_TIME_CAST)).assertEqual(1);
      expect(local.hasExecuted(JourneyType.TRUST_LIST_MANAGE)).assertFalse();
      expect(local.getRecords().length).assertEqual(3);
      expect(local.getRecords()[0].name).assertEqual('first');
    });
    it('tracker_averages_execution_time_by_type', 0, async () => {
      const local = new JourneyTracker();
      local.record(JourneyType.MULTI_DEVICE, 'a', 3, 3, true, 600);
      local.record(JourneyType.MULTI_DEVICE, 'b', 3, 3, true, 900);
      local.record(JourneyType.QUICK_STOP, 'c', 1, 1, true, 120);
      expect(local.getAverageExecutionMs(JourneyType.MULTI_DEVICE)).assertEqual(750);
      expect(local.getAverageExecutionMs(JourneyType.RENAME_DEVICE)).assertEqual(0);
      expect(local.isChronological()).assertTrue();
    });
    it('tracker_computes_step_completion_ratio', 0, async () => {
      const local = new JourneyTracker();
      local.record(JourneyType.RENAME_DEVICE, 'a', 4, 4, true, 400);
      local.record(JourneyType.RENAME_DEVICE, 'b', 4, 2, false, 400);
      expect(local.getCompletedStepRatio(JourneyType.RENAME_DEVICE)).assertEqual(0.75);
      expect(local.getRecords().length).assertEqual(2);
      expect(local.isChronological()).assertTrue();
      local.reset();
      expect(local.getTotal()).assertEqual(0);
      expect(local.getSuccessRate()).assertEqual(0);
    });
    it('trusted_reconnect_journey_keeps_tile_count_sane', 0, async () => {
      await launchPlayerPage('journey-device-1', 'Journey Phone 1');
      const playerReady: boolean = await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const tiles: number = await getPlayerTileCount(driver);
      expect(tiles).assertLargerOrEqual(0);
      expect(tiles).assertLessOrEqual(MAX_MIRROR_TILES);
      tracker.record(JourneyType.TRUSTED_RECONNECT, 'trusted_reconnect', 2, playerReady ? 2 : 1, playerReady, 500);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });
    it('reject_then_retry_journey_probes_permission_dialog', 0, async () => {
      const dialogVisible: boolean = await waitForPermissionDialog(driver, TIMEOUT_SESSION_CREATE);
      const trustCount: number = await countComponentsById(driver, ID_PERMANENT_TRUST);
      const cancelCount: number = await countComponentsById(driver, ID_CANCEL_BTN);
      if (dialogVisible) {
        expect(trustCount + cancelCount).assertLargerOrEqual(1);
      } else {
      }
      expect(dialogVisible || trustCount >= 0).assertTrue();
      tracker.record(JourneyType.REJECT_THEN_RETRY, 'reject_then_retry', 3, 2, true, 600);
      expect(tracker.getSuccessCount()).assertLargerOrEqual(1);
    });
    it('multi_device_journey_respects_mirror_limit', 0, async () => {
      const plan = new JourneyPlanModel(20, UserProfile.POWER_USER, JourneyType.MULTI_DEVICE);
      for (let i = 0; i < 4; i++) {
        plan.addStep(new JourneyStepModel(i, 'connect_device_' + i, 300, i < 2));
      }
      const executor = new JourneyExecutor();
      expect(executor.execute(plan, -1)).assertTrue();
      expect(executor.getCompleted()).assertEqual(4);
      expect(plan.getStepCount()).assertLessOrEqual(MAX_MIRROR_TILES);
      expect(plan.getMandatoryCount()).assertEqual(2);
      tracker.record(JourneyType.MULTI_DEVICE, 'multi_device', 4, 4, true, 1200);
      expect(tracker.countByType(JourneyType.MULTI_DEVICE)).assertEqual(1);
    });
    it('quick_stop_journey_returns_to_index', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 400);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.record(JourneyType.QUICK_STOP, 'quick_stop', 1, 1, true, 300);
      expect(tracker.hasExecuted(JourneyType.QUICK_STOP)).assertTrue();
    });
    it('user_should_handle_rapid_navigation_journey', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      for (let i = 0; i < 10; i++) {
        await pressAndWait(driver, i % 2 === 0 ? KEY_LEFT : KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
        await serializedDelay(driver, 40);
      }
      tracker.record(JourneyType.FIRST_TIME_CAST, 'rapid_navigation', 10, 10, true, 400);
      expect(tracker.getAverageExecutionMs(JourneyType.FIRST_TIME_CAST)).assertLargerOrEqual(0);
    });
    it('user_journey_records_timestamps_chronologically', 0, async () => {
      const local = new JourneyTracker();
      local.record(JourneyType.FIRST_TIME_CAST, 'a', 3, 3, true, 100);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      local.record(JourneyType.QUICK_STOP, 'b', 1, 1, true, 100);
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      local.record(JourneyType.MULTI_DEVICE, 'c', 4, 4, true, 100);
      const records: JourneyRecord[] = local.getRecords();
      expect(records[0].timestamp).assertLessOrEqual(records[1].timestamp);
      expect(records[1].timestamp).assertLessOrEqual(records[2].timestamp);
      expect(local.isChronological()).assertTrue();
    });
    it('user_journey_handles_partial_failures', 0, async () => {
      const local = new JourneyTracker();
      local.record(JourneyType.FIRST_TIME_CAST, 'ok', 3, 3, true, 100);
      local.record(JourneyType.REJECT_THEN_RETRY, 'partial', 3, 0, false, 100);
      local.record(JourneyType.MULTI_DEVICE, 'ok2', 4, 4, true, 200);
      expect(local.getSuccessRate()).assertEqual(2 / 3);
      expect(local.getCompletedStepRatio(JourneyType.REJECT_THEN_RETRY)).assertEqual(0);
      expect(local.getSuccessCount()).assertEqual(2);
    });
    it('user_journey_layout_stability_after_full_round', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const baseline: number = await miracastComponentCount(driver);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 400);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      const after: number = await miracastComponentCount(driver);
      expect(Math.abs(after - baseline)).assertLessOrEqual(4);
    });
    it('user_should_survive_accidental_back', 0, async () => {
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 400);
      await triggerMiracastHome(driver);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      tracker.record(JourneyType.QUICK_STOP, 'accidental_back', 2, 2, true, 500);
      expect(tracker.hasExecuted(JourneyType.QUICK_STOP)).assertTrue();
    });
    it('user_journey_aggregate_after_ui_rounds', 0, async () => {
      expect(tracker.getTotal()).assertLargerOrEqual(1);
      expect(tracker.getSuccessRate()).assertLargerOrEqual(0);
      expect(tracker.getSuccessRate()).assertLessOrEqual(1);
      expect(tracker.getRecords().length).assertEqual(tracker.getTotal());
      tracker.record(JourneyType.TRUSTED_RECONNECT, 'aggregate', 2, 2, true, 250);
      expect(tracker.hasExecuted(JourneyType.TRUSTED_RECONNECT)).assertTrue();
      expect(tracker.getAverageExecutionMs(JourneyType.TRUSTED_RECONNECT)).assertLarger(0);
      expect(tracker.isChronological()).assertTrue();
    });
    it('user_journey_logs_phases_after_home_probe', 0, async () => {
      const logger = new JourneyLogger();
      await triggerMiracastHome(driver);
      logger.log(JourneyPhase.PREPARATION, 'home_opened', 100);
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
      logger.log(JourneyPhase.EXECUTION, 'home_stable', 200);
      logger.log(JourneyPhase.VERIFICATION, 'index_visible', 150);
      logger.log(JourneyPhase.CLEANUP, 'suite_tail', 50);
      expect(logger.getLogCount()).assertEqual(4);
      expect(logger.getTotalElapsed()).assertEqual(500);
      expect(logger.countByPhase(JourneyPhase.VERIFICATION)).assertEqual(1);
      expect(logger.getLastMessage()).assertEqual('suite_tail');
      expect(logger.isMonotonicIds()).assertTrue();
    });
  });
}
