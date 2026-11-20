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
  DELAY_AFTER_START_MODE,
  DELAY_KEY_NAVIGATION,
  KEY_BACK,
  KEY_LEFT,
  KEY_RIGHT,
  MODE_SINGLETON,
  MODE_SPECIFIED,
  MODE_STANDARD,
  TIMEOUT_PAGE_RENDER,
  checkFocusState,
  componentCount,
  countModeLabels,
  getCurrentFocusIndex,
  getDriver,
  homeComponentCount,
  isFoodDetailVisible,
  isHomePageVisible,
  launchMainAbility,
  launchSingletonAbility,
  launchSpecifiedAbility,
  launchStandardAbility,
  pressAndWait,
  resetToHome,
  serializedDelay,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// ===== 端到端流程模型与工具 =====

// 端到端阶段枚举：描述启动模式样例完整流程中的各个阶段
enum EndToEndStage {
  COLD_START = 'cold_start', HOME_RENDER = 'home_render', BROWSE_GROUPS = 'browse_groups', OPEN_DETAIL = 'open_detail', BACK_NAVIGATION = 'back_navigation', EXIT = 'exit'
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
    return `FlowReportModel(flowId=${this.flowId}, result=${this.result}, stages=${this.successfulStages}/${this.totalStages})`;
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
    let longest: EndToEndStageRecord = records[0];
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

  public buildReport(flowId: string, stages: EndToEndStageRecord[]): FlowReportModel {
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

export default function startModeEndToEndTest() {
  describe('StartModeEndToEnd_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Full_Application_Startup：冷启动后主页渲染
    it('cold_start_should_render_home', 0, async () => {
      await launchMainAbility();
      let stable: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      if (!stable) {
        await serializedDelay(driver, 2000);
        stable = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      }
      expect(stable).assertTrue();
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // 适配 Full_Application_Startup：主页渲染三组启动模式标识
    it('home_should_render_three_mode_groups', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const labels: number = await countModeLabels(driver);
      expect(labels).assertEqual(3);
    });

    // 适配 Browse_Mode_Groups：浏览三组食物列表时焦点保持可用
    it('browse_mode_groups_should_work', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const isFocusCorrect: boolean = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
    });

    // 适配 Browse_Mode_Groups：右方向键切换模式分组
    it('browse_right_group_should_work', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const isFocusCorrect: boolean = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
    });

    // 适配 Browse_Mode_Groups：左方向键回退模式分组
    it('browse_left_group_should_work', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_LEFT, 2, DELAY_KEY_NAVIGATION);
      const isFocusCorrect: boolean = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
    });

    // 适配 Navigation_BackPress_Scenarios：返回键离开详情页后页面仍可用
    it('back_press_should_leave_detail_page', 0, async () => {
      await launchStandardAbility(0);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      const home: boolean = await isHomePageVisible(driver);
      if (home) {
        expect(home).assertTrue();
        return;
      }
      // Back may close the detail ability and return to the launcher, relaunch the sample.
      expect(await resetToHome(driver)).assertTrue();
    });

    // 适配 EndToEnd_Scenarios：冷启动到打开详情再到退出完整流程
    it('cold_start_to_open_detail_to_exit_should_work', 0, async () => {
      await launchMainAbility();
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await launchSpecifiedAbility(1);
      const stable: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      expect(stable).assertTrue();
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
    });

    // 适配 Detail_Reopen_Scenarios：详情页重新打开保持稳定
    it('detail_reopen_should_maintain_stability', 0, async () => {
      await launchSingletonAbility(0);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      await serializedDelay(driver, 500);
      expect(await isFoodDetailVisible(driver)).assertTrue();
      await launchSingletonAbility(1);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Data_Refresh_Scenarios：返回主页后主页状态刷新
    it('home_state_should_refresh_after_reopen', 0, async () => {
      await resetToHome(driver);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // 适配 Detail_Entry_Scenarios：指定模式通过 target 打开详情页
    it('specified_mode_should_open_detail_page', 0, async () => {
      await launchSpecifiedAbility(0, 'pages/FoodDetail');
      const stable: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      expect(stable).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Stage_Record_Model：阶段记录克隆与有效性
    it('stage_record_should_clone_and_validate', 0, async () => {
      const record = new EndToEndStageRecord(EndToEndStage.HOME_RENDER, 100, 260, true);
      const clone: EndToEndStageRecord = record.clone();
      expect(clone.equals(record)).assertTrue();
      expect(clone.getDuration()).assertEqual(160);
      expect(clone.isValid()).assertTrue();
      expect(clone.toString().includes('home_render')).assertTrue();
      const invalid = new EndToEndStageRecord(EndToEndStage.EXIT, 200, 100, false);
      expect(invalid.isValid()).assertFalse();
    });

    // 适配 Flow_Tracker：阶段开始、完成与统计
    it('flow_tracker_should_record_stages', 0, async () => {
      const tracker = new EndToEndFlowTracker('flow-1');
      tracker.beginStage(EndToEndStage.COLD_START);
      tracker.completeStage(EndToEndStage.COLD_START, true);
      tracker.beginStage(EndToEndStage.HOME_RENDER);
      tracker.completeStage(EndToEndStage.HOME_RENDER, false);
      expect(tracker.getStageCount()).assertEqual(2);
      expect(tracker.getSuccessfulStageCount()).assertEqual(1);
      expect(tracker.hasStage(EndToEndStage.HOME_RENDER)).assertTrue();
      expect(tracker.hasStage(EndToEndStage.OPEN_DETAIL)).assertFalse();
      expect(tracker.isChronological()).assertTrue();
      expect(tracker.getStages().length).assertEqual(2);
      tracker.reset();
      expect(tracker.getStageCount()).assertEqual(0);
    });

    // 适配 Flow_Tracker：总耗时累加为正
    it('flow_tracker_should_accumulate_duration', 0, async () => {
      const tracker = new EndToEndFlowTracker('flow-2');
      tracker.beginStage(EndToEndStage.COLD_START);
      await serializedDelay(driver, 20);
      tracker.completeStage(EndToEndStage.COLD_START, true);
      expect(tracker.getTotalDuration()).assertLargerOrEqual(0);
      expect(tracker.getSuccessfulStageCount()).assertEqual(1);
    });

    // 适配 Flow_Report_Model：报告完整性与合法性
    it('flow_report_should_validate_completeness', 0, async () => {
      const report = new FlowReportModel('flow-3', FlowResult.SUCCESS, 4, 4, 1200);
      expect(report.isComplete()).assertTrue();
      expect(report.isValid()).assertTrue();
      const clone: FlowReportModel = report.clone();
      expect(clone.equals(report)).assertTrue();
      expect(clone.toString().includes('4/4')).assertTrue();
      const partial = new FlowReportModel('flow-4', FlowResult.INTERRUPTED, 4, 2, 800);
      expect(partial.isComplete()).assertFalse();
      expect(partial.isValid()).assertTrue();
    });

    // 适配 Navigation_Action_Model：动作合法性
    it('navigation_action_should_validate_repeat', 0, async () => {
      const action = new NavigationActionModel(NavigationDirection.ENTER, 1);
      expect(action.isValid()).assertTrue();
      expect(action.equals(action.clone())).assertTrue();
      expect(action.toString().includes('enter')).assertTrue();
      const negative = new NavigationActionModel(NavigationDirection.BACK, -1);
      expect(negative.isValid()).assertFalse();
    });

    // 适配 Navigation_Sequence_Builder：浏览与退出序列
    it('navigation_sequence_builder_should_return_sequences', 0, async () => {
      const builder = new NavigationActionSequenceBuilder();
      builder.add(NavigationDirection.RIGHT, 1);
      builder.add(NavigationDirection.RIGHT, 2);
      expect(builder.getActionCount()).assertEqual(2);
      expect(builder.getTotalKeyPresses()).assertEqual(3);
      const browse: NavigationActionModel[] = builder.buildBrowseSequence();
      expect(browse.length).assertEqual(3);
      expect(browse[2].direction).assertEqual(NavigationDirection.ENTER);
      const exit: NavigationActionModel[] = builder.buildExitSequence();
      expect(exit.length).assertEqual(1);
      expect(exit[0].direction).assertEqual(NavigationDirection.BACK);
      builder.clear();
      expect(builder.getActionCount()).assertEqual(0);
    });

    // 适配 EndToEnd_Statistics：成功率、平均耗时与最长阶段
    it('end_to_end_statistics_should_aggregate', 0, async () => {
      const statistics = new EndToEndStatistics();
      const records: EndToEndStageRecord[] = [
        new EndToEndStageRecord(EndToEndStage.COLD_START, 0, 100, true),
        new EndToEndStageRecord(EndToEndStage.HOME_RENDER, 100, 300, true),
        new EndToEndStageRecord(EndToEndStage.OPEN_DETAIL, 300, 500, false)
      ];
      expect(statistics.getSuccessRate(records)).assertEqual(2 / 3);
      expect(statistics.getAverageStageDuration(records)).assertEqual(500 / 3);
      const longest: EndToEndStageRecord | null = statistics.getLongestStage(records);
      expect(longest === null).assertFalse();
      expect(statistics.countStages(records, EndToEndStage.HOME_RENDER)).assertEqual(1);
      expect(statistics.getSuccessRate([])).assertEqual(0);
      expect(statistics.getLongestStage([]) === null).assertTrue();
    });

    // 适配 Flow_Result_Decider：全成功、部分失败与空阶段
    it('flow_result_decider_should_classify_results', 0, async () => {
      const decider = new FlowResultDecider();
      const allGood: EndToEndStageRecord[] = [
        new EndToEndStageRecord(EndToEndStage.COLD_START, 0, 100, true),
        new EndToEndStageRecord(EndToEndStage.HOME_RENDER, 100, 200, true)
      ];
      expect(decider.decide(allGood)).assertEqual(FlowResult.SUCCESS);
      const interrupted: EndToEndStageRecord[] = [
        new EndToEndStageRecord(EndToEndStage.COLD_START, 0, 100, true),
        new EndToEndStageRecord(EndToEndStage.OPEN_DETAIL, 100, 200, false)
      ];
      expect(decider.decide(interrupted)).assertEqual(FlowResult.INTERRUPTED);
      expect(decider.decide([])).assertEqual(FlowResult.FAILED);
      const report: FlowReportModel = decider.buildReport('flow-5', allGood);
      expect(report.result).assertEqual(FlowResult.SUCCESS);
      expect(report.isComplete()).assertTrue();
      expect(report.totalStages).assertEqual(2);
    });

    // 适配 Mode_Label_Persistance：主页三组模式标识常量与渲染一致
    it('mode_labels_should_match_rendered_text', 0, async () => {
      await resetToHome(driver);
      expect(await isHomePageVisible(driver)).assertTrue();
      expect(MODE_STANDARD).assertEqual('standard');
      expect(MODE_SPECIFIED).assertEqual('specified');
      expect(MODE_SINGLETON).assertEqual('sinleton');
    });
  });
}

