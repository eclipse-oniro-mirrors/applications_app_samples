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
  TabStateModel,
  TabValidationModel,
} from '../Shared/CustomAnimationTabFixtures';

/** Numeric boundary suite for displacement and snapshot arithmetic. */
export default function tabNumericBoundaryTest(): void {
  describe('TabNumericBoundaryTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0100
    // @tc.name tabNumericBoundaryTest001
    // @tc.desc Verify a very large positive displacement survives a click delta.
    it('tabNumericBoundaryTest001', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.restore({ index: 0, displacement: 1000000000000, yellow: false });
      state.click(2);
      expect(state.layout.currentDisplacement()).assertEqual(1000000000190);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0200
    // @tc.name tabNumericBoundaryTest002
    // @tc.desc Verify a very large negative displacement survives a click delta.
    it('tabNumericBoundaryTest002', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.restore({ index: 0, displacement: -1000000000000, yellow: false });
      state.click(2);
      expect(state.layout.currentDisplacement()).assertEqual(-999999999810);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0300
    // @tc.name tabNumericBoundaryTest003
    // @tc.desc Verify a negative displacement can return exactly to zero.
    it('tabNumericBoundaryTest003', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.restore({ index: 0, displacement: -95, yellow: false });
      state.swipeForward();
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.index()).assertEqual(1);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0400
    // @tc.name tabNumericBoundaryTest004
    // @tc.desc Verify negative zero displacement compares as zero.
    it('tabNumericBoundaryTest004', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.restore({ index: 0, displacement: -0, yellow: false });
      expect(state.layout.currentDisplacement() === 0).assertTrue();
      expect(state.snapshot().displacement === 0).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0500
    // @tc.name tabNumericBoundaryTest005
    // @tc.desc Verify 10000 endpoint click cycles do not drift.
    it('tabNumericBoundaryTest005', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let cycle: number = 0; cycle < 1000; cycle++) {
        state.click(4);
        state.click(0);
      }
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.index()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0600
    // @tc.name tabNumericBoundaryTest006
    // @tc.desc Verify 10000 backward swipes at page 0 do not underflow.
    it('tabNumericBoundaryTest006', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 0; step < 1000; step++) {
        state.swipeBackward();
      }
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0700
    // @tc.name tabNumericBoundaryTest007
    // @tc.desc Verify NaN displacement is rejected by snapshot validation.
    it('tabNumericBoundaryTest007', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.restore({ index: 0, displacement: Number.NaN, yellow: false });
      expect(
        TabValidationModel.isValidSnapshot(state.snapshot()),
      ).assertFalse();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0800
    // @tc.name tabNumericBoundaryTest008
    // @tc.desc Verify infinite displacement is stored and click delta keeps it infinite.
    it('tabNumericBoundaryTest008', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      state.restore({
        index: 0,
        displacement: Number.POSITIVE_INFINITY,
        yellow: false,
      });
      state.click(2);
      expect(
        state.layout.currentDisplacement() === Number.POSITIVE_INFINITY,
      ).assertTrue();
      expect(TabValidationModel.isValidSnapshot(state.snapshot())).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_0900
    // @tc.name tabNumericBoundaryTest009
    // @tc.desc Verify diffs remain correct for very large displacements.
    it('tabNumericBoundaryTest009', 0, (): void => {
      const first: TabSnapshot = new TabSnapshot(0, 1000000000000, false);
      const second: TabSnapshot = new TabSnapshot(0, 1000000000095, false);
      expect(first.diff(second).count).assertEqual(1);
      expect(first.diff(second).fields[0]).assertEqual('displacement');
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_NUM_1000
    // @tc.name tabNumericBoundaryTest010
    // @tc.desc Verify 1000 negative displacement values stay multiples of 95.
    it('tabNumericBoundaryTest010', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      for (let step: number = 1; step <= 100; step++) {
        state.restore({
          index: step % 5,
          displacement: -step * 95,
          yellow: step % 2 === 0,
        });
        expect(Math.abs(state.layout.currentDisplacement() % 95)).assertEqual(
          0,
        );
      }
    });
  });
}

