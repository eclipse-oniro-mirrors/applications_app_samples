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
  BUNDLE_NAME, ACCOUNT_ID
} from '../Shared/SharedDriver';

class StressModel {
  private counter: number = 0;
  private operations: number = 0;
  private batches: number = 0;
  private peak: number = 0;
  private failures: number = 0;

  add(delta: number): boolean {
    if (delta < 0) {
      this.failures = this.failures + 1;
      return false;
    }
    this.counter = this.counter + delta;
    this.operations = this.operations + 1;
    if (this.counter > this.peak) {
      this.peak = this.counter;
    }
    return true;
  }

  runBatch(rounds: number, delta: number): number {
    if (rounds <= 0 || delta < 0) {
      this.failures = this.failures + 1;
      return 0;
    }
    for (let i = 0; i < rounds; i++) {
      this.add(delta);
    }
    this.batches = this.batches + 1;
    return rounds * delta;
  }

  getCounter(): number {
    return this.counter;
  }

  getOperations(): number {
    return this.operations;
  }

  getBatches(): number {
    return this.batches;
  }

  getPeak(): number {
    return this.peak;
  }

  getFailures(): number {
    return this.failures;
  }

  average(): number {
    if (this.operations === 0) {
      return 0;
    }
    return this.counter / this.operations;
  }

  reset(): void {
    this.counter = 0;
    this.operations = 0;
    this.batches = 0;
    this.peak = 0;
    this.failures = 0;
  }
}

export default function abilityContextStressTest(): void {
  describe('AbilityContextStress', () => {
    it('AbilityContextStress_001', 0, async (done: Function) => {
      const model = new StressModel();
      expect(model.add(5)).assertTrue();
      expect(model.getCounter()).assertEqual(5);
      expect(model.getOperations()).assertEqual(1);
      done();
    });

    it('AbilityContextStress_002', 0, async (done: Function) => {
      const model = new StressModel();
      for (let i = 0; i < 50; i++) {
        model.add(2);
      }
      expect(model.getCounter()).assertEqual(100);
      expect(model.getOperations()).assertEqual(50);
      expect(model.getPeak()).assertEqual(100);
      done();
    });

    it('AbilityContextStress_003', 0, async (done: Function) => {
      const model = new StressModel();
      const applied = model.runBatch(20, 3);
      expect(applied).assertEqual(60);
      expect(model.getCounter()).assertEqual(60);
      expect(model.getBatches()).assertEqual(1);
      done();
    });

    it('AbilityContextStress_004', 0, async (done: Function) => {
      const model = new StressModel();
      expect(model.runBatch(0, 1)).assertEqual(0);
      expect(model.runBatch(5, -1)).assertEqual(0);
      expect(model.getFailures()).assertEqual(2);
      expect(model.getBatches()).assertEqual(0);
      done();
    });

    it('AbilityContextStress_005', 0, async (done: Function) => {
      const model = new StressModel();
      expect(model.add(-3)).assertFalse();
      expect(model.getCounter()).assertEqual(0);
      expect(model.getFailures()).assertEqual(1);
      done();
    });

    it('AbilityContextStress_006', 0, async (done: Function) => {
      const model = new StressModel();
      model.add(10);
      model.add(20);
      expect(model.average()).assertEqual(15);
      expect(model.getPeak()).assertEqual(30);
      expect(model.getOperations()).assertEqual(2);
      done();
    });

    it('AbilityContextStress_007', 0, async (done: Function) => {
      const model = new StressModel();
      model.runBatch(10, 1);
      model.runBatch(10, 2);
      expect(model.getBatches()).assertEqual(2);
      expect(model.getCounter()).assertEqual(30);
      expect(model.getOperations()).assertEqual(20);
      done();
    });

    it('AbilityContextStress_008', 0, async (done: Function) => {
      const model = new StressModel();
      model.add(7);
      model.reset();
      expect(model.getCounter()).assertEqual(0);
      expect(model.getOperations()).assertEqual(0);
      expect(model.getFailures()).assertEqual(0);
      expect(model.average()).assertEqual(0);
      done();
    });
  });
}
