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
import { describe, expect, it } from '@ohos/hypium';
import {
  TabSnapshot,
  TabSnapshotData,
  TabStateModel,
  TabValidationModel,
  TAB_LABELS
} from '../Shared/CustomAnimationTabFixtures';

class Lcg {
  private state: number;

  constructor(seed: number) {
    this.state = seed;
  }

  public next(): number {
    this.state = (this.state * 1103515245 + 12345) % 2147483648;
    return this.state;
  }

  public nextInt(limit: number): number {
    return this.next() % limit;
  }
}

export default function tabPropertyFuzzTest(): void {
  describe('TabPropertyFuzzTest', (): void => {
    it('tabPropertyFuzzTest001', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const random: Lcg = new Lcg(2026);
      for (let step: number = 0; step < 50; step++) {
        const operation: number = random.nextInt(5);
        if (operation === 0) {
          state.click(random.nextInt(5));
        } else if (operation === 1) {
          state.swipeForward();
        } else if (operation === 2) {
          state.swipeBackward();
        } else if (operation === 3) {
          state.toggleColor();
        } else {
          state.reset();
        }
        const snapshot: TabSnapshotData = state.snapshot();
        expect(snapshot.index >= 0).assertTrue();
        expect(snapshot.index < 5).assertTrue();
        expect(TabValidationModel.isValidSnapshot(snapshot)).assertTrue();
        expect(state.isConsistent()).assertTrue();
        expect(state.label()).assertEqual(TAB_LABELS[snapshot.index]);
      }
    });

    it('tabPropertyFuzzTest002', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const random: Lcg = new Lcg(4242);
      let refIndex: number = 0;
      let refDisplacement: number = 0;
      let refYellow: boolean = false;
      for (let step: number = 0; step < 50; step++) {
        const operation: number = random.nextInt(5);
        if (operation === 0) {
          const target: number = random.nextInt(5);
          state.click(target);
          refDisplacement += (target - refIndex) * 95;
          refIndex = target;
        } else if (operation === 1) {
          state.swipeForward();
          if (refIndex < 4) {
            refIndex++;
            refDisplacement += 95;
          }
        } else if (operation === 2) {
          state.swipeBackward();
          if (refIndex > 0) {
            refIndex--;
            refDisplacement -= 95;
          }
        } else if (operation === 3) {
          state.toggleColor();
          refYellow = !refYellow;
        } else {
          state.reset();
          refIndex = 0;
          refDisplacement = 0;
          refYellow = false;
        }
        expect(state.index()).assertEqual(refIndex);
        expect(state.layout.currentDisplacement()).assertEqual(refDisplacement);
        expect(state.indicator.isYellow()).assertEqual(refYellow);
      }
    });

    it('tabPropertyFuzzTest003', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const random: Lcg = new Lcg(777);
      for (let step: number = 0; step < 50; step++) {
        const index: number = random.nextInt(5);
        const displacement: number = (random.nextInt(9) - 4) * 95;
        const yellow: boolean = random.nextInt(2) === 1;
        const snapshot: TabSnapshot = new TabSnapshot(index, displacement, yellow);
        expect(state.restore(snapshot.toData())).assertTrue();
        expect(state.index()).assertEqual(index);
        expect(state.layout.currentDisplacement()).assertEqual(displacement);
        expect(TabSnapshot.from(state).equals(snapshot)).assertTrue();
      }
    });

    it('tabPropertyFuzzTest004', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const random: Lcg = new Lcg(99);
      let expected: boolean = false;
      for (let step: number = 0; step < 50; step++) {
        const count: number = 1 + random.nextInt(3);
        for (let i: number = 0; i < count; i++) {
          state.toggleColor();
          expected = !expected;
        }
        expect(state.indicator.isYellow()).assertEqual(expected);
      }
    });

    it('tabPropertyFuzzTest005', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const random: Lcg = new Lcg(5);
      for (let step: number = 0; step < 50; step++) {
        state.click(-1 - random.nextInt(50));
        state.click(5 + random.nextInt(50));
        state.restore({ index: -1 - random.nextInt(5), displacement: random.nextInt(500), yellow: false });
        expect(state.index()).assertEqual(0);
        expect(state.layout.currentDisplacement()).assertEqual(0);
        expect(state.indicator.isGray()).assertTrue();
      }
    });

    it('tabPropertyFuzzTest006', 0, (): void => {
      const first: Lcg = new Lcg(2026);
      const second: Lcg = new Lcg(2026);
      for (let step: number = 0; step < 50; step++) {
        expect(first.next()).assertEqual(second.next());
      }
    });

    it('tabPropertyFuzzTest007', 0, (): void => {
      const random: Lcg = new Lcg(31337);
      for (let step: number = 0; step < 50; step++) {
        const index: number = random.nextInt(5);
        const displacement: number = random.nextInt(8) * 95;
        const yellow: boolean = random.nextInt(2) === 1;
        const first: TabSnapshot = new TabSnapshot(index, displacement, yellow);
        const second: TabSnapshot = new TabSnapshot(index, displacement + 95, !yellow);
        expect(first.diff(second).count).assertEqual(2);
      }
    });

    it('tabPropertyFuzzTest008', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      const random: Lcg = new Lcg(8080);
      for (let step: number = 0; step < 50; step++) {
        if (random.nextInt(2) === 1) {
          state.swipeForward();
        } else {
          state.swipeBackward();
        }
        expect(state.index() >= 0).assertTrue();
        expect(state.index() < 5).assertTrue();
        expect(state.swiper.index()).assertEqual(state.index());
      }
    });
  });
}

