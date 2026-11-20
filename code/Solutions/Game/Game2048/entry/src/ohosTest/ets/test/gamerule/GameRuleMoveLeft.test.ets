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
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS, SIDE, DIR_LEFT } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** Row index of the first board line, used whenever a line move targets one row. */
const FIRST_LINE: number = 0;
/** Row index of the last board line. */
const LAST_LINE: number = SIDE - 1;

/**
 * GameRule 向左移动测试套件。
 *
 * 左移规则：先把非零块向列 0 压紧，再让相邻相等的两块合并，每格每个方向
 * 只参与一次合并。moveInRow('left', row) 只处理一行、不补新块，因此可以
 * 做整行精确断言；move('left') 在棋盘发生变化后必定补一块 2 或 4，故整盘
 * 断言交给 BoardKit.expectChangedMove，并与 BoardOracle 交叉验证。
 */
export default function gameRuleMoveLeftTest() {
  describe('gameRuleMoveLeftTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMoveLeftTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleMoveLeftTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0100
     * @tc.name moveLeftSingleTileAtColumnZero0100
     * @tc.desc Verify a tile standing in column zero is left in place by a left line move
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_singleTileAtColumnZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([16, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([16, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      expect(rule.dataNumbers[0]).assertEqual(16);
      BoardKit.logBoard('moveLeft_singleTileAtColumnZero', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0200
     * @tc.name moveLeftSingleTileFromColumnOne0200
     * @tc.desc Verify a lone tile in column one slides into column zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_singleTileFromColumnOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([2, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 0, 0);
      expect(BoardKit.zeroPositions(rule.dataNumbers).length).assertEqual(15);
      BoardKit.logBoard('moveLeft_singleTileFromColumnOne', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0300
     * @tc.name moveLeftSingleTileFromColumnTwo0300
     * @tc.desc Verify a lone tile in column two crosses one empty cell to column zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_singleTileFromColumnTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(String(rule.dataNumbers)).assertContain('4,0,0,0');
      BoardKit.logBoard('moveLeft_singleTileFromColumnTwo', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0400
     * @tc.name moveLeftSingleTileFromColumnThree0400
     * @tc.desc Verify a lone tile in the far column travels the full row width
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_singleTileFromColumnThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 0, 8]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([8, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(0);
      BoardKit.logBoard('moveLeft_singleTileFromColumnThree', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0500
     * @tc.name moveLeftAdjacentEqualPairAtEdge0500
     * @tc.desc Verify two equal tiles already at the left edge merge into their double
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_adjacentEqualPairAtEdge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 0, 0, 0]));
      BoardKit.expectScore(rule, 4);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 1, 0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 4).length).assertEqual(1);
      BoardKit.logBoard('moveLeft_adjacentEqualPairAtEdge', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0600
     * @tc.name moveLeftAdjacentUnequalPairShifts0600
     * @tc.desc Verify two different tiles compact towards the edge without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_adjacentUnequalPairShifts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([2, 4, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectSumPreserved(board, rule.dataNumbers);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[1]).assertEqual(4);
      BoardKit.logBoard('moveLeft_adjacentUnequalPairShifts', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0700
     * @tc.name moveLeftGapEqualPairMerges0700
     * @tc.desc Verify equal tiles separated by one empty cell compact before merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_gapEqualPairMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 0, 0, 0]));
      BoardKit.expectScore(rule, 4);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 1, 0);
      expect(rule.dataNumbers[2]).assertEqual(0);
      expect(String(rule.dataNumbers)).assertContain('4,0,0,0');
      BoardKit.logBoard('moveLeft_gapEqualPairMerges', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0800
     * @tc.name moveLeftPairAlreadyAtEdgeStays0800
     * @tc.desc Verify two unequal tiles flush with the left edge are not disturbed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_pairAlreadyAtEdgeStays', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 2, 0, 0]));
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(2);
      BoardKit.logBoard('moveLeft_pairAlreadyAtEdgeStays', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_0900
     * @tc.name moveLeftPairAtFarEdgeMerges0900
     * @tc.desc Verify an equal pair sitting at the far end merges after sliding two cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_pairAtFarEdgeMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 0, 0, 0]));
      BoardKit.expectScore(rule, 4);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 1, 0);
      expect(rule.dataNumbers[3]).assertEqual(0);
      BoardKit.logBoard('moveLeft_pairAtFarEdgeMerges', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1000
     * @tc.name moveLeftTriplePairAtHead1000
     * @tc.desc Verify only the leftmost equal pair of three tiles merges and the third shifts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_triplePairAtHead', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 2, 0, 0]));
      BoardKit.expectScore(rule, 4);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 1, 0);
      expect(String(rule.dataNumbers)).assertContain('4,2,0,0');
      BoardKit.logBoard('moveLeft_triplePairAtHead', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1100
     * @tc.name moveLeftTripleShiftOnly1100
     * @tc.desc Verify three distinct tiles compact with no merge and no chain reaction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_tripleShiftOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 4, 2]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([2, 4, 2, 0]));
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(rule.dataNumbers[3]).assertEqual(0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(8);
      BoardKit.logBoard('moveLeft_tripleShiftOnly', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1200
     * @tc.name moveLeftTriplePairThenTile1200
     * @tc.desc Verify a head pair merges and the trailing tile lands right behind it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_triplePairThenTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 4, 0, 0]));
      BoardKit.expectScore(rule, 4);
      expect(BoardKit.positionsOf(rule.dataNumbers, 4).length).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.logBoard('moveLeft_triplePairThenTile', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1300
     * @tc.name moveLeftTripleGapPairThenTile1300
     * @tc.desc Verify equal outer tiles merge across a gap and the inner tile follows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_tripleGapPairThenTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([8, 0, 8, 8]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([16, 8, 0, 0]));
      BoardKit.expectScore(rule, 16);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 1, 0);
      expect(BoardKit.positionsOf(rule.dataNumbers, 16).length).assertEqual(1);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.logBoard('moveLeft_tripleGapPairThenTile', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1400
     * @tc.name moveLeftTripleSecondPairMerges1400
     * @tc.desc Verify the first equal pair found after a leading odd tile is the one merged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_tripleSecondPairMerges', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 4, 4]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([2, 8, 4, 0]));
      BoardKit.expectScore(rule, 8);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(3);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(4);
      BoardKit.logBoard('moveLeft_tripleSecondPairMerges', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1500
     * @tc.name moveLeftNoChainAfterSeparator1500
     * @tc.desc Verify a merged pair does not merge again with an equal neighbour
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_noChainAfterSeparator', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 4, 0, 0]));
      BoardKit.expectScore(rule, 4);
      expect(rule.score === 8).assertFalse();
      BoardKit.expectOccupancy(board, rule.dataNumbers, 1, 0);
      BoardKit.logBoard('moveLeft_noChainAfterSeparator', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1600
     * @tc.name moveLeftFourEqualTiles1600
     * @tc.desc Verify a full row of four equal tiles becomes exactly two doubled tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_fourEqualTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 2, 2]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 4, 0, 0]));
      BoardKit.expectScore(rule, 8);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 2, 0);
      expect(String(rule.dataNumbers)).assertContain('4,4,0,0');
      BoardKit.logBoard('moveLeft_fourEqualTiles', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1700
     * @tc.name moveLeftTwoPairs1700
     * @tc.desc Verify two neighbouring pairs merge independently into four and eight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_twoPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 4, 4]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 8, 0, 0]));
      BoardKit.expectScore(rule, 12);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 2, 0);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.logBoard('moveLeft_twoPairs', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1800
     * @tc.name moveLeftCascadeNoChain1800
     * @tc.desc Verify a shifted tile that becomes equal to a merged tile is not merged again
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_cascadeNoChain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 4, 8]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([2, 8, 8, 0]));
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[1]).assertEqual(8);
      expect(rule.dataNumbers[2]).assertEqual(8);
      expect(rule.dataNumbers[3]).assertEqual(0);
      BoardKit.logBoard('moveLeft_cascadeNoChain', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_1900
     * @tc.name moveLeftFourTilesNoMerge1900
     * @tc.desc Verify a fully packed row without equal neighbours is already stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_fourTilesNoMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([2, 4, 8, 16]));
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(30);
      expect(rule.dataNumbers[3]).assertEqual(16);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 0, 0);
      BoardKit.logBoard('moveLeft_fourTilesNoMerge', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2000
     * @tc.name moveLeftAllZeroRow2000
     * @tc.desc Verify a left move over an empty board writes nothing and keeps the status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_allZeroRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectAllZeros(rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
      BoardKit.log('moveLeft_allZeroRow', 'empty board untouched');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2100
     * @tc.name moveLeftIsolationTargetFirstRow2100
     * @tc.desc Verify a left line move on row zero leaves the other three rows untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_isolationTargetFirstRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 4, 0, 0],
        [8, 0, 0, 0],
        [0, 0, 16, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, 0, [2, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 4, 0, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 0, 16, 0]);
      BoardKit.logBoard('moveLeft_isolationTargetFirstRow', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2200
     * @tc.name moveLeftIsolationTargetLastRow2200
     * @tc.desc Verify a left line move on row three leaves rows zero to two untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_isolationTargetLastRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 2, 0],
        [0, 0, 0, 4],
        [0, 8, 0, 0],
        [0, 0, 0, 64]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, LAST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, LAST_LINE, [64, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [0, 8, 0, 0]);
      BoardKit.logBoard('moveLeft_isolationTargetLastRow', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2300
     * @tc.name moveLeftIsolationScoreLimited2300
     * @tc.desc Verify only the target row contributes score even when another row can merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_isolationScoreLimited', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, 0, [4, 0, 0, 0]));
      BoardKit.expectScore(rule, 4);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [4, 4, 0, 0]);
      expect(rule.score === 12).assertFalse();
      BoardKit.logBoard('moveLeft_isolationScoreLimited', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2400
     * @tc.name moveLeftIsolationMiddleRow2400
     * @tc.desc Verify a left line move on row one changes that row alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_isolationMiddleRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 0, 8, 0],
        [0, 4, 0, 0],
        [2, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, 1);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, 1, [8, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 0, 2]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [2, 0, 0, 0]);
      BoardKit.logBoard('moveLeft_isolationMiddleRow', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2500
     * @tc.name moveLeftAllRowsMerge2500
     * @tc.desc Verify four line moves merge every row and the score sums all four merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_allRowsMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [8, 8, 0, 0],
        [16, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      let expected: number[] = BoardKit.rows([
        [4, 0, 0, 0],
        [8, 0, 0, 0],
        [16, 0, 0, 0],
        [32, 0, 0, 0]
      ]);
      BoardKit.expectFullBoard(rule, expected);
      BoardKit.expectScore(rule, 60);
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.logBoard('moveLeft_allRowsMerge', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2600
     * @tc.name moveLeftAllRowsShift2600
     * @tc.desc Verify four line moves compact every row without producing any merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_allRowsShift', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 0, 4, 0],
        [0, 8, 0, 0],
        [16, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      let expected: number[] = BoardKit.rows([
        [2, 0, 0, 0],
        [4, 0, 0, 0],
        [8, 0, 0, 0],
        [16, 0, 0, 0]
      ]);
      BoardKit.expectFullBoard(rule, expected);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 0, 0);
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.logBoard('moveLeft_allRowsShift', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2700
     * @tc.name moveLeftOracleAgreesMixed2700
     * @tc.desc Verify a mixed board matches the independent compact-then-merge oracle
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_oracleAgreesMixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 2, 2, 4],
        [8, 0, 8, 0],
        [0, 0, 0, 0],
        [4, 4, 4, 4]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      let expected: number[] = BoardKit.rows([
        [4, 4, 0, 0],
        [16, 0, 0, 0],
        [0, 0, 0, 0],
        [8, 8, 0, 0]
      ]);
      BoardKit.expectFullBoard(rule, expected);
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectScore(rule, BoardOracle.mergeScore(before, DIR_LEFT));
      expect(rule.score).assertEqual(36);
      BoardKit.logBoard('moveLeft_oracleAgreesMixed', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2800
     * @tc.name moveLeftDenseRowsNoChange2800
     * @tc.desc Verify four merge-free packed rows survive four line moves unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_denseRowsNoChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 4, 2, 4],
        [4, 2, 4, 2],
        [8, 16, 8, 16],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let unexplained: number | null = null;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== expected[index]) {
          unexplained = rule.dataNumbers[index];
        }
      }
      expect(unexplained).assertNull();
      BoardKit.expectScore(rule, 0);
      BoardKit.expectFullBoard(rule, board);
      BoardKit.logBoard('moveLeft_denseRowsNoChange', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_2900
     * @tc.name moveLeftScoreAddsToExisting2900
     * @tc.desc Verify a line merge adds to the running score instead of resetting it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_scoreAddsToExisting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 2, [8, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      rule.score = 100;
      rule.moveInRow(DIR_LEFT, 2);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(BoardKit.blank(), 2, [16, 0, 0, 0]));
      BoardKit.expectScore(rule, 116);
      expect(rule.dataNumbers[8]).assertEqual(16);
      BoardKit.logBoard('moveLeft_scoreAddsToExisting', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3000
     * @tc.name moveLeftScoreAcrossTwoLines3000
     * @tc.desc Verify two successive line merges accumulate their scores on one rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_scoreAcrossTwoLines', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [4, 4, 0, 0],
        [32, 32, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, 0);
      rule.moveInRow(DIR_LEFT, 1);
      let expected: number[] = BoardKit.rows([
        [8, 0, 0, 0],
        [64, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      BoardKit.expectFullBoard(rule, expected);
      BoardKit.expectScore(rule, 72);
      expect(rule.dataNumbers[4]).assertEqual(64);
      BoardKit.logBoard('moveLeft_scoreAcrossTwoLines', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3100
     * @tc.name moveLeftSumKeptOnMerge3100
     * @tc.desc Verify a merge keeps the tile sum and reports exactly the doubled value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_sumKeptOnMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), LAST_LINE, [64, 64, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, LAST_LINE);
      BoardKit.expectSumPreserved(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 128);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 1, 0);
      expect(rule.dataNumbers[12]).assertEqual(128);
      BoardKit.logBoard('moveLeft_sumKeptOnMerge', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3200
     * @tc.name moveLeftOccupancyAfterShift3200
     * @tc.desc Verify a merge-free shift keeps the occupied cell count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_occupancyAfterShift', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 4, 8]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.row([4, 8, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 0, 0);
      BoardKit.expectSumPreserved(before, rule.dataNumbers);
      BoardKit.logBoard('moveLeft_occupancyAfterShift', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3300
     * @tc.name moveLeftFourRowsBoardString3300
     * @tc.desc Verify a mixed four-row board ends with each merged value at its row head
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_fourRowsBoardString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 0, 0, 2],
        [0, 4, 4, 0],
        [16, 0, 0, 0],
        [0, 0, 32, 32]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      let expected: number[] = BoardKit.rows([
        [4, 0, 0, 0],
        [8, 0, 0, 0],
        [16, 0, 0, 0],
        [64, 0, 0, 0]
      ]);
      BoardKit.expectFullBoard(rule, expected);
      BoardKit.expectScore(rule, 76);
      BoardKit.expectMoveWithoutSpawn(before, rule.dataNumbers, DIR_LEFT);
      expect(String(rule.dataNumbers)).assertContain('64,0,0,0');
      BoardKit.logBoard('moveLeft_fourRowsBoardString', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3400
     * @tc.name moveLeftBoardMoveSpawnsOne3400
     * @tc.desc Verify a whole-board left move that shifts a tile spawns exactly one new tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_boardMoveSpawnsOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 1, [0, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 0, 1);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.logBoard('moveLeft_boardMoveSpawnsOne', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3500
     * @tc.name moveLeftBoardMoveUnchangedNoSpawn3500
     * @tc.desc Verify a whole-board left move on a stable board spawns nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_boardMoveUnchangedNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 2, [4, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      expect(rule.dataNumbers[8]).assertEqual(4);
      BoardKit.logBoard('moveLeft_boardMoveUnchangedNoSpawn', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3600
     * @tc.name moveLeftBoardMoveMergeScores3600
     * @tc.desc Verify a whole-board move scores the merge only and spawns one tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_boardMoveMergeScores', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 1, [2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectScore(rule, 4);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 1, 1);
      expect(rule.dataNumbers[4]).assertEqual(4);
      BoardKit.logBoard('moveLeft_boardMoveMergeScores', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3700
     * @tc.name moveLeftBoardMoveCompactedNoSpawn3700
     * @tc.desc Verify a whole-board move on four packed merge-free rows spawns nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_boardMoveCompactedNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.repeatedRow([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(CELLS);
      BoardKit.expectSumPreserved(before, rule.dataNumbers);
      BoardKit.logBoard('moveLeft_boardMoveCompactedNoSpawn', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3800
     * @tc.name moveLeftSpawnLandsOnEmptyCell3800
     * @tc.desc Verify the single spawned cell was empty in the oracle result and holds 2 or 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_spawnLandsOnEmptyCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 2, [0, 0, 0, 8]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      rule.move(DIR_LEFT);
      let differenceCount: number = 0;
      let differenceIndex: number = -1;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== expected[index]) {
          differenceCount = differenceCount + 1;
          differenceIndex = index;
        }
      }
      expect(differenceCount).assertEqual(1);
      expect(expected[differenceIndex]).assertEqual(0);
      let spawned: number = rule.dataNumbers[differenceIndex];
      expect(spawned === 2 || spawned === 4).assertTrue();
      BoardKit.logBoard('moveLeft_spawnLandsOnEmptyCell', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_3900
     * @tc.name moveLeftFourRowsSpawnOne3900
     * @tc.desc Verify four shifted rows produce one spawn so occupancy grows by one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_fourRowsSpawnOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 0, 0, 4],
        [0, 0, 0, 8],
        [0, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectOccupancy(before, rule.dataNumbers, 0, 1);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[4]).assertEqual(4);
      expect(rule.dataNumbers[8]).assertEqual(8);
      expect(rule.dataNumbers[12]).assertEqual(16);
      BoardKit.logBoard('moveLeft_fourRowsSpawnOne', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_4000
     * @tc.name moveLeftFourRowsMergeScore4000
     * @tc.desc Verify four simultaneous row merges add their four doubled values to score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_fourRowsMergeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [8, 8, 0, 0],
        [16, 16, 0, 0],
        [32, 32, 0, 0],
        [64, 64, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectScore(rule, 240);
      expect(rule.dataNumbers[0]).assertEqual(16);
      expect(rule.dataNumbers[12]).assertEqual(128);
      BoardKit.logBoard('moveLeft_fourRowsMergeScore', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_4100
     * @tc.name moveLeftOverBoardNoSpawn4100
     * @tc.desc Verify a whole-board move on a locked board changes nothing and keeps status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_overBoardNoSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectNoSpawn(before, rule.dataNumbers);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      expect(rule.isGameOver()).assertTrue();
      BoardKit.logBoard('moveLeft_overBoardNoSpawn', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_4200
     * @tc.name moveLeftStatusStaysBefore4200
     * @tc.desc Verify a changed move on a board that is not locked leaves the status before
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_statusStaysBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), LAST_LINE, [8, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectScore(rule, 16);
      BoardKit.expectStatus(rule, GameStatus.BEFORE);
      expect(rule.isGameOver()).assertFalse();
      BoardKit.logBoard('moveLeft_statusStaysBefore', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_4300
     * @tc.name moveLeftBoardLengthStable4300
     * @tc.desc Verify a spawning move never appends a seventeenth cell to the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_boardLengthStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 2, [0, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectOccupancy(before, rule.dataNumbers, 0, 1);
      BoardKit.logBoard('moveLeft_boardLengthStable', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_4400
     * @tc.name moveLeftSpawnAddsSumOnly4400
     * @tc.desc Verify a changed move raises the tile sum by the spawned value alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_spawnAddsSumOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([16, 16, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectScore(rule, 32);
      expect(rule.dataNumbers[0]).assertEqual(32);
      let delta: number = BoardKit.sum(rule.dataNumbers) - BoardKit.sum(before);
      expect(delta === 2 || delta === 4).assertTrue();
      BoardKit.logBoard('moveLeft_spawnAddsSumOnly', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVELEFT_4500
     * @tc.name moveLeftTileSetAfterSpawn4500
     * @tc.desc Verify every cell after a spawning merge is empty, a merge result, or a spawn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveLeft_tileSetAfterSpawn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.withRow(BoardKit.blank(), 1, [32, 32, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.move(DIR_LEFT);
      BoardKit.expectChangedMove(before, rule.dataNumbers, DIR_LEFT);
      BoardKit.expectScore(rule, 64);
      BoardKit.expectTileSet(rule.dataNumbers, [0, 2, 4, 64]);
      expect(rule.dataNumbers[4]).assertEqual(64);
      BoardKit.logBoard('moveLeft_tileSetAfterSpawn', rule.dataNumbers);
    });
  });
}
