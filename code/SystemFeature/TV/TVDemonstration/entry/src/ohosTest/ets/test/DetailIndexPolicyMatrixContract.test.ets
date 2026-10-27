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

const COUNT_VARIANTS: number[] = [0, 1, 3, 7];
const INDEX_VARIANTS: number[] = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 999];
// VALID_EXPECTED[countRow][indexColumn] is the expected isDetailIndexValid result.
const VALID_EXPECTED: boolean[][] = [
  [false, false, false, false, false, false, false, false, false, false],
  [false, true, false, false, false, false, false, false, false, false],
  [false, true, true, true, false, false, false, false, false, false],
  [false, true, true, true, true, true, true, true, false, false]
];
const FEATURE_ROUTE_VARIANTS: (number | undefined)[] = [undefined, -1, 0, 3, 6, 7, 999];
const FEATURE_COUNT_SEVEN_EXPECTED: number[] = [0, 0, 0, 3, 6, 0, 0];
const SMART_ROUTE_VARIANTS: (number | undefined)[] = [undefined, -1, 0, 1, 2, 3, 99];
const STORED_VARIANTS: number[] = [-1, 0, 1, 2, 99];
// SMART_TABLE[routeRow][storedColumn] is the expected resolveSmartLifeDetailIndex result.
const SMART_TABLE: number[][] = [
  [0, 0, 1, 2, 0],
  [0, 0, 1, 2, 0],
  [0, 0, 0, 0, 0],
  [1, 1, 1, 1, 1],
  [2, 2, 2, 2, 2],
  [0, 0, 1, 2, 0],
  [0, 0, 1, 2, 0]
];

export default function detailIndexPolicyMatrixContractTest(): void {
  describe('DetailIndexPolicyMatrixContractTest', () => {
    // Pace the pure-logic matrix; see MainThreadYield.ets.
    beforeEach(keepMainThreadResponsive);
    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0100
     * @tc.name policyIsValidFullTruthTable001
     * @tc.desc Verify isDetailIndexValid against every count and index combination
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyIsValidFullTruthTable001', 0, (): void => {
      for (let countRow: number = 0; countRow < COUNT_VARIANTS.length; countRow++) {
        const count: number = COUNT_VARIANTS[countRow];
        for (let indexCol: number = 0; indexCol < INDEX_VARIANTS.length; indexCol++) {
          const index: number = INDEX_VARIANTS[indexCol];
          expect(isDetailIndexValid(index, count)).assertEqual(VALID_EXPECTED[countRow][indexCol]);
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0200
     * @tc.name policyFeatureResolveCountSeven002
     * @tc.desc Verify resolveFeatureDetailIndex over the full route set at count seven
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyFeatureResolveCountSeven002', 0, (): void => {
      for (let routeIndex: number = 0; routeIndex < FEATURE_ROUTE_VARIANTS.length; routeIndex++) {
        const route: number | undefined = FEATURE_ROUTE_VARIANTS[routeIndex];
        expect(resolveFeatureDetailIndex(route, 7)).assertEqual(FEATURE_COUNT_SEVEN_EXPECTED[routeIndex]);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0300
     * @tc.name policyFeatureResolveCountVariants003
     * @tc.desc Verify resolveFeatureDetailIndex across all count variants
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyFeatureResolveCountVariants003', 0, (): void => {
      const routes: (number | undefined)[] = [undefined, -1, 0, 1, 2, 999];
      // Expected row per count [0, 1, 3, 7] over the six route values above.
      const expectedRows: number[][] = [
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 0, 0, 0],
        [0, 0, 0, 1, 2, 0],
        [0, 0, 0, 1, 2, 0]
      ];
      for (let countRow: number = 0; countRow < COUNT_VARIANTS.length; countRow++) {
        const count: number = COUNT_VARIANTS[countRow];
        for (let routeIndex: number = 0; routeIndex < routes.length; routeIndex++) {
          expect(resolveFeatureDetailIndex(routes[routeIndex], count))
            .assertEqual(expectedRows[countRow][routeIndex]);
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0400
     * @tc.name policySmartResolveFullTruthTable004
     * @tc.desc Verify resolveSmartLifeDetailIndex over the complete route and stored matrix
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policySmartResolveFullTruthTable004', 0, (): void => {
      for (let routeRow: number = 0; routeRow < SMART_ROUTE_VARIANTS.length; routeRow++) {
        const route: number | undefined = SMART_ROUTE_VARIANTS[routeRow];
        for (let storedCol: number = 0; storedCol < STORED_VARIANTS.length; storedCol++) {
          const stored: number = STORED_VARIANTS[storedCol];
          expect(resolveSmartLifeDetailIndex(route, stored, 3)).assertEqual(SMART_TABLE[routeRow][storedCol]);
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0500
     * @tc.name policySmartResolveSingleSceneCount005
     * @tc.desc Verify the resolver degenerates correctly when only one scene exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policySmartResolveSingleSceneCount005', 0, (): void => {
      expect(resolveSmartLifeDetailIndex(0, -1, 1)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(1, -1, 1)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(undefined, 0, 1)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(undefined, 1, 1)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(99, 99, 1)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(-1, 0, 1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0600
     * @tc.name policySmartResolveZeroCount006
     * @tc.desc Verify every route and stored input collapses to zero when no scene exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policySmartResolveZeroCount006', 0, (): void => {
      for (let routeIndex: number = 0; routeIndex < SMART_ROUTE_VARIANTS.length; routeIndex++) {
        for (let storedCol: number = 0; storedCol < STORED_VARIANTS.length; storedCol++) {
          expect(resolveSmartLifeDetailIndex(SMART_ROUTE_VARIANTS[routeIndex], STORED_VARIANTS[storedCol], 0))
            .assertEqual(0);
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0700
     * @tc.name policyHasPreviousTruthTable007
     * @tc.desc Verify hasPreviousDetail over negative, first, middle and overflow indices
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyHasPreviousTruthTable007', 0, (): void => {
      const indices: number[] = [-1, 0, 1, 3, 7];
      const expected: boolean[] = [false, false, true, true, true];
      for (let indexPos: number = 0; indexPos < indices.length; indexPos++) {
        expect(hasPreviousDetail(indices[indexPos])).assertEqual(expected[indexPos]);
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0800
     * @tc.name policyHasNextFullTruthTable008
     * @tc.desc Verify hasNextDetail across every index and count combination
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyHasNextFullTruthTable008', 0, (): void => {
      const indexSet: number[] = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 999];
      const expectedRows: boolean[][] = [
        [false, false, false, false, false, false, false, false, false, false],
        [false, false, false, false, false, false, false, false, false, false],
        [false, true, true, false, false, false, false, false, false, false],
        [false, true, true, true, true, true, true, false, false, false]
      ];
      for (let countRow: number = 0; countRow < COUNT_VARIANTS.length; countRow++) {
        const count: number = COUNT_VARIANTS[countRow];
        for (let indexPos: number = 0; indexPos < indexSet.length; indexPos++) {
          expect(hasNextDetail(indexSet[indexPos], count)).assertEqual(expectedRows[countRow][indexPos]);
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_0900
     * @tc.name policyValidityAgreesWithResolveIdentity009
     * @tc.desc Verify the valid set of isDetailIndexValid matches resolve identity per count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyValidityAgreesWithResolveIdentity009', 0, (): void => {
      for (let countRow: number = 0; countRow < COUNT_VARIANTS.length; countRow++) {
        const count: number = COUNT_VARIANTS[countRow];
        for (let indexPos: number = 0; indexPos < INDEX_VARIANTS.length; indexPos++) {
          const index: number = INDEX_VARIANTS[indexPos];
          const valid: boolean = isDetailIndexValid(index, count);
          if (valid) {
            expect(resolveFeatureDetailIndex(index, count)).assertEqual(index);
          } else {
            expect(resolveFeatureDetailIndex(index, count)).assertEqual(0);
          }
        }
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_1000
     * @tc.name policyRoutePrecedenceRules010
     * @tc.desc Verify route-outranks-stored, stored-recovers-invalid-route, and total fallback
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyRoutePrecedenceRules010', 0, (): void => {
      // Valid route wins over a different stored value.
      expect(resolveSmartLifeDetailIndex(1, 0, 3)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(2, 1, 3)).assertEqual(2);
      // Invalid route recovers through a legal stored value.
      expect(resolveSmartLifeDetailIndex(9, 2, 3)).assertEqual(2);
      expect(resolveSmartLifeDetailIndex(-5, 1, 3)).assertEqual(1);
      // Both invalid fall back to the first scene.
      expect(resolveSmartLifeDetailIndex(9, 9, 3)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(undefined, -1, 3)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_1100
     * @tc.name policySmartResolveSevenSceneCount011
     * @tc.desc Verify the Smart resolver over a hypothetical seven-scene detail count
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policySmartResolveSevenSceneCount011', 0, (): void => {
      // Routes 0..6 are valid at count 7; anything else falls back to stored then zero.
      expect(resolveSmartLifeDetailIndex(0, 9, 7)).assertEqual(0);
      expect(resolveSmartLifeDetailIndex(3, 9, 7)).assertEqual(3);
      expect(resolveSmartLifeDetailIndex(6, 9, 7)).assertEqual(6);
      expect(resolveSmartLifeDetailIndex(7, 2, 7)).assertEqual(2);
      expect(resolveSmartLifeDetailIndex(99, 1, 7)).assertEqual(1);
      expect(resolveSmartLifeDetailIndex(-1, 5, 7)).assertEqual(5);
      expect(resolveSmartLifeDetailIndex(undefined, 9, 7)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_1200
     * @tc.name policyHasNextZeroCountNever012
     * @tc.desc Verify hasNextDetail is always false when no detail exists
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyHasNextZeroCountNever012', 0, (): void => {
      const indices: number[] = [-1, 0, 1, 5, 999];
      for (let indexPos: number = 0; indexPos < indices.length; indexPos++) {
        expect(hasNextDetail(indices[indexPos], 0)).assertFalse();
      }
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_1300
     * @tc.name policyFeatureUndefinedAlwaysZero013
     * @tc.desc Verify an undefined Feature route always resolves to zero
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyFeatureUndefinedAlwaysZero013', 0, (): void => {
      expect(resolveFeatureDetailIndex(undefined, 7)).assertEqual(0);
      expect(resolveFeatureDetailIndex(undefined, 3)).assertEqual(0);
      expect(resolveFeatureDetailIndex(undefined, 1)).assertEqual(0);
      expect(resolveFeatureDetailIndex(undefined, 0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_TV_DEMONSTRATION_POLICY_MATRIX_1400
     * @tc.name policyHasPreviousUndefinedNegativeBound014
     * @tc.desc Verify hasPreviousDetail stays false at and below the first index
     * @tc.size SmallTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('policyHasPreviousUndefinedNegativeBound014', 0, (): void => {
      const indices: number[] = [-100, -1, 0];
      for (let indexPos: number = 0; indexPos < indices.length; indexPos++) {
        expect(hasPreviousDetail(indices[indexPos])).assertFalse();
      }
      expect(hasPreviousDetail(1)).assertTrue();
    });
  });
}
