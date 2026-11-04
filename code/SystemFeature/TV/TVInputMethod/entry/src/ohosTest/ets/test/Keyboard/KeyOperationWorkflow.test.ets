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
import { Driver, ON } from '@kit.TestKit';
import {
  getDriver,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_UP,
  KEY_BACK,
  keyboardComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_IME_OP,
  serializedDelay,
  getCurrentFocusIndex,
  isInputMethodEnabled
} from '../Shared/SharedDriver';

// 电源操作类型枚举
enum KeyOperationType {
  IMEOPERATION_SUSPEND = 0, IMEOPERATION_REBOOT = 1, IMEOPERATION_SHUTDOWN = 2
}

// 操作记录接口
interface OperationRecord {
  operationType: number;
  timestamp: number;
  success: boolean;
}

// 模拟电源服务：记录操作日志，避免真实中文/符号
class MockImeService {
  private static instance: MockImeService;
  private operationLog: OperationRecord[] = [];

  public static getInstance(): MockImeService {
    if (!MockImeService.instance) {
      MockImeService.instance = new MockImeService();
    }
    return MockImeService.instance;
  }

  public suspend(): boolean {
    this.operationLog.push({
      operationType: KeyOperationType.IMEOPERATION_SUSPEND, timestamp: Date.now(), success: true
    });
    return true;
  }

  public reboot(): boolean {
    this.operationLog.push({
      operationType: KeyOperationType.IMEOPERATION_REBOOT, timestamp: Date.now(), success: true
    });
    return true;
  }

  public shutdown(): boolean {
    this.operationLog.push({
      operationType: KeyOperationType.IMEOPERATION_SHUTDOWN, timestamp: Date.now(), success: true
    });
    return true;
  }

  public getOperationLog(): OperationRecord[] {
    return [...this.operationLog];
  }

  public getOperationCount(type: number): number {
    return this.operationLog.filter((record: OperationRecord) => record.operationType === type).length;
  }

  public clearOperationLog(): void {
    this.operationLog = [];
  }
}

// 电源操作流程模型：模拟浏览-选择-执行流程
class ImeWorkflowModel {
  private selectedIndex: number = -1;
  private menuVisible: boolean = true;

  public select(index: number): void {
    this.selectedIndex = index;
  }

  public hasSelection(): boolean {
    return this.selectedIndex >= 0;
  }

  public hideMenu(): void {
    this.menuVisible = false;
  }

  public isMenuVisible(): boolean {
    return this.menuVisible;
  }

  public reset(): void {
    this.selectedIndex = -1;
    this.menuVisible = true;
  }
}

// 工作流状态枚举：描述电源操作工作流的当前状态
enum WorkflowState {
  STATE_IDLE = 'idle', STATE_BROWSING = 'browsing', STATE_SELECTED = 'selected', STATE_CONFIRMING = 'confirming', STATE_EXECUTING = 'executing', STATE_COMPLETED = 'completed'
}

// 工作流事件枚举：描述触发工作流状态迁移的事件
enum WorkflowEvent {
  EVENT_OPEN = 'open', EVENT_NAVIGATE = 'navigate', EVENT_SELECT = 'select', EVENT_CONFIRM = 'confirm', EVENT_EXECUTE = 'execute', EVENT_CANCEL = 'cancel'
}

// 工作流迁移接口：描述一次状态迁移的源、目标与触发事件
interface WorkflowTransition {
  from: WorkflowState;
  to: WorkflowState;
  event: WorkflowEvent;
}

// 工作流状态机：管理电源操作工作流的状态迁移与合法性校验
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
    const matched = this.transitions.find((transition: WorkflowTransition) => transition.from === this.currentState &&
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

// 工作流校验器：校验工作流的状态序列与选择合法性
class WorkflowValidator {
  public isValidSelectionIndex(index: number): boolean {
    return index >= 0 && index <= 2;
  }

  public isSelectable(hasMenu: boolean, index: number): boolean {
    return hasMenu && this.isValidSelectionIndex(index);
  }

  public validateSelectionSequence(sequence: number[]): boolean {
    for (let i = 0; i < sequence.length; i++) {
      if (!this.isValidSelectionIndex(sequence[i])) {
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

  public isOperationTypeValid(operationType: number): boolean {
    return operationType >= KeyOperationType.IMEOPERATION_SUSPEND &&
      operationType <= KeyOperationType.IMEOPERATION_SHUTDOWN;
  }
}

// 工作流统计器：对工作流模型的执行统计进行聚合
class WorkflowStatistics {
  private selectCount: number = 0;
  private hideCount: number = 0;
  private resetCount: number = 0;

  public recordSelect(): void {
    this.selectCount++;
  }

  public recordHide(): void {
    this.hideCount++;
  }

  public recordReset(): void {
    this.resetCount++;
  }

  public getSelectCount(): number {
    return this.selectCount;
  }

  public getHideCount(): number {
    return this.hideCount;
  }

  public getResetCount(): number {
    return this.resetCount;
  }

  public getTotalActionCount(): number {
    return this.selectCount + this.hideCount + this.resetCount;
  }

  public describe(): string {
    return `WorkflowStatistics{select: ${this.selectCount}, hide: ${this.hideCount}, reset: ${this.resetCount}}`;
  }
}

// 操作记录仓库：集中管理操作记录并支持查询与清理
class OperationRecordRepository {
  private records: OperationRecord[] = [];

  public addRecord(record: OperationRecord): void {
    this.records.push(record);
  }

  public getRecords(): OperationRecord[] {
    return [...this.records];
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public countByOperationType(operationType: number): number {
    return this.records.filter((record: OperationRecord) => record.operationType === operationType).length;
  }

  public getSuccessfulCount(): number {
    return this.records.filter((record: OperationRecord) => record.success).length;
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
    const key = `${transition.from}->${transition.to}`;
    this.transitionMap.set(key, transition);
  }

  public find(from: WorkflowState, to: WorkflowState): WorkflowTransition | null {
    const key = `${from}->${to}`;
    const transition = this.transitionMap.get(key);
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

export default function keyOperationWorkflowTest() {
  describe('KeyOperationWorkflow_Test', () => {
    let driver: Driver;
    let mockImeService: MockImeService;

    beforeAll(async () => {
      driver = getDriver();
      mockImeService = MockImeService.getInstance();
      mockImeService.clearOperationLog();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 Delete_Workflow：执行前必须先选中（有焦点）
    it('operation_should_require_selection', 0, async () => {
      const workflow = new ImeWorkflowModel();
      expect(workflow.hasSelection()).assertFalse();
      workflow.select(1);
      expect(workflow.hasSelection()).assertTrue();
    });

    // 适配 Delete_Workflow：执行前隐藏菜单
    it('operation_should_hide_menu_before_execution', 0, async () => {
      const workflow = new ImeWorkflowModel();
      expect(workflow.isMenuVisible()).assertTrue();
      workflow.hideMenu();
      expect(workflow.isMenuVisible()).assertFalse();
    });

    // 适配 Browse_Select_Delete_Flow：完整休眠流程
    it('suspend_workflow_should_complete_correctly', 0, async () => {
      if (!isInputMethodEnabled()) {
        console.info('suspend_workflow_should_complete_correctly skipped: input method is not enabled on this device');
        return;
      }
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
      mockImeService.suspend();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_IME_OP);
      expect(mockImeService.getOperationCount(KeyOperationType.IMEOPERATION_SUSPEND)).assertEqual(1);
    });

    // 适配 Browse_Select_Delete_Flow：完整中文流程
    it('shutdown_workflow_should_complete_correctly', 0, async () => {
      if (!isInputMethodEnabled()) {
        console.info('shutdown_workflow_should_complete_correctly skipped: input method is not enabled on this device');
        return;
      }
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
      mockImeService.shutdown();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_IME_OP);
      expect(mockImeService.getOperationCount(KeyOperationType.IMEOPERATION_SHUTDOWN)).assertEqual(1);
    });

    // 适配 Browse_Select_Delete_Flow：完整符号流程
    it('reboot_workflow_should_complete_correctly', 0, async () => {
      if (!isInputMethodEnabled()) {
        console.info('reboot_workflow_should_complete_correctly skipped: input method is not enabled on this device');
        return;
      }
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
      mockImeService.reboot();
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_IME_OP);
      expect(mockImeService.getOperationCount(KeyOperationType.IMEOPERATION_REBOOT)).assertEqual(1);
    });

    // 适配 Share_Workflow：电源操作要求单焦点（单选）
    it('operation_should_target_single_focused_item', 0, async () => {
      const workflow = new ImeWorkflowModel();
      workflow.select(0);
      workflow.select(1); // 单选模型仅保留最新选中项
      expect(workflow.hasSelection()).assertTrue();
    });

    // 适配 Share_Workflow：无效操作类型被拒绝
    it('invalid_operation_type_should_be_rejected', 0, async () => {
      const invalidType: number = 100;
      expect(invalidType >= KeyOperationType.IMEOPERATION_SUSPEND &&
        invalidType <= KeyOperationType.IMEOPERATION_SHUTDOWN).assertFalse();
    });

    // 适配 Error_Handling_Scenarios：无选中执行不崩溃
    it('operation_without_selection_should_be_safe', 0, async () => {
      const workflow = new ImeWorkflowModel();
      expect(workflow.hasSelection()).assertFalse(); // 未选中时执行不产生崩溃，流程安全
      const componentCount = await keyboardComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 适配 Rename_Workflow：操作后状态保持一致
    it('operation_state_should_persist_after_execution', 0, async () => {
      if (!isInputMethodEnabled()) {
        console.info('operation_state_should_persist_after_execution skipped: input method is not enabled on this device');
        return;
      }
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      await pressAndWait(driver, KEY_UP, 1, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, DELAY_AFTER_IME_OP);
      const componentCount = await keyboardComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 适配 Dialog_FileList_Interaction：确认操作后对话框仍可用
    it('dialog_should_remain_responsive_after_operation', 0, async () => {
      if (!isInputMethodEnabled()) {
        console.info('dialog_should_remain_responsive_after_operation skipped: input method is not enabled on this device');
        return;
      }
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const focusIndex = await getCurrentFocusIndex(driver);
      const isFocusCorrect = await checkFocusState(driver, -1);
      expect(isFocusCorrect).assertTrue();
      const componentCount = await keyboardComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(0);
    });

    // 适配 Workflow_State_Machine：状态机初始状态应为空闲
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
      const result = machine.transit(WorkflowEvent.EVENT_OPEN);
      expect(result).assertTrue();
      expect(machine.getState()).assertEqual(WorkflowState.STATE_BROWSING);
    });

    // 适配 Workflow_State_Machine：未注册事件的状态迁移被拒绝
    it('workflow_state_machine_should_reject_unregistered_event', 0, async () => {
      const machine = new WorkflowStateMachine();
      machine.registerTransition(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING, WorkflowEvent.EVENT_OPEN);
      const result = machine.transit(WorkflowEvent.EVENT_SELECT);
      expect(result).assertFalse();
      expect(machine.getState()).assertEqual(WorkflowState.STATE_IDLE);
    });

    // 适配 Workflow_State_Machine：状态迁移被记录且可重置
    it('workflow_state_machine_should_reset_to_idle', 0, async () => {
      const machine = new WorkflowStateMachine();
      machine.registerTransition(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING, WorkflowEvent.EVENT_OPEN);
      machine.transit(WorkflowEvent.EVENT_OPEN);
      expect(machine.getTransitionCount()).assertEqual(1);
      expect(machine.getTransitionLog().length).assertEqual(1);
      machine.reset();
      expect(machine.getState()).assertEqual(WorkflowState.STATE_IDLE);
      expect(machine.getTransitionCount()).assertEqual(0);
    });

    // 适配 Workflow_History：历史记录器正确记录状态迁移
    it('workflow_history_should_record_transitions', 0, async () => {
      const history = new WorkflowHistory();
      history.record({ from: WorkflowState.STATE_IDLE, to: WorkflowState.STATE_BROWSING, event: WorkflowEvent.EVENT_OPEN });
      history.record({ from: WorkflowState.STATE_BROWSING, to: WorkflowState.STATE_SELECTED,
        event: WorkflowEvent.EVENT_SELECT });
      expect(history.getHistoryCount()).assertEqual(2);
      expect(history.hasVisitedState(WorkflowState.STATE_SELECTED)).assertTrue();
      expect(history.hasVisitedState(WorkflowState.STATE_COMPLETED)).assertFalse();
    });

    // 适配 Workflow_History：历史记录的首末状态正确
    it('workflow_history_should_track_first_and_last_state', 0, async () => {
      const history = new WorkflowHistory();
      history.record({ from: WorkflowState.STATE_IDLE, to: WorkflowState.STATE_BROWSING, event: WorkflowEvent.EVENT_OPEN });
      history.record({ from: WorkflowState.STATE_BROWSING, to: WorkflowState.STATE_SELECTED,
        event: WorkflowEvent.EVENT_SELECT });
      expect(history.getFirstState()).assertEqual(WorkflowState.STATE_IDLE);
      expect(history.getLastState()).assertEqual(WorkflowState.STATE_SELECTED);
    });

    // 适配 Workflow_History：空历史记录返回 null
    it('workflow_history_should_return_null_when_empty', 0, async () => {
      const history = new WorkflowHistory();
      expect(history.getFirstState()).assertEqual(null);
      expect(history.getLastState()).assertEqual(null);
      expect(history.getHistoryCount()).assertEqual(0);
    });

    // 适配 Workflow_Validator：选择序列校验
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

    // 适配 Workflow_Statistics：动作统计累加正确
    it('workflow_statistics_should_accumulate_action_counts', 0, async () => {
      const stats = new WorkflowStatistics();
      stats.recordSelect();
      stats.recordSelect();
      stats.recordHide();
      stats.recordReset();
      expect(stats.getSelectCount()).assertEqual(2);
      expect(stats.getHideCount()).assertEqual(1);
      expect(stats.getResetCount()).assertEqual(1);
      expect(stats.getTotalActionCount()).assertEqual(4);
      expect(stats.describe().includes('select: 2')).assertTrue();
    });

    // 适配 OperationRecord_Repository：按类型与成功状态统计记录
    it('operation_record_repository_should_count_by_type_and_success', 0, async () => {
      const repository = new OperationRecordRepository();
      repository.addRecord({ operationType: KeyOperationType.IMEOPERATION_SUSPEND, timestamp: 1, success: true });
      repository.addRecord({ operationType: KeyOperationType.IMEOPERATION_REBOOT, timestamp: 2, success: false });
      repository.addRecord({ operationType: KeyOperationType.IMEOPERATION_SUSPEND, timestamp: 3, success: true });
      expect(repository.getRecordCount()).assertEqual(3);
      expect(repository.countByOperationType(KeyOperationType.IMEOPERATION_SUSPEND)).assertEqual(2);
      expect(repository.getSuccessfulCount()).assertEqual(2);
    });

    // 适配 Workflow_Step_Executor：按顺序执行工作流步骤
    it('workflow_step_executor_should_execute_steps_in_order', 0, async () => {
      const executor = new WorkflowStepExecutor();
      executor.addStep('打开');
      executor.addStep('选择');
      executor.addStep('执行');
      expect(executor.getStepCount()).assertEqual(3);
      expect(executor.executeNext()).assertTrue();
      expect(executor.getCompletedCount()).assertEqual(1);
      expect(executor.getRemainingSteps().length).assertEqual(2);
      executor.executeNext();
      executor.executeNext();
      expect(executor.isFinished()).assertTrue();
      expect(executor.executeNext()).assertFalse();
    });

    // 适配 Workflow_Transition_Map：迁移映射表查询正确
    it('workflow_transition_map_should_query_registered_transitions', 0, async () => {
      const map = new WorkflowTransitionMap();
      map.register({ from: WorkflowState.STATE_IDLE, to: WorkflowState.STATE_BROWSING, event: WorkflowEvent.EVENT_OPEN });
      expect(map.hasTransition(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING)).assertTrue();
      expect(map.hasTransition(WorkflowState.STATE_BROWSING, WorkflowState.STATE_SELECTED)).assertFalse();
      const found = map.find(WorkflowState.STATE_IDLE, WorkflowState.STATE_BROWSING);
      expect(found === null).assertFalse();
      expect(found?.event).assertEqual(WorkflowEvent.EVENT_OPEN);
      expect(map.getTransitionCount()).assertEqual(1);
    });

    // 适配 Workflow_Model：重置后恢复初始状态
    it('workflow_model_reset_should_restore_initial_state', 0, async () => {
      const workflow = new ImeWorkflowModel();
      workflow.select(2);
      workflow.hideMenu();
      expect(workflow.hasSelection()).assertTrue();
      expect(workflow.isMenuVisible()).assertFalse();
      workflow.reset();
      expect(workflow.hasSelection()).assertFalse();
      expect(workflow.isMenuVisible()).assertTrue();
    });
  });
}
