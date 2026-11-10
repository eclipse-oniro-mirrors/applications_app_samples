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

const PROCESS_CREATED: string = 'created';

const PROCESS_FOREGROUND: string = 'foreground';

const PROCESS_BACKGROUND: string = 'background';

const PROCESS_CACHED: string = 'cached';

const PROCESS_KILLED: string = 'killed';

const PRESSURE_LOW: string = 'low';

const PRESSURE_MEDIUM: string = 'medium';

const PRESSURE_HIGH: string = 'high';

const PRESSURE_CRITICAL: string = 'critical';

const MAX_PROCESS_EVENTS: number = 32;

const CACHE_TIMEOUT_MS: number = 60000;

interface ProcessEvent {
  name: string;
  timestamp: number;
}

// Tracks the app process lifecycle state machine
class ProcessLifecycleManager {
  private state: string = PROCESS_CREATED;
  private eventList: ProcessEvent[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public moveTo(next: string, now: number): boolean {
    if (!ProcessLifecycleManager.isTransitionAllowed(this.state, next)) {
      return false;
    }
    this.state = next;
    this.record(next, now);
    return true;
  }

  public static isTransitionAllowed(from: string, to: string): boolean {
    if (from === PROCESS_KILLED) {
      return false;
    }
    if (to === PROCESS_KILLED) {
      return true;
    }
    if (from === PROCESS_CREATED) {
      return to === PROCESS_FOREGROUND;
    }
    if (from === PROCESS_FOREGROUND) {
      return to === PROCESS_BACKGROUND;
    }
    if (from === PROCESS_BACKGROUND) {
      return to === PROCESS_FOREGROUND || to === PROCESS_CACHED;
    }
    if (from === PROCESS_CACHED) {
      return to === PROCESS_FOREGROUND || to === PROCESS_BACKGROUND;
    }
    return false;
  }

  private record(name: string, now: number): void {
    if (this.eventList.length >= this.capacity) {
      this.eventList.shift();
    }
    this.eventList.push({ name: name, timestamp: now });
  }

  public getState(): string {
    return this.state;
  }

  public isForeground(): boolean {
    return this.state === PROCESS_FOREGROUND;
  }

  public isKilled(): boolean {
    return this.state === PROCESS_KILLED;
  }

  public isCached(): boolean {
    return this.state === PROCESS_CACHED;
  }

  public events(): ProcessEvent[] {
    return [...this.eventList];
  }

  public eventCount(): number {
    return this.eventList.length;
  }

  public reset(): void {
    this.state = PROCESS_CREATED;
    this.eventList = [];
  }
}

// Reacts to system memory pressure levels
class MemoryPressureHandler {
  private current: string = PRESSURE_LOW;
  private reactions: number = 0;

  public onPressure(level: string, now: number): boolean {
    if (!MemoryPressureHandler.isKnown(level)) {
      return false;
    }
    this.current = level;
    this.reactions++;
    return true;
  }

  public static isKnown(level: string): boolean {
    return level === PRESSURE_LOW || level === PRESSURE_MEDIUM ||
      level === PRESSURE_HIGH || level === PRESSURE_CRITICAL;
  }

  public getLevel(): string {
    return this.current;
  }

  public getReactions(): number {
    return this.reactions;
  }

  public shouldReleaseCaches(): boolean {
    return this.current === PRESSURE_HIGH || this.current === PRESSURE_CRITICAL;
  }

  public shouldTrimThumbnails(): boolean {
    return this.current === PRESSURE_CRITICAL;
  }

  public shouldNotifyUser(): boolean {
    return this.current === PRESSURE_CRITICAL;
  }

  public reset(): void {
    this.current = PRESSURE_LOW;
    this.reactions = 0;
  }
}

// Collects process lifecycle checks for release gating
class ProcessReport {
  private checks: string[] = [];
  private failureItems: string[] = [];

  public check(name: string, passed: boolean): void {
    this.checks.push(name);
    if (!passed) {
      this.failureItems.push(name);
    }
  }

  public count(): number {
    return this.checks.length;
  }

  public failures(): string[] {
    return [...this.failureItems];
  }

  public isPassed(): boolean {
    return this.checks.length > 0 && this.failureItems.length === 0;
  }

  public summary(): string {
    return this.isPassed() ? 'healthy' : 'degraded';
  }

  public reset(): void {
    this.checks = [];
    this.failureItems = [];
  }
}

// Decides whether a cached process should be released
class CacheEvictionPolicy {
  public static shouldEvict(state: string, lastActiveAt: number, now: number): boolean {
    if (state !== PROCESS_CACHED) {
      return false;
    }
    return now - lastActiveAt > CACHE_TIMEOUT_MS;
  }

  public static evictionCandidates(states: string[], lastActive: number[], now: number): number[] {
    const result: number[] = [];
    for (let i = 0; i < states.length && i < lastActive.length; i++) {
      if (CacheEvictionPolicy.shouldEvict(states[i], lastActive[i], now)) {
        result.push(i);
      }
    }
    return result;
  }

  public static isWithinTimeout(elapsedMs: number): boolean {
    return elapsedMs >= 0 && elapsedMs <= CACHE_TIMEOUT_MS;
  }
}

export default function processLifecycleTest() {
  describe('ProcessLifecycle_Test', () => {

    it('process_should_start_created', 0, () => {
      const manager = new ProcessLifecycleManager(MAX_PROCESS_EVENTS);
      expect(manager.getState()).assertEqual(PROCESS_CREATED);
      expect(manager.isForeground()).assertFalse();
      expect(manager.isKilled()).assertFalse();
      expect(manager.eventCount()).assertEqual(0);
    });

    it('process_should_move_foreground', 0, () => {
      const manager = new ProcessLifecycleManager(MAX_PROCESS_EVENTS);
      expect(manager.moveTo(PROCESS_FOREGROUND, 100)).assertTrue();
      expect(manager.isForeground()).assertTrue();
      expect(manager.eventCount()).assertEqual(1);
      expect(manager.events()[0].name).assertEqual(PROCESS_FOREGROUND);
      expect(manager.events()[0].timestamp).assertEqual(100);
    });

    it('process_should_follow_allowed_path', 0, () => {
      const manager = new ProcessLifecycleManager(MAX_PROCESS_EVENTS);
      expect(manager.moveTo(PROCESS_FOREGROUND, 100)).assertTrue();
      expect(manager.moveTo(PROCESS_BACKGROUND, 200)).assertTrue();
      expect(manager.moveTo(PROCESS_CACHED, 300)).assertTrue();
      expect(manager.isCached()).assertTrue();
      expect(manager.moveTo(PROCESS_FOREGROUND, 400)).assertTrue();
      expect(manager.eventCount()).assertEqual(4);
    });

    it('process_should_reject_invalid_transitions', 0, () => {
      const manager = new ProcessLifecycleManager(MAX_PROCESS_EVENTS);
      expect(manager.moveTo(PROCESS_BACKGROUND, 100)).assertFalse();
      expect(manager.moveTo(PROCESS_CACHED, 100)).assertFalse();
      expect(manager.getState()).assertEqual(PROCESS_CREATED);
      expect(manager.eventCount()).assertEqual(0);
    });

    it('process_should_allow_kill_from_any_state', 0, () => {
      const manager = new ProcessLifecycleManager(MAX_PROCESS_EVENTS);
      expect(manager.moveTo(PROCESS_KILLED, 100)).assertTrue();
      expect(manager.isKilled()).assertTrue();
      expect(manager.moveTo(PROCESS_FOREGROUND, 200)).assertFalse();
      expect(ProcessLifecycleManager.isTransitionAllowed(PROCESS_KILLED, PROCESS_FOREGROUND))
        .assertFalse();
    });

    it('process_should_bound_event_history', 0, () => {
      const manager = new ProcessLifecycleManager(2);
      manager.moveTo(PROCESS_FOREGROUND, 100);
      manager.moveTo(PROCESS_BACKGROUND, 200);
      manager.moveTo(PROCESS_FOREGROUND, 300);
      expect(manager.eventCount()).assertEqual(2);
      expect(manager.events()[1].timestamp).assertEqual(300);
      manager.reset();
      expect(manager.getState()).assertEqual(PROCESS_CREATED);
      expect(manager.eventCount()).assertEqual(0);
    });

    it('pressure_should_handle_levels', 0, () => {
      const handler = new MemoryPressureHandler();
      expect(handler.onPressure(PRESSURE_MEDIUM, 100)).assertTrue();
      expect(handler.getLevel()).assertEqual(PRESSURE_MEDIUM);
      expect(handler.getReactions()).assertEqual(1);
      expect(handler.shouldReleaseCaches()).assertFalse();
      expect(handler.shouldTrimThumbnails()).assertFalse();
    });

    it('pressure_should_release_caches_on_high', 0, () => {
      const handler = new MemoryPressureHandler();
      handler.onPressure(PRESSURE_HIGH, 100);
      expect(handler.shouldReleaseCaches()).assertTrue();
      expect(handler.shouldTrimThumbnails()).assertFalse();
      expect(handler.shouldNotifyUser()).assertFalse();
    });

    it('pressure_should_trim_on_critical', 0, () => {
      const handler = new MemoryPressureHandler();
      handler.onPressure(PRESSURE_CRITICAL, 100);
      expect(handler.shouldReleaseCaches()).assertTrue();
      expect(handler.shouldTrimThumbnails()).assertTrue();
      expect(handler.shouldNotifyUser()).assertTrue();
    });

    it('pressure_should_reject_unknown_level', 0, () => {
      const handler = new MemoryPressureHandler();
      expect(handler.onPressure('unknown', 100)).assertFalse();
      expect(handler.getReactions()).assertEqual(0);
      expect(handler.getLevel()).assertEqual(PRESSURE_LOW);
      expect(MemoryPressureHandler.isKnown(PRESSURE_LOW)).assertTrue();
      expect(MemoryPressureHandler.isKnown('unknown')).assertFalse();
    });

    it('cache_policy_should_evict_after_timeout', 0, () => {
      expect(CacheEvictionPolicy.shouldEvict(PROCESS_CACHED, 0, CACHE_TIMEOUT_MS)).assertFalse();
      expect(CacheEvictionPolicy.shouldEvict(PROCESS_CACHED, 0, CACHE_TIMEOUT_MS + 1)).assertTrue();
      expect(CacheEvictionPolicy.shouldEvict(PROCESS_FOREGROUND, 0, CACHE_TIMEOUT_MS + 1))
        .assertFalse();
      expect(CacheEvictionPolicy.isWithinTimeout(CACHE_TIMEOUT_MS)).assertTrue();
      expect(CacheEvictionPolicy.isWithinTimeout(CACHE_TIMEOUT_MS + 1)).assertFalse();
    });

    it('cache_policy_should_find_candidates', 0, () => {
      const states: string[] = [PROCESS_CACHED, PROCESS_FOREGROUND, PROCESS_CACHED];
      const lastActive: number[] = [0, 0, CACHE_TIMEOUT_MS];
      const candidates = CacheEvictionPolicy.evictionCandidates(states, lastActive,
        CACHE_TIMEOUT_MS + 1);
      expect(candidates.length).assertEqual(1);
      expect(candidates[0]).assertEqual(0);
      expect(CacheEvictionPolicy.evictionCandidates([], [], 0).length).assertEqual(0);
    });

    it('report_should_aggregate_process_checks', 0, () => {
      const report = new ProcessReport();
      report.check('foreground', true);
      report.check('memory', true);
      expect(report.count()).assertEqual(2);
      expect(report.isPassed()).assertTrue();
      expect(report.summary()).assertEqual('healthy');
      report.check('cache', false);
      expect(report.summary()).assertEqual('degraded');
      expect(report.failures()).assertDeepEquals(['cache']);
      report.reset();
      expect(report.count()).assertEqual(0);
    });

    it('process_flow_should_survive_pressure', 0, () => {
      const manager = new ProcessLifecycleManager(MAX_PROCESS_EVENTS);
      const handler = new MemoryPressureHandler();
      const report = new ProcessReport();
      manager.moveTo(PROCESS_FOREGROUND, 100);
      manager.moveTo(PROCESS_BACKGROUND, 200);
      manager.moveTo(PROCESS_CACHED, 300);
      handler.onPressure(PRESSURE_HIGH, 350);
      const candidates = CacheEvictionPolicy.evictionCandidates(
        [manager.getState()], [300], 300 + CACHE_TIMEOUT_MS + 1);
      report.check('cached', manager.isCached());
      report.check('caches', handler.shouldReleaseCaches());
      report.check('candidate', candidates.length === 1);
      expect(report.isPassed()).assertTrue();
      expect(manager.eventCount()).assertEqual(3);
      expect(handler.getReactions()).assertEqual(1);
    });

    it('process_flow_should_kill_and_report', 0, () => {
      const manager = new ProcessLifecycleManager(MAX_PROCESS_EVENTS);
      const report = new ProcessReport();
      manager.moveTo(PROCESS_FOREGROUND, 100);
      manager.moveTo(PROCESS_KILLED, 200);
      report.check('killed', manager.isKilled());
      report.check('frozen', !manager.isForeground());
      expect(report.isPassed()).assertTrue();
      expect(manager.eventCount()).assertEqual(2);
      expect(manager.moveTo(PROCESS_FOREGROUND, 300)).assertFalse();
    });

    it('process_constants_should_be_stable', 0, () => {
      expect(PROCESS_CREATED).assertEqual('created');
      expect(PROCESS_FOREGROUND).assertEqual('foreground');
      expect(PROCESS_BACKGROUND).assertEqual('background');
      expect(PROCESS_CACHED).assertEqual('cached');
      expect(PROCESS_KILLED).assertEqual('killed');
      expect(PRESSURE_LOW).assertEqual('low');
      expect(PRESSURE_MEDIUM).assertEqual('medium');
      expect(PRESSURE_HIGH).assertEqual('high');
      expect(PRESSURE_CRITICAL).assertEqual('critical');
      expect(MAX_PROCESS_EVENTS).assertEqual(32);
      expect(CACHE_TIMEOUT_MS).assertEqual(60000);
    });
  });
}

