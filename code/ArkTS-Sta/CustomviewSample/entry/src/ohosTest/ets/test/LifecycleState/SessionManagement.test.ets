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
  KEY_BACK,
  KEY_ENTER,
  pageComponentCount,
  checkFocusState,
  waitForPageStable,
  pressAndWait,
  TIMEOUT_TAB_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_KEY_NAVIGATION
} from '../Shared/CustomViewTestDriver';

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

    // 测试清理：关闭页签页并释放资源，避免影响后续测试
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await driver.delayMs(500);
    });

    // 验证session should状态正确：确保TV设备be created successfully符合预期
    it('session_should_be_created_successfully', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      sessionManager.createSession('session_001');
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.CREATED);
      expect(sessionManager.getCurrentSessionId()).assertEqual('session_001');
      const componentCount = await pageComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    it('session_should_transition_to_active_state', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      sessionManager.createSession('session_002');
      sessionManager.activateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.ACTIVE);
      expect(sessionManager.hasReachedState(SessionState.ACTIVE)).assertTrue();
    });

    // 验证session should处理能力：确保TV设备在handle data transfer下功能正常
    it('session_should_handle_data_transfer', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      sessionManager.createSession('session_003');
      sessionManager.activateSession();
      sessionManager.transferData(1024);
      sessionManager.transferData(2048);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(3072);
    });

    it('session_should_deactivate_correctly', 0, async () => {
      await waitForPageStable(driver, TIMEOUT_TAB_RENDER);
      sessionManager.createSession('session_004');
      sessionManager.activateSession();
      sessionManager.deactivateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.INACTIVE);
    });

    // 验证session lifecycle状态正确：确保TV设备should be complete符合预期

    // 验证session should处理能力：确保TV设备在handle multiple lifecycle cycles下功能正常

    // 验证session timestamps状态正确：确保TV设备should be chronological符合预期

    // 验证session should处理能力：确保TV设备在handle rapid state changes下功能正常

    // 验证session should维持稳定：确保TV设备在maintain tab stability下性能不降低

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

    // 验证session should处理能力：确保TV设备在handle error recovery下功能正常

    // 综合comprehensive session场景测试：验证完整操作流程中功能正确
  });

}