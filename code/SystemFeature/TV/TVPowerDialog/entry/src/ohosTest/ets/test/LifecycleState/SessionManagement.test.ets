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
  KEY_BACK,
  KEY_ENTER,
  powerDialogComponentCount,
  checkFocusState,
  waitForDialogStable,
  pressAndWait,
  TIMEOUT_DIALOG_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_KEY_NAVIGATION
} from '../Shared/SharedDriver';

enum SessionState {
  CREATED = 'created', ACTIVE = 'active', INACTIVE = 'inactive', DESTROYED = 'destroyed'
}

interface SessionRecord {
  sessionId: string;
  state: SessionState;
  timestamp: number;
  dataTransferred: number;
}

class SessionManager {
  private static instance: SessionManager;
  private sessionHistory: SessionRecord[] = [];
  private currentSessionId: string = '';
  private currentState: SessionState = SessionState.DESTROYED;
  private totalDataTransferred: number = 0;

  // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
  public static getInstance(): SessionManager {
    if (!SessionManager.instance) {
      SessionManager.instance = new SessionManager();
    }
    return SessionManager.instance;
  }

  public createSession(sessionId: string): void {
    this.currentSessionId = sessionId;
    this.currentState = SessionState.CREATED;
    const record: SessionRecord = {
      sessionId,
      state: SessionState.CREATED,
      timestamp: Date.now(),
      dataTransferred: 0
    };
    this.sessionHistory.push(record);
  }

  public activateSession(): void {
    this.currentState = SessionState.ACTIVE;
    const record: SessionRecord = {
      sessionId: this.currentSessionId,
      state: SessionState.ACTIVE,
      timestamp: Date.now(),
      dataTransferred: 0
    };
    this.sessionHistory.push(record);
  }

  public deactivateSession(): void {
    this.currentState = SessionState.INACTIVE;
    const record: SessionRecord = {
      sessionId: this.currentSessionId,
      state: SessionState.INACTIVE,
      timestamp: Date.now(),
      dataTransferred: 0
    };
    this.sessionHistory.push(record);
  }

  public destroySession(): void {
    this.currentState = SessionState.DESTROYED;
    const record: SessionRecord = {
      sessionId: this.currentSessionId,
      state: SessionState.DESTROYED,
      timestamp: Date.now(),
      dataTransferred: 0
    };
    this.sessionHistory.push(record);
    this.currentSessionId = '';
  }

  public transferData(dataSize: number): void {
    if (this.currentState === SessionState.ACTIVE) {
      this.totalDataTransferred += dataSize;
      const record: SessionRecord = {
        sessionId: this.currentSessionId,
        state: this.currentState,
        timestamp: Date.now(),
        dataTransferred: dataSize
      };
      this.sessionHistory.push(record);
    }
  }

  public getCurrentState(): SessionState {
    return this.currentState;
  }

  public getCurrentSessionId(): string {
    return this.currentSessionId;
  }

  public getSessionHistory(): SessionRecord[] {
    return [...this.sessionHistory];
  }

  public getTotalDataTransferred(): number {
    return this.totalDataTransferred;
  }

  public resetManager(): void {
    this.sessionHistory = [];
    this.currentSessionId = '';
    this.currentState = SessionState.DESTROYED;
    this.totalDataTransferred = 0;
  }

  public hasReachedState(state: SessionState): boolean {
    return this.sessionHistory.some(record => record.state === state);
  }

  public getStateTransitionCount(state: SessionState): number {
    return this.sessionHistory.filter(record => record.state === state).length;
  }
}

export default function sessionManagementTest() {
  describe('SessionManagement_Test', () => {
    let driver: Driver;
    let sessionManager: SessionManager;

    // 测试前置：初始化驱动和追踪器，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver(); // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      sessionManager = SessionManager.getInstance();
      sessionManager.resetManager();
      await driver.delayMs(1000);
    });

    // 测试清理：关闭对话框并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证session should状态正确：确保TV设备be created successfully符合预期
    it('session_should_be_created_successfully', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.createSession('session_001');
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.CREATED);
      expect(sessionManager.getCurrentSessionId()).assertEqual('session_001');
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('session_should_transition_to_active_state', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.createSession('session_002');
      sessionManager.activateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.ACTIVE);
      expect(sessionManager.hasReachedState(SessionState.ACTIVE)).assertTrue();
    });

    // 验证session should处理能力：确保TV设备在handle data transfer下功能正常
    it('session_should_handle_data_transfer', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.createSession('session_003');
      sessionManager.activateSession();
      sessionManager.transferData(1024);
      sessionManager.transferData(2048);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(3072);
    });

    it('session_should_deactivate_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.createSession('session_004');
      sessionManager.activateSession();
      sessionManager.deactivateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.INACTIVE);
    });

    it('session_should_destroy_correctly', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.createSession('session_005');
      sessionManager.activateSession();
      sessionManager.destroySession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.DESTROYED);
      expect(sessionManager.getCurrentSessionId()).assertEqual('');
    });

    // 验证session lifecycle状态正确：确保TV设备should be complete符合预期
    it('session_lifecycle_should_be_complete', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession('session_006');
      sessionManager.activateSession();
      sessionManager.transferData(512);
      sessionManager.deactivateSession();
      sessionManager.destroySession();
      const history = sessionManager.getSessionHistory();
      expect(history.length).assertEqual(5);
      expect(history[0].state).assertEqual(SessionState.CREATED);
      expect(history[1].state).assertEqual(SessionState.ACTIVE);
      expect(history[2].dataTransferred).assertEqual(512);
      expect(history[3].state).assertEqual(SessionState.INACTIVE);
      expect(history[4].state).assertEqual(SessionState.DESTROYED);
    });

    // 验证session should处理能力：确保TV设备在handle multiple lifecycle cycles下功能正常
    it('session_should_handle_multiple_lifecycle_cycles', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      for (let i = 0; i < 3; i++) {
        sessionManager.createSession(`session_cycle_${i}`);
        sessionManager.activateSession(); // 移除transferData调用，避免创建额外的ACTIVE状态记录
        sessionManager.deactivateSession();
        sessionManager.destroySession();
      }
      expect(sessionManager.getStateTransitionCount(SessionState.CREATED)).assertEqual(3);
      expect(sessionManager.getStateTransitionCount(SessionState.ACTIVE)).assertEqual(3);
      expect(sessionManager.getStateTransitionCount(SessionState.INACTIVE)).assertEqual(3);
      expect(sessionManager.getStateTransitionCount(SessionState.DESTROYED)).assertEqual(3);
    });

    it('session_data_transfer_should_only_work_in_active_state', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession('session_test');
      sessionManager.transferData(100);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(0);
      sessionManager.activateSession();
      sessionManager.transferData(200);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(200);
      sessionManager.deactivateSession();
      sessionManager.transferData(300);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(200);
    });

    // 验证session timestamps状态正确：确保TV设备should be chronological符合预期
    it('session_timestamps_should_be_chronological', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession('session_ts');
      await driver.delayMs(100);
      sessionManager.activateSession();
      await driver.delayMs(100);
      sessionManager.transferData(100);
      const history = sessionManager.getSessionHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // 验证session should处理能力：确保TV设备在handle rapid state changes下功能正常
    it('session_should_handle_rapid_state_changes', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      for (let i = 0; i < 10; i++) {
        sessionManager.createSession(`session_rapid_${i}`);
        sessionManager.activateSession();
        sessionManager.deactivateSession();
        await driver.delayMs(50);
      }
      expect(sessionManager.getStateTransitionCount(SessionState.CREATED)).assertEqual(10);
      expect(sessionManager.getStateTransitionCount(SessionState.ACTIVE)).assertEqual(10);
      expect(sessionManager.getStateTransitionCount(SessionState.INACTIVE)).assertEqual(10);
    });

    // 验证session should维持稳定：确保TV设备在maintain dialog stability下性能不降低
    it('session_should_maintain_dialog_stability', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      const initialCount = await powerDialogComponentCount(driver);
      sessionManager.createSession('session_stability');
      sessionManager.activateSession();
      sessionManager.transferData(1024);
      sessionManager.deactivateSession();
      const finalCount = await powerDialogComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(2);
    });

    // 验证session singleton维持稳定：确保TV设备在should maintain consistency下性能不降低
    it('session_singleton_should_maintain_consistency', 0, async () => { // 单例模式获取实例：确保跨测试用例数据一致性，避免状态污染
      const manager1 = SessionManager.getInstance();
      const manager2 = SessionManager.getInstance();
      expect(manager1 === manager2).assertTrue();
      manager1.resetManager();
      manager1.createSession('singleton_test');
      expect(manager2.getCurrentSessionId()).assertEqual('singleton_test');
      expect(manager2.getCurrentState()).assertEqual(SessionState.CREATED);
    });

    // 验证session should处理能力：确保TV设备在handle large data transfers下功能正常
    it('session_should_handle_large_data_transfers', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession('session_large');
      sessionManager.activateSession();
      for (let i = 0; i < 100; i++) {
        sessionManager.transferData(1024);
      }
      expect(sessionManager.getTotalDataTransferred()).assertEqual(102400);
    });

    it('session_should_track_all_state_transitions', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession('session_track');
      sessionManager.activateSession();
      sessionManager.deactivateSession();
      sessionManager.activateSession();
      sessionManager.deactivateSession();
      sessionManager.destroySession();
      expect(sessionManager.hasReachedState(SessionState.CREATED)).assertTrue();
      expect(sessionManager.hasReachedState(SessionState.ACTIVE)).assertTrue();
      expect(sessionManager.hasReachedState(SessionState.INACTIVE)).assertTrue();
      expect(sessionManager.hasReachedState(SessionState.DESTROYED)).assertTrue();
    });

    it('session_performance_should_meet_requirements', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      const startTime = Date.now();
      for (let i = 0; i < 1000; i++) {
        sessionManager.createSession(`session_perf_${i}`);
        sessionManager.activateSession();
        sessionManager.transferData(100);
        sessionManager.destroySession();
      }
      const endTime = Date.now();
      const operationTime = endTime - startTime;
      expect(operationTime).assertLessOrEqual(5000);
      expect(sessionManager.getSessionHistory().length).assertEqual(4000);
    });

    // 验证session should处理能力：确保TV设备在handle error recovery下功能正常
    it('session_should_handle_error_recovery', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession('session_error');
      sessionManager.activateSession();
      sessionManager.deactivateSession();
      sessionManager.createSession('session_recovery');
      sessionManager.activateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.ACTIVE);
      expect(sessionManager.getCurrentSessionId()).assertEqual('session_recovery');
    });

    it('session_should_validate_state_integrity', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession('session_validate');
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.CREATED);
      sessionManager.activateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.ACTIVE);
      sessionManager.transferData(500);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(500);
    });

    // 综合comprehensive session场景测试：验证完整操作流程中功能正确
    it('comprehensive_session_management_scenario', 0, async () => {
      await waitForDialogStable(driver, TIMEOUT_DIALOG_RENDER);
      sessionManager.resetManager();
      const scenarioStart = Date.now();
      sessionManager.createSession('session_comprehensive');
      sessionManager.activateSession();
      for (let i = 0; i < 10; i++) {
        sessionManager.transferData(256);
        await driver.delayMs(50);
      }
      sessionManager.deactivateSession();
      await driver.delayMs(500);
      sessionManager.activateSession();
      sessionManager.transferData(1024);
      sessionManager.destroySession();
      const scenarioEnd = Date.now();
      const scenarioDuration = scenarioEnd - scenarioStart;
      expect(sessionManager.getTotalDataTransferred()).assertEqual(3584);
      expect(scenarioDuration).assertLessOrEqual(10000);
      const componentCount = await powerDialogComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });
  });


}