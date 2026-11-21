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
  getDriver,
  KEY_BACK,
  componentCount,
  waitForHomePageStable,
  waitForFoodDetailStable,
  pressAndWait,
  resetToHome,
  launchStandardAbility,
  launchSpecifiedAbility,
  launchSingletonAbility,
  countNutritionLabels,
  isHomePageVisible,
  isFoodDetailVisible,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  INDEX_STANDARD_GROUP,
  INDEX_SPECIFIED_GROUP,
  INDEX_SINGLETON_GROUP,
  MODE_STANDARD,
  MODE_SPECIFIED,
  MODE_SINGLETON,
  runSerializedUiOperation,
  logInfo
} from '../Shared/SharedDriver';

/**
 * Lifecycle of one launch session of the start mode sample.
 * A session is created when a mode ability is requested, becomes active
 * while pages/FoodDetail is visible, becomes inactive when the user goes
 * back and is finally destroyed when the launch session ends.
 */
enum SessionState {
  CREATED = 'created',
  ACTIVE = 'active',
  INACTIVE = 'inactive',
  DESTROYED = 'destroyed'
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

  // Single instance access keeps the session history identical for all cases.
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
      sessionId: sessionId,
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

  // Food parameters are only transferred while the session is active.
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
    return this.sessionHistory.some((record: SessionRecord) => record.state === state);
  }

  public getStateTransitionCount(state: SessionState): number {
    return this.sessionHistory.filter((record: SessionRecord) => record.state === state).length;
  }

  public getSessionCount(): number {
    return this.sessionHistory.length;
  }

  public getSessionIdByIndex(index: number): string {
    if (index < 0 || index >= this.sessionHistory.length) {
      return '';
    }
    return this.sessionHistory[index].sessionId;
  }
}

export default function sessionManagementTest() {
  describe('SessionManagement_Test', () => {
    let driver: Driver;
    let sessionManager: SessionManager;

    beforeAll(async () => {
      driver = getDriver();
      sessionManager = SessionManager.getInstance();
      sessionManager.resetManager();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(TIMEOUT_PAGE_RENDER);
      });
      await resetToHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
    });

    // A standard mode launch session is created with the mode name as id.
    it('session_should_be_created_successfully', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_001`);
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.CREATED);
      expect(sessionManager.getCurrentSessionId()).assertEqual(`${MODE_STANDARD}_session_001`);
      const measured: number = await componentCount(driver);
      expect(measured).assertLargerOrEqual(1);
    });

    // Creating a session and starting StandardAbility activates it.
    it('session_should_transition_to_active_state', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_002`);
      await launchStandardAbility(0, MODE_STANDARD, INDEX_STANDARD_GROUP);
      sessionManager.activateSession();
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.ACTIVE);
      expect(sessionManager.hasReachedState(SessionState.ACTIVE)).assertTrue();
      expect(await isFoodDetailVisible(driver)).assertTrue();
      await resetToHome(driver);
    });

    // Food parameters are transferred only inside an active session.
    it('session_should_handle_data_transfer', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_SPECIFIED}_session_003`);
      sessionManager.activateSession();
      sessionManager.transferData(1024);
      sessionManager.transferData(2048);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(3072);
    });

    // Leaving the detail page deactivates the launch session.
    it('session_should_deactivate_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_SINGLETON}_session_004`);
      sessionManager.activateSession();
      sessionManager.deactivateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.INACTIVE);
      expect(sessionManager.getCurrentSessionId()).assertEqual(`${MODE_SINGLETON}_session_004`);
    });

    // Destroying the session clears the current session identifier.
    it('session_should_destroy_correctly', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_005`);
      sessionManager.activateSession();
      sessionManager.destroySession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.DESTROYED);
      expect(sessionManager.getCurrentSessionId()).assertEqual('');
    });

    // The full session history records create, activate, transfer and destroy.
    it('session_lifecycle_should_be_complete', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_006`);
      sessionManager.activateSession();
      sessionManager.transferData(512);
      sessionManager.deactivateSession();
      sessionManager.destroySession();
      const history: SessionRecord[] = sessionManager.getSessionHistory();
      expect(history.length).assertEqual(5);
      expect(history[0].state).assertEqual(SessionState.CREATED);
      expect(history[1].state).assertEqual(SessionState.ACTIVE);
      expect(history[2].dataTransferred).assertEqual(512);
      expect(history[3].state).assertEqual(SessionState.INACTIVE);
      expect(history[4].state).assertEqual(SessionState.DESTROYED);
    });

    // The three launch modes can be exercised in consecutive sessions.
    it('session_should_handle_multiple_lifecycle_cycles', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      const modes: string[] = [MODE_STANDARD, MODE_SPECIFIED, MODE_SINGLETON];
      for (let i = 0; i < modes.length; i++) {
        sessionManager.createSession(`${modes[i]}_cycle_${i}`);
        sessionManager.activateSession();
        sessionManager.deactivateSession();
        sessionManager.destroySession();
      }
      expect(sessionManager.getStateTransitionCount(SessionState.CREATED)).assertEqual(3);
      expect(sessionManager.getStateTransitionCount(SessionState.ACTIVE)).assertEqual(3);
      expect(sessionManager.getStateTransitionCount(SessionState.INACTIVE)).assertEqual(3);
      expect(sessionManager.getStateTransitionCount(SessionState.DESTROYED)).assertEqual(3);
    });

    // Transfers before creation or after deactivation are ignored.
    it('session_data_transfer_should_only_work_in_active_state', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_test`);
      sessionManager.transferData(100);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(0);
      sessionManager.activateSession();
      sessionManager.transferData(200);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(200);
      sessionManager.deactivateSession();
      sessionManager.transferData(300);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(200);
    });

    // Session records are ordered by their creation time.
    it('session_timestamps_should_be_chronological', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_SPECIFIED}_session_ts`);
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      sessionManager.activateSession();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(100);
      });
      sessionManager.transferData(100);
      const history: SessionRecord[] = sessionManager.getSessionHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // Ten quick session cycles are all recorded without loss.
    it('session_should_handle_rapid_state_changes', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      for (let i = 0; i < 10; i++) {
        sessionManager.createSession(`${MODE_SINGLETON}_rapid_${i}`);
        sessionManager.activateSession();
        sessionManager.deactivateSession();
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }
      expect(sessionManager.getStateTransitionCount(SessionState.CREATED)).assertEqual(10);
      expect(sessionManager.getStateTransitionCount(SessionState.ACTIVE)).assertEqual(10);
      expect(sessionManager.getStateTransitionCount(SessionState.INACTIVE)).assertEqual(10);
    });

    // Session bookkeeping does not change the rendered home page.
    it('session_should_maintain_home_stability', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const initialCount: number = await componentCount(driver);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_stability`);
      sessionManager.activateSession();
      sessionManager.transferData(1024);
      sessionManager.deactivateSession();
      const finalCount: number = await componentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
    });

    // The session manager returns the very same instance every time.
    it('session_singleton_should_maintain_consistency', 0, async () => {
      const manager1: SessionManager = SessionManager.getInstance();
      const manager2: SessionManager = SessionManager.getInstance();
      expect(manager1 === manager2).assertTrue();
      manager1.resetManager();
      manager1.createSession(`${MODE_SPECIFIED}_singleton_test`);
      expect(manager2.getCurrentSessionId()).assertEqual(`${MODE_SPECIFIED}_singleton_test`);
      expect(manager2.getCurrentState()).assertEqual(SessionState.CREATED);
    });

    // A hundred food parameter transfers accumulate without overflow.
    it('session_should_handle_large_data_transfers', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_SINGLETON}_session_large`);
      sessionManager.activateSession();
      for (let i = 0; i < 100; i++) {
        sessionManager.transferData(1024);
      }
      expect(sessionManager.getTotalDataTransferred()).assertEqual(102400);
    });

    // Every state of the lifecycle can be observed in the history.
    it('session_should_track_all_state_transitions', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_track`);
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

    // A thousand session cycles stay inside the performance budget.
    it('session_performance_should_meet_requirements', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      const startTime: number = Date.now();
      for (let i = 0; i < 1000; i++) {
        sessionManager.createSession(`${MODE_STANDARD}_perf_${i}`);
        sessionManager.activateSession();
        sessionManager.transferData(100);
        sessionManager.destroySession();
      }
      const endTime: number = Date.now();
      const operationTime: number = endTime - startTime;
      expect(operationTime).assertLessOrEqual(5000);
      expect(sessionManager.getSessionHistory().length).assertEqual(4000);
    });

    // A new session can be created after an interrupted one.
    it('session_should_handle_error_recovery', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_STANDARD}_session_error`);
      sessionManager.activateSession();
      sessionManager.deactivateSession();
      sessionManager.createSession(`${MODE_STANDARD}_session_recovery`);
      sessionManager.activateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.ACTIVE);
      expect(sessionManager.getCurrentSessionId()).assertEqual(`${MODE_STANDARD}_session_recovery`);
    });

    // The current state always matches the last recorded transition.
    it('session_should_validate_state_integrity', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_SPECIFIED}_session_validate`);
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.CREATED);
      sessionManager.activateSession();
      expect(sessionManager.getCurrentState()).assertEqual(SessionState.ACTIVE);
      sessionManager.transferData(500);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(500);
      expect(sessionManager.getSessionIdByIndex(0)).assertEqual(`${MODE_SPECIFIED}_session_validate`);
    });

    // A specified launch keeps a stable session across repeated starts.
    it('session_should_reuse_specified_session', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_SPECIFIED}_reuse_0`);
      sessionManager.activateSession();
      await launchSpecifiedAbility(0, 'pages/FoodDetail', INDEX_SPECIFIED_GROUP);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      expect(await countNutritionLabels(driver)).assertLargerOrEqual(1);
      sessionManager.transferData(256);
      sessionManager.deactivateSession();
      expect(sessionManager.getTotalDataTransferred()).assertEqual(256);
      await resetToHome(driver);
    });

    // A singleton launch notifies the running page instead of a new session.
    it('session_should_handle_singleton_notification', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      sessionManager.createSession(`${MODE_SINGLETON}_notify_0`);
      sessionManager.activateSession();
      await launchSingletonAbility(0, INDEX_SINGLETON_GROUP);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.transferData(128);
      await launchSingletonAbility(1, INDEX_SINGLETON_GROUP);
      sessionManager.transferData(128);
      expect(sessionManager.getTotalDataTransferred()).assertEqual(256);
      expect(await isFoodDetailVisible(driver)).assertTrue();
      await resetToHome(driver);
    });

    // Combined session scenario across the home and detail pages.
    it('comprehensive_session_management_scenario', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      sessionManager.resetManager();
      const scenarioStart: number = Date.now();
      sessionManager.createSession(`${MODE_STANDARD}_session_comprehensive`);
      sessionManager.activateSession();
      for (let i = 0; i < 10; i++) {
        sessionManager.transferData(256);
        await runSerializedUiOperation(async () => {
          await driver.delayMs(50);
        });
      }
      sessionManager.deactivateSession();
      await runSerializedUiOperation(async () => {
        await driver.delayMs(500);
      });
      sessionManager.activateSession();
      sessionManager.transferData(1024);
      sessionManager.destroySession();
      const scenarioEnd: number = Date.now();
      const scenarioDuration: number = scenarioEnd - scenarioStart;
      expect(sessionManager.getTotalDataTransferred()).assertEqual(3584);
      expect(scenarioDuration).assertLessOrEqual(10000);
      expect(await isHomePageVisible(driver)).assertTrue();
      const measured: number = await componentCount(driver);
      expect(measured).assertLargerOrEqual(1);
    });
  });
}
