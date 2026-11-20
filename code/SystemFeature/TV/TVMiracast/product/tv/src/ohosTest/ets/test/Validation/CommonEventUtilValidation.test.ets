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
import { Log } from 'library';
import {
  getDriver,
  KEY_BACK,
  miracastComponentCount,
  pressAndWait,
  safeBack,
  waitForPageStable,
  TIMEOUT_PAGE_RENDER,
  DELAY_EMITTER_DISPATCH,
  DELAY_AFTER_SESSION_OP
} from '../Shared/MiracastDriver';

const TAG: string = 'CommonEventUtilSuite';

// Emitter event ids used by the miracast application.
enum MiracastEventId {
  PERMISSION_RESULT = 1000,
  PLAYER_DATA = 1001,
  SETTINGS_CHANGE = 1002,
  DEVICE_CONNECTED = 1003,
  DEVICE_DISCONNECTED = 1004,
  SESSION_STARTED = 1005,
  SESSION_STOPPED = 1006
}

// One emitted event record, mirrors the emitter payload shape.
interface EmitterRecord {
  eventId: number;
  payloadKey: string;
  payloadValue: string;
  numericValue: number;
  timestamp: number;
  source: string;
}

// Sink interface required by the event bus subscribers.
interface EventSink {
  handle(record: EmitterRecord): void;
}

// Subscription entry kept by the event bus.
interface EventSubscription {
  sink: EventSink;
  eventId: number;
  name: string;
}

// Emitter event bus, mirrors the emitter register and send behaviour.
class EmitterEventBus {
  private static instance: EmitterEventBus | null = null;
  private subscriptions: EventSubscription[] = [];
  private history: EmitterRecord[] = [];
  private publishedCount: number = 0;
  private lastDispatchDelay: number = 0;

  public static getInstance(): EmitterEventBus {
    if (EmitterEventBus.instance === null) {
      EmitterEventBus.instance = new EmitterEventBus();
    }
    return EmitterEventBus.instance;
  }

  public subscribe(name: string, eventId: number, sink: EventSink): boolean {
    for (const subscription of this.subscriptions) {
      if (subscription.name === name) {
        return false;
      }
    }
    this.subscriptions.push({ sink: sink, eventId: eventId, name: name });
    return true;
  }

  public unsubscribe(name: string): boolean {
    for (let i: number = 0; i < this.subscriptions.length; i++) {
      if (this.subscriptions[i].name === name) {
        this.subscriptions.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  // Emits one record and dispatches it to every matching subscriber.
  public emit(record: EmitterRecord): void {
    record.timestamp = Date.now();
    this.history.push(record);
    this.publishedCount++;
    for (const subscription of this.subscriptions) {
      if (subscription.eventId === record.eventId) {
        subscription.sink.handle(record);
      }
    }
  }

  // Permission result is delivered through event id 1000.
  public emitPermissionResult(permissionType: number, deviceId: string): EmitterRecord {
    const record: EmitterRecord = {
      eventId: MiracastEventId.PERMISSION_RESULT,
      payloadKey: 'permissionType',
      payloadValue: deviceId,
      numericValue: permissionType,
      timestamp: 0,
      source: 'PermissionWindowManager'
    };
    this.emit(record);
    this.lastDispatchDelay = 0;
    return record;
  }

  // Player data is delivered through event id 1001 with a 500 ms delay.
  public emitPlayerData(deviceId: string, deviceName: string): EmitterRecord {
    const record: EmitterRecord = {
      eventId: MiracastEventId.PLAYER_DATA,
      payloadKey: 'deviceId',
      payloadValue: deviceId.length > 0 ? deviceId : deviceName,
      numericValue: deviceName.length,
      timestamp: 0,
      source: 'TvAbility'
    };
    this.emit(record);
    this.lastDispatchDelay = 500;
    return record;
  }

  public getLastDispatchDelay(): number {
    return this.lastDispatchDelay;
  }

  public getHistory(): EmitterRecord[] {
    const result: EmitterRecord[] = [];
    for (const record of this.history) {
      result.push({
        eventId: record.eventId,
        payloadKey: record.payloadKey,
        payloadValue: record.payloadValue,
        numericValue: record.numericValue,
        timestamp: record.timestamp,
        source: record.source
      });
    }
    return result;
  }

  public getEventsById(eventId: number): EmitterRecord[] {
    const result: EmitterRecord[] = [];
    for (const record of this.history) {
      if (record.eventId === eventId) {
        result.push(record);
      }
    }
    return result;
  }

  public getPublishedCount(): number {
    return this.publishedCount;
  }

  public getSinkCount(): number {
    return this.subscriptions.length;
  }

  public hasSink(name: string): boolean {
    for (const subscription of this.subscriptions) {
      if (subscription.name === name) {
        return true;
      }
    }
    return false;
  }

  public clearHistory(): void {
    this.history = [];
    this.publishedCount = 0;
  }

  public clearSubscriptions(): void {
    this.subscriptions = [];
  }

  public resetBus(): void {
    this.clearHistory();
    this.clearSubscriptions();
    this.lastDispatchDelay = 0;
  }

  public getEventIdStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (const record of this.history) {
      const key: string = String(record.eventId);
      const stored = stats.get(key);
      if (stored === undefined) {
        stats.set(key, 1);
      } else {
        stats.set(key, stored + 1);
      }
    }
    return stats;
  }
}

// Routes the permission result of event id 1000 to a concrete action.
class PermissionResultRouter {
  public static readonly FOREVER: number = 0;
  public static readonly ONCE: number = 1;
  public static readonly CANCEL: number = 2;

  public route(permissionType: number): string {
    if (permissionType === PermissionResultRouter.FOREVER) {
      return 'trust_device';
    }
    if (permissionType === PermissionResultRouter.ONCE) {
      return 'single_session';
    }
    if (permissionType === PermissionResultRouter.CANCEL) {
      return 'cancel';
    }
    return 'unknown';
  }

  // Only the forever permission writes the trusted device list.
  public requiresTrustStore(permissionType: number): boolean {
    return permissionType === PermissionResultRouter.FOREVER;
  }

  public acceptsDevice(permissionType: number): boolean {
    return permissionType === PermissionResultRouter.FOREVER || permissionType === PermissionResultRouter.ONCE;
  }

  public requiresDeviceId(permissionType: number): boolean {
    return permissionType !== PermissionResultRouter.CANCEL;
  }
}

// Dispatches player data of event id 1001 to the player page.
class PlayerDataDispatcher {
  public static readonly DISPATCH_DELAY: number = 500;
  private dispatched: number = 0;
  private lastDeviceId: string = '';

  public isPayloadValid(deviceId: string, deviceName: string): boolean {
    return deviceId.length > 0 && deviceId.length <= 64 && deviceName.length > 0 && deviceName.length <= 23;
  }

  // Duplicate dispatch of the same device is suppressed.
  public dispatch(deviceId: string, deviceName: string): boolean {
    if (!this.isPayloadValid(deviceId, deviceName)) {
      return false;
    }
    if (this.lastDeviceId === deviceId) {
      return false;
    }
    this.lastDeviceId = deviceId;
    this.dispatched++;
    return true;
  }

  public getDispatchedCount(): number {
    return this.dispatched;
  }

  public getDelay(): number {
    return PlayerDataDispatcher.DISPATCH_DELAY;
  }

  public reset(): void {
    this.dispatched = 0;
    this.lastDeviceId = '';
  }
}

// Observes settings changes of the quick play switch and device name.
class SettingsChangeObserver {
  public static readonly QUICK_PLAY_KEY: string = 'settings.wifi.miracast.quickplay';
  public static readonly SYSTEM_NAME_KEY: string = 'persist.castengine.name';
  public static readonly APP_NAME_KEY: string = 'miracastName';
  private changedKeys: string[] = [];

  public isWatchedKey(key: string): boolean {
    return key === SettingsChangeObserver.QUICK_PLAY_KEY || key === SettingsChangeObserver.SYSTEM_NAME_KEY ||
      key === SettingsChangeObserver.APP_NAME_KEY;
  }

  public onSettingsChange(key: string, value: string): boolean {
    if (!this.isWatchedKey(key)) {
      return false;
    }
    if (value.length > 32) {
      return false;
    }
    this.changedKeys.push(key);
    return true;
  }

  public getChangedKeys(): string[] {
    return this.changedKeys;
  }

  public getChangeCount(): number {
    return this.changedKeys.length;
  }

  public clear(): void {
    this.changedKeys = [];
  }

  // The quick play switch is only effective on the Hi3751V352 product.
  public isSwitchOn(value: string, productModel: string): boolean {
    return value === 'true' && productModel === 'Hi3751V352';
  }

  public isSwitchKey(key: string): boolean {
    return key === SettingsChangeObserver.QUICK_PLAY_KEY;
  }
}

// Registry of the event ids that the application listens to.
class EventIdRegistry {
  private ids: number[] = [];

  public register(eventId: number): boolean {
    for (const id of this.ids) {
      if (id === eventId) {
        return false;
      }
    }
    this.ids.push(eventId);
    return true;
  }

  public unregister(eventId: number): boolean {
    for (let i: number = 0; i < this.ids.length; i++) {
      if (this.ids[i] === eventId) {
        this.ids.splice(i, 1);
        return true;
      }
    }
    return false;
  }

  public isRegistered(eventId: number): boolean {
    for (const id of this.ids) {
      if (id === eventId) {
        return true;
      }
    }
    return false;
  }

  public getRegisteredIds(): number[] {
    const copy: number[] = [];
    for (const id of this.ids) {
      copy.push(id);
    }
    return copy;
  }

  public getCount(): number {
    return this.ids.length;
  }

  public clear(): void {
    this.ids = [];
  }
}

// Validates the integrity of an emitted event record.
class EventPayloadValidator {
  public isKnownEventId(eventId: number): boolean {
    return eventId >= 1000 && eventId <= 1006;
  }

  public hasValidTimestamp(record: EmitterRecord): boolean {
    return record.timestamp > 0;
  }

  public hasValidSource(record: EmitterRecord): boolean {
    return record.source.length > 0;
  }

  public hasValidPayload(record: EmitterRecord): boolean {
    return record.payloadKey.length > 0 && record.payloadValue.length > 0;
  }

  public isValidRecord(record: EmitterRecord): boolean {
    return this.isKnownEventId(record.eventId) && this.hasValidTimestamp(record) &&
      this.hasValidSource(record) && this.hasValidPayload(record);
  }
}

// Statistics of emitted events, separated by event id and sink fan out.
class EventStatistics {
  private records: EmitterRecord[] = [];

  public addRecord(record: EmitterRecord): void {
    this.records.push(record);
  }

  public clear(): void {
    this.records = [];
  }

  public getRecordCount(): number {
    return this.records.length;
  }

  public countById(eventId: number): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.eventId === eventId) {
        count++;
      }
    }
    return count;
  }

  public countBySource(source: string): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.source === source) {
        count++;
      }
    }
    return count;
  }

  public getAveragePayloadLength(): number {
    if (this.records.length === 0) {
      return 0;
    }
    let total: number = 0;
    for (const record of this.records) {
      total += record.payloadValue.length;
    }
    return total / this.records.length;
  }

  public getMaxNumericValue(): number {
    let maxValue: number = 0;
    for (const record of this.records) {
      if (record.numericValue > maxValue) {
        maxValue = record.numericValue;
      }
    }
    return maxValue;
  }

  public isPermissionResultPresent(): boolean {
    return this.countById(MiracastEventId.PERMISSION_RESULT) > 0;
  }
}

// Tracks the emission order and detects out of order delivery.
class EventSequenceTracker {
  private sequence: number[] = [];
  private lastTimestamp: number = 0;

  public record(eventId: number, timestamp: number): void {
    this.sequence.push(eventId);
    this.lastTimestamp = timestamp;
  }

  public getSequence(): number[] {
    const copy: number[] = [];
    for (const eventId of this.sequence) {
      copy.push(eventId);
    }
    return copy;
  }

  public getLength(): number {
    return this.sequence.length;
  }

  public getLastTimestamp(): number {
    return this.lastTimestamp;
  }

  // Permission result must always be observed before player data.
  public isPermissionBeforePlayerData(): boolean {
    let permissionIndex: number = -1;
    let playerIndex: number = -1;
    for (let i: number = 0; i < this.sequence.length; i++) {
      if (this.sequence[i] === MiracastEventId.PERMISSION_RESULT && permissionIndex === -1) {
        permissionIndex = i;
      }
      if (this.sequence[i] === MiracastEventId.PLAYER_DATA && playerIndex === -1) {
        playerIndex = i;
      }
    }
    if (permissionIndex === -1 || playerIndex === -1) {
      return false;
    }
    return permissionIndex < playerIndex;
  }

  public clear(): void {
    this.sequence = [];
    this.lastTimestamp = 0;
  }
}

// Counting sink used by the suite to observe dispatches.
class CountingSink implements EventSink {
  private handled: number = 0;
  private lastEventId: number = -1;
  private lastPayload: string = '';

  public handle(record: EmitterRecord): void {
    this.handled++;
    this.lastEventId = record.eventId;
    this.lastPayload = record.payloadValue;
  }

  public getHandledCount(): number {
    return this.handled;
  }

  public getLastEventId(): number {
    return this.lastEventId;
  }

  public getLastPayload(): string {
    return this.lastPayload;
  }

  public reset(): void {
    this.handled = 0;
    this.lastEventId = -1;
    this.lastPayload = '';
  }
}

// Payload budget checker of emitter records, keeps messages below 256 bytes.
class EmitterPayloadBudget {
  public static readonly MAX_PAYLOAD_BYTES: number = 256;

  public estimateBytes(record: EmitterRecord): number {
    return record.payloadKey.length + record.payloadValue.length + record.source.length + 8;
  }

  public isWithinBudget(record: EmitterRecord): boolean {
    return this.estimateBytes(record) <= EmitterPayloadBudget.MAX_PAYLOAD_BYTES;
  }

  public countWithinBudget(records: EmitterRecord[]): number {
    let count: number = 0;
    for (const record of records) {
      if (this.isWithinBudget(record)) {
        count++;
      }
    }
    return count;
  }

  public countOverBudget(records: EmitterRecord[]): number {
    return records.length - this.countWithinBudget(records);
  }

  public getRemainingBudget(record: EmitterRecord): number {
    const remaining: number = EmitterPayloadBudget.MAX_PAYLOAD_BYTES - this.estimateBytes(record);
    return remaining > 0 ? remaining : 0;
  }
}

// Dispatch delay policy of the emitter events used by the miracast pages.
class EmitterDispatchScheduler {
  public getDispatchDelay(eventId: number): number {
    if (eventId === MiracastEventId.PLAYER_DATA) {
      return 500;
    }
    return 0;
  }

  public shouldDispatchImmediately(eventId: number): boolean {
    return this.getDispatchDelay(eventId) === 0;
  }

  public isPlayerDataDeferred(eventId: number): boolean {
    return this.getDispatchDelay(eventId) === 500;
  }

  public getOrderedDispatchIds(): number[] {
    const ids: number[] = [];
    ids.push(MiracastEventId.PERMISSION_RESULT);
    ids.push(MiracastEventId.PLAYER_DATA);
    ids.push(MiracastEventId.SETTINGS_CHANGE);
    return ids;
  }

  public getDelayBudget(ids: number[]): number {
    let total: number = 0;
    for (const id of ids) {
      total += this.getDispatchDelay(id);
    }
    return total;
  }
}

export default function commonEventUtilValidationSuite(): void {
  describe('CommonEventUtilValidation_Suite', () => {
    let driver: Driver;
    let bus: EmitterEventBus;
    let permissionSink: CountingSink;
    let playerSink: CountingSink;

    beforeAll(async () => {
      driver = getDriver();
      bus = EmitterEventBus.getInstance();
      bus.resetBus();
      permissionSink = new CountingSink();
      playerSink = new CountingSink();
      bus.subscribe('permission_sink', MiracastEventId.PERMISSION_RESULT, permissionSink);
      bus.subscribe('player_sink', MiracastEventId.PLAYER_DATA, playerSink);
      Log.info(TAG, 'suite start');
      await waitForPageStable(driver, TIMEOUT_PAGE_RENDER);
    });

    afterAll(async () => {
      await safeBack(driver, 2);
      Log.info(TAG, 'suite end');
    });
    it('event_id_enum_should_expose_expected_numbers', 0, async () => {
      expect(MiracastEventId.PERMISSION_RESULT).assertEqual(1000);
      expect(MiracastEventId.PLAYER_DATA).assertEqual(1001);
      expect(MiracastEventId.SETTINGS_CHANGE).assertEqual(1002);
      expect(MiracastEventId.DEVICE_CONNECTED).assertEqual(1003);
      expect(MiracastEventId.DEVICE_DISCONNECTED).assertEqual(1004);
      expect(MiracastEventId.SESSION_STARTED).assertEqual(1005);
      expect(MiracastEventId.SESSION_STOPPED).assertEqual(1006);
    });

    it('subscription_should_register_sink', 0, async () => {
      bus.resetBus();
      const sink = new CountingSink();
      expect(bus.subscribe('alpha', MiracastEventId.PERMISSION_RESULT, sink)).assertTrue();
      expect(bus.getSinkCount()).assertEqual(1);
      expect(bus.hasSink('alpha')).assertTrue();
      expect(bus.hasSink('beta')).assertFalse();
      expect(permissionSink.getHandledCount()).assertEqual(0);
      expect(playerSink.getHandledCount()).assertEqual(0);
    });

    it('duplicate_subscription_should_be_rejected', 0, async () => {
      bus.resetBus();
      const first = new CountingSink();
      const second = new CountingSink();
      expect(bus.subscribe('dup', MiracastEventId.PERMISSION_RESULT, first)).assertTrue();
      expect(bus.subscribe('dup', MiracastEventId.PLAYER_DATA, second)).assertFalse();
      expect(bus.getSinkCount()).assertEqual(1);
    });

    it('unsubscribe_should_remove_sink', 0, async () => {
      bus.resetBus();
      const sink = new CountingSink();
      bus.subscribe('temp', MiracastEventId.PERMISSION_RESULT, sink);
      expect(bus.unsubscribe('temp')).assertTrue();
      expect(bus.hasSink('temp')).assertFalse();
      expect(bus.getSinkCount()).assertEqual(0);
    });

    it('repeated_unsubscribe_should_return_false', 0, async () => {
      bus.resetBus();
      const sink = new CountingSink();
      bus.subscribe('repeat', MiracastEventId.PERMISSION_RESULT, sink);
      expect(bus.unsubscribe('repeat')).assertTrue();
      expect(bus.unsubscribe('repeat')).assertFalse();
    });

    it('emit_should_dispatch_only_to_matching_sink', 0, async () => {
      bus.resetBus();
      const permissionOnly = new CountingSink();
      const playerOnly = new CountingSink();
      bus.subscribe('permission_only', MiracastEventId.PERMISSION_RESULT, permissionOnly);
      bus.subscribe('player_only', MiracastEventId.PLAYER_DATA, playerOnly);
      bus.emitPermissionResult(0, 'bd12');
      expect(permissionOnly.getHandledCount()).assertEqual(1);
      expect(playerOnly.getHandledCount()).assertEqual(0);
      expect(permissionOnly.getLastEventId()).assertEqual(1000);
    });

    it('emit_should_fan_out_to_all_matching_sinks', 0, async () => {
      bus.resetBus();
      const first = new CountingSink();
      const second = new CountingSink();
      bus.subscribe('fan_a', MiracastEventId.PLAYER_DATA, first);
      bus.subscribe('fan_b', MiracastEventId.PLAYER_DATA, second);
      bus.emitPlayerData('bd12', 'LivingRoomTV');
      expect(first.getHandledCount()).assertEqual(1);
      expect(second.getHandledCount()).assertEqual(1);
      expect(second.getLastPayload()).assertEqual('bd12');
    });

    it('emit_without_sink_should_still_record_history', 0, async () => {
      bus.resetBus();
      bus.emitPermissionResult(1, 'bd34');
      expect(bus.getPublishedCount()).assertEqual(1);
      expect(bus.getHistory().length).assertEqual(1);
      expect(bus.getSinkCount()).assertEqual(0);
      expect(bus.getEventsById(1000).length).assertEqual(1);
    });

    it('history_query_by_id_should_filter_correctly', 0, async () => {
      bus.resetBus();
      bus.emitPermissionResult(0, 'bd12');
      bus.emitPlayerData('bd12', 'LivingRoomTV');
      bus.emitPermissionResult(2, 'bd56');
      expect(bus.getEventsById(1000).length).assertEqual(2);
      expect(bus.getEventsById(1001).length).assertEqual(1);
      expect(bus.getEventsById(1002).length).assertEqual(0);
      expect(bus.getPublishedCount()).assertEqual(3);
    });

    it('history_get_should_return_deep_copy', 0, async () => {
      bus.resetBus();
      bus.emitPermissionResult(1, 'bd12');
      const historyA: EmitterRecord[] = bus.getHistory();
      historyA[0].payloadValue = 'tampered';
      historyA.push({
        eventId: 1001,
        payloadKey: 'fake',
        payloadValue: 'fake',
        numericValue: 0,
        timestamp: 1,
        source: 'fake'
      });
      expect(bus.getHistory().length).assertEqual(1);
      expect(bus.getHistory()[0].payloadValue).assertEqual('bd12');
    });

    it('clear_history_should_keep_subscriptions', 0, async () => {
      bus.resetBus();
      const sink = new CountingSink();
      bus.subscribe('keep', MiracastEventId.PERMISSION_RESULT, sink);
      bus.emitPermissionResult(0, 'bd12');
      expect(bus.getPublishedCount()).assertEqual(1);
      bus.clearHistory();
      expect(bus.getPublishedCount()).assertEqual(0);
      expect(bus.getHistory().length).assertEqual(0);
      expect(bus.getSinkCount()).assertEqual(1);
    });

    it('clear_subscriptions_should_keep_history', 0, async () => {
      bus.resetBus();
      bus.subscribe('gone', MiracastEventId.PERMISSION_RESULT, new CountingSink());
      bus.emitPermissionResult(0, 'bd12');
      bus.clearSubscriptions();
      expect(bus.getSinkCount()).assertEqual(0);
      expect(bus.getPublishedCount()).assertEqual(1);
      expect(bus.hasSink('gone')).assertFalse();
    });

    it('event_id_stats_should_count_per_id', 0, async () => {
      bus.resetBus();
      bus.emitPermissionResult(0, 'bd12');
      bus.emitPermissionResult(1, 'bd34');
      bus.emitPlayerData('bd12', 'LivingRoomTV');
      const stats: Map<string, number> = bus.getEventIdStats();
      expect(stats.get('1000')).assertEqual(2);
      expect(stats.get('1001')).assertEqual(1);
      expect(stats.size).assertEqual(2);
    });

    it('bus_singleton_should_return_same_instance', 0, async () => {
      const first: EmitterEventBus = EmitterEventBus.getInstance();
      const second: EmitterEventBus = EmitterEventBus.getInstance();
      expect(first === second).assertTrue();
      first.resetBus();
      first.emitPermissionResult(0, 'bd12');
      expect(second.getPublishedCount()).assertEqual(1);
    });

    it('permission_forever_should_route_to_trust_store', 0, async () => {
      const router = new PermissionResultRouter();
      expect(router.route(0)).assertEqual('trust_device');
      expect(router.requiresTrustStore(0)).assertTrue();
      expect(router.acceptsDevice(0)).assertTrue();
      expect(router.requiresDeviceId(0)).assertTrue();
    });

    it('permission_once_should_route_to_single_session', 0, async () => {
      const router = new PermissionResultRouter();
      expect(router.route(1)).assertEqual('single_session');
      expect(router.requiresTrustStore(1)).assertFalse();
      expect(router.acceptsDevice(1)).assertTrue();
      expect(router.requiresDeviceId(1)).assertTrue();
    });

    it('permission_cancel_should_route_to_cancel', 0, async () => {
      const router = new PermissionResultRouter();
      expect(router.route(2)).assertEqual('cancel');
      expect(router.acceptsDevice(2)).assertFalse();
      expect(router.requiresTrustStore(2)).assertFalse();
      expect(router.route(7)).assertEqual('unknown');
    });

    it('player_data_dispatch_delay_should_be_500ms', 0, async () => {
      const dispatcher = new PlayerDataDispatcher();
      expect(dispatcher.getDelay()).assertEqual(500);
      expect(dispatcher.getDelay()).assertEqual(DELAY_EMITTER_DISPATCH);
      expect(dispatcher.getDelay()).assertLarger(0);
    });

    it('player_data_duplicate_dispatch_should_be_suppressed', 0, async () => {
      const dispatcher = new PlayerDataDispatcher();
      expect(dispatcher.dispatch('bd12', 'LivingRoomTV')).assertTrue();
      expect(dispatcher.dispatch('bd12', 'LivingRoomTV')).assertFalse();
      expect(dispatcher.getDispatchedCount()).assertEqual(1);
      expect(dispatcher.dispatch('bd34', 'BedroomTV')).assertTrue();
      expect(dispatcher.getDispatchedCount()).assertEqual(2);
    });

    it('player_data_invalid_payload_should_be_rejected', 0, async () => {
      const dispatcher = new PlayerDataDispatcher();
      expect(dispatcher.isPayloadValid('', 'LivingRoomTV')).assertFalse();
      expect(dispatcher.isPayloadValid('bd12', '')).assertFalse();
      expect(dispatcher.isPayloadValid('bd12', 'LivingRoomTV')).assertTrue();
      expect(dispatcher.dispatch('', 'LivingRoomTV')).assertFalse();
    });

    it('player_data_name_over_23_should_be_rejected', 0, async () => {
      const dispatcher = new PlayerDataDispatcher();
      const name23: string = 'abcdefghijklmnopqrstuvw';
      const name24: string = 'abcdefghijklmnopqrstuvwx';
      expect(name23.length).assertEqual(23);
      expect(name24.length).assertEqual(24);
      expect(dispatcher.isPayloadValid('bd12', name23)).assertTrue();
      expect(dispatcher.isPayloadValid('bd12', name24)).assertFalse();
    });

    it('player_data_dispatch_should_reach_sink', 0, async () => {
      bus.resetBus();
      const sink = new CountingSink();
      bus.subscribe('player', MiracastEventId.PLAYER_DATA, sink);
      bus.emitPlayerData('bd12', 'LivingRoomTV');
      expect(sink.getHandledCount()).assertEqual(1);
      expect(sink.getLastEventId()).assertEqual(1001);
      expect(sink.getLastPayload()).assertEqual('bd12');
      expect(bus.getLastDispatchDelay()).assertEqual(500);
    });

    it('dispatcher_reset_should_clear_counters', 0, async () => {
      const dispatcher = new PlayerDataDispatcher();
      dispatcher.dispatch('bd12', 'LivingRoomTV');
      expect(dispatcher.getDispatchedCount()).assertEqual(1);
      dispatcher.reset();
      expect(dispatcher.getDispatchedCount()).assertEqual(0);
      expect(dispatcher.dispatch('bd12', 'LivingRoomTV')).assertTrue();
    });

    it('settings_quick_play_key_should_be_watched', 0, async () => {
      const observer = new SettingsChangeObserver();
      expect(SettingsChangeObserver.QUICK_PLAY_KEY).assertEqual('settings.wifi.miracast.quickplay');
      expect(observer.isWatchedKey('settings.wifi.miracast.quickplay')).assertTrue();
      expect(observer.isWatchedKey('persist.castengine.name')).assertTrue();
      expect(observer.isWatchedKey('miracastName')).assertTrue();
      expect(observer.isWatchedKey('unknown.key')).assertFalse();
      expect(observer.isSwitchKey('settings.wifi.miracast.quickplay')).assertTrue();
    });

    it('settings_change_should_record_watched_key', 0, async () => {
      const observer = new SettingsChangeObserver();
      expect(observer.onSettingsChange('settings.wifi.miracast.quickplay', 'true')).assertTrue();
      expect(observer.onSettingsChange('miracastName', 'LivingRoomTV')).assertTrue();
      expect(observer.getChangeCount()).assertEqual(2);
      expect(observer.getChangedKeys()[0]).assertEqual('settings.wifi.miracast.quickplay');
      expect(observer.getChangedKeys()[1]).assertEqual('miracastName');
    });

    it('settings_change_should_reject_unknown_key', 0, async () => {
      const observer = new SettingsChangeObserver();
      expect(observer.onSettingsChange('other.key', 'true')).assertFalse();
      expect(observer.getChangeCount()).assertEqual(0);
      expect(observer.getChangedKeys().length).assertEqual(0);
    });

    it('settings_change_should_reject_oversized_value', 0, async () => {
      const observer = new SettingsChangeObserver();
      const longValue: string = 'x'.repeat(33);
      expect(longValue.length).assertEqual(33);
      expect(observer.onSettingsChange('persist.castengine.name', longValue)).assertFalse();
      expect(observer.getChangeCount()).assertEqual(0);
      observer.onSettingsChange('persist.castengine.name', 'x'.repeat(32));
      expect(observer.getChangeCount()).assertEqual(1);
    });

    it('quick_play_switch_should_only_work_on_supported_product', 0, async () => {
      const observer = new SettingsChangeObserver();
      expect(observer.isSwitchOn('true', 'Hi3751V352')).assertTrue();
      expect(observer.isSwitchOn('true', 'Hi3751V350')).assertFalse();
      expect(observer.isSwitchOn('false', 'Hi3751V352')).assertFalse();
      expect(observer.isSwitchOn('1', 'Hi3751V352')).assertFalse();
    });

    it('settings_clear_should_reset_changes', 0, async () => {
      const observer = new SettingsChangeObserver();
      observer.onSettingsChange('miracastName', 'TV1');
      expect(observer.getChangeCount()).assertEqual(1);
      observer.clear();
      expect(observer.getChangeCount()).assertEqual(0);
      expect(observer.getChangedKeys().length).assertEqual(0);
    });
    it('registry_should_reject_duplicate_event_id', 0, async () => {
      const registry = new EventIdRegistry();
      expect(registry.register(1000)).assertTrue();
      expect(registry.register(1000)).assertFalse();
      expect(registry.register(1001)).assertTrue();
      expect(registry.getCount()).assertEqual(2);
      expect(registry.isRegistered(1000)).assertTrue();
      expect(registry.isRegistered(1002)).assertFalse();
    });

    it('registry_unregister_should_remove_id', 0, async () => {
      const registry = new EventIdRegistry();
      registry.register(1000);
      registry.register(1001);
      expect(registry.unregister(1000)).assertTrue();
      expect(registry.unregister(1000)).assertFalse();
      expect(registry.getCount()).assertEqual(1);
      expect(registry.getRegisteredIds()[0]).assertEqual(1001);
    });

    it('registry_ids_get_should_return_copy', 0, async () => {
      const registry = new EventIdRegistry();
      registry.register(1000);
      const idsA: number[] = registry.getRegisteredIds();
      idsA.push(9999);
      expect(registry.getCount()).assertEqual(1);
      expect(registry.getRegisteredIds().length).assertEqual(1);
    });

    it('registry_boundary_ids_should_validate', 0, async () => {
      const validator = new EventPayloadValidator();
      expect(validator.isKnownEventId(1000)).assertTrue();
      expect(validator.isKnownEventId(1006)).assertTrue();
      expect(validator.isKnownEventId(999)).assertFalse();
      expect(validator.isKnownEventId(1007)).assertFalse();
    });

    it('payload_validator_should_accept_valid_record', 0, async () => {
      const validator = new EventPayloadValidator();
      const record: EmitterRecord = {
        eventId: 1000,
        payloadKey: 'permissionType',
        payloadValue: 'bd12',
        numericValue: 0,
        timestamp: Date.now(),
        source: 'PermissionWindowManager'
      };
      expect(validator.isValidRecord(record)).assertTrue();
    });

    it('payload_validator_should_reject_zero_timestamp', 0, async () => {
      const validator = new EventPayloadValidator();
      const record: EmitterRecord = {
        eventId: 1000,
        payloadKey: 'permissionType',
        payloadValue: 'bd12',
        numericValue: 0,
        timestamp: 0,
        source: 'PermissionWindowManager'
      };
      expect(validator.hasValidTimestamp(record)).assertFalse();
      expect(validator.isValidRecord(record)).assertFalse();
    });

    it('payload_validator_should_reject_empty_payload', 0, async () => {
      const validator = new EventPayloadValidator();
      const record: EmitterRecord = {
        eventId: 1001,
        payloadKey: '',
        payloadValue: '',
        numericValue: 0,
        timestamp: Date.now(),
        source: 'TvAbility'
      };
      expect(validator.hasValidPayload(record)).assertFalse();
      expect(validator.isValidRecord(record)).assertFalse();
    });

    it('payload_validator_should_reject_unknown_event_id', 0, async () => {
      const validator = new EventPayloadValidator();
      const record: EmitterRecord = {
        eventId: 2000,
        payloadKey: 'key',
        payloadValue: 'value',
        numericValue: 1,
        timestamp: Date.now(),
        source: 'TvAbility'
      };
      expect(validator.isKnownEventId(2000)).assertFalse();
      expect(validator.isValidRecord(record)).assertFalse();
    });

    it('statistics_should_count_by_id_and_source', 0, async () => {
      const stats = new EventStatistics();
      stats.addRecord({
        eventId: 1000,
        payloadKey: 'permissionType',
        payloadValue: 'bd12',
        numericValue: 0,
        timestamp: 1,
        source: 'PermissionWindowManager'
      });
      stats.addRecord({
        eventId: 1001,
        payloadKey: 'deviceId',
        payloadValue: 'bd12',
        numericValue: 4,
        timestamp: 2,
        source: 'TvAbility'
      });
      stats.addRecord({
        eventId: 1001,
        payloadKey: 'deviceId',
        payloadValue: 'bd34',
        numericValue: 4,
        timestamp: 3,
        source: 'TvAbility'
      });
      expect(stats.getRecordCount()).assertEqual(3);
      expect(stats.countById(1001)).assertEqual(2);
      expect(stats.countBySource('TvAbility')).assertEqual(2);
      expect(stats.isPermissionResultPresent()).assertTrue();
      expect(stats.getMaxNumericValue()).assertEqual(4);
      expect(stats.getAveragePayloadLength()).assertEqual(4);
    });
    it('statistics_empty_should_be_zero', 0, async () => {
      const stats = new EventStatistics();
      expect(stats.getRecordCount()).assertEqual(0);
      expect(stats.countById(1000)).assertEqual(0);
      expect(stats.countBySource('TvAbility')).assertEqual(0);
      expect(stats.getAveragePayloadLength()).assertEqual(0);
      expect(stats.getMaxNumericValue()).assertEqual(0);
      expect(stats.isPermissionResultPresent()).assertFalse();
      stats.clear();
      expect(stats.getRecordCount()).assertEqual(0);
    });

    it('sequence_should_detect_permission_before_player', 0, async () => {
      const tracker = new EventSequenceTracker();
      tracker.record(1000, 10);
      tracker.record(1001, 20);
      expect(tracker.getLength()).assertEqual(2);
      expect(tracker.getSequence()[0]).assertEqual(1000);
      expect(tracker.getLastTimestamp()).assertEqual(20);
      expect(tracker.isPermissionBeforePlayerData()).assertTrue();
    });

    it('sequence_should_reject_reversed_order', 0, async () => {
      const tracker = new EventSequenceTracker();
      tracker.record(1001, 10);
      tracker.record(1000, 20);
      expect(tracker.isPermissionBeforePlayerData()).assertFalse();
      expect(tracker.getSequence()[1]).assertEqual(1000);
    });

    it('sequence_get_should_return_copy', 0, async () => {
      const tracker = new EventSequenceTracker();
      tracker.record(1000, 10);
      const sequenceA: number[] = tracker.getSequence();
      sequenceA.push(1001);
      expect(tracker.getLength()).assertEqual(1);
      expect(tracker.getSequence().length).assertEqual(1);
    });

    it('permission_then_player_flow_should_reach_both_sinks', 0, async () => {
      bus.resetBus();
      const localPermission = new CountingSink();
      const localPlayer = new CountingSink();
      bus.subscribe('flow_permission', MiracastEventId.PERMISSION_RESULT, localPermission);
      bus.subscribe('flow_player', MiracastEventId.PLAYER_DATA, localPlayer);
      bus.emitPermissionResult(0, 'bd12');
      bus.emitPlayerData('bd12', 'LivingRoomTV');
      expect(localPermission.getHandledCount()).assertEqual(1);
      expect(localPlayer.getHandledCount()).assertEqual(1);
      expect(localPermission.getLastEventId()).assertEqual(1000);
      expect(localPlayer.getLastEventId()).assertEqual(1001);
      expect(bus.getPublishedCount()).assertEqual(2);
    });

    it('event_bus_reset_should_restore_clean_state', 0, async () => {
      bus.resetBus();
      bus.subscribe('reset_sink', MiracastEventId.PERMISSION_RESULT, new CountingSink());
      bus.emitPermissionResult(0, 'bd12');
      bus.resetBus();
      expect(bus.getPublishedCount()).assertEqual(0);
      expect(bus.getSinkCount()).assertEqual(0);
      expect(bus.getHistory().length).assertEqual(0);
      expect(bus.getLastDispatchDelay()).assertEqual(0);
      expect(bus.getEventIdStats().size).assertEqual(0);
      expect(bus.hasSink('reset_sink')).assertFalse();
      expect(bus.getEventsById(1000).length).assertEqual(0);
    });

    it('permission_result_high_volume_should_be_stable', 0, async () => {
      bus.resetBus();
      const sink = new CountingSink();
      bus.subscribe('volume', MiracastEventId.PERMISSION_RESULT, sink);
      const startedAt: number = Date.now();
      for (let i: number = 0; i < 200; i++) {
        bus.emitPermissionResult(i % 3, 'bd' + String(i));
      }
      const elapsed: number = Date.now() - startedAt;
      expect(elapsed).assertLessOrEqual(2000);
      expect(sink.getHandledCount()).assertEqual(200);
      expect(bus.getPublishedCount()).assertEqual(200);
      expect(bus.getEventsById(1000).length).assertEqual(200);
    });

    it('settings_change_event_should_use_event_id_1002', 0, async () => {
      bus.resetBus();
      const record: EmitterRecord = {
        eventId: MiracastEventId.SETTINGS_CHANGE,
        payloadKey: 'settings.wifi.miracast.quickplay',
        payloadValue: 'true',
        numericValue: 1,
        timestamp: 0,
        source: 'SettingsObserver'
      };
      bus.emit(record);
      expect(bus.getEventsById(1002).length).assertEqual(1);
      expect(bus.getHistory()[0].payloadKey).assertEqual('settings.wifi.miracast.quickplay');
      expect(bus.getEventIdStats().get('1002')).assertEqual(1);
    });


    it('event_system_should_unsubscribe_before_back', 0, async () => {
      bus.resetBus();
      bus.subscribe('cleanup', MiracastEventId.PLAYER_DATA, new CountingSink());
      expect(bus.getSinkCount()).assertEqual(1);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_AFTER_SESSION_OP);
      bus.unsubscribe('cleanup');
      expect(bus.getSinkCount()).assertEqual(0);
      expect(bus.hasSink('cleanup')).assertFalse();
    });

    it('comprehensive_event_flow_should_deliver_expected_ids', 0, async () => {
      bus.resetBus();
      const permissionLocal = new CountingSink();
      const playerLocal = new CountingSink();
      bus.subscribe('comp_permission', MiracastEventId.PERMISSION_RESULT, permissionLocal);
      bus.subscribe('comp_player', MiracastEventId.PLAYER_DATA, playerLocal);
      const tracker = new EventSequenceTracker();
      bus.emitPermissionResult(0, 'bd12');
      tracker.record(MiracastEventId.PERMISSION_RESULT, Date.now());
      bus.emitPlayerData('bd12', 'LivingRoomTV');
      tracker.record(MiracastEventId.PLAYER_DATA, Date.now());
      bus.emit({
        eventId: MiracastEventId.SETTINGS_CHANGE,
        payloadKey: 'settings.wifi.miracast.quickplay',
        payloadValue: 'true',
        numericValue: 1,
        timestamp: 0,
        source: 'SettingsObserver'
      });
      tracker.record(MiracastEventId.SETTINGS_CHANGE, Date.now());
      expect(bus.getPublishedCount()).assertEqual(3);
      expect(permissionLocal.getHandledCount()).assertEqual(1);
      expect(playerLocal.getHandledCount()).assertEqual(1);
      expect(tracker.getLength()).assertEqual(3);
      expect(tracker.isPermissionBeforePlayerData()).assertTrue();
      expect(bus.getEventIdStats().size).assertEqual(3);
    });
    it('permission_cancel_should_not_touch_trust_store', 0, async () => {
      const router = new PermissionResultRouter();
      bus.resetBus();
      const record: EmitterRecord = bus.emitPermissionResult(PermissionResultRouter.CANCEL, 'bd12');
      expect(record.numericValue).assertEqual(2);
      expect(router.route(record.numericValue)).assertEqual('cancel');
      expect(router.requiresTrustStore(record.numericValue)).assertFalse();
      expect(bus.getEventsById(1000).length).assertEqual(1);
    });

    it('player_data_max_device_id_should_be_accepted', 0, async () => {
      const dispatcher = new PlayerDataDispatcher();
      const maxId: string = 'a'.repeat(64);
      expect(maxId.length).assertEqual(64);
      expect(dispatcher.isPayloadValid(maxId, 'LivingRoomTV')).assertTrue();
      expect(dispatcher.isPayloadValid('a'.repeat(65), 'LivingRoomTV')).assertFalse();
    });

    it('settings_system_name_key_should_be_persisted', 0, async () => {
      const observer = new SettingsChangeObserver();
      expect(SettingsChangeObserver.SYSTEM_NAME_KEY).assertEqual('persist.castengine.name');
      expect(SettingsChangeObserver.APP_NAME_KEY).assertEqual('miracastName');
      expect(observer.onSettingsChange('persist.castengine.name', 'TV')).assertTrue();
      expect(observer.getChangedKeys()[0]).assertEqual('persist.castengine.name');
    });

    it('multiple_sinks_on_same_id_should_all_receive', 0, async () => {
      bus.resetBus();
      const first = new CountingSink();
      const second = new CountingSink();
      bus.subscribe('same_a', MiracastEventId.SETTINGS_CHANGE, first);
      bus.subscribe('same_b', MiracastEventId.SETTINGS_CHANGE, second);
      bus.emit({
        eventId: MiracastEventId.SETTINGS_CHANGE,
        payloadKey: 'miracastName',
        payloadValue: 'TV',
        numericValue: 2,
        timestamp: 0,
        source: 'Index'
      });
      expect(first.getHandledCount()).assertEqual(1);
      expect(second.getHandledCount()).assertEqual(1);
      expect(bus.getSinkCount()).assertEqual(2);
    });

    it('statistics_clear_should_reset_all_counters', 0, async () => {
      const stats = new EventStatistics();
      stats.addRecord({
        eventId: 1000,
        payloadKey: 'permissionType',
        payloadValue: 'bd12',
        numericValue: 0,
        timestamp: 1,
        source: 'PermissionWindowManager'
      });
      expect(stats.getRecordCount()).assertEqual(1);
      stats.clear();
      expect(stats.getRecordCount()).assertEqual(0);
      expect(stats.countById(1000)).assertEqual(0);
      expect(stats.getAveragePayloadLength()).assertEqual(0);
    });

    it('counting_sink_should_capture_last_payload', 0, async () => {
      const sink = new CountingSink();
      bus.resetBus();
      bus.subscribe('payload_sink', MiracastEventId.PERMISSION_RESULT, sink);
      bus.emitPermissionResult(0, 'bd12');
      expect(sink.getLastPayload()).assertEqual('bd12');
      bus.emitPermissionResult(1, 'bd34');
      expect(sink.getLastPayload()).assertEqual('bd34');
      expect(sink.getHandledCount()).assertEqual(2);
    });

    it('registry_should_accept_after_clear', 0, async () => {
      const registry = new EventIdRegistry();
      registry.register(1000);
      registry.clear();
      expect(registry.register(1000)).assertTrue();
      expect(registry.getCount()).assertEqual(1);
      expect(registry.isRegistered(1000)).assertTrue();
    });

    it('sequence_after_clear_should_start_fresh', 0, async () => {
      const tracker = new EventSequenceTracker();
      tracker.record(1000, 5);
      tracker.record(1001, 6);
      expect(tracker.isPermissionBeforePlayerData()).assertTrue();
      tracker.clear();
      expect(tracker.getLength()).assertEqual(0);
      expect(tracker.isPermissionBeforePlayerData()).assertFalse();
    });

    it('player_data_high_volume_should_keep_unique_ids', 0, async () => {
      const dispatcher = new PlayerDataDispatcher();
      let accepted: number = 0;
      for (let i: number = 0; i < 100; i++) {
        if (dispatcher.dispatch('bd' + String(i), 'TV' + String(i))) {
          accepted++;
        }
      }
      expect(accepted).assertEqual(100);
      expect(dispatcher.getDispatchedCount()).assertEqual(100);
      dispatcher.dispatch('dup-id', 'TV1');
      expect(dispatcher.dispatch('dup-id', 'TV1')).assertFalse();
    });

    it('session_stop_event_should_follow_session_start', 0, async () => {
      const tracker = new EventSequenceTracker();
      tracker.record(MiracastEventId.SESSION_STARTED, 100);
      tracker.record(MiracastEventId.SESSION_STOPPED, 200);
      expect(tracker.getLength()).assertEqual(2);
      expect(tracker.getLastTimestamp()).assertEqual(200);
      expect(tracker.getSequence()[0]).assertEqual(1005);
      expect(tracker.getSequence()[1]).assertEqual(1006);
    });

    it('payload_budget_should_keep_records_within_256_bytes', 0, async () => {
      const budget = new EmitterPayloadBudget();
      const small: EmitterRecord = {
        eventId: 1000,
        payloadKey: 'permissionType',
        payloadValue: 'bd12',
        numericValue: 0,
        timestamp: 1,
        source: 'PermissionWindowManager'
      };
      const large: EmitterRecord = {
        eventId: 1001,
        payloadKey: 'deviceName',
        payloadValue: 'x'.repeat(300),
        numericValue: 4,
        timestamp: 1,
        source: 'TvAbility'
      };
      expect(budget.isWithinBudget(small)).assertTrue();
      expect(budget.isWithinBudget(large)).assertFalse();
      expect(budget.countWithinBudget([small, large])).assertEqual(1);
      expect(budget.countOverBudget([small, large])).assertEqual(1);
      expect(budget.getRemainingBudget(small)).assertLarger(0);
      expect(budget.getRemainingBudget(large)).assertEqual(0);
    });

    it('dispatch_scheduler_should_defer_player_data_only', 0, async () => {
      const scheduler = new EmitterDispatchScheduler();
      expect(scheduler.getDispatchDelay(MiracastEventId.PERMISSION_RESULT)).assertEqual(0);
      expect(scheduler.getDispatchDelay(MiracastEventId.PLAYER_DATA)).assertEqual(500);
      expect(scheduler.getDispatchDelay(MiracastEventId.SETTINGS_CHANGE)).assertEqual(0);
      expect(scheduler.shouldDispatchImmediately(MiracastEventId.PERMISSION_RESULT)).assertTrue();
      expect(scheduler.isPlayerDataDeferred(MiracastEventId.PLAYER_DATA)).assertTrue();
      expect(scheduler.getOrderedDispatchIds().length).assertEqual(3);
      expect(scheduler.getDelayBudget(scheduler.getOrderedDispatchIds())).assertEqual(500);
    });
  });
}
