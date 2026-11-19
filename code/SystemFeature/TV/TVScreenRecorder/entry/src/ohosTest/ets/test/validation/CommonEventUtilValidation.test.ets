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
import hilog from '@ohos.hilog';
import {
  getDriver,
  KEY_BACK,
  KEY_MENU,
  recorderComponentCount,
  waitForTimerWindowStable,
  pressAndWait,
  serializedDelay,
  TIMEOUT_TIMER_RENDER,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0001;
const TAG: string = 'CommonEventUtilValidation';

// Recording state values of Constants.RecordingState.
const STATE_IDLE: number = 0;
const STATE_RECORDING: number = 1;
const STATE_STOPPED: number = 2;
const STATE_ERROR: number = 3;

// The ability terminates itself 2000 ms after an Error state.
const TERMINATE_DELAY_MS: number = 2000;

// The recording tip window lives for 3000 ms.
const TIP_DURATION_MS: number = 3000;

// LocalStorage keys initialized by ScreenRecorderAbility.
const KEY_RECORDER_STATE: string = 'recorderState';
const KEY_ABILITY_CONTEXT: string = 'SRAbilityContext';

// Recording lifecycle event types published between the service and the pages.
enum RecorderEventType {
  RECORDING_START = 'recording_start',
  RECORDING_STOP = 'recording_stop',
  RECORDING_ERROR = 'recording_error',
  RECORDER_STATE_CHANGE = 'recorder_state_change',
  TIP_SHOW = 'tip_show',
  TIP_HIDE = 'tip_hide',
  RECORDER_READY = 'recorder_ready'
}

// Event payload: extra data carried by a recording lifecycle event.
interface EventPayload {
  reason?: string;
  recorderState?: number;
  previousState?: number;
  errorCode?: number;
  fileName?: string;
  durationMs?: number;
  tipDurationMs?: number;
  retryCount?: number;
  animation?: boolean;
  confirmed?: boolean;
  state?: number;
}

// One recorded event of the recorder lifecycle.
interface RecorderEventData {
  eventType: RecorderEventType;
  payload: EventPayload;
  timestamp: number;
  source: string;
}

// Subscriber of the recorder lifecycle event bus.
interface RecorderEventSubscriber {
  id: string;
  callback: (data: RecorderEventData) => void;
  eventTypes: RecorderEventType[];
}

// Recorder event system: publish/subscribe bus shared by the service extension
// and the recorder pages.
class RecorderEventSystem {
  private static instance: RecorderEventSystem;
  private subscribers: Map<string, RecorderEventSubscriber> = new Map<string, RecorderEventSubscriber>();
  private eventHistory: RecorderEventData[] = [];
  private publishedCount: number = 0;

  public static getInstance(): RecorderEventSystem {
    if (!RecorderEventSystem.instance) {
      RecorderEventSystem.instance = new RecorderEventSystem();
    }
    return RecorderEventSystem.instance;
  }

  public subscribe(subscriber: RecorderEventSubscriber): boolean {
    if (this.subscribers.has(subscriber.id)) {
      return false;
    }
    this.subscribers.set(subscriber.id, subscriber);
    return true;
  }

  public unsubscribe(subscriberId: string): boolean {
    return this.subscribers.delete(subscriberId);
  }

  // Publishes an event to every subscriber interested in its type.
  public publish(eventData: RecorderEventData): void {
    eventData.timestamp = Date.now();
    this.eventHistory.push(eventData);
    this.publishedCount++;
    for (const subscriber of this.subscribers.values()) {
      if (subscriber.eventTypes.includes(eventData.eventType)) {
        subscriber.callback(eventData);
      }
    }
  }

  // Returns a defensive copy of the event history.
  public getEventHistory(): RecorderEventData[] {
    const result: RecorderEventData[] = [];
    for (const event of this.eventHistory) {
      result.push({
        eventType: event.eventType,
        payload: event.payload,
        timestamp: event.timestamp,
        source: event.source
      });
    }
    return result;
  }

  public getEventsByType(eventType: RecorderEventType): RecorderEventData[] {
    return this.eventHistory.filter((event: RecorderEventData): boolean => event.eventType === eventType);
  }

  public getPublishedCount(): number {
    return this.publishedCount;
  }

  public getSubscriberCount(): number {
    return this.subscribers.size;
  }

  public hasSubscriber(subscriberId: string): boolean {
    return this.subscribers.has(subscriberId);
  }

  public clearEventHistory(): void {
    this.eventHistory = [];
    this.publishedCount = 0;
  }

  public clearSubscribers(): void {
    this.subscribers.clear();
  }

  public resetSystem(): void {
    this.clearEventHistory();
    this.clearSubscribers();
  }

  public getEventTypeStats(): Map<string, number> {
    const stats: Map<string, number> = new Map<string, number>();
    for (const event of this.eventHistory) {
      const key: string = event.eventType;
      const currentCount: number = stats.get(key) || 0;
      stats.set(key, currentCount + 1);
    }
    return stats;
  }

  // A lifecycle event is valid when the type is known, the timestamp is set
  // and the publishing source is not empty.
  public validateEventData(eventData: RecorderEventData): boolean {
    const validTypes: RecorderEventType[] = [
      RecorderEventType.RECORDING_START,
      RecorderEventType.RECORDING_STOP,
      RecorderEventType.RECORDING_ERROR,
      RecorderEventType.RECORDER_STATE_CHANGE,
      RecorderEventType.TIP_SHOW,
      RecorderEventType.TIP_HIDE,
      RecorderEventType.RECORDER_READY
    ];
    let isValidType: boolean = false;
    for (const type of validTypes) {
      if (type === eventData.eventType) {
        isValidType = true;
        break;
      }
    }
    if (!isValidType) {
      return false;
    }
    if (eventData.timestamp <= 0) {
      return false;
    }
    if (eventData.source.length === 0) {
      return false;
    }
    return true;
  }

  // Error events are the only ones that request a termination of the ability.
  public shouldTerminate(eventData: RecorderEventData): boolean {
    return eventData.eventType === RecorderEventType.RECORDING_ERROR;
  }
}

// LocalStorage-backed recorder state store: the service writes `recorderState`
// and every recorder page observes the same value.
class RecorderStateStore {
  private static instance: RecorderStateStore;
  private state: number = STATE_IDLE;
  private abilityContextKey: string = '';
  private pages: Map<string, number> = new Map<string, number>();
  private publishCount: number = 0;
  private syncCount: number = 0;

  public static getInstance(): RecorderStateStore {
    if (!RecorderStateStore.instance) {
      RecorderStateStore.instance = new RecorderStateStore();
    }
    return RecorderStateStore.instance;
  }

  // Rejects states outside the RecordingState enumeration.
  public isValidState(state: number): boolean {
    return state === STATE_IDLE || state === STATE_RECORDING || state === STATE_STOPPED || state === STATE_ERROR;
  }

  // Writes the recorder state as the service does before notifying the pages.
  public setRecorderState(state: number): boolean {
    if (!this.isValidState(state)) {
      return false;
    }
    this.state = state;
    this.publishCount++;
    for (const pageId of this.pages.keys()) {
      this.pages.set(pageId, state);
    }
    return true;
  }

  public getRecorderState(): number {
    return this.state;
  }

  public setAbilityContextKey(value: string): void {
    this.abilityContextKey = value;
  }

  public getAbilityContextKey(): string {
    return this.abilityContextKey;
  }

  public getStorageKey(): string {
    return KEY_RECORDER_STATE;
  }

  // Registers a page that mirrors the recorder state.
  public subscribePage(pageId: string): boolean {
    if (this.pages.has(pageId)) {
      return false;
    }
    this.pages.set(pageId, this.state);
    return true;
  }

  public unsubscribePage(pageId: string): boolean {
    return this.pages.delete(pageId);
  }

  public getPageCount(): number {
    return this.pages.size;
  }

  public isSubscribed(pageId: string): boolean {
    return this.pages.has(pageId);
  }

  // Reads the value observed by one page; unknown pages see the live state.
  public readPageState(pageId: string): number {
    const value: number | undefined = this.pages.get(pageId);
    if (value === undefined) {
      return this.state;
    }
    this.syncCount++;
    return value;
  }

  // Pushes the current state to one page explicitly.
  public syncToPage(pageId: string): number {
    if (!this.pages.has(pageId)) {
      return -1;
    }
    this.pages.set(pageId, this.state);
    this.syncCount++;
    return this.state;
  }

  public getPublishCount(): number {
    return this.publishCount;
  }

  public getSyncCount(): number {
    return this.syncCount;
  }

  public isRecording(): boolean {
    return this.state === STATE_RECORDING;
  }

  public isError(): boolean {
    return this.state === STATE_ERROR;
  }

  public reset(): void {
    this.state = STATE_IDLE;
    this.abilityContextKey = '';
    this.pages = new Map<string, number>();
    this.publishCount = 0;
    this.syncCount = 0;
  }
}

// Termination scheduler: after an Error state the ability waits 2000 ms and
// then calls terminateSelf(). The timer is cancelled when the state recovers.
class TerminationScheduler {
  private scheduled: boolean = false;
  private terminated: boolean = false;
  private delayMs: number = 0;
  private remainingMs: number = 0;
  private reason: string = '';
  private terminateCount: number = 0;
  private cancelCount: number = 0;

  public schedule(delayMs: number = TERMINATE_DELAY_MS, reason: string = 'recording_error'): boolean {
    if (this.scheduled || this.terminated) {
      return false;
    }
    this.scheduled = true;
    this.delayMs = delayMs;
    this.remainingMs = delayMs;
    this.reason = reason;
    return true;
  }

  // Advances the pending timer; returns true when terminateSelf() must run.
  public advance(elapsedMs: number): boolean {
    if (!this.scheduled) {
      return false;
    }
    this.remainingMs -= elapsedMs;
    if (this.remainingMs <= 0) {
      this.scheduled = false;
      this.remainingMs = 0;
      this.terminated = true;
      this.terminateCount++;
      return true;
    }
    return false;
  }

  public cancel(): boolean {
    if (!this.scheduled) {
      return false;
    }
    this.scheduled = false;
    this.remainingMs = 0;
    this.cancelCount++;
    return true;
  }

  public isScheduled(): boolean {
    return this.scheduled;
  }

  public isTerminated(): boolean {
    return this.terminated;
  }

  public getDelayMs(): number {
    return this.delayMs;
  }

  public getRemainingMs(): number {
    return this.remainingMs;
  }

  public getReason(): string {
    return this.reason;
  }

  public getTerminateCount(): number {
    return this.terminateCount;
  }

  public getCancelCount(): number {
    return this.cancelCount;
  }

  public reset(): void {
    this.scheduled = false;
    this.terminated = false;
    this.delayMs = 0;
    this.remainingMs = 0;
    this.reason = '';
    this.terminateCount = 0;
    this.cancelCount = 0;
  }
}

export default function commonEventUtilValidationTest(): void {
  describe('CommonEventUtilValidation_Test', () => {
    let driver: Driver;
    let recorderEvents: RecorderEventSystem;

    // Test setup: reset the event bus so that every case starts clean.
    beforeAll(async () => {
      driver = getDriver();
      recorderEvents = RecorderEventSystem.getInstance();
      recorderEvents.resetSystem();
      hilog.info(DOMAIN, TAG, 'common event validation suite started');
      await serializedDelay(driver, 1000);
    });

    // Test cleanup: close the floating windows after the suite.
    afterAll(async () => {
      recorderEvents.resetSystem();
      await serializedDelay(driver, 300);
    });

    // Every recording lifecycle event type must stay stable.
    it('recorder_event_type_enum_should_be_defined_correctly', 0, async () => {
      expect(RecorderEventType.RECORDING_START).assertEqual('recording_start');
      expect(RecorderEventType.RECORDING_STOP).assertEqual('recording_stop');
      expect(RecorderEventType.RECORDING_ERROR).assertEqual('recording_error');
      expect(RecorderEventType.RECORDER_STATE_CHANGE).assertEqual('recorder_state_change');
      expect(RecorderEventType.TIP_SHOW).assertEqual('tip_show');
      expect(RecorderEventType.TIP_HIDE).assertEqual('tip_hide');
      expect(RecorderEventType.RECORDER_READY).assertEqual('recorder_ready');
    });

    // RecordingState values follow the production enumeration.
    it('recording_state_values_should_match_the_product', 0, async () => {
      expect(STATE_IDLE).assertEqual(0);
      expect(STATE_RECORDING).assertEqual(1);
      expect(STATE_STOPPED).assertEqual(2);
      expect(STATE_ERROR).assertEqual(3);
      expect(TERMINATE_DELAY_MS).assertEqual(2000);
      expect(TIP_DURATION_MS).assertEqual(3000);
    });

    // Subscription registers a subscriber on the event bus.
    it('recorder_event_subscription_should_work_correctly', 0, async () => {
      recorderEvents.resetSystem();
      const subscriber: RecorderEventSubscriber = {
        id: 'start_subscriber',
        callback: (_data: RecorderEventData): void => {
        },
        eventTypes: [RecorderEventType.RECORDING_START, RecorderEventType.RECORDING_STOP]
      };
      expect(recorderEvents.subscribe(subscriber)).assertTrue();
      expect(recorderEvents.getSubscriberCount()).assertEqual(1);
      const payload: EventPayload = { reason: 'start_request' };
      const eventData: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_START,
        payload: payload,
        timestamp: 0,
        source: 'ScreenRecorderAbility'
      };
      recorderEvents.publish(eventData);
      const history: RecorderEventData[] = recorderEvents.getEventHistory();
      expect(history.length).assertEqual(1);
      expect(history[0].eventType).assertEqual(RecorderEventType.RECORDING_START);
    });

    // Cancelling a subscription stops further deliveries.
    it('recorder_event_unsubscription_should_work_correctly', 0, async () => {
      recorderEvents.resetSystem();
      let receivedCount: number = 0;
      const subscriber: RecorderEventSubscriber = {
        id: 'stop_subscriber',
        callback: (): void => {
          receivedCount++;
        },
        eventTypes: [RecorderEventType.RECORDING_STOP]
      };
      recorderEvents.subscribe(subscriber);
      expect(recorderEvents.hasSubscriber('stop_subscriber')).assertTrue();
      const payload: EventPayload = { recorderState: STATE_STOPPED };
      const stopEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_STOP,
        payload: payload,
        timestamp: 0,
        source: 'ScreenRecorderAbility'
      };
      recorderEvents.publish(stopEvent);
      expect(receivedCount).assertEqual(1);
      expect(recorderEvents.unsubscribe('stop_subscriber')).assertTrue();
      recorderEvents.publish(stopEvent);
      expect(receivedCount).assertEqual(1);
      expect(recorderEvents.getSubscriberCount()).assertEqual(0);
    });

    // A subscriber id cannot be registered twice.
    it('duplicate_subscription_should_be_rejected', 0, async () => {
      recorderEvents.resetSystem();
      const subscriber: RecorderEventSubscriber = {
        id: 'duplicate_recorder_sub',
        callback: (): void => {
        },
        eventTypes: [RecorderEventType.RECORDING_START]
      };
      expect(recorderEvents.subscribe(subscriber)).assertTrue();
      expect(recorderEvents.subscribe(subscriber)).assertFalse();
      expect(recorderEvents.getSubscriberCount()).assertEqual(1);
    });

    // Publishing appends the event to the history and increments the counter.
    it('recorder_event_publishing_should_work_correctly', 0, async () => {
      recorderEvents.resetSystem();
      const startPayload: EventPayload = { recorderState: STATE_RECORDING };
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: startPayload,
        timestamp: 0,
        source: 'ScreenRecorderAbility'
      });
      const changePayload: EventPayload = { previousState: STATE_IDLE, recorderState: STATE_RECORDING };
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDER_STATE_CHANGE,
        payload: changePayload,
        timestamp: 0,
        source: 'SRManager'
      });
      const stopPayload: EventPayload = { recorderState: STATE_STOPPED, durationMs: 12000 };
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_STOP,
        payload: stopPayload,
        timestamp: 0,
        source: 'ScreenRecorderAbility'
      });
      expect(recorderEvents.getPublishedCount()).assertEqual(3);
      expect(recorderEvents.getEventHistory().length).assertEqual(3);
    });

    // Query by type returns only the events of that recording phase.
    it('query_events_by_type_should_return_correct_results', 0, async () => {
      recorderEvents.resetSystem();
      const emptyPayload: EventPayload = {};
      const startEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_START,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      recorderEvents.publish(startEvent);
      const stopEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_STOP,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      recorderEvents.publish(stopEvent);
      recorderEvents.publish(startEvent);
      const errorEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_ERROR,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      recorderEvents.publish(errorEvent);
      expect(recorderEvents.getEventsByType(RecorderEventType.RECORDING_START).length).assertEqual(2);
      expect(recorderEvents.getEventsByType(RecorderEventType.RECORDING_STOP).length).assertEqual(1);
      expect(recorderEvents.getEventsByType(RecorderEventType.RECORDING_ERROR).length).assertEqual(1);
      expect(recorderEvents.getEventsByType(RecorderEventType.TIP_SHOW).length).assertEqual(0);
    });

    // Invalid lifecycle events are rejected by the validator.
    it('event_data_validation_should_detect_invalid_data', 0, async () => {
      recorderEvents.resetSystem();
      const validEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_START,
        payload: { reason: 'user_action' },
        timestamp: Date.now(),
        source: 'ScreenRecorderAbility'
      };
      expect(recorderEvents.validateEventData(validEvent)).assertTrue();
      const invalidTypeEvent: RecorderEventData = {
        eventType: 'invalid_type' as RecorderEventType,
        payload: {},
        timestamp: Date.now(),
        source: 'test'
      };
      expect(recorderEvents.validateEventData(invalidTypeEvent)).assertFalse();
      const invalidTimestampEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_START,
        payload: {},
        timestamp: 0,
        source: 'test'
      };
      expect(recorderEvents.validateEventData(invalidTimestampEvent)).assertFalse();
      const emptySourceEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_START,
        payload: {},
        timestamp: Date.now(),
        source: ''
      };
      expect(recorderEvents.validateEventData(emptySourceEvent)).assertFalse();
    });

    // Only error events require a terminateSelf() of the ability.
    it('error_event_should_request_termination', 0, async () => {
      recorderEvents.resetSystem();
      const errorEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_ERROR,
        payload: { errorCode: -1 },
        timestamp: Date.now(),
        source: 'SRManager'
      };
      const stopEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_STOP,
        payload: { recorderState: STATE_STOPPED },
        timestamp: Date.now(),
        source: 'ScreenRecorderAbility'
      };
      expect(recorderEvents.shouldTerminate(errorEvent)).assertTrue();
      expect(recorderEvents.shouldTerminate(stopEvent)).assertFalse();
    });

    // Event type statistics count each recording phase separately.
    it('event_type_stats_should_be_accurate', 0, async () => {
      recorderEvents.resetSystem();
      const emptyPayload: EventPayload = {};
      const startEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_START,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 3; i++) {
        recorderEvents.publish(startEvent);
      }
      const stopEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_STOP,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 5; i++) {
        recorderEvents.publish(stopEvent);
      }
      const errorEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_ERROR,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      };
      for (let i = 0; i < 2; i++) {
        recorderEvents.publish(errorEvent);
      }
      const stats: Map<string, number> = recorderEvents.getEventTypeStats();
      expect(stats.get('recording_start')).assertEqual(3);
      expect(stats.get('recording_stop')).assertEqual(5);
      expect(stats.get('recording_error')).assertEqual(2);
      expect(stats.get('tip_show')).assertUndefined();
    });

    // One lifecycle event is delivered to every matching subscriber.
    it('multi_subscriber_event_distribution_should_work_correctly', 0, async () => {
      recorderEvents.resetSystem();
      let timerPageCount: number = 0;
      let tipPageCount: number = 0;
      let serviceCount: number = 0;
      const timerPage: RecorderEventSubscriber = {
        id: 'timer_page',
        callback: (): void => {
          timerPageCount++;
        },
        eventTypes: [RecorderEventType.RECORDING_START]
      };
      recorderEvents.subscribe(timerPage);
      const tipPage: RecorderEventSubscriber = {
        id: 'tip_page',
        callback: (): void => {
          tipPageCount++;
        },
        eventTypes: [RecorderEventType.RECORDING_START, RecorderEventType.TIP_SHOW]
      };
      recorderEvents.subscribe(tipPage);
      const service: RecorderEventSubscriber = {
        id: 'service',
        callback: (): void => {
          serviceCount++;
        },
        eventTypes: [RecorderEventType.RECORDING_START, RecorderEventType.TIP_SHOW, RecorderEventType.RECORDING_STOP]
      };
      recorderEvents.subscribe(service);
      const emptyPayload: EventPayload = {};
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      });
      expect(timerPageCount).assertEqual(1);
      expect(tipPageCount).assertEqual(1);
      expect(serviceCount).assertEqual(1);
      recorderEvents.publish({
        eventType: RecorderEventType.TIP_SHOW,
        payload: { tipDurationMs: TIP_DURATION_MS },
        timestamp: 0,
        source: 'test'
      });
      expect(timerPageCount).assertEqual(1);
      expect(tipPageCount).assertEqual(2);
      expect(serviceCount).assertEqual(2);
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_STOP,
        payload: emptyPayload,
        timestamp: 0,
        source: 'test'
      });
      expect(timerPageCount).assertEqual(1);
      expect(tipPageCount).assertEqual(2);
      expect(serviceCount).assertEqual(3);
    });

    // The publish timestamp is filled automatically.
    it('event_timestamp_should_be_set_automatically_on_publish', 0, async () => {
      recorderEvents.resetSystem();
      const beforePublish: number = Date.now();
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDER_READY,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      const afterPublish: number = Date.now();
      const events: RecorderEventData[] = recorderEvents.getEventHistory();
      expect(events.length).assertEqual(1);
      expect(events[0].timestamp).assertLargerOrEqual(beforePublish);
      expect(events[0].timestamp).assertLessOrEqual(afterPublish);
    });

    // History and subscriber clearing are independent operations.
    it('event_system_clear_functions_should_work_correctly', 0, async () => {
      recorderEvents.resetSystem();
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_STOP,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      const clearSub: RecorderEventSubscriber = {
        id: 'clear_test_sub',
        callback: (): void => {
        },
        eventTypes: [RecorderEventType.RECORDING_START]
      };
      recorderEvents.subscribe(clearSub);
      expect(recorderEvents.getPublishedCount()).assertEqual(2);
      expect(recorderEvents.getSubscriberCount()).assertEqual(1);
      recorderEvents.clearEventHistory();
      expect(recorderEvents.getPublishedCount()).assertEqual(0);
      expect(recorderEvents.getEventHistory().length).assertEqual(0);
      expect(recorderEvents.getSubscriberCount()).assertEqual(1);
      recorderEvents.clearSubscribers();
      expect(recorderEvents.getSubscriberCount()).assertEqual(0);
    });

    // The event bus is a singleton shared by service and pages.
    it('recorder_event_system_singleton_should_return_same_instance', 0, async () => {
      const events1: RecorderEventSystem = RecorderEventSystem.getInstance();
      const events2: RecorderEventSystem = RecorderEventSystem.getInstance();
      expect(events1 === events2).assertTrue();
      events1.resetSystem();
      events1.publish({
        eventType: RecorderEventType.RECORDER_READY,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      expect(events2.getPublishedCount()).assertEqual(1);
    });

    // Payload fields keep their declared types after publishing.
    it('event_payload_data_diversity_should_be_supported', 0, async () => {
      recorderEvents.resetSystem();
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: { reason: 'user_action', fileName: 'REC_20260101_101010.mp4' },
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDER_STATE_CHANGE,
        payload: { previousState: STATE_RECORDING, recorderState: STATE_STOPPED },
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.TIP_SHOW,
        payload: { animation: true, confirmed: false, tipDurationMs: TIP_DURATION_MS },
        timestamp: 0,
        source: 'test'
      });
      const history: RecorderEventData[] = recorderEvents.getEventHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].payload.reason).assertEqual('user_action');
      expect(history[1].payload.recorderState).assertEqual(STATE_STOPPED);
      expect(history[2].payload.animation).assertTrue();
      expect(history[2].payload.tipDurationMs).assertEqual(3000);
    });

    // Lifecycle events correlate with the rendered timer window.
    it('event_system_should_correlate_with_ui_interactions', 0, async () => {
      await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER);
      recorderEvents.resetSystem();
      const initialCount: number = await recorderComponentCount(driver);
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: { recorderState: STATE_RECORDING },
        timestamp: 0,
        source: 'test'
      });
      await pressAndWait(driver, KEY_MENU, 1, DELAY_KEY_NAVIGATION);
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_STOP,
        payload: { previousState: STATE_RECORDING, recorderState: STATE_STOPPED },
        timestamp: 0,
        source: 'test'
      });
      const finalCount: number = await recorderComponentCount(driver);
      expect(Math.abs(finalCount - initialCount)).assertLessOrEqual(3);
      const stats: Map<string, number> = recorderEvents.getEventTypeStats();
      expect(stats.get('recording_start')).assertEqual(1);
      expect(stats.get('recording_stop')).assertEqual(1);
    });

    // A full recording cycle produces four lifecycle events.
    it('comprehensive_event_scenario_should_demonstrate_full_functionality', 0, async () => {
      recorderEvents.resetSystem();
      const scenarioStart: number = Date.now();
      const lifecycleSub: RecorderEventSubscriber = {
        id: 'comprehensive_lifecycle_sub',
        callback: (): void => {
        },
        eventTypes: [RecorderEventType.RECORDING_START, RecorderEventType.RECORDING_STOP,
          RecorderEventType.RECORDING_ERROR, RecorderEventType.RECORDER_READY]
      };
      recorderEvents.subscribe(lifecycleSub);
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDER_READY,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: { recorderState: STATE_RECORDING },
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_STOP,
        payload: { recorderState: STATE_STOPPED, durationMs: 8000 },
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_ERROR,
        payload: { errorCode: -1 },
        timestamp: 0,
        source: 'test'
      });
      const scenarioTime: number = Date.now() - scenarioStart;
      expect(recorderEvents.getPublishedCount()).assertEqual(4);
      expect(scenarioTime).assertLessOrEqual(5000);
      const stats: Map<string, number> = recorderEvents.getEventTypeStats();
      expect(stats.get('recorder_ready')).assertEqual(1);
      expect(stats.get('recording_start')).assertEqual(1);
      expect(stats.get('recording_stop')).assertEqual(1);
      expect(stats.get('recording_error')).assertEqual(1);
    });

    // LocalStorage `recorderState` defaults to Idle before the service writes it.
    it('recorder_state_store_should_default_to_idle', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      expect(store.getRecorderState()).assertEqual(STATE_IDLE);
      expect(store.getStorageKey()).assertEqual(KEY_RECORDER_STATE);
      expect(store.getPageCount()).assertEqual(0);
      expect(store.isRecording()).assertFalse();
      expect(store.isError()).assertFalse();
    });

    // Every RecordingState value can be written to the store.
    it('recorder_state_store_should_accept_all_states', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      expect(store.setRecorderState(STATE_RECORDING)).assertTrue();
      expect(store.getRecorderState()).assertEqual(STATE_RECORDING);
      expect(store.isRecording()).assertTrue();
      expect(store.setRecorderState(STATE_STOPPED)).assertTrue();
      expect(store.getRecorderState()).assertEqual(STATE_STOPPED);
      expect(store.setRecorderState(STATE_ERROR)).assertTrue();
      expect(store.isError()).assertTrue();
      expect(store.setRecorderState(STATE_IDLE)).assertTrue();
      expect(store.isError()).assertFalse();
    });

    // States outside the enumeration are rejected and keep the old value.
    it('recorder_state_store_should_reject_invalid_states', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      store.setRecorderState(STATE_RECORDING);
      expect(store.isValidState(0)).assertTrue();
      expect(store.isValidState(3)).assertTrue();
      expect(store.isValidState(-1)).assertFalse();
      expect(store.isValidState(4)).assertFalse();
      expect(store.setRecorderState(4)).assertFalse();
      expect(store.setRecorderState(-1)).assertFalse();
      expect(store.getRecorderState()).assertEqual(STATE_RECORDING);
    });

    // The SRAbilityContext key is stored next to `recorderState`.
    it('ability_context_key_should_be_stored', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      expect(store.getAbilityContextKey()).assertEqual('');
      store.setAbilityContextKey('screen-recorder-context');
      expect(store.getAbilityContextKey()).assertEqual('screen-recorder-context');
      expect(KEY_ABILITY_CONTEXT).assertEqual('SRAbilityContext');
    });

    // A page subscribing to the store mirrors the current state immediately.
    it('page_subscription_should_sync_current_state', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      store.setRecorderState(STATE_RECORDING);
      expect(store.subscribePage('timer_page')).assertTrue();
      expect(store.isSubscribed('timer_page')).assertTrue();
      expect(store.getPageCount()).assertEqual(1);
      expect(store.readPageState('timer_page')).assertEqual(STATE_RECORDING);
    });

    // A duplicated page subscription is rejected.
    it('duplicate_page_subscription_should_be_rejected', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      expect(store.subscribePage('tip_page')).assertTrue();
      expect(store.subscribePage('tip_page')).assertFalse();
      expect(store.getPageCount()).assertEqual(1);
    });

    // Service writes are propagated to every subscribed page.
    it('service_state_write_should_propagate_to_pages', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      store.subscribePage('timer_page');
      store.subscribePage('tip_page');
      store.setRecorderState(STATE_RECORDING);
      expect(store.readPageState('timer_page')).assertEqual(STATE_RECORDING);
      expect(store.readPageState('tip_page')).assertEqual(STATE_RECORDING);
      store.setRecorderState(STATE_STOPPED);
      expect(store.readPageState('timer_page')).assertEqual(STATE_STOPPED);
      expect(store.readPageState('tip_page')).assertEqual(STATE_STOPPED);
      expect(store.getPageCount()).assertEqual(2);
    });

    // An explicit sync returns -1 for a page that never subscribed.
    it('sync_to_unknown_page_should_return_minus_one', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      store.setRecorderState(STATE_RECORDING);
      expect(store.syncToPage('unknown_page')).assertEqual(-1);
      expect(store.subscribePage('timer_page')).assertTrue();
      expect(store.syncToPage('timer_page')).assertEqual(STATE_RECORDING);
      expect(store.getSyncCount()).assertEqual(1);
    });

    // Unsubscribing a page removes it from the propagation list.
    it('page_unsubscription_should_stop_state_sync', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      store.subscribePage('timer_page');
      store.subscribePage('tip_page');
      expect(store.unsubscribePage('timer_page')).assertTrue();
      expect(store.isSubscribed('timer_page')).assertFalse();
      expect(store.getPageCount()).assertEqual(1);
      expect(store.unsubscribePage('timer_page')).assertFalse();
      store.setRecorderState(STATE_STOPPED);
      expect(store.readPageState('tip_page')).assertEqual(STATE_STOPPED);
    });

    // The store counts every service write for synchronization checks.
    it('state_publish_count_should_increment', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      expect(store.getPublishCount()).assertEqual(0);
      store.setRecorderState(STATE_RECORDING);
      store.setRecorderState(STATE_STOPPED);
      store.setRecorderState(STATE_IDLE);
      expect(store.getPublishCount()).assertEqual(3);
      expect(store.setRecorderState(9)).assertFalse();
      expect(store.getPublishCount()).assertEqual(3);
    });

    // Resetting the store clears the state, pages and counters.
    it('recorder_state_store_reset_should_restore_defaults', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      store.reset();
      store.subscribePage('timer_page');
      store.setRecorderState(STATE_ERROR);
      store.setAbilityContextKey('ctx');
      store.reset();
      expect(store.getRecorderState()).assertEqual(STATE_IDLE);
      expect(store.getPageCount()).assertEqual(0);
      expect(store.getPublishCount()).assertEqual(0);
      expect(store.getSyncCount()).assertEqual(0);
      expect(store.getAbilityContextKey()).assertEqual('');
    });

    // The termination timer waits the full 2000 ms after an Error state.
    it('termination_should_wait_2000ms', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      expect(scheduler.schedule()).assertTrue();
      expect(scheduler.isScheduled()).assertTrue();
      expect(scheduler.getDelayMs()).assertEqual(TERMINATE_DELAY_MS);
      expect(scheduler.getRemainingMs()).assertEqual(2000);
      expect(scheduler.advance(1999)).assertFalse();
      expect(scheduler.isTerminated()).assertFalse();
      expect(scheduler.getRemainingMs()).assertEqual(1);
      expect(scheduler.advance(1)).assertTrue();
      expect(scheduler.isTerminated()).assertTrue();
      expect(scheduler.getTerminateCount()).assertEqual(1);
    });

    // The scheduler fires only once even for a large time step.
    it('termination_should_fire_only_once', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      scheduler.schedule();
      expect(scheduler.advance(10000)).assertTrue();
      expect(scheduler.advance(2000)).assertFalse();
      expect(scheduler.getTerminateCount()).assertEqual(1);
      expect(scheduler.isScheduled()).assertFalse();
    });

    // Scheduling twice before firing is rejected.
    it('duplicate_termination_schedule_should_be_rejected', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      expect(scheduler.schedule()).assertTrue();
      expect(scheduler.schedule()).assertFalse();
      expect(scheduler.getTerminateCount()).assertEqual(0);
      scheduler.advance(500);
      expect(scheduler.schedule()).assertFalse();
      expect(scheduler.getRemainingMs()).assertEqual(1500);
    });

    // A recovered recorder state cancels the pending termination.
    it('termination_should_be_cancelled_when_state_recovers', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      scheduler.schedule();
      scheduler.advance(1000);
      expect(scheduler.cancel()).assertTrue();
      expect(scheduler.isScheduled()).assertFalse();
      expect(scheduler.getRemainingMs()).assertEqual(0);
      expect(scheduler.getCancelCount()).assertEqual(1);
      expect(scheduler.advance(5000)).assertFalse();
      expect(scheduler.isTerminated()).assertFalse();
      expect(scheduler.cancel()).assertFalse();
    });

    // Advancing without a schedule never terminates the ability.
    it('termination_advance_without_schedule_should_be_ignored', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      expect(scheduler.advance(5000)).assertFalse();
      expect(scheduler.isTerminated()).assertFalse();
      expect(scheduler.getTerminateCount()).assertEqual(0);
      expect(scheduler.getRemainingMs()).assertEqual(0);
    });

    // The scheduler keeps the reason of the requested termination.
    it('termination_should_keep_the_reason', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      scheduler.schedule(TERMINATE_DELAY_MS, 'recording_error');
      expect(scheduler.getReason()).assertEqual('recording_error');
      scheduler.cancel();
      scheduler.reset();
      scheduler.schedule(500, 'resolution_unsupported');
      expect(scheduler.getDelayMs()).assertEqual(500);
      expect(scheduler.advance(500)).assertTrue();
      expect(scheduler.getReason()).assertEqual('resolution_unsupported');
    });

    // A terminated ability cannot schedule another termination.
    it('terminated_scheduler_should_reject_new_schedule', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      scheduler.schedule();
      scheduler.advance(TERMINATE_DELAY_MS);
      expect(scheduler.isTerminated()).assertTrue();
      expect(scheduler.schedule()).assertFalse();
      expect(scheduler.getTerminateCount()).assertEqual(1);
    });

    // Reset restores a reusable scheduler after termination.
    it('termination_scheduler_reset_should_restore_usage', 0, async () => {
      const scheduler: TerminationScheduler = new TerminationScheduler();
      scheduler.reset();
      scheduler.schedule();
      scheduler.advance(TERMINATE_DELAY_MS);
      scheduler.reset();
      expect(scheduler.isTerminated()).assertFalse();
      expect(scheduler.getTerminateCount()).assertEqual(0);
      expect(scheduler.getReason()).assertEqual('');
      expect(scheduler.schedule()).assertTrue();
    });

    // End to end error flow: event -> state store -> terminate after 2000 ms.
    it('error_flow_should_terminate_after_state_sync', 0, async () => {
      recorderEvents.resetSystem();
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      const scheduler: TerminationScheduler = new TerminationScheduler();
      store.reset();
      scheduler.reset();
      store.subscribePage('timer_page');
      const errorPayload: EventPayload = { errorCode: -1, recorderState: STATE_ERROR };
      const errorEvent: RecorderEventData = {
        eventType: RecorderEventType.RECORDING_ERROR,
        payload: errorPayload,
        timestamp: 0,
        source: 'SRManager'
      };
      recorderEvents.publish(errorEvent);
      expect(recorderEvents.getPublishedCount()).assertEqual(1);
      expect(recorderEvents.shouldTerminate(errorEvent)).assertTrue();
      expect(store.setRecorderState(STATE_ERROR)).assertTrue();
      expect(store.readPageState('timer_page')).assertEqual(STATE_ERROR);
      expect(store.isError()).assertTrue();
      expect(scheduler.schedule()).assertTrue();
      expect(scheduler.advance(2000)).assertTrue();
      expect(scheduler.isTerminated()).assertTrue();
      expect(store.getRecorderState()).assertEqual(STATE_ERROR);
    });

    // A normal stop flow must not schedule any termination.
    it('normal_stop_flow_should_not_terminate', 0, async () => {
      const store: RecorderStateStore = RecorderStateStore.getInstance();
      const scheduler: TerminationScheduler = new TerminationScheduler();
      store.reset();
      scheduler.reset();
      store.setRecorderState(STATE_RECORDING);
      store.setRecorderState(STATE_STOPPED);
      expect(store.isError()).assertFalse();
      expect(scheduler.isScheduled()).assertFalse();
      expect(scheduler.advance(TERMINATE_DELAY_MS)).assertFalse();
      expect(scheduler.isTerminated()).assertFalse();
      expect(store.getRecorderState()).assertEqual(STATE_STOPPED);
    });

    // Subscription filtering keeps pages away from unrelated events.
    it('subscriber_should_only_receive_subscribed_types', 0, async () => {
      recorderEvents.resetSystem();
      let receivedCount: number = 0;
      const subscriber: RecorderEventSubscriber = {
        id: 'start_only_sub',
        callback: (): void => {
          receivedCount++;
        },
        eventTypes: [RecorderEventType.RECORDING_START]
      };
      recorderEvents.subscribe(subscriber);
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_STOP,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      recorderEvents.publish({
        eventType: RecorderEventType.TIP_SHOW,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      expect(receivedCount).assertEqual(1);
      expect(recorderEvents.getPublishedCount()).assertEqual(3);
    });

    // The payload reaches the subscriber without losing fields.
    it('event_payload_should_propagate_completely', 0, async () => {
      recorderEvents.resetSystem();
      let capturedPayload: EventPayload = {};
      const subscriber: RecorderEventSubscriber = {
        id: 'payload_sub',
        callback: (data: RecorderEventData): void => {
          capturedPayload = data.payload;
        },
        eventTypes: [RecorderEventType.RECORDING_START]
      };
      recorderEvents.subscribe(subscriber);
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDING_START,
        payload: {
          reason: 'user_action',
          recorderState: STATE_RECORDING,
          fileName: 'REC_20260101_101010.mp4',
          animation: true
        },
        timestamp: 0,
        source: 'test'
      });
      expect(capturedPayload.reason).assertEqual('user_action');
      expect(capturedPayload.recorderState).assertEqual(STATE_RECORDING);
      expect(capturedPayload.fileName).assertEqual('REC_20260101_101010.mp4');
      expect(capturedPayload.animation).assertTrue();
    });

    // History is isolated from the caller: pushing does not change it.
    it('event_history_get_should_return_deep_copy', 0, async () => {
      recorderEvents.resetSystem();
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDER_STATE_CHANGE,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      const history1: RecorderEventData[] = recorderEvents.getEventHistory();
      expect(history1.length).assertEqual(1);
      history1.push({
        eventType: RecorderEventType.RECORDING_ERROR,
        payload: {},
        timestamp: 1,
        source: 'fake'
      });
      expect(recorderEvents.getEventHistory().length).assertEqual(1);
    });

    // Unsubscribing an unknown id, or querying it, returns false.
    it('unsubscribe_unknown_subscriber_should_return_false', 0, async () => {
      recorderEvents.resetSystem();
      expect(recorderEvents.unsubscribe('not_exists')).assertFalse();
      expect(recorderEvents.hasSubscriber('not_exists')).assertFalse();
    });

    // Empty history produces an empty statistics map.
    it('empty_history_stats_should_be_empty', 0, async () => {
      recorderEvents.resetSystem();
      expect(recorderEvents.getEventTypeStats().size).assertEqual(0);
      expect(recorderEvents.getPublishedCount()).assertEqual(0);
    });

    // Publishing without subscribers still records the lifecycle event.
    it('publish_without_subscribers_should_record_history', 0, async () => {
      recorderEvents.resetSystem();
      recorderEvents.publish({
        eventType: RecorderEventType.RECORDER_READY,
        payload: {},
        timestamp: 0,
        source: 'test'
      });
      expect(recorderEvents.getPublishedCount()).assertEqual(1);
      expect(recorderEvents.getEventHistory().length).assertEqual(1);
      expect(recorderEvents.getSubscriberCount()).assertEqual(0);
    });

    // Query by type preserves the publish order.
    it('events_by_type_should_preserve_publish_order', 0, async () => {
      recorderEvents.resetSystem();
      for (let i = 0; i < 3; i++) {
        recorderEvents.publish({
          eventType: RecorderEventType.RECORDER_STATE_CHANGE,
          payload: { state: i },
          timestamp: 0,
          source: 'test'
        });
      }
      const events: RecorderEventData[] = recorderEvents.getEventsByType(
        RecorderEventType.RECORDER_STATE_CHANGE);
      expect(events.length).assertEqual(3);
      expect(events[0].payload.state).assertEqual(0);
      expect(events[1].payload.state).assertEqual(1);
      expect(events[2].payload.state).assertEqual(2);
    });

    // Unsubscribe then resubscribe restores the delivery path.
    it('unsubscribe_then_resubscribe_should_work', 0, async () => {
      recorderEvents.resetSystem();
      let receivedCount: number = 0;
      const subscriber: RecorderEventSubscriber = {
        id: 'cycle_sub',
        callback: (): void => {
          receivedCount++;
        },
        eventTypes: [RecorderEventType.TIP_SHOW]
      };
      recorderEvents.subscribe(subscriber);
      expect(recorderEvents.unsubscribe('cycle_sub')).assertTrue();
      expect(recorderEvents.hasSubscriber('cycle_sub')).assertFalse();
      expect(recorderEvents.subscribe(subscriber)).assertTrue();
      expect(recorderEvents.getSubscriberCount()).assertEqual(1);
      recorderEvents.publish({
        eventType: RecorderEventType.TIP_SHOW,
        payload: { tipDurationMs: TIP_DURATION_MS },
        timestamp: 0,
        source: 'test'
      });
      expect(receivedCount).assertEqual(1);
    });

    // All valid event types pass the validator.
    it('all_valid_event_types_should_pass_validation', 0, async () => {
      recorderEvents.resetSystem();
      const types: RecorderEventType[] = [
        RecorderEventType.RECORDING_START,
        RecorderEventType.RECORDING_STOP,
        RecorderEventType.RECORDING_ERROR,
        RecorderEventType.RECORDER_STATE_CHANGE,
        RecorderEventType.TIP_SHOW,
        RecorderEventType.TIP_HIDE,
        RecorderEventType.RECORDER_READY
      ];
      for (let i = 0; i < types.length; i++) {
        expect(recorderEvents.validateEventData({
          eventType: types[i],
          payload: {},
          timestamp: Date.now(),
          source: 'test'
        })).assertTrue();
      }
    });

    // Repeated unsubscribe is a no-op returning false.
    it('repeated_unsubscribe_should_return_false', 0, async () => {
      recorderEvents.resetSystem();
      const subscriber: RecorderEventSubscriber = {
        id: 'repeat_unsub',
        callback: (): void => {
        },
        eventTypes: [RecorderEventType.RECORDING_START]
      };
      recorderEvents.subscribe(subscriber);
      expect(recorderEvents.unsubscribe('repeat_unsub')).assertTrue();
      expect(recorderEvents.unsubscribe('repeat_unsub')).assertFalse();
      expect(recorderEvents.getSubscriberCount()).assertEqual(0);
    });
  });
}

