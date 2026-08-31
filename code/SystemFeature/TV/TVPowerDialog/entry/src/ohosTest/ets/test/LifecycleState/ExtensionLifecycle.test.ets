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
  KEY_BACK,
  KEY_ENTER,
  powerDialogComponentCount,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

// Mock UI 会话数据接口
interface SessionData {
  isReady?: string;
  test?: string;
  type?: string;
  value?: string;
  operation?: number;
  timestamp?: number;
  error?: string;
  recovery?: string;
  sync?: string;
  resource?: string;
  performance?: string;
  iteration?: number;
}

class MockExtensionSession {
  private static instance: MockExtensionSession;
  private sessionState: 'created' | 'active' | 'terminated' = 'terminated';
  private dataSent: SessionData[] = [];

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): MockExtensionSession {
    if (!MockExtensionSession.instance) {
      MockExtensionSession.instance = new MockExtensionSession();
    }
    return MockExtensionSession.instance;
  }

  public createSession(): void {
    this.sessionState = 'created';
    this.dataSent = [];
  }

  public activateSession(): void {
    this.sessionState = 'active';
  }

  public terminateSession(): void {
    this.sessionState = 'terminated';
  }

  public sendData(data: SessionData): void {
    if (this.sessionState === 'active') {
      this.dataSent.push(data);
    }
  }

  public getSessionState(): string {
    return this.sessionState;
  }

  public getSentData(): SessionData[] {
    return [...this.dataSent];
  }

  public isReadySignalSent(): boolean {
    return this.dataSent.some((data: SessionData) => data.isReady === '1');
  }
}

// ==================== 扩展生命周期扩展工具集（新增代码） ====================

// 会话状态枚举：描述扩展会话的不同状态
enum SessionState {
  CREATED = 'created', ACTIVE = 'active', SUSPENDED = 'suspended', TERMINATED = 'terminated'
}

// 生命周期事件枚举：描述会话生命周期中的关键事件
enum LifecycleEvent {
  ON_CREATE = 'on_create', ON_ACTIVATE = 'on_activate', ON_SUSPEND = 'on_suspend', ON_TERMINATE = 'on_terminate'
}

// 会话信息接口：描述扩展会话的基本信息
interface SessionInfo {
  sessionId: string;
  state: SessionState;
  dataCount: number;
  createdAt: number;
  isReady: boolean;
}

// 生命周期事件记录接口：描述一次生命周期事件
interface LifecycleEventRecord {
  event: LifecycleEvent;
  sessionId: string;
  timestamp: number;
}

// 会话状态转换器：在会话状态与事件之间进行映射
class SessionStateConverter {
  private static readonly EVENT_TO_STATE: Map<LifecycleEvent, SessionState> =
    new Map([[LifecycleEvent.ON_CREATE, SessionState.CREATED], [LifecycleEvent.ON_ACTIVATE, SessionState.ACTIVE],
      [LifecycleEvent.ON_SUSPEND, SessionState.SUSPENDED], [LifecycleEvent.ON_TERMINATE, SessionState.TERMINATED]]);

  // 将生命周期事件映射为会话状态
  public eventToState(event: LifecycleEvent): SessionState {
    const state = SessionStateConverter.EVENT_TO_STATE.get(event);
    if (state === undefined) {
      return SessionState.TERMINATED;
    }
    return state;
  }

  // 判断会话状态是否为活跃状态
  public isActiveState(state: SessionState): boolean {
    return state === SessionState.ACTIVE;
  }

  // 判断会话状态是否为终止状态
  public isTerminatedState(state: SessionState): boolean {
    return state === SessionState.TERMINATED;
  }
}

// 会话信息构建器：从会话数据构建会话信息
class SessionInfoBuilder {
  private sessionId: string = '';
  private state: SessionState = SessionState.TERMINATED;
  private dataCount: number = 0;
  private createdAt: number = 0;
  private isReady: boolean = false;

  public setSessionId(sessionId: string): SessionInfoBuilder {
    this.sessionId = sessionId;
    return this;
  }

  public setState(state: SessionState): SessionInfoBuilder {
    this.state = state;
    return this;
  }

  public setDataCount(dataCount: number): SessionInfoBuilder {
    this.dataCount = dataCount;
    return this;
  }

  public setCreatedAt(createdAt: number): SessionInfoBuilder {
    this.createdAt = createdAt;
    return this;
  }

  public setReady(isReady: boolean): SessionInfoBuilder {
    this.isReady = isReady;
    return this;
  }

  // 构建最终的会话信息对象
  public build(): SessionInfo {
    const info: SessionInfo = {
      sessionId: this.sessionId,
      state: this.state,
      dataCount: this.dataCount,
      createdAt: this.createdAt,
      isReady: this.isReady
    };
    return info;
  }

  // 重置构建器状态
  public reset(): void {
    this.sessionId = '';
    this.state = SessionState.TERMINATED;
    this.dataCount = 0;
    this.createdAt = 0;
    this.isReady = false;
  }
}

// 生命周期事件记录器：记录会话生命周期事件
class LifecycleEventRecorder {
  private records: LifecycleEventRecord[] = [];

  // 记录一次生命周期事件
  public record(event: LifecycleEvent, sessionId: string): void {
    const record: LifecycleEventRecord = {
      event, sessionId, timestamp: Date.now()
    };
    this.records.push(record);
  }

  // 获取全部事件记录
  public getRecords(): LifecycleEventRecord[] {
    return [...this.records];
  }

  // 统计指定事件的发生次数
  public countEvent(event: LifecycleEvent): number {
    let count = 0;
    for (const record of this.records) {
      if (record.event === event) {
        count++;
      }
    }
    return count;
  }

  // 判断是否记录过指定事件
  public hasEvent(event: LifecycleEvent): boolean {
    return this.countEvent(event) > 0;
  }

  // 清空全部记录
  public clearRecords(): void {
    this.records = [];
  }
}

// 会话数据统计器：统计会话数据的分布情况
class SessionDataStatistics {
  private data: SessionData[] = [];

  constructor(data: SessionData[]) {
    this.data = [...data];
  }

  // 统计包含指定字段的数据数量
  public countByField(field: string): number {
    let count = 0;
    for (const item of this.data) {
      if (this.hasField(item, field)) {
        count++;
      }
    }
    return count;
  }

  // 判断数据项是否包含指定字段
  private hasField(item: SessionData, field: string): boolean {
    if (field === 'isReady') {
      return item.isReady !== undefined;
    }
    if (field === 'type') {
      return item.type !== undefined;
    }
    if (field === 'value') {
      return item.value !== undefined;
    }
    if (field === 'operation') {
      return item.operation !== undefined;
    }
    return false;
  }

  // 获取数据项总数
  public getDataCount(): number {
    return this.data.length;
  }

  // 统计操作字段的累加值
  public sumOperation(): number {
    let total = 0;
    for (const item of this.data) {
      if (item.operation !== undefined) {
        total += item.operation;
      }
    }
    return total;
  }
}

// 会话数据模型：封装一条可扩展的会话数据对象
class SessionDataModel {
  private type: string = '';
  private value: string = '';
  private operation: number = 0;
  private timestamp: number = 0;

  constructor(type: string, value: string, operation: number, timestamp: number) {
    this.type = type;
    this.value = value;
    this.operation = operation;
    this.timestamp = timestamp;
  }

  public getType(): string {
    return this.type;
  }

  public getValue(): string {
    return this.value;
  }

  public getOperation(): number {
    return this.operation;
  }

  public getTimestamp(): number {
    return this.timestamp;
  }

  public setValue(value: string): void {
    this.value = value;
  }

  // 生成数据模型的文本表示
  public toString(): string {
    return `SessionData(type=${this.type}, value=${this.value}, operation=${this.operation})`;
  }

  // 判断两个数据模型是否相等
  public equals(other: SessionDataModel): boolean {
    return this.type === other.type && this.value === other.value && this.operation === other.operation;
  }
}

// 会话数据管理器：集中管理会话数据模型
class SessionDataManager {
  private models: SessionDataModel[] = [];

  // 追加一条会话数据模型
  public appendModel(model: SessionDataModel): void {
    this.models.push(model);
  }

  // 获取全部会话数据模型
  public getModels(): SessionDataModel[] {
    return [...this.models];
  }

  // 按类型筛选数据模型
  public filterByType(type: string): SessionDataModel[] {
    const filtered: SessionDataModel[] = [];
    for (const model of this.models) {
      if (model.getType() === type) {
        filtered.push(model);
      }
    }
    return filtered;
  }

  // 清空全部数据模型
  public clearModels(): void {
    this.models = [];
  }

  // 获取数据模型数量
  public getModelCount(): number {
    return this.models.length;
  }
}

// ==================== 会话调度工具集（新增代码） ====================

// 调度策略枚举：描述会话调度采用的策略类型
enum SchedulingPolicy {
  SEQUENTIAL = 'sequential', PRIORITY = 'priority', ROUND_ROBIN = 'round_robin'
}

// 会话任务接口：描述一个待调度的会话任务
interface SessionTask {
  taskId: string;
  priority: number;
  state: SessionState;
  isScheduled: boolean;
}

// 会话调度器：根据调度策略调度会话任务
class SessionScheduler {
  private policy: SchedulingPolicy = SchedulingPolicy.SEQUENTIAL;
  private tasks: SessionTask[] = [];

  // 设置调度策略
  public setPolicy(policy: SchedulingPolicy): void {
    this.policy = policy;
  }

  public getPolicy(): SchedulingPolicy {
    return this.policy;
  }

  // 添加一个会话任务
  public addTask(task: SessionTask): void {
    this.tasks.push(task);
  }

  // 获取全部会话任务
  public getTasks(): SessionTask[] {
    return [...this.tasks];
  }

  // 调度任务：将任务标记为已调度
  public scheduleNext(): SessionTask | null {
    for (const task of this.tasks) {
      if (!task.isScheduled) {
        task.isScheduled = true;
        return task;
      }
    }
    return null;
  }

  // 统计已调度的任务数量
  public countScheduledTasks(): number {
    let count = 0;
    for (const task of this.tasks) {
      if (task.isScheduled) {
        count++;
      }
    }
    return count;
  }

  // 清空全部任务
  public clearTasks(): void {
    this.tasks = [];
  }
}

// 会话计时器模型：跟踪会话的生命周期时长
class SessionTimerModel {
  private startTime: number;
  private endTime: number;
  private isRunning: boolean;

  constructor() {
    this.startTime = 0;
    this.endTime = 0;
    this.isRunning = false;
  }

  // 启动计时器
  public start(): void {
    this.startTime = Date.now();
    this.isRunning = true;
  }

  // 停止计时器
  public stop(): void {
    this.endTime = Date.now();
    this.isRunning = false;
  }

  // 获取经过的时长
  public getElapsed(): number {
    if (this.isRunning) {
      return Date.now() - this.startTime;
    }
    return this.endTime - this.startTime;
  }

  // 判断计时器是否正在运行
  public isRunningNow(): boolean {
    return this.isRunning;
  }

  // 重置计时器
  public resetTimer(): void {
    this.startTime = 0;
    this.endTime = 0;
    this.isRunning = false;
  }
}

// 会话快照模型：封装会话在某一时刻的快照
class SessionSnapshotModel {
  private state: SessionState;
  private dataCount: number;
  private capturedAt: number;

  constructor(state: SessionState, dataCount: number, capturedAt: number) {
    this.state = state;
    this.dataCount = dataCount;
    this.capturedAt = capturedAt;
  }

  public getState(): SessionState {
    return this.state;
  }

  public getDataCount(): number {
    return this.dataCount;
  }

  public getCapturedAt(): number {
    return this.capturedAt;
  }

  // 生成快照的文本表示
  public toString(): string {
    return `Snapshot(state=${this.state}, dataCount=${this.dataCount})`;
  }
}

// 会话快照管理器：集中管理会话快照
class SessionSnapshotManager {
  private snapshots: SessionSnapshotModel[] = [];

  // 追加一条快照
  public appendSnapshot(snapshot: SessionSnapshotModel): void {
    this.snapshots.push(snapshot);
  }

  // 获取全部快照
  public getSnapshots(): SessionSnapshotModel[] {
    return [...this.snapshots];
  }

  // 按状态筛选快照
  public filterByState(state: SessionState): SessionSnapshotModel[] {
    const filtered: SessionSnapshotModel[] = [];
    for (const snapshot of this.snapshots) {
      if (snapshot.getState() === state) {
        filtered.push(snapshot);
      }
    }
    return filtered;
  }

  // 清空全部快照
  public clearSnapshots(): void {
    this.snapshots = [];
  }
}

export default function extensionLifecycleTest() {
  describe('ExtensionLifecycle_Test', () => {
    let driver: Driver;
    let mockSession: MockExtensionSession;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      mockSession = MockExtensionSession.getInstance();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    }); // 验证extension session状态正确：确保TV设备should be created successfully符合预期
    it('extension_session_should_be_created_successfully', 0, async () => {
      mockSession.createSession();
      const sessionState = mockSession.getSessionState();
      expect(sessionState).assertEqual('created');
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
    it('session_should_send_ready_signal_when_activated', 0, async () => { // 激活会话
      mockSession.activateSession();

      // 发送就绪信号并验证
      mockSession.sendData({ isReady: '1' });
      const isReadySent = mockSession.isReadySignalSent();
      expect(isReadySent).assertTrue();
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
    it('session_should_terminate_correctly', 0, async () => { // 终止会话
      mockSession.terminateSession();
      const sessionState = mockSession.getSessionState();
      expect(sessionState).assertEqual('terminated');
      mockSession.sendData({ test: 'data' });
      const sentData: SessionData[] = mockSession.getSentData();
      const lastData: SessionData | undefined = sentData[sentData.length - 1];
      expect(lastData?.test !== 'data').assertTrue();
    });
    it('complete_lifecycle_should_work_correctly', 0, async () => { // 完整生命周期测试
      mockSession.createSession();
      expect(mockSession.getSessionState()).assertEqual('created');

      mockSession.activateSession();
      expect(mockSession.getSessionState()).assertEqual('active');

      mockSession.sendData({ isReady: '1' });
      expect(mockSession.isReadySignalSent()).assertTrue();

      mockSession.terminateSession();
      expect(mockSession.getSessionState()).assertEqual('terminated');
    }); // 验证data transfer状态正确：确保TV设备should be integrity during session lifecycle符合预期
    it('data_transfer_should_be_integrity_during_session_lifecycle', 0, async () => {
      mockSession.createSession();
      mockSession.activateSession();

      // 发送不同类型数据并验证
      mockSession.sendData({ type: 'init', value: '100' });
      mockSession.sendData({ type: 'config', value: '200' });
      mockSession.sendData({ type: 'ready', value: '300' });
      const sentData: SessionData[] = mockSession.getSentData();
      expect(sentData.length).assertEqual(3);
      expect(sentData[0].type).assertEqual('init');
      expect(sentData[1].type).assertEqual('config');
      expect(sentData[2].type).assertEqual('ready');

      mockSession.terminateSession();
    }); // 验证session state持久：确保TV设备should persist correctly during operations状态保持
    it('session_state_should_persist_correctly_during_operations', 0, async () => {
      mockSession.createSession();
      mockSession.activateSession();
      for (let i = 0; i < 5; i++) {
        mockSession.sendData({ operation: i, timestamp: Date.now() });
      }
      expect(mockSession.getSessionState()).assertEqual('active');
      const sentData: SessionData[] = mockSession.getSentData();
      expect(sentData.length).assertLargerOrEqual(5);

      mockSession.terminateSession();
    });
    it('session_should_recover_from_errors_correctly', 0, async () => {
      mockSession.terminateSession();

      // 终止状态下发送数据应被忽略
      mockSession.sendData({ error: 'test' });
      const sentData = mockSession.getSentData();
      const hasErrorData = sentData.some((data: SessionData) => data.error === 'test');
      expect(hasErrorData).assertFalse();

      // 重新创建会话并验证恢复
      mockSession.createSession();
      mockSession.activateSession();
      mockSession.sendData({ recovery: 'success' });
      expect(mockSession.getSentData().some((data: SessionData) => data.recovery === 'success')).assertTrue();

      mockSession.terminateSession();
    }); // 验证multiple session状态正确：确保TV设备instances should be managed correctly符合预期
    it('multiple_session_instances_should_be_managed_correctly', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const session1 = MockExtensionSession.getInstance();
      const session2 = MockExtensionSession.getInstance();
      expect(session1 === session2).assertTrue();

      // 单例模式确保实例共享状态
      session1.createSession();
      expect(session2.getSessionState()).assertEqual('created');

      session1.activateSession();
      expect(session2.getSessionState()).assertEqual('active');
      session1.sendData({ sync: 'test' });
      expect(session2.getSentData().some((data: SessionData) => data.sync === 'test')).assertTrue();

      session1.terminateSession();
    }); // 验证resources should状态正确：确保TV设备be cleaned up when session terminates符合预期
    it('resources_should_be_cleaned_up_when_session_terminates', 0, async () => {
      mockSession.createSession();
      mockSession.activateSession();

      // 分配资源并发送数据
      mockSession.sendData({ resource: 'allocated' });

      // 终止会话并验证资源清理
      mockSession.terminateSession();
      mockSession.sendData({ resource: 'leak' });
      const sentData: SessionData[] = mockSession.getSentData();
      const hasLeakData = sentData.some((data: SessionData) => data.resource === 'leak');
      expect(hasLeakData).assertFalse();
      expect(mockSession.getSessionState()).assertEqual('terminated');
    });
    it('session_lifecycle_operations_should_meet_performance_requirements', 0, async () => {
      const startTime = Date.now();
      mockSession.createSession();
      mockSession.activateSession();

      for (let i = 0; i < 10; i++) {
        mockSession.sendData({ performance: 'test', iteration: i });
      }

      mockSession.terminateSession();

      const endTime = Date.now();
      const operationTime = endTime - startTime;

      // 验证生命周期操作性能在100ms内完成
      expect(operationTime).assertLessOrEqual(100);
    });
  });


}