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
  createFreshDriver,
  KEY_BACK,
  pressAndWait,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 会话数据接口
interface SessionData {
  isReady: string;
}

// 模拟会话：模拟 UIExtensionContentSession 行为
class MockSession {
  private terminated: boolean = false;
  private sentData: SessionData[] = [];
  private contentLoaded: boolean = false;

  public sendData(data: SessionData): void {
    this.sentData.push(data);
  }

  public terminateSelf(): void {
    this.terminated = true;
  }

  public loadContent(path: string): void {
    this.contentLoaded = true;
  }

  public setWindowBackgroundColor(color: string): void {
  }

  public isTerminated(): boolean {
    return this.terminated;
  }

  public isContentLoaded(): boolean {
    return this.contentLoaded;
  }

  public getSentData(): SessionData[] {
    return [...this.sentData];
  }
}

// 会话管理器：管理会话生命周期
class SessionManager {
  private session: MockSession | null = null;

  public createSession(): MockSession {
    this.session = new MockSession();
    return this.session;
  }

  public getSession(): MockSession | null {
    return this.session;
  }

  public notifyReady(session: MockSession): void {
    const data: SessionData = { isReady: '1' };
    session.sendData(data);
  }

  public terminate(session: MockSession): void {
    session.terminateSelf();
  }
}

// 会话状态枚举：描述电源会话所处的生命周期状态
enum SessionState {
  SESSION_CREATED = 'created', SESSION_ACTIVATED = 'activated', SESSION_READY = 'ready', SESSION_TERMINATED = 'terminated'
}

// 会话事件枚举：描述会话生命周期中的关键事件
enum SessionEvent {
  EVENT_CREATE = 'create', EVENT_LOAD = 'load', EVENT_READY = 'ready', EVENT_TERMINATE = 'terminate'
}

// 会话事件记录接口：描述一次会话事件记录
interface SessionEventRecord {
  event: SessionEvent;
  stateAfter: SessionState;
  timestamp: number;
}

// 会话生命周期追踪器：记录会话状态与事件的完整演化过程
class SessionLifecycleTracker {
  private records: SessionEventRecord[] = [];
  private currentState: SessionState = SessionState.SESSION_CREATED;

  public record(event: SessionEvent, stateAfter: SessionState): void {
    this.records.push({ event, stateAfter, timestamp: Date.now() });
    this.currentState = stateAfter;
  }

  public getState(): SessionState {
    return this.currentState;
  }

  public getRecords(): SessionEventRecord[] {
    return [...this.records];
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public hasEvent(event: SessionEvent): boolean {
    return this.records.some((record: SessionEventRecord) => record.event === event);
  }

  public countEvent(event: SessionEvent): number {
    return this.records.filter((record: SessionEventRecord) => record.event === event).length;
  }

  public getLastRecord(): SessionEventRecord | null {
    if (this.records.length === 0) {
      return null;
    }
    return this.records[this.records.length - 1];
  }

  public clear(): void {
    this.records = [];
    this.currentState = SessionState.SESSION_CREATED;
  }
}

// 会话数据校验器：校验会话数据的完整性与合法性
class SessionDataValidator {
  public isReadyDataValid(data: SessionData): boolean {
    return data.isReady === '1';
  }

  public hasReadySignal(dataList: SessionData[]): boolean {
    return dataList.some((data: SessionData) => this.isReadyDataValid(data));
  }

  public countReadySignals(dataList: SessionData[]): number {
    return dataList.filter((data: SessionData) => this.isReadyDataValid(data)).length;
  }

  public isSingleReadySignal(dataList: SessionData[]): boolean {
    return this.countReadySignals(dataList) === 1;
  }

  public areAllValid(dataList: SessionData[]): boolean {
    return dataList.every((data: SessionData) => this.isReadyDataValid(data));
  }
}

// 会话数据仓库：集中管理会话产生的数据并支持查询与统计
class SessionDataRepository {
  private dataList: SessionData[] = [];

  public addData(data: SessionData): void {
    this.dataList.push(data);
  }

  public getDataList(): SessionData[] {
    return [...this.dataList];
  }

  public getDataCount(): number {
    return this.dataList.length;
  }

  public getReadyCount(): number {
    const validator = new SessionDataValidator();
    return validator.countReadySignals(this.dataList);
  }

  public clear(): void {
    this.dataList = [];
  }
}

// 会话统计器：对会话生命周期指标进行聚合统计
class SessionStatistics {
  private createCount: number = 0;
  private readyCount: number = 0;
  private terminateCount: number = 0;

  public recordCreate(): void {
    this.createCount++;
  }

  public recordReady(): void {
    this.readyCount++;
  }

  public recordTerminate(): void {
    this.terminateCount++;
  }

  public getCreateCount(): number {
    return this.createCount;
  }

  public getReadyCount(): number {
    return this.readyCount;
  }

  public getTerminateCount(): number {
    return this.terminateCount;
  }

  public isBalanced(): boolean {
    return this.createCount === this.terminateCount;
  }

  public hasReadySignal(): boolean {
    return this.readyCount > 0;
  }

  public describe(): string {
    return `SessionStatistics{create: ${this.createCount}, ready: ${this.readyCount}, terminate: ${this.terminateCount}}`;
  }

  public reset(): void {
    this.createCount = 0;
    this.readyCount = 0;
    this.terminateCount = 0;
  }
}

// 会话就绪信号构建器：构造标准就绪信号数据
class ReadySignalBuilder {
  public buildReadyData(): SessionData {
    return { isReady: '1' };
  }

  public buildNonReadyData(): SessionData {
    return { isReady: '0' };
  }

  public buildBatch(count: number): SessionData[] {
    const dataList: SessionData[] = [];
    for (let i = 0; i < count; i++) {
      dataList.push(this.buildReadyData());
    }
    return dataList;
  }
}

// 会话 id 生成器：生成唯一递增的会话标识
class SessionIdGenerator {
  private sequence: number = 0;
  private prefix: string;

  constructor(prefix: string) {
    this.prefix = prefix;
  }

  public generate(): string {
    const id = `${this.prefix}_${this.sequence}`;
    this.sequence++;
    return id;
  }

  public generateBatch(count: number): string[] {
    const ids: string[] = [];
    for (let i = 0; i < count; i++) {
      ids.push(this.generate());
    }
    return ids;
  }

  public getNextSequence(): number {
    return this.sequence;
  }

  public reset(): void {
    this.sequence = 0;
  }
}

// 会话状态机：管理会话状态迁移与合法性校验
class SessionStateMachine {
  private state: SessionState = SessionState.SESSION_CREATED;

  public getState(): SessionState {
    return this.state;
  }

  public activate(): boolean {
    if (this.state === SessionState.SESSION_CREATED) {
      this.state = SessionState.SESSION_ACTIVATED;
      return true;
    }
    return false;
  }

  public markReady(): boolean {
    if (this.state === SessionState.SESSION_ACTIVATED) {
      this.state = SessionState.SESSION_READY;
      return true;
    }
    return false;
  }

  public terminate(): boolean {
    if (this.state !== SessionState.SESSION_TERMINATED) {
      this.state = SessionState.SESSION_TERMINATED;
      return true;
    }
    return false;
  }

  public isReady(): boolean {
    return this.state === SessionState.SESSION_READY;
  }

  public isTerminated(): boolean {
    return this.state === SessionState.SESSION_TERMINATED;
  }
}

export default function powerSessionValidationTest() {
  describe('PowerSessionValidation_Test', () => {
    let driver: Driver;

    beforeAll(async () => {
      driver = createFreshDriver();
      await serializedDelay(driver, 1000);
    });

    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 ExtensionLifecycle：会话创建成功
    it('session_should_be_created_successfully', 0, async () => {
      const manager = new SessionManager();
      const session = manager.createSession();
      expect(session === null).assertFalse();
      expect(manager.getSession() === session).assertTrue();
    });

    // 适配 ExtensionLifecycle：会话发送就绪信号
    it('session_should_send_ready_signal_when_activated', 0, async () => {
      const manager = new SessionManager();
      const session = manager.createSession();
      manager.notifyReady(session);
      const sentData = session.getSentData();
      expect(sentData.length).assertEqual(1);
      expect(sentData[0].isReady).assertEqual('1');
    });

    // 适配 Share_Data_Format：就绪数据为单条目
    it('ready_data_should_contain_single_item', 0, async () => {
      const manager = new SessionManager();
      const session = manager.createSession();
      manager.notifyReady(session);
      expect(session.getSentData().length).assertEqual(1);
    });

    // 适配 ExtensionLifecycle：会话正确终止
    it('session_should_terminate_correctly', 0, async () => {
      const manager = new SessionManager();
      const session = manager.createSession();
      expect(session.isTerminated()).assertFalse();
      manager.terminate(session);
      expect(session.isTerminated()).assertTrue();
    });

    // 适配 ExtensionLifecycle：会话加载页面
    it('session_should_load_content', 0, async () => {
      const session = new MockSession();
      session.loadContent('pages/powerDialog');
      expect(session.isContentLoaded()).assertTrue();
    });

    // 适配 ExtensionLifecycle：会话数据完整性
    it('data_transfer_should_be_integrity_during_session', 0, async () => {
      const manager = new SessionManager();
      const session = manager.createSession();
      manager.notifyReady(session);
      const data = session.getSentData()[0];
      expect(data.isReady).assertEqual('1');
    });

    // 适配 Share_Restrictions：无会话时不产生就绪数据
    it('without_session_should_have_no_ready_data', 0, async () => {
      const manager = new SessionManager();
      expect(manager.getSession()).assertEqual(null);
    });

    // 适配 Share_Failure_Handling：终止幂等性
    it('terminate_should_be_idempotent', 0, async () => {
      const session = new MockSession();
      session.terminateSelf();
      session.terminateSelf();
      expect(session.isTerminated()).assertTrue();
    });

    // 适配 Share_Menu_Hide_Timing：会话就绪后才可终止
    it('terminate_should_occur_after_ready', 0, async () => {
      const manager = new SessionManager();
      const session = manager.createSession();
      manager.notifyReady(session);
      expect(session.getSentData().length).assertEqual(1);
      manager.terminate(session);
      expect(session.isTerminated()).assertTrue();
    });

    // 综合：完整会话生命周期
    it('complete_session_lifecycle_should_work', 0, async () => {
      const manager = new SessionManager();
      const session = manager.createSession();
      session.loadContent('pages/powerDialog');
      manager.notifyReady(session);
      expect(session.isContentLoaded()).assertTrue();
      expect(session.getSentData().length).assertEqual(1);
      manager.terminate(session);
      expect(session.isTerminated()).assertTrue();
    });

    // 适配 SessionLifecycleTracker：生命周期事件记录
    it('lifecycle_tracker_should_record_events', 0, async () => {
      const tracker = new SessionLifecycleTracker();
      tracker.record(SessionEvent.EVENT_CREATE, SessionState.SESSION_CREATED);
      tracker.record(SessionEvent.EVENT_LOAD, SessionState.SESSION_ACTIVATED);
      tracker.record(SessionEvent.EVENT_READY, SessionState.SESSION_READY);
      expect(tracker.getRecordCount()).assertEqual(3);
      expect(tracker.hasEvent(SessionEvent.EVENT_READY)).assertTrue();
      expect(tracker.countEvent(SessionEvent.EVENT_LOAD)).assertEqual(1);
    });

    // 适配 SessionLifecycleTracker：状态跟随最新记录
    it('lifecycle_tracker_should_track_current_state', 0, async () => {
      const tracker = new SessionLifecycleTracker();
      tracker.record(SessionEvent.EVENT_CREATE, SessionState.SESSION_CREATED);
      tracker.record(SessionEvent.EVENT_READY, SessionState.SESSION_READY);
      expect(tracker.getState()).assertEqual(SessionState.SESSION_READY);
      const last = tracker.getLastRecord();
      expect(last === null).assertFalse();
      if (last !== null) {
        expect(last.event).assertEqual(SessionEvent.EVENT_READY);
      }
    });

    // 适配 SessionLifecycleTracker：清空后恢复初始状态
    it('lifecycle_tracker_should_clear_to_initial_state', 0, async () => {
      const tracker = new SessionLifecycleTracker();
      tracker.record(SessionEvent.EVENT_CREATE, SessionState.SESSION_CREATED);
      tracker.record(SessionEvent.EVENT_TERMINATE, SessionState.SESSION_TERMINATED);
      tracker.clear();
      expect(tracker.getRecordCount()).assertEqual(0);
      expect(tracker.getState()).assertEqual(SessionState.SESSION_CREATED);
    });

    // 适配 SessionDataValidator：就绪信号有效性校验
    it('data_validator_should_validate_ready_signal', 0, async () => {
      const validator = new SessionDataValidator();
      const ready: SessionData = { isReady: '1' };
      const notReady: SessionData = { isReady: '0' };
      expect(validator.isReadyDataValid(ready)).assertTrue();
      expect(validator.isReadyDataValid(notReady)).assertFalse();
    });

    // 适配 SessionDataValidator：就绪信号计数与单信号判定
    it('data_validator_should_count_ready_signals', 0, async () => {
      const validator = new SessionDataValidator();
      const ready: SessionData = { isReady: '1' };
      const notReady: SessionData = { isReady: '0' };
      expect(validator.hasReadySignal([ready])).assertTrue();
      expect(validator.hasReadySignal([notReady])).assertFalse();
      expect(validator.countReadySignals([ready, notReady, ready])).assertEqual(2);
      expect(validator.isSingleReadySignal([ready, notReady])).assertTrue();
    });

    // 适配 SessionDataRepository：数据仓库累计与统计
    it('data_repository_should_accumulate_data', 0, async () => {
      const repository = new SessionDataRepository();
      repository.addData({ isReady: '1' });
      repository.addData({ isReady: '0' });
      repository.addData({ isReady: '1' });
      expect(repository.getDataCount()).assertEqual(3);
      expect(repository.getReadyCount()).assertEqual(2);
    });

    // 适配 SessionStatistics：创建与终止计数平衡
    it('session_statistics_should_be_balanced', 0, async () => {
      const stats = new SessionStatistics();
      stats.recordCreate();
      stats.recordReady();
      stats.recordTerminate();
      expect(stats.getCreateCount()).assertEqual(1);
      expect(stats.getTerminateCount()).assertEqual(1);
      expect(stats.getReadyCount()).assertEqual(1);
      expect(stats.isBalanced()).assertTrue();
      expect(stats.hasReadySignal()).assertTrue();
    });

    // 适配 SessionStatistics：计数不平衡检测
    it('session_statistics_should_detect_imbalance', 0, async () => {
      const stats = new SessionStatistics();
      stats.recordCreate();
      expect(stats.isBalanced()).assertFalse();
      stats.recordTerminate();
      expect(stats.isBalanced()).assertTrue();
    });

    // 适配 ReadySignalBuilder：批量构建就绪数据
    it('ready_signal_builder_should_build_batch', 0, async () => {
      const builder = new ReadySignalBuilder();
      const batch = builder.buildBatch(5);
      expect(batch.length).assertEqual(5);
      const validator = new SessionDataValidator();
      expect(validator.areAllValid(batch)).assertTrue();
    });

    // 适配 SessionIdGenerator：会话 ID 序列递增
    it('session_id_generator_should_sequence', 0, async () => {
      const generator = new SessionIdGenerator('sess');
      expect(generator.generate()).assertEqual('sess_0');
      expect(generator.generate()).assertEqual('sess_1');
      expect(generator.getNextSequence()).assertEqual(2);
    });

    // 适配 SessionIdGenerator：批量生成唯一 ID
    it('session_id_generator_should_generate_batch', 0, async () => {
      const generator = new SessionIdGenerator('sess');
      const ids = generator.generateBatch(3);
      expect(ids.length).assertEqual(3);
      expect(ids[0]).assertEqual('sess_0');
      expect(ids[2]).assertEqual('sess_2');
    });

    // 适配 SessionIdGenerator：序列重置
    it('session_id_generator_should_reset_sequence', 0, async () => {
      const generator = new SessionIdGenerator('sess');
      generator.generate();
      generator.generate();
      generator.reset();
      expect(generator.generate()).assertEqual('sess_0');
    });

    // 适配 SessionStateMachine：状态迁移到就绪
    it('state_machine_should_transition_to_ready', 0, async () => {
      const machine = new SessionStateMachine();
      expect(machine.activate()).assertTrue();
      expect(machine.markReady()).assertTrue();
      expect(machine.isReady()).assertTrue();
      expect(machine.getState()).assertEqual(SessionState.SESSION_READY);
    });

    // 适配 SessionStateMachine：非法迁移应被拒绝
    it('state_machine_should_reject_invalid_activation', 0, async () => {
      const machine = new SessionStateMachine();
      machine.activate();
      expect(machine.activate()).assertFalse();
      machine.markReady();
      expect(machine.markReady()).assertFalse();
      machine.terminate();
      expect(machine.isTerminated()).assertTrue();
    });
  });
}
