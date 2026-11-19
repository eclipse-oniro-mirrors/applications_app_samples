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
  TabOperationCatalog,
  TabStateModel,
} from '../Shared/CustomAnimationTabFixtures';

export default function tabOperationPairTest(): void {
  describe('TabOperationPairTest', (): void => {
    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0001
    it('tabOperationPair_0_0', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 0, 2);
      TabOperationCatalog.apply(state, 0, 2);
      expect(state.index()).assertEqual(2);
      expect(state.layout.currentDisplacement()).assertEqual(190);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0002
    it('tabOperationPair_0_1', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 0, 2);
      TabOperationCatalog.apply(state, 1, 2);
      expect(state.index()).assertEqual(3);
      expect(state.layout.currentDisplacement()).assertEqual(285);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0003
    it('tabOperationPair_0_2', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 0, 2);
      TabOperationCatalog.apply(state, 2, 2);
      expect(state.index()).assertEqual(1);
      expect(state.layout.currentDisplacement()).assertEqual(95);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0004
    it('tabOperationPair_0_3', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 0, 2);
      TabOperationCatalog.apply(state, 3, 2);
      expect(state.index()).assertEqual(2);
      expect(state.layout.currentDisplacement()).assertEqual(190);
      expect(state.indicator.isYellow()).assertEqual(true);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0005
    it('tabOperationPair_0_4', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 0, 2);
      TabOperationCatalog.apply(state, 4, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0006
    it('tabOperationPair_1_0', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 1, 2);
      TabOperationCatalog.apply(state, 0, 2);
      expect(state.index()).assertEqual(2);
      expect(state.layout.currentDisplacement()).assertEqual(190);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0007
    it('tabOperationPair_1_1', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 1, 2);
      TabOperationCatalog.apply(state, 1, 2);
      expect(state.index()).assertEqual(2);
      expect(state.layout.currentDisplacement()).assertEqual(190);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0008
    it('tabOperationPair_1_2', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 1, 2);
      TabOperationCatalog.apply(state, 2, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0009
    it('tabOperationPair_1_3', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 1, 2);
      TabOperationCatalog.apply(state, 3, 2);
      expect(state.index()).assertEqual(1);
      expect(state.layout.currentDisplacement()).assertEqual(95);
      expect(state.indicator.isYellow()).assertEqual(true);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0010
    it('tabOperationPair_1_4', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 1, 2);
      TabOperationCatalog.apply(state, 4, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0011
    it('tabOperationPair_2_0', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 2, 2);
      TabOperationCatalog.apply(state, 0, 2);
      expect(state.index()).assertEqual(2);
      expect(state.layout.currentDisplacement()).assertEqual(190);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0012
    it('tabOperationPair_2_1', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 2, 2);
      TabOperationCatalog.apply(state, 1, 2);
      expect(state.index()).assertEqual(1);
      expect(state.layout.currentDisplacement()).assertEqual(95);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0013
    it('tabOperationPair_2_2', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 2, 2);
      TabOperationCatalog.apply(state, 2, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0014
    it('tabOperationPair_2_3', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 2, 2);
      TabOperationCatalog.apply(state, 3, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(true);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0015
    it('tabOperationPair_2_4', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 2, 2);
      TabOperationCatalog.apply(state, 4, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0016
    it('tabOperationPair_3_0', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 3, 2);
      TabOperationCatalog.apply(state, 0, 2);
      expect(state.index()).assertEqual(2);
      expect(state.layout.currentDisplacement()).assertEqual(190);
      expect(state.indicator.isYellow()).assertEqual(true);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0017
    it('tabOperationPair_3_1', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 3, 2);
      TabOperationCatalog.apply(state, 1, 2);
      expect(state.index()).assertEqual(1);
      expect(state.layout.currentDisplacement()).assertEqual(95);
      expect(state.indicator.isYellow()).assertEqual(true);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0018
    it('tabOperationPair_3_2', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 3, 2);
      TabOperationCatalog.apply(state, 2, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(true);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0019
    it('tabOperationPair_3_3', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 3, 2);
      TabOperationCatalog.apply(state, 3, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0020
    it('tabOperationPair_3_4', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 3, 2);
      TabOperationCatalog.apply(state, 4, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0021
    it('tabOperationPair_4_0', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 4, 2);
      TabOperationCatalog.apply(state, 0, 2);
      expect(state.index()).assertEqual(2);
      expect(state.layout.currentDisplacement()).assertEqual(190);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0022
    it('tabOperationPair_4_1', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 4, 2);
      TabOperationCatalog.apply(state, 1, 2);
      expect(state.index()).assertEqual(1);
      expect(state.layout.currentDisplacement()).assertEqual(95);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0023
    it('tabOperationPair_4_2', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 4, 2);
      TabOperationCatalog.apply(state, 2, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0024
    it('tabOperationPair_4_3', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 4, 2);
      TabOperationCatalog.apply(state, 3, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(true);
      expect(state.isConsistent()).assertTrue();
    });

    // @tc.number SUB_CUSTOM_ANIMATION_TAB_PAIR_1_0025
    it('tabOperationPair_4_4', 0, (): void => {
      const state: TabStateModel = new TabStateModel();
      TabOperationCatalog.apply(state, 4, 2);
      TabOperationCatalog.apply(state, 4, 2);
      expect(state.index()).assertEqual(0);
      expect(state.layout.currentDisplacement()).assertEqual(0);
      expect(state.indicator.isYellow()).assertEqual(false);
      expect(state.isConsistent()).assertTrue();
    });
  });
}
