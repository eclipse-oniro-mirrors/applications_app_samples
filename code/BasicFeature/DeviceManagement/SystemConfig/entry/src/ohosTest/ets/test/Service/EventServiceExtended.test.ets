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
import { describe, it, expect } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { EventService, EventTypeName } from 'library';
import type { EventFilter, EventStatistics, EventHistoryRecord, EventListener } from 'library';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_SystemConfig]';

/**
 * EventListener implementation for testing.
 * ArkTS does not allow untyped object literals.
 */
class TestEventListener implements EventListener {
  callbackCount: number = 0;
  lastEventName: string = '';
  shouldThrow: boolean = false;

  onEvent(eventName: string, _eventData: Record<string, Object>): void {
    if (this.shouldThrow) {
      throw new Error('listener error');
    }
    this.callbackCount++;
    this.lastEventName = eventName;
  }
}

/**
 * EventService extended test suite.
 * Adds coverage for reportDndStateChanged / reportSettingsPageOpened / reportDoubleClickQueried /
 * reportServiceInitialized / addListener / removeListener / getEventHistory(filter) /
 * history overflow / reporting before initialization scenarios.
 */
export default function EventServiceExtendedTest(): void {
  describe('EventServiceExtendedTest', () => {

    // ========================================
    // reportDndStateChanged tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0100
     * @tc.name testEventServiceExtended0001
     * @tc.desc Verify history record is correct after reporting DND state change (dnd=true, notify=true)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0001', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0001: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportDndStateChanged(true, true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.DND_STATE_CHANGED as string);
      expect(history[0].data['dndEnabled']).assertEqual(true);
      expect(history[0].data['notifyAllowed']).assertEqual(true);
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0200
     * @tc.name testEventServiceExtended0002
     * @tc.desc Verify data fields are correct after reporting DND state change (dnd=false, notify=false)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0002', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0002: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportDndStateChanged(false, false);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['dndEnabled']).assertEqual(false);
      expect(history[0].data['notifyAllowed']).assertEqual(false);
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(1);
      service.destroy();
    });

    // ========================================
    // reportSettingsPageOpened tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0300
     * @tc.name testEventServiceExtended0003
     * @tc.desc Verify reporting a successful PIN settings page open event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0003', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0003: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportSettingsPageOpened('pin', true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.SETTINGS_PAGE_OPENED as string);
      expect(history[0].data['pageType']).assertEqual('pin');
      expect(history[0].data['success']).assertEqual(true);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0400
     * @tc.name testEventServiceExtended0004
     * @tc.desc Verify reporting a failed NFC settings page open event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0004', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0004: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportSettingsPageOpened('nfc', false);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['pageType']).assertEqual('nfc');
      expect(history[0].data['success']).assertEqual(false);
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // reportDoubleClickQueried tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0500
     * @tc.name testEventServiceExtended0005
     * @tc.desc Verify the record is correct after reporting a double-click query event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0005', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0005: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportDoubleClickQueried('isSelf');
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.DOUBLE_CLICK_QUERIED as string);
      expect(history[0].data['result']).assertEqual('isSelf');
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // reportServiceInitialized tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0600
     * @tc.name testEventServiceExtended0006
     * @tc.desc Verify the record is correct after reporting a service initialization event
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0006', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0006: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportServiceInitialized('CustomConfigService');
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.SERVICE_INITIALIZED as string);
      expect(history[0].data['serviceName']).assertEqual('CustomConfigService');
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // addListener / removeListener tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0700
     * @tc.name testEventServiceExtended0007
     * @tc.desc Verify reporting an event triggers the callback after adding a listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0007', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0007: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(1);
      expect(listener.lastEventName).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['channelId']).assertEqual('ch-1');
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0800
     * @tc.name testEventServiceExtended0008
     * @tc.desc Verify reporting an event no longer triggers the callback after removing a listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0008', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0008: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(1);
      service.removeListener(listener);
      service.reportChannelFetched('ch-2', true);
      expect(listener.callbackCount).assertEqual(1);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(2);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_0900
     * @tc.name testEventServiceExtended0009
     * @tc.desc Verify adding the same listener repeatedly triggers multiple callbacks per report
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0009', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0009: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(2);
      service.removeListener(listener);
      service.reportChannelFetched('ch-2', true);
      expect(listener.callbackCount).assertEqual(3);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(2);
      expect(history[1].data['channelId']).assertEqual('ch-2');
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1000
     * @tc.name testEventServiceExtended0010
     * @tc.desc Verify removing a listener that was never added does not throw
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0010', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0010: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.removeListener(listener);
      service.reportChannelFetched('ch-1', true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(service.isServiceInitialized()).assertTrue();
      expect(listener.callbackCount).assertEqual(0);
      expect(history[0].name).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      service.destroy();
    });

    // ========================================
    // getEventHistory(filter) filtering tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1100
     * @tc.name testEventServiceExtended0011
     * @tc.desc Verify filtering event history by event type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0011', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0011: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportDndStateChanged(true, false);
      service.reportError('src', 'err', 100);
      const filter: EventFilter = {
        eventTypes: [EventTypeName.CHANNEL_FETCHED, EventTypeName.ERROR_OCCURRED]
      };
      const filtered: EventHistoryRecord[] = service.getEventHistory(filter);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].name).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      expect(filtered[1].name).assertEqual(EventTypeName.ERROR_OCCURRED as string);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1200
     * @tc.name testEventServiceExtended0012
     * @tc.desc Verify filtering event history by time range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0012', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0012: begin');
      const service: EventService = new EventService();
      service.initialize();
      const beforeTime: number = Date.now();
      service.reportChannelFetched('ch-1', true);
      service.reportChannelFetched('ch-2', true);
      service.reportChannelFetched('ch-3', true);
      const afterTime: number = Date.now();
      const filter: EventFilter = { startTime: beforeTime, endTime: afterTime };
      const filtered: EventHistoryRecord[] = service.getEventHistory(filter);
      expect(filtered.length).assertEqual(3);
      expect(filtered[0].time).assertLargerOrEqual(beforeTime);
      expect(filtered[2].time).assertLargerOrEqual(beforeTime);
      const filterFuture: EventFilter = { startTime: afterTime + 10000 };
      const emptyResult: EventHistoryRecord[] = service.getEventHistory(filterFuture);
      expect(emptyResult.length).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1300
     * @tc.name testEventServiceExtended0013
     * @tc.desc Verify filtering by max count returns the latest N records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0013', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0013: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportDndStateChanged(true, false);
      service.reportError('src', 'err', 100);
      service.reportSettingsPageOpened('pin', true);
      service.reportDoubleClickQueried('result');
      const filter: EventFilter = { maxCount: 2 };
      const filtered: EventHistoryRecord[] = service.getEventHistory(filter);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].name).assertEqual(EventTypeName.SETTINGS_PAGE_OPENED as string);
      expect(filtered[1].name).assertEqual(EventTypeName.DOUBLE_CLICK_QUERIED as string);
      const allHistory: EventHistoryRecord[] = service.getEventHistory();
      expect(allHistory.length).assertEqual(5);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1400
     * @tc.name testEventServiceExtended0014
     * @tc.desc Verify an empty filter returns all history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0014', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0014: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportDndStateChanged(false, true);
      const allHistory: EventHistoryRecord[] = service.getEventHistory();
      const filterAll: EventFilter = {};
      const filtered: EventHistoryRecord[] = service.getEventHistory(filterAll);
      expect(filtered.length).assertEqual(allHistory.length);
      expect(filtered.length).assertEqual(2);
      expect(filtered[0].time).assertEqual(allHistory[0].time);
      service.destroy();
    });

    // ========================================
    // History overflow tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1500
     * @tc.name testEventServiceExtended0015
     * @tc.desc Verify history is trimmed after reporting more than MAX_LOG_ENTRIES(200) events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0015', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0015: begin');
      const service: EventService = new EventService();
      service.initialize();
      for (let i: number = 0; i < 210; i++) {
        service.reportChannelFetched(`ch-${i}`, true);
      }
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(200);
      expect(history[0].data['channelId']).assertEqual('ch-10');
      expect(history[199].data['channelId']).assertEqual('ch-209');
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(200);
      service.destroy();
    });

    // ========================================
    // Reporting before initialization tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1600
     * @tc.name testEventServiceExtended0016
     * @tc.desc Verify reporting events directly without initialization is still recorded in history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0016', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0016: begin');
      const service: EventService = new EventService();
      expect(service.isServiceInitialized()).assertFalse();
      service.reportChannelFetched('ch-before-init', true);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].data['channelId']).assertEqual('ch-before-init');
      expect(history[0].time).assertLarger(0);
      service.destroy();
    });

    // ========================================
    // Multi-type event statistics tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1700
     * @tc.name testEventServiceExtended0017
     * @tc.desc Verify statistics are grouped by type after reporting multiple event types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0017', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0017: begin');
      const service: EventService = new EventService();
      service.initialize();
      service.reportChannelFetched('ch-1', true);
      service.reportChannelFetched('ch-2', false);
      service.reportDndStateChanged(true, false);
      service.reportError('src', 'err', 100);
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(4);
      expect(stats.countByType.size).assertEqual(3);
      expect(stats.countByType.get(EventTypeName.CHANNEL_FETCHED as string)).assertEqual(2);
      expect(stats.countByType.get(EventTypeName.DND_STATE_CHANGED as string)).assertEqual(1);
      expect(stats.countByType.get(EventTypeName.ERROR_OCCURRED as string)).assertEqual(1);
      expect(stats.latestTime).assertLargerOrEqual(stats.earliestTime);
      service.destroy();
    });

    // ========================================
    // Listener exception tolerance tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1800
     * @tc.name testEventServiceExtended0018
     * @tc.desc Verify a listener callback throwing does not affect other listeners or the history record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0018', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0018: begin');
      const service: EventService = new EventService();
      service.initialize();
      const badListener: TestEventListener = new TestEventListener();
      badListener.shouldThrow = true;
      const goodListener: TestEventListener = new TestEventListener();
      service.addListener(badListener);
      service.addListener(goodListener);
      service.reportChannelFetched('ch-1', true);
      expect(goodListener.callbackCount).assertEqual(1);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].name).assertEqual(EventTypeName.CHANNEL_FETCHED as string);
      service.destroy();
    });

    // ========================================
    // destroy clears listeners tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_1900
     * @tc.name testEventServiceExtended0019
     * @tc.desc Verify listeners are cleared after destroy and no old listeners remain after re-initialization
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0019', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0019: begin');
      const service: EventService = new EventService();
      service.initialize();
      const listener: TestEventListener = new TestEventListener();
      service.addListener(listener);
      service.reportChannelFetched('ch-1', true);
      expect(listener.callbackCount).assertEqual(1);
      service.destroy();
      service.initialize();
      service.reportChannelFetched('ch-2', true);
      expect(listener.callbackCount).assertEqual(1);
      const history: EventHistoryRecord[] = service.getEventHistory();
      expect(history.length).assertEqual(1);
      service.destroy();
    });

    // ========================================
    // Empty statistics tests
    // ========================================

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_2000
     * @tc.name testEventServiceExtended0020
     * @tc.desc Verify statistics return zero values when there are no events
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testEventServiceExtended0020', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0020: begin');
      const service: EventService = new EventService();
      service.initialize();
      const stats: EventStatistics = service.getStatistics();
      expect(stats.totalCount).assertEqual(0);
      expect(stats.countByType.size).assertEqual(0);
      expect(stats.earliestTime).assertEqual(0);
      expect(stats.latestTime).assertEqual(0);
      service.destroy();
    });

    /**
     * @tc.number SUB_EVENT_SERVICE_EXTENDED_2100
     * @tc.name testEventServiceExtended0021
     * @tc.desc Verify the hiAppEvent reporting counter return contract and invariants
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testEventServiceExtended0021', 0, () => {
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0021: begin');
      const service: EventService = new EventService();
      service.initialize();
      // A new service counter resets to zero and returns a two-element [success, failure] array
      const before: number[] = service.getWriteCounters();
      expect(before.length).assertEqual(2);
      expect(before[0]).assertEqual(0);
      expect(before[1]).assertEqual(0);
      // Trigger 3 event reports (internally via hiAppEvent.write)
      service.reportSettingsPageOpened('pin', true);
      service.reportDoubleClickQueried('isSelf');
      service.reportError('op', 'boom', 100);
      const after: number[] = service.getWriteCounters();
      hilog.info(DOMAIN, TAG, 'testEventServiceExtended0021: success=%{public}d, fail=%{public}d',
        after[0], after[1]);
      expect(after.length).assertEqual(2);
      // write settles as an async microtask and its result depends on the device-side dfx service, so only the counter invariant is checked here: non-negative and not exceeding the number of reported events
      expect(after[0] >= 0).assertTrue();
      expect(after[1] >= 0).assertTrue();
      expect(after[0] + after[1] <= 3).assertTrue();
      service.destroy();
    });
  });
}
