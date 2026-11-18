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

const TAG: string = 'MiracastEventToolSuite';

// Cast 能力对外回调的事件类型
enum CastEventType {
  SERVICE_DIE = 'service_die', DEVICE_FOUND = 'device_found',
  SESSION_CREATE = 'session_create', DEVICE_OFFLINE = 'device_offline', UNKNOWN = 'unknown'
}

// emitter 事件号常量：1000 授权结果、1001 播放页设备数据
enum EmitterEventId {
  PERMISSION_RESULT = 1000, PLAYER_DATA = 1001
}

// 事件载荷：统一描述 Cast 回调与 emitter 消息
class CastEventPayload {
  public eventId: number;
  public deviceId: string;
  public deviceName: string;
  public timestamp: number;

  constructor(eventId: number, deviceId: string, deviceName: string, timestamp: number) {
    this.eventId = eventId;
    this.deviceId = deviceId;
    this.deviceName = deviceName;
    this.timestamp = timestamp;
  }

  public clone(): CastEventPayload {
    return new CastEventPayload(this.eventId, this.deviceId, this.deviceName, this.timestamp);
  }

  public equals(other: CastEventPayload): boolean {
    return this.eventId === other.eventId && this.deviceId === other.deviceId &&
      this.deviceName === other.deviceName && this.timestamp === other.timestamp;
  }

  public isValid(): boolean {
    return this.eventId > 0 && this.deviceId.length > 0 && this.timestamp >= 0;
  }

  public toString(): string {
    return `CastEventPayload(eventId=${this.eventId}, deviceId=${this.deviceId}, timestamp=${this.timestamp})`;
  }
}

// 事件号分配器：区分授权事件与播放页数据事件
class EmitterEventIdAllocator {
  public static isPermissionEvent(eventId: number): boolean {
    return eventId === EmitterEventId.PERMISSION_RESULT;
  }

  public static isPlayerDataEvent(eventId: number): boolean {
    return eventId === EmitterEventId.PLAYER_DATA;
  }

  public static isKnownEvent(eventId: number): boolean {
    return EmitterEventIdAllocator.isPermissionEvent(eventId) ||
      EmitterEventIdAllocator.isPlayerDataEvent(eventId);
  }

  public static isValidOffset(offset: number): boolean {
    return offset >= 0 && offset <= 2000;
  }

  public static getNextEventId(eventId: number): number {
    if (EmitterEventIdAllocator.isPermissionEvent(eventId)) {
      return EmitterEventId.PLAYER_DATA;
    }
    return EmitterEventId.PERMISSION_RESULT;
  }
}

// 事件名映射器：把 Cast.on 注册的字符串事件名映射为内部类型
class CastEventNameMapper {
  private static readonly NAMES: string[] = ['serviceDie', 'deviceFound', 'sessionCreate', 'deviceOffline'];
  private static readonly TYPES: CastEventType[] = [CastEventType.SERVICE_DIE, CastEventType.DEVICE_FOUND,
    CastEventType.SESSION_CREATE, CastEventType.DEVICE_OFFLINE];

  public map(eventName: string): CastEventType {
    const index = CastEventNameMapper.NAMES.indexOf(eventName);
    return index < 0 ? CastEventType.UNKNOWN : CastEventNameMapper.TYPES[index];
  }

  public isTerminalEvent(eventName: string): boolean {
    const type = this.map(eventName);
    return type === CastEventType.SERVICE_DIE || type === CastEventType.DEVICE_OFFLINE;
  }

  public getName(type: CastEventType): string {
    const index = CastEventNameMapper.TYPES.indexOf(type);
    return index < 0 ? 'unknown' : CastEventNameMapper.NAMES[index];
  }
}

// 事件总线：维护监听器数量、派发历史与最近一次事件
class CastEventBus {
  private listenerCount: number = 0;
  private history: CastEventType[] = [];
  private lastPayload: CastEventPayload | null = null;
  private droppedCount: number = 0;

  public on(): boolean {
    if (this.listenerCount >= 3) {
      return false;
    }
    this.listenerCount++;
    return true;
  }

  public off(): boolean {
    if (this.listenerCount === 0) {
      return false;
    }
    this.listenerCount--;
    return true;
  }

  public getListenerCount(): number { return this.listenerCount; }

  public emit(type: CastEventType, payload: CastEventPayload): boolean {
    if (this.listenerCount === 0 || !payload.isValid()) {
      this.droppedCount++;
      return false;
    }
    this.history.push(type);
    this.lastPayload = payload;
    return true;
  }

  public getHistory(): CastEventType[] { return [...this.history]; }

  public getLastPayload(): CastEventPayload | null { return this.lastPayload; }

  public getDroppedCount(): number { return this.droppedCount; }

  public countByType(type: CastEventType): number {
    return this.history.filter((item: CastEventType): boolean => item === type).length;
  }

  public clear(): void {
    this.history = [];
    this.lastPayload = null;
    this.droppedCount = 0;
  }
}

// 事件序列校验器：校验时间戳单调递增与事件号是否合法
class EventSequenceValidator {
  private lastTimestamp: number = -1;
  private regressions: number = 0;
  private unknownEventIds: number[] = [];

  public accept(payload: CastEventPayload): boolean {
    if (!EmitterEventIdAllocator.isKnownEvent(payload.eventId)) {
      this.unknownEventIds.push(payload.eventId);
      return false;
    }
    if (payload.timestamp < this.lastTimestamp) {
      this.regressions++;
      return false;
    }
    this.lastTimestamp = payload.timestamp;
    return true;
  }

  public getRegressions(): number { return this.regressions; }

  public getUnknownEventIds(): number[] { return [...this.unknownEventIds]; }

  public getLastTimestamp(): number { return this.lastTimestamp; }

  public isMonotonic(): boolean { return this.regressions === 0; }

  public reset(): void {
    this.lastTimestamp = -1;
    this.regressions = 0;
    this.unknownEventIds = [];
  }
}

// 事件统计器：统计各类事件数量与丢弃率
class EventStatistics {
  private counters: Map<string, number> = new Map<string, number>();
  private total: number = 0;
  private dropped: number = 0;

  public record(type: CastEventType): void {
    const key: string = type;
    const current = this.counters.get(key);
    if (current === undefined) {
      this.counters.set(key, 1);
    } else {
      this.counters.set(key, current + 1);
    }
    this.total++;
  }

  public recordDrop(): void {
    this.dropped++;
    this.total++;
  }

  public getCount(type: CastEventType): number {
    const value = this.counters.get(type);
    return value === undefined ? 0 : value;
  }

  public getTotal(): number {
    return this.total;
  }

  public getDropped(): number { return this.dropped; }

  public getDropRate(): number {
    if (this.total === 0) {
      return 0;
    }
    return this.dropped / this.total;
  }

  public isHealthy(maxDropRate: number): boolean { return this.getDropRate() <= maxDropRate; }

  public clear(): void {
    this.counters.clear();
    this.total = 0;
    this.dropped = 0;
  }
}

// deviceFound 事件解析器：解析 'deviceId|deviceName|type' 形式的上报串
class DeviceFoundEventParser {
  public parse(raw: string): CastEventPayload | null {
    if (raw.length === 0) {
      return null;
    }
    const parts = raw.split('|');
    if (parts.length !== 3) {
      return null;
    }
    const type = parseInt(parts[2], 10);
    if (isNaN(type) || type < 0) {
      return null;
    }
    if (parts[0].length === 0 || parts[1].length === 0) {
      return null;
    }
    return new CastEventPayload(EmitterEventId.PERMISSION_RESULT, parts[0], parts[1], type);
  }

  public serialize(payload: CastEventPayload): string {
    return `${payload.deviceId}|${payload.deviceName}|${payload.timestamp}`;
  }

  public isValidRaw(raw: string): boolean {
    return this.parse(raw) !== null;
  }
}

// 会话事件记录器：串联 sessionCreate 与 deviceOffline，判定会话是否闭环
class SessionEventRecorder {
  private created: string[] = [];
  private offline: string[] = [];

  public recordCreate(deviceId: string): boolean {
    if (this.created.includes(deviceId)) {
      return false;
    }
    this.created.push(deviceId);
    return true;
  }

  public recordOffline(deviceId: string): boolean {
    if (!this.created.includes(deviceId)) {
      return false;
    }
    if (this.offline.includes(deviceId)) {
      return false;
    }
    this.offline.push(deviceId);
    return true;
  }

  public getCreatedCount(): number { return this.created.length; }

  public getOfflineCount(): number { return this.offline.length; }

  public getOpenSessions(): string[] {
    return this.created.filter((item: string): boolean => !this.offline.includes(item));
  }

  public isClosed(deviceId: string): boolean {
    return this.offline.includes(deviceId);
  }

  public isBalanced(): boolean { return this.created.length === this.offline.length; }
}

export default function miracastEventToolValidationSuite(): void {
  describe('MiracastEventToolValidation_Suite', () => {

    beforeAll(async () => {
      Log.info(TAG, 'event tool suite started');
    });

    afterAll(async () => {
      Log.info(TAG, 'event tool suite finished');
    });

    // ===== emitter 事件号 =====
    it('emitter_permission_event_1000_should_be_recognized', 0, async () => {
      expect(EmitterEventIdAllocator.isPermissionEvent(1000)).assertTrue();
      expect(EmitterEventIdAllocator.isPermissionEvent(1001)).assertFalse();
    });

    it('emitter_unknown_event_should_be_rejected', 0, async () => {
      expect(EmitterEventIdAllocator.isKnownEvent(999)).assertFalse();
      expect(EmitterEventIdAllocator.isKnownEvent(1002)).assertFalse();
      expect(EmitterEventIdAllocator.isKnownEvent(1000)).assertTrue();
    });

    it('emitter_offset_range_should_be_bounded', 0, async () => {
      expect(EmitterEventIdAllocator.isValidOffset(0)).assertTrue();
      expect(EmitterEventIdAllocator.isValidOffset(2000)).assertTrue();
      expect(EmitterEventIdAllocator.isValidOffset(2001)).assertFalse();
      expect(EmitterEventIdAllocator.isValidOffset(-1)).assertFalse();
    });

    it('emitter_event_id_should_alternate', 0, async () => {
      expect(EmitterEventIdAllocator.getNextEventId(1000)).assertEqual(1001);
      expect(EmitterEventIdAllocator.getNextEventId(1001)).assertEqual(1000);
      expect(EmitterEventIdAllocator.getNextEventId(5000)).assertEqual(1000);
    });

    // ===== Cast.on 事件名映射 =====
    it('terminal_events_should_be_identified', 0, async () => {
      const mapper = new CastEventNameMapper();
      expect(mapper.isTerminalEvent('serviceDie')).assertTrue();
      expect(mapper.isTerminalEvent('deviceOffline')).assertTrue();
      expect(mapper.isTerminalEvent('deviceFound')).assertFalse();
      expect(mapper.isTerminalEvent('sessionCreate')).assertFalse();
    });

    // ===== 事件总线 =====
    it('event_bus_should_register_and_remove_listener', 0, async () => {
      const bus = new CastEventBus();
      expect(bus.getListenerCount()).assertEqual(0);
      expect(bus.on()).assertTrue();
      expect(bus.getListenerCount()).assertEqual(1);
      expect(bus.off()).assertTrue();
      expect(bus.getListenerCount()).assertEqual(0);
    });

    it('event_bus_listener_count_should_be_capped', 0, async () => {
      const bus = new CastEventBus();
      expect(bus.on()).assertTrue();
      expect(bus.on()).assertTrue();
      expect(bus.on()).assertTrue();
      expect(bus.on()).assertFalse();
      expect(bus.getListenerCount()).assertEqual(3);
    });

    it('event_bus_emit_with_listener_should_record', 0, async () => {
      const bus = new CastEventBus();
      bus.on();
      const payload = new CastEventPayload(1001, 'dev-0001', 'TV1', 1000);
      expect(bus.emit(CastEventType.SESSION_CREATE, payload)).assertTrue();
      expect(bus.getHistory().length).assertEqual(1);
      expect(bus.getLastPayload() === null).assertFalse();
      expect(bus.countByType(CastEventType.SESSION_CREATE)).assertEqual(1);
    });

    it('event_bus_should_reject_invalid_payload', 0, async () => {
      const bus = new CastEventBus();
      bus.on();
      const payload = new CastEventPayload(1001, '', 'TV1', 1000);
      expect(bus.emit(CastEventType.DEVICE_FOUND, payload)).assertFalse();
      expect(bus.getDroppedCount()).assertEqual(1);
    });

    it('event_bus_clear_should_reset_state', 0, async () => {
      const bus = new CastEventBus();
      bus.on();
      bus.emit(CastEventType.SERVICE_DIE, new CastEventPayload(1000, 'dev-0001', 'TV1', 1000));
      bus.clear();
      expect(bus.getHistory().length).assertEqual(0);
      expect(bus.getLastPayload()).assertNull();
      expect(bus.getDroppedCount()).assertEqual(0);
      expect(bus.getListenerCount()).assertEqual(1);
    });

    it('event_payload_should_clone_and_compare', 0, async () => {
      const payload = new CastEventPayload(1001, 'dev-0001', 'TV1', 1000);
      const copy = payload.clone();
      expect(payload.equals(copy)).assertTrue();
      expect(payload.isValid()).assertTrue();
      expect(payload.toString()).assertContain('1001');
    });

    it('event_payload_invalid_negative_timestamp_should_fail', 0, async () => {
      const payload = new CastEventPayload(1001, 'dev-0001', 'TV1', -1);
      expect(payload.isValid()).assertFalse();
      expect(payload.equals(new CastEventPayload(1001, 'dev-0001', 'TV1', 0))).assertFalse();
    });

    // ===== 字节格式化 =====
    // ===== 字符串与时间工具 =====
    // ===== 数值工具 =====
    // ===== 事件序列校验 =====
    it('sequence_validator_should_accept_monotonic_events', 0, async () => {
      const validator = new EventSequenceValidator();
      expect(validator.accept(new CastEventPayload(1000, 'dev-0001', 'TV1', 1000))).assertTrue();
      expect(validator.accept(new CastEventPayload(1001, 'dev-0001', 'TV1', 2000))).assertTrue();
      expect(validator.isMonotonic()).assertTrue();
      expect(validator.getLastTimestamp()).assertEqual(2000);
    });

    it('sequence_validator_should_reject_regression', 0, async () => {
      const validator = new EventSequenceValidator();
      validator.accept(new CastEventPayload(1000, 'dev-0001', 'TV1', 2000));
      expect(validator.accept(new CastEventPayload(1000, 'dev-0001', 'TV1', 1000))).assertFalse();
      expect(validator.getRegressions()).assertEqual(1);
      expect(validator.isMonotonic()).assertFalse();
    });

    it('sequence_validator_should_track_unknown_event_ids', 0, async () => {
      const validator = new EventSequenceValidator();
      expect(validator.accept(new CastEventPayload(2000, 'dev-0001', 'TV1', 1000))).assertFalse();
      expect(validator.getUnknownEventIds().length).assertEqual(1);
      expect(validator.getUnknownEventIds()[0]).assertEqual(2000);
    });

    it('sequence_validator_reset_should_clear_state', 0, async () => {
      const validator = new EventSequenceValidator();
      validator.accept(new CastEventPayload(2000, 'dev-0001', 'TV1', 1000));
      validator.reset();
      expect(validator.getUnknownEventIds().length).assertEqual(0);
      expect(validator.getLastTimestamp()).assertEqual(-1);
      expect(validator.isMonotonic()).assertTrue();
    });

    // ===== 事件统计 =====
    it('event_statistics_should_count_by_type', 0, async () => {
      const stats = new EventStatistics();
      stats.record(CastEventType.DEVICE_FOUND);
      stats.record(CastEventType.DEVICE_FOUND);
      stats.record(CastEventType.SESSION_CREATE);
      expect(stats.getCount(CastEventType.DEVICE_FOUND)).assertEqual(2);
      expect(stats.getCount(CastEventType.SESSION_CREATE)).assertEqual(1);
      expect(stats.getCount(CastEventType.SERVICE_DIE)).assertEqual(0);
      expect(stats.getTotal()).assertEqual(3);
    });

    it('event_statistics_should_compute_drop_rate', 0, async () => {
      const stats = new EventStatistics();
      stats.record(CastEventType.DEVICE_FOUND);
      stats.recordDrop();
      expect(stats.getDropped()).assertEqual(1);
      expect(stats.getDropRate()).assertEqual(0.5);
      expect(stats.isHealthy(0.5)).assertTrue();
      expect(stats.isHealthy(0.1)).assertFalse();
    });

    it('event_statistics_clear_should_reset_counters', 0, async () => {
      const stats = new EventStatistics();
      stats.record(CastEventType.SERVICE_DIE);
      stats.recordDrop();
      stats.clear();
      expect(stats.getTotal()).assertEqual(0);
      expect(stats.getDropped()).assertEqual(0);
      expect(stats.getCount(CastEventType.SERVICE_DIE)).assertEqual(0);
    });

    // ===== deviceFound 解析 =====
    it('device_found_parser_should_parse_valid_raw', 0, async () => {
      const parser = new DeviceFoundEventParser();
      const payload = parser.parse('dev-0001|LivingRoomTV|1');
      expect(payload === null).assertFalse();
      if (payload !== null) {
        expect(payload.deviceId).assertEqual('dev-0001');
        expect(payload.deviceName).assertEqual('LivingRoomTV');
        expect(payload.timestamp).assertEqual(1);
      }
      expect(parser.isValidRaw('dev-0001|LivingRoomTV|1')).assertTrue();
    });

    it('device_found_parser_should_reject_bad_raw', 0, async () => {
      const parser = new DeviceFoundEventParser();
      expect(parser.parse('')).assertNull();
      expect(parser.parse('dev-0001|TV1')).assertNull();
      expect(parser.parse('|TV1|1')).assertNull();
      expect(parser.parse('dev-0001|TV1|x')).assertNull();
    });

    it('device_found_parser_should_serialize_payload', 0, async () => {
      const parser = new DeviceFoundEventParser();
      const payload = new CastEventPayload(1001, 'dev-0001', 'TV1', 3);
      expect(parser.serialize(payload)).assertEqual('dev-0001|TV1|3');
    });

    // ===== 会话事件闭环 =====
    it('session_recorder_should_track_open_sessions', 0, async () => {
      const recorder = new SessionEventRecorder();
      expect(recorder.recordCreate('dev-0001')).assertTrue();
      expect(recorder.recordCreate('dev-0002')).assertTrue();
      expect(recorder.getCreatedCount()).assertEqual(2);
      expect(recorder.getOpenSessions().length).assertEqual(2);
    });

    it('session_recorder_should_close_after_offline', 0, async () => {
      const recorder = new SessionEventRecorder();
      recorder.recordCreate('dev-0001');
      expect(recorder.recordOffline('dev-0001')).assertTrue();
      expect(recorder.isClosed('dev-0001')).assertTrue();
      expect(recorder.getOpenSessions().length).assertEqual(0);
      expect(recorder.isBalanced()).assertTrue();
    });

    it('session_recorder_offline_without_create_should_fail', 0, async () => {
      const recorder = new SessionEventRecorder();
      expect(recorder.recordOffline('dev-0009')).assertFalse();
      expect(recorder.getOfflineCount()).assertEqual(0);
      expect(recorder.isBalanced()).assertTrue();
    });

    it('session_recorder_partial_close_should_not_balance', 0, async () => {
      const recorder = new SessionEventRecorder();
      recorder.recordCreate('dev-0001');
      recorder.recordCreate('dev-0002');
      recorder.recordOffline('dev-0001');
      expect(recorder.isBalanced()).assertFalse();
      expect(recorder.getOpenSessions().length).assertEqual(1);
      expect(recorder.getOpenSessions()[0]).assertEqual('dev-0002');
    });

    // ===== 补充边界用例 =====
    it('mapper_should_round_trip_all_event_names', 0, async () => {
      const mapper = new CastEventNameMapper();
      const names: string[] = ['serviceDie', 'deviceFound', 'sessionCreate', 'deviceOffline'];
      for (let i = 0; i < names.length; i++) {
        const type = mapper.map(names[i]);
        expect(mapper.getName(type)).assertEqual(names[i]);
      }
    });

  });
}
