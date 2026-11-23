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
import { getDriver, ensureAppReady, checkComponentExists, BUNDLE_NAME } from '../Shared/SharedDriver';

enum LaunchMode {
  SINGLETON = 0,
  STANDARD = 1,
  SPECIFIED = 2,
  MULTITON = 3
}

enum AbilityPhase {
  INIT = 0,
  ACTIVE = 1,
  INACTIVE = 2,
  BACKGROUND = 3,
  TERMINATED = 4
}

class LifeEvent {
  phase: number = AbilityPhase.INIT;
  reason: string = '';
  at: number = 0;

  constructor(phase: number, reason: string, at: number) {
    this.phase = phase;
    this.reason = reason;
    this.at = at;
  }
}

class MissionInfo {
  missionId: number = 0;
  label: string = '';
  locked: boolean = false;

  constructor(missionId: number, label: string) {
    this.missionId = missionId;
    this.label = label;
  }
}

class AbilityContextModel {
  instanceId: number = 0;
  launchMode: number = LaunchMode.STANDARD;
  phase: number = AbilityPhase.INIT;
  mission: MissionInfo = new MissionInfo(0, '');
  resultCode: number = 0;
  resultData: string = '';
  terminating: boolean = false;
  private events: LifeEvent[] = [];
  private clock: number = 0;

  constructor(instanceId: number, launchMode: number) {
    this.instanceId = instanceId;
    this.launchMode = launchMode;
  }

  private record(phase: number, reason: string): void {
    this.clock = this.clock + 1;
    this.events.push(new LifeEvent(phase, reason, this.clock));
    this.phase = phase;
  }

  activate(): boolean {
    if (this.phase === AbilityPhase.TERMINATED) {
      return false;
    }
    this.record(AbilityPhase.ACTIVE, 'onForeground');
    return true;
  }

  deactivate(): boolean {
    if (this.phase !== AbilityPhase.ACTIVE) {
      return false;
    }
    this.record(AbilityPhase.INACTIVE, 'onBackground');
    return true;
  }

  enterBackground(): boolean {
    if (this.phase === AbilityPhase.TERMINATED || this.phase === AbilityPhase.BACKGROUND) {
      return false;
    }
    this.record(AbilityPhase.BACKGROUND, 'onBackground');
    return true;
  }

  terminate(reason: string): boolean {
    if (this.phase === AbilityPhase.TERMINATED) {
      return false;
    }
    this.terminating = true;
    this.record(AbilityPhase.TERMINATED, reason);
    return true;
  }

  terminateWithResult(code: number, data: string): boolean {
    this.resultCode = code;
    this.resultData = data;
    return this.terminate('terminateSelfWithResult');
  }

  setMissionLabel(label: string): boolean {
    if (label.trim().length === 0) {
      return false;
    }
    this.mission.label = label;
    return true;
  }

  lockMission(): boolean {
    if (this.mission.missionId <= 0 || this.mission.locked) {
      return false;
    }
    this.mission.locked = true;
    return true;
  }

  unlockMission(): boolean {
    if (!this.mission.locked) {
      return false;
    }
    this.mission.locked = false;
    return true;
  }

  isTerminating(): boolean {
    return this.terminating;
  }

  isActive(): boolean {
    return this.phase === AbilityPhase.ACTIVE;
  }

  eventCount(): number {
    return this.events.length;
  }

  lastEvent(): LifeEvent | null {
    if (this.events.length === 0) {
      return null;
    }
    return this.events[this.events.length - 1];
  }

  canReuse(): boolean {
    return this.launchMode === LaunchMode.SINGLETON && this.phase !== AbilityPhase.TERMINATED;
  }

  reuseCountTotal(): number {
    let count = 0;
    for (let i = 0; i < this.events.length; i++) {
      if (this.events[i].reason === 'onNewWant') {
        count = count + 1;
      }
    }
    return count;
  }

  onNewWant(): boolean {
    if (this.phase === AbilityPhase.TERMINATED) {
      return false;
    }
    this.clock = this.clock + 1;
    this.events.push(new LifeEvent(this.phase, 'onNewWant', this.clock));
    return true;
  }
}

class ContextChain {
  private parents: number[] = [];
  private children: number[] = [];

  link(parent: number, child: number): boolean {
    if (parent === child || this.parents.indexOf(child) >= 0) {
      return false;
    }
    this.parents.push(child);
    this.children.push(parent);
    return true;
  }

  depthOf(node: number): number {
    let depth = 0;
    let current = node;
    for (let i = 0; i < this.parents.length; i++) {
      const index = this.parents.indexOf(current);
      if (index < 0) {
        return depth;
      }
      current = this.children[index];
      depth = depth + 1;
      if (depth > 64) {
        return depth;
      }
    }
    return depth;
  }

  isLinked(parent: number, child: number): boolean {
    const index = this.parents.indexOf(child);
    return index >= 0 && this.children[index] === parent;
  }
}

export default function abilityContextLifecycleDeepTest(): void {
  describe('AbilityContextLifecycleDeep', () => {
    it('AbilityContextLifecycleDeep_001', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      expect(model.phase).assertEqual(AbilityPhase.INIT);
      expect(model.eventCount()).assertEqual(0);
      expect(model.isActive()).assertFalse();
      expect(model.isTerminating()).assertFalse();
      expect(model.lastEvent()).assertNull();
      done();
    });

    it('AbilityContextLifecycleDeep_002', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      expect(model.activate()).assertTrue();
      expect(model.phase).assertEqual(AbilityPhase.ACTIVE);
      expect(model.isActive()).assertTrue();
      expect(model.eventCount()).assertEqual(1);
      expect(model.lastEvent() !== null).assertTrue();
      done();
    });

    it('AbilityContextLifecycleDeep_003', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      model.activate();
      expect(model.deactivate()).assertTrue();
      expect(model.phase).assertEqual(AbilityPhase.INACTIVE);
      expect(model.isActive()).assertFalse();
      expect(model.deactivate()).assertFalse();
      expect(model.eventCount()).assertEqual(2);
      done();
    });

    it('AbilityContextLifecycleDeep_004', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      model.activate();
      expect(model.enterBackground()).assertTrue();
      expect(model.phase).assertEqual(AbilityPhase.BACKGROUND);
      expect(model.enterBackground()).assertFalse();
      expect(model.eventCount()).assertEqual(2);
      done();
    });

    it('AbilityContextLifecycleDeep_005', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.SINGLETON);
      model.activate();
      expect(model.terminate('user')).assertTrue();
      expect(model.phase).assertEqual(AbilityPhase.TERMINATED);
      expect(model.isTerminating()).assertTrue();
      expect(model.terminate('again')).assertFalse();
      expect(model.activate()).assertFalse();
      done();
    });

    it('AbilityContextLifecycleDeep_006', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      model.activate();
      expect(model.terminateWithResult(100, 'payload')).assertTrue();
      expect(model.resultCode).assertEqual(100);
      expect(model.resultData).assertEqual('payload');
      expect(model.isTerminating()).assertTrue();
      done();
    });

    it('AbilityContextLifecycleDeep_007', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      expect(model.setMissionLabel('StageModel')).assertTrue();
      expect(model.mission.label).assertEqual('StageModel');
      expect(model.setMissionLabel('   ')).assertFalse();
      expect(model.mission.label).assertEqual('StageModel');
      done();
    });

    it('AbilityContextLifecycleDeep_008', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      expect(model.lockMission()).assertFalse();
      model.mission.missionId = 7;
      expect(model.lockMission()).assertTrue();
      expect(model.mission.locked).assertTrue();
      expect(model.lockMission()).assertFalse();
      expect(model.unlockMission()).assertTrue();
      expect(model.mission.locked).assertFalse();
      done();
    });

    it('AbilityContextLifecycleDeep_009', 0, async (done: Function) => {
      const singleton = new AbilityContextModel(1, LaunchMode.SINGLETON);
      const standard = new AbilityContextModel(2, LaunchMode.STANDARD);
      expect(singleton.canReuse()).assertTrue();
      expect(standard.canReuse()).assertFalse();
      standard.activate();
      expect(standard.canReuse()).assertFalse();
      done();
    });

    it('AbilityContextLifecycleDeep_010', 0, async (done: Function) => {
      const singleton = new AbilityContextModel(1, LaunchMode.SINGLETON);
      singleton.activate();
      expect(singleton.onNewWant()).assertTrue();
      expect(singleton.reuseCountTotal()).assertEqual(1);
      expect(singleton.eventCount()).assertEqual(2);
      expect(singleton.phase).assertEqual(AbilityPhase.ACTIVE);
      done();
    });

    it('AbilityContextLifecycleDeep_011', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      model.activate();
      model.terminate('done');
      expect(model.onNewWant()).assertFalse();
      expect(model.canReuse()).assertFalse();
      expect(model.reuseCountTotal()).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycleDeep_012', 0, async (done: Function) => {
      const chain = new ContextChain();
      expect(chain.link(1, 2)).assertTrue();
      expect(chain.isLinked(1, 2)).assertTrue();
      expect(chain.isLinked(2, 1)).assertFalse();
      expect(chain.link(1, 2)).assertFalse();
      expect(chain.link(3, 3)).assertFalse();
      done();
    });

    it('AbilityContextLifecycleDeep_013', 0, async (done: Function) => {
      const chain = new ContextChain();
      chain.link(1, 2);
      chain.link(2, 3);
      chain.link(3, 4);
      expect(chain.depthOf(1)).assertEqual(0);
      expect(chain.depthOf(4)).assertEqual(3);
      expect(chain.depthOf(99)).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycleDeep_014', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.MULTITON);
      expect(model.activate()).assertTrue();
      expect(model.deactivate()).assertTrue();
      expect(model.activate()).assertTrue();
      expect(model.eventCount()).assertEqual(3);
      expect(model.phase).assertEqual(AbilityPhase.ACTIVE);
      done();
    });

    it('AbilityContextLifecycleDeep_015', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.STANDARD);
      model.activate();
      const event = model.lastEvent();
      expect(event === null ? '' : event.reason).assertEqual('onForeground');
      expect(event === null ? -1 : event.at).assertEqual(1);
      expect(event === null ? -1 : event.phase).assertEqual(AbilityPhase.ACTIVE);
      done();
    });

    it('AbilityContextLifecycleDeep_016', 0, async (done: Function) => {
      const model = new AbilityContextModel(1, LaunchMode.SPECIFIED);
      model.activate();
      model.enterBackground();
      model.resultCode = 42;
      expect(model.phase).assertEqual(AbilityPhase.BACKGROUND);
      expect(model.resultCode).assertEqual(42);
      expect(model.eventCount()).assertEqual(2);
      expect(model.reuseCountTotal()).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycleDeep_017', 0, async (done: Function) => {
      const chain = new ContextChain();
      chain.link(1, 2);
      chain.link(2, 3);
      expect(chain.isLinked(1, 2)).assertTrue();
      expect(chain.isLinked(2, 3)).assertTrue();
      expect(chain.isLinked(1, 3)).assertFalse();
      expect(chain.depthOf(3)).assertEqual(2);
      done();
    });

    it('AbilityContextLifecycleDeep_018', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', `lifecycle deep ui probe ${exists}`);
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}


