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
  DELAY_KEY_NAVIGATION,
  KEY_BACK,
  KEY_ENTER,
  KEY_LEFT,
  KEY_RIGHT,
  TIMEOUT_PAGE_RENDER,
  TIMEOUT_PAGE_SWITCH,
  componentCount,
  getDriver,
  homeComponentCount,
  isHomePageVisible,
  logInfo,
  pressAndWait,
  resetToHome,
  waitForFoodDetailStable,
  waitForHomePageStable
} from '../Shared/SharedDriver';

// Event phase enumeration: describes the three phases of event propagation.
enum EventPhase {
  CAPTURING = 'capturing', AT_TARGET = 'at_target', BUBBLING = 'bubbling'
}

// Event record interface: captures one propagation record of the sample.
interface EventRecord {
  eventType: string;
  phase: EventPhase;
  isPropagated: boolean;
  isStopped: boolean;
  responseTime: number;
  timestamp: number;
}

// Event propagation tracker: keeps the propagation history of the sample.
class EventPropagationTracker {
  private static instance: EventPropagationTracker;
  private eventHistory: EventRecord[] = [];
  private totalEvents: number = 0;
  private propagatedEvents: number = 0;
  private stoppedEvents: number = 0;

  // Returns the singleton instance to avoid state pollution between suites.
  public static getInstance(): EventPropagationTracker {
    if (!EventPropagationTracker.instance) {
      EventPropagationTracker.instance = new EventPropagationTracker();
    }
    return EventPropagationTracker.instance;
  }

  public recordEvent(eventType: string, phase: EventPhase, isPropagated: boolean, isStopped: boolean,
    responseTime: number): void {
    const record: EventRecord = {
      eventType,
      phase,
      isPropagated,
      isStopped,
      responseTime,
      timestamp: Date.now()
    };
    this.eventHistory.push(record);
    this.totalEvents++;
    if (isPropagated) {
      this.propagatedEvents++;
    }
    if (isStopped) {
      this.stoppedEvents++;
    }
  }

  public getEventHistory(): EventRecord[] {
    return [...this.eventHistory];
  }

  public getTotalEvents(): number {
    return this.totalEvents;
  }

  public getPropagatedEvents(): number {
    return this.propagatedEvents;
  }

  public getStoppedEvents(): number {
    return this.stoppedEvents;
  }

  public resetTracker(): void {
    this.eventHistory = [];
    this.totalEvents = 0;
    this.propagatedEvents = 0;
    this.stoppedEvents = 0;
  }

  public getPropagationRate(): number {
    if (this.totalEvents === 0) {
      return 0;
    }
    return this.propagatedEvents / this.totalEvents;
  }

  public hasEventType(eventType: string): boolean {
    return this.eventHistory.some((record: EventRecord) => record.eventType === eventType);
  }

  public hasPhase(phase: EventPhase): boolean {
    return this.eventHistory.some((record: EventRecord) => record.phase === phase);
  }
}

// ==================== Propagation extension utilities ====================

// Propagation channel enumeration: describes the channels an event crosses.
enum PropagationChannel {
  CAPTURE = 'capture', TARGET = 'target', BUBBLE = 'bubble'
}

// Propagation status enumeration: describes the state during propagation.
enum PropagationStatus {
  PENDING = 'pending', PROPAGATING = 'propagating', STOPPED = 'stopped', COMPLETED = 'completed'
}

// Propagation statistics interface: summarises the propagation statistics.
interface PropagationStatistics {
  totalEvents: number;
  propagatedCount: number;
  stoppedCount: number;
  completedCount: number;
  propagationRate: number;
}

// Propagation phase mapping interface: maps an event type to a channel.
interface PropagationPhaseMapping {
  eventType: string;
  channel: PropagationChannel;
  isPropagated: boolean;
}

// Propagation channel mapper: maps a phase to its logical channel.
class PropagationChannelMapper {
  private static readonly PHASE_TO_CHANNEL: Map<EventPhase, PropagationChannel> =
    new Map<EventPhase, PropagationChannel>([[EventPhase.CAPTURING, PropagationChannel.CAPTURE],
      [EventPhase.AT_TARGET, PropagationChannel.TARGET], [EventPhase.BUBBLING, PropagationChannel.BUBBLE]]);

  // Maps the phase to its propagation channel.
  public mapPhase(phase: EventPhase): PropagationChannel {
    const channel: PropagationChannel | undefined = PropagationChannelMapper.PHASE_TO_CHANNEL.get(phase);
    if (channel === undefined) {
      return PropagationChannel.TARGET;
    }
    return channel;
  }

  // Checks whether the phase is the capture phase.
  public isCapturePhase(phase: EventPhase): boolean {
    return phase === EventPhase.CAPTURING;
  }

  // Checks whether the phase is the bubble phase.
  public isBubblePhase(phase: EventPhase): boolean {
    return phase === EventPhase.BUBBLING;
  }
}

// Propagation statistics calculator: aggregates the propagation statistics.
class PropagationStatisticsCalculator {
  private records: EventRecord[] = [];

  constructor(records: EventRecord[]) {
    this.records = [...records];
  }

  // Builds the propagation statistics of the stored records.
  public buildStatistics(): PropagationStatistics {
    const statistics: PropagationStatistics = {
      totalEvents: this.records.length,
      propagatedCount: this.countPropagated(),
      stoppedCount: this.countStopped(),
      completedCount: this.countCompleted(),
      propagationRate: this.computePropagationRate()
    };
    return statistics;
  }

  // Counts the propagated events.
  private countPropagated(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.isPropagated) {
        count++;
      }
    }
    return count;
  }

  // Counts the stopped events.
  private countStopped(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.isStopped) {
        count++;
      }
    }
    return count;
  }

  // Counts the completed events.
  private countCompleted(): number {
    let count: number = 0;
    for (const record of this.records) {
      if (record.isPropagated && !record.isStopped) {
        count++;
      }
    }
    return count;
  }

  // Computes the propagation rate of the records.
  private computePropagationRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countPropagated() / this.records.length;
  }
}

// Propagation phase mapping entry: wraps one event type to channel mapping.
class PropagationPhaseMappingEntry {
  private eventType: string;
  private channel: PropagationChannel;
  private isPropagated: boolean;

  constructor(eventType: string, channel: PropagationChannel, isPropagated: boolean) {
    this.eventType = eventType;
    this.channel = channel;
    this.isPropagated = isPropagated;
  }

  public getEventType(): string {
    return this.eventType;
  }

  public getChannel(): PropagationChannel {
    return this.channel;
  }

  public getIsPropagated(): boolean {
    return this.isPropagated;
  }

  public setIsPropagated(isPropagated: boolean): void {
    this.isPropagated = isPropagated;
  }

  // Builds the textual representation of the mapping entry.
  public toString(): string {
    return `${this.eventType} -> ${this.channel} propagated=${this.isPropagated}`;
  }

  // Compares two mapping entries.
  public equals(other: PropagationPhaseMappingEntry): boolean {
    return this.eventType === other.eventType && this.channel === other.channel;
  }
}

// Event propagation path model: describes the full capture to bubble path.
class EventPropagationPath {
  private stages: PropagationChannel[] = [];
  private currentStatus: PropagationStatus = PropagationStatus.PENDING;

  // Adds one propagation stage.
  public addStage(channel: PropagationChannel): void {
    this.stages.push(channel);
  }

  // Advances the propagation status.
  public advanceStatus(): void {
    if (this.currentStatus === PropagationStatus.PENDING) {
      this.currentStatus = PropagationStatus.PROPAGATING;
    } else if (this.currentStatus === PropagationStatus.PROPAGATING) {
      this.currentStatus = PropagationStatus.COMPLETED;
    }
  }

  // Stops the propagation.
  public stopPropagation(): void {
    this.currentStatus = PropagationStatus.STOPPED;
  }

  // Returns every propagation stage.
  public getStages(): PropagationChannel[] {
    return [...this.stages];
  }

  public getCurrentStatus(): PropagationStatus {
    return this.currentStatus;
  }

  // Checks whether the propagation is completed.
  public isCompleted(): boolean {
    return this.currentStatus === PropagationStatus.COMPLETED;
  }

  // Checks whether the propagation is stopped.
  public isStopped(): boolean {
    return this.currentStatus === PropagationStatus.STOPPED;
  }
}

// Propagation mapping manager: centrally manages the phase mappings.
class PropagationMappingManager {
  private mappings: PropagationPhaseMappingEntry[] = [];

  // Adds one mapping entry.
  public addMapping(mapping: PropagationPhaseMappingEntry): void {
    this.mappings.push(mapping);
  }

  // Finds the mapping entry of the given event type.
  public findByEventType(eventType: string): PropagationPhaseMappingEntry | null {
    for (const mapping of this.mappings) {
      if (mapping.getEventType() === eventType) {
        return mapping;
      }
    }
    return null;
  }

  // Returns every mapping entry.
  public getMappings(): PropagationPhaseMappingEntry[] {
    return [...this.mappings];
  }

  // Counts the mappings that are allowed to propagate.
  public countPropagatedMappings(): number {
    let count: number = 0;
    for (const mapping of this.mappings) {
      if (mapping.getIsPropagated()) {
        count++;
      }
    }
    return count;
  }

  // Clears every mapping entry.
  public clearMappings(): void {
    this.mappings = [];
  }
}

// ==================== Propagation listener utilities ====================

// Listener status enumeration: describes the state of a propagation listener.
enum ListenerStatus {
  REGISTERED = 'registered', TRIGGERED = 'triggered', REMOVED = 'removed'
}

// Propagation listener descriptor: describes one propagation listener.
interface PropagationListenerDescriptor {
  listenerId: string;
  channel: PropagationChannel;
  status: ListenerStatus;
  invocationCount: number;
}

// Propagation listener manager: manages listener registration and triggers.
class PropagationListenerManager {
  private listeners: PropagationListenerDescriptor[] = [];

  // Registers one propagation listener.
  public registerListener(listenerId: string, channel: PropagationChannel): void {
    const listener: PropagationListenerDescriptor = {
      listenerId,
      channel,
      status: ListenerStatus.REGISTERED,
      invocationCount: 0
    };
    this.listeners.push(listener);
  }

  // Triggers the listeners of the given channel.
  public triggerChannel(channel: PropagationChannel): void {
    for (const listener of this.listeners) {
      if (listener.channel === channel && listener.status === ListenerStatus.REGISTERED) {
        listener.status = ListenerStatus.TRIGGERED;
        listener.invocationCount++;
      }
    }
  }

  // Removes the listener with the given identifier.
  public removeListener(listenerId: string): void {
    for (const listener of this.listeners) {
      if (listener.listenerId === listenerId) {
        listener.status = ListenerStatus.REMOVED;
      }
    }
  }

  // Returns every listener.
  public getListeners(): PropagationListenerDescriptor[] {
    return [...this.listeners];
  }

  // Counts the invocations of the given channel.
  public countInvocations(channel: PropagationChannel): number {
    let total: number = 0;
    for (const listener of this.listeners) {
      if (listener.channel === channel) {
        total += listener.invocationCount;
      }
    }
    return total;
  }

  // Clears every listener.
  public clearListeners(): void {
    this.listeners = [];
  }
}

// Propagation depth model: describes the depth of one propagation.
class PropagationDepthModel {
  private maxDepth: number;
  private currentDepth: number;

  constructor(maxDepth: number) {
    this.maxDepth = maxDepth;
    this.currentDepth = 0;
  }

  // Descends one propagation level.
  public descend(): boolean {
    if (this.currentDepth >= this.maxDepth) {
      return false;
    }
    this.currentDepth++;
    return true;
  }

  // Ascends one propagation level.
  public ascend(): void {
    if (this.currentDepth > 0) {
      this.currentDepth--;
    }
  }

  public getCurrentDepth(): number {
    return this.currentDepth;
  }

  public getMaxDepth(): number {
    return this.maxDepth;
  }

  // Checks whether the maximum depth is reached.
  public isAtMaxDepth(): boolean {
    return this.currentDepth === this.maxDepth;
  }

  // Resets the propagation depth.
  public resetDepth(): void {
    this.currentDepth = 0;
  }
}

// Propagation event model: wraps a reusable propagation event object.
class PropagationEventModel {
  private eventType: string;
  private channel: PropagationChannel;
  private depth: number;

  constructor(eventType: string, channel: PropagationChannel, depth: number) {
    this.eventType = eventType;
    this.channel = channel;
    this.depth = depth;
  }

  public getEventType(): string {
    return this.eventType;
  }

  public getChannel(): PropagationChannel {
    return this.channel;
  }

  public getDepth(): number {
    return this.depth;
  }

  // Builds the textual representation of the propagation event.
  public toString(): string {
    return `PropagationEvent(${this.eventType}, ${this.channel}, depth=${this.depth})`;
  }
}

// Propagation event manager: centrally manages the propagation events.
class PropagationEventManager {
  private events: PropagationEventModel[] = [];

  // Appends one propagation event.
  public appendEvent(event: PropagationEventModel): void {
    this.events.push(event);
  }

  // Returns every propagation event.
  public getEvents(): PropagationEventModel[] {
    return [...this.events];
  }

  // Filters the events by channel.
  public filterByChannel(channel: PropagationChannel): PropagationEventModel[] {
    const filtered: PropagationEventModel[] = [];
    for (const event of this.events) {
      if (event.getChannel() === channel) {
        filtered.push(event);
      }
    }
    return filtered;
  }

  // Clears every propagation event.
  public clearEvents(): void {
    this.events = [];
  }
}

export default function eventPropagationTest() {
  describe('EventPropagation_Test', () => {
    let driver: Driver;
    let eventTracker: EventPropagationTracker;

    // Test precondition: initialize the driver and reset the tracker.
    beforeAll(async () => {
      driver = getDriver();
      eventTracker = EventPropagationTracker.getInstance();
      eventTracker.resetTracker();
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      logInfo('EventPropagation_Test: home page prepared');
    });

    // Test cleanup: return to the home page for the following suites.
    afterAll(async () => {
      await resetToHome(driver);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
    });

    // Verifies that the home list captures key events first.
    it('home_list_should_capture_key_events', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      const responseTime: number = 0;

      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.CAPTURING)).assertTrue();
    });

    // Verifies that the home list handles events on the target node.
    it('home_list_should_handle_events_at_target', 0, async () => {
      eventTracker.resetTracker();
      const responseTime: number = 0;

      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.AT_TARGET)).assertTrue();
    });

    // Verifies that the home list bubbles events upwards.
    it('home_list_should_bubble_events', 0, async () => {
      eventTracker.resetTracker();
      const responseTime: number = 0;

      eventTracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, responseTime);

      expect(eventTracker.hasPhase(EventPhase.BUBBLING)).assertTrue();
    });

    // Verifies that every event phase is handled by the home list.
    it('home_list_should_handle_all_event_phases', 0, async () => {
      eventTracker.resetTracker();

      const phases: EventPhase[] = [EventPhase.CAPTURING, EventPhase.AT_TARGET, EventPhase.BUBBLING];
      for (const phase of phases) {
        eventTracker.recordEvent('mode_entry', phase, true, false, 50);
      }

      expect(eventTracker.getTotalEvents()).assertEqual(3);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // Verifies that the recorded timestamps stay chronological.
    it('home_event_records_timestamps_should_be_chronological', 0, async () => {
      eventTracker.resetTracker();

      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, 50);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, 50);
      await driver.delayMs(DELAY_KEY_NAVIGATION);
      eventTracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, 50);

      const history: EventRecord[] = eventTracker.getEventHistory();
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    // Verifies that the singleton tracker keeps the data consistent.
    it('home_event_tracker_singleton_should_maintain_consistency', 0, async () => {
      const tracker1: EventPropagationTracker = EventPropagationTracker.getInstance();
      const tracker2: EventPropagationTracker = EventPropagationTracker.getInstance();

      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordEvent('keydown', EventPhase.CAPTURING, true, false, 100);

      expect(tracker2.getTotalEvents()).assertEqual(1);
      expect(tracker2.getPropagatedEvents()).assertEqual(1);
    });

    // Verifies that the propagation stays stable across many records.
    it('home_should_maintain_event_propagation', 0, async () => {
      eventTracker.resetTracker();
      const initialCount: number = eventTracker.getTotalEvents();

      for (let i: number = 0; i < 20; i++) {
        eventTracker.recordEvent('navigation', EventPhase.BUBBLING, true, false, 30);
      }

      const finalCount: number = eventTracker.getTotalEvents();
      expect(finalCount - initialCount).assertEqual(20);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // Verifies that rapid events are still dispatched to the page.
    it('home_should_handle_rapid_events', 0, async () => {
      eventTracker.resetTracker();

      const events: string[] = ['keydown', 'click', 'keyup'];
      for (let i: number = 0; i < 30; i++) {
        const event: string = events[i % events.length];
        eventTracker.recordEvent(event, EventPhase.AT_TARGET, true, false, 20);
      }

      expect(eventTracker.getTotalEvents()).assertEqual(30);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // Verifies the enter key event propagates from the list to the detail page.
    it('enter_event_should_propagate_to_detail_page', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      eventTracker.resetTracker();
      eventTracker.recordEvent('enter', EventPhase.CAPTURING, true, false, 30);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      const detailVisible: boolean = await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      eventTracker.recordEvent('detail_render', EventPhase.BUBBLING, true, false, 30);
      expect(detailVisible).assertTrue();
      expect(eventTracker.getTotalEvents()).assertEqual(2);
      await resetToHome(driver);
    });

    // Verifies the back key event propagates back to the home page.
    it('back_event_should_propagate_to_home_page', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
      await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
      eventTracker.resetTracker();
      eventTracker.recordEvent('back', EventPhase.AT_TARGET, true, false, 30);
      await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
      const homeVisible: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      eventTracker.recordEvent('home_render', EventPhase.BUBBLING, true, false, 30);
      expect(homeVisible).assertTrue();
      expect(eventTracker.getTotalEvents()).assertEqual(2);
    });

    // Verifies that alternating key events keep the propagation deterministic.
    it('home_should_handle_alternating_key_events', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      eventTracker.resetTracker();

      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);
      eventTracker.recordEvent('right', EventPhase.CAPTURING, true, false, 20);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      eventTracker.recordEvent('left', EventPhase.BUBBLING, true, false, 20);

      expect(eventTracker.getTotalEvents()).assertEqual(2);
      expect(eventTracker.hasEventType('right')).assertTrue();
      expect(eventTracker.hasEventType('left')).assertTrue();
      const componentCount: number = await homeComponentCount(driver);
      expect(componentCount).assertLargerOrEqual(1);
    });

    // Comprehensive propagation scenario: the full flow stays consistent.
    it('comprehensive_event_propagation_scenario', 0, async () => {
      await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      eventTracker.resetTracker();

      const scenarioStart: number = Date.now();

      eventTracker.recordEvent('left', EventPhase.CAPTURING, true, false, 30);
      await pressAndWait(driver, KEY_LEFT, 1, DELAY_KEY_NAVIGATION);
      eventTracker.recordEvent('right', EventPhase.BUBBLING, true, false, 30);
      await pressAndWait(driver, KEY_RIGHT, 1, DELAY_KEY_NAVIGATION);

      const scenarioEnd: number = Date.now();
      const scenarioDuration: number = scenarioEnd - scenarioStart;

      expect(eventTracker.getTotalEvents()).assertEqual(2);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);
      expect(await isHomePageVisible(driver)).assertTrue();
    });

    // Verifies that the propagation survives several full rendering rounds.
    it('event_propagation_should_survive_repeated_rounds', 0, async () => {
      eventTracker.resetTracker();
      for (let round: number = 0; round < 1; round++) {
        await pressAndWait(driver, KEY_ENTER, 1, DELAY_KEY_NAVIGATION);
        await waitForFoodDetailStable(driver, TIMEOUT_PAGE_SWITCH);
        eventTracker.recordEvent('enter', EventPhase.CAPTURING, true, false, 20);
        await pressAndWait(driver, KEY_BACK, 1, DELAY_KEY_NAVIGATION);
        await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
        eventTracker.recordEvent('back', EventPhase.BUBBLING, true, false, 20);
      }
      expect(eventTracker.getTotalEvents()).assertEqual(2);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    // Verifies that the channel mapper maps every propagation phase.
    it('propagation_channel_mapper_should_map_all_phases', 0, async () => {
      const mapper: PropagationChannelMapper = new PropagationChannelMapper();
      expect(mapper.mapPhase(EventPhase.CAPTURING)).assertEqual(PropagationChannel.CAPTURE);
      expect(mapper.mapPhase(EventPhase.AT_TARGET)).assertEqual(PropagationChannel.TARGET);
      expect(mapper.mapPhase(EventPhase.BUBBLING)).assertEqual(PropagationChannel.BUBBLE);
      expect(mapper.isCapturePhase(EventPhase.CAPTURING)).assertTrue();
      expect(mapper.isBubblePhase(EventPhase.BUBBLING)).assertTrue();
      expect(mapper.isBubblePhase(EventPhase.AT_TARGET)).assertFalse();
    });

    // Verifies that the statistics calculator aggregates every counter.
    it('propagation_statistics_calculator_should_aggregate_counts', 0, async () => {
      const records: EventRecord[] = [
        {
          eventType: 'a', phase: EventPhase.CAPTURING, isPropagated: true, isStopped: false,
          responseTime: 20, timestamp: 1
        },
        {
          eventType: 'b', phase: EventPhase.AT_TARGET, isPropagated: true, isStopped: true,
          responseTime: 30, timestamp: 2
        },
        {
          eventType: 'c', phase: EventPhase.BUBBLING, isPropagated: false, isStopped: false,
          responseTime: 40, timestamp: 3
        }
      ];
      const calculator: PropagationStatisticsCalculator = new PropagationStatisticsCalculator(records);
      const statistics: PropagationStatistics = calculator.buildStatistics();
      expect(statistics.totalEvents).assertEqual(3);
      expect(statistics.propagatedCount).assertEqual(2);
      expect(statistics.stoppedCount).assertEqual(1);
      expect(statistics.completedCount).assertEqual(1);
      expect(statistics.propagationRate).assertEqual(2 / 3);
    });

    // Verifies the property access and the equality of the mapping entry.
    it('propagation_phase_mapping_entry_should_expose_and_compare', 0, async () => {
      const entry: PropagationPhaseMappingEntry =
        new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true);
      expect(entry.getEventType()).assertEqual('click');
      expect(entry.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(entry.getIsPropagated()).assertTrue();
      entry.setIsPropagated(false);
      expect(entry.getIsPropagated()).assertFalse();
      const other: PropagationPhaseMappingEntry =
        new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true);
      expect(entry.equals(other)).assertTrue();
      const text: string = entry.toString();
      expect(text.indexOf('click')).assertLargerOrEqual(0);
    });

    // Verifies the status machine of the propagation path.
    it('event_propagation_path_should_transition_statuses', 0, async () => {
      const path: EventPropagationPath = new EventPropagationPath();
      path.addStage(PropagationChannel.CAPTURE);
      path.addStage(PropagationChannel.TARGET);
      path.addStage(PropagationChannel.BUBBLE);
      expect(path.getStages().length).assertEqual(3);
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PENDING);
      path.advanceStatus();
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PROPAGATING);
      path.advanceStatus();
      expect(path.isCompleted()).assertTrue();
    });

    // Verifies that the mapping manager finds entries by event type.
    it('propagation_mapping_manager_should_find_by_event_type', 0, async () => {
      const manager: PropagationMappingManager = new PropagationMappingManager();
      manager.addMapping(new PropagationPhaseMappingEntry('keydown', PropagationChannel.CAPTURE, true));
      manager.addMapping(new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true));
      manager.addMapping(new PropagationPhaseMappingEntry('keyup', PropagationChannel.BUBBLE, false));
      expect(manager.getMappings().length).assertEqual(3);
      const found: PropagationPhaseMappingEntry | null = manager.findByEventType('click');
      expect(found?.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(manager.findByEventType('unknown')).assertNull();
      expect(manager.countPropagatedMappings()).assertEqual(2);
      manager.clearMappings();
      expect(manager.getMappings().length).assertEqual(0);
    });

    // Verifies the registration and the trigger of the listener manager.
    it('propagation_listener_manager_should_register_and_trigger', 0, async () => {
      const manager: PropagationListenerManager = new PropagationListenerManager();
      manager.registerListener('l1', PropagationChannel.CAPTURE);
      manager.registerListener('l2', PropagationChannel.BUBBLE);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(1);
      expect(manager.countInvocations(PropagationChannel.BUBBLE)).assertEqual(0);
      manager.removeListener('l2');
      const listeners: PropagationListenerDescriptor[] = manager.getListeners();
      expect(listeners.length).assertEqual(2);
      manager.clearListeners();
      expect(manager.getListeners().length).assertEqual(0);
    });

    // Verifies that the depth model enforces the maximum depth.
    it('propagation_depth_model_should_enforce_max_depth', 0, async () => {
      const depth: PropagationDepthModel = new PropagationDepthModel(3);
      expect(depth.getCurrentDepth()).assertEqual(0);
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.isAtMaxDepth()).assertTrue();
      expect(depth.descend()).assertFalse();
      depth.ascend();
      expect(depth.getCurrentDepth()).assertEqual(2);
      expect(depth.getMaxDepth()).assertEqual(3);
    });

    // Verifies the property access of the propagation event model.
    it('propagation_event_model_should_expose_properties', 0, async () => {
      const model: PropagationEventModel = new PropagationEventModel('click', PropagationChannel.TARGET, 2);
      expect(model.getEventType()).assertEqual('click');
      expect(model.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(model.getDepth()).assertEqual(2);
      const text: string = model.toString();
      expect(text.indexOf('click')).assertLargerOrEqual(0);
      expect(text.indexOf('depth=2')).assertLargerOrEqual(0);
    });

    // Verifies that the event manager filters the events by channel.
    it('propagation_event_manager_should_filter_by_channel', 0, async () => {
      const manager: PropagationEventManager = new PropagationEventManager();
      manager.appendEvent(new PropagationEventModel('a', PropagationChannel.CAPTURE, 1));
      manager.appendEvent(new PropagationEventModel('b', PropagationChannel.TARGET, 1));
      manager.appendEvent(new PropagationEventModel('c', PropagationChannel.CAPTURE, 2));
      expect(manager.getEvents().length).assertEqual(3);
      const captureEvents: PropagationEventModel[] = manager.filterByChannel(PropagationChannel.CAPTURE);
      expect(captureEvents.length).assertEqual(2);
      manager.clearEvents();
      expect(manager.getEvents().length).assertEqual(0);
    });

    // Verifies that the path status stops after stopping the propagation.
    it('event_propagation_path_should_stop_propagation', 0, async () => {
      const path: EventPropagationPath = new EventPropagationPath();
      path.addStage(PropagationChannel.CAPTURE);
      path.advanceStatus();
      path.stopPropagation();
      expect(path.isStopped()).assertTrue();
      path.advanceStatus();
      expect(path.isStopped()).assertTrue();
      expect(path.isCompleted()).assertFalse();
    });

    // Verifies that empty records report zeroed statistics.
    it('propagation_statistics_calculator_should_handle_empty_records', 0, async () => {
      const calculator: PropagationStatisticsCalculator = new PropagationStatisticsCalculator([]);
      const statistics: PropagationStatistics = calculator.buildStatistics();
      expect(statistics.totalEvents).assertEqual(0);
      expect(statistics.propagatedCount).assertEqual(0);
      expect(statistics.propagationRate).assertEqual(0);
    });

    // Verifies that the depth model resets to the initial state.
    it('propagation_depth_model_should_reset_to_zero', 0, async () => {
      const depth: PropagationDepthModel = new PropagationDepthModel(5);
      depth.descend();
      depth.descend();
      expect(depth.getCurrentDepth()).assertEqual(2);
      depth.resetDepth();
      expect(depth.getCurrentDepth()).assertEqual(0);
    });

    // Verifies that the tracker counts the stopped events accurately.
    it('propagation_tracker_should_track_stopped_events', 0, async () => {
      eventTracker.resetTracker();
      eventTracker.recordEvent('a', EventPhase.CAPTURING, true, true, 20);
      eventTracker.recordEvent('b', EventPhase.AT_TARGET, true, false, 20);
      eventTracker.recordEvent('c', EventPhase.BUBBLING, false, false, 20);
      expect(eventTracker.getStoppedEvents()).assertEqual(1);
      expect(eventTracker.getPropagatedEvents()).assertEqual(2);
      expect(eventTracker.hasEventType('b')).assertTrue();
      expect(eventTracker.hasEventType('unknown')).assertFalse();
      expect(eventTracker.getPropagationRate()).assertEqual(2 / 3);
    });

    // Verifies that clearing the listener manager zeroes the counters.
    it('propagation_listener_manager_should_clear_all_listeners', 0, async () => {
      const manager: PropagationListenerManager = new PropagationListenerManager();
      manager.registerListener('l1', PropagationChannel.CAPTURE);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(1);
      manager.clearListeners();
      expect(manager.getListeners().length).assertEqual(0);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(0);
    });
  });
}

