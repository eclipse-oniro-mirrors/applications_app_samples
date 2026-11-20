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
import { Driver } from '../Shared/MiracastDriver';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  serializedDelay,
  miracastComponentCount,
  waitForPageStable,
  isPlayerPageVisible,
  isIndexPageVisible,
  getPlayerTileCount,
  launchPlayerPage,
  triggerMiracastHome,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_SESSION_CREATE,
  DELAY_KEY_NAVIGATION,
  DELAY_AFTER_SESSION_OP,
  MAX_MIRROR_TILES
} from '../Shared/MiracastDriver';
import { Log } from 'library';

const TAG: string = 'SessionStateManagementSuite';

// ===== 领域模型（本地 Mock：投屏会话完整状态机 + 快照管理） =====

// 会话状态枚举：覆盖服务启动到会话释放的全部状态
enum SessionState {
  IDLE = 'idle',
  STARTING = 'starting',
  CREATED = 'created',
  CONNECTING = 'connecting',
  CONNECTED = 'connected',
  MIRRORING = 'mirroring',
  PAUSED = 'paused',
  MUTED = 'muted',
  RECONNECTING = 'reconnecting',
  STOPPING = 'stopping',
  STOPPED = 'stopped',
  FAILED = 'failed'
}

// 会话触发器枚举：驱动状态机迁移的外部动作
enum SessionTrigger {
  START_SERVICE = 'startService',
  CREATE_SESSION = 'createSession',
  CONNECT_DEVICE = 'connectDevice',
  BIND_SCREEN = 'bindScreen',
  START_PLAY = 'startPlay',
  PAUSE_PLAY = 'pausePlay',
  MUTE = 'mute',
  UNMUTE = 'unMute',
  DISCONNECT = 'disconnect',
  RECONNECT = 'reconnect',
  STOP_SERVICE = 'stopService',
  RELEASE_SESSION = 'releaseSession'
}

// 状态迁移记录：保存迁移前后状态、触发动作与合法性
interface StateTransitionRecord {
  from: SessionState;
  to: SessionState;
  trigger: SessionTrigger;
  valid: boolean;
  timestamp: number;
}

// 会话快照：某一时刻的状态、设备与宫格信息
interface SessionSnapshot {
  state: SessionState;
  deviceId: string;
  tileCount: number;
  muted: boolean;
  timestamp: number;
}

// 状态迁移表：集中定义合法迁移关系
class TransitionTable {
  private pairs: string[] = [];

  constructor() {
    this.allow(SessionState.IDLE, SessionState.STARTING);
    this.allow(SessionState.STARTING, SessionState.CREATED);
    this.allow(SessionState.CREATED, SessionState.CONNECTING);
    this.allow(SessionState.CONNECTING, SessionState.CONNECTED);
    this.allow(SessionState.CONNECTED, SessionState.MIRRORING);
    this.allow(SessionState.MIRRORING, SessionState.PAUSED);
    this.allow(SessionState.PAUSED, SessionState.MIRRORING);
    this.allow(SessionState.MIRRORING, SessionState.MUTED);
    this.allow(SessionState.MUTED, SessionState.MIRRORING);
    this.allow(SessionState.MIRRORING, SessionState.RECONNECTING);
    this.allow(SessionState.CONNECTED, SessionState.RECONNECTING);
    this.allow(SessionState.CONNECTING, SessionState.RECONNECTING);
    this.allow(SessionState.RECONNECTING, SessionState.CONNECTING);
    this.allow(SessionState.RECONNECTING, SessionState.FAILED);
    this.allow(SessionState.STARTING, SessionState.STOPPING);
    this.allow(SessionState.CREATED, SessionState.STOPPING);
    this.allow(SessionState.CONNECTING, SessionState.STOPPING);
    this.allow(SessionState.CONNECTED, SessionState.STOPPING);
    this.allow(SessionState.MIRRORING, SessionState.STOPPING);
    this.allow(SessionState.PAUSED, SessionState.STOPPING);
    this.allow(SessionState.MUTED, SessionState.STOPPING);
    this.allow(SessionState.RECONNECTING, SessionState.STOPPING);
    this.allow(SessionState.STOPPING, SessionState.STOPPED);
    this.allow(SessionState.STOPPED, SessionState.STARTING);
    this.allow(SessionState.FAILED, SessionState.STARTING);
  }

  private allow(from: SessionState, to: SessionState): void {
    this.pairs.push(from + '>' + to);
  }

  public isAllowed(from: SessionState, to: SessionState): boolean {
    return this.pairs.indexOf(from + '>' + to) >= 0;
  }

  public count(): number {
    return this.pairs.length;
  }
}

// 会话状态机：按触发器推进状态并记录全部迁移
class SessionStateMachine {
  private state: SessionState = SessionState.IDLE;
  private table: TransitionTable = new TransitionTable();
  private records: StateTransitionRecord[] = [];

  public getState(): SessionState {
    return this.state;
  }

  public getTable(): TransitionTable {
    return this.table;
  }

  public nextState(trigger: SessionTrigger): SessionState {
    if (trigger === SessionTrigger.STOP_SERVICE) {
      if (this.state === SessionState.IDLE || this.state === SessionState.STOPPED ||
        this.state === SessionState.STOPPING) {
        return this.state;
      }
      return SessionState.STOPPING;
    }
    if (this.state === SessionState.IDLE && trigger === SessionTrigger.START_SERVICE) {
      return SessionState.STARTING;
    }
    if (this.state === SessionState.STOPPED && trigger === SessionTrigger.START_SERVICE) {
      return SessionState.STARTING;
    }
    if (this.state === SessionState.FAILED && trigger === SessionTrigger.START_SERVICE) {
      return SessionState.STARTING;
    }
    if (this.state === SessionState.STARTING && trigger === SessionTrigger.CREATE_SESSION) {
      return SessionState.CREATED;
    }
    if (this.state === SessionState.CREATED && trigger === SessionTrigger.CONNECT_DEVICE) {
      return SessionState.CONNECTING;
    }
    if (this.state === SessionState.CONNECTING && trigger === SessionTrigger.BIND_SCREEN) {
      return SessionState.CONNECTED;
    }
    if (this.state === SessionState.CONNECTED && trigger === SessionTrigger.START_PLAY) {
      return SessionState.MIRRORING;
    }
    if (this.state === SessionState.MIRRORING && trigger === SessionTrigger.PAUSE_PLAY) {
      return SessionState.PAUSED;
    }
    if (this.state === SessionState.PAUSED && trigger === SessionTrigger.START_PLAY) {
      return SessionState.MIRRORING;
    }
    if (this.state === SessionState.MIRRORING && trigger === SessionTrigger.MUTE) {
      return SessionState.MUTED;
    }
    if (this.state === SessionState.MUTED && trigger === SessionTrigger.UNMUTE) {
      return SessionState.MIRRORING;
    }
    if (this.state === SessionState.MIRRORING && trigger === SessionTrigger.DISCONNECT) {
      return SessionState.RECONNECTING;
    }
    if (this.state === SessionState.CONNECTED && trigger === SessionTrigger.DISCONNECT) {
      return SessionState.RECONNECTING;
    }
    if (this.state === SessionState.CONNECTING && trigger === SessionTrigger.DISCONNECT) {
      return SessionState.RECONNECTING;
    }
    if (this.state === SessionState.RECONNECTING && trigger === SessionTrigger.CONNECT_DEVICE) {
      return SessionState.CONNECTING;
    }
    if (this.state === SessionState.RECONNECTING && trigger === SessionTrigger.RELEASE_SESSION) {
      return SessionState.FAILED;
    }
    if (this.state === SessionState.STOPPING && trigger === SessionTrigger.RELEASE_SESSION) {
      return SessionState.STOPPED;
    }
    return this.state;
  }

  public apply(trigger: SessionTrigger): boolean {
    const next: SessionState = this.nextState(trigger);
    const valid: boolean = next !== this.state && this.table.isAllowed(this.state, next);
    const record: StateTransitionRecord = {
      from: this.state,
      to: next,
      trigger: trigger,
      valid: valid,
      timestamp: Date.now()
    };
    this.records.push(record);
    if (!valid) {
      return false;
    }
    this.state = next;
    return true;
  }

  public canApply(trigger: SessionTrigger): boolean {
    const next: SessionState = this.nextState(trigger);
    return next !== this.state && this.table.isAllowed(this.state, next);
  }

  public getRecords(): StateTransitionRecord[] {
    return [...this.records];
  }

  public getValidCount(): number {
    let count: number = 0;
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].valid) {
        count++;
      }
    }
    return count;
  }

  public getInvalidCount(): number {
    return this.records.length - this.getValidCount();
  }

  public hasVisited(state: SessionState): boolean {
    for (let i = 0; i < this.records.length; i++) {
      if (this.records[i].to === state && this.records[i].valid) {
        return true;
      }
    }
    return false;
  }

  public reset(): void {
    this.state = SessionState.IDLE;
    this.records = [];
  }
}

// 快照仓库：保存与恢复会话快照
class SnapshotStore {
  private snapshots: SessionSnapshot[] = [];

  public save(snapshot: SessionSnapshot): boolean {
    if (snapshot.deviceId.length === 0 && snapshot.state !== SessionState.IDLE) {
      return false;
    }
    if (snapshot.tileCount < 0 || snapshot.tileCount > MAX_MIRROR_TILES) {
      return false;
    }
    this.snapshots.push(snapshot);
    return true;
  }

  public latest(): SessionSnapshot | null {
    if (this.snapshots.length === 0) {
      return null;
    }
    return this.snapshots[this.snapshots.length - 1];
  }

  public size(): number {
    return this.snapshots.length;
  }

  public getSnapshots(): SessionSnapshot[] {
    return [...this.snapshots];
  }

  public findLatestByDevice(deviceId: string): SessionSnapshot | null {
    for (let i = this.snapshots.length - 1; i >= 0; i--) {
      if (this.snapshots[i].deviceId === deviceId) {
        return this.snapshots[i];
      }
    }
    return null;
  }

  public restore(state: SessionState): SessionSnapshot | null {
    for (let i = this.snapshots.length - 1; i >= 0; i--) {
      if (this.snapshots[i].state === state) {
        return this.snapshots[i];
      }
    }
    return null;
  }

  public prune(maxCount: number): number {
    if (maxCount <= 0) {
      const removed: number = this.snapshots.length;
      this.snapshots = [];
      return removed;
    }
    if (this.snapshots.length <= maxCount) {
      return 0;
    }
    const removed: number = this.snapshots.length - maxCount;
    const kept: SessionSnapshot[] = [];
    for (let i = removed; i < this.snapshots.length; i++) {
      kept.push(this.snapshots[i]);
    }
    this.snapshots = kept;
    return removed;
  }

  public isChronological(): boolean {
    for (let i = 1; i < this.snapshots.length; i++) {
      if (this.snapshots[i].timestamp < this.snapshots[i - 1].timestamp) {
        return false;
      }
    }
    return true;
  }

  public clear(): void {
    this.snapshots = [];
  }
}

// 状态统计器：统计各状态出现次数与停留次数
class StateStatistics {
  private counts: Map<string, number> = new Map<string, number>();

  public analyze(machine: SessionStateMachine): void {
    this.counts = new Map<string, number>();
    const records: StateTransitionRecord[] = machine.getRecords();
    for (let i = 0; i < records.length; i++) {
      if (!records[i].valid) {
        continue;
      }
      const key: string = records[i].to;
      const current = this.counts.get(key);
      if (current === undefined) {
        this.counts.set(key, 1);
      } else {
        this.counts.set(key, current + 1);
      }
    }
  }

  public getCount(state: SessionState): number {
    const value = this.counts.get(state);
    if (value === undefined) {
      return 0;
    }
    return value;
  }

  public getMostFrequent(): string {
    let best: string = 'none';
    let bestCount: number = 0;
    const keys = this.counts.keys();
    for (const key of keys) {
      const value = this.counts.get(key);
      if (value !== undefined && value > bestCount) {
        bestCount = value;
        best = key;
      }
    }
    return best;
  }

  public getDistinctStateCount(): number {
    return this.counts.size;
  }
}

// 状态不变量校验器：约束快照与状态的合法组合
class StateValidator {
  public isTerminal(state: SessionState): boolean {
    return state === SessionState.STOPPED || state === SessionState.FAILED;
  }

  public requiresDevice(state: SessionState): boolean {
    if (state === SessionState.CONNECTED || state === SessionState.MIRRORING) {
      return true;
    }
    return state === SessionState.PAUSED || state === SessionState.MUTED;
  }

  public isPlaybackState(state: SessionState): boolean {
    if (state === SessionState.MIRRORING || state === SessionState.PAUSED) {
      return true;
    }
    return state === SessionState.MUTED;
  }

  public checkSnapshot(snapshot: SessionSnapshot): boolean {
    if (this.requiresDevice(snapshot.state) && snapshot.deviceId.length === 0) {
      return false;
    }
    if (snapshot.muted && !this.isPlaybackState(snapshot.state)) {
      return false;
    }
    return snapshot.tileCount >= 0 && snapshot.tileCount <= MAX_MIRROR_TILES;
  }

  public checkTransition(record: StateTransitionRecord): boolean {
    if (record.from === record.to) {
      return false;
    }
    if (this.isTerminal(record.from)) {
      return record.to === SessionState.STARTING;
    }
    return true;
  }
}

// 状态恢复计划：根据快照决定恢复入口
class StateRecoveryPlanner {
  public planFor(snapshot: SessionSnapshot | null): SessionTrigger {
    if (snapshot === null) {
      return SessionTrigger.START_SERVICE;
    }
    if (snapshot.state === SessionState.MIRRORING || snapshot.state === SessionState.PAUSED) {
      return SessionTrigger.CONNECT_DEVICE;
    }
    if (snapshot.state === SessionState.STOPPED || snapshot.state === SessionState.FAILED) {
      return SessionTrigger.START_SERVICE;
    }
    return SessionTrigger.CREATE_SESSION;
  }

  public describe(trigger: SessionTrigger): string {
    if (trigger === SessionTrigger.START_SERVICE) {
      return 'restart service and rebuild session';
    }
    if (trigger === SessionTrigger.CONNECT_DEVICE) {
      return 'reconnect known device and resume mirror';
    }
    return 'create fresh session';
  }
}

// 快照比较器：对比两个快照的差异，用于恢复前后一致性校验

export default function sessionStateManagementSuite(): void {
  describe('SessionStateManagement_Suite', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = getDriver();
      Log.info(TAG, 'suite start');
      await serializedDelay(driver, TIMEOUT_PAGE_RENDER);
      await triggerMiracastHome(driver);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      Log.info(TAG, 'suite end');
      await serializedDelay(driver, DELAY_AFTER_SESSION_OP);
    });

    // 状态机初始状态应为 IDLE 且无迁移记录
    it('state_machine_should_start_idle', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.getState()).assertEqual(SessionState.IDLE);
      expect(machine.getRecords().length).assertEqual(0);
      expect(machine.getValidCount()).assertEqual(0);
      expect(machine.getInvalidCount()).assertEqual(0);
    });

    // 启动服务应把状态推进到 STARTING
    it('start_service_should_move_to_starting', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.apply(SessionTrigger.START_SERVICE)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.STARTING);
      expect(machine.getValidCount()).assertEqual(1);
      expect(machine.hasVisited(SessionState.STARTING)).assertTrue();
    });

    // 创建会话应把状态推进到 CREATED
    it('create_session_should_move_to_created', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      expect(machine.apply(SessionTrigger.CREATE_SESSION)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.CREATED);
      expect(machine.hasVisited(SessionState.CREATED)).assertTrue();
    });

    // 连接设备应经过 CONNECTING 再到 CONNECTED
    it('connect_device_should_reach_connected', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      expect(machine.apply(SessionTrigger.CONNECT_DEVICE)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.CONNECTING);
      expect(machine.apply(SessionTrigger.BIND_SCREEN)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.CONNECTED);
    });

    // 绑定 Screen 后才能开始镜像
    it('start_play_should_require_connected_state', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      expect(machine.apply(SessionTrigger.START_PLAY)).assertFalse();
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      expect(machine.apply(SessionTrigger.START_PLAY)).assertFalse();
      machine.apply(SessionTrigger.BIND_SCREEN);
      expect(machine.apply(SessionTrigger.START_PLAY)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.MIRRORING);
    });

    // 镜像状态下暂停应进入 PAUSED，再次播放回到 MIRRORING
    it('pause_and_resume_should_toggle_playback', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      machine.apply(SessionTrigger.BIND_SCREEN);
      machine.apply(SessionTrigger.START_PLAY);
      expect(machine.apply(SessionTrigger.PAUSE_PLAY)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.PAUSED);
      expect(machine.apply(SessionTrigger.START_PLAY)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.MIRRORING);
    });

    // 静音与取消静音应在 MUTED 与 MIRRORING 之间切换
    it('mute_and_unmute_should_toggle_audio_state', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      machine.apply(SessionTrigger.BIND_SCREEN);
      machine.apply(SessionTrigger.START_PLAY);
      expect(machine.apply(SessionTrigger.MUTE)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.MUTED);
      expect(machine.apply(SessionTrigger.UNMUTE)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.MIRRORING);
    });

    // 断连应进入 RECONNECTING，重连回到 CONNECTING
    it('disconnect_should_enter_reconnecting', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      machine.apply(SessionTrigger.BIND_SCREEN);
      machine.apply(SessionTrigger.START_PLAY);
      expect(machine.apply(SessionTrigger.DISCONNECT)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.RECONNECTING);
      expect(machine.apply(SessionTrigger.CONNECT_DEVICE)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.CONNECTING);
    });

    // 重连中释放会话应进入 FAILED
    it('release_during_reconnect_should_fail', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      machine.apply(SessionTrigger.DISCONNECT);
      expect(machine.apply(SessionTrigger.RELEASE_SESSION)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.FAILED);
      expect(machine.getInvalidCount()).assertEqual(0);
    });

    // 停止服务应经过 STOPPING 后进入 STOPPED
    it('stop_service_should_reach_stopped', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      machine.apply(SessionTrigger.BIND_SCREEN);
      machine.apply(SessionTrigger.START_PLAY);
      expect(machine.apply(SessionTrigger.STOP_SERVICE)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.STOPPING);
      expect(machine.apply(SessionTrigger.RELEASE_SESSION)).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.STOPPED);
    });

    // 空闲状态下停止服务不应产生迁移
    it('stop_service_should_be_noop_when_idle', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.apply(SessionTrigger.STOP_SERVICE)).assertFalse();
      expect(machine.getState()).assertEqual(SessionState.IDLE);
      expect(machine.getInvalidCount()).assertEqual(1);
      expect(machine.getValidCount()).assertEqual(0);
    });

    // 空 deviceId 的非空闲快照应被拒绝保存
    it('snapshot_store_should_reject_empty_device_snapshot', 0, async () => {
      const store = new SnapshotStore();
      const invalid: SessionSnapshot = {
        state: SessionState.MIRRORING,
        deviceId: '',
        tileCount: 1,
        muted: false,
        timestamp: 1
      };
      expect(store.save(invalid)).assertFalse();
      const idle: SessionSnapshot = {
        state: SessionState.IDLE,
        deviceId: '',
        tileCount: 0,
        muted: false,
        timestamp: 1
      };
      expect(store.save(idle)).assertTrue();
      expect(store.size()).assertEqual(1);
    });

    // 越界宫格数量的快照应被拒绝
    it('snapshot_store_should_reject_invalid_tile_count', 0, async () => {
      const store = new SnapshotStore();
      const tooMany: SessionSnapshot = {
        state: SessionState.MIRRORING,
        deviceId: 'device_1',
        tileCount: MAX_MIRROR_TILES + 1,
        muted: false,
        timestamp: 1
      };
      const negative: SessionSnapshot = {
        state: SessionState.MIRRORING,
        deviceId: 'device_1',
        tileCount: -1,
        muted: false,
        timestamp: 1
      };
      expect(store.save(tooMany)).assertFalse();
      expect(store.save(negative)).assertFalse();
      expect(store.size()).assertEqual(0);
    });

    // 最新快照应指向最后一次保存项
    it('snapshot_store_should_return_latest_snapshot', 0, async () => {
      const store = new SnapshotStore();
      const first: SessionSnapshot = {
        state: SessionState.CREATED,
        deviceId: 'device_1',
        tileCount: 0,
        muted: false,
        timestamp: 1
      };
      const second: SessionSnapshot = {
        state: SessionState.MIRRORING,
        deviceId: 'device_1',
        tileCount: 1,
        muted: false,
        timestamp: 2
      };
      store.save(first);
      store.save(second);
      const latest: SessionSnapshot | null = store.latest();
      expect(latest === null).assertFalse();
      if (latest !== null) {
        expect(latest.state).assertEqual(SessionState.MIRRORING);
        expect(latest.tileCount).assertEqual(1);
      }
    });

    // 空仓库的最新快照与恢复结果都为空
    it('snapshot_store_should_handle_empty_state', 0, async () => {
      const store = new SnapshotStore();
      expect(store.size()).assertEqual(0);
      expect(store.latest()).assertNull();
      expect(store.restore(SessionState.MIRRORING)).assertNull();
      expect(store.isChronological()).assertTrue();
    });

    // 按设备查找应返回该设备最后一次快照
    it('snapshot_store_should_find_snapshot_by_device', 0, async () => {
      const store = new SnapshotStore();
      store.save({
        state: SessionState.CONNECTED,
        deviceId: 'device_a',
        tileCount: 1,
        muted: false,
        timestamp: 1
      });
      store.save({
        state: SessionState.MIRRORING,
        deviceId: 'device_b',
        tileCount: 2,
        muted: false,
        timestamp: 2
      });
      const found: SessionSnapshot | null = store.findLatestByDevice('device_a');
      expect(found === null).assertFalse();
      if (found !== null) {
        expect(found.deviceId).assertEqual('device_a');
        expect(found.state).assertEqual(SessionState.CONNECTED);
      }
      expect(store.findLatestByDevice('device_z')).assertNull();
    });

    // 按状态恢复应返回最近一次匹配快照
    it('snapshot_store_should_restore_by_state', 0, async () => {
      const store = new SnapshotStore();
      store.save({
        state: SessionState.MIRRORING,
        deviceId: 'device_a',
        tileCount: 1,
        muted: false,
        timestamp: 1
      });
      store.save({
        state: SessionState.MUTED,
        deviceId: 'device_a',
        tileCount: 1,
        muted: true,
        timestamp: 2
      });
      const restored: SessionSnapshot | null = store.restore(SessionState.MIRRORING);
      expect(restored === null).assertFalse();
      if (restored !== null) {
        expect(restored.state).assertEqual(SessionState.MIRRORING);
        expect(restored.muted).assertFalse();
      }
      expect(store.restore(SessionState.FAILED)).assertNull();
    });


    // 快照时间戳必须单调递增
    it('snapshot_timestamps_should_be_chronological', 0, async () => {
      const store = new SnapshotStore();
      store.save({
        state: SessionState.CREATED,
        deviceId: 'device_1',
        tileCount: 0,
        muted: false,
        timestamp: 1
      });
      await serializedDelay(driver, DELAY_KEY_NAVIGATION);
      store.save({
        state: SessionState.MIRRORING,
        deviceId: 'device_1',
        tileCount: 1,
        muted: false,
        timestamp: Date.now()
      });
      expect(store.isChronological()).assertTrue();
      const snapshots: SessionSnapshot[] = store.getSnapshots();
      expect(snapshots[0].timestamp).assertLessOrEqual(snapshots[1].timestamp);
    });

    // 校验器应识别终态
    it('state_validator_should_detect_terminal_states', 0, async () => {
      const validator = new StateValidator();
      expect(validator.isTerminal(SessionState.STOPPED)).assertTrue();
      expect(validator.isTerminal(SessionState.FAILED)).assertTrue();
      expect(validator.isTerminal(SessionState.MIRRORING)).assertFalse();
      expect(validator.requiresDevice(SessionState.MIRRORING)).assertTrue();
      expect(validator.requiresDevice(SessionState.IDLE)).assertFalse();
    });

    // 校验器应识别播放类状态
    it('state_validator_should_detect_playback_states', 0, async () => {
      const validator = new StateValidator();
      expect(validator.isPlaybackState(SessionState.MIRRORING)).assertTrue();
      expect(validator.isPlaybackState(SessionState.PAUSED)).assertTrue();
      expect(validator.isPlaybackState(SessionState.MUTED)).assertTrue();
      expect(validator.isPlaybackState(SessionState.CONNECTED)).assertFalse();
    });

    // 快照校验应拒绝缺少设备的镜像快照
    it('state_validator_should_reject_snapshot_without_device', 0, async () => {
      const validator = new StateValidator();
      const noDevice: SessionSnapshot = {
        state: SessionState.MIRRORING,
        deviceId: '',
        tileCount: 1,
        muted: false,
        timestamp: 1
      };
      const okSnapshot: SessionSnapshot = {
        state: SessionState.MIRRORING,
        deviceId: 'device_1',
        tileCount: 1,
        muted: false,
        timestamp: 1
      };
      expect(validator.checkSnapshot(noDevice)).assertFalse();
      expect(validator.checkSnapshot(okSnapshot)).assertTrue();
    });

    // 静音快照必须处于播放类状态
    it('state_validator_should_reject_muted_non_playback_snapshot', 0, async () => {
      const validator = new StateValidator();
      const mutedIdle: SessionSnapshot = {
        state: SessionState.CONNECTED,
        deviceId: 'device_1',
        tileCount: 0,
        muted: true,
        timestamp: 1
      };
      const mutedPlaying: SessionSnapshot = {
        state: SessionState.MUTED,
        deviceId: 'device_1',
        tileCount: 1,
        muted: true,
        timestamp: 2
      };
      expect(validator.checkSnapshot(mutedIdle)).assertFalse();
      expect(validator.checkSnapshot(mutedPlaying)).assertTrue();
    });

    // 恢复计划应根据快照状态选择入口
    it('recovery_planner_should_choose_entry_by_snapshot', 0, async () => {
      const planner = new StateRecoveryPlanner();
      expect(planner.planFor(null)).assertEqual(SessionTrigger.START_SERVICE);
      const mirroring: SessionSnapshot = {
        state: SessionState.MIRRORING,
        deviceId: 'device_1',
        tileCount: 1,
        muted: false,
        timestamp: 1
      };
      expect(planner.planFor(mirroring)).assertEqual(SessionTrigger.CONNECT_DEVICE);
      const stopped: SessionSnapshot = {
        state: SessionState.STOPPED,
        deviceId: 'device_1',
        tileCount: 0,
        muted: false,
        timestamp: 2
      };
      expect(planner.planFor(stopped)).assertEqual(SessionTrigger.START_SERVICE);
    });

    // 恢复计划描述文本应区分重建与重连
    it('recovery_planner_should_describe_entry', 0, async () => {
      const planner = new StateRecoveryPlanner();
      expect(planner.describe(SessionTrigger.START_SERVICE)).assertContain('restart service');
      expect(planner.describe(SessionTrigger.CONNECT_DEVICE)).assertContain('reconnect known device');
      expect(planner.describe(SessionTrigger.CREATE_SESSION)).assertContain('create fresh session');
    });

    // 状态统计应统计合法迁移的目标状态
    it('state_statistics_should_count_target_states', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      const stats = new StateStatistics();
      stats.analyze(machine);
      expect(stats.getCount(SessionState.STARTING)).assertEqual(1);
      expect(stats.getCount(SessionState.CREATED)).assertEqual(1);
      expect(stats.getCount(SessionState.CONNECTING)).assertEqual(1);
      expect(stats.getDistinctStateCount()).assertEqual(3);
    });

    // 状态统计应忽略非法迁移
    it('state_statistics_should_ignore_invalid_transitions', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.START_SERVICE);
      const stats = new StateStatistics();
      stats.analyze(machine);
      expect(stats.getCount(SessionState.CREATED)).assertEqual(0);
      expect(stats.getCount(SessionState.STARTING)).assertEqual(1);
      expect(stats.getDistinctStateCount()).assertEqual(1);
    });

    // 状态统计应返回出现次数最多的状态

    // 空统计应返回 none 且计数为零
    it('state_statistics_should_handle_empty_machine', 0, async () => {
      const stats = new StateStatistics();
      stats.analyze(new SessionStateMachine());
      expect(stats.getCount(SessionState.MIRRORING)).assertEqual(0);
      expect(stats.getMostFrequent()).assertEqual('none');
      expect(stats.getDistinctStateCount()).assertEqual(0);
    });

    // 状态日志应记录每条迁移的源状态、目标状态与触发器

    // 状态日志应支持追加与清空

    // 快照比较器应识别完全一致的快照

    // 快照比较器应统计字段差异数量

    // 状态指标应统计触发器次数与每轮平均迁移

    // 迁移守卫应拒绝从终态直接回到播放态
    it('state_validator_should_reject_invalid_transition_record', 0, async () => {
      const validator = new StateValidator();
      const illegal: StateTransitionRecord = {
        from: SessionState.STOPPED,
        to: SessionState.MIRRORING,
        trigger: SessionTrigger.START_PLAY,
        valid: true,
        timestamp: 1
      };
      const legal: StateTransitionRecord = {
        from: SessionState.STOPPED,
        to: SessionState.STARTING,
        trigger: SessionTrigger.START_SERVICE,
        valid: true,
        timestamp: 2
      };
      expect(validator.checkTransition(illegal)).assertFalse();
      expect(validator.checkTransition(legal)).assertTrue();
    });

    // 迁移表应包含关键链路并拒绝越级迁移
    it('transition_table_should_guard_key_paths', 0, async () => {
      const table = new TransitionTable();
      expect(table.isAllowed(SessionState.IDLE, SessionState.STARTING)).assertTrue();
      expect(table.isAllowed(SessionState.STARTING, SessionState.CREATED)).assertTrue();
      expect(table.isAllowed(SessionState.CREATED, SessionState.MIRRORING)).assertFalse();
      expect(table.isAllowed(SessionState.MIRRORING, SessionState.PAUSED)).assertTrue();
      expect(table.count()).assertLarger(10);
    });

    // 首页与播放页在状态机推进后仍应可渲染

    // 播放页宫格数量应与状态机允许的 9 路上限一致
    it('player_tiles_should_match_state_limit', 0, async () => {
      const tiles: number = await getPlayerTileCount(driver);
      expect(tiles).assertLessOrEqual(MAX_MIRROR_TILES);
      const store = new SnapshotStore();
      expect(store.save({
        state: SessionState.MIRRORING,
        deviceId: 'device_tiles',
        tileCount: tiles,
        muted: false,
        timestamp: 1
      })).assertTrue();
      expect(store.latest() !== null).assertTrue();
    });

    // 播放页拉起与返回后状态机可安全复位
    it('player_navigation_should_allow_state_reset', 0, async () => {
      const machine = new SessionStateMachine();
      machine.apply(SessionTrigger.START_SERVICE);
      machine.apply(SessionTrigger.CREATE_SESSION);
      machine.apply(SessionTrigger.CONNECT_DEVICE);
      machine.apply(SessionTrigger.BIND_SCREEN);
      machine.apply(SessionTrigger.START_PLAY);
      await launchPlayerPage('device_state', 'StateSink');
      await serializedDelay(driver, TIMEOUT_SESSION_CREATE);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      await triggerMiracastHome(driver);
      machine.apply(SessionTrigger.STOP_SERVICE);
      machine.apply(SessionTrigger.RELEASE_SESSION);
      expect(machine.getState()).assertEqual(SessionState.STOPPED);
      expect(machine.getInvalidCount()).assertEqual(0);
    });
    it('recovery_planner_should_plan_for_paused_snapshot', 0, async () => {
      const paused: SessionSnapshot = { state: SessionState.PAUSED, deviceId: 'device_p', tileCount: 1,
        muted: false, timestamp: 1 };
      expect(new StateRecoveryPlanner().planFor(paused)).assertEqual(SessionTrigger.CONNECT_DEVICE);
    });
    it('state_validator_should_require_device_for_paused_state', 0, async () => {
      const validator = new StateValidator();
      expect(validator.requiresDevice(SessionState.PAUSED) && validator.requiresDevice(SessionState.MUTED)).assertTrue();
    });
    it('snapshot_store_should_expose_saved_snapshots', 0, async () => {
      const store = new SnapshotStore();
      const snapshot: SessionSnapshot = { state: SessionState.CREATED, deviceId: 'device_s', tileCount: 0,
        muted: false, timestamp: 1 };
      store.save(snapshot);
      expect(store.getSnapshots().length === 1 && store.latest() !== null).assertTrue();
    });
    it('transition_table_should_reject_unknown_pair', 0, async () => {
      const table = new TransitionTable();
      expect(!table.isAllowed(SessionState.IDLE, SessionState.MIRRORING) && table.count() > 10).assertTrue();
    });
  });
}
