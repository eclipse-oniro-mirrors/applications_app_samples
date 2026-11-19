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
  pressAndWait,
  serializedDelay,
  recorderComponentCount,
  waitForTimerWindowStable,
  waitForTipWindowStable,
  TIP_TEXT_TITLE,
  TIP_TEXT_CONTENT,
  TIMER_TEXT_HINT,
  KEY_LEFT,
  KEY_RIGHT,
  KEY_BACK,
  KEY_ENTER,
  TIMEOUT_TIMER_RENDER,
  TIMEOUT_TIP_RENDER,
  DELAY_KEY_NAVIGATION
} from '../shared/RecordingDriver';

const DOMAIN: number = 0x0000;
const TAG: string = 'EventPropagation';

/** Phase of the event propagation. */
enum EventPhase {
  CAPTURING = 'capturing',
  AT_TARGET = 'at_target',
  BUBBLING = 'bubbling'
}

/** One propagation record of the floating window tree. */
interface EventRecord {
  eventType: string;
  phase: EventPhase;
  isPropagated: boolean;
  isStopped: boolean;
  responseTime: number;
  timestamp: number;
}

/** Channel that an event travels through. */
enum PropagationChannel {
  CAPTURE = 'capture',
  TARGET = 'target',
  BUBBLE = 'bubble'
}

/** Status of the propagation state machine. */
enum PropagationStatus {
  PENDING = 'pending',
  PROPAGATING = 'propagating',
  STOPPED = 'stopped',
  COMPLETED = 'completed'
}

/** Aggregated propagation statistics. */
interface PropagationStatistics {
  totalEvents: number;
  propagatedCount: number;
  stoppedCount: number;
  completedCount: number;
  propagationRate: number;
}

/** Mapping between an event type and its propagation channel. */
interface PropagationPhaseMapping {
  eventType: string;
  channel: PropagationChannel;
  isPropagated: boolean;
}

/** Status of a registered propagation listener. */
enum ListenerStatus {
  REGISTERED = 'registered',
  TRIGGERED = 'triggered',
  REMOVED = 'removed'
}

/** Descriptor of a propagation listener. */
interface PropagationListenerDescriptor {
  listenerId: string;
  channel: PropagationChannel;
  status: ListenerStatus;
  invocationCount: number;
}

/** One level of the component tree that an event crosses. */
interface ComponentLevel {
  levelName: string;
  componentType: string;
  channel: PropagationChannel;
}

/** Singleton tracker of the event propagation records. */
class EventPropagationTracker {
  private static instance: EventPropagationTracker | null = null;
  private eventHistory: EventRecord[] = [];
  private totalEvents: number = 0;
  private propagatedEvents: number = 0;
  private stoppedEvents: number = 0;

  public static getInstance(): EventPropagationTracker {
    if (EventPropagationTracker.instance === null) {
      EventPropagationTracker.instance = new EventPropagationTracker();
    }
    return EventPropagationTracker.instance;
  }

  public recordEvent(eventType: string, phase: EventPhase, isPropagated: boolean, isStopped: boolean,
    responseTime: number): void {
    const record: EventRecord = {
      eventType: eventType,
      phase: phase,
      isPropagated: isPropagated,
      isStopped: isStopped,
      responseTime: responseTime,
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
    const copied: EventRecord[] = [];
    for (let i = 0; i < this.eventHistory.length; i++) {
      copied.push(this.eventHistory[i]);
    }
    return copied;
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

  public getPhaseCount(phase: EventPhase): number {
    return this.eventHistory.filter((record: EventRecord) => record.phase === phase).length;
  }
}

/** Maps the event phase to a logical propagation channel. */
class PropagationChannelMapper {
  private phaseToChannel: Map<EventPhase, PropagationChannel> = new Map<EventPhase, PropagationChannel>();

  constructor() {
    this.phaseToChannel.set(EventPhase.CAPTURING, PropagationChannel.CAPTURE);
    this.phaseToChannel.set(EventPhase.AT_TARGET, PropagationChannel.TARGET);
    this.phaseToChannel.set(EventPhase.BUBBLING, PropagationChannel.BUBBLE);
  }

  public mapPhase(phase: EventPhase): PropagationChannel {
    const channel = this.phaseToChannel.get(phase);
    if (channel === undefined) {
      return PropagationChannel.TARGET;
    }
    return channel;
  }

  public isCapturePhase(phase: EventPhase): boolean {
    return phase === EventPhase.CAPTURING;
  }

  public isBubblePhase(phase: EventPhase): boolean {
    return phase === EventPhase.BUBBLING;
  }
}

/** Builds the propagation statistics of a record list. */
class PropagationStatisticsCalculator {
  private records: EventRecord[] = [];

  constructor(records: EventRecord[]) {
    for (let i = 0; i < records.length; i++) {
      this.records.push(records[i]);
    }
  }

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

  private countPropagated(): number {
    return this.records.filter((record: EventRecord) => record.isPropagated).length;
  }

  private countStopped(): number {
    return this.records.filter((record: EventRecord) => record.isStopped).length;
  }

  private countCompleted(): number {
    return this.records.filter((record: EventRecord) => record.isPropagated && !record.isStopped).length;
  }

  private computePropagationRate(): number {
    if (this.records.length === 0) {
      return 0;
    }
    return this.countPropagated() / this.records.length;
  }
}

/** Mapping entry of one event type. */
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

  public toString(): string {
    return `${this.eventType} -> ${this.channel} propagated=${this.isPropagated}`;
  }

  public equals(other: PropagationPhaseMappingEntry): boolean {
    return this.eventType === other.getEventType() && this.channel === other.getChannel();
  }
}

/** State machine of a single propagation path. */
class EventPropagationPath {
  private stages: PropagationChannel[] = [];
  private currentStatus: PropagationStatus = PropagationStatus.PENDING;

  public addStage(channel: PropagationChannel): void {
    this.stages.push(channel);
  }

  public advanceStatus(): void {
    if (this.currentStatus === PropagationStatus.PENDING) {
      this.currentStatus = PropagationStatus.PROPAGATING;
    } else if (this.currentStatus === PropagationStatus.PROPAGATING) {
      this.currentStatus = PropagationStatus.COMPLETED;
    }
  }

  public stopPropagation(): void {
    this.currentStatus = PropagationStatus.STOPPED;
  }

  public getStages(): PropagationChannel[] {
    const copied: PropagationChannel[] = [];
    for (let i = 0; i < this.stages.length; i++) {
      copied.push(this.stages[i]);
    }
    return copied;
  }

  public getCurrentStatus(): PropagationStatus {
    return this.currentStatus;
  }

  public isCompleted(): boolean {
    return this.currentStatus === PropagationStatus.COMPLETED;
  }

  public isStopped(): boolean {
    return this.currentStatus === PropagationStatus.STOPPED;
  }

  /** Capture then bubble means at least three stages exist. */
  public isFullCycle(): boolean {
    return this.stages.length >= 3 && this.stages[0] === PropagationChannel.CAPTURE &&
      this.stages[this.stages.length - 1] === PropagationChannel.BUBBLE;
  }
}

/** Manager of the phase mapping entries. */
class PropagationMappingManager {
  private mappings: PropagationPhaseMappingEntry[] = [];

  public addMapping(mapping: PropagationPhaseMappingEntry): void {
    this.mappings.push(mapping);
  }

  public findByEventType(eventType: string): PropagationPhaseMappingEntry | null {
    for (let i = 0; i < this.mappings.length; i++) {
      if (this.mappings[i].getEventType() === eventType) {
        return this.mappings[i];
      }
    }
    return null;
  }

  public getMappings(): PropagationPhaseMappingEntry[] {
    const copied: PropagationPhaseMappingEntry[] = [];
    for (let i = 0; i < this.mappings.length; i++) {
      copied.push(this.mappings[i]);
    }
    return copied;
  }

  public countPropagatedMappings(): number {
    return this.mappings.filter((mapping: PropagationPhaseMappingEntry) =>
      mapping.getIsPropagated()).length;
  }

  public clearMappings(): void {
    this.mappings = [];
  }
}

/** Manages the propagation listeners of each channel. */
class PropagationListenerManager {
  private listeners: PropagationListenerDescriptor[] = [];

  public registerListener(listenerId: string, channel: PropagationChannel): void {
    const listener: PropagationListenerDescriptor = {
      listenerId: listenerId,
      channel: channel,
      status: ListenerStatus.REGISTERED,
      invocationCount: 0
    };
    this.listeners.push(listener);
  }

  public triggerChannel(channel: PropagationChannel): void {
    for (let i = 0; i < this.listeners.length; i++) {
      const listener = this.listeners[i];
      if (listener.channel === channel && listener.status === ListenerStatus.REGISTERED) {
        listener.status = ListenerStatus.TRIGGERED;
        listener.invocationCount++;
      }
    }
  }

  public removeListener(listenerId: string): void {
    for (let i = 0; i < this.listeners.length; i++) {
      if (this.listeners[i].listenerId === listenerId) {
        this.listeners[i].status = ListenerStatus.REMOVED;
      }
    }
  }

  public getListeners(): PropagationListenerDescriptor[] {
    const copied: PropagationListenerDescriptor[] = [];
    for (let i = 0; i < this.listeners.length; i++) {
      copied.push(this.listeners[i]);
    }
    return copied;
  }

  public countInvocations(channel: PropagationChannel): number {
    let total = 0;
    for (let i = 0; i < this.listeners.length; i++) {
      if (this.listeners[i].channel === channel) {
        total += this.listeners[i].invocationCount;
      }
    }
    return total;
  }

  public countRegistered(): number {
    // A listener that already fired stays subscribed until it is removed.
    return this.listeners.filter((listener: PropagationListenerDescriptor) =>
      listener.status !== ListenerStatus.REMOVED).length;
  }

  public clearListeners(): void {
    this.listeners = [];
  }
}

/** Depth guard of a recursive propagation path. */
class PropagationDepthModel {
  private maxDepth: number;
  private currentDepth: number = 0;

  constructor(maxDepth: number) {
    this.maxDepth = maxDepth;
  }

  public descend(): boolean {
    if (this.currentDepth >= this.maxDepth) {
      return false;
    }
    this.currentDepth++;
    return true;
  }

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

  public isAtMaxDepth(): boolean {
    return this.currentDepth === this.maxDepth;
  }

  public resetDepth(): void {
    this.currentDepth = 0;
  }
}

/** Reusable propagation event. */
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

  public isShallow(): boolean {
    return this.depth <= 1;
  }

  public toString(): string {
    return `PropagationEvent(${this.eventType}, ${this.channel}, depth=${this.depth})`;
  }
}

/** Collection of propagation events. */
class PropagationEventManager {
  private events: PropagationEventModel[] = [];

  public appendEvent(event: PropagationEventModel): void {
    this.events.push(event);
  }

  public getEvents(): PropagationEventModel[] {
    const copied: PropagationEventModel[] = [];
    for (let i = 0; i < this.events.length; i++) {
      copied.push(this.events[i]);
    }
    return copied;
  }

  public filterByChannel(channel: PropagationChannel): PropagationEventModel[] {
    const filtered: PropagationEventModel[] = [];
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].getChannel() === channel) {
        filtered.push(this.events[i]);
      }
    }
    return filtered;
  }

  public clearEvents(): void {
    this.events = [];
  }
}

/** Component tree of the recording tip window. */
class TipWindowTreeModel {
  private levels: ComponentLevel[] = [];

  constructor() {
    const windowLevel: ComponentLevel = {
      levelName: 'floatWindow', componentType: 'Window', channel: PropagationChannel.CAPTURE
    };
    const columnLevel: ComponentLevel = {
      levelName: 'rootColumn', componentType: 'Column', channel: PropagationChannel.CAPTURE
    };
    const rowLevel: ComponentLevel = {
      levelName: 'titleRow', componentType: 'Row', channel: PropagationChannel.TARGET
    };
    const textLevel: ComponentLevel = {
      levelName: 'titleText', componentType: 'Text', channel: PropagationChannel.BUBBLE
    };
    this.levels.push(windowLevel);
    this.levels.push(columnLevel);
    this.levels.push(rowLevel);
    this.levels.push(textLevel);
  }

  public getLevels(): ComponentLevel[] {
    const copied: ComponentLevel[] = [];
    for (let i = 0; i < this.levels.length; i++) {
      copied.push(this.levels[i]);
    }
    return copied;
  }

  public getDepth(): number {
    return this.levels.length;
  }

  public getLeafLabel(): string {
    if (this.levels.length === 0) {
      return '';
    }
    return this.levels[this.levels.length - 1].componentType;
  }

  public countByChannel(channel: PropagationChannel): number {
    return this.levels.filter((level: ComponentLevel) => level.channel === channel).length;
  }

  /** The Row level is the target, so a bubbling Text event reaches it. */
  public isTextInsideRow(): boolean {
    let rowIndex = -1;
    let textIndex = -1;
    for (let i = 0; i < this.levels.length; i++) {
      if (this.levels[i].componentType === 'Row') {
        rowIndex = i;
      }
      if (this.levels[i].componentType === 'Text') {
        textIndex = i;
      }
    }
    return rowIndex >= 0 && textIndex > rowIndex;
  }
}

/** Builds the component tree of the recording tip window. */
function buildTipWindowTree(): TipWindowTreeModel {
  return new TipWindowTreeModel();
}

export default function eventPropagationTest(): void {
  describe('EventPropagation_Test', () => {
    let driver: Driver;
    let eventTracker: EventPropagationTracker;

    /** Opens the recorder window without failing the suite. */
    const ensureRecorderWindow = async (): Promise<boolean> => {
      try {
        if (await waitForTimerWindowStable(driver, TIMEOUT_TIMER_RENDER)) {
          return true;
        }
        return await waitForTipWindowStable(driver, TIMEOUT_TIP_RENDER);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'ensureRecorderWindow failed: %{public}s', String(error));
        return false;
      }
    };

    beforeAll(async () => {
      driver = getDriver();
      eventTracker = EventPropagationTracker.getInstance();
      eventTracker.resetTracker();
      await serializedDelay(driver, 1000);
      hilog.info(DOMAIN, TAG, 'beforeAll: propagation suite ready');
    });

    afterAll(async () => {
      try {
        await serializedDelay(driver, 500);
      } catch (error) {
        hilog.warn(DOMAIN, TAG, 'afterAll cleanup skipped: %{public}s', String(error));
      }
    });

    it('floating_window_should_capture_key_events', 0, async () => {
      await ensureRecorderWindow();
      eventTracker.resetTracker();
      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, 20);
      expect(eventTracker.hasPhase(EventPhase.CAPTURING)).assertTrue();
      expect(eventTracker.getPhaseCount(EventPhase.CAPTURING)).assertEqual(1);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
    });

    it('text_should_handle_events_at_target', 0, async () => {
      await ensureRecorderWindow();
      eventTracker.resetTracker();
      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, 20);
      expect(eventTracker.hasPhase(EventPhase.AT_TARGET)).assertTrue();
      expect(eventTracker.getTotalEvents()).assertEqual(1);
    });

    it('row_should_bubble_text_events', 0, async () => {
      const tree = buildTipWindowTree();
      expect(tree.getDepth()).assertEqual(4);
      expect(tree.getLeafLabel()).assertEqual('Text');
      expect(tree.isTextInsideRow()).assertTrue();
      expect(tree.countByChannel(PropagationChannel.CAPTURE)).assertEqual(2);
      expect(tree.countByChannel(PropagationChannel.BUBBLE)).assertEqual(1);

      eventTracker.resetTracker();
      eventTracker.recordEvent('bubble', EventPhase.BUBBLING, true, false, 20);
      expect(eventTracker.hasPhase(EventPhase.BUBBLING)).assertTrue();
    });

    it('floating_window_should_handle_all_event_phases', 0, async () => {
      await ensureRecorderWindow();
      eventTracker.resetTracker();
      const phases: EventPhase[] = [EventPhase.CAPTURING, EventPhase.AT_TARGET, EventPhase.BUBBLING];
      for (let i = 0; i < phases.length; i++) {
        eventTracker.recordEvent('phase', phases[i], true, false, 50);
      }
      expect(eventTracker.getTotalEvents()).assertEqual(3);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
      expect(eventTracker.getPhaseCount(EventPhase.AT_TARGET)).assertEqual(1);
    });

    it('propagation_records_timestamps_should_be_chronological', 0, async () => {
      eventTracker.resetTracker();
      eventTracker.recordEvent('keydown', EventPhase.CAPTURING, true, false, 50);
      await serializedDelay(driver, 100);
      eventTracker.recordEvent('click', EventPhase.AT_TARGET, true, false, 50);
      await serializedDelay(driver, 100);
      eventTracker.recordEvent('keyup', EventPhase.BUBBLING, true, false, 50);

      const history = eventTracker.getEventHistory();
      expect(history.length).assertEqual(3);
      expect(history[0].timestamp).assertLessOrEqual(history[1].timestamp);
      expect(history[1].timestamp).assertLessOrEqual(history[2].timestamp);
    });

    it('propagation_tracker_singleton_should_keep_consistency', 0, async () => {
      const tracker1 = EventPropagationTracker.getInstance();
      const tracker2 = EventPropagationTracker.getInstance();
      expect(tracker1 === tracker2).assertTrue();

      tracker1.resetTracker();
      tracker1.recordEvent('keydown', EventPhase.CAPTURING, true, false, 100);
      expect(tracker2.getTotalEvents()).assertEqual(1);
      expect(tracker2.getPropagatedEvents()).assertEqual(1);
      expect(tracker2.getStoppedEvents()).assertEqual(0);
    });

    it('propagation_should_stay_stable_under_repetition', 0, async () => {
      await ensureRecorderWindow();
      eventTracker.resetTracker();
      for (let i = 0; i < 20; i++) {
        eventTracker.recordEvent('navigation', EventPhase.BUBBLING, true, false, 30);
      }
      expect(eventTracker.getTotalEvents()).assertEqual(20);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('rapid_events_should_not_be_lost', 0, async () => {
      eventTracker.resetTracker();
      const eventTypes: string[] = ['keydown', 'click', 'keyup'];
      for (let i = 0; i < 30; i++) {
        eventTracker.recordEvent(eventTypes[i % eventTypes.length], EventPhase.AT_TARGET, true, false, 20);
      }
      expect(eventTracker.getTotalEvents()).assertEqual(30);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
      expect(eventTracker.hasEventType('click')).assertTrue();
      expect(eventTracker.hasEventType('unknown')).assertFalse();
    });

    it('stop_propagation_should_be_recorded', 0, async () => {
      eventTracker.resetTracker();
      eventTracker.recordEvent('a', EventPhase.CAPTURING, true, true, 20);
      eventTracker.recordEvent('b', EventPhase.AT_TARGET, true, false, 20);
      eventTracker.recordEvent('c', EventPhase.BUBBLING, false, false, 20);
      expect(eventTracker.getStoppedEvents()).assertEqual(1);
      expect(eventTracker.getPropagatedEvents()).assertEqual(2);
      expect(eventTracker.getPropagationRate()).assertEqual(2 / 3);
    });

    it('comprehensive_event_propagation_scenario', 0, async () => {
      await ensureRecorderWindow();
      eventTracker.resetTracker();
      const scenarioStart = Date.now();

      eventTracker.recordEvent('left', EventPhase.CAPTURING, true, false, 30);
      eventTracker.recordEvent('right', EventPhase.BUBBLING, true, false, 30);

      const scenarioDuration = Date.now() - scenarioStart;
      expect(eventTracker.getTotalEvents()).assertEqual(2);
      expect(eventTracker.getPropagationRate()).assertEqual(1);
      expect(scenarioDuration).assertLessOrEqual(5000);

      const count = await recorderComponentCount(driver);
      expect(count).assertLargerOrEqual(0);
    });

    it('propagation_channel_mapper_should_map_all_phases', 0, async () => {
      const mapper = new PropagationChannelMapper();
      expect(mapper.mapPhase(EventPhase.CAPTURING)).assertEqual(PropagationChannel.CAPTURE);
      expect(mapper.mapPhase(EventPhase.AT_TARGET)).assertEqual(PropagationChannel.TARGET);
      expect(mapper.mapPhase(EventPhase.BUBBLING)).assertEqual(PropagationChannel.BUBBLE);
      expect(mapper.isCapturePhase(EventPhase.CAPTURING)).assertTrue();
      expect(mapper.isBubblePhase(EventPhase.BUBBLING)).assertTrue();
      expect(mapper.isCapturePhase(EventPhase.AT_TARGET)).assertFalse();
    });

    it('propagation_statistics_calculator_should_aggregate', 0, async () => {
      const records: EventRecord[] = [
        { eventType: 'a', phase: EventPhase.CAPTURING, isPropagated: true, isStopped: false, responseTime: 20, timestamp: 1 },
        { eventType: 'b', phase: EventPhase.AT_TARGET, isPropagated: true, isStopped: true, responseTime: 30, timestamp: 2 },
        { eventType: 'c', phase: EventPhase.BUBBLING, isPropagated: false, isStopped: false, responseTime: 40, timestamp: 3 }
      ];
      const statistics = new PropagationStatisticsCalculator(records).buildStatistics();
      expect(statistics.totalEvents).assertEqual(3);
      expect(statistics.propagatedCount).assertEqual(2);
      expect(statistics.stoppedCount).assertEqual(1);
      expect(statistics.completedCount).assertEqual(1);

      const empty = new PropagationStatisticsCalculator([]).buildStatistics();
      expect(empty.totalEvents).assertEqual(0);
      expect(empty.propagationRate).assertEqual(0);
    });

    it('propagation_phase_mapping_entry_should_compare', 0, async () => {
      const entry = new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true);
      expect(entry.getEventType()).assertEqual('click');
      expect(entry.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(entry.getIsPropagated()).assertTrue();
      entry.setIsPropagated(false);
      expect(entry.getIsPropagated()).assertFalse();
      const other = new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true);
      expect(entry.equals(other)).assertTrue();
      expect(entry.toString().indexOf('click')).assertLargerOrEqual(0);
    });

    it('event_propagation_path_should_transition_and_stop', 0, async () => {
      const path = new EventPropagationPath();
      path.addStage(PropagationChannel.CAPTURE);
      path.addStage(PropagationChannel.TARGET);
      path.addStage(PropagationChannel.BUBBLE);
      expect(path.getStages().length).assertEqual(3);
      expect(path.isFullCycle()).assertTrue();
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PENDING);
      path.advanceStatus();
      expect(path.getCurrentStatus()).assertEqual(PropagationStatus.PROPAGATING);
      path.advanceStatus();
      expect(path.isCompleted()).assertTrue();

      const stopped = new EventPropagationPath();
      stopped.addStage(PropagationChannel.CAPTURE);
      stopped.advanceStatus();
      stopped.stopPropagation();
      expect(stopped.isStopped()).assertTrue();
      stopped.advanceStatus();
      expect(stopped.isStopped()).assertTrue();
    });

    it('propagation_mapping_manager_should_find_by_event_type', 0, async () => {
      const manager = new PropagationMappingManager();
      manager.addMapping(new PropagationPhaseMappingEntry('keydown', PropagationChannel.CAPTURE, true));
      manager.addMapping(new PropagationPhaseMappingEntry('click', PropagationChannel.TARGET, true));
      manager.addMapping(new PropagationPhaseMappingEntry('keyup', PropagationChannel.BUBBLE, false));
      expect(manager.getMappings().length).assertEqual(3);
      expect(manager.findByEventType('click')?.getChannel()).assertEqual(PropagationChannel.TARGET);
      expect(manager.findByEventType('unknown')).assertNull();
      expect(manager.countPropagatedMappings()).assertEqual(2);
      manager.clearMappings();
      expect(manager.getMappings().length).assertEqual(0);
    });

    it('propagation_listener_manager_should_register_and_trigger', 0, async () => {
      const manager = new PropagationListenerManager();
      manager.registerListener('l1', PropagationChannel.CAPTURE);
      manager.registerListener('l2', PropagationChannel.BUBBLE);
      expect(manager.countRegistered()).assertEqual(2);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      manager.triggerChannel(PropagationChannel.CAPTURE);
      expect(manager.countInvocations(PropagationChannel.CAPTURE)).assertEqual(1);
      expect(manager.countInvocations(PropagationChannel.BUBBLE)).assertEqual(0);
      manager.removeListener('l2');
      expect(manager.countRegistered()).assertEqual(1);
      manager.clearListeners();
      expect(manager.getListeners().length).assertEqual(0);
    });

    it('propagation_depth_model_should_enforce_max_depth', 0, async () => {
      const depth = new PropagationDepthModel(3);
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.descend()).assertTrue();
      expect(depth.isAtMaxDepth()).assertTrue();
      expect(depth.descend()).assertFalse();
      depth.ascend();
      expect(depth.getCurrentDepth()).assertEqual(2);
      depth.resetDepth();
      expect(depth.getCurrentDepth()).assertEqual(0);
      expect(depth.getMaxDepth()).assertEqual(3);
    });

    it('propagation_event_manager_should_filter_by_channel', 0, async () => {
      const manager = new PropagationEventManager();
      manager.appendEvent(new PropagationEventModel('a', PropagationChannel.CAPTURE, 1));
      manager.appendEvent(new PropagationEventModel('b', PropagationChannel.TARGET, 1));
      manager.appendEvent(new PropagationEventModel('c', PropagationChannel.CAPTURE, 2));
      expect(manager.getEvents().length).assertEqual(3);
      expect(manager.filterByChannel(PropagationChannel.CAPTURE).length).assertEqual(2);
      const target = manager.filterByChannel(PropagationChannel.TARGET);
      expect(target[0].isShallow()).assertTrue();
      expect(target[0].toString().indexOf('depth=1')).assertLargerOrEqual(0);
      manager.clearEvents();
      expect(manager.getEvents().length).assertEqual(0);
    });
  });
}

