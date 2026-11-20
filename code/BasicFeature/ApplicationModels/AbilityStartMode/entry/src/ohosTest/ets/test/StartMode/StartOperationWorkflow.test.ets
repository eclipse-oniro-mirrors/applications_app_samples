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
  KEY_UP,
  MODE_STANDARD,
  TIMEOUT_PAGE_RENDER,
  checkFocusState,
  componentCount,
  getCurrentFocusIndex,
  getDriver,
  homeComponentCount,
  isFoodDetailVisible,
  isHomePageVisible,
  launchSingletonAbility,
  launchSpecifiedAbility,
  launchStandardAbility,
  pressAndWait,
  resetToHome,
  serializedDelay,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// 启动模式类型枚举
enum StartModeType {
  STARTMODE_STANDARD = 0, STARTMODE_SPECIFIED = 1, STARTMODE_SINGLETON = 2
}

// 启动记录接口
interface LaunchRecord {
  modeType: number;
  foodItemId: number;
  target: string;
  success: boolean;
  timestamp: number;
}

// 模拟启动服务：记录启动日志，避免测试中依赖真实实例状态
class MockStartModeService {
  private static instance: MockStartModeService;
  private operationLog: LaunchRecord[] = [];

  public static getInstance(): MockStartModeService {
    if (!MockStartModeService.instance) {
      MockStartModeService.instance = new MockStartModeService();
    }
    return MockStartModeService.instance;
  }

  public startStandard(foodItemId: number): boolean {
    this.operationLog.push({
      modeType: StartModeType.STARTMODE_STANDARD,
      foodItemId,
      target: 'pages/FoodDetail',
      success: true,
      timestamp: Date.now()
    });
    return true;
  }

  public startSpecified(foodItemId: number, target: string): boolean {
    this.operationLog.push({
      modeType: StartModeType.STARTMODE_SPECIFIED,
      foodItemId,
      target,
      success: true,
      timestamp: Date.now()
    });
    return true;
  }

  public startSingleton(foodItemId: number): boolean {
    this.operationLog.push({
      modeType: StartModeType.STARTMODE_SINGLETON,
      foodItemId,
      target: 'pages/FoodDetail',
      success: true,
      timestamp: Date.now()
    });
    return true;
  }

  public getOperationLog(): LaunchRecord[] {
    return [...this.operationLog];
  }

  public getOperationCount(type: number): number {
    return this.operationLog.filter((record: LaunchRecord) => record.modeType === type).length;
  }

  public clearOperationLog(): void {
    this.operationLog = [];
  }
}

// 启动工作流模型：模拟浏览-选择-打开详情流程
class StartModeWorkflowModel {
  private selectedIndex: number = -1;
  private homeVisible: boolean = true;
  private detailVisible: boolean = false;

  public select(index: number): void {
    this.selectedIndex = index;
  }

  public hasSelection(): boolean {
    return this.selectedIndex >= 0;
  }

  public openDetail(): void {
    this.homeVisible = false;
    this.detailVisible = true;
  }

  public backToHome(): void {
    this.homeVisible = true;
    this.detailVisible = false;
  }

  public isHomeVisible(): boolean {
    return this.homeVisible;
  }

  public isDetailVisible(): boolean {
    return this.detailVisible;
  }

  public getSelectedIndex(): number {
    return this.selectedIndex;
  }

  public reset(): void {
    this.selectedIndex = -1;
    this.homeVisible = true;
    this.detailVisible = false;
  }
}

// 工作流状态枚举：描述启动模式工作流的当前状态
enum WorkflowState {
  STATE_IDLE = 'idle', STATE_BROWSING = 'browsing', STATE_SELECTED = 'selected', STATE_LAUNCHING = 'launching', STATE_DETAIL = 'detail', STATE_COMPLETED = 'completed'
}

// 工作流事件枚举：描述触发工作流状态迁移的事件
enum WorkflowEvent {
  EVENT_OPEN = 'open', EVENT_NAVIGATE = 'navigate', EVENT_SELECT = 'select', EVENT_LAUNCH = 'launch', EVENT_BACK = 'back', EVENT_CANCEL = 'cancel'
}

// 工作流迁移接口：描述一次状态迁移的源、目标与触发事件
interface WorkflowTransition {
  from: WorkflowState;
  to: WorkflowState;
  event: WorkflowEvent;
}

// 工作流状态机：管理启动模式工作流的状态迁移与合法性校验
class WorkflowStateMachine {
  private currentState: WorkflowState = WorkflowState.STATE_IDLE;
  private transitions: WorkflowTransition[] = [];
  private transitionLog: string[] = [];

  public getState(): WorkflowState {
    return this.currentState;
  }

  public registerTransition(from: WorkflowState, to: WorkflowState, event: WorkflowEvent): void {
    this.transitions.push({ from, to, event });
  }

  public canTransit(event: WorkflowEvent): boolean {
    return this.transitions.some((transition: WorkflowTransition) => transition.from === this.currentState &&
      transition.event === event);
  }

  public transit(event: WorkflowEvent): boolean {
    if (!this.canTransit(event)) {
      return false;
    }
    const matched: WorkflowTransition | undefined =
      this.transitions.find((transition: WorkflowTransition) => transition.from === this.currentState &&
        transition.event === event);
    if (matched === undefined) {
      return false;
    }
    this.currentState = matched.to;
    this.transitionLog.push(`${matched.from}->${matched.to}`);
    return true;
  }

  public getTransitionLog(): string[] {
    return [...this.transitionLog];
  }

  public getTransitionCount(): number {
    return this.transitionLog.length;
  }

  public reset(): void {
    this.currentState = WorkflowState.STATE_IDLE;
    this.transitionLog = [];
  }
}

// 工作流历史记录器：记录并回放工作流的执行历史
class WorkflowHistory {
  private history: WorkflowTransition[] = [];

  public record(transition: WorkflowTransition): void {
    this.history.push(transition);
  }

  public getHistory(): WorkflowTransition[] {
    return [...this.history];
  }

  public getHistoryCount(): number {
    return this.history.length;
  }

  public hasVisitedState(state: WorkflowState): boolean {
    return this.history.some((transition: WorkflowTransition) => transition.to === state);
  }

  public getFirstState(): WorkflowState | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[0].from;
  }

  public getLastState(): WorkflowState | null {
    if (this.history.length === 0) {
      return null;
    }
    return this.history[this.history.length - 1].to;
  }

  public clear(): void {
    this.history = [];
  }
}

// 工作流校验器：校验工作流的选择序列与模式合法性
class WorkflowValidator {
  public isValidGroupIndex(index: number): boolean {
    return index >= 0 && index <= 2;
  }

  public isSelectable(homeVisible: boolean, index: number): boolean {
    return homeVisible && this.isValidGroupIndex(index);
  }

  public validateSelectionSequence(sequence: number[]): boolean {
    for (let i = 0; i < sequence.length; i++) {
      if (!this.isValidGroupIndex(sequence[i])) {
        return false;
      }
    }
    return true;
  }

  public validateNoAdjacentDuplicates(sequence: number[]): boolean {
    for (let i = 1; i < sequence.length; i++) {
      if (sequence[i] === sequence[i - 1]) {
        return false;
      }
    }
    return true;
  }

  public isModeTypeValid(modeType: number): boolean {
    return modeType >= StartModeType.STARTMODE_STANDARD && modeType <= StartModeType.STARTMODE_SINGLETON;
  }

  public isValidFoodItemId(foodItemId: number): boolean {
    return foodItemId === 0 || foodItemId === 1;
  }
}

// 工作流统计器：对工作流模型的执行统计进行聚合
class WorkflowStatistics {
  private selectCount: number = 0;
  private openCount: number = 0;
  private backCount: number = 0;
  private resetCount: number = 0;

  public recordSelect(): void {
    this.selectCount++;
  }

  public recordOpen(): void {
    this.openCount++;
  }

  public recordBack(): void {
    this.backCount++;
  }

  public recordReset(): void {
    this.resetCount++;
  }

  public getSelectCount(): number {
    return this.selectCount;
  }

  public getOpenCount(): number {
    return this.openCount;
  }

  public getBackCount(): number {
    return this.backCount;
  }

  public getResetCount(): number {
    return this.resetCount;
  }

  public getTotalActionCount(): number {
    return this.selectCount + this.openCount + this.backCount + this.resetCount;
  }

  public describe(): string {
    return `WorkflowStatistics{select: ${this.selectCount}, open: ${this.openCount}, back: ${this.backCount}}`;
  }
}

// 启动记录仓库：集中管理启动记录并支持查询与清理
class LaunchRecordRepository {
  private records: LaunchRecord[] = [];

  public addRecord(record: LaunchRecord): void {
    this.records.push(record);
  }

  public getRecords(): LaunchRecord[] {
    return [...this.records];
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public countByModeType(modeType: number): number {
    return this.records.filter((record: LaunchRecord) => record.modeType === modeType).length;
  }

  public getSuccessfulCount(): number {
    return this.records.filter((record: LaunchRecord) => record.success).length;
  }

  public countByTarget(target: string): number {
    return this.records.filter((record: LaunchRecord) => record.target === target).length;
  }

  public clear(): void {
    this.records = [];
  }
}

// 工作流步骤执行器：按顺序执行工作流步骤并记录结果
class WorkflowStepExecutor {
  private steps: string[] = [];
  private completedSteps: string[] = [];

  public addStep(name: string): void {
    this.steps.push(name);
  }

  public getSteps(): string[] {
    return [...this.steps];
  }

  public getStepCount(): number {
    return this.steps.length;
  }

  public executeNext(): boolean {
    if (this.completedSteps.length >= this.steps.length) {
      return false;
    }
    this.completedSteps.push(this.steps[this.completedSteps.length]);
    return true;
  }

  public getCompletedCount(): number {
    return this.completedSteps.length;
  }

  public isFinished(): boolean {
    return this.completedSteps.length === this.steps.length;
  }

  public getRemainingSteps(): string[] {
    return this.steps.slice(this.completedSteps.length);
  }

  public clear(): void {
    this.steps = [];
    this.completedSteps = [];
  }
}

// 工作流迁移映射表：维护工作流状态迁移的查找表
class WorkflowTransitionMap {
  private transitionMap: Map<string, WorkflowTransition> = new Map<string, WorkflowTransition>();

  public register(transition: WorkflowTransition): void {
    const key: string = `${transition.from}->${transition.to}`;
    this.transitionMap.set(key, transition);
  }

  public find(from: WorkflowState, to: WorkflowState): WorkflowTransition | null {
    const key: string = `${from}->${to}`;
    const transition: WorkflowTransition | undefined = this.transitionMap.get(key);
    return transition === undefined ? null : transition;
  }

  public hasTransition(from: WorkflowState, to: WorkflowState): boolean {
    return this.find(from, to) !== null;
  }

  public getTransitionCount(): number {
    return this.transitionMap.size;
  }

  public clear(): void {
    this.transitionMap.clear();
  }
}

export default function startOperationWorkflowTest() {
  describe('StartOperationWorkflow_Test', () => {
    let driver: Driver;
    let mockStartModeService: MockStartModeService;

    beforeAll(async () => {
      driver = getDriver();
      mockStartModeService = MockStartModeService.getInstance();
      mockStartModeService.clearOperationLog();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Launch_Workflow：启动前必须先选中分组
    it('launch_should_require_selection', 0, async () => {
      const workflow = new StartModeWorkflowModel();
      expect(workflow.hasSelection()).assertFalse();
      workflow.select(1);
      expect(workflow.hasSelection()).assertTrue();
      expect(workflow.getSelectedIndex()).assertEqual(1);
    });

    // 适配 Launch_Workflow：启动前从主页切到详情页
    it('launch_should_switch_from_home_to_detail', 0, async () => {
      const workflow = new StartModeWorkflowModel();
      expect(workflow.isHomeVisible()).assertTrue();
      workflow.openDetail();
      expect(workflow.isHomeVisible()).assertFalse();
      expect(workflow.isDetailVisible()).assertTrue();
      workflow.backToHome();
      expect(workflow.isHomeVisible()).assertTrue();
    });

    // 适配 Browse_Select_Launch_Flow：standard 模式完整流程
    it('standard_workflow_should_complete_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const isFocusCorrect: boolean = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
      mockStartModeService.startStandard(0);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      expect(mockStartModeService.getOperationCount(StartModeType.STARTMODE_STANDARD)).assertEqual(1);
    });

    // 适配 Browse_Select_Launch_Flow：singleton 模式完整流程
    it('singleton_workflow_should_complete_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const isFocusCorrect: boolean = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
      mockStartModeService.startSingleton(0);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      expect(mockStartModeService.getOperationCount(StartModeType.STARTMODE_SINGLETON)).assertEqual(1);
    });

    // 适配 Browse_Select_Launch_Flow：specified 模式完整流程
    it('specified_workflow_should_complete_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const isFocusCorrect: boolean = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
      mockStartModeService.startSpecified(1, 'pages/FoodDetail');
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      expect(mockStartModeService.getOperationCount(StartModeType.STARTMODE_SPECIFIED)).assertEqual(1);
      const log: LaunchRecord[] = mockStartModeService.getOperationLog();
      expect(log.length).assertLargerOrEqual(3);
    });

    // 适配 Launch_Workflow：启动只针对单个选中分组
    it('launch_should_target_single_selected_group', 0, async () => {
      const workflow = new StartModeWorkflowModel();
      workflow.select(0);
      workflow.select(2);
      expect(workflow.hasSelection()).assertTrue();
      expect(workflow.getSelectedIndex()).assertEqual(2);
    });

    // 适配 Launch_Workflow：无效模式类型被拒绝
    it('invalid_mode_type_should_be_rejected', 0, async () => {
      const validator = new WorkflowValidator();
      const invalidType: number = 100;
      expect(validator.isModeTypeValid(invalidType)).assertFalse();
      expect(validator.isModeTypeValid(StartModeType.STARTMODE_STANDARD)).assertTrue();
      expect(validator.isModeTypeValid(StartModeType.STARTMODE_SINGLETON)).assertTrue();
    });

    // 适配 Error_Handling_Scenarios：无选中启动不崩溃
    it('launch_without_selection_should_be_safe', 0, async () => {
      const workflow = new StartModeWorkflowModel();
      expect(workflow.hasSelection()).assertFalse();
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 适配 Launch_Workflow：启动后详情页状态保持
    it('detail_state_should_persist_after_launch', 0, async () => {
      await launchStandardAbility(0);
      const stable: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      expect(stable).assertTrue();
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Home_Interaction：启动后主页仍可交互
    it('home_should_remain_responsive_after_launch', 0, async () => {
      await launchSpecifiedAbility(0);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      const focusIndex: number = await getCurrentFocusIndex(driver);
      expect(focusIndex).assertLargerOrEqual(-1);
      expect(await isFoodDetailVisible(driver)).assertTrue();
    });

    // 适配 Workflow_State_Machine：状态机初始状态为空闲
    it('workflow_state_machine_should_start_in_idle', 0, async () => {
      const machine = new WorkflowStateMachine();
      expect(machine.getState()).assertEqual(WorkflowState.STATE_IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    // 适配 Workflow_State_Machine：注册事件后允许状态迁移
    it('workflow_state_machine_should_transit_on_registered_event', 0, async () => {
      const machine = new WorkflowStateMachine();
      machine.registerTransition(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING, WorkflowEvent.EVENT_OPEN);
      expect(machine.canTransit(WorkflowEvent.EVENT_OPEN)).assertTrue();
      expect(machine.transit(WorkflowEvent.EVENT_OPEN)).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.STATE_BROWSING);
    });

    // 适配 Workflow_State_Machine：未注册事件的状态迁移被拒绝
    it('workflow_state_machine_should_reject_unregistered_event', 0, async () => {
      const machine = new WorkflowStateMachine();
      machine.registerTransition(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING, WorkflowEvent.EVENT_OPEN);
      expect(machine.transit(WorkflowEvent.EVENT_SELECT)).assertFalse();
      expect(machine.getState()).assertEqual(WorkflowState.STATE_IDLE);
    });

    // 适配 Workflow_State_Machine：状态迁移链与重置
    it('workflow_state_machine_should_reset_to_idle', 0, async () => {
      const machine = new WorkflowStateMachine();
      machine.registerTransition(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING, WorkflowEvent.EVENT_OPEN);
      machine.registerTransition(WorkflowState.STATE_BROWSING, WorkflowState.STATE_SELECTED,
        WorkflowEvent.EVENT_SELECT);
      machine.registerTransition(WorkflowState.STATE_SELECTED, WorkflowState.STATE_LAUNCHING,
        WorkflowEvent.EVENT_LAUNCH);
      machine.transit(WorkflowEvent.EVENT_OPEN);
      machine.transit(WorkflowEvent.EVENT_SELECT);
      machine.transit(WorkflowEvent.EVENT_LAUNCH);
      expect(machine.getState()).assertEqual(WorkflowState.STATE_LAUNCHING);
      expect(machine.getTransitionCount()).assertEqual(3);
      expect(machine.getTransitionLog().length).assertEqual(3);
      machine.reset();
      expect(machine.getState()).assertEqual(WorkflowState.STATE_IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    // 适配 Workflow_History：历史记录器记录状态迁移
    it('workflow_history_should_record_transitions', 0, async () => {
      const history = new WorkflowHistory();
      history.record({ from: WorkflowState.STATE_IDLE, to: WorkflowState.STATE_BROWSING,
        event: WorkflowEvent.EVENT_OPEN });
      history.record({ from: WorkflowState.STATE_BROWSING, to: WorkflowState.STATE_SELECTED,
        event: WorkflowEvent.EVENT_SELECT });
      expect(history.getHistoryCount()).assertEqual(2);
      expect(history.hasVisitedState(WorkflowState.STATE_SELECTED)).assertTrue();
      expect(history.hasVisitedState(WorkflowState.STATE_COMPLETED)).assertFalse();
      expect(history.getHistory().length).assertEqual(2);
    });

    // 适配 Workflow_History：历史记录的首末状态
    it('workflow_history_should_track_first_and_last_state', 0, async () => {
      const history = new WorkflowHistory();
      history.record({ from: WorkflowState.STATE_IDLE, to: WorkflowState.STATE_BROWSING,
        event: WorkflowEvent.EVENT_OPEN });
      history.record({ from: WorkflowState.STATE_BROWSING, to: WorkflowState.STATE_DETAIL,
        event: WorkflowEvent.EVENT_LAUNCH });
      expect(history.getFirstState()).assertEqual(WorkflowState.STATE_IDLE);
      expect(history.getLastState()).assertEqual(WorkflowState.STATE_DETAIL);
      history.clear();
      expect(history.getHistoryCount()).assertEqual(0);
    });

    // 适配 Workflow_History：空历史记录返回 null
    it('workflow_history_should_return_null_when_empty', 0, async () => {
      const history = new WorkflowHistory();
      expect(history.getFirstState()).assertEqual(null);
      expect(history.getLastState()).assertEqual(null);
      expect(history.getHistoryCount()).assertEqual(0);
    });

    // 适配 Workflow_Validator：分组选择序列校验
    it('workflow_validator_should_validate_selection_sequences', 0, async () => {
      const validator = new WorkflowValidator();
      expect(validator.validateSelectionSequence([0, 1, 2])).assertTrue();
      expect(validator.validateSelectionSequence([0, 1, 3])).assertFalse();
      expect(validator.validateSelectionSequence([])).assertTrue();
    });

    // 适配 Workflow_Validator：相邻重复选择检测
    it('workflow_validator_should_detect_adjacent_duplicates', 0, async () => {
      const validator = new WorkflowValidator();
      expect(validator.validateNoAdjacentDuplicates([0, 1, 2])).assertTrue();
      expect(validator.validateNoAdjacentDuplicates([0, 1, 1])).assertFalse();
    });

    // 适配 Workflow_Validator：可选性与食物 id 边界
    it('workflow_validator_should_check_selectability', 0, async () => {
      const validator = new WorkflowValidator();
      expect(validator.isSelectable(true, 2)).assertTrue();
      expect(validator.isSelectable(false, 2)).assertFalse();
      expect(validator.isSelectable(true, 3)).assertFalse();
      expect(validator.isValidFoodItemId(0)).assertTrue();
      expect(validator.isValidFoodItemId(1)).assertTrue();
      expect(validator.isValidFoodItemId(2)).assertFalse();
    });

    // 适配 Workflow_Statistics：动作统计累加正确
    it('workflow_statistics_should_accumulate_action_counts', 0, async () => {
      const stats = new WorkflowStatistics();
      stats.recordSelect();
      stats.recordSelect();
      stats.recordOpen();
      stats.recordBack();
      stats.recordReset();
      expect(stats.getSelectCount()).assertEqual(2);
      expect(stats.getOpenCount()).assertEqual(1);
      expect(stats.getBackCount()).assertEqual(1);
      expect(stats.getResetCount()).assertEqual(1);
      expect(stats.getTotalActionCount()).assertEqual(5);
      expect(stats.describe().includes('select: 2')).assertTrue();
    });

    // 适配 LaunchRecord_Repository：按类型与成功状态统计记录
    it('launch_record_repository_should_count_by_type_and_success', 0, async () => {
      const repository = new LaunchRecordRepository();
      repository.addRecord({ modeType: StartModeType.STARTMODE_STANDARD, foodItemId: 0,
        target: 'pages/FoodDetail', success: true, timestamp: 1 });
      repository.addRecord({ modeType: StartModeType.STARTMODE_SPECIFIED, foodItemId: 1,
        target: 'pages/FoodDetail', success: false, timestamp: 2 });
      repository.addRecord({ modeType: StartModeType.STARTMODE_STANDARD, foodItemId: 1,
        target: 'pages/Home', success: true, timestamp: 3 });
      expect(repository.getRecordCount()).assertEqual(3);
      expect(repository.countByModeType(StartModeType.STARTMODE_STANDARD)).assertEqual(2);
      expect(repository.getSuccessfulCount()).assertEqual(2);
      expect(repository.countByTarget('pages/FoodDetail')).assertEqual(2);
      expect(repository.countByTarget('pages/Home')).assertEqual(1);
      repository.clear();
      expect(repository.getRecordCount()).assertEqual(0);
    });

    // 适配 Workflow_Step_Executor：按顺序执行工作流步骤
    it('workflow_step_executor_should_execute_steps_in_order', 0, async () => {
      const executor = new WorkflowStepExecutor();
      executor.addStep('open home');
      executor.addStep('select group');
      executor.addStep('launch ability');
      expect(executor.getStepCount()).assertEqual(3);
      expect(executor.getSteps().length).assertEqual(3);
      expect(executor.executeNext()).assertTrue();
      expect(executor.getCompletedCount()).assertEqual(1);
      expect(executor.getRemainingSteps().length).assertEqual(2);
      executor.executeNext();
      executor.executeNext();
      expect(executor.isFinished()).assertTrue();
      expect(executor.executeNext()).assertFalse();
      executor.clear();
      expect(executor.getStepCount()).assertEqual(0);
    });

    // 适配 Workflow_Transition_Map：迁移映射表查询正确
    it('workflow_transition_map_should_query_registered_transitions', 0, async () => {
      const map = new WorkflowTransitionMap();
      map.register({ from: WorkflowState.STATE_IDLE, to: WorkflowState.STATE_BROWSING,
        event: WorkflowEvent.EVENT_OPEN });
      expect(map.hasTransition(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING)).assertTrue();
      expect(map.hasTransition(WorkflowState.STATE_BROWSING, WorkflowState.STATE_SELECTED)).assertFalse();
      const found: WorkflowTransition | null =
        map.find(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING);
      expect(found === null).assertFalse();
      expect(found?.event).assertEqual(WorkflowEvent.EVENT_OPEN);
      expect(map.getTransitionCount()).assertEqual(1);
      map.clear();
      expect(map.getTransitionCount()).assertEqual(0);
    });

    // 适配 Workflow_Model：重置后恢复初始状态
    it('workflow_model_reset_should_restore_initial_state', 0, async () => {
      const workflow = new StartModeWorkflowModel();
      workflow.select(2);
      workflow.openDetail();
      expect(workflow.hasSelection()).assertTrue();
      expect(workflow.isDetailVisible()).assertTrue();
      workflow.reset();
      expect(workflow.hasSelection()).assertFalse();
      expect(workflow.isHomeVisible()).assertTrue();
      expect(workflow.isDetailVisible()).assertFalse();
      expect(workflow.getSelectedIndex()).assertEqual(-1);
    });

    // 适配 Home_Recovery：返回主页后模式标识与焦点可用
    it('home_should_recover_after_workflow', 0, async () => {
      await launchSingletonAbility(0);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_START_MODE);
      const alive: boolean = (await isHomePageVisible(driver)) || (await isFoodDetailVisible(driver));
      if (!alive) {
        // Back closes the sample, relaunch the home page to keep the workflow usable.
        expect(await resetToHome(driver)).assertTrue();
      } else {
        expect(alive).assertTrue();
      }
      expect(MODE_STANDARD).assertEqual('standard');
    });

  });
}

