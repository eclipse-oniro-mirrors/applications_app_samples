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

import { beforeEach, describe, expect, it } from '@ohos/hypium';
import {
  hasNextDetail,
  hasPreviousDetail,
  isDetailIndexValid,
  resolveFeatureDetailIndex,
  resolveSmartLifeDetailIndex
} from './DetailIndexPolicy';
import { keepMainThreadResponsive } from './MainThreadYield';

// Expanded explicit-cell matrix. Each expected literal is derived from the
// documented policy rather than from the function under test, so a regression
// in the routing helpers cannot hide behind a recomputed expectation.

export default function detailIndexPolicyExpandedMatrixTest(): void {
  describe('DetailIndexPolicyExpandedMatrixTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1000
     * @tc.name policyExpandedCase000
     * @tc.desc Verify detail policy for index -2, count -1, route undefined, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase000', 0, (): void => {
      // Independent literals: index=-2, count=-1, route=undefined, stored=-2.
      const index: number = -2;
      const count: number = -1;
      const route: number | undefined = undefined;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1100
     * @tc.name policyExpandedCase001
     * @tc.desc Verify detail policy for index -1, count -1, route -2, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase001', 0, (): void => {
      // Independent literals: index=-1, count=-1, route=-2, stored=-2.
      const index: number = -1;
      const count: number = -1;
      const route: number | undefined = -2;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1200
     * @tc.name policyExpandedCase002
     * @tc.desc Verify detail policy for index 0, count -1, route -1, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase002', 0, (): void => {
      // Independent literals: index=0, count=-1, route=-1, stored=-2.
      const index: number = 0;
      const count: number = -1;
      const route: number | undefined = -1;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1300
     * @tc.name policyExpandedCase003
     * @tc.desc Verify detail policy for index 1, count -1, route 0, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase003', 0, (): void => {
      // Independent literals: index=1, count=-1, route=0, stored=-2.
      const index: number = 1;
      const count: number = -1;
      const route: number | undefined = 0;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1400
     * @tc.name policyExpandedCase004
     * @tc.desc Verify detail policy for index 2, count -1, route 1, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase004', 0, (): void => {
      // Independent literals: index=2, count=-1, route=1, stored=-2.
      const index: number = 2;
      const count: number = -1;
      const route: number | undefined = 1;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1500
     * @tc.name policyExpandedCase005
     * @tc.desc Verify detail policy for index 3, count 0, route 2, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase005', 0, (): void => {
      // Independent literals: index=3, count=0, route=2, stored=-2.
      const index: number = 3;
      const count: number = 0;
      const route: number | undefined = 2;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1600
     * @tc.name policyExpandedCase006
     * @tc.desc Verify detail policy for index 4, count 0, route 3, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase006', 0, (): void => {
      // Independent literals: index=4, count=0, route=3, stored=-2.
      const index: number = 4;
      const count: number = 0;
      const route: number | undefined = 3;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1700
     * @tc.name policyExpandedCase007
     * @tc.desc Verify detail policy for index 5, count 0, route 6, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase007', 0, (): void => {
      // Independent literals: index=5, count=0, route=6, stored=-1.
      const index: number = 5;
      const count: number = 0;
      const route: number | undefined = 6;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1800
     * @tc.name policyExpandedCase008
     * @tc.desc Verify detail policy for index 6, count 0, route 7, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase008', 0, (): void => {
      // Independent literals: index=6, count=0, route=7, stored=-1.
      const index: number = 6;
      const count: number = 0;
      const route: number | undefined = 7;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_1900
     * @tc.name policyExpandedCase009
     * @tc.desc Verify detail policy for index 7, count 0, route 10, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase009', 0, (): void => {
      // Independent literals: index=7, count=0, route=10, stored=-1.
      const index: number = 7;
      const count: number = 0;
      const route: number | undefined = 10;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2000
     * @tc.name policyExpandedCase010
     * @tc.desc Verify detail policy for index 8, count 1, route 99, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase010', 0, (): void => {
      // Independent literals: index=8, count=1, route=99, stored=-1.
      const index: number = 8;
      const count: number = 1;
      const route: number | undefined = 99;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2100
     * @tc.name policyExpandedCase011
     * @tc.desc Verify detail policy for index 9, count 1, route undefined, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase011', 0, (): void => {
      // Independent literals: index=9, count=1, route=undefined, stored=-1.
      const index: number = 9;
      const count: number = 1;
      const route: number | undefined = undefined;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2200
     * @tc.name policyExpandedCase012
     * @tc.desc Verify detail policy for index 99, count 1, route -2, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase012', 0, (): void => {
      // Independent literals: index=99, count=1, route=-2, stored=-1.
      const index: number = 99;
      const count: number = 1;
      const route: number | undefined = -2;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2300
     * @tc.name policyExpandedCase013
     * @tc.desc Verify detail policy for index -2, count 1, route -1, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase013', 0, (): void => {
      // Independent literals: index=-2, count=1, route=-1, stored=-1.
      const index: number = -2;
      const count: number = 1;
      const route: number | undefined = -1;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2400
     * @tc.name policyExpandedCase014
     * @tc.desc Verify detail policy for index -1, count 1, route 0, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase014', 0, (): void => {
      // Independent literals: index=-1, count=1, route=0, stored=0.
      const index: number = -1;
      const count: number = 1;
      const route: number | undefined = 0;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2500
     * @tc.name policyExpandedCase015
     * @tc.desc Verify detail policy for index 0, count 2, route 1, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase015', 0, (): void => {
      // Independent literals: index=0, count=2, route=1, stored=0.
      const index: number = 0;
      const count: number = 2;
      const route: number | undefined = 1;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2600
     * @tc.name policyExpandedCase016
     * @tc.desc Verify detail policy for index 1, count 2, route 2, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase016', 0, (): void => {
      // Independent literals: index=1, count=2, route=2, stored=0.
      const index: number = 1;
      const count: number = 2;
      const route: number | undefined = 2;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2700
     * @tc.name policyExpandedCase017
     * @tc.desc Verify detail policy for index 2, count 2, route 3, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase017', 0, (): void => {
      // Independent literals: index=2, count=2, route=3, stored=0.
      const index: number = 2;
      const count: number = 2;
      const route: number | undefined = 3;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2800
     * @tc.name policyExpandedCase018
     * @tc.desc Verify detail policy for index 3, count 2, route 6, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase018', 0, (): void => {
      // Independent literals: index=3, count=2, route=6, stored=0.
      const index: number = 3;
      const count: number = 2;
      const route: number | undefined = 6;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_2900
     * @tc.name policyExpandedCase019
     * @tc.desc Verify detail policy for index 4, count 2, route 7, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase019', 0, (): void => {
      // Independent literals: index=4, count=2, route=7, stored=0.
      const index: number = 4;
      const count: number = 2;
      const route: number | undefined = 7;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3000
     * @tc.name policyExpandedCase020
     * @tc.desc Verify detail policy for index 5, count 3, route 10, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase020', 0, (): void => {
      // Independent literals: index=5, count=3, route=10, stored=0.
      const index: number = 5;
      const count: number = 3;
      const route: number | undefined = 10;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3100
     * @tc.name policyExpandedCase021
     * @tc.desc Verify detail policy for index 6, count 3, route 99, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase021', 0, (): void => {
      // Independent literals: index=6, count=3, route=99, stored=1.
      const index: number = 6;
      const count: number = 3;
      const route: number | undefined = 99;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3200
     * @tc.name policyExpandedCase022
     * @tc.desc Verify detail policy for index 7, count 3, route undefined, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase022', 0, (): void => {
      // Independent literals: index=7, count=3, route=undefined, stored=1.
      const index: number = 7;
      const count: number = 3;
      const route: number | undefined = undefined;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3300
     * @tc.name policyExpandedCase023
     * @tc.desc Verify detail policy for index 8, count 3, route -2, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase023', 0, (): void => {
      // Independent literals: index=8, count=3, route=-2, stored=1.
      const index: number = 8;
      const count: number = 3;
      const route: number | undefined = -2;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3400
     * @tc.name policyExpandedCase024
     * @tc.desc Verify detail policy for index 9, count 3, route -1, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase024', 0, (): void => {
      // Independent literals: index=9, count=3, route=-1, stored=1.
      const index: number = 9;
      const count: number = 3;
      const route: number | undefined = -1;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3500
     * @tc.name policyExpandedCase025
     * @tc.desc Verify detail policy for index 99, count 5, route 0, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase025', 0, (): void => {
      // Independent literals: index=99, count=5, route=0, stored=1.
      const index: number = 99;
      const count: number = 5;
      const route: number | undefined = 0;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3600
     * @tc.name policyExpandedCase026
     * @tc.desc Verify detail policy for index -2, count 5, route 1, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase026', 0, (): void => {
      // Independent literals: index=-2, count=5, route=1, stored=1.
      const index: number = -2;
      const count: number = 5;
      const route: number | undefined = 1;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3700
     * @tc.name policyExpandedCase027
     * @tc.desc Verify detail policy for index -1, count 5, route 2, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase027', 0, (): void => {
      // Independent literals: index=-1, count=5, route=2, stored=1.
      const index: number = -1;
      const count: number = 5;
      const route: number | undefined = 2;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(2);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3800
     * @tc.name policyExpandedCase028
     * @tc.desc Verify detail policy for index 0, count 5, route 3, stored 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase028', 0, (): void => {
      // Independent literals: index=0, count=5, route=3, stored=2.
      const index: number = 0;
      const count: number = 5;
      const route: number | undefined = 3;
      const stored: number = 2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(3);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(3);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_3900
     * @tc.name policyExpandedCase029
     * @tc.desc Verify detail policy for index 1, count 5, route 6, stored 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase029', 0, (): void => {
      // Independent literals: index=1, count=5, route=6, stored=2.
      const index: number = 1;
      const count: number = 5;
      const route: number | undefined = 6;
      const stored: number = 2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4000
     * @tc.name policyExpandedCase030
     * @tc.desc Verify detail policy for index 2, count 7, route 7, stored 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase030', 0, (): void => {
      // Independent literals: index=2, count=7, route=7, stored=2.
      const index: number = 2;
      const count: number = 7;
      const route: number | undefined = 7;
      const stored: number = 2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4100
     * @tc.name policyExpandedCase031
     * @tc.desc Verify detail policy for index 3, count 7, route 10, stored 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase031', 0, (): void => {
      // Independent literals: index=3, count=7, route=10, stored=2.
      const index: number = 3;
      const count: number = 7;
      const route: number | undefined = 10;
      const stored: number = 2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4200
     * @tc.name policyExpandedCase032
     * @tc.desc Verify detail policy for index 4, count 7, route 99, stored 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase032', 0, (): void => {
      // Independent literals: index=4, count=7, route=99, stored=2.
      const index: number = 4;
      const count: number = 7;
      const route: number | undefined = 99;
      const stored: number = 2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4300
     * @tc.name policyExpandedCase033
     * @tc.desc Verify detail policy for index 5, count 7, route undefined, stored 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase033', 0, (): void => {
      // Independent literals: index=5, count=7, route=undefined, stored=2.
      const index: number = 5;
      const count: number = 7;
      const route: number | undefined = undefined;
      const stored: number = 2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4400
     * @tc.name policyExpandedCase034
     * @tc.desc Verify detail policy for index 6, count 7, route -2, stored 2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase034', 0, (): void => {
      // Independent literals: index=6, count=7, route=-2, stored=2.
      const index: number = 6;
      const count: number = 7;
      const route: number | undefined = -2;
      const stored: number = 2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4500
     * @tc.name policyExpandedCase035
     * @tc.desc Verify detail policy for index 7, count 10, route -1, stored 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase035', 0, (): void => {
      // Independent literals: index=7, count=10, route=-1, stored=3.
      const index: number = 7;
      const count: number = 10;
      const route: number | undefined = -1;
      const stored: number = 3;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(3);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4600
     * @tc.name policyExpandedCase036
     * @tc.desc Verify detail policy for index 8, count 10, route 0, stored 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase036', 0, (): void => {
      // Independent literals: index=8, count=10, route=0, stored=3.
      const index: number = 8;
      const count: number = 10;
      const route: number | undefined = 0;
      const stored: number = 3;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4700
     * @tc.name policyExpandedCase037
     * @tc.desc Verify detail policy for index 9, count 10, route 1, stored 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase037', 0, (): void => {
      // Independent literals: index=9, count=10, route=1, stored=3.
      const index: number = 9;
      const count: number = 10;
      const route: number | undefined = 1;
      const stored: number = 3;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4800
     * @tc.name policyExpandedCase038
     * @tc.desc Verify detail policy for index 99, count 10, route 2, stored 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase038', 0, (): void => {
      // Independent literals: index=99, count=10, route=2, stored=3.
      const index: number = 99;
      const count: number = 10;
      const route: number | undefined = 2;
      const stored: number = 3;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(2);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_4900
     * @tc.name policyExpandedCase039
     * @tc.desc Verify detail policy for index -2, count 10, route 3, stored 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase039', 0, (): void => {
      // Independent literals: index=-2, count=10, route=3, stored=3.
      const index: number = -2;
      const count: number = 10;
      const route: number | undefined = 3;
      const stored: number = 3;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(3);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(3);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5000
     * @tc.name policyExpandedCase040
     * @tc.desc Verify detail policy for index -1, count -1, route 6, stored 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase040', 0, (): void => {
      // Independent literals: index=-1, count=-1, route=6, stored=3.
      const index: number = -1;
      const count: number = -1;
      const route: number | undefined = 6;
      const stored: number = 3;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5100
     * @tc.name policyExpandedCase041
     * @tc.desc Verify detail policy for index 0, count -1, route 7, stored 3
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase041', 0, (): void => {
      // Independent literals: index=0, count=-1, route=7, stored=3.
      const index: number = 0;
      const count: number = -1;
      const route: number | undefined = 7;
      const stored: number = 3;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5200
     * @tc.name policyExpandedCase042
     * @tc.desc Verify detail policy for index 1, count -1, route 10, stored 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase042', 0, (): void => {
      // Independent literals: index=1, count=-1, route=10, stored=5.
      const index: number = 1;
      const count: number = -1;
      const route: number | undefined = 10;
      const stored: number = 5;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5300
     * @tc.name policyExpandedCase043
     * @tc.desc Verify detail policy for index 2, count -1, route 99, stored 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase043', 0, (): void => {
      // Independent literals: index=2, count=-1, route=99, stored=5.
      const index: number = 2;
      const count: number = -1;
      const route: number | undefined = 99;
      const stored: number = 5;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5400
     * @tc.name policyExpandedCase044
     * @tc.desc Verify detail policy for index 3, count -1, route undefined, stored 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase044', 0, (): void => {
      // Independent literals: index=3, count=-1, route=undefined, stored=5.
      const index: number = 3;
      const count: number = -1;
      const route: number | undefined = undefined;
      const stored: number = 5;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5500
     * @tc.name policyExpandedCase045
     * @tc.desc Verify detail policy for index 4, count 0, route -2, stored 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase045', 0, (): void => {
      // Independent literals: index=4, count=0, route=-2, stored=5.
      const index: number = 4;
      const count: number = 0;
      const route: number | undefined = -2;
      const stored: number = 5;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5600
     * @tc.name policyExpandedCase046
     * @tc.desc Verify detail policy for index 5, count 0, route -1, stored 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase046', 0, (): void => {
      // Independent literals: index=5, count=0, route=-1, stored=5.
      const index: number = 5;
      const count: number = 0;
      const route: number | undefined = -1;
      const stored: number = 5;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5700
     * @tc.name policyExpandedCase047
     * @tc.desc Verify detail policy for index 6, count 0, route 0, stored 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase047', 0, (): void => {
      // Independent literals: index=6, count=0, route=0, stored=5.
      const index: number = 6;
      const count: number = 0;
      const route: number | undefined = 0;
      const stored: number = 5;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5800
     * @tc.name policyExpandedCase048
     * @tc.desc Verify detail policy for index 7, count 0, route 1, stored 5
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase048', 0, (): void => {
      // Independent literals: index=7, count=0, route=1, stored=5.
      const index: number = 7;
      const count: number = 0;
      const route: number | undefined = 1;
      const stored: number = 5;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_5900
     * @tc.name policyExpandedCase049
     * @tc.desc Verify detail policy for index 8, count 0, route 2, stored 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase049', 0, (): void => {
      // Independent literals: index=8, count=0, route=2, stored=7.
      const index: number = 8;
      const count: number = 0;
      const route: number | undefined = 2;
      const stored: number = 7;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6000
     * @tc.name policyExpandedCase050
     * @tc.desc Verify detail policy for index 9, count 1, route 3, stored 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase050', 0, (): void => {
      // Independent literals: index=9, count=1, route=3, stored=7.
      const index: number = 9;
      const count: number = 1;
      const route: number | undefined = 3;
      const stored: number = 7;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6100
     * @tc.name policyExpandedCase051
     * @tc.desc Verify detail policy for index 99, count 1, route 6, stored 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase051', 0, (): void => {
      // Independent literals: index=99, count=1, route=6, stored=7.
      const index: number = 99;
      const count: number = 1;
      const route: number | undefined = 6;
      const stored: number = 7;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6200
     * @tc.name policyExpandedCase052
     * @tc.desc Verify detail policy for index -2, count 1, route 7, stored 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase052', 0, (): void => {
      // Independent literals: index=-2, count=1, route=7, stored=7.
      const index: number = -2;
      const count: number = 1;
      const route: number | undefined = 7;
      const stored: number = 7;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6300
     * @tc.name policyExpandedCase053
     * @tc.desc Verify detail policy for index -1, count 1, route 10, stored 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase053', 0, (): void => {
      // Independent literals: index=-1, count=1, route=10, stored=7.
      const index: number = -1;
      const count: number = 1;
      const route: number | undefined = 10;
      const stored: number = 7;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6400
     * @tc.name policyExpandedCase054
     * @tc.desc Verify detail policy for index 0, count 1, route 99, stored 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase054', 0, (): void => {
      // Independent literals: index=0, count=1, route=99, stored=7.
      const index: number = 0;
      const count: number = 1;
      const route: number | undefined = 99;
      const stored: number = 7;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6500
     * @tc.name policyExpandedCase055
     * @tc.desc Verify detail policy for index 1, count 2, route undefined, stored 7
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase055', 0, (): void => {
      // Independent literals: index=1, count=2, route=undefined, stored=7.
      const index: number = 1;
      const count: number = 2;
      const route: number | undefined = undefined;
      const stored: number = 7;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6600
     * @tc.name policyExpandedCase056
     * @tc.desc Verify detail policy for index 2, count 2, route -2, stored 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase056', 0, (): void => {
      // Independent literals: index=2, count=2, route=-2, stored=10.
      const index: number = 2;
      const count: number = 2;
      const route: number | undefined = -2;
      const stored: number = 10;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6700
     * @tc.name policyExpandedCase057
     * @tc.desc Verify detail policy for index 3, count 2, route -1, stored 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase057', 0, (): void => {
      // Independent literals: index=3, count=2, route=-1, stored=10.
      const index: number = 3;
      const count: number = 2;
      const route: number | undefined = -1;
      const stored: number = 10;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6800
     * @tc.name policyExpandedCase058
     * @tc.desc Verify detail policy for index 4, count 2, route 0, stored 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase058', 0, (): void => {
      // Independent literals: index=4, count=2, route=0, stored=10.
      const index: number = 4;
      const count: number = 2;
      const route: number | undefined = 0;
      const stored: number = 10;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_6900
     * @tc.name policyExpandedCase059
     * @tc.desc Verify detail policy for index 5, count 2, route 1, stored 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase059', 0, (): void => {
      // Independent literals: index=5, count=2, route=1, stored=10.
      const index: number = 5;
      const count: number = 2;
      const route: number | undefined = 1;
      const stored: number = 10;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7000
     * @tc.name policyExpandedCase060
     * @tc.desc Verify detail policy for index 6, count 3, route 2, stored 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase060', 0, (): void => {
      // Independent literals: index=6, count=3, route=2, stored=10.
      const index: number = 6;
      const count: number = 3;
      const route: number | undefined = 2;
      const stored: number = 10;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(2);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7100
     * @tc.name policyExpandedCase061
     * @tc.desc Verify detail policy for index 7, count 3, route 3, stored 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase061', 0, (): void => {
      // Independent literals: index=7, count=3, route=3, stored=10.
      const index: number = 7;
      const count: number = 3;
      const route: number | undefined = 3;
      const stored: number = 10;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7200
     * @tc.name policyExpandedCase062
     * @tc.desc Verify detail policy for index 8, count 3, route 6, stored 10
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase062', 0, (): void => {
      // Independent literals: index=8, count=3, route=6, stored=10.
      const index: number = 8;
      const count: number = 3;
      const route: number | undefined = 6;
      const stored: number = 10;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7300
     * @tc.name policyExpandedCase063
     * @tc.desc Verify detail policy for index 9, count 3, route 7, stored 99
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase063', 0, (): void => {
      // Independent literals: index=9, count=3, route=7, stored=99.
      const index: number = 9;
      const count: number = 3;
      const route: number | undefined = 7;
      const stored: number = 99;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7400
     * @tc.name policyExpandedCase064
     * @tc.desc Verify detail policy for index 99, count 3, route 10, stored 99
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase064', 0, (): void => {
      // Independent literals: index=99, count=3, route=10, stored=99.
      const index: number = 99;
      const count: number = 3;
      const route: number | undefined = 10;
      const stored: number = 99;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7500
     * @tc.name policyExpandedCase065
     * @tc.desc Verify detail policy for index -2, count 5, route 99, stored 99
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase065', 0, (): void => {
      // Independent literals: index=-2, count=5, route=99, stored=99.
      const index: number = -2;
      const count: number = 5;
      const route: number | undefined = 99;
      const stored: number = 99;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7600
     * @tc.name policyExpandedCase066
     * @tc.desc Verify detail policy for index -1, count 5, route undefined, stored 99
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase066', 0, (): void => {
      // Independent literals: index=-1, count=5, route=undefined, stored=99.
      const index: number = -1;
      const count: number = 5;
      const route: number | undefined = undefined;
      const stored: number = 99;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7700
     * @tc.name policyExpandedCase067
     * @tc.desc Verify detail policy for index 0, count 5, route -2, stored 99
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase067', 0, (): void => {
      // Independent literals: index=0, count=5, route=-2, stored=99.
      const index: number = 0;
      const count: number = 5;
      const route: number | undefined = -2;
      const stored: number = 99;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7800
     * @tc.name policyExpandedCase068
     * @tc.desc Verify detail policy for index 1, count 5, route -1, stored 99
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase068', 0, (): void => {
      // Independent literals: index=1, count=5, route=-1, stored=99.
      const index: number = 1;
      const count: number = 5;
      const route: number | undefined = -1;
      const stored: number = 99;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_7900
     * @tc.name policyExpandedCase069
     * @tc.desc Verify detail policy for index 2, count 5, route 0, stored 99
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase069', 0, (): void => {
      // Independent literals: index=2, count=5, route=0, stored=99.
      const index: number = 2;
      const count: number = 5;
      const route: number | undefined = 0;
      const stored: number = 99;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8000
     * @tc.name policyExpandedCase070
     * @tc.desc Verify detail policy for index 3, count 7, route 1, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase070', 0, (): void => {
      // Independent literals: index=3, count=7, route=1, stored=-2.
      const index: number = 3;
      const count: number = 7;
      const route: number | undefined = 1;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(1);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8100
     * @tc.name policyExpandedCase071
     * @tc.desc Verify detail policy for index 4, count 7, route 2, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase071', 0, (): void => {
      // Independent literals: index=4, count=7, route=2, stored=-2.
      const index: number = 4;
      const count: number = 7;
      const route: number | undefined = 2;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(2);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(2);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8200
     * @tc.name policyExpandedCase072
     * @tc.desc Verify detail policy for index 5, count 7, route 3, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase072', 0, (): void => {
      // Independent literals: index=5, count=7, route=3, stored=-2.
      const index: number = 5;
      const count: number = 7;
      const route: number | undefined = 3;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(3);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(3);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8300
     * @tc.name policyExpandedCase073
     * @tc.desc Verify detail policy for index 6, count 7, route 6, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase073', 0, (): void => {
      // Independent literals: index=6, count=7, route=6, stored=-2.
      const index: number = 6;
      const count: number = 7;
      const route: number | undefined = 6;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(6);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(6);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8400
     * @tc.name policyExpandedCase074
     * @tc.desc Verify detail policy for index 7, count 7, route 7, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase074', 0, (): void => {
      // Independent literals: index=7, count=7, route=7, stored=-2.
      const index: number = 7;
      const count: number = 7;
      const route: number | undefined = 7;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8500
     * @tc.name policyExpandedCase075
     * @tc.desc Verify detail policy for index 8, count 10, route 10, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase075', 0, (): void => {
      // Independent literals: index=8, count=10, route=10, stored=-2.
      const index: number = 8;
      const count: number = 10;
      const route: number | undefined = 10;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(true);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8600
     * @tc.name policyExpandedCase076
     * @tc.desc Verify detail policy for index 9, count 10, route 99, stored -2
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase076', 0, (): void => {
      // Independent literals: index=9, count=10, route=99, stored=-2.
      const index: number = 9;
      const count: number = 10;
      const route: number | undefined = 99;
      const stored: number = -2;
      expect(isDetailIndexValid(index, count)).assertEqual(true);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8700
     * @tc.name policyExpandedCase077
     * @tc.desc Verify detail policy for index 99, count 10, route undefined, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase077', 0, (): void => {
      // Independent literals: index=99, count=10, route=undefined, stored=-1.
      const index: number = 99;
      const count: number = 10;
      const route: number | undefined = undefined;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8800
     * @tc.name policyExpandedCase078
     * @tc.desc Verify detail policy for index -2, count 10, route -2, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase078', 0, (): void => {
      // Independent literals: index=-2, count=10, route=-2, stored=-1.
      const index: number = -2;
      const count: number = 10;
      const route: number | undefined = -2;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_8900
     * @tc.name policyExpandedCase079
     * @tc.desc Verify detail policy for index -1, count 10, route -1, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase079', 0, (): void => {
      // Independent literals: index=-1, count=10, route=-1, stored=-1.
      const index: number = -1;
      const count: number = 10;
      const route: number | undefined = -1;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9000
     * @tc.name policyExpandedCase080
     * @tc.desc Verify detail policy for index 0, count -1, route 0, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase080', 0, (): void => {
      // Independent literals: index=0, count=-1, route=0, stored=-1.
      const index: number = 0;
      const count: number = -1;
      const route: number | undefined = 0;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9100
     * @tc.name policyExpandedCase081
     * @tc.desc Verify detail policy for index 1, count -1, route 1, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase081', 0, (): void => {
      // Independent literals: index=1, count=-1, route=1, stored=-1.
      const index: number = 1;
      const count: number = -1;
      const route: number | undefined = 1;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9200
     * @tc.name policyExpandedCase082
     * @tc.desc Verify detail policy for index 2, count -1, route 2, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase082', 0, (): void => {
      // Independent literals: index=2, count=-1, route=2, stored=-1.
      const index: number = 2;
      const count: number = -1;
      const route: number | undefined = 2;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9300
     * @tc.name policyExpandedCase083
     * @tc.desc Verify detail policy for index 3, count -1, route 3, stored -1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase083', 0, (): void => {
      // Independent literals: index=3, count=-1, route=3, stored=-1.
      const index: number = 3;
      const count: number = -1;
      const route: number | undefined = 3;
      const stored: number = -1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9400
     * @tc.name policyExpandedCase084
     * @tc.desc Verify detail policy for index 4, count -1, route 6, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase084', 0, (): void => {
      // Independent literals: index=4, count=-1, route=6, stored=0.
      const index: number = 4;
      const count: number = -1;
      const route: number | undefined = 6;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9500
     * @tc.name policyExpandedCase085
     * @tc.desc Verify detail policy for index 5, count 0, route 7, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase085', 0, (): void => {
      // Independent literals: index=5, count=0, route=7, stored=0.
      const index: number = 5;
      const count: number = 0;
      const route: number | undefined = 7;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9600
     * @tc.name policyExpandedCase086
     * @tc.desc Verify detail policy for index 6, count 0, route 10, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase086', 0, (): void => {
      // Independent literals: index=6, count=0, route=10, stored=0.
      const index: number = 6;
      const count: number = 0;
      const route: number | undefined = 10;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9700
     * @tc.name policyExpandedCase087
     * @tc.desc Verify detail policy for index 7, count 0, route 99, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase087', 0, (): void => {
      // Independent literals: index=7, count=0, route=99, stored=0.
      const index: number = 7;
      const count: number = 0;
      const route: number | undefined = 99;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9800
     * @tc.name policyExpandedCase088
     * @tc.desc Verify detail policy for index 8, count 0, route undefined, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase088', 0, (): void => {
      // Independent literals: index=8, count=0, route=undefined, stored=0.
      const index: number = 8;
      const count: number = 0;
      const route: number | undefined = undefined;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_9900
     * @tc.name policyExpandedCase089
     * @tc.desc Verify detail policy for index 9, count 0, route -2, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase089', 0, (): void => {
      // Independent literals: index=9, count=0, route=-2, stored=0.
      const index: number = 9;
      const count: number = 0;
      const route: number | undefined = -2;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_10000
     * @tc.name policyExpandedCase090
     * @tc.desc Verify detail policy for index 99, count 1, route -1, stored 0
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase090', 0, (): void => {
      // Independent literals: index=99, count=1, route=-1, stored=0.
      const index: number = 99;
      const count: number = 1;
      const route: number | undefined = -1;
      const stored: number = 0;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(true);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_10100
     * @tc.name policyExpandedCase091
     * @tc.desc Verify detail policy for index -2, count 1, route 0, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase091', 0, (): void => {
      // Independent literals: index=-2, count=1, route=0, stored=1.
      const index: number = -2;
      const count: number = 1;
      const route: number | undefined = 0;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_10200
     * @tc.name policyExpandedCase092
     * @tc.desc Verify detail policy for index -1, count 1, route 1, stored 1
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyExpandedCase092', 0, (): void => {
      // Independent literals: index=-1, count=1, route=1, stored=1.
      const index: number = -1;
      const count: number = 1;
      const route: number | undefined = 1;
      const stored: number = 1;
      expect(isDetailIndexValid(index, count)).assertEqual(false);
      expect(resolveFeatureDetailIndex(route, count)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(route, stored, count)).assertEqual(0);
      expect(hasPreviousDetail(index)).assertEqual(false);
      expect(hasNextDetail(index, count)).assertEqual(false);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_EXPANDED_10300
     * @tc.name policyExpandedCase093
     * @tc.desc Verify detail policy for index 0, count 1, route 2, stored 1
