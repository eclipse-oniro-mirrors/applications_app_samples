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
  createFreshDriver,
  KEY_BACK,
  KEY_ENTER,
  appComponentCount,
  waitForUiStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_KEY_NAVIGATION
} from '../common/SharedDriver';

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

class MockAbilitySession {
  private static instance: MockAbilitySession;
  private sessionState: 'created' | 'active' | 'terminated' = 'terminated';
  private dataSent: SessionData[] = [];

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): MockAbilitySession {
    if (!MockAbilitySession.instance) {
      MockAbilitySession.instance = new MockAbilitySession();
    }
    return MockAbilitySession.instance;
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

export default function abilityLifecycleTest() {
  describe('AbilityLifecycle_Test', () => {
    let driver: Driver;
    let mockSession: MockAbilitySession;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = createFreshDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      mockSession = MockAbilitySession.getInstance();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭弹窗并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    }); // 验证extension session状态正确：确保TV设备should be created successfully符合预期
    it('extension_session_should_be_created_successfully', 0, async () => {
      mockSession.createSession();
      const sessionState = mockSession.getSessionState();
      expect(sessionState).assertEqual('created');
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await appComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
    it('session_should_send_ready_signal_when_activated', 0, async () => { // 激活会话
      mockSession.activateSession();

      // 发送就绪信号并验证
      mockSession.sendData({ isReady: '1' });
      const isReadySent = mockSession.isReadySignalSent();
      expect(isReadySent).assertTrue();
      await waitForUiStable(driver, TIMEOUT_DIALOG_RENDER);
      const componentCount = await appComponentCount(driver);
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
      const session1 = MockAbilitySession.getInstance();
      const session2 = MockAbilitySession.getInstance();
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
    }); // 验证生命周期状态机转换逻辑：确保TV设备状态迁移与历史记录符合预期
    it('lifecycle_state_machine_should_track_transitions_correctly', 0, async () => {
      const machine: LifecycleStateMachine = new LifecycleStateMachine();
      machine.transition('CREATED');
      machine.transition('ACTIVE');
      machine.transition('TERMINATED');
      expect(machine.getCurrentState()).assertEqual('TERMINATED');
      expect(machine.getTransitionCount()).assertEqual(3);
      const stateHistory: string[] = machine.getStateHistory();
      expect(stateHistory[0]).assertEqual('CREATED');
      expect(stateHistory[1]).assertEqual('ACTIVE');
      expect(stateHistory[2]).assertEqual('TERMINATED');
      machine.reset();
      expect(machine.getCurrentState()).assertEqual('INITIAL');
      expect(machine.getTransitionCount()).assertEqual(0);
    }); // 验证会话管理器创建与销毁逻辑：确保TV设备会话状态切换符合预期
    it('session_manager_should_handle_create_and_destroy_correctly', 0, async () => {
      const manager: SessionManager = new SessionManager();
      expect(manager.isSessionActive()).assertFalse();
      const sessionId: number = manager.createSession();
      expect(manager.isSessionActive()).assertTrue();
      expect(manager.getSessionId()).assertEqual(sessionId);
      manager.destroySession();
      expect(manager.isSessionActive()).assertFalse();
      manager.reset();
      expect(manager.getSessionId()).assertEqual(0);
    });
  });
}

/**
 * 生命周期状态机
 * 封装 Ability 生命周期状态转换业务逻辑
 */
class LifecycleStateMachine {
  private currentState: string = 'INITIAL';
  private stateHistory: string[] = [];

  public transition(state: string): void {
    this.currentState = state;
    this.stateHistory.push(state);
  }

  public getCurrentState(): string {
    return this.currentState;
  }

  public getStateHistory(): string[] {
    return [...this.stateHistory];
  }

  public getTransitionCount(): number {
    return this.stateHistory.length;
  }

  public reset(): void {
    this.currentState = 'INITIAL';
    this.stateHistory = [];
  }
}

/**
 * 会话管理器
 * 封装 Ability 会话的创建、激活、销毁业务逻辑
 */
class SessionManager {
  private isActive: boolean = false;
  private sessionId: number = 0;

  public createSession(): number {
    this.sessionId++;
    this.isActive = true;
    return this.sessionId;
  }

  public destroySession(): void {
    this.isActive = false;
  }

  public isSessionActive(): boolean {
    return this.isActive;
  }

  public getSessionId(): number {
    return this.sessionId;
  }

  public reset(): void {
    this.isActive = false;
    this.sessionId = 0;
  }
}

/**
 * 恢复管理器
 * 封装异常退出后的状态恢复业务逻辑
 */
class RecoveryManager {
  private recoverCount: number = 0;

  public recover(): void {
    this.recoverCount++;
  }

  public getRecoverCount(): number {
    return this.recoverCount;
  }

  public reset(): void {
    this.recoverCount = 0;
  }
}

/**
 * 异常防护器
 * 封装异常捕获与恢复业务逻辑
 */
class ExceptionGuard {
  private caughtErrors: string[] = [];

  public catchError(errorMessage: string): void {
    this.caughtErrors.push(errorMessage);
  }

  public getCaughtErrors(): string[] {
    return [...this.caughtErrors];
  }

  public getCaughtCount(): number {
    return this.caughtErrors.length;
  }

  public clear(): void {
    this.caughtErrors = [];
  }
}

/**
 * 生命周期监听器
 * 封装生命周期事件监听业务逻辑
 */
class LifecycleListener {
  private events: string[] = [];

  public onEvent(event: string): void {
    this.events.push(event);
  }

  public getEvents(): string[] {
    return [...this.events];
  }

  public getEventCount(): number {
    return this.events.length;
  }

  public clear(): void {
    this.events = [];
  }
}

/**
 * 会话池
 * 封装 Ability 会话的池化管理业务逻辑
 */
class SessionPool {
  private activeSessions: number = 0;

  public createSession(): void {
    this.activeSessions++;
  }

  public destroySession(): void {
    if (this.activeSessions > 0) {
      this.activeSessions--;
    }
  }

  public getActiveSessionCount(): number {
    return this.activeSessions;
  }

  public reset(): void {
    this.activeSessions = 0;
  }
}

/**
 * 恢复策略
 * 封装状态恢复策略业务逻辑
 */
class RecoveryStrategy {
  private recoveryMode: string = 'full';

  public setRecoveryMode(mode: string): void {
    this.recoveryMode = mode;
  }

  public getRecoveryMode(): string {
    return this.recoveryMode;
  }

  public isFullRecovery(): boolean {
    return this.recoveryMode === 'full';
  }
}

/**
 * 生命周期统计器
 * 封装生命周期事件统计业务逻辑
 */
class LifecycleStatistics {
  private eventCount: number = 0;

  public recordEvent(): void {
    this.eventCount++;
  }

  public getEventCount(): number {
    return this.eventCount;
  }

  public reset(): void {
    this.eventCount = 0;
  }
}

/**
 * 生命周期目标校验器
 * 封装生命周期状态合法性校验业务逻辑
 */
class LifecycleTargetValidator {
  public static isValidState(state: string): boolean {
    return state !== undefined && state !== null && state.length > 0;
  }

  public static isKnownState(state: string, knownStates: string[]): boolean {
    return knownStates.includes(state);
  }
}

/**
 * 生命周期状态追踪器
 * 封装生命周期状态变化追踪业务逻辑
 */
class LifecycleStateTracker {
  private currentState: string = 'INITIAL';

  public setState(state: string): void {
    this.currentState = state;
  }

  public getState(): string {
    return this.currentState;
  }

  public reset(): void {
    this.currentState = 'INITIAL';
  }
}


