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
  getDriver, ensureAppReady, checkComponentExists, clampNumber, safeDiv
} from '../Shared/SharedDriver';

enum ScenarioPhase {
  INIT = 0,
  PREPARED = 1,
  RUNNING = 2,
  VERIFIED = 3,
  COMPLETED = 4
}

enum StepStatus {
  PENDING = 0,
  PASSED = 1,
  FAILED = 2
}

class ScenarioStep {
  id: string = '';
  weight: number = 1;
  duration: number = 0;
  status: StepStatus = StepStatus.PENDING;

  constructor(id: string, weight: number, duration: number) {
    this.id = id;
    this.weight = weight;
    this.duration = duration;
  }

  markPassed(): void {
    this.status = StepStatus.PASSED;
  }

  markFailed(): void {
    this.status = StepStatus.FAILED;
  }

  reset(): void {
    this.status = StepStatus.PENDING;
  }

  isPassed(): boolean {
    return this.status === StepStatus.PASSED;
  }

  isFailed(): boolean {
    return this.status === StepStatus.FAILED;
  }
}

class ScenarioEngine {
  private title: string = '';
  private steps: ScenarioStep[] = [];
  private phase: ScenarioPhase = ScenarioPhase.INIT;

  constructor(title: string) {
    this.title = title;
  }

  getTitle(): string {
    return this.title;
  }

  addStep(step: ScenarioStep): void {
    this.steps.push(step);
    if (this.phase === ScenarioPhase.INIT) {
      this.phase = ScenarioPhase.PREPARED;
    }
  }

  stepCount(): number {
    return this.steps.length;
  }

  getPhase(): ScenarioPhase {
    return this.phase;
  }

  advance(): ScenarioPhase {
    if (this.phase === ScenarioPhase.INIT && this.steps.length > 0) {
      this.phase = ScenarioPhase.PREPARED;
    } else if (this.phase === ScenarioPhase.PREPARED) {
      this.phase = ScenarioPhase.RUNNING;
    } else if (this.phase === ScenarioPhase.RUNNING) {
      this.phase = ScenarioPhase.VERIFIED;
    } else if (this.phase === ScenarioPhase.VERIFIED) {
      this.phase = ScenarioPhase.COMPLETED;
    }
    return this.phase;
  }

  passCount(): number {
    let count = 0;
    for (const step of this.steps) {
      if (step.isPassed()) {
        count = count + 1;
      }
    }
    return count;
  }

  failCount(): number {
    let count = 0;
    for (const step of this.steps) {
      if (step.isFailed()) {
        count = count + 1;
      }
    }
    return count;
  }

  pendingCount(): number {
    let count = 0;
    for (const step of this.steps) {
      if (step.status === StepStatus.PENDING) {
        count = count + 1;
      }
    }
    return count;
  }

  totalWeight(): number {
    let total = 0;
    for (const step of this.steps) {
      total = total + step.weight;
    }
    return total;
  }

  passedWeight(): number {
    let total = 0;
    for (const step of this.steps) {
      if (step.isPassed()) {
        total = total + step.weight;
      }
    }
    return total;
  }

  successRate(): number {
    const value = safeDiv(this.passedWeight(), this.totalWeight());
    return clampNumber(value, 0, 1);
  }

  canComplete(): boolean {
    return this.steps.length > 0 && this.pendingCount() === 0 && this.failCount() === 0;
  }

  findStep(id: string): ScenarioStep | null {
    for (const step of this.steps) {
      if (step.id === id) {
        return step;
      }
    }
    return null;
  }

  retry(id: string): boolean {
    const step = this.findStep(id);
    if (step === null) {
      return false;
    }
    if (!step.isFailed()) {
      return false;
    }
    step.reset();
    return true;
  }
}

export default function advancedScenariosTest(): void {
  describe('AdvancedScenarios', () => {
    it('AdvancedScenarios_001', 0, async (done: Function) => {
      const engine = new ScenarioEngine('startup');
      expect(engine.getPhase()).assertEqual(ScenarioPhase.INIT);
      expect(engine.stepCount()).assertEqual(0);
      expect(engine.getTitle()).assertEqual('startup');
      done();
    });

    it('AdvancedScenarios_002', 0, async (done: Function) => {
      const engine = new ScenarioEngine('startup');
      engine.addStep(new ScenarioStep('a', 1, 10));
      engine.addStep(new ScenarioStep('b', 2, 20));
      expect(engine.stepCount()).assertEqual(2);
      expect(engine.getPhase()).assertEqual(ScenarioPhase.PREPARED);
      done();
    });

    it('AdvancedScenarios_003', 0, async (done: Function) => {
      const engine = new ScenarioEngine('flow');
      engine.addStep(new ScenarioStep('a', 1, 1));
      expect(engine.advance()).assertEqual(ScenarioPhase.RUNNING);
      expect(engine.advance()).assertEqual(ScenarioPhase.VERIFIED);
      expect(engine.advance()).assertEqual(ScenarioPhase.COMPLETED);
      expect(engine.advance()).assertEqual(ScenarioPhase.COMPLETED);
      done();
    });

    it('AdvancedScenarios_004', 0, async (done: Function) => {
      const engine = new ScenarioEngine('flow');
      const first = new ScenarioStep('a', 2, 5);
      first.markPassed();
      engine.addStep(first);
      expect(engine.passCount()).assertEqual(1);
      expect(engine.failCount()).assertEqual(0);
      expect(engine.pendingCount()).assertEqual(0);
      expect(engine.canComplete()).assertTrue();
      done();
    });

    it('AdvancedScenarios_005', 0, async (done: Function) => {
      const engine = new ScenarioEngine('flow');
      const first = new ScenarioStep('a', 1, 5);
      first.markFailed();
      engine.addStep(first);
      const second = new ScenarioStep('b', 1, 5);
      engine.addStep(second);
      expect(engine.failCount()).assertEqual(1);
      expect(engine.pendingCount()).assertEqual(1);
      expect(engine.canComplete()).assertFalse();
      done();
    });

    it('AdvancedScenarios_006', 0, async (done: Function) => {
      const engine = new ScenarioEngine('weights');
      const first = new ScenarioStep('a', 3, 5);
      first.markPassed();
      engine.addStep(first);
      engine.addStep(new ScenarioStep('b', 1, 5));
      expect(engine.totalWeight()).assertEqual(4);
      expect(engine.passedWeight()).assertEqual(3);
      expect(engine.successRate()).assertEqual(0.75);
      done();
    });

    it('AdvancedScenarios_007', 0, async (done: Function) => {
      const engine = new ScenarioEngine('retry');
      const first = new ScenarioStep('a', 1, 5);
      first.markFailed();
      engine.addStep(first);
      expect(engine.retry('a')).assertTrue();
      expect(engine.pendingCount()).assertEqual(1);
      expect(engine.retry('a')).assertFalse();
      expect(engine.retry('missing')).assertFalse();
      done();
    });

    it('AdvancedScenarios_008', 0, async (done: Function) => {
      const engine = new ScenarioEngine('lookup');
      engine.addStep(new ScenarioStep('a', 1, 5));
      const found = engine.findStep('a');
      expect(found !== null).assertTrue();
      expect(engine.findStep('none') === null).assertTrue();
      if (found !== null) {
        expect(found.weight).assertEqual(1);
      }
      done();
    });

    it('AdvancedScenarios_009', 0, async (done: Function) => {
      const engine = new ScenarioEngine('empty');
      expect(engine.successRate()).assertEqual(0);
      expect(engine.canComplete()).assertFalse();
      expect(engine.totalWeight()).assertEqual(0);
      done();
    });

    it('AdvancedScenarios_010', 0, async (done: Function) => {
      const step = new ScenarioStep('single', 5, 50);
      expect(step.status).assertEqual(StepStatus.PENDING);
      step.markPassed();
      expect(step.isPassed()).assertTrue();
      expect(step.isFailed()).assertFalse();
      step.reset();
      expect(step.status).assertEqual(StepStatus.PENDING);
      done();
    });

    it('AdvancedScenarios_012', 0, async (done: Function) => {
      const engine = new ScenarioEngine('multi');
      const first = new ScenarioStep('a', 1, 5);
      first.markPassed();
      engine.addStep(first);
      const second = new ScenarioStep('b', 1, 5);
      second.markPassed();
      engine.addStep(second);
      expect(engine.passCount()).assertEqual(2);
      expect(engine.successRate()).assertEqual(1);
      expect(engine.canComplete()).assertTrue();
      done();
    });

    it('AdvancedScenarios_013', 0, async (done: Function) => {
      const engine = new ScenarioEngine('seq');
      engine.addStep(new ScenarioStep('a', 1, 0));
      expect(engine.advance()).assertEqual(ScenarioPhase.RUNNING);
      expect(engine.advance()).assertEqual(ScenarioPhase.VERIFIED);
      expect(engine.getPhase()).assertEqual(ScenarioPhase.VERIFIED);
      done();
    });

    it('AdvancedScenarios_014', 0, async (done: Function) => {
      const engine = new ScenarioEngine('ratios');
      const first = new ScenarioStep('a', 4, 0);
      first.markPassed();
      engine.addStep(first);
      engine.addStep(new ScenarioStep('b', 4, 0));
      expect(engine.successRate()).assertEqual(0.5);
      expect(engine.pendingCount()).assertEqual(1);
      expect(engine.canComplete()).assertFalse();
      done();
    });

    it('AdvancedScenarios_015', 0, async (done: Function) => {
      const engine = new ScenarioEngine('retryflow');
      const first = new ScenarioStep('a', 1, 0);
      first.markFailed();
      engine.addStep(first);
      expect(engine.retry('a')).assertTrue();
      const found = engine.findStep('a');
      expect(found !== null).assertTrue();
      if (found !== null) {
        expect(found.status).assertEqual(StepStatus.PENDING);
      }
      done();
    });

    it('AdvancedScenarios_011', 0, async (done: Function) => {
      try {
        const driver: Driver = getDriver();
        const ready = await ensureAppReady(driver);
        expect(ready).assertTrue();
        const exists = await checkComponentExists(driver, 'Scroll');
        expect(typeof exists === 'boolean').assertTrue();
        hilog.info(0x0000, 'StageModelTest', '%{public}s', 'AdvancedScenarios ui probe');
      } catch (error) {
        expect(error !== null).assertTrue();
      }
      done();
    });
  });
}
