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
import { BoardKit, CELLS, SIDE, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** Sentinel returned when no further tile exists. */
const NOT_FOUND: number = -1;

/** Row index of the first board line. */
const FIRST_LINE: number = 0;
/** Row index of the last board line. */
const LAST_LINE: number = SIDE - 1;
/** Column index of the first board column. */
const FIRST_COLUMN: number = 0;
/** Column index of the last board column. */
const LAST_COLUMN: number = SIDE - 1;

/**
 * GameRule.moveInRow 分发语义测试套件。
 *
 * moveInRow(direction, a) 只处理一条线：left/right 的 a 是行号，up/down 的
 * a 是列号。它不补新块、不改变棋盘长度、不改动 status，未知方向字面量则
 * 整条线完全不处理。本套件只固化“分派到哪条线”这一层语义，具体合并结果
 * 由 GameRuleMoveLeft 套件负责。
 */
export default function gameRuleMoveInRowTest() {
  describe('gameRuleMoveInRowTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleMoveInRowTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleMoveInRowTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0100
     * @tc.name moveInRowLeftTargetsRowZero0100
     * @tc.desc Verify the first argument of a left line move is the row index starting at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_leftTargetsRowZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 32],
        [0, 0, 0, 64],
        [0, 0, 128, 0],
        [256, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, FIRST_LINE, [32, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectOccupancy(board, rule.dataNumbers, 0, 0);
      BoardKit.logBoard('moveInRow_leftTargetsRowZero', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0200
     * @tc.name moveInRowLeftTargetsRowOne0200
     * @tc.desc Verify a left line move with index one shifts row one and no other row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_leftTargetsRowOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 64, 0, 0],
        [0, 0, 0, 8],
        [0, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, 1);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, 1, [64, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      expect(String(rule.dataNumbers)).assertContain('64,0,0,0');
      BoardKit.logBoard('moveInRow_leftTargetsRowOne', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0300
     * @tc.name moveInRowLeftTargetsRowTwo0300
     * @tc.desc Verify a left line move with index two shifts row two and no other row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_leftTargetsRowTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 2, 0],
        [8, 0, 0, 0],
        [0, 0, 0, 4],
        [0, 32, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, 2);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, 2, [4, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 0), [0, 0, 2, 0]);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 3), [0, 32, 0, 0]);
      BoardKit.logBoard('moveInRow_leftTargetsRowTwo', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0400
     * @tc.name moveInRowLeftTargetsLastRow0400
     * @tc.desc Verify a left line move with the last row index merges inside that row only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_leftTargetsLastRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 4, 0, 0],
        [8, 0, 0, 0],
        [4, 4, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, LAST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, LAST_LINE, [8, 0, 0, 0]));
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[12]).assertEqual(8);
      expect(rule.dataNumbers[13]).assertEqual(0);
      BoardKit.logBoard('moveInRow_leftTargetsLastRow', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0500
     * @tc.name moveInRowRightTargetsRowZero0500
     * @tc.desc Verify the first argument of a right line move is the row index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_rightTargetsRowZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [4, 0, 0, 0],
        [0, 0, 0, 2],
        [0, 0, 8, 0],
        [0, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_RIGHT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, FIRST_LINE, [0, 0, 0, 4]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[3]).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(0);
      BoardKit.logBoard('moveInRow_rightTargetsRowZero', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0600
     * @tc.name moveInRowRightTargetsRowOne0600
     * @tc.desc Verify a right line move with index one shifts row one only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_rightTargetsRowOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 2, 0, 0],
        [16, 0, 0, 0],
        [0, 0, 64, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_RIGHT, 1);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, 1, [0, 0, 0, 2]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [16, 0, 0, 0]);
      BoardKit.logBoard('moveInRow_rightTargetsRowOne', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0700
     * @tc.name moveInRowRightTargetsRowTwo0700
     * @tc.desc Verify a right line move with index two works on a mid board row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_rightTargetsRowTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [8, 0, 0, 0],
        [0, 0, 4, 0],
        [2, 0, 0, 0],
        [0, 32, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_RIGHT, 2);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, 2, [0, 0, 0, 2]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[11]).assertEqual(2);
      expect(rule.dataNumbers[8]).assertEqual(0);
      BoardKit.logBoard('moveInRow_rightTargetsRowTwo', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0800
     * @tc.name moveInRowRightTargetsLastRow0800
     * @tc.desc Verify a right line move on the last row merges at the right edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_rightTargetsLastRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 0, 0, 0],
        [0, 4, 0, 0],
        [0, 0, 8, 0],
        [0, 0, 4, 4]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_RIGHT, LAST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, LAST_LINE, [0, 0, 0, 8]));
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[15]).assertEqual(8);
      BoardKit.logBoard('moveInRow_rightTargetsLastRow', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_0900
     * @tc.name moveInRowUpTargetsColumnZero0900
     * @tc.desc Verify the first argument of an up line move is the column index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_upTargetsColumnZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [4, 0, 0, 0],
        [0, 0, 16, 0],
        [0, 32, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, FIRST_COLUMN);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, FIRST_COLUMN, [4, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(0);
      BoardKit.logBoard('moveInRow_upTargetsColumnZero', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1000
     * @tc.name moveInRowUpTargetsColumnOne1000
     * @tc.desc Verify an up line move with index one compacts column one only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_upTargetsColumnOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 0, 8, 0],
        [0, 4, 0, 0],
        [0, 0, 0, 32]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, 1);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, 1, [4, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 2), [0, 8, 0, 0]);
      BoardKit.logBoard('moveInRow_upTargetsColumnOne', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1100
     * @tc.name moveInRowUpTargetsColumnTwo1100
     * @tc.desc Verify an up line move with index two compacts column two only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_upTargetsColumnTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [8, 0, 0, 0],
        [0, 0, 4, 0],
        [0, 0, 0, 2],
        [0, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, 2);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, 2, [4, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[2]).assertEqual(4);
      expect(rule.dataNumbers[6]).assertEqual(0);
      BoardKit.logBoard('moveInRow_upTargetsColumnTwo', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1200
     * @tc.name moveInRowUpTargetsLastColumn1200
     * @tc.desc Verify an up line move on the last column merges at the top edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_upTargetsLastColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 4],
        [0, 0, 0, 4],
        [0, 8, 0, 0],
        [0, 0, 16, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, LAST_COLUMN);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, LAST_COLUMN, [8, 0, 0, 0]));
      BoardKit.expectScore(rule, 8);
      expect(rule.dataNumbers[3]).assertEqual(8);
      expect(rule.dataNumbers[7]).assertEqual(0);
      BoardKit.logBoard('moveInRow_upTargetsLastColumn', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1300
     * @tc.name moveInRowDownTargetsColumnZero1300
     * @tc.desc Verify the first argument of a down line move is the column index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_downTargetsColumnZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [4, 0, 0, 0],
        [0, 0, 0, 2],
        [0, 0, 8, 0],
        [0, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_DOWN, FIRST_COLUMN);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, FIRST_COLUMN, [0, 0, 0, 4]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[12]).assertEqual(4);
      expect(rule.dataNumbers[0]).assertEqual(0);
      BoardKit.logBoard('moveInRow_downTargetsColumnZero', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1400
     * @tc.name moveInRowDownTargetsColumnOne1400
     * @tc.desc Verify a down line move with index one compacts column one only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_downTargetsColumnOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 4, 0, 0],
        [0, 0, 0, 2],
        [0, 0, 16, 0],
        [0, 0, 0, 8]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, 1, [0, 0, 0, 4]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 0), [0, 0, 0, 0]);
      BoardKit.logBoard('moveInRow_downTargetsColumnOne', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1500
     * @tc.name moveInRowDownTargetsColumnTwo1500
     * @tc.desc Verify a down line move with index two compacts column two only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_downTargetsColumnTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 2, 0],
        [8, 0, 0, 0],
        [0, 0, 0, 4],
        [0, 32, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_DOWN, 2);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, 2, [0, 0, 0, 2]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[14]).assertEqual(2);
      expect(rule.dataNumbers[2]).assertEqual(0);
      BoardKit.logBoard('moveInRow_downTargetsColumnTwo', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1600
     * @tc.name moveInRowDownTargetsLastColumn1600
     * @tc.desc Verify a down line move on the last column merges at the bottom edge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_downTargetsLastColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 8],
        [0, 4, 0, 0],
        [0, 0, 0, 8],
        [0, 0, 32, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_DOWN, LAST_COLUMN);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, LAST_COLUMN, [0, 0, 0, 16]));
      BoardKit.expectScore(rule, 16);
      BoardKit.expectSumPreserved(before, rule.dataNumbers);
      expect(rule.dataNumbers[15]).assertEqual(16);
      BoardKit.logBoard('moveInRow_downTargetsLastColumn', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1700
     * @tc.name moveInRowLeftIgnoresOtherMergeableRows1700
     * @tc.desc Verify a left line move never merges equal pairs held by the other rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_leftIgnoresOtherMergeableRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [8, 8, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, FIRST_LINE, [2, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 2), [4, 4, 0, 0]);
      BoardKit.logBoard('moveInRow_leftIgnoresOtherMergeableRows', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1800
     * @tc.name moveInRowUpIgnoresOtherMergeableColumns1800
     * @tc.desc Verify an up line move on an empty column leaves mergeable other columns intact
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_upIgnoresOtherMergeableColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 2, 4, 8],
        [0, 2, 4, 8],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, FIRST_COLUMN);
      BoardKit.expectFullBoard(rule, board);
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.columnOf(rule.dataNumbers, 3), [8, 8, 0, 0]);
      BoardKit.logBoard('moveInRow_upIgnoresOtherMergeableColumns', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_1900
     * @tc.name moveInRowRightIgnoresOtherMergeableRows1900
     * @tc.desc Verify a right line move touches only its row even when others hold pairs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_rightIgnoresOtherMergeableRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 0, 0, 0],
        [0, 2, 2, 0],
        [0, 4, 4, 0],
        [0, 8, 8, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_RIGHT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, FIRST_LINE, [0, 0, 0, 2]));
      BoardKit.expectScore(rule, 0);
      BoardKit.expectValues(BoardKit.rowOf(rule.dataNumbers, 1), [0, 2, 2, 0]);
      BoardKit.logBoard('moveInRow_rightIgnoresOtherMergeableRows', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2000
     * @tc.name moveInRowDownIgnoresOtherColumns2000
     * @tc.desc Verify a down line move with a column index never processes the first column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_downIgnoresOtherColumns', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 4, 8, 16],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_DOWN, 1);
      BoardKit.expectFullBoard(rule, BoardKit.withColumn(board, 1, [0, 0, 0, 4]));
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers[0]).assertEqual(2);
      expect(rule.dataNumbers[13]).assertEqual(4);
      BoardKit.logBoard('moveInRow_downIgnoresOtherColumns', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2100
     * @tc.name moveInRowUnknownDirectionDiagonal2100
     * @tc.desc Verify the literal diagonal is rejected so a mergeable row stays untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_unknownDirectionDiagonal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 4, 4],
        [8, 0, 0, 8],
        [0, 16, 16, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow('diagonal', FIRST_LINE);
      BoardKit.expectFullBoard(rule, board);
      BoardKit.expectScore(rule, 0);
      expect(rule.score !== 0).assertFalse();
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      BoardKit.logBoard('moveInRow_unknownDirectionDiagonal', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2200
     * @tc.name moveInRowUnknownDirectionUppercase2200
     * @tc.desc Verify the direction literal is case sensitive so LEFT does not move anything
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_unknownDirectionUppercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 4, 4, 0],
        [8, 0, 8, 0],
        [0, 0, 0, 2]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow('LEFT', 1);
      BoardKit.expectFullBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      BoardKit.logBoard('moveInRow_unknownDirectionUppercase', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2300
     * @tc.name moveInRowEmptyDirection2300
     * @tc.desc Verify an empty direction literal leaves both the board and the score alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_emptyDirection', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 0, 0, 2],
        [0, 8, 0, 8],
        [4, 0, 4, 0],
        [0, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.score = 77;
      rule.moveInRow('', FIRST_LINE);
      BoardKit.expectFullBoard(rule, board);
      BoardKit.expectScore(rule, 77);
      expect(rule.status).assertEqual(GameStatus.BEFORE);
      BoardKit.logBoard('moveInRow_emptyDirection', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2400
     * @tc.name moveInRowTwoRowsIndependent2400
     * @tc.desc Verify two line moves on different rows both survive and their scores add up
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_twoRowsIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [8, 8, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      rule.moveInRow(DIR_LEFT, 1);
      let expected: number[] = BoardKit.rows([
        [4, 0, 0, 0],
        [16, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      BoardKit.expectFullBoard(rule, expected);
      BoardKit.expectScore(rule, 20);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[4]).assertEqual(16);
      BoardKit.logBoard('moveInRow_twoRowsIndependent', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2500
     * @tc.name moveInRowLeftRepeatedIsStable2500
     * @tc.desc Verify a second left line move on the same row changes neither board nor score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_leftRepeatedIsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 4, 4],
        [0, 2, 0, 0],
        [16, 0, 0, 0],
        [0, 0, 0, 8]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      let afterFirst: number[] = BoardKit.valuesOf(rule);
      let scoreAfterFirst: number = rule.score;
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectFullBoard(rule, afterFirst);
      expect(rule.score).assertEqual(scoreAfterFirst);
      expect(afterFirst[0]).assertEqual(8);
      expect(rule.score === 8).assertTrue();
      BoardKit.logBoard('moveInRow_leftRepeatedIsStable', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2600
     * @tc.name moveInRowUpRepeatedIsStable2600
     * @tc.desc Verify a second up line move on the same column changes neither board nor score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_upRepeatedIsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [16, 0, 0, 0],
        [16, 0, 0, 0],
        [0, 8, 0, 0],
        [0, 0, 4, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.moveInRow(DIR_UP, FIRST_COLUMN);
      let afterFirst: number[] = BoardKit.valuesOf(rule);
      let scoreAfterFirst: number = rule.score;
      rule.moveInRow(DIR_UP, FIRST_COLUMN);
      BoardKit.expectFullBoard(rule, afterFirst);
      expect(rule.score).assertEqual(scoreAfterFirst);
      expect(afterFirst[0]).assertEqual(32);
      BoardKit.logBoard('moveInRow_upRepeatedIsStable', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2700
     * @tc.name moveInRowReturnsVoidThenBoardReadable2700
     * @tc.desc Verify a line move returns nothing yet leaves the board readable right after
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_returnsVoidThenBoardReadable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 4, 0, 0],
        [0, 0, 0, 8],
        [2, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveInRow(DIR_LEFT, FIRST_LINE)).assertUndefined();
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(0);
      BoardKit.expectFullBoard(rule, BoardKit.withRow(board, FIRST_LINE, [4, 0, 0, 0]));
      BoardKit.expectScore(rule, 0);
      BoardKit.logBoard('moveInRow_returnsVoidThenBoardReadable', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2800
     * @tc.name moveInRowLineMoveSpawnsNothing2800
     * @tc.desc Verify a line move adds no tile so the occupied count and board length hold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_lineMoveSpawnsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 2],
        [0, 0, 4, 0],
        [8, 0, 0, 0],
        [0, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      rule.moveInRow(DIR_LEFT, 2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(4);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectOccupancy(before, rule.dataNumbers, 0, 0);
      BoardKit.expectSumPreserved(before, rule.dataNumbers);
      BoardKit.logBoard('moveInRow_lineMoveSpawnsNothing', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_2900
     * @tc.name moveInRowKeepsRunningStatus2900
     * @tc.desc Verify a merging line move never rewrites a running status
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_keepsRunningStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      rule.status = GameStatus.RUNNING;
      rule.moveInRow(DIR_LEFT, FIRST_LINE);
      BoardKit.expectStatus(rule, GameStatus.RUNNING);
      expect(rule.status === GameStatus.BEFORE).assertFalse();
      BoardKit.expectScore(rule, 4);
      expect(rule.dataNumbers[0]).assertEqual(4);
      BoardKit.logBoard('moveInRow_keepsRunningStatus', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEMOVEINROW_3000
     * @tc.name moveInRowFourLinesKeepShape3000
     * @tc.desc Verify four line moves keep sixteen numeric cells and match the oracle board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveInRow_fourLinesKeepShape', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 2, 0, 0],
        [4, 0, 0, 0],
        [0, 0, 8, 0],
        [0, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      for (let row: number = 0; row < SIDE; row++) {
        rule.moveInRow(DIR_LEFT, row);
      }
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      let numeric: boolean = true;
      for (let index: number = 0; index < CELLS; index++) {
        if (typeof rule.dataNumbers[index] !== 'number') {
          numeric = false;
        }
      }
      expect(numeric).assertTrue();
      BoardKit.expectScore(rule, 0);
      let expected: number[] = BoardOracle.move(before, DIR_LEFT);
      let unexplained: number | null = null;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== expected[index]) {
          unexplained = rule.dataNumbers[index];
        }
      }
      expect(unexplained).assertNull();
      BoardKit.logBoard('moveInRow_fourLinesKeepShape', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0100
     * @tc.name moveNextLeftAdjacentTile0100
     * @tc.desc Verify a left probe returns the neighbouring column when that cell is occupied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftAdjacentTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 0, DIR_LEFT)).assertEqual(1);
      expect(rule.moveNext(FIRST_LINE, 1, DIR_LEFT)).assertEqual(NOT_FOUND);
      BoardKit.log('moveNext_leftAdjacentTile', 'probe results 1 and -1');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0200
     * @tc.name moveNextLeftSkipsOneZero0200
     * @tc.desc Verify a left probe walks over one empty cell before reporting a column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftSkipsOneZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, 0, DIR_LEFT);
      expect(found).assertEqual(2);
      expect(rule.dataNumbers[found]).assertEqual(4);
      BoardKit.log('moveNext_leftSkipsOneZero', 'column two holds the next tile');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0300
     * @tc.name moveNextLeftSkipsTwoZeros0300
     * @tc.desc Verify a left probe crosses a two cell run of empties and stops at the wall
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftSkipsTwoZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 0, 8]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, 0, DIR_LEFT);
      expect(found).assertEqual(LAST_COLUMN);
      expect(rule.dataNumbers[3]).assertEqual(8);
      BoardKit.log('moveNext_leftSkipsTwoZeros', 'last column reached');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0400
     * @tc.name moveNextLeftAtLastColumn0400
     * @tc.desc Verify a left probe starting in the last column has nothing to scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftAtLastColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, LAST_COLUMN, DIR_LEFT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(FIRST_LINE, 2, DIR_LEFT)).assertEqual(LAST_COLUMN);
      BoardKit.log('moveNext_leftAtLastColumn', 'boundary probe returns -1');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0500
     * @tc.name moveNextLeftFromColumnTwo0500
     * @tc.desc Verify a left probe from column two reports the occupied last column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftFromColumnTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 4, 8]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 2, DIR_LEFT)).assertEqual(3);
      expect(rule.moveNext(FIRST_LINE, 1, DIR_LEFT)).assertEqual(2);
      BoardKit.log('moveNext_leftFromColumnTwo', 'both probes skip the empty column');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0600
     * @tc.name moveNextLeftEmptyRow0600
     * @tc.desc Verify a left probe over an empty board always reports no tile
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftEmptyRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 8]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 0, DIR_LEFT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(FIRST_LINE, 2, DIR_LEFT)).assertEqual(NOT_FOUND);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(1);
      BoardKit.log('moveNext_leftEmptyRow', 'top row has no next tile');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0700
     * @tc.name moveNextLeftReadsOnlyItsRow0700
     * @tc.desc Verify a left probe never sees a tile that lives in another row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftReadsOnlyItsRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 0, 0, 2],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 1, DIR_LEFT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(1, 1, DIR_LEFT)).assertEqual(LAST_COLUMN);
      BoardKit.log('moveNext_leftReadsOnlyItsRow', 'row one owns the only tile');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0800
     * @tc.name moveNextLeftReturnsNearestTile0800
     * @tc.desc Verify a left probe stops at the nearest tile instead of a farther one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftReturnsNearestTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, 0, DIR_LEFT);
      expect(found).assertEqual(1);
      expect(rule.dataNumbers[found]).assertEqual(2);
      BoardKit.log('moveNext_leftReturnsNearestTile', 'nearest tile wins over the far one');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_0900
     * @tc.name moveNextLeftReturnsColumnNotOffset0900
     * @tc.desc Verify the returned number is a column index and not a flattened cell index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftReturnsColumnNotOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 2],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(2, 0, DIR_LEFT);
      expect(found).assertEqual(3);
      expect(found !== 11).assertTrue();
      expect(rule.dataNumbers[2 * SIDE + found]).assertEqual(2);
      BoardKit.log('moveNext_leftReturnsColumnNotOffset', 'column three reported for cell eleven');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1000
     * @tc.name moveNextLeftIgnoresLeftSide1000
     * @tc.desc Verify a left probe never looks at columns before its starting column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_leftIgnoresLeftSide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([16, 32, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 2, DIR_LEFT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(FIRST_LINE, 0, DIR_LEFT)).assertEqual(1);
      expect(rule.dataNumbers[1]).assertEqual(32);
      BoardKit.log('moveNext_leftIgnoresLeftSide', 'tiles on the near side are invisible');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1100
     * @tc.name moveNextRightAdjacentTile1100
     * @tc.desc Verify a right probe returns the neighbouring column when that cell is occupied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_rightAdjacentTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 3, DIR_RIGHT)).assertEqual(2);
      expect(rule.moveNext(FIRST_LINE, 2, DIR_RIGHT)).assertEqual(1);
      BoardKit.log('moveNext_rightAdjacentTile', 'adjacent columns reported');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1200
     * @tc.name moveNextRightSkipsOneZero1200
     * @tc.desc Verify a right probe walks over one empty cell before reporting a column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_rightSkipsOneZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 4, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, LAST_COLUMN, DIR_RIGHT);
      expect(found).assertEqual(1);
      expect(rule.dataNumbers[found]).assertEqual(4);
      BoardKit.log('moveNext_rightSkipsOneZero', 'column one reported');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1300
     * @tc.name moveNextRightSkipsTwoZeros1300
     * @tc.desc Verify a right probe crosses a two cell run of empties and reaches column zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_rightSkipsTwoZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([8, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, LAST_COLUMN, DIR_RIGHT)).assertEqual(FIRST_COLUMN);
      expect(rule.dataNumbers[0]).assertEqual(8);
      BoardKit.log('moveNext_rightSkipsTwoZeros', 'column zero reached');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1400
     * @tc.name moveNextRightAtFirstColumn1400
     * @tc.desc Verify a right probe starting in column zero has nothing to scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_rightAtFirstColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_RIGHT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(FIRST_LINE, 1, DIR_RIGHT)).assertEqual(FIRST_COLUMN);
      BoardKit.log('moveNext_rightAtFirstColumn', 'boundary probe returns -1');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1500
     * @tc.name moveNextRightFromColumnOne1500
     * @tc.desc Verify a right probe from column one reports the occupied column zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_rightFromColumnOne', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([4, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 1, DIR_RIGHT)).assertEqual(FIRST_COLUMN);
      expect(rule.dataNumbers[0]).assertEqual(4);
      BoardKit.log('moveNext_rightFromColumnOne', 'column zero reported');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1600
     * @tc.name moveNextRightIgnoresRightSide1600
     * @tc.desc Verify a right probe never looks at columns after its starting column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_rightIgnoresRightSide', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 8, 4]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 2, DIR_RIGHT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(FIRST_LINE, 3, DIR_RIGHT)).assertEqual(2);
      BoardKit.log('moveNext_rightIgnoresRightSide', 'tiles on the far side are invisible');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1700
     * @tc.name moveNextRightReadsOnlyItsRow1700
     * @tc.desc Verify a right probe never sees a tile that lives in another row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_rightReadsOnlyItsRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 2, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, LAST_COLUMN, DIR_RIGHT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(1, LAST_COLUMN, DIR_RIGHT)).assertEqual(1);
      BoardKit.log('moveNext_rightReadsOnlyItsRow', 'row one owns the only tile');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1800
     * @tc.name moveNextUpAdjacentTile1800
     * @tc.desc Verify an up probe returns the neighbouring row when that cell is occupied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_upAdjacentTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_UP)).assertEqual(1);
      expect(rule.moveNext(1, FIRST_COLUMN, DIR_UP)).assertEqual(NOT_FOUND);
      BoardKit.log('moveNext_upAdjacentTile', 'probe results 1 and -1');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_1900
     * @tc.name moveNextUpSkipsOneZero1900
     * @tc.desc Verify an up probe walks over one empty cell before reporting a row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_upSkipsOneZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([2, 0, 4, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_UP);
      expect(found).assertEqual(2);
      expect(rule.dataNumbers[found * SIDE + FIRST_COLUMN]).assertEqual(4);
      BoardKit.log('moveNext_upSkipsOneZero', 'row two reported');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2000
     * @tc.name moveNextUpSkipsTwoZeros2000
     * @tc.desc Verify an up probe crosses a two cell run of empties and reaches the last row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_upSkipsTwoZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([2, 0, 0, 8]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_UP)).assertEqual(LAST_LINE);
      expect(rule.dataNumbers[12]).assertEqual(8);
      BoardKit.log('moveNext_upSkipsTwoZeros', 'last row reached');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2100
     * @tc.name moveNextUpAtLastRow2100
     * @tc.desc Verify an up probe starting in the last row has nothing to scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_upAtLastRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(LAST_LINE, FIRST_COLUMN, DIR_UP)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(2, FIRST_COLUMN, DIR_UP)).assertEqual(LAST_LINE);
      BoardKit.log('moveNext_upAtLastRow', 'boundary probe returns -1');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2200
     * @tc.name moveNextUpReturnsNearestTile2200
     * @tc.desc Verify an up probe stops at the nearest tile instead of a farther one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_upReturnsNearestTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 2, 0, 4]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_UP);
      expect(found).assertEqual(1);
      expect(rule.dataNumbers[found * SIDE]).assertEqual(2);
      BoardKit.log('moveNext_upReturnsNearestTile', 'nearest tile wins over the far one');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2300
     * @tc.name moveNextUpReturnsRowNotOffset2300
     * @tc.desc Verify the returned number is a row index and not a flattened cell index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_upReturnsRowNotOffset', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 0, 8, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, 2, DIR_UP);
      expect(found).assertEqual(1);
      expect(found !== 6).assertTrue();
      expect(rule.dataNumbers[found * SIDE + 2]).assertEqual(8);
      BoardKit.log('moveNext_upReturnsRowNotOffset', 'row one reported for cell six');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2400
     * @tc.name moveNextUpReadsOnlyItsColumn2400
     * @tc.desc Verify an up probe never sees a tile that lives in another column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_upReadsOnlyItsColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 16, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_UP)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(FIRST_LINE, 2, DIR_UP)).assertEqual(2);
      BoardKit.log('moveNext_upReadsOnlyItsColumn', 'column two owns the only tile');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2500
     * @tc.name moveNextDownAdjacentTile2500
     * @tc.desc Verify a down probe returns the neighbouring row when that cell is occupied
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_downAdjacentTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 2, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(LAST_LINE, FIRST_COLUMN, DIR_DOWN)).assertEqual(2);
      expect(rule.moveNext(2, FIRST_COLUMN, DIR_DOWN)).assertEqual(1);
      BoardKit.log('moveNext_downAdjacentTile', 'adjacent rows reported');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2600
     * @tc.name moveNextDownSkipsOneZero2600
     * @tc.desc Verify a down probe walks over one empty cell before reporting a row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_downSkipsOneZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 4, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(LAST_LINE, FIRST_COLUMN, DIR_DOWN);
      expect(found).assertEqual(1);
      expect(rule.dataNumbers[found * SIDE]).assertEqual(4);
      BoardKit.log('moveNext_downSkipsOneZero', 'row one reported');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2700
     * @tc.name moveNextDownSkipsTwoZeros2700
     * @tc.desc Verify a down probe crosses a two cell run of empties and reaches row zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_downSkipsTwoZeros', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([8, 0, 0, 2]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(LAST_LINE, FIRST_COLUMN, DIR_DOWN)).assertEqual(FIRST_LINE);
      expect(rule.dataNumbers[0]).assertEqual(8);
      BoardKit.log('moveNext_downSkipsTwoZeros', 'row zero reached');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2800
     * @tc.name moveNextDownAtFirstRow2800
     * @tc.desc Verify a down probe starting in row zero has nothing to scan
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_downAtFirstRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 8, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_DOWN)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(3, FIRST_COLUMN, DIR_DOWN)).assertEqual(1);
      BoardKit.log('moveNext_downAtFirstRow', 'boundary probe returns -1');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_2900
     * @tc.name moveNextDownReturnsNearestTile2900
     * @tc.desc Verify a down probe stops at the nearest tile instead of a farther one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_downReturnsNearestTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.column([0, 0, 8, 2]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(LAST_LINE, FIRST_COLUMN, DIR_DOWN);
      expect(found).assertEqual(2);
      expect(rule.dataNumbers[found * SIDE]).assertEqual(8);
      BoardKit.log('moveNext_downReturnsNearestTile', 'nearest tile wins over the far one');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3000
     * @tc.name moveNextDownReadsOnlyItsColumn3000
     * @tc.desc Verify a down probe never sees a tile that lives in another column
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_downReadsOnlyItsColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 8, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(LAST_LINE, FIRST_COLUMN, DIR_DOWN)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(LAST_LINE, 1, DIR_DOWN)).assertEqual(2);
      BoardKit.log('moveNext_downReadsOnlyItsColumn', 'column one owns the only tile');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3100
     * @tc.name moveNextUnknownDirectionDiagonal3100
     * @tc.desc Verify the literal diagonal is rejected and leaves the board untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_unknownDirectionDiagonal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([2, 0, 2, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      expect(rule.moveNext(FIRST_LINE, 0, 'diagonal')).assertEqual(NOT_FOUND);
      BoardKit.expectFullBoard(rule, before);
      BoardKit.expectScore(rule, 0);
      expect(rule.score !== 0).assertFalse();
      BoardKit.log('moveNext_unknownDirectionDiagonal', 'unknown direction stays inert');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3200
     * @tc.name moveNextUnknownDirectionUppercase3200
     * @tc.desc Verify the direction literal is case sensitive so LEFT finds nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_unknownDirectionUppercase', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 8, 0, 8]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 0, 'LEFT')).assertEqual(NOT_FOUND);
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_LEFT)).assertEqual(1);
      BoardKit.log('moveNext_unknownDirectionUppercase', 'uppercase literal is not a direction');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3300
     * @tc.name moveNextUnknownDirectionEmpty3300
     * @tc.desc Verify an empty direction literal returns no tile even with a tile in reach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_unknownDirectionEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, 0, 16, 0]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, 0, '')).assertEqual(NOT_FOUND);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[2]).assertEqual(16);
      BoardKit.log('moveNext_unknownDirectionEmpty', 'empty literal returns -1');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3400
     * @tc.name moveNextReadsWithoutWriting3400
     * @tc.desc Verify probing a board many times never writes a cell or changes the score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_readsWithoutWriting', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [0, 2, 0, 0],
        [0, 0, 4, 0],
        [0, 0, 0, 8],
        [16, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      let before: number[] = BoardKit.valuesOf(rule);
      expect(rule.moveNext(0, 0, DIR_LEFT)).assertEqual(1);
      expect(rule.moveNext(1, 0, DIR_LEFT)).assertEqual(2);
      expect(rule.moveNext(2, 0, DIR_LEFT)).assertEqual(3);
      expect(rule.moveNext(0, 1, DIR_UP)).assertEqual(NOT_FOUND);
      let changed: number | null = null;
      for (let index: number = 0; index < CELLS; index++) {
        if (rule.dataNumbers[index] !== before[index]) {
          changed = rule.dataNumbers[index];
        }
      }
      expect(changed).assertNull();
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(rule.dataNumbers[CELLS]).assertUndefined();
      BoardKit.expectScore(rule, 0);
      BoardKit.logBoard('moveNext_readsWithoutWriting', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3500
     * @tc.name moveNextResultStaysInRange3500
     * @tc.desc Verify every probe on a packed board yields minus one or a line offset in range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_resultStaysInRange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(board);
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      let valid: boolean = true;
      for (let line: number = 0; line < SIDE; line++) {
        for (let probe: number = 0; probe < directions.length; probe++) {
          let result: number = rule.moveNext(line, line, directions[probe]);
          let inRange: boolean = result === NOT_FOUND || result === 0 || result === 1 || result === 2 || result === 3;
          if (!inRange) {
            valid = false;
          }
        }
      }
      expect(valid).assertTrue();
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_LEFT)).assertEqual(1);
      expect(rule.moveNext(LAST_LINE, LAST_COLUMN, DIR_DOWN)).assertEqual(2);
      BoardKit.logBoard('moveNext_resultStaysInRange', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3600
     * @tc.name moveNextEmptyBoardAllDirectionsReturn3600
     * @tc.desc Verify all four directions report no tile on an empty board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_emptyBoardAllDirectionsReturn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.blank();
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(1, 2, DIR_LEFT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(1, 2, DIR_RIGHT)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(1, 2, DIR_UP)).assertEqual(NOT_FOUND);
      expect(rule.moveNext(1, 2, DIR_DOWN)).assertEqual(NOT_FOUND);
      BoardKit.expectAllZeros(rule.dataNumbers);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(0);
      BoardKit.log('moveNext_emptyBoardAllDirectionsReturn', 'no direction finds a tile');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3700
     * @tc.name moveNextFourRowsSweep3700
     * @tc.desc Verify a left probe reports the right answer for each of the four rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_fourRowsSweep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [0, 4, 4, 0],
        [0, 0, 8, 8],
        [0, 0, 0, 16]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(0, 0, DIR_LEFT)).assertEqual(1);
      expect(rule.moveNext(1, 1, DIR_LEFT)).assertEqual(2);
      expect(rule.moveNext(2, 2, DIR_LEFT)).assertEqual(3);
      expect(rule.moveNext(3, 3, DIR_LEFT)).assertEqual(NOT_FOUND);
      expect(String(rule.dataNumbers)).assertContain('8,8,0,0');
      BoardKit.logBoard('moveNext_fourRowsSweep', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3800
     * @tc.name moveNextFourColumnsSweep3800
     * @tc.desc Verify an up probe reports row one for each of the four columns
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_fourColumnsSweep', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.rows([
        [2, 4, 8, 16],
        [2, 4, 8, 16],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(board);
      for (let column: number = 0; column < SIDE; column++) {
        expect(rule.moveNext(FIRST_LINE, column, DIR_UP)).assertEqual(1);
      }
      expect(rule.moveNext(LAST_LINE, FIRST_COLUMN, DIR_UP)).assertEqual(NOT_FOUND);
      expect(BoardKit.sum(rule.dataNumbers)).assertEqual(60);
      BoardKit.logBoard('moveNext_fourColumnsSweep', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_3900
     * @tc.name moveNextIgnoresStartingCell3900
     * @tc.desc Verify a probe starts strictly after its own cell so that cell is never reported
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_ignoresStartingCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([8, 4, 0, 0]);
      let rule: GameRule = BoardKit.rule(board);
      let found: number = rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_LEFT);
      expect(found).assertEqual(1);
      expect(found !== FIRST_COLUMN).assertTrue();
      expect(rule.moveNext(FIRST_LINE, 1, DIR_LEFT)).assertEqual(NOT_FOUND);
      BoardKit.logBoard('moveNext_ignoresStartingCell', rule.dataNumbers);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULENEXTEST_4000
     * @tc.name moveNextCountsNonStandardValues4000
     * @tc.desc Verify any non-zero cell counts as a tile even when the value is odd or negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('moveNext_countsNonStandardValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let board: number[] = BoardKit.row([0, -2, 0, 3]);
      let rule: GameRule = BoardKit.rule(board);
      expect(rule.moveNext(FIRST_LINE, FIRST_COLUMN, DIR_LEFT)).assertEqual(1);
      expect(rule.moveNext(FIRST_LINE, 1, DIR_LEFT)).assertEqual(LAST_COLUMN);
      expect(rule.dataNumbers[1]).assertEqual(-2);
      expect(rule.dataNumbers[3]).assertEqual(3);
      BoardKit.logBoard('moveNext_countsNonStandardValues', rule.dataNumbers);
    });
  });
}
