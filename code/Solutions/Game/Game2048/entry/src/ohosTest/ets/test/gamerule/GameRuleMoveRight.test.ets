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
import { BoardKit, CELLS, SIDE, DIR_RIGHT, DIR_LEFT, SPAWN_VALUES } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** Status value a freshly constructed rule reports before any move is applied. */
const BEFORE_STATUS: number = -1;

/**
 * Returns the index of the first cell holding the requested value, or null
 * when no cell holds it. The null branch lets a case state "this tile is gone"
 * without inventing a sentinel index.
 */
function firstCellOf(values: number[], target: number): number | null {
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] === target) {
      return index;
    }
  }
  return null;
}

/**
 * GameRule 右移行为测试套件。
 *
 * 生产实现把一行从右往左扫描：先跳过空格找到最近的非零块，再按三种情况处理
 * （目标格为空则搬移、数值相等则合并、否则不动）。moveInRow 只做行内移动，
 * 不补新块；move 在棋盘确实变化后补一块 2 或 4。本套件逐条固化这些契约，
 * 并用 BoardOracle 的独立算法（先压缩再合并）做交叉验证。
 */
export default function gameRuleMoveRightTest() {
  describe('gameRuleMoveRightTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMoveRightTest', 'suite begin');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0100
     * @tc.name moveRightSingleTileFromColumnZero0100
     * @tc.desc Verify a lone tile in column zero slides to the last column on a right row move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_singleTileFromColumnZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[0] = 2;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_singleTileFromColumnZero', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(2);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0200
     * @tc.name moveRightSingleTileFromColumnOne0200
     * @tc.desc Verify a tile in column one crosses two empty cells on a right row move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_singleTileFromColumnOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[1] = 2;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_singleTileFromColumnOne', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0300
     * @tc.name moveRightSingleTileFromColumnTwo0300
     * @tc.desc Verify a tile adjacent to the right edge only moves one column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_singleTileFromColumnTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[2] = 8;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_singleTileFromColumnTwo', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 8]);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(rule.dataNumbers[3]).assertEqual(8);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0400
     * @tc.name moveRightSingleTileAtColumnThreeStays0400
     * @tc.desc Verify a tile already on the right edge is not moved by a right row move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_singleTileAtColumnThreeStays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[3] = 16;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_singleTileAtColumnThreeStays', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectBoard(rule, board);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0500
     * @tc.name moveRightSingleTileInLastRow0500
     * @tc.desc Verify the row index selects the row that moves and the other rows stay empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_singleTileInLastRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      board[13] = 2;
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_singleTileInLastRow', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, SIDE - 1);
      expect(rule.dataNumbers[15]).assertEqual(2);
      expect(rule.dataNumbers[13]).assertEqual(0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 0, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0600
     * @tc.name moveRightTwoTilesWithGap0600
     * @tc.desc Verify two different tiles keep their order while closing the gap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_twoTilesWithGap', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_twoTilesWithGap', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0700
     * @tc.name moveRightAdjacentPairMerges0700
     * @tc.desc Verify two adjacent equal tiles at the left of a row merge into one doubled tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_adjacentPairMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_adjacentPairMerges', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(firstCellOf(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0800
     * @tc.name moveRightAdjacentPairAtEdge0800
     * @tc.desc Verify an equal pair already next to the right edge merges in place
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_adjacentPairAtEdge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_adjacentPairAtEdge', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_0900
     * @tc.name moveRightPairAcrossTwoZeros0900
     * @tc.desc Verify equal tiles separated by two empty cells still merge on a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairAcrossTwoZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairAcrossTwoZeros', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1000
     * @tc.name moveRightPairAcrossOneZero1000
     * @tc.desc Verify equal tiles separated by a single empty cell merge on a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairAcrossOneZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairAcrossOneZero', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      expect(rule.dataNumbers[1]).assertEqual(0);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1100
     * @tc.name moveRightAdjacentUnequalNoMerge1100
     * @tc.desc Verify two adjacent different tiles never merge and keep their relative order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_adjacentUnequalNoMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_adjacentUnequalNoMerge', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1200
     * @tc.name moveRightAdjacentUnequalReversed1200
     * @tc.desc Verify a larger leading tile keeps precedence when no merge is possible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_adjacentUnequalReversed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_adjacentUnequalReversed', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 2]);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1300
     * @tc.name moveRightPairOfFoursAcrossThreeZeros1300
     * @tc.desc Verify a pair of fours at the two row ends merges across three empty cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairOfFoursAcrossThreeZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairOfFoursAcrossThreeZeros', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 8]);
      BoardKit.expectScore(rule, 8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1400
     * @tc.name moveRightPairOfEightsAcrossOneZero1400
     * @tc.desc Verify a pair of eights with one empty cell between them merges into sixteen
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairOfEightsAcrossOneZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 8, 0, 8]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairOfEightsAcrossOneZero', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 16]);
      BoardKit.expectScore(rule, 16);
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(rule.dataNumbers[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1500
     * @tc.name moveRightTripleWithPairAtLeft1500
     * @tc.desc Verify the rightmost pair of three equal tiles merges and the third tile trails it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_tripleWithPairAtLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_tripleWithPairAtLeft', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1600
     * @tc.name moveRightTripleWithPairAtRight1600
     * @tc.desc Verify three equal tiles already near the right edge merge the nearest pair only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_tripleWithPairAtRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_tripleWithPairAtRight', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      BoardKit.expectScore(rule, 4);
      expect(firstCellOf(rule.dataNumbers, 4)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1700
     * @tc.name moveRightPairThenTrailingTile1700
     * @tc.desc Verify a pair of fours merges to eight while the leading two moves beside it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairThenTrailingTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairThenTrailingTile', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1800
     * @tc.name moveRightLeadingPairThenFour1800
     * @tc.desc Verify a leading equal pair merges while a later different tile stays put
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_leadingPairThenFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_leadingPairThenFour', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_1900
     * @tc.name moveRightFourThenLeadPair1900
     * @tc.desc Verify a four followed by an equal pair merges only the pair
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_fourThenLeadPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_fourThenLeadPair', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2000
     * @tc.name moveRightPairInMiddleThenFour2000
     * @tc.desc Verify an inner equal pair merges while the outer four stays at the edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairInMiddleThenFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairInMiddleThenFour', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2100
     * @tc.name moveRightPairThenEight2100
     * @tc.desc Verify a leading pair of fours merges to eight and the trailing eight is kept
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairThenEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 4, 8, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairThenEight', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 8, 8]);
      BoardKit.expectScore(rule, 8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2200
     * @tc.name moveRightTrailingPairAfterLead2200
     * @tc.desc Verify the right edge tile merges across a gap and the leftover lead tile fills column two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_trailingPairAfterLead', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_trailingPairAfterLead', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2300
     * @tc.name moveRightTripleAnchoredAtRight2300
     * @tc.desc Verify a triple resting on the right edge merges its rightmost pair into eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_tripleAnchoredAtRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 4, 4, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_tripleAnchoredAtRight', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2400
     * @tc.name moveRightTripleStartingAtLeft2400
     * @tc.desc Verify a triple starting at column zero compacts then merges at the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_tripleStartingAtLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 4, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_tripleStartingAtLeft', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(firstCellOf(rule.dataNumbers, 4)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2500
     * @tc.name moveRightMiddlePairBetweenTiles2500
     * @tc.desc Verify an inner equal pair merges while both unequal outer tiles survive
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_middlePairBetweenTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 4, 8]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_middlePairBetweenTiles', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 8, 8]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2600
     * @tc.name moveRightPairFollowsLeadingFour2600
     * @tc.desc Verify a pair behind a leading four merges without merging with that four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairFollowsLeadingFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairFollowsLeadingFour', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 4, 2, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2700
     * @tc.name moveRightPairBeforeTrailingFour2700
     * @tc.desc Verify a pair in front of a trailing four merges and leaves both fours apart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairBeforeTrailingFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairBeforeTrailingFour', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2800
     * @tc.name moveRightThreeDistinctTiles2800
     * @tc.desc Verify three ascending distinct tiles compact to the right without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_threeDistinctTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 8, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_threeDistinctTiles', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 4, 8]);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_2900
     * @tc.name moveRightFourIdenticalTwos2900
     * @tc.desc Verify four equal twos become two fours on a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_fourIdenticalTwos', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_fourIdenticalTwos', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 4]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(firstCellOf(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3000
     * @tc.name moveRightInnerPairBetweenOuterEights3000
     * @tc.desc Verify an inner pair merges while the two outer eights stay separated by the new tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_innerPairBetweenOuterEights', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([8, 2, 2, 8]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_innerPairBetweenOuterEights', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 8, 4, 8]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3100
     * @tc.name moveRightLeadingPairBeforeDistinctTail3100
     * @tc.desc Verify a leading pair merges while the two distinct tiles keep their edge positions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_leadingPairBeforeDistinctTail', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 4, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_leadingPairBeforeDistinctTail', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 8, 2, 4]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
      BoardKit.expectSumPreserved(board, rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3200
     * @tc.name moveRightTwoPairsFourEight3200
     * @tc.desc Verify a four pair and an eight pair each merge once on a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_twoPairsFourEight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 4, 8, 8]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_twoPairsFourEight', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 8, 16]);
      BoardKit.expectScore(rule, 24);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3300
     * @tc.name moveRightTrailingPairShiftsLeadTiles3300
     * @tc.desc Verify the trailing pair merges first and the two leading distinct tiles shift beside it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_trailingPairShiftsLeadTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([8, 2, 8, 8]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_trailingPairShiftsLeadTiles', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 8, 2, 16]);
      BoardKit.expectScore(rule, 16);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3400
     * @tc.name moveRightMergeBesideEqualTileNoChain3400
     * @tc.desc Verify a merged tile landing next to an equal tile is not merged again in the same sweep
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_mergeBesideEqualTileNoChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 4, 8, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_mergeBesideEqualTileNoChain', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 8, 8, 2]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3500
     * @tc.name moveRightSeparatedPairsFourTwoFour3500
     * @tc.desc Verify an inner two pair merges while a four pair split by it does not
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_separatedPairsFourTwoFour', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 2, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_separatedPairsFourTwoFour', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 4, 4, 4]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(firstCellOf(rule.dataNumbers, 2)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3600
     * @tc.name moveRightPairAfterLeadPair3600
     * @tc.desc Verify a two pair merges and the following four is shifted right without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairAfterLeadPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 4, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairAfterLeadPair', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 4, 4, 2]);
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3700
     * @tc.name moveRightPairBetweenSeparatedTwos3700
     * @tc.desc Verify a middle four pair merges while both outer twos stay separated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_pairBetweenSeparatedTwos', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 4, 2]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_pairBetweenSeparatedTwos', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 2, 8, 2]);
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[1]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3800
     * @tc.name moveRightAscendingChainUnchanged3800
     * @tc.desc Verify a fully packed ascending row without equal neighbours is untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_ascendingChainUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_ascendingChainUnchanged', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectBoard(rule, board);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_3900
     * @tc.name moveRightAlternatingChainUnchanged3900
     * @tc.desc Verify a packed alternating row with no equal neighbours is untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_alternatingChainUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_alternatingChainUnchanged', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectBoard(rule, board);
      expect(rule.dataNumbers[1]).assertEqual(4);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.score === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4000
     * @tc.name moveRightAllZeroRowUnchanged4000
     * @tc.desc Verify an empty row stays empty and scores nothing on a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_allZeroRowUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_allZeroRowUnchanged', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4100
     * @tc.name moveRightPackedRowWithHoleUnchanged4100
     * @tc.desc Verify a right packed row that already touches the edge is untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_packedRowWithHoleUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 2, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_packedRowWithHoleUnchanged', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectBoard(rule, board);
      expect(rule.dataNumbers[0]).assertEqual(0);
      expect(rule.dataNumbers[2]).assertEqual(2);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4200
     * @tc.name moveRightDescendingPackedRowUnchanged4200
     * @tc.desc Verify a packed row led by a zero is untouched by a right move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_descendingPackedRowUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_descendingPackedRowUnchanged', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectBoard(rule, board);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4300
     * @tc.name moveRightFirstRowIsolation4300
     * @tc.desc Verify moving the first row leaves the second row untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_firstRowIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 0, 4, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_firstRowIsolation', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [4, 0, 4, 0]);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(rule.dataNumbers[7]).assertEqual(0);
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4400
     * @tc.name moveRightLastRowIsolation4400
     * @tc.desc Verify moving the last row leaves the third row untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_lastRowIsolation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [8, 8, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_lastRowIsolation', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, SIDE - 1);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 0, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 0, 0, 0]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      BoardKit.expectScore(rule, 16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4500
     * @tc.name moveRightFourRowsIndividually4500
     * @tc.desc Verify four row moves produce one merged layout per row and a summed score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_fourRowsIndividually', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 4, 0, 4],
        [8, 8, 8, 0],
        [16, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_fourRowsIndividually', 'before ' + BoardKit.describe(board));
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 4]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 0, 0, 8]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 0, 8, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 0, 32]);
      BoardKit.expectScore(rule, 60);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(5);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(68);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4600
     * @tc.name moveRightScoreAccumulatesAcrossRows4600
     * @tc.desc Verify merge points from three separate row moves add up to one running score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_scoreAccumulatesAcrossRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [8, 8, 0, 0],
        [0, 0, 0, 0],
        [32, 32, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_scoreAccumulatesAcrossRows', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      expect(rule.score).assertEqual(4);
      rule.moveInRow(DIR_RIGHT, 1);
      expect(rule.score).assertEqual(20);
      rule.moveInRow(DIR_RIGHT, SIDE - 1);
      expect(rule.score).assertEqual(84);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 0, 64]);
      BoardKit.expectScore(rule, 84);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4700
     * @tc.name moveRightScoreStaysZeroWhenShifting4700
     * @tc.desc Verify a move that only shifts tiles without merging earns no score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_scoreStaysZeroWhenShifting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_scoreStaysZeroWhenShifting', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(rule.score).assertEqual(0);
      expect(rule.score === 0).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4800
     * @tc.name moveRightKeepsCellSum4800
     * @tc.desc Verify an uncompensated right move preserves the total value of the row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_keepsCellSum', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      BoardKit.log('moveRight_keepsCellSum', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectValues(BoardKit.rowOf(after, 0), [0, 4, 4, 8]);
      BoardKit.expectSumPreserved(before, after);
      expect(BoardKit.sum(after)).assertEqual(16);
      expect(BoardKit.sum(before)).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_4900
     * @tc.name moveRightOccupancyDropsByMergeCount4900
     * @tc.desc Verify two merges remove exactly two occupied cells from the row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_occupancyDropsByMergeCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      BoardKit.log('moveRight_occupancyDropsByMergeCount', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectValues(BoardKit.rowOf(after, 0), [0, 0, 4, 8]);
      BoardKit.expectOccupancy(before, after, 2, 0);
      expect(BoardKit.countNonZero(after)).assertEqual(2);
      BoardKit.expectScore(rule, 12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5000
     * @tc.name moveRightResultTilesArePowersOfTwo5000
     * @tc.desc Verify every surviving tile after a right move is still a power of two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_resultTilesArePowersOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 8, 8]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_resultTilesArePowersOfTwo', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 4, 16]);
      let legal: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== 0 && !BoardOracle.isPowerOfTwo(rule.dataNumbers[index])) {
          legal = false;
        }
      }
      expect(legal).assertTrue();
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5100
     * @tc.name moveRightResultIsRightPacked5100
     * @tc.desc Verify a right move leaves no empty cell between the tiles and the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_resultIsRightPacked', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_resultIsRightPacked', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      let packed: boolean = true;
      let seenZero: boolean = false;
      for (let column: number = SIDE - 1; column >= 0; column--) {
        let value: number = rule.dataNumbers[column];
        if (value === 0) {
          seenZero = true;
        } else if (seenZero) {
          packed = false;
        }
      }
      expect(packed).assertTrue();
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 4]);
      expect(rule.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5200
     * @tc.name moveRightEmptiesColumnZero5200
     * @tc.desc Verify a right move on every row leaves column zero completely empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_emptiesColumnZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.repeatedRow([2, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_emptiesColumnZero', 'before ' + BoardKit.describe(board));
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 0]);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, SIDE - 1), [4, 4, 4, 4]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(8);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5300
     * @tc.name moveRightSecondApplicationIsNoOp5300
     * @tc.desc Verify a second right move on an already compacted non-mergeable row changes nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_secondApplicationIsNoOp', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 0, 4]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_secondApplicationIsNoOp', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      let first: number[] = BoardKit.valuesOf(rule);
      expect(rule.score).assertEqual(0);
      rule.moveInRow(DIR_RIGHT, 0);
      let second: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectValues(second, first);
      BoardKit.expectValues(BoardKit.rowOf(second, 0), [0, 0, 2, 4]);
      expect(rule.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5400
     * @tc.name moveRightMatchesOracleOnSingleRow5400
     * @tc.desc Verify a right move on one populated row matches the independent oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_matchesOracleOnSingleRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 4, 8],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_matchesOracleOnSingleRow', 'before ' + BoardKit.describe(board));
      rule.moveInRow(DIR_RIGHT, 0);
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(board, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 4, 4, 8]);
      BoardKit.expectScore(rule, 4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5500
     * @tc.name moveRightMatchesOracleOnMixedBoard5500
     * @tc.desc Verify a mixed board matches the oracle row by row after four right moves
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_matchesOracleOnMixedBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 2, 0, 2],
        [4, 4, 8, 0],
        [0, 0, 0, 0],
        [16, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_matchesOracleOnMixedBoard', 'before ' + BoardKit.describe(board));
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(board, DIR_RIGHT));
      BoardKit.expectScore(rule, 44);
      expect(BoardOracle.mergeScore(board, DIR_RIGHT)).assertEqual(44);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5600
     * @tc.name moveRightMatchesOracleOnSparseBoard5600
     * @tc.desc Verify a sparse board with one tile per row matches the oracle after compaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_matchesOracleOnSparseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 0, 0, 0],
        [0, 0, 4, 0],
        [0, 8, 0, 0],
        [0, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_matchesOracleOnSparseBoard', 'before ' + BoardKit.describe(board));
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(board, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, SIDE - 1), [2, 4, 8, 16]);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      BoardKit.expectScore(rule, 0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5700
     * @tc.name moveRightMatchesOracleOnDenseBoard5700
     * @tc.desc Verify a fully occupied board with a single merge matches the oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_matchesOracleOnDenseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.horizontalPairBoard();
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_matchesOracleOnDenseBoard', 'before ' + BoardKit.describe(board));
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_RIGHT, row);
      }
      BoardKit.expectValues(rule.dataNumbers, BoardOracle.move(board, DIR_RIGHT));
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, SIDE - 1), [0, 16, 4, 2]);
      BoardKit.expectScore(rule, 16);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5800
     * @tc.name moveRightBlankBoardSpawnsNothing5800
     * @tc.desc Verify a whole board right move on an empty board spawns no tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_blankBoardSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let before: number[] = BoardKit.valuesOf(rule);
      BoardKit.log('moveRight_blankBoardSpawnsNothing', 'before ' + BoardKit.describe(before));
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectNoSpawn(before, after);
      BoardKit.expectAllZeros(after);
      BoardKit.expectScore(rule, 0);
      expect(rule.status).assertEqual(BEFORE_STATUS);
      expect(BoardKit.countNonZero(after)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_5900
     * @tc.name moveRightPackedBoardSpawnsNothing5900
     * @tc.desc Verify a whole board right move that cannot change the board spawns no tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_packedBoardSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.repeatedRow([0, 2, 4, 8]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      BoardKit.log('moveRight_packedBoardSpawnsNothing', 'before ' + BoardKit.describe(board));
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectNoSpawn(before, after);
      BoardKit.expectBoard(rule, board);
      BoardKit.expectScore(rule, 0);
      expect(rule.status).assertEqual(BEFORE_STATUS);
      expect(BoardKit.countNonZero(after)).assertEqual(12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6000
     * @tc.name moveRightChangedBoardSpawnsOneTile6000
     * @tc.desc Verify a changed whole board move adds exactly one tile worth two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_changedBoardSpawnsOneTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      BoardKit.log('moveRight_changedBoardSpawnsOneTile', 'before ' + BoardKit.describe(board));
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectChangedMove(before, after, DIR_RIGHT);
      let difference: number = BoardKit.singleDifference(expected, after);
      expect(difference === -1).assertFalse();
      expect(expected[difference]).assertEqual(0);
      expect(SPAWN_VALUES).assertContain(after[difference]);
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.countNonZero(after)).assertEqual(BoardKit.countNonZero(expected) + 1);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6100
     * @tc.name moveRightSpawnLandsOnOracleZero6100
     * @tc.desc Verify the spawned tile occupies a cell the oracle left empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_spawnLandsOnOracleZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 4, 4, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      BoardKit.log('moveRight_spawnLandsOnOracleZero', 'before ' + BoardKit.describe(board));
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectChangedMove(before, after, DIR_RIGHT);
      let difference: number = BoardKit.singleDifference(expected, after);
      expect(difference === -1).assertFalse();
      expect(BoardKit.zeroPositions(expected)).assertContain(difference);
      expect(after[difference] === 2 || after[difference] === 4).assertTrue();
      BoardKit.expectScore(rule, 12);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6200
     * @tc.name moveRightMultiRowSpawnKeepsOracle6200
     * @tc.desc Verify a four row change matches the oracle everywhere except one spawned cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_multiRowSpawnKeepsOracle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [8, 8, 0, 0],
        [16, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
      BoardKit.log('moveRight_multiRowSpawnKeepsOracle', 'before ' + BoardKit.describe(board));
      rule.move(DIR_RIGHT);
      let after: number[] = BoardKit.valuesOf(rule);
      BoardKit.expectChangedMove(before, after, DIR_RIGHT);
      BoardKit.expectScore(rule, 60);
      expect(BoardKit.countNonZero(after)).assertEqual(BoardKit.countNonZero(expected) + 1);
      expect(BoardKit.countNonZero(after)).assertEqual(5);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6300
     * @tc.name moveRightAddsToExistingScore6300
     * @tc.desc Verify a whole board right move adds merge points to a score already on the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_addsToExistingScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 8, 8],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.score = 100;
      BoardKit.log('moveRight_addsToExistingScore', 'before ' + BoardKit.describe(board));
      rule.move(DIR_RIGHT);
      BoardKit.expectScore(rule, 120);
      expect(BoardOracle.mergeScore(board, DIR_RIGHT)).assertEqual(20);
      BoardKit.expectChangedMove(board, rule.dataNumbers, DIR_RIGHT);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6400
     * @tc.name moveRightKeepsSixteenCells6400
     * @tc.desc Verify a whole board right move neither grows nor shrinks the board array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_keepsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 4, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_keepsSixteenCells', 'before ' + BoardKit.describe(board));
      rule.move(DIR_RIGHT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectChangedMove(board, rule.dataNumbers, DIR_RIGHT);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6500
     * @tc.name moveRightThreeMovesKeepSpawnContract6500
     * @tc.desc Verify three consecutive right moves each obey the unchanged-or-one-spawn contract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_threeMovesKeepSpawnContract', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      BoardKit.log('moveRight_threeMovesKeepSpawnContract', 'before ' + BoardKit.describe(board));
      for (let round: number = 0; round < 3; round++) {
        let before: number[] = BoardKit.valuesOf(rule);
        let expected: number[] = BoardOracle.move(before, DIR_RIGHT);
        rule.move(DIR_RIGHT);
        let after: number[] = BoardKit.valuesOf(rule);
        if (BoardKit.describe(expected) === BoardKit.describe(before)) {
          BoardKit.expectNoSpawn(before, after);
        } else {
          BoardKit.expectChangedMove(before, after, DIR_RIGHT);
        }
        expect(rule.dataNumbers.length).assertEqual(CELLS);
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6600
     * @tc.name moveRightMirrorsLeftOnSingleRow6600
     * @tc.desc Verify a right move equals the reverse of a left move on a mirrored single row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_mirrorsLeftOnSingleRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rightBoard: number[] = BoardKit.row([2, 2, 4, 8]);
      let rightRule: GameRule = BoardKit.rule(rightBoard);
      let leftBoard: number[] = BoardKit.row([8, 4, 2, 2]);
      let leftRule: GameRule = BoardKit.rule(leftBoard);
      BoardKit.log('moveRight_mirrorsLeftOnSingleRow', 'before ' + BoardKit.describe(rightBoard));
      rightRule.moveInRow(DIR_RIGHT, 0);
      leftRule.moveInRow(DIR_LEFT, 0);
      BoardKit.expectValues(BoardKit.rowOf(rightRule.dataNumbers, 0), [0, 4, 4, 8]);
      BoardKit.expectValues(BoardKit.rowOf(leftRule.dataNumbers, 0), [8, 4, 4, 0]);
      expect(rightRule.score).assertEqual(leftRule.score);
      expect(leftRule.dataNumbers[0]).assertEqual(rightRule.dataNumbers[3]);
      expect(leftRule.dataNumbers[1]).assertEqual(rightRule.dataNumbers[2]);
      expect(leftRule.dataNumbers[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVERIGHT_6700
     * @tc.name moveRightMirrorsLeftOnTwoRows6700
     * @tc.desc Verify mirrored boards keep the mirror relation for two rows and their total score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveRight_mirrorsLeftOnTwoRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rightBoard: number[] = BoardKit.rows([
        [2, 2, 8, 8],
        [4, 0, 4, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let leftBoard: number[] = BoardKit.rows([
        [8, 8, 2, 2],
        [0, 4, 0, 4],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rightRule: GameRule = BoardKit.rule(rightBoard);
      let leftRule: GameRule = BoardKit.rule(leftBoard);
      BoardKit.log('moveRight_mirrorsLeftOnTwoRows', 'before ' + BoardKit.describe(rightBoard));
      rightRule.moveInRow(DIR_RIGHT, 0);
      rightRule.moveInRow(DIR_RIGHT, 1);
      leftRule.moveInRow(DIR_LEFT, 0);
      leftRule.moveInRow(DIR_LEFT, 1);
      BoardKit.expectValues(BoardKit.rowOf(rightRule.dataNumbers, 0), [0, 0, 4, 16]);
      BoardKit.expectValues(BoardKit.rowOf(rightRule.dataNumbers, 1), [0, 0, 0, 8]);
      BoardKit.expectValues(BoardKit.rowOf(leftRule.dataNumbers, 0), [16, 4, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(leftRule.dataNumbers, 1), [8, 0, 0, 0]);
      expect(rightRule.score).assertEqual(leftRule.score);
      expect(rightRule.score).assertEqual(28);
      expect(leftRule.dataNumbers[0]).assertEqual(rightRule.dataNumbers[3]);
      expect(leftRule.dataNumbers[4]).assertEqual(rightRule.dataNumbers[7]);
      expect(leftRule.dataNumbers[5]).assertEqual(rightRule.dataNumbers[6]);
      expect(leftRule.dataNumbers[6] === 0).assertTrue();
    });

    afterAll(() => {
      BoardKit.log('gameRuleMoveRightTest', 'suite end');
    });
  });
}
