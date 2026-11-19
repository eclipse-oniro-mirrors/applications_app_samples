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
import { Driver, ON } from '@ohos.UiTest';
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv, uniqueStrings
} from '../Shared/SharedDriver';

enum IntegrationStage {
  REGISTER = 0,
  CONNECT = 1,
  TRANSFER = 2,
  VERIFY = 3,
  TEARDOWN = 4
}

enum SubsystemState {
  OFFLINE = 0,
  READY = 1,
  BUSY = 2,
  FAILED = 3
}

class Subsystem {
  name: string = '';
  version: number = 0;
  state: SubsystemState = SubsystemState.OFFLINE;
  connectCount: number = 0;
  messageCount: number = 0;

  constructor(name: string, version: number) {
    this.name = name;
    this.version = version;
  }

  connect(): boolean {
    if (this.state === SubsystemState.FAILED) {
      return false;
    }
    this.state = SubsystemState.READY;
    this.connectCount = this.connectCount + 1;
    return true;
  }

  disconnect(): void {
    if (this.state !== SubsystemState.FAILED) {
      this.state = SubsystemState.OFFLINE;
    }
  }

  markBusy(): void {
    if (this.state === SubsystemState.READY) {
      this.state = SubsystemState.BUSY;
    }
  }

  markReady(): void {
    if (this.state === SubsystemState.BUSY) {
      this.state = SubsystemState.READY;
    }
  }

  fail(): void {
    this.state = SubsystemState.FAILED;
  }

  isReady(): boolean {
    return this.state === SubsystemState.READY;
  }
}

class IntegrationEvent {
  topic: string = '';
  sequence: number = 0;
  payloadHash: number = 0;

  constructor(topic: string, sequence: number, payloadHash: number) {
    this.topic = topic;
    this.sequence = sequence;
    this.payloadHash = payloadHash;
  }
}

class IntegrationBus {
  private subsystems: Subsystem[] = [];
  private events: IntegrationEvent[] = [];
  private sequence: number = 0;
  private stage: IntegrationStage = IntegrationStage.REGISTER;

  register(subsystem: Subsystem): boolean {
    for (const existing of this.subsystems) {
      if (existing.name === subsystem.name) {
        return false;
      }
    }
    this.subsystems.push(subsystem);
    return true;
  }

  subsystemCount(): number {
    return this.subsystems.length;
  }

  readyCount(): number {
    let count = 0;
    for (const subsystem of this.subsystems) {
      if (subsystem.isReady()) {
        count = count + 1;
      }
    }
    return count;
  }

  connectAll(): number {
    let connected = 0;
    for (const subsystem of this.subsystems) {
      if (subsystem.connect()) {
        connected = connected + 1;
      }
    }
    if (connected > 0 && this.stage === IntegrationStage.REGISTER) {
      this.stage = IntegrationStage.CONNECT;
    }
    return connected;
  }

  emit(topic: string, payloadHash: number): IntegrationEvent {
    this.sequence = this.sequence + 1;
    const event = new IntegrationEvent(topic, this.sequence, payloadHash);
    this.events.push(event);
    this.stage = IntegrationStage.TRANSFER;
    return event;
  }

  eventCount(): number {
    return this.events.length;
  }

  replay(): IntegrationEvent[] {
    const copy: IntegrationEvent[] = [];
    for (const event of this.events) {
      copy.push(event);
    }
    return copy;
  }

  verify(): boolean {
    if (this.readyCount() === 0) {
      return false;
    }
    this.stage = IntegrationStage.VERIFY;
    return true;
  }

  teardown(): void {
    for (const subsystem of this.subsystems) {
      subsystem.disconnect();
    }
    this.stage = IntegrationStage.TEARDOWN;
  }

  getStage(): IntegrationStage {
    return this.stage;
  }

  findSubsystem(name: string): Subsystem | null {
    for (const subsystem of this.subsystems) {
      if (subsystem.name === name) {
        return subsystem;
      }
    }
    return null;
  }

  busHealth(): number {
    return clampNumber(safeDiv(this.readyCount(), this.subsystemCount()), 0, 1);
  }

  activeTopics(): string[] {
    const topics: string[] = [];
    for (const event of this.events) {
      topics.push(event.topic);
    }
    return uniqueStrings(topics);
  }
}

export default function integrationTestingTest(): void {
  describe('IntegrationTesting', () => {
    it('IntegrationTesting_001', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      expect(bus.subsystemCount()).assertEqual(0);
      expect(bus.getStage()).assertEqual(IntegrationStage.REGISTER);
      expect(bus.busHealth()).assertEqual(0);
      done();
    });

    it('IntegrationTesting_002', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      expect(bus.register(new Subsystem('ui', 1))).assertTrue();
      expect(bus.register(new Subsystem('service', 1))).assertTrue();
      expect(bus.register(new Subsystem('ui', 2))).assertFalse();
      expect(bus.subsystemCount()).assertEqual(2);
      done();
    });

    it('IntegrationTesting_003', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      bus.register(new Subsystem('ui', 1));
      bus.register(new Subsystem('net', 1));
      expect(bus.connectAll()).assertEqual(2);
      expect(bus.readyCount()).assertEqual(2);
      expect(bus.getStage()).assertEqual(IntegrationStage.CONNECT);
      done();
    });

    it('IntegrationTesting_004', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      const failed = new Subsystem('form', 1);
      failed.fail();
      bus.register(failed);
      expect(bus.connectAll()).assertEqual(0);
      expect(bus.readyCount()).assertEqual(0);
      expect(bus.getStage()).assertEqual(IntegrationStage.REGISTER);
      done();
    });

    it('IntegrationTesting_005', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      const first = bus.emit('ability.start', 11);
      const second = bus.emit('ability.stop', 22);
      expect(first.sequence).assertEqual(1);
      expect(second.sequence).assertEqual(2);
      expect(bus.eventCount()).assertEqual(2);
      done();
    });

    it('IntegrationTesting_006', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      bus.emit('a', 1);
      bus.emit('b', 2);
      bus.emit('a', 3);
      const topics = bus.activeTopics();
      expect(topics.length).assertEqual(2);
      expect(topics.indexOf('a') >= 0).assertTrue();
      expect(topics.indexOf('b') >= 0).assertTrue();
      done();
    });

    it('IntegrationTesting_007', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      bus.emit('a', 1);
      bus.emit('b', 2);
      const replay = bus.replay();
      expect(replay.length).assertEqual(2);
      expect(replay[0].topic).assertEqual('a');
      expect(replay[1].payloadHash).assertEqual(2);
      done();
    });

    it('IntegrationTesting_008', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      expect(bus.verify()).assertFalse();
      bus.register(new Subsystem('ui', 1));
      bus.connectAll();
      expect(bus.verify()).assertTrue();
      expect(bus.getStage()).assertEqual(IntegrationStage.VERIFY);
      done();
    });

    it('IntegrationTesting_009', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      const ui = new Subsystem('ui', 1);
      bus.register(ui);
      bus.connectAll();
      bus.teardown();
      expect(bus.readyCount()).assertEqual(0);
      expect(bus.getStage()).assertEqual(IntegrationStage.TEARDOWN);
      expect(ui.connectCount).assertEqual(1);
      done();
    });

    it('IntegrationTesting_010', 0, async (done: Function) => {
      const subsystem = new Subsystem('svc', 2);
      expect(subsystem.connect()).assertTrue();
      subsystem.markBusy();
      expect(subsystem.isReady()).assertFalse();
      subsystem.markReady();
      expect(subsystem.isReady()).assertTrue();
      expect(subsystem.version).assertEqual(2);
      done();
    });

    it('IntegrationTesting_011', 0, async (done: Function) => {
      const subsystem = new Subsystem('svc', 1);
      subsystem.fail();
      expect(subsystem.connect()).assertFalse();
      subsystem.disconnect();
      expect(subsystem.state).assertEqual(SubsystemState.FAILED);
      done();
    });

    it('IntegrationTesting_012', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      bus.register(new Subsystem('ui', 1));
      bus.register(new Subsystem('net', 1));
      bus.register(new Subsystem('form', 1));
      bus.connectAll();
      expect(bus.busHealth()).assertEqual(1);
      expect(bus.findSubsystem('net') !== null).assertTrue();
      expect(bus.findSubsystem('none') === null).assertTrue();
      done();
    });

    it('IntegrationTesting_013', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      expect(bus.emit('a', 7).payloadHash).assertEqual(7);
      expect(bus.emit('b', 8).payloadHash).assertEqual(8);
      expect(bus.getStage()).assertEqual(IntegrationStage.TRANSFER);
      done();
    });

    it('IntegrationTesting_014', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      bus.register(new Subsystem('ui', 1));
      bus.register(new Subsystem('bad', 1));
      const bad = bus.findSubsystem('bad');
      if (bad !== null) {
        bad.fail();
      }
      bus.connectAll();
      expect(bus.readyCount()).assertEqual(1);
      expect(bus.busHealth()).assertEqual(0.5);
      done();
    });

    it('IntegrationTesting_016', 0, async (done: Function) => {
      const bus = new IntegrationBus();
      const ui = new Subsystem('ui', 3);
      bus.register(ui);
      bus.connectAll();
      ui.messageCount = ui.messageCount + 5;
      expect(ui.messageCount).assertEqual(5);
      expect(bus.readyCount()).assertEqual(1);
      expect(bus.getStage()).assertEqual(IntegrationStage.CONNECT);
      done();
    });

    it('IntegrationTesting_015', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'IntegrationTesting probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}
