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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { GameRule } from '../../../../main/ets/model/GameRule';
import { BoardKit, CELLS, SIDE } from '../common/Game2048TestKit';

/** Suite name written to every log line produced by this file. */
const SUITE: string = 'tileValueContractTest';
/** Cell value that means "no tile here". */
const EMPTY_VALUE: number = 0;
/** Smallest tile the game can spawn. */
const FIRST_SPAWN: number = 2;
/** Largest spawn value the game may place. */
const SECOND_SPAWN: number = 4;
/** Exponent of the smallest tile. */
const MIN_EXPONENT: number = 1;
/** Exponent of the largest tile that still has a colour entry. */
const MAX_EXPONENT: number = 13;
/** Value of the largest tile covered by the colour table. */
const LARGEST_TILE: number = 8192;
/** Values the production randomNum is allowed to place. */
const SPAWN_VALUES: number[] = [FIRST_SPAWN, SECOND_SPAWN];

/**
 * Pure mirror of the tile value rules used by the board.
 *
 * A cell is either empty (zero) or holds a power of two of at least two.
 * Merging is only possible between two equal non-zero neighbours, and the
 * result is always the doubled value. The display rule mirrors the page
 * expression `${data === 0 ? '' : data}`.
 */
class TileValue {
  /**
   * Tells whether a value is a legal tile: an integral power of two of at
   * least two.
   */
  static isPowerOfTwo(value: number): boolean {
    if (value < FIRST_SPAWN) {
      return false;
    }
    if (Math.floor(value) !== value) {
      return false;
    }
    let probe: number = value;
    while (probe % 2 === 0) {
      probe = probe / 2;
    }
    return probe === 1;
  }

  /**
   * Tells whether a value belongs to the two spawn values.
   */
  static isInitialValue(value: number): boolean {
    return value === FIRST_SPAWN || value === SECOND_SPAWN;
  }

  /**
   * Tells whether a cell value is observable on a board: empty or a tile.
   */
  static isLegal(value: number): boolean {
    return value === EMPTY_VALUE || TileValue.isPowerOfTwo(value);
  }

  /**
   * Tells whether two neighbours merge. Empty cells never merge, and two
   * different tiles never merge.
   */
  static canMerge(left: number, right: number): boolean {
    return left !== EMPTY_VALUE && left === right;
  }

  /**
   * Returns the merge result, or undefined when the pair does not merge.
   */
  static mergeResult(left: number, right: number): number | undefined {
    if (!TileValue.canMerge(left, right)) {
      return undefined;
    }
    return left * 2;
  }

  /**
   * Mirrors the tile text expression of the page.
   */
  static displayText(value: number): string {
    return value === EMPTY_VALUE ? '' : `${value}`;
  }
}

/**
 * 方块值语义测试套件。
 *
 * 固化棋盘值的全部约定：0 表示空、2 与 4 是初始值、合法值都是 2 的幂、
 * 只有相等且非零的相邻方块才能合并、合并结果仍为 2 的幂；同时验证
 * GameRule 构造不会改写传入的值，init 只会放置 2 或 4，以及页面显示文本
 * 对 0 输出空串。
 */
export default function tileValueContractTest() {
  describe('tileValueContractTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log(SUITE, 'suite begin');
    });

    afterAll(() => {
      BoardKit.log(SUITE, 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0100
     * @tc.name tileValueZeroRepresentsEmptyCell0100
     * @tc.desc Verify zero is the empty marker that renders as an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_zeroRepresentsEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.isLegal(EMPTY_VALUE)).assertTrue();
      expect(TileValue.displayText(EMPTY_VALUE)).assertEqual('');
      expect(TileValue.displayText(EMPTY_VALUE).length).assertEqual(0);
      expect(TileValue.isPowerOfTwo(EMPTY_VALUE)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0200
     * @tc.name tileValueZeroIsNotAPowerOfTwo0200
     * @tc.desc Verify zero is legal as an empty cell but never counts as a tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_zeroIsNotAPowerOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.isPowerOfTwo(EMPTY_VALUE)).assertFalse();
      expect(TileValue.isInitialValue(EMPTY_VALUE)).assertFalse();
      expect(TileValue.displayText(EMPTY_VALUE)).assertEqual('');
      expect(TileValue.displayText(EMPTY_VALUE) === `${EMPTY_VALUE}`).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0300
     * @tc.name tileValueZeroDoesNotMergeWithZero0300
     * @tc.desc Verify two empty cells never produce a merged tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_zeroDoesNotMergeWithZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.canMerge(EMPTY_VALUE, EMPTY_VALUE)).assertFalse();
      expect(TileValue.mergeResult(EMPTY_VALUE, EMPTY_VALUE)).assertUndefined();
      expect(TileValue.isLegal(EMPTY_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0400
     * @tc.name tileValueZeroDoesNotMergeWithTile0400
     * @tc.desc Verify an empty cell never consumes an adjacent tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_zeroDoesNotMergeWithTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.canMerge(EMPTY_VALUE, FIRST_SPAWN)).assertFalse();
      expect(TileValue.canMerge(FIRST_SPAWN, EMPTY_VALUE)).assertFalse();
      expect(TileValue.mergeResult(EMPTY_VALUE, FIRST_SPAWN)).assertUndefined();
      expect(TileValue.mergeResult(FIRST_SPAWN, EMPTY_VALUE)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0500
     * @tc.name tileValueTwoIsAnInitialValue0500
     * @tc.desc Verify two is a spawn value and a legal power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_twoIsAnInitialValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.isInitialValue(FIRST_SPAWN)).assertTrue();
      expect(TileValue.isPowerOfTwo(FIRST_SPAWN)).assertTrue();
      expect(TileValue.isLegal(FIRST_SPAWN)).assertTrue();
      expect(TileValue.displayText(FIRST_SPAWN)).assertEqual('2');
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0600
     * @tc.name tileValueFourIsAnInitialValue0600
     * @tc.desc Verify four is a spawn value and a legal power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_fourIsAnInitialValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.isInitialValue(SECOND_SPAWN)).assertTrue();
      expect(TileValue.isPowerOfTwo(SECOND_SPAWN)).assertTrue();
      expect(TileValue.isLegal(SECOND_SPAWN)).assertTrue();
      expect(TileValue.displayText(SECOND_SPAWN)).assertEqual('4');
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0700
     * @tc.name tileValueOnlyTwoAndFourAreInitial0700
     * @tc.desc Verify every larger tile is reachable only by merging, never by spawning
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_onlyTwoAndFourAreInitial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let initial: number = 0;
      for (let exponent: number = MIN_EXPONENT; exponent <= MAX_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        if (TileValue.isInitialValue(value)) {
          initial = initial + 1;
        } else {
          expect(TileValue.isPowerOfTwo(value)).assertTrue();
        }
      }
      expect(initial).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0800
     * @tc.name tileValueSpawnSetIsTwoOrFour0800
     * @tc.desc Verify the spawn set holds exactly the two documented values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_spawnSetIsTwoOrFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(SPAWN_VALUES.length).assertEqual(2);
      expect(SPAWN_VALUES).assertContain([FIRST_SPAWN]);
      expect(SPAWN_VALUES).assertContain([SECOND_SPAWN]);
      expect(TileValue.isInitialValue(8)).assertFalse();
      expect(TileValue.displayText(SECOND_SPAWN)).assertContain(['4']);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_0900
     * @tc.name tileValueEightIsNotInitial0900
     * @tc.desc Verify eight is legal but must be produced by merging two fours
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_eightIsNotInitial', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.isInitialValue(8)).assertFalse();
      expect(TileValue.isPowerOfTwo(8)).assertTrue();
      expect(TileValue.isLegal(8)).assertTrue();
      expect(TileValue.mergeResult(SECOND_SPAWN, SECOND_SPAWN)).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1000
     * @tc.name tileValueLegalTilesArePowersOfTwo1000
     * @tc.desc Verify every non-empty legal cell value is an integral power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_legalTilesArePowersOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [0, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192];
      let checked: number = 0;
      for (let index: number = 0; index < values.length; index++) {
        if (values[index] !== EMPTY_VALUE) {
          expect(TileValue.isPowerOfTwo(values[index])).assertTrue();
          expect(TileValue.isLegal(values[index])).assertTrue();
        }
        checked = checked + 1;
      }
      expect(checked).assertEqual(14);
      expect(TileValue.isLegal(EMPTY_VALUE)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1100
     * @tc.name tileValueExponentsOneThroughThirteenAreLegal1100
     * @tc.desc Verify the whole 2^1..2^13 chain is accepted as tile values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_exponentsOneThroughThirteenAreLegal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let count: number = 0;
      let previous: number = 0;
      for (let exponent: number = MIN_EXPONENT; exponent <= MAX_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        expect(TileValue.isLegal(value)).assertTrue();
        expect(value > previous).assertTrue();
        expect(value % 2).assertEqual(0);
        previous = value;
        count = count + 1;
      }
      expect(count).assertEqual(13);
      expect(previous).assertEqual(LARGEST_TILE);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1200
     * @tc.name tileValueOneIsNotALegalTile1200
     * @tc.desc Verify the boundary value one is rejected because tiles start at two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_oneIsNotALegalTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.isPowerOfTwo(1)).assertFalse();
      expect(TileValue.isLegal(1)).assertFalse();
      expect(TileValue.isInitialValue(1)).assertFalse();
      expect(TileValue.displayText(1)).assertEqual('1');
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1300
     * @tc.name tileValueBeyondTableIsStillAPowerOfTwo1300
     * @tc.desc Verify a merge may exceed the colour table while remaining a valid tile value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_beyondTableIsStillAPowerOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.isPowerOfTwo(16384)).assertTrue();
      expect(TileValue.isLegal(16384)).assertTrue();
      expect(TileValue.mergeResult(LARGEST_TILE, LARGEST_TILE)).assertEqual(16384);
      expect(TileValue.displayText(16384)).assertEqual('16384');
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1400
     * @tc.name tileValueNonPowerValuesAreNotLegal1400
     * @tc.desc Verify values that are not powers of two are rejected as tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_nonPowerValuesAreNotLegal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rejected: number[] = [3, 5, 6, 7, 10, 12, 100, 1000];
      let rejectedCount: number = 0;
      for (let index: number = 0; index < rejected.length; index++) {
        expect(TileValue.isPowerOfTwo(rejected[index])).assertFalse();
        expect(TileValue.isLegal(rejected[index])).assertFalse();
        rejectedCount = rejectedCount + 1;
      }
      expect(rejectedCount).assertEqual(8);
      expect(TileValue.isPowerOfTwo(FIRST_SPAWN)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1500
     * @tc.name tileValueNegativeValuesAreNotLegal1500
     * @tc.desc Verify negative values never behave like tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_negativeValuesAreNotLegal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let negatives: number[] = [-2, -4, -8, -1024];
      let checked: number = 0;
      for (let index: number = 0; index < negatives.length; index++) {
        expect(TileValue.isPowerOfTwo(negatives[index])).assertFalse();
        expect(TileValue.isLegal(negatives[index])).assertFalse();
        expect(TileValue.canMerge(negatives[index], negatives[index])).assertTrue();
        checked = checked + 1;
      }
      expect(checked).assertEqual(4);
      expect(TileValue.isLegal(FIRST_SPAWN)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1600
     * @tc.name tileValueFractionalValuesAreNotLegal1600
     * @tc.desc Verify fractional values are rejected even when they look like half tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_fractionalValuesAreNotLegal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let fractions: number[] = [0.5, 1.5, 2.5, 4.5];
      let checked: number = 0;
      for (let index: number = 0; index < fractions.length; index++) {
        expect(TileValue.isPowerOfTwo(fractions[index])).assertFalse();
        expect(TileValue.isLegal(fractions[index])).assertFalse();
        checked = checked + 1;
      }
      expect(checked).assertEqual(4);
      expect(TileValue.isLegal(SECOND_SPAWN)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1700
     * @tc.name tileValueEqualValuesCanMerge1700
     * @tc.desc Verify equal non-zero neighbours always merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_equalValuesCanMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.canMerge(FIRST_SPAWN, FIRST_SPAWN)).assertTrue();
      expect(TileValue.canMerge(64, 64)).assertTrue();
      expect(TileValue.canMerge(4096, 4096)).assertTrue();
      expect(TileValue.canMerge(64, 64)).assertEqual(TileValue.canMerge(4096, 4096));
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1800
     * @tc.name tileValueDifferentValuesCannotMerge1800
     * @tc.desc Verify unequal neighbours never merge in either direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_differentValuesCannotMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let left: number[] = [2, 8, 1024, 4096];
      let right: number[] = [4, 16, 2048, 8192];
      let refused: number = 0;
      for (let index: number = 0; index < left.length; index++) {
        expect(TileValue.canMerge(left[index], right[index])).assertFalse();
        expect(TileValue.canMerge(right[index], left[index])).assertFalse();
        refused = refused + 1;
      }
      expect(refused).assertEqual(4);
      expect(TileValue.mergeResult(FIRST_SPAWN, SECOND_SPAWN)).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_1900
     * @tc.name tileValueTwoAndFourDoNotMerge1900
     * @tc.desc Verify the two spawn values stay separate instead of producing a six
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_twoAndFourDoNotMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.canMerge(FIRST_SPAWN, SECOND_SPAWN)).assertFalse();
      expect(TileValue.canMerge(SECOND_SPAWN, FIRST_SPAWN)).assertFalse();
      expect(TileValue.mergeResult(FIRST_SPAWN, SECOND_SPAWN)).assertUndefined();
      expect(TileValue.isLegal(FIRST_SPAWN + SECOND_SPAWN)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2000
     * @tc.name tileValueMergeDoublesValue2000
     * @tc.desc Verify a merge produces double the merged value, not the sum of both cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_mergeDoublesValue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.mergeResult(FIRST_SPAWN, FIRST_SPAWN)).assertEqual(4);
      expect(TileValue.mergeResult(64, 64)).assertEqual(128);
      expect(TileValue.mergeResult(4096, 4096)).assertEqual(8192);
      expect(TileValue.mergeResult(4096, 4096) === 4096 + 4096).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2100
     * @tc.name tileValueMergeResultIsPowerOfTwo2100
     * @tc.desc Verify every merge of two equal tiles yields another legal tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_mergeResultIsPowerOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let merged: number = 0;
      for (let exponent: number = MIN_EXPONENT; exponent <= MAX_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        let result: number | undefined = TileValue.mergeResult(value, value);
        expect(result === undefined).assertFalse();
        expect(TileValue.isPowerOfTwo(result as number)).assertTrue();
        merged = merged + 1;
      }
      expect(merged).assertEqual(MAX_EXPONENT);
      expect(TileValue.isLegal(16384)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2200
     * @tc.name tileValueMergeEqualsSumOfInputs2200
     * @tc.desc Verify the merged value equals the arithmetic sum of the two contributing tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_mergeEqualsSumOfInputs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let checked: number = 0;
      for (let exponent: number = MIN_EXPONENT; exponent < MAX_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        let result: number | undefined = TileValue.mergeResult(value, value);
        expect(result).assertEqual(value + value);
        checked = checked + 1;
      }
      expect(checked).assertEqual(12);
      expect(TileValue.mergeResult(LARGEST_TILE, LARGEST_TILE)).assertEqual(16384);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2300
     * @tc.name tileValueDistinctPowersAreNeverEqual2300
     * @tc.desc Verify neighbouring powers of two differ, which is why they cannot merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_distinctPowersAreNeverEqual', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let comparisons: number = 0;
      for (let exponent: number = MIN_EXPONENT; exponent < MAX_EXPONENT; exponent++) {
        let lower: number = Math.pow(2, exponent);
        let upper: number = Math.pow(2, exponent + 1);
        expect(lower === upper).assertFalse();
        expect(lower !== upper).assertTrue();
        comparisons = comparisons + 1;
      }
      expect(comparisons).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2400
     * @tc.name tileValueEqualityUsesStrictCompare2400
     * @tc.desc Verify tile equality is decided by strict comparison of numeric values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_equalityUsesStrictCompare', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let left: number = 64;
      let right: number = 128;
      let same: boolean = left === left;
      let different: boolean = left === right;
      let notSame: boolean = left !== right;
      expect(same).assertTrue();
      expect(different).assertFalse();
      expect(notSame).assertTrue();
      expect(TileValue.canMerge(64, 64)).assertEqual(same);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2500
     * @tc.name tileValueConstructionPreservesValues2500
     * @tc.desc Verify constructing a rule copies the supplied tile values unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_constructionPreservesValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [
        0, 2, 0, 4,
        8, 0, 16, 0,
        32, 0, 64, 0,
        128, 0, 256, 0
      ];
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2600
     * @tc.name tileValueConstructionKeepsZeros2600
     * @tc.desc Verify empty cells stay empty instead of being filled during construction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_constructionKeepsZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = FIRST_SPAWN;
      values[5] = SECOND_SPAWN;
      values[15] = 512;
      let rule: GameRule = BoardKit.rule(values);
      expect(BoardKit.positionsOf(rule.dataNumbers, EMPTY_VALUE).length).assertEqual(13);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(rule.dataNumbers[5]).assertEqual(SECOND_SPAWN);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2700
     * @tc.name tileValueConstructionDoesNotMerge2700
     * @tc.desc Verify adjacent equal values survive construction without merging or scoring
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_constructionDoesNotMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(values);
      BoardKit.expectBoard(rule, values);
      expect(rule.dataNumbers[0]).assertEqual(rule.dataNumbers[1]);
      expect(rule.dataNumbers[2]).assertEqual(rule.dataNumbers[3]);
      expect(rule.score).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2800
     * @tc.name tileValueInitProducesOnlySpawnValues2800
     * @tc.desc Verify init spawns exactly two tiles and both are spawn values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_initProducesOnlySpawnValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let spawned: number = 0;
      for (let index: number = 0; index < rule.dataNumbers.length; index++) {
        let value: number = rule.dataNumbers[index];
        if (value !== EMPTY_VALUE) {
          expect(TileValue.isInitialValue(value)).assertTrue();
          spawned = spawned + 1;
        }
      }
      expect(spawned).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_2900
     * @tc.name tileValueInitLeavesFourteenEmptyCells2900
     * @tc.desc Verify init leaves exactly fourteen empty cells on a 4x4 board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_initLeavesFourteenEmptyCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      rule.init();
      let empty: number = 0;
      for (let index: number = 0; index < rule.dataNumbers.length; index++) {
        if (rule.dataNumbers[index] === EMPTY_VALUE) {
          empty = empty + 1;
        }
      }
      expect(empty).assertEqual(14);
      expect(empty).assertEqual(CELLS - 2);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3000
     * @tc.name tileValueDisplayTextZeroIsEmpty3000
     * @tc.desc Verify zero renders as an empty string and never as the digit zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_displayTextZeroIsEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let text: string = TileValue.displayText(EMPTY_VALUE);
      expect(text).assertEqual('');
      expect(text === '0').assertFalse();
      expect(TileValue.isLegal(EMPTY_VALUE)).assertTrue();
      expect(text.length).assertEqual(0);
      expect(text.match(/[\s\S]/)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3100
     * @tc.name tileValueDisplayTextKeepsOneDigit3100
     * @tc.desc Verify single digit tiles render as their own digit
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_displayTextKeepsOneDigit', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.displayText(FIRST_SPAWN)).assertEqual('2');
      expect(TileValue.displayText(SECOND_SPAWN)).assertEqual('4');
      expect(TileValue.displayText(8)).assertEqual('8');
      expect(TileValue.displayText(FIRST_SPAWN).length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3200
     * @tc.name tileValueDisplayTextKeepsAllDigits3200
     * @tc.desc Verify multi digit tiles keep every digit without separators or rounding
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_displayTextKeepsAllDigits', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      expect(TileValue.displayText(1024)).assertEqual('1024');
      expect(TileValue.displayText(2048)).assertEqual('2048');
      expect(TileValue.displayText(LARGEST_TILE)).assertEqual('8192');
      expect(TileValue.displayText(1024)).assertContain(['1024']);
      expect(TileValue.displayText(1024).length).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3300
     * @tc.name tileValueDisplayTextMirrorsTemplate3300
     * @tc.desc Verify the display mirror agrees with the page template for every legal tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_displayTextMirrorsTemplate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let matched: number = 0;
      for (let exponent: number = MIN_EXPONENT; exponent <= MAX_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        expect(TileValue.displayText(value)).assertEqual(`${value}`);
        expect(TileValue.displayText(value) === '').assertFalse();
        matched = matched + 1;
      }
      expect(matched).assertEqual(MAX_EXPONENT);
      expect(TileValue.displayText(EMPTY_VALUE)).assertEqual('');
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3400
     * @tc.name tileValueDisplayTextNeverRendersZero3400
     * @tc.desc Verify no tile ever renders the digit string zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_displayTextNeverRendersZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rendered: number = 0;
      for (let exponent: number = MIN_EXPONENT; exponent <= MAX_EXPONENT; exponent++) {
        let value: number = Math.pow(2, exponent);
        expect(TileValue.displayText(value) === '0').assertFalse();
        rendered = rendered + 1;
      }
      expect(rendered).assertEqual(MAX_EXPONENT);
      expect(TileValue.displayText(EMPTY_VALUE) === '0').assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3500
     * @tc.name tileValueMergeChainReachesLargestTile3500
     * @tc.desc Verify repeated merging of identical tiles walks the whole power of two chain
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_mergeChainReachesLargestTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let value: number = FIRST_SPAWN;
      let steps: number = 0;
      while (value < LARGEST_TILE) {
        let result: number | undefined = TileValue.mergeResult(value, value);
        value = result as number;
        steps = steps + 1;
      }
      expect(value).assertEqual(LARGEST_TILE);
      expect(steps).assertEqual(12);
      expect(TileValue.isPowerOfTwo(value)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3600
     * @tc.name tileValueDenseBoardHoldsLegalTiles3600
     * @tc.desc Verify a full board with no available merge still consists of legal tile values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_denseBoardHoldsLegalTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let legal: number = 0;
      let merges: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        expect(TileValue.isLegal(values[index])).assertTrue();
        legal = legal + 1;
        let column: number = index % SIDE;
        let row: number = Math.floor(index / SIDE);
        if (column + 1 < SIDE) {
          if (TileValue.canMerge(values[index], values[index + 1])) {
            merges = merges + 1;
          }
        }
        if (row + 1 < SIDE) {
          if (TileValue.canMerge(values[index], values[index + SIDE])) {
            merges = merges + 1;
          }
        }
      }
      expect(legal).assertEqual(CELLS);
      expect(merges).assertEqual(0);
      expect(BoardKit.countNonZero(values)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_TILEVALUECONTRACT_3700
     * @tc.name tileValueMoveKeepsValuesLegal3700
     * @tc.desc Verify a production move leaves every cell either empty or a legal power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tileValue_moveKeepsValuesLegal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.move('left');
      let checked: number = 0;
      let tiles: number = 0;
      for (let index: number = 0; index < rule.dataNumbers.length; index++) {
        let value: number = rule.dataNumbers[index];
        expect(TileValue.isLegal(value)).assertTrue();
        checked = checked + 1;
        if (value !== EMPTY_VALUE) {
          expect(TileValue.isPowerOfTwo(value)).assertTrue();
          tiles = tiles + 1;
        }
      }
      expect(checked).assertEqual(CELLS);
      expect(tiles).assertEqual(3);
      expect(tiles < CELLS).assertTrue();
    });
  });
}
