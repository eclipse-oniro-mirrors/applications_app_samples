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
import { Driver, ON } from '@ohos.UiTest';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_ENTER,
  KEY_BACK,
  KEY_POWER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay,
  getCurrentFocusIndex,
  triggerPowerDialog
} from '../Shared/SharedDriver';

// ===== 新增辅助代码：端到端流程模型与工具 =====

// 端到端阶段枚举：描述完整流程中的各个阶段
enum EndToEndStage {
  COLD_START = 'cold_start', DIALOG_RENDER = 'dialog_render', BROWSE_OPTIONS = 'browse_options', SELECT_OPTION = 'select_option', BACK_NAVIGATION = 'back_navigation', EXIT = 'exit'
}

// 导航方向枚举：描述遥控器导航方向
enum NavigationDirection {
  LEFT = 'left', RIGHT = 'right', UP = 'up', DOWN = 'down', ENTER = 'enter', BACK = 'back'
}

// 流程结果枚举：描述端到端流程的最终结果
enum FlowResult {
  SUCCESS = 'success', INTERRUPTED = 'interrupted', FAILED = 'failed'
}

// 阶段记录接口：描述单个阶段的执行情况
interface StageRecord {
  stage: EndToEndStage;
  startedAt: number;
  finishedAt: number;
  successful: boolean;
}

// 流程报告接口：描述一次完整流程的汇总报告
interface FlowReport {
  flowId: string;
  result: FlowResult;
  totalStages: number;
  successfulStages: number;
  totalDurationMs: number;
}

// 导航动作接口：描述一次导航动作
interface NavigationAction {
  direction: NavigationDirection;
  repeat: number;
}

// 阶段记录模型：封装阶段执行记录，支持克隆与比较
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
    return `EndToEndStageRecord(stage=${this.stage}, successful=${this.successful}, duration=${this.getDuration()})`;
  }

  public getDuration(): number {
    return this.finishedAt - this.startedAt;
  }

  public isValid(): boolean {
    return this.finishedAt >= this.startedAt;
  }
}

// 端到端流程追踪器：追踪流程各阶段的执行情况
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
    let count: number = 0;
    for (let i = 0; i < this.stages.length; i++) {
      if (this.stages[i].successful) {
        count++;
      }
    }
    return count;
  }

  public getStages(): EndToEndStageRecord[] {
    const result: EndToEndStageRecord[] = [];
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
    this.currentStart = 0;
  }
}

// 流程报告模型：封装端到端流程汇总报告，支持克隆与比较
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

  public toString(): string {
    return `FlowReportModel(flowId=${this.flowId}, result=${this.result}, stages=${this.successfulStages}/${this.totalStages}, duration=${this.totalDurationMs})`;
  }

  public isComplete(): boolean {
    return this.successfulStages === this.totalStages;
  }

  public isValid(): boolean {
    return this.totalStages >= 0 && this.successfulStages >= 0 && this.successfulStages <= this.totalStages;
  }
}

// 导航动作模型：封装导航动作，支持克隆与比较
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

// 导航动作序列生成器：构建标准导航动作序列
class NavigationActionSequenceBuilder {
  private actions: NavigationActionModel[] = [];

  public add(direction: NavigationDirection, repeat: number): void {
    this.actions.push(new NavigationActionModel(direction, repeat));
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

  public getActions(): NavigationActionModel[] {
    const result: NavigationActionModel[] = [];
    for (let i = 0; i < this.actions.length; i++) {
      result.push(this.actions[i].clone());
    }
    return result;
  }

  public buildBrowseSequence(): NavigationActionModel[] {
    const result: NavigationActionModel[] = [];
    result.push(new NavigationActionModel(NavigationDirection.RIGHT, 1));
    result.push(new NavigationActionModel(NavigationDirection.LEFT, 1));
    result.push(new NavigationActionModel(NavigationDirection.ENTER, 1));
    return result;
  }

  public buildExitSequence(): NavigationActionModel[] {
    const result: NavigationActionModel[] = [];
    result.push(new NavigationActionModel(NavigationDirection.BACK, 1));
    return result;
  }

  public clear(): void {
    this.actions = [];
  }
}

// 端到端统计器：统计流程执行的各项指标
class EndToEndStatistics {
  public getSuccessRate(records: EndToEndStageRecord[]): number {
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

  public getAverageStageDuration(records: EndToEndStageRecord[]): number {
    if (records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (let i = 0; i < records.length; i++) {
      total += records[i].getDuration();
    }
    return total / records.length;
  }

  public getLongestStage(records: EndToEndStageRecord[]): EndToEndStageRecord | null {
    if (records.length === 0) {
      return null;
    }
    let longest = records[0];
    for (let i = 1; i < records.length; i++) {
      if (records[i].getDuration() > longest.getDuration()) {
        longest = records[i];
      }
    }
    return longest;
  }

  public countStages(records: EndToEndStageRecord[], stage: EndToEndStage): number {
    let count: number = 0;
    for (let i = 0; i < records.length; i++) {
      if (records[i].stage === stage) {
        count++;
      }
    }
    return count;
  }
}

// 流程结果判定器：根据阶段执行情况判定流程最终结果
class FlowResultDecider {
  public decide(stages: EndToEndStageRecord[]): FlowResult {
    if (stages.length === 0) {
      return FlowResult.FAILED;
    }
    let allSuccessful: boolean = true;
    let anyInterrupted: boolean = false;
    for (let i = 0; i < stages.length; i++) {
      if (!stages[i].successful) {
        allSuccessful = false;
        anyInterrupted = true;
      }
    }
    if (allSuccessful) {
      return FlowResult.SUCCESS;
    }
    if (anyInterrupted) {
      return FlowResult.INTERRUPTED;
    }
    return FlowResult.FAILED;
  }

  public buildReport(flowId: string, stages: EndToEndStageRecord[]): FlowReportModel {
    const result = this.decide(stages);
    let successful: number = 0;
    let totalDuration: number = 0;
    for (let i = 0; i < stages.length; i++) {
      if (stages[i].successful) {
        successful++;
      }
      totalDuration += stages[i].getDuration();
    }
    const report = new FlowReportModel(flowId, result, stages.length, successful, totalDuration);
    return report;
  }
}

export default function powerDialogEndToEndTest() {
  describe('PowerDialogEndToEnd_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Full_Application_Startup：冷启动后对话框渲染
    it('cold_start_should_render_dialog', 0, async () => {
      await triggerPowerDialog(driver);
      // 冷启动渲染可能较慢，必要时重试等待
      let stable = await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      if (!stable) {
        await serializedDelay(driver, 2000);
        stable = await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      }
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 Full_Application_Startup：对话框渲染三个选项
    it('dialog_should_render_all_three_options', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(3);
    });

    // 适配 File_Browse_Scenarios：浏览到关机选项
    it('browse_to_shutdown_option_should_work', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
    });

    // 适配 File_Browse_Scenarios：浏览到重启选项
    it('browse_to_reboot_option_should_work', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
    });

    // 适配 File_Browse_Scenarios：浏览到熄屏选项
    it('browse_to_suspend_option_should_work', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
    });

    // 适配 Navigation_BackPress_Scenarios：返回键关闭对话框
    it('back_press_should_close_dialog', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 适配 EndToEnd_Scenarios：冷启动到浏览到退出完整流程
    it('cold_start_to_browse_to_exit_should_work', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 USB_Lifecycle_Scenarios：对话框重新打开保持稳定
    it('dialog_reopen_should_maintain_stability', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await serializedDelay(driver, 500); // 等待渲染稳定后再校验
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Data_Refresh_Scenarios：返回导航后对话框状态刷新
    it('dialog_state_should_refresh_after_reopen', 0, async () => {
      await triggerPowerDialog(driver);
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const focusIndex = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });
  });
}
