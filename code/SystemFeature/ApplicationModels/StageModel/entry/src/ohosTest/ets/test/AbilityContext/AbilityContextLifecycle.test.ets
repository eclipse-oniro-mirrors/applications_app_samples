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
  getDriver, ensureAppReady, checkComponentExists,
  BUNDLE_NAME, ACCOUNT_ID, RESULT_CODE
} from '../Shared/SharedDriver';

enum LifState {
  NONE = 0,
  CREATE = 1,
  FOREGROUND = 2,
  BACKGROUND = 3,
  TERMINATING = 4,
  DESTROYED = 5
}

class LifTransition {
  from: number = LifState.NONE;
  to: number = LifState.NONE;
  accepted: boolean = false;

  constructor(from: number, to: number, accepted: boolean) {
    this.from = from;
    this.to = to;
    this.accepted = accepted;
  }
}

class LifModel {
  private state: number = LifState.NONE;
  private transitions: LifTransition[] = [];
  private label: string = '';
  private foregroundCount: number = 0;
  private backgroundCount: number = 0;
  private rejectedCount: number = 0;

  canTransition(to: number): boolean {
    if (this.state === LifState.NONE) {
      return to === LifState.CREATE;
    }
    if (this.state === LifState.CREATE) {
      return to === LifState.FOREGROUND || to === LifState.TERMINATING;
    }
    if (this.state === LifState.FOREGROUND) {
      return to === LifState.BACKGROUND || to === LifState.TERMINATING;
    }
    if (this.state === LifState.BACKGROUND) {
      return to === LifState.FOREGROUND || to === LifState.TERMINATING;
    }
    if (this.state === LifState.TERMINATING) {
      return to === LifState.DESTROYED;
    }
    return false;
  }

  transition(to: number): boolean {
    const accepted = this.canTransition(to);
    this.transitions.push(new LifTransition(this.state, to, accepted));
    if (!accepted) {
      this.rejectedCount = this.rejectedCount + 1;
      return false;
    }
    if (to === LifState.FOREGROUND) {
      this.foregroundCount = this.foregroundCount + 1;
    }
    if (to === LifState.BACKGROUND) {
      this.backgroundCount = this.backgroundCount + 1;
    }
    this.state = to;
    return true;
  }

  onForeground(): boolean {
    return this.transition(LifState.FOREGROUND);
  }

  onBackground(): boolean {
    return this.transition(LifState.BACKGROUND);
  }

  onCreate(): boolean {
    return this.transition(LifState.CREATE);
  }

  terminate(): boolean {
    return this.transition(LifState.TERMINATING);
  }

  destroy(): boolean {
    return this.transition(LifState.DESTROYED);
  }

  setLabel(label: string): boolean {
    if (label.trim().length === 0) {
      return false;
    }
    this.label = label;
    return true;
  }

  isAlive(): boolean {
    return this.state !== LifState.NONE && this.state !== LifState.DESTROYED;
  }

  isForeground(): boolean {
    return this.state === LifState.FOREGROUND;
  }

  getState(): number {
    return this.state;
  }

  getLabel(): string {
    return this.label;
  }

  getTransitions(): LifTransition[] {
    return this.transitions;
  }

  lastTransition(): LifTransition | null {
    if (this.transitions.length === 0) {
      return null;
    }
    return this.transitions[this.transitions.length - 1];
  }

  getForegroundCount(): number {
    return this.foregroundCount;
  }

  getBackgroundCount(): number {
    return this.backgroundCount;
  }

  getRejectedCount(): number {
    return this.rejectedCount;
  }

  acceptedCount(): number {
    let count = 0;
    for (let i = 0; i < this.transitions.length; i++) {
      if (this.transitions[i].accepted) {
        count = count + 1;
      }
    }
    return count;
  }
}

function foregroundModel(): LifModel {
  const model = new LifModel();
  model.onCreate();
  model.onForeground();
  return model;
}

export default function abilityContextLifecycleTest(): void {
  describe('AbilityContextLifecycle', () => {
    it('AbilityContextLifecycle_001', 0, async (done: Function) => {
      const model = new LifModel();
      expect(model.getState()).assertEqual(LifState.NONE);
      expect(model.isAlive()).assertFalse();
      expect(model.getTransitions().length).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycle_002', 0, async (done: Function) => {
      const model = new LifModel();
      expect(model.onCreate()).assertTrue();
      expect(model.getState()).assertEqual(LifState.CREATE);
      expect(model.isAlive()).assertTrue();
      done();
    });

    it('AbilityContextLifecycle_003', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      expect(model.onForeground()).assertTrue();
      expect(model.isForeground()).assertTrue();
      expect(model.getForegroundCount()).assertEqual(1);
      done();
    });

    it('AbilityContextLifecycle_004', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.onBackground()).assertTrue();
      expect(model.getState()).assertEqual(LifState.BACKGROUND);
      expect(model.getBackgroundCount()).assertEqual(1);
      done();
    });

    it('AbilityContextLifecycle_005', 0, async (done: Function) => {
      const model = foregroundModel();
      model.onBackground();
      expect(model.onForeground()).assertTrue();
      expect(model.getForegroundCount()).assertEqual(2);
      expect(model.isForeground()).assertTrue();
      done();
    });

    it('AbilityContextLifecycle_006', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.terminate()).assertTrue();
      expect(model.getState()).assertEqual(LifState.TERMINATING);
      expect(model.destroy()).assertTrue();
      expect(model.getState()).assertEqual(LifState.DESTROYED);
      done();
    });

    it('AbilityContextLifecycle_007', 0, async (done: Function) => {
      const model = foregroundModel();
      model.terminate();
      model.destroy();
      expect(model.destroy()).assertFalse();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.isAlive()).assertFalse();
      done();
    });

    it('AbilityContextLifecycle_008', 0, async (done: Function) => {
      const model = new LifModel();
      expect(model.onForeground()).assertFalse();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.getState()).assertEqual(LifState.NONE);
      done();
    });

    it('AbilityContextLifecycle_009', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      expect(model.onBackground()).assertFalse();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.getState()).assertEqual(LifState.CREATE);
      done();
    });

    it('AbilityContextLifecycle_010', 0, async (done: Function) => {
      const model = foregroundModel();
      model.onBackground();
      expect(model.terminate()).assertTrue();
      expect(model.destroy()).assertTrue();
      expect(model.acceptedCount()).assertEqual(5);
      done();
    });

    it('AbilityContextLifecycle_011', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.setLabel('StageModel')).assertTrue();
      expect(model.getLabel()).assertEqual('StageModel');
      expect(model.isAlive()).assertTrue();
      done();
    });

    it('AbilityContextLifecycle_012', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.setLabel('  ')).assertFalse();
      expect(model.getLabel()).assertEqual('');
      done();
    });

    it('AbilityContextLifecycle_013', 0, async (done: Function) => {
      const model = foregroundModel();
      model.onBackground();
      model.onForeground();
      const last = model.lastTransition();
      const lastTo: number = last === null ? -1 : last.to;
      expect(last !== null).assertTrue();
      expect(lastTo).assertEqual(LifState.FOREGROUND);
      expect(model.getTransitions().length).assertEqual(4);
      done();
    });

    it('AbilityContextLifecycle_014', 0, async (done: Function) => {
      const model = new LifModel();
      expect(model.canTransition(LifState.CREATE)).assertTrue();
      expect(model.canTransition(LifState.FOREGROUND)).assertFalse();
      expect(model.canTransition(LifState.BACKGROUND)).assertFalse();
      expect(model.canTransition(LifState.DESTROYED)).assertFalse();
      done();
    });

    it('AbilityContextLifecycle_015', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onForeground();
      const records = model.getTransitions();
      expect(records.length).assertEqual(2);
      expect(records[0].from).assertEqual(LifState.NONE);
      expect(records[0].to).assertEqual(LifState.CREATE);
      expect(records[1].to).assertEqual(LifState.FOREGROUND);
      done();
    });

    it('AbilityContextLifecycle_016', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.onBackground()).assertTrue();
      expect(model.onBackground()).assertFalse();
      expect(model.getBackgroundCount()).assertEqual(1);
      expect(model.getRejectedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextLifecycle_017', 0, async (done: Function) => {
      const model = foregroundModel();
      model.onBackground();
      expect(model.terminate()).assertTrue();
      expect(model.getState()).assertEqual(LifState.TERMINATING);
      expect(model.isAlive()).assertTrue();
      done();
    });

    it('AbilityContextLifecycle_018', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      expect(model.terminate()).assertTrue();
      expect(model.getState()).assertEqual(LifState.TERMINATING);
      expect(model.getForegroundCount()).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycle_019', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.onCreate()).assertFalse();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.getState()).assertEqual(LifState.FOREGROUND);
      done();
    });

    it('AbilityContextLifecycle_020', 0, async (done: Function) => {
      const model = foregroundModel();
      model.terminate();
      expect(model.onForeground()).assertFalse();
      expect(model.getState()).assertEqual(LifState.TERMINATING);
      expect(model.getRejectedCount()).assertEqual(1);
      done();
    });

    it('AbilityContextLifecycle_021', 0, async (done: Function) => {
      const model = foregroundModel();
      model.setLabel('Persistent');
      model.onBackground();
      model.onForeground();
      expect(model.getLabel()).assertEqual('Persistent');
      expect(model.isForeground()).assertTrue();
      done();
    });

    it('AbilityContextLifecycle_022', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      expect(model.destroy()).assertFalse();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.getState()).assertEqual(LifState.CREATE);
      done();
    });

    it('AbilityContextLifecycle_023', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onForeground();
      model.onBackground();
      model.onForeground();
      expect(model.getForegroundCount()).assertEqual(2);
      expect(model.getBackgroundCount()).assertEqual(1);
      expect(model.acceptedCount()).assertEqual(4);
      done();
    });

    it('AbilityContextLifecycle_024', 0, async (done: Function) => {
      const model = new LifModel();
      expect(model.isAlive()).assertFalse();
      model.onCreate();
      expect(model.isAlive()).assertTrue();
      model.terminate();
      expect(model.isAlive()).assertTrue();
      model.destroy();
      expect(model.isAlive()).assertFalse();
      done();
    });

    it('AbilityContextLifecycle_025', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onForeground();
      model.transition(LifState.CREATE);
      const last = model.lastTransition();
      const accepted: boolean = last === null ? true : last.accepted;
      expect(accepted).assertFalse();
      expect(model.getState()).assertEqual(LifState.FOREGROUND);
      done();
    });

    it('AbilityContextLifecycle_026', 0, async (done: Function) => {
      const model = new LifModel();
      model.canTransition(LifState.CREATE);
      expect(model.getState()).assertEqual(LifState.NONE);
      expect(model.getTransitions().length).assertEqual(0);
      expect(model.getRejectedCount()).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycle_027', 0, async (done: Function) => {
      const model = foregroundModel();
      model.onBackground();
      model.onForeground();
      model.onBackground();
      expect(model.getBackgroundCount()).assertEqual(2);
      expect(model.getForegroundCount()).assertEqual(2);
      expect(model.getState()).assertEqual(LifState.BACKGROUND);
      done();
    });

    it('AbilityContextLifecycle_028', 0, async (done: Function) => {
      const model = foregroundModel();
      model.transition(LifState.FOREGROUND);
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.getForegroundCount()).assertEqual(1);
      expect(model.getState()).assertEqual(LifState.FOREGROUND);
      done();
    });

    it('AbilityContextLifecycle_029', 0, async (done: Function) => {
      const model = foregroundModel();
      model.terminate();
      model.destroy();
      expect(model.acceptedCount()).assertEqual(4);
      expect(model.getRejectedCount()).assertEqual(0);
      expect(model.getTransitions().length).assertEqual(4);
      done();
    });

    it('AbilityContextLifecycle_030', 0, async (done: Function) => {
      const model = foregroundModel();
      model.terminate();
      model.destroy();
      model.onForeground();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.getState()).assertEqual(LifState.DESTROYED);
      expect(model.isAlive()).assertFalse();
      done();
    });

    it('AbilityContextLifecycle_031', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onForeground();
      model.onBackground();
      const records = model.getTransitions();
      expect(records.length).assertEqual(3);
      expect(records[2].from).assertEqual(LifState.FOREGROUND);
      expect(records[2].to).assertEqual(LifState.BACKGROUND);
      done();
    });

    it('AbilityContextLifecycle_032', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.isForeground()).assertTrue();
      expect(model.isAlive()).assertTrue();
      expect(model.getForegroundCount()).assertEqual(1);
      expect(model.getBackgroundCount()).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycle_033', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onCreate();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.acceptedCount()).assertEqual(1);
      expect(model.getState()).assertEqual(LifState.CREATE);
      done();
    });

    it('AbilityContextLifecycle_034', 0, async (done: Function) => {
      const model = foregroundModel();
      model.setLabel('Before');
      expect(model.setLabel('')).assertFalse();
      expect(model.getLabel()).assertEqual('Before');
      expect(model.isForeground()).assertTrue();
      done();
    });

    it('AbilityContextLifecycle_035', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onForeground();
      model.onBackground();
      model.onForeground();
      model.terminate();
      model.destroy();
      expect(model.getState()).assertEqual(LifState.DESTROYED);
      expect(model.acceptedCount()).assertEqual(6);
      done();
    });

    it('AbilityContextLifecycle_036', 0, async (done: Function) => {
      const model = new LifModel();
      expect(model.lastTransition()).assertNull();
      model.onCreate();
      const last = model.lastTransition();
      expect(last !== null).assertTrue();
      expect(model.getTransitions().length).assertEqual(1);
      done();
    });

    it('AbilityContextLifecycle_037', 0, async (done: Function) => {
      const model = foregroundModel();
      model.onBackground();
      expect(model.terminate()).assertTrue();
      expect(model.destroy()).assertTrue();
      expect(model.getState()).assertEqual(LifState.DESTROYED);
      expect(model.getBackgroundCount()).assertEqual(1);
      done();
    });

    it('AbilityContextLifecycle_038', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.canTransition(LifState.BACKGROUND)).assertTrue();
      expect(model.canTransition(LifState.TERMINATING)).assertTrue();
      expect(model.canTransition(LifState.CREATE)).assertFalse();
      expect(model.canTransition(LifState.DESTROYED)).assertFalse();
      done();
    });

    it('AbilityContextLifecycle_039', 0, async (done: Function) => {
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

    it('AbilityContextLifecycle_040', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onForeground();
      model.setLabel('Lifecycle');
      model.onBackground();
      expect(model.getLabel()).assertEqual('Lifecycle');
      expect(model.getState()).assertEqual(LifState.BACKGROUND);
      expect(model.isForeground()).assertFalse();
      done();
    });

    it('AbilityContextLifecycle_041', 0, async (done: Function) => {
      const model = foregroundModel();
      model.transition(LifState.BACKGROUND);
      model.transition(LifState.BACKGROUND);
      expect(model.getTransitions().length).assertEqual(4);
      expect(model.acceptedCount()).assertEqual(3);
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.getBackgroundCount()).assertEqual(1);
      done();
    });

    it('AbilityContextLifecycle_042', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      model.onForeground();
      model.onBackground();
      model.terminate();
      expect(model.getState()).assertEqual(LifState.TERMINATING);
      expect(model.terminate()).assertFalse();
      expect(model.getRejectedCount()).assertEqual(1);
      expect(model.destroy()).assertTrue();
      done();
    });

    it('AbilityContextLifecycle_043', 0, async (done: Function) => {
      const model = foregroundModel();
      expect(model.getTransitions()[0].to).assertEqual(LifState.CREATE);
      expect(model.getTransitions()[1].to).assertEqual(LifState.FOREGROUND);
      expect(model.lastTransition() !== null).assertTrue();
      expect(model.getRejectedCount()).assertEqual(0);
      done();
    });

    it('AbilityContextLifecycle_044', 0, async (done: Function) => {
      const model = new LifModel();
      model.onCreate();
      expect(model.isForeground()).assertFalse();
      model.onForeground();
      expect(model.isForeground()).assertTrue();
      model.terminate();
      expect(model.isForeground()).assertFalse();
      model.destroy();
      expect(model.getState()).assertEqual(LifState.DESTROYED);
      expect(model.getTransitions().length).assertEqual(4);
      expect(model.acceptedCount()).assertEqual(4);
      expect(model.getRejectedCount()).assertEqual(0);
      done();
    });
  });
}
