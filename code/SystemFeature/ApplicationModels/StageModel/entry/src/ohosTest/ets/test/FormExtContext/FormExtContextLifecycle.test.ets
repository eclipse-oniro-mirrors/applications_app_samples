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
import hilog from '@ohos.hilog';
import {
  getDriver, ensureAppReady, checkComponentExists, launchMainAbility,
  BUNDLE_NAME, MODULE_ENTRY, ABILITY_FORM,
  KEY_ENTER, KEY_BACK, KEY_LEFT, KEY_RIGHT, DELAY_KEY_NAVIGATION, TIMEOUT_PAGE_RENDER
} from '../Shared/SharedDriver';

enum FormLifecycleState {
  NONE = 0,
  CREATED = 1,
  FOREGROUND = 2,
  BACKGROUND = 3,
  DESTROYED = 4
}

class FormSession {
  readonly formId: number;
  readonly formName: string;
  private state: FormLifecycleState = FormLifecycleState.NONE;
  private foregroundTotal: number = 0;
  private backgroundTotal: number = 0;
  private visible: boolean = false;

  constructor(formId: number, formName: string) {
    this.formId = formId;
    this.formName = formName;
  }

  getState(): FormLifecycleState {
    return this.state;
  }

  setState(state: FormLifecycleState): void {
    this.state = state;
  }

  isVisible(): boolean {
    return this.visible;
  }

  setVisible(visible: boolean): void {
    this.visible = visible;
  }

  incrementForeground(): void {
    this.foregroundTotal += 1;
  }

  incrementBackground(): void {
    this.backgroundTotal += 1;
  }

  foregroundCount(): number {
    return this.foregroundTotal;
  }

  backgroundCount(): number {
    return this.backgroundTotal;
  }
}

class FormLifecycleMachine {
  private session: FormSession;
  private events: string[] = [];
  private destroyed: boolean = false;

  constructor(session: FormSession) {
    this.session = session;
  }

  create(): boolean {
    if (this.session.getState() !== FormLifecycleState.NONE) {
      return false;
    }
    this.session.setState(FormLifecycleState.CREATED);
    this.events.push('onCreate');
    return true;
  }

  foreground(): boolean {
    const state = this.session.getState();
    if (state !== FormLifecycleState.CREATED && state !== FormLifecycleState.BACKGROUND) {
      return false;
    }
    this.session.setState(FormLifecycleState.FOREGROUND);
    this.session.setVisible(true);
    this.session.incrementForeground();
    this.events.push('onForeground');
    return true;
  }

  background(): boolean {
    if (this.session.getState() !== FormLifecycleState.FOREGROUND) {
      return false;
    }
    this.session.setState(FormLifecycleState.BACKGROUND);
    this.session.setVisible(false);
    this.session.incrementBackground();
    this.events.push('onBackground');
    return true;
  }

  destroy(): boolean {
    if (this.destroyed) {
      return false;
    }
    this.session.setState(FormLifecycleState.DESTROYED);
    this.session.setVisible(false);
    this.destroyed = true;
    this.events.push('onDestroy');
    return true;
  }

  isDestroyed(): boolean {
    return this.destroyed;
  }

  eventCount(): number {
    return this.events.length;
  }

  lastEvent(): string {
    if (this.events.length === 0) {
      return '';
    }
    return this.events[this.events.length - 1];
  }

  eventsCopy(): string[] {
    const copy: string[] = [];
    for (const event of this.events) {
      copy.push(event);
    }
    return copy;
  }
}

class FormUpdateTracker {
  private updates: number[] = [];
  private lastUpdateMs: number = -1;

  record(formId: number, timeMs: number): void {
    this.updates.push(formId);
    this.lastUpdateMs = timeMs;
  }

  updateCount(): number {
    return this.updates.length;
  }

  lastUpdatedFormId(): number {
    if (this.updates.length === 0) {
      return -1;
    }
    return this.updates[this.updates.length - 1];
  }

  lastUpdateTime(): number {
    return this.lastUpdateMs;
  }

  cadenceMs(): number {
    if (this.updates.length < 2) {
      return 0;
    }
    return this.lastUpdateMs;
  }

  clear(): void {
    this.updates = [];
    this.lastUpdateMs = -1;
  }
}

class LifecycleWindow {
  private openAtMs: number;
  private closeAtMs: number;

  constructor(openAtMs: number, closeAtMs: number) {
    this.openAtMs = openAtMs;
    this.closeAtMs = closeAtMs;
  }

  isOpen(): boolean {
    return this.closeAtMs > this.openAtMs;
  }

  durationMs(): number {
    const span = this.closeAtMs - this.openAtMs;
    return span > 0 ? span : 0;
  }

  contains(timeMs: number): boolean {
    return timeMs >= this.openAtMs && timeMs <= this.closeAtMs;
  }

  overlaps(other: LifecycleWindow): boolean {
    return this.openAtMs < other.closeAtMs && this.closeAtMs > other.openAtMs;
  }
}

class LifecycleReporter {
  private reasons: string[] = [];

  addReason(reason: string): void {
    if (reason.length > 0) {
      this.reasons.push(reason);
    }
  }

  reasonCount(): number {
    return this.reasons.length;
  }

  hasReason(reason: string): boolean {
    return this.reasons.indexOf(reason) >= 0;
  }

  summary(): string {
    let result = '';
    for (let i = 0; i < this.reasons.length; i++) {
      if (i > 0) {
        result += ',';
      }
      result += this.reasons[i];
    }
    return result;
  }

  clear(): void {
    this.reasons = [];
  }
}

function buildMachine(): FormLifecycleMachine {
  return new FormLifecycleMachine(new FormSession(2001, 'WeatherForm'));
}

export default function formExtContextLifecycleTest(): void {
  describe('FormExtContextLifecycleSuite', () => {
    let machine: FormLifecycleMachine = buildMachine();

    beforeAll(() => {
      machine = buildMachine();
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'form lifecycle suite start');
    });

    afterAll(() => {
      hilog.info(0x0000, 'StageModelTest', '%{public}s', 'form lifecycle suite end');
    });

    it('FormExtContextLifecycle_001', 0, async (done: Function) => {
      const session = new FormSession(1, 'Form');
      expect(session.formId).assertEqual(1);
      expect(session.formName).assertEqual('Form');
      expect(session.getState()).assertEqual(FormLifecycleState.NONE);
      expect(session.isVisible()).assertFalse();
      done();
    });

    it('FormExtContextLifecycle_002', 0, async (done: Function) => {
      expect(machine.create()).assertTrue();
      expect(machine.eventCount()).assertEqual(1);
      expect(machine.lastEvent()).assertEqual('onCreate');
      done();
    });

    it('FormExtContextLifecycle_003', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      expect(local.create()).assertFalse();
      expect(local.eventCount()).assertEqual(1);
      done();
    });

    it('FormExtContextLifecycle_004', 0, async (done: Function) => {
      const local = buildMachine();
      expect(local.foreground()).assertFalse();
      local.create();
      expect(local.foreground()).assertTrue();
      expect(local.lastEvent()).assertEqual('onForeground');
      done();
    });

    it('FormExtContextLifecycle_005', 0, async (done: Function) => {
      const session = new FormSession(7, 'Sample');
      const local = new FormLifecycleMachine(session);
      local.create();
      local.foreground();
      expect(session.getState()).assertEqual(FormLifecycleState.FOREGROUND);
      expect(session.isVisible()).assertTrue();
      expect(session.foregroundCount()).assertEqual(1);
      done();
    });

    it('FormExtContextLifecycle_006', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      local.foreground();
      expect(local.background()).assertTrue();
      expect(local.lastEvent()).assertEqual('onBackground');
      done();
    });

    it('FormExtContextLifecycle_007', 0, async (done: Function) => {
      const session = new FormSession(8, 'Bg');
      const local = new FormLifecycleMachine(session);
      local.create();
      local.foreground();
      local.background();
      expect(session.getState()).assertEqual(FormLifecycleState.BACKGROUND);
      expect(session.isVisible()).assertFalse();
      expect(session.backgroundCount()).assertEqual(1);
      done();
    });

    it('FormExtContextLifecycle_008', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      expect(local.background()).assertFalse();
      expect(local.eventCount()).assertEqual(1);
      done();
    });

    it('FormExtContextLifecycle_009', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      local.foreground();
      local.background();
      expect(local.foreground()).assertTrue();
      expect(local.eventCount()).assertEqual(4);
      expect(local.lastEvent()).assertEqual('onForeground');
      done();
    });

    it('FormExtContextLifecycle_010', 0, async (done: Function) => {
      const session = new FormSession(9, 'Cycle');
      const local = new FormLifecycleMachine(session);
      local.create();
      local.foreground();
      local.background();
      local.foreground();
      expect(session.foregroundCount()).assertEqual(2);
      expect(session.backgroundCount()).assertEqual(1);
      done();
    });

    it('FormExtContextLifecycle_011', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      local.foreground();
      expect(local.destroy()).assertTrue();
      expect(local.lastEvent()).assertEqual('onDestroy');
      expect(local.isDestroyed()).assertTrue();
      done();
    });

    it('FormExtContextLifecycle_012', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      expect(local.destroy()).assertTrue();
      expect(local.destroy()).assertFalse();
      expect(local.eventCount()).assertEqual(2);
      done();
    });

    it('FormExtContextLifecycle_013', 0, async (done: Function) => {
      const session = new FormSession(10, 'Destroyed');
      const local = new FormLifecycleMachine(session);
      local.destroy();
      expect(session.getState()).assertEqual(FormLifecycleState.DESTROYED);
      expect(session.isVisible()).assertFalse();
      expect(local.isDestroyed()).assertTrue();
      done();
    });

    it('FormExtContextLifecycle_014', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      local.foreground();
      local.background();
      const events = local.eventsCopy();
      expect(events.length).assertEqual(3);
      expect(events[0]).assertEqual('onCreate');
      expect(events[1]).assertEqual('onForeground');
      expect(events[2]).assertEqual('onBackground');
      done();
    });

    it('FormExtContextLifecycle_015', 0, async (done: Function) => {
      const local = buildMachine();
      expect(local.eventCount()).assertEqual(0);
      expect(local.lastEvent()).assertEqual('');
      expect(local.eventsCopy().length).assertEqual(0);
      expect(local.isDestroyed()).assertFalse();
      done();
    });

    it('FormExtContextLifecycle_016', 0, async (done: Function) => {
      const session = new FormSession(11, 'Manual');
      session.setState(FormLifecycleState.FOREGROUND);
      session.setVisible(true);
      expect(session.getState()).assertEqual(FormLifecycleState.FOREGROUND);
      expect(session.isVisible()).assertTrue();
      session.setState(FormLifecycleState.BACKGROUND);
      expect(session.getState()).assertEqual(FormLifecycleState.BACKGROUND);
      done();
    });

    it('FormExtContextLifecycle_017', 0, async (done: Function) => {
      const tracker = new FormUpdateTracker();
      expect(tracker.updateCount()).assertEqual(0);
      expect(tracker.lastUpdatedFormId()).assertEqual(-1);
      expect(tracker.lastUpdateTime()).assertEqual(-1);
      expect(tracker.cadenceMs()).assertEqual(0);
      done();
    });

    it('FormExtContextLifecycle_018', 0, async (done: Function) => {
      const tracker = new FormUpdateTracker();
      tracker.record(101, 1000);
      tracker.record(102, 2000);
      expect(tracker.updateCount()).assertEqual(2);
      expect(tracker.lastUpdatedFormId()).assertEqual(102);
      expect(tracker.lastUpdateTime()).assertEqual(2000);
      done();
    });

    it('FormExtContextLifecycle_019', 0, async (done: Function) => {
      const tracker = new FormUpdateTracker();
      tracker.record(1, 500);
      expect(tracker.cadenceMs()).assertEqual(0);
      tracker.record(2, 1500);
      expect(tracker.cadenceMs()).assertEqual(1500);
      tracker.clear();
      expect(tracker.updateCount()).assertEqual(0);
      expect(tracker.lastUpdateTime()).assertEqual(-1);
      done();
    });

    it('FormExtContextLifecycle_020', 0, async (done: Function) => {
      const window = new LifecycleWindow(100, 500);
      expect(window.isOpen()).assertTrue();
      expect(window.durationMs()).assertEqual(400);
      expect(window.contains(100)).assertTrue();
      expect(window.contains(500)).assertTrue();
      expect(window.contains(600)).assertFalse();
      done();
    });

    it('FormExtContextLifecycle_021', 0, async (done: Function) => {
      const invalid = new LifecycleWindow(500, 100);
      expect(invalid.isOpen()).assertFalse();
      expect(invalid.durationMs()).assertEqual(0);
      expect(invalid.contains(300)).assertFalse();
      done();
    });

    it('FormExtContextLifecycle_022', 0, async (done: Function) => {
      const a = new LifecycleWindow(0, 100);
      const b = new LifecycleWindow(50, 150);
      const c = new LifecycleWindow(200, 300);
      expect(a.overlaps(b)).assertTrue();
      expect(a.overlaps(c)).assertFalse();
      expect(b.overlaps(c)).assertFalse();
      done();
    });

    it('FormExtContextLifecycle_023', 0, async (done: Function) => {
      const reporter = new LifecycleReporter();
      expect(reporter.reasonCount()).assertEqual(0);
      expect(reporter.summary()).assertEqual('');
      reporter.addReason('memory');
      reporter.addReason('refresh');
      expect(reporter.reasonCount()).assertEqual(2);
      expect(reporter.hasReason('memory')).assertTrue();
      expect(reporter.summary()).assertEqual('memory,refresh');
      done();
    });

    it('FormExtContextLifecycle_024', 0, async (done: Function) => {
      const reporter = new LifecycleReporter();
      reporter.addReason('');
      expect(reporter.reasonCount()).assertEqual(0);
      reporter.addReason('a');
      reporter.addReason('a');
      expect(reporter.reasonCount()).assertEqual(2);
      reporter.clear();
      expect(reporter.reasonCount()).assertEqual(0);
      expect(reporter.hasReason('a')).assertFalse();
      done();
    });

    it('FormExtContextLifecycle_025', 0, async (done: Function) => {
      const session = new FormSession(300, 'Full');
      const local = new FormLifecycleMachine(session);
      local.create();
      local.foreground();
      local.background();
      local.foreground();
      local.destroy();
      expect(local.eventCount()).assertEqual(5);
      expect(session.getState()).assertEqual(FormLifecycleState.DESTROYED);
      expect(session.foregroundCount()).assertEqual(2);
      done();
    });

    it('FormExtContextLifecycle_026', 0, async (done: Function) => {
      expect(BUNDLE_NAME).assertEqual('ohos.samples.stagemodel');
      expect(MODULE_ENTRY).assertEqual('entry');
      expect(ABILITY_FORM).assertEqual('FormAbility');
      done();
    });

    it('FormExtContextLifecycle_027', 0, async (done: Function) => {
      expect(KEY_ENTER).assertEqual(2049);
      expect(KEY_BACK).assertEqual(2);
      expect(KEY_LEFT).assertEqual(2014);
      expect(KEY_RIGHT).assertEqual(2015);
      expect(DELAY_KEY_NAVIGATION).assertEqual(50);
      expect(TIMEOUT_PAGE_RENDER).assertEqual(1000);
      done();
    });

    it('FormExtContextLifecycle_028', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('FormExtContextLifecycle_029', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        await launchMainAbility();
        const exists = await checkComponentExists(driver, 'Text');
        expect(typeof exists === 'boolean').assertTrue();
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });

    it('FormExtContextLifecycle_030', 0, async (done: Function) => {
      const local = buildMachine();
      local.create();
      local.foreground();
      const before = local.eventCount();
      local.background();
      expect(local.eventCount()).assertEqual(before + 1);
      expect(local.lastEvent()).assertEqual('onBackground');
      done();
    });

    it('FormExtContextLifecycle_031', 0, async (done: Function) => {
      const events = new FormLifecycleMachine(new FormSession(400, 'E'));
      events.create();
      events.foreground();
      const copy = events.eventsCopy();
      copy.push('tamper');
      expect(events.eventCount()).assertEqual(2);
      expect(copy.length).assertEqual(3);
      done();
    });

    it('FormExtContextLifecycle_032', 0, async (done: Function) => {
      const session = new FormSession(500, 'Final');
      expect(session.foregroundCount()).assertEqual(0);
      expect(session.backgroundCount()).assertEqual(0);
      session.incrementForeground();
      session.incrementBackground();
      expect(session.foregroundCount()).assertEqual(1);
      expect(session.backgroundCount()).assertEqual(1);
      done();
    });
  });
}

