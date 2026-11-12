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
import { Log } from 'library';

const TAG: string = 'MiracastSessionValidationSuite';

// CastSession 生命周期状态
enum SessionState {
  CREATED = 'created', ACTIVE = 'active', SUSPENDED = 'suspended', CLOSED = 'closed'
}

// 会话生命周期事件
enum SessionEvent {
  CREATE = 'create', ACTIVATE = 'activate', SUSPEND = 'suspend', RESUME = 'resume', CLOSE = 'close'
}

// 会话数据快照：players / screen / listeners 三类不变量的载体
interface SessionData {
  sessionId: string;
  deviceId: string;
  state: SessionState;
  players: number;
  screenBound: boolean;
  listeners: number;
}

// 模拟 CastSession：维护 players、screen 与 listeners 的三方不变量
class MockCastSession {
  public static readonly MAX_PLAYERS: number = 9;
  private sessionId: string;
  private deviceId: string;
  private state: SessionState = SessionState.CREATED;
  private players: number = 0;
  private screenBound: boolean = false;
  private listeners: number = 0;

  constructor(sessionId: string, deviceId: string) {
    this.sessionId = sessionId;
    this.deviceId = deviceId;
  }

  public activate(): boolean {
    if (this.state !== SessionState.CREATED && this.state !== SessionState.SUSPENDED) {
      return false;
    }
    this.state = SessionState.ACTIVE;
    return true;
  }

  public suspend(): boolean {
    if (this.state !== SessionState.ACTIVE) {
      return false;
    }
    this.state = SessionState.SUSPENDED;
    return true;
  }

  public resume(): boolean {
    if (this.state !== SessionState.SUSPENDED) {
      return false;
    }
    this.state = SessionState.ACTIVE;
    return true;
  }

  public close(): boolean {
    if (this.state === SessionState.CLOSED) {
      return false;
    }
    this.state = SessionState.CLOSED;
    this.players = 0;
    this.screenBound = false;
    return true;
  }

  public addPlayer(): boolean {
    if (this.state !== SessionState.ACTIVE && this.state !== SessionState.SUSPENDED) {
      return false;
    }
    if (this.players >= MockCastSession.MAX_PLAYERS) {
      return false;
    }
    this.players++;
    return true;
  }

  public removePlayer(): boolean {
    if (this.players <= 0) {
      return false;
    }
    this.players--;
    return true;
  }

  public bindScreen(): boolean {
    if (this.state !== SessionState.ACTIVE) {
      return false;
    }
    if (this.screenBound) {
      return false;
    }
    this.screenBound = true;
    return true;
  }

  public unbindScreen(): boolean {
    if (!this.screenBound) {
      return false;
    }
    this.screenBound = false;
    return true;
  }

  public addListener(): boolean {
    if (this.state === SessionState.CLOSED) {
      return false;
    }
    if (this.listeners >= 4) {
      return false;
    }
    this.listeners++;
    return true;
  }

  public removeListener(): boolean {
    if (this.listeners <= 0) {
      return false;
    }
    this.listeners--;
    return true;
  }

  public getState(): SessionState {
    return this.state;
  }

  public getSessionId(): string {
    return this.sessionId;
  }

  public getDeviceId(): string {
    return this.deviceId;
  }

  public getPlayerCount(): number {
    return this.players;
  }

  public isScreenBound(): boolean {
    return this.screenBound;
  }

  public getListenerCount(): number {
    return this.listeners;
  }

  public isClosed(): boolean {
    return this.state === SessionState.CLOSED;
  }

  public toData(): SessionData {
    const data: SessionData = {
      sessionId: this.sessionId,
      deviceId: this.deviceId,
      state: this.state,
      players: this.players,
      screenBound: this.screenBound,
      listeners: this.listeners
    };
    return data;
  }
}

// 会话状态机：集中判定生命周期迁移的合法性
class SessionStateMachine {
  public canTransition(from: SessionState, event: SessionEvent): boolean {
    if (event === SessionEvent.CLOSE) {
      return from !== SessionState.CLOSED;
    }
    if (from === SessionState.CLOSED) {
      return false;
    }
    if (event === SessionEvent.ACTIVATE) {
      return from === SessionState.CREATED || from === SessionState.SUSPENDED;
    }
    if (event === SessionEvent.SUSPEND) {
      return from === SessionState.ACTIVE;
    }
    if (event === SessionEvent.RESUME) {
      return from === SessionState.SUSPENDED;
    }
    return event === SessionEvent.CREATE && from === SessionState.CREATED;
  }

  public apply(from: SessionState, event: SessionEvent): SessionState {
    if (!this.canTransition(from, event)) {
      return from;
    }
    if (event === SessionEvent.ACTIVATE || event === SessionEvent.RESUME) {
      return SessionState.ACTIVE;
    }
    if (event === SessionEvent.SUSPEND) {
      return SessionState.SUSPENDED;
    }
    if (event === SessionEvent.CLOSE) {
      return SessionState.CLOSED;
    }
    return SessionState.CREATED;
  }

  public isTerminal(state: SessionState): boolean {
    return state === SessionState.CLOSED;
  }

  public isUsable(state: SessionState): boolean {
    return state === SessionState.ACTIVE || state === SessionState.SUSPENDED;
  }
}

// 会话管理器：维护多会话的注册表与容量上限
class SessionManager {
  public static readonly MAX_SESSIONS: number = 4;
  private sessions: MockCastSession[] = [];

  public create(sessionId: string, deviceId: string): MockCastSession | null {
    if (this.sessions.length >= SessionManager.MAX_SESSIONS) {
      return null;
    }
    if (this.findById(sessionId) !== null) {
      return null;
    }
    const session = new MockCastSession(sessionId, deviceId);
    this.sessions.push(session);
    return session;
  }

  public findById(sessionId: string): MockCastSession | null {
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].getSessionId() === sessionId) {
        return this.sessions[i];
      }
    }
    return null;
  }

  public closeById(sessionId: string): boolean {
    const session = this.findById(sessionId);
    if (session === null) {
      return false;
    }
    return session.close();
  }

  public size(): number {
    return this.sessions.length;
  }

  public getAll(): MockCastSession[] {
    return [...this.sessions];
  }

  public countActive(): number {
    let count: number = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].getState() === SessionState.ACTIVE) {
        count++;
      }
    }
    return count;
  }

  public removeClosed(): number {
    const kept: MockCastSession[] = [];
    let removed: number = 0;
    for (let i = 0; i < this.sessions.length; i++) {
      if (this.sessions[i].isClosed()) {
        removed++;
      } else {
        kept.push(this.sessions[i]);
      }
    }
    this.sessions = kept;
    return removed;
  }

  public clear(): void {
    this.sessions = [];
  }
}

// 不变量校验器：players / screen / listeners 必须满足的组合约束
class SessionInvariantValidator {
  public isPlayerCountValid(count: number): boolean {
    return count >= 0 && count <= MockCastSession.MAX_PLAYERS;
  }

  public isListenerCountValid(count: number): boolean {
    return count >= 0 && count <= 4;
  }

  public canBindScreen(state: SessionState, alreadyBound: boolean): boolean {
    return state === SessionState.ACTIVE && !alreadyBound;
  }

  public hasLeakedScreen(state: SessionState, screenBound: boolean): boolean {
    return state === SessionState.CLOSED && screenBound;
  }

  public hasLeakedPlayers(state: SessionState, players: number): boolean {
    return state === SessionState.CLOSED && players > 0;
  }

  public isConsistent(data: SessionData): boolean {
    if (!this.isPlayerCountValid(data.players)) {
      return false;
    }
    if (!this.isListenerCountValid(data.listeners)) {
      return false;
    }
    if (data.state === SessionState.CLOSED) {
      return data.players === 0 && !data.screenBound;
    }
    return true;
  }

  public countViolations(data: SessionData): number {
    let count: number = 0;
    if (!this.isPlayerCountValid(data.players)) {
      count++;
    }
    if (!this.isListenerCountValid(data.listeners)) {
      count++;
    }
    if (this.hasLeakedScreen(data.state, data.screenBound)) {
      count++;
    }
    if (this.hasLeakedPlayers(data.state, data.players)) {
      count++;
    }
    return count;
  }
}

export default function miracastSessionValidationSuite(): void {
  describe('MiracastSessionValidation_Suite', () => {

    beforeAll(async () => {
      Log.info(TAG, 'session validation suite started');
    });

    afterAll(async () => {
      Log.info(TAG, 'session validation suite finished');
    });

    // ===== 会话状态迁移 =====
    it('new_session_should_start_created', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      expect(session.getState()).assertEqual(SessionState.CREATED);
      expect(session.getSessionId()).assertEqual('cast-session-1');
      expect(session.getDeviceId()).assertEqual('dev-0001');
    });

    it('created_session_should_activate', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      expect(session.activate()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.ACTIVE);
    });

    it('active_session_should_suspend_and_resume', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      expect(session.suspend()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.SUSPENDED);
      expect(session.resume()).assertTrue();
      expect(session.getState()).assertEqual(SessionState.ACTIVE);
    });

    it('resume_without_suspend_should_fail', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      expect(session.resume()).assertFalse();
      expect(session.getState()).assertEqual(SessionState.ACTIVE);
    });

    it('closed_session_should_reject_add_player', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      session.close();
      expect(session.addPlayer()).assertFalse();
      expect(session.getPlayerCount()).assertEqual(0);
    });

    // ===== players 不变量 =====
    it('player_should_be_added_when_active', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      expect(session.addPlayer()).assertTrue();
      expect(session.getPlayerCount()).assertEqual(1);
    });

    it('player_count_should_be_capped_at_nine', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      for (let i = 0; i < 9; i++) {
        expect(session.addPlayer()).assertTrue();
      }
      expect(session.getPlayerCount()).assertEqual(9);
      expect(session.addPlayer()).assertFalse();
      expect(session.getPlayerCount()).assertEqual(9);
    });

    it('player_remove_should_shrink_count', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      session.addPlayer();
      session.addPlayer();
      expect(session.removePlayer()).assertTrue();
      expect(session.getPlayerCount()).assertEqual(1);
      expect(session.removePlayer()).assertTrue();
      expect(session.getPlayerCount()).assertEqual(0);
    });

    // ===== screen 不变量 =====
    it('screen_should_bind_when_active', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      expect(session.bindScreen()).assertTrue();
      expect(session.isScreenBound()).assertTrue();
      expect(session.unbindScreen()).assertTrue();
      expect(session.isScreenBound()).assertFalse();
      expect(session.unbindScreen()).assertFalse();
    });

    it('close_should_release_screen_and_players', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      session.addPlayer();
      session.bindScreen();
      session.close();
      expect(session.getPlayerCount()).assertEqual(0);
      expect(session.isScreenBound()).assertFalse();
      expect(session.isClosed()).assertTrue();
    });

    // ===== listeners 不变量 =====
    it('listener_should_be_added_up_to_limit', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      for (let i = 0; i < 4; i++) {
        expect(session.addListener()).assertTrue();
      }
      expect(session.getListenerCount()).assertEqual(4);
      expect(session.addListener()).assertFalse();
    });

    it('listener_should_be_removed', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.addListener();
      session.addListener();
      expect(session.removeListener()).assertTrue();
      expect(session.getListenerCount()).assertEqual(1);
      expect(session.removeListener()).assertTrue();
      expect(session.removeListener()).assertFalse();
      expect(session.getListenerCount()).assertEqual(0);
    });

    // ===== 状态机 =====
    it('state_machine_should_allow_lifecycle_path', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.canTransition(SessionState.CREATED, SessionEvent.ACTIVATE)).assertTrue();
      expect(machine.apply(SessionState.CREATED, SessionEvent.ACTIVATE)).assertEqual(SessionState.ACTIVE);
      expect(machine.apply(SessionState.ACTIVE, SessionEvent.SUSPEND)).assertEqual(SessionState.SUSPENDED);
      expect(machine.apply(SessionState.SUSPENDED, SessionEvent.RESUME)).assertEqual(SessionState.ACTIVE);
      expect(machine.apply(SessionState.ACTIVE, SessionEvent.CLOSE)).assertEqual(SessionState.CLOSED);
    });

    it('state_machine_should_reject_illegal_transitions', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.canTransition(SessionState.CREATED, SessionEvent.SUSPEND)).assertFalse();
      expect(machine.canTransition(SessionState.ACTIVE, SessionEvent.RESUME)).assertFalse();
      expect(machine.apply(SessionState.CREATED, SessionEvent.CLOSE)).assertEqual(SessionState.CLOSED);
    });

    it('state_machine_should_treat_closed_as_terminal', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.isTerminal(SessionState.CLOSED)).assertTrue();
      expect(machine.isTerminal(SessionState.ACTIVE)).assertFalse();
      expect(machine.canTransition(SessionState.CLOSED, SessionEvent.ACTIVATE)).assertFalse();
      expect(machine.canTransition(SessionState.CLOSED, SessionEvent.CLOSE)).assertFalse();
      expect(machine.isUsable(SessionState.ACTIVE)).assertTrue();
      expect(machine.isUsable(SessionState.CLOSED)).assertFalse();
    });

    // ===== 会话管理器 =====
    it('session_manager_should_create_session', 0, async () => {
      const manager = new SessionManager();
      const session = manager.create('cast-session-1', 'dev-0001');
      expect(session === null).assertFalse();
      expect(manager.size()).assertEqual(1);
      expect(manager.getAll().length).assertEqual(1);
      expect(manager.findById('cast-session-1') === null).assertFalse();
    });

    it('session_manager_should_cap_at_four_sessions', 0, async () => {
      const manager = new SessionManager();
      for (let i = 0; i < 4; i++) {
        expect(manager.create(`cast-session-${i}`, `dev-000${i}`) === null).assertFalse();
      }
      expect(manager.create('cast-session-9', 'dev-0009')).assertNull();
      expect(manager.size()).assertEqual(4);
    });

    it('session_manager_should_count_active_sessions', 0, async () => {
      const manager = new SessionManager();
      const first = manager.create('cast-session-1', 'dev-0001');
      manager.create('cast-session-2', 'dev-0002');
      if (first !== null) {
        first.activate();
      }
      expect(manager.countActive()).assertEqual(1);
    });

    it('session_manager_close_by_id_should_work', 0, async () => {
      const manager = new SessionManager();
      const session = manager.create('cast-session-1', 'dev-0001');
      if (session !== null) {
        session.activate();
      }
      expect(manager.closeById('cast-session-1')).assertTrue();
      expect(manager.closeById('cast-session-1')).assertFalse();
      expect(manager.closeById('ghost')).assertFalse();
    });

    it('session_manager_should_remove_closed_sessions', 0, async () => {
      const manager = new SessionManager();
      const first = manager.create('cast-session-1', 'dev-0001');
      manager.create('cast-session-2', 'dev-0002');
      if (first !== null) {
        first.close();
      }
      expect(manager.removeClosed()).assertEqual(1);
      expect(manager.size()).assertEqual(1);
      expect(manager.findById('cast-session-1')).assertNull();
      manager.clear();
      expect(manager.size()).assertEqual(0);
    });

    // ===== 不变量校验 =====
    it('invariant_validator_should_bound_player_count', 0, async () => {
      const validator = new SessionInvariantValidator();
      expect(validator.isPlayerCountValid(0)).assertTrue();
      expect(validator.isPlayerCountValid(9)).assertTrue();
      expect(validator.isPlayerCountValid(10)).assertFalse();
      expect(validator.isPlayerCountValid(-1)).assertFalse();
    });

    it('invariant_validator_should_gate_screen_binding', 0, async () => {
      const validator = new SessionInvariantValidator();
      expect(validator.canBindScreen(SessionState.ACTIVE, false)).assertTrue();
      expect(validator.canBindScreen(SessionState.ACTIVE, true)).assertFalse();
      expect(validator.canBindScreen(SessionState.SUSPENDED, false)).assertFalse();
    });

    it('invariant_validator_should_validate_session_data', 0, async () => {
      const validator = new SessionInvariantValidator();
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      session.addPlayer();
      session.bindScreen();
      expect(validator.isConsistent(session.toData())).assertTrue();
      expect(validator.countViolations(session.toData())).assertEqual(0);
    });

    // ===== 数据仓库 =====
    // ===== 统计 =====
    // ===== 就绪信号与 id 生成 =====
    it('session_to_data_should_snapshot_all_fields', 0, async () => {
      const session = new MockCastSession('cast-session-1', 'dev-0001');
      session.activate();
      session.addPlayer();
      session.bindScreen();
      session.addListener();
      const data = session.toData();
      expect(data.sessionId).assertEqual('cast-session-1');
      expect(data.players).assertEqual(1);
      expect(data.screenBound).assertTrue();
      expect(data.listeners).assertEqual(1);
    });

    it('state_machine_should_reject_resume_after_close', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.canTransition(SessionState.SUSPENDED, SessionEvent.RESUME)).assertTrue();
      expect(machine.canTransition(SessionState.CLOSED, SessionEvent.RESUME)).assertFalse();
      expect(machine.apply(SessionState.CLOSED, SessionEvent.RESUME)).assertEqual(SessionState.CLOSED);
    });
  });
}
