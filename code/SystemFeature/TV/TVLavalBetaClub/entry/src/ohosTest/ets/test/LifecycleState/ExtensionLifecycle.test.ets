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

const EXT_CREATED: string = 'created';

const EXT_STARTED: string = 'started';

const EXT_STOPPED: string = 'stopped';

const EXT_DESTROYED: string = 'destroyed';

const EXT_TYPE_SERVICE: string = 'service';

const EXT_TYPE_WORK: string = 'work';

const EXT_TYPE_FORM: string = 'form';

const MAX_EXTENSIONS: number = 8;

interface ExtensionRecord {
  id: string;
  type: string;
  state: string;
  createdAt: number;
}

// Validates extension identifiers and types
class ExtensionValidator {
  public static isIdValid(id: string): boolean {
    const pattern: RegExp = new RegExp('^[A-Za-z0-9_-]{3,64}$');
    return pattern.test(id);
  }

  public static isTypeValid(type: string): boolean {
    return type === EXT_TYPE_SERVICE || type === EXT_TYPE_WORK || type === EXT_TYPE_FORM;
  }

  public static isStateValid(state: string): boolean {
    return state === EXT_CREATED || state === EXT_STARTED ||
      state === EXT_STOPPED || state === EXT_DESTROYED;
  }

  public static isValid(record: ExtensionRecord): boolean {
    return ExtensionValidator.isIdValid(record.id) &&
      ExtensionValidator.isTypeValid(record.type) &&
      ExtensionValidator.isStateValid(record.state);
  }
}

// Tracks extension lifecycle with guarded transitions
class ExtensionLifecycleManager {
  private extensions: Map<string, ExtensionRecord> = new Map<string, ExtensionRecord>();
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public create(id: string, type: string, now: number): boolean {
    if (this.extensions.has(id) || this.extensions.size >= this.capacity) {
      return false;
    }
    if (!ExtensionValidator.isIdValid(id) || !ExtensionValidator.isTypeValid(type)) {
      return false;
    }
    this.extensions.set(id, {
      id: id,
      type: type,
      state: EXT_CREATED,
      createdAt: now
    });
    return true;
  }

  public start(id: string): boolean {
    return this.transition(id, EXT_CREATED, EXT_STARTED);
  }

  public stop(id: string): boolean {
    return this.transition(id, EXT_STARTED, EXT_STOPPED);
  }

  public destroy(id: string): boolean {
    const record = this.extensions.get(id);
    if (record === undefined) {
      return false;
    }
    if (record.state === EXT_CREATED || record.state === EXT_STOPPED) {
      record.state = EXT_DESTROYED;
      return true;
    }
    return false;
  }

  public stateOf(id: string): string {
    const record = this.extensions.get(id);
    return record === undefined ? '' : record.state;
  }

  public isRunning(id: string): boolean {
    return this.stateOf(id) === EXT_STARTED;
  }

  public size(): number {
    return this.extensions.size;
  }

  public runningCount(): number {
    let count: number = 0;
    this.extensions.forEach((record: ExtensionRecord) => {
      if (record.state === EXT_STARTED) {
        count++;
      }
    });
    return count;
  }

  public extensionsOfType(type: string): ExtensionRecord[] {
    const result: ExtensionRecord[] = [];
    this.extensions.forEach((record: ExtensionRecord) => {
      if (record.type === type) {
        result.push(record);
      }
    });
    return result;
  }

  public purgeDestroyed(): number {
    const remove: string[] = [];
    this.extensions.forEach((record: ExtensionRecord, id: string) => {
      if (record.state === EXT_DESTROYED) {
        remove.push(id);
      }
    });
    for (let i = 0; i < remove.length; i++) {
      this.extensions.delete(remove[i]);
    }
    return remove.length;
  }

  private transition(id: string, from: string, to: string): boolean {
    const record = this.extensions.get(id);
    if (record === undefined || record.state !== from) {
      return false;
    }
    record.state = to;
    return true;
  }

  public clear(): void {
    this.extensions = new Map<string, ExtensionRecord>();
  }
}

// Counts extension lifecycle events
class ExtensionEventLog {
  private events: string[] = [];
  private readonly capacity: number;

  constructor(capacity: number) {
    this.capacity = capacity;
  }

  public record(id: string, action: string): void {
    if (this.capacity <= 0 || id.length === 0) {
      return;
    }
    if (this.events.length >= this.capacity) {
      this.events.shift();
    }
    this.events.push(`${id}:${action}`);
  }

  public count(): number {
    return this.events.length;
  }

  public countOf(action: string): number {
    let count: number = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].endsWith(`:${action}`)) {
        count++;
      }
    }
    return count;
  }

  public latest(): string {
    return this.events.length === 0 ? '' : this.events[this.events.length - 1];
  }

  public clear(): void {
    this.events = [];
  }
}

export default function extensionLifecycleTest() {
  describe('ExtensionLifecycle_Test', () => {

    it('validator_should_check_ids_and_types', 0, () => {
      expect(ExtensionValidator.isIdValid('ext-01')).assertTrue();
      expect(ExtensionValidator.isIdValid('ab')).assertFalse();
      expect(ExtensionValidator.isIdValid('bad id')).assertFalse();
      expect(ExtensionValidator.isTypeValid(EXT_TYPE_SERVICE)).assertTrue();
      expect(ExtensionValidator.isTypeValid(EXT_TYPE_WORK)).assertTrue();
      expect(ExtensionValidator.isTypeValid(EXT_TYPE_FORM)).assertTrue();
      expect(ExtensionValidator.isTypeValid('unknown')).assertFalse();
    });

    it('validator_should_check_states', 0, () => {
      expect(ExtensionValidator.isStateValid(EXT_CREATED)).assertTrue();
      expect(ExtensionValidator.isStateValid(EXT_STARTED)).assertTrue();
      expect(ExtensionValidator.isStateValid(EXT_STOPPED)).assertTrue();
      expect(ExtensionValidator.isStateValid(EXT_DESTROYED)).assertTrue();
      expect(ExtensionValidator.isStateValid('unknown')).assertFalse();
      expect(ExtensionValidator.isValid({
        id: 'ext-01', type: EXT_TYPE_SERVICE, state: EXT_CREATED, createdAt: 0
      })).assertTrue();
    });

    it('manager_should_create_and_start', 0, () => {
      const manager = new ExtensionLifecycleManager(MAX_EXTENSIONS);
      expect(manager.create('ext-01', EXT_TYPE_SERVICE, 100)).assertTrue();
      expect(manager.stateOf('ext-01')).assertEqual(EXT_CREATED);
      expect(manager.start('ext-01')).assertTrue();
      expect(manager.stateOf('ext-01')).assertEqual(EXT_STARTED);
      expect(manager.isRunning('ext-01')).assertTrue();
      expect(manager.runningCount()).assertEqual(1);
    });

    it('manager_should_reject_invalid_creation', 0, () => {
      const manager = new ExtensionLifecycleManager(MAX_EXTENSIONS);
      expect(manager.create('ab', EXT_TYPE_SERVICE, 0)).assertFalse();
      expect(manager.create('ext-01', 'unknown', 0)).assertFalse();
      expect(manager.create('ext-01', EXT_TYPE_SERVICE, 0)).assertTrue();
      expect(manager.create('ext-01', EXT_TYPE_SERVICE, 0)).assertFalse();
      expect(manager.size()).assertEqual(1);
    });

    it('manager_should_guard_transitions', 0, () => {
      const manager = new ExtensionLifecycleManager(MAX_EXTENSIONS);
      manager.create('ext-01', EXT_TYPE_SERVICE, 0);
      expect(manager.stop('ext-01')).assertFalse();
      expect(manager.destroy('ext-01')).assertTrue();
      expect(manager.start('ext-01')).assertFalse();
      expect(manager.stateOf('ext-01')).assertEqual(EXT_DESTROYED);
      expect(manager.destroy('ext-01')).assertFalse();
      expect(manager.destroy('missing')).assertFalse();
    });

    it('manager_should_start_stop_destroy', 0, () => {
      const manager = new ExtensionLifecycleManager(MAX_EXTENSIONS);
      manager.create('ext-01', EXT_TYPE_WORK, 0);
      expect(manager.start('ext-01')).assertTrue();
      expect(manager.stop('ext-01')).assertTrue();
      expect(manager.stateOf('ext-01')).assertEqual(EXT_STOPPED);
      expect(manager.destroy('ext-01')).assertTrue();
      expect(manager.runningCount()).assertEqual(0);
      expect(manager.purgeDestroyed()).assertEqual(1);
      expect(manager.size()).assertEqual(0);
    });

    it('manager_should_enforce_capacity', 0, () => {
      const manager = new ExtensionLifecycleManager(2);
      expect(manager.create('ext-01', EXT_TYPE_SERVICE, 0)).assertTrue();
      expect(manager.create('ext-02', EXT_TYPE_WORK, 0)).assertTrue();
      expect(manager.create('ext-03', EXT_TYPE_FORM, 0)).assertFalse();
      manager.start('ext-01');
      manager.stop('ext-01');
      manager.destroy('ext-01');
      manager.purgeDestroyed();
      expect(manager.create('ext-03', EXT_TYPE_FORM, 0)).assertTrue();
      expect(manager.size()).assertEqual(2);
    });

    it('manager_should_filter_by_type', 0, () => {
      const manager = new ExtensionLifecycleManager(MAX_EXTENSIONS);
      manager.create('ext-01', EXT_TYPE_SERVICE, 0);
      manager.create('ext-02', EXT_TYPE_SERVICE, 0);
      manager.create('ext-03', EXT_TYPE_WORK, 0);
      expect(manager.extensionsOfType(EXT_TYPE_SERVICE).length).assertEqual(2);
      expect(manager.extensionsOfType(EXT_TYPE_WORK).length).assertEqual(1);
      expect(manager.extensionsOfType(EXT_TYPE_FORM).length).assertEqual(0);
      manager.clear();
      expect(manager.size()).assertEqual(0);
      expect(manager.stateOf('ext-01')).assertEqual('');
    });

    it('event_log_should_track_lifecycle', 0, () => {
      const log = new ExtensionEventLog(3);
      log.record('ext-01', 'create');
      log.record('ext-01', 'start');
      log.record('ext-01', 'stop');
      expect(log.count()).assertEqual(3);
      expect(log.countOf('start')).assertEqual(1);
      expect(log.latest()).assertEqual('ext-01:stop');
      log.record('ext-01', 'destroy');
      expect(log.count()).assertEqual(3);
      expect(log.countOf('create')).assertEqual(0);
      log.clear();
      expect(log.count()).assertEqual(0);
      expect(log.latest()).assertEqual('');
    });

    it('extension_flow_should_reach_destroyed', 0, () => {
      const manager = new ExtensionLifecycleManager(MAX_EXTENSIONS);
      const log = new ExtensionEventLog(10);
      if (manager.create('ext-01', EXT_TYPE_WORK, 0)) {
        log.record('ext-01', 'create');
      }
      if (manager.start('ext-01')) {
        log.record('ext-01', 'start');
      }
      expect(manager.isRunning('ext-01')).assertTrue();
      if (manager.stop('ext-01')) {
        log.record('ext-01', 'stop');
      }
      if (manager.destroy('ext-01')) {
        log.record('ext-01', 'destroy');
      }
      expect(manager.stateOf('ext-01')).assertEqual(EXT_DESTROYED);
      expect(log.countOf('create')).assertEqual(1);
      expect(log.countOf('destroy')).assertEqual(1);
      expect(manager.purgeDestroyed()).assertEqual(1);
    });

    it('extension_constants_should_be_stable', 0, () => {
      expect(EXT_CREATED).assertEqual('created');
      expect(EXT_STARTED).assertEqual('started');
      expect(EXT_STOPPED).assertEqual('stopped');
      expect(EXT_DESTROYED).assertEqual('destroyed');
      expect(EXT_TYPE_SERVICE).assertEqual('service');
      expect(EXT_TYPE_WORK).assertEqual('work');
      expect(EXT_TYPE_FORM).assertEqual('form');
      expect(MAX_EXTENSIONS).assertEqual(8);
    });
  });
}

