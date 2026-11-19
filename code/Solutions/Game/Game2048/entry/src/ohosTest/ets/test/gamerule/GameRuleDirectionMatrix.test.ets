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
import { BoardKit, CELLS, SIDE, DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN } from '../common/Game2048TestKit';
import { BoardOracle } from '../common/BoardOracle';

/** One tile in the top left corner, nothing else. */
const M01_SINGLE_FIRST: number[] = [
  2, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** One tile in the bottom right corner, nothing else. */
const M02_SINGLE_LAST: number[] = [
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 4
];

/** A full top row of distinct increasing tiles. */
const M03_TOP_ROW: number[] = [
  2, 4, 8, 16,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** A full left column of distinct increasing tiles. */
const M04_LEFT_COLUMN: number[] = [
  2, 0, 0, 0,
  4, 0, 0, 0,
  8, 0, 0, 0,
  16, 0, 0, 0
];

/** Four tiles on the main diagonal. */
const M05_DIAGONAL: number[] = [
  2, 0, 0, 0,
  0, 4, 0, 0,
  0, 0, 8, 0,
  0, 0, 0, 16
];

/** Every row carries the same two mergeable pairs. */
const M06_PAIRS: number[] = [
  2, 2, 4, 4,
  2, 2, 4, 4,
  2, 2, 4, 4,
  2, 2, 4, 4
];

/** Three equal tiles followed by a different tile in the top row. */
const M07_TRIPLE: number[] = [
  2, 2, 2, 4,
  0, 0, 0, 0,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** Full board with no empty cell and no merge in any direction. */
const M08_DEAD: number[] = [
  2, 4, 2, 4,
  4, 2, 4, 2,
  2, 4, 2, 4,
  4, 2, 4, 2
];

/** Four corners holding four different tiles. */
const M09_CORNERS: number[] = [
  2, 0, 0, 4,
  0, 0, 0, 0,
  0, 0, 0, 0,
  8, 0, 0, 16
];

/** Full board that only merges along the vertical axis. */
const M10_ALTERNATING: number[] = [
  2, 4, 2, 4,
  2, 4, 2, 4,
  2, 4, 2, 4,
  2, 4, 2, 4
];

/** Large tiles that merge pairwise inside four different rows. */
const M11_HIGH: number[] = [
  1024, 1024, 0, 0,
  0, 2048, 2048, 0,
  0, 0, 4096, 4096,
  8192, 0, 0, 8192
];

/** Alternating sparse tiles used to observe horizontal and vertical shifts. */
const M12_MIXED: number[] = [
  0, 2, 0, 4,
  8, 0, 16, 0,
  0, 32, 0, 64,
  128, 0, 256, 0
];

/** One horizontal pair in the first row and one vertical pair in the last column. */
const M13_MIXED_AXES: number[] = [
  2, 2, 8, 16,
  0, 0, 0, 16,
  0, 0, 0, 0,
  0, 0, 0, 0
];

/** Applies the deterministic line move to all four lines of a board. */
function moveAllLines(board: number[], direction: string): GameRule {
  let rule: GameRule = BoardKit.rule(board);
  for (let line: number = 0; line < SIDE; line++) {
    rule.moveInRow(direction, line);
  }
  return rule;
}

/** Mirrors a board left to right, keeping row order. */
function mirrorHorizontal(values: number[]): number[] {
  let result: number[] = [];
  for (let row: number = 0; row < SIDE; row++) {
    for (let column: number = SIDE - 1; column >= 0; column--) {
      result.push(values[row * SIDE + column]);
    }
  }
  return result;
}

/** Mirrors a board top to bottom, keeping column order. */
function mirrorVertical(values: number[]): number[] {
  let result: number[] = [];
  for (let row: number = SIDE - 1; row >= 0; row--) {
    for (let column: number = 0; column < SIDE; column++) {
      result.push(values[row * SIDE + column]);
    }
  }
  return result;
}

/** Swaps rows and columns, turning vertical movement into horizontal movement. */
function transpose(values: number[]): number[] {
  let result: number[] = [];
  for (let column: number = 0; column < SIDE; column++) {
    for (let row: number = 0; row < SIDE; row++) {
      result.push(values[row * SIDE + column]);
    }
  }
  return result;
}

/** Compares two boards cell by cell. */
function sameBoard(left: number[], right: number[]): boolean {
  if (left.length !== right.length) {
    return false;
  }
  for (let index: number = 0; index < left.length; index++) {
    if (left[index] !== right[index]) {
      return false;
    }
  }
  return true;
}

/** Counts how many of the four directions actually change the board. */
function countChangedDirections(board: number[]): number {
  let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
  let changed: number = 0;
  for (let index: number = 0; index < directions.length; index++) {
    let moved: GameRule = moveAllLines(board, directions[index]);
    if (sameBoard(moved.dataNumbers, board) === false) {
      changed = changed + 1;
    }
  }
  return changed;
}

/**
 * GameRule 四向结果矩阵测试套件。
 *
 * 同一个盘面在 left/right/up/down 四个方向上的结果构成一张矩阵：横向两个方向
 * 互为镜像，纵向两个方向互为镜像，且“四向全不动”只在死盘上成立。本套件只用
 * 确定性行移动取证，避免 move 的随机补块干扰矩阵比较。
 */
export default function gameRuleDirectionMatrixTest() {
  describe('gameRuleDirectionMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('gameRuleDirectionMatrixTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('gameRuleDirectionMatrixTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0100
     * @tc.name directionMatrixSingleTile0100
     * @tc.desc Verify a single corner tile follows the reference model in all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_singleTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M01_SINGLE_FIRST, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M01_SINGLE_FIRST, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M01_SINGLE_FIRST, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M01_SINGLE_FIRST, DIR_RIGHT).dataNumbers[3]).assertEqual(2);
      expect(moveAllLines(M01_SINGLE_FIRST, DIR_DOWN).dataNumbers[12]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0200
     * @tc.name directionMatrixLastCornerTile0200
     * @tc.desc Verify a bottom right tile reaches the opposite edge in all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_lastCornerTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M02_SINGLE_LAST, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M02_SINGLE_LAST, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M02_SINGLE_LAST, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M02_SINGLE_LAST, DIR_LEFT).dataNumbers[12]).assertEqual(4);
      expect(moveAllLines(M02_SINGLE_LAST, DIR_UP).dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0300
     * @tc.name directionMatrixTopRow0300
     * @tc.desc Verify a full top row matches the reference model in all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_topRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M03_TOP_ROW, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M03_TOP_ROW, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M03_TOP_ROW, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M03_TOP_ROW, DIR_DOWN).dataNumbers[12]).assertEqual(2);
      expect(moveAllLines(M03_TOP_ROW, DIR_DOWN).dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0400
     * @tc.name directionMatrixLeftColumn0400
     * @tc.desc Verify a full left column matches the reference model in all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_leftColumn', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M04_LEFT_COLUMN, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M04_LEFT_COLUMN, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M04_LEFT_COLUMN, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M04_LEFT_COLUMN, DIR_RIGHT).dataNumbers[3]).assertEqual(2);
      expect(moveAllLines(M04_LEFT_COLUMN, DIR_RIGHT).dataNumbers[15]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0500
     * @tc.name directionMatrixDiagonal0500
     * @tc.desc Verify four diagonal tiles collapse onto the leading edge in every direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_diagonal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M05_DIAGONAL, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M05_DIAGONAL, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M05_DIAGONAL, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M05_DIAGONAL, DIR_LEFT).dataNumbers[4]).assertEqual(4);
      expect(moveAllLines(M05_DIAGONAL, DIR_UP).dataNumbers[2]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0600
     * @tc.name directionMatrixFullPairs0600
     * @tc.desc Verify a full board of pairs produces the reference matrix in all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_fullPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M06_PAIRS, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M06_PAIRS, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M06_PAIRS, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M06_PAIRS, DIR_LEFT).score).assertEqual(48);
      expect(moveAllLines(M06_PAIRS, DIR_LEFT).dataNumbers[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0700
     * @tc.name directionMatrixTripleTile0700
     * @tc.desc Verify three equal tiles merge once and leave the fourth tile untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_tripleTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M07_TRIPLE, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M07_TRIPLE, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M07_TRIPLE, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M07_TRIPLE, DIR_LEFT).dataNumbers[1]).assertEqual(2);
      expect(moveAllLines(M07_TRIPLE, DIR_LEFT).score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0800
     * @tc.name directionMatrixDeadBoard0800
     * @tc.desc Verify a finished board is a fixed point of all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_deadBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M08_DEAD, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M08_DEAD, direction));
        BoardKit.expectValues(moved.dataNumbers, M08_DEAD);
        expect(moved.score).assertEqual(0);
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(BoardOracle.gameOver(M08_DEAD)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_0900
     * @tc.name directionMatrixCornerTiles0900
     * @tc.desc Verify four corner tiles match the reference matrix without any merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_cornerTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M09_CORNERS, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M09_CORNERS, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M09_CORNERS, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M09_CORNERS, DIR_LEFT).dataNumbers[1]).assertEqual(4);
      expect(moveAllLines(M09_CORNERS, DIR_LEFT).dataNumbers[13]).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1000
     * @tc.name directionMatrixVerticalAlternation1000
     * @tc.desc Verify a board that only merges vertically matches the reference matrix
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_verticalAlternation', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M10_ALTERNATING, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M10_ALTERNATING, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M10_ALTERNATING, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M10_ALTERNATING, DIR_UP).dataNumbers[0]).assertEqual(4);
      expect(moveAllLines(M10_ALTERNATING, DIR_UP).score).assertEqual(48);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1100
     * @tc.name directionMatrixHighValueRows1100
     * @tc.desc Verify large tiles merge exactly once per row in all four directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_highValueRows', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M11_HIGH, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M11_HIGH, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M11_HIGH, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M11_HIGH, DIR_LEFT).score).assertEqual(30720);
      expect(moveAllLines(M11_HIGH, DIR_LEFT).dataNumbers[12]).assertEqual(16384);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1200
     * @tc.name directionMatrixSparseMixed1200
     * @tc.desc Verify an alternating sparse board matches the reference matrix in all directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_sparseMixed', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let directions: string[] = [DIR_LEFT, DIR_RIGHT, DIR_UP, DIR_DOWN];
      for (let index: number = 0; index < directions.length; index++) {
        let direction: string = directions[index];
        let moved: GameRule = moveAllLines(M12_MIXED, direction);
        BoardKit.expectValues(moved.dataNumbers, BoardOracle.move(M12_MIXED, direction));
        expect(moved.score).assertEqual(BoardOracle.mergeScore(M12_MIXED, direction));
        expect(moved.dataNumbers.length).assertEqual(CELLS);
      }
      expect(moveAllLines(M12_MIXED, DIR_LEFT).dataNumbers[1]).assertEqual(4);
      expect(moveAllLines(M12_MIXED, DIR_LEFT).dataNumbers[13]).assertEqual(256);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1300
     * @tc.name directionMatrixHorizontalMirrorDiagonal1300
     * @tc.desc Verify left on a diagonal board mirrors right on its horizontal mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_horizontalMirrorDiagonal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leftMoved: GameRule = moveAllLines(M05_DIAGONAL, DIR_LEFT);
      let mirroredBoard: number[] = mirrorHorizontal(M05_DIAGONAL);
      let rightMoved: GameRule = moveAllLines(mirroredBoard, DIR_RIGHT);
      BoardKit.expectValues(rightMoved.dataNumbers, mirrorHorizontal(leftMoved.dataNumbers));
      expect(rightMoved.score).assertEqual(leftMoved.score);
      expect(rightMoved.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1400
     * @tc.name directionMatrixHorizontalMirrorPairs1400
     * @tc.desc Verify left on a pair board mirrors right on its horizontal mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_horizontalMirrorPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leftMoved: GameRule = moveAllLines(M06_PAIRS, DIR_LEFT);
      let mirroredBoard: number[] = mirrorHorizontal(M06_PAIRS);
      let rightMoved: GameRule = moveAllLines(mirroredBoard, DIR_RIGHT);
      BoardKit.expectValues(rightMoved.dataNumbers, mirrorHorizontal(leftMoved.dataNumbers));
      expect(rightMoved.score).assertEqual(leftMoved.score);
      expect(leftMoved.dataNumbers).assertContain(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1500
     * @tc.name directionMatrixHorizontalMirrorTriple1500
     * @tc.desc Verify left on a triple board mirrors right on its horizontal mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_horizontalMirrorTriple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leftMoved: GameRule = moveAllLines(M07_TRIPLE, DIR_LEFT);
      let mirroredBoard: number[] = mirrorHorizontal(M07_TRIPLE);
      let rightMoved: GameRule = moveAllLines(mirroredBoard, DIR_RIGHT);
      BoardKit.expectValues(rightMoved.dataNumbers, mirrorHorizontal(leftMoved.dataNumbers));
      expect(rightMoved.score).assertEqual(leftMoved.score);
      expect(rightMoved.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1600
     * @tc.name directionMatrixHorizontalMirrorCorners1600
     * @tc.desc Verify left on a corner board mirrors right on its horizontal mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_horizontalMirrorCorners', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leftMoved: GameRule = moveAllLines(M09_CORNERS, DIR_LEFT);
      let mirroredBoard: number[] = mirrorHorizontal(M09_CORNERS);
      let rightMoved: GameRule = moveAllLines(mirroredBoard, DIR_RIGHT);
      BoardKit.expectValues(rightMoved.dataNumbers, mirrorHorizontal(leftMoved.dataNumbers));
      expect(rightMoved.score).assertEqual(leftMoved.score);
      expect(rightMoved.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1700
     * @tc.name directionMatrixHorizontalMirrorHigh1700
     * @tc.desc Verify left on a high value board mirrors right on its horizontal mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_horizontalMirrorHigh', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leftMoved: GameRule = moveAllLines(M11_HIGH, DIR_LEFT);
      let mirroredBoard: number[] = mirrorHorizontal(M11_HIGH);
      let rightMoved: GameRule = moveAllLines(mirroredBoard, DIR_RIGHT);
      BoardKit.expectValues(rightMoved.dataNumbers, mirrorHorizontal(leftMoved.dataNumbers));
      expect(rightMoved.score).assertEqual(leftMoved.score);
      expect(rightMoved.score).assertEqual(30720);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1800
     * @tc.name directionMatrixHorizontalMirrorSparse1800
     * @tc.desc Verify left on a sparse board mirrors right on its horizontal mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_horizontalMirrorSparse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leftMoved: GameRule = moveAllLines(M12_MIXED, DIR_LEFT);
      let mirroredBoard: number[] = mirrorHorizontal(M12_MIXED);
      let rightMoved: GameRule = moveAllLines(mirroredBoard, DIR_RIGHT);
      BoardKit.expectValues(rightMoved.dataNumbers, mirrorHorizontal(leftMoved.dataNumbers));
      expect(rightMoved.score).assertEqual(leftMoved.score);
      expect(BoardKit.sum(rightMoved.dataNumbers)).assertEqual(510);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_1900
     * @tc.name directionMatrixVerticalMirrorTopRow1900
     * @tc.desc Verify up on a top row board mirrors down on its vertical mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_verticalMirrorTopRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M03_TOP_ROW, DIR_UP);
      let mirroredBoard: number[] = mirrorVertical(M03_TOP_ROW);
      let downMoved: GameRule = moveAllLines(mirroredBoard, DIR_DOWN);
      BoardKit.expectValues(downMoved.dataNumbers, mirrorVertical(upMoved.dataNumbers));
      expect(downMoved.score).assertEqual(upMoved.score);
      expect(downMoved.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2000
     * @tc.name directionMatrixVerticalMirrorDiagonal2000
     * @tc.desc Verify up on a diagonal board mirrors down on its vertical mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_verticalMirrorDiagonal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M05_DIAGONAL, DIR_UP);
      let mirroredBoard: number[] = mirrorVertical(M05_DIAGONAL);
      let downMoved: GameRule = moveAllLines(mirroredBoard, DIR_DOWN);
      BoardKit.expectValues(downMoved.dataNumbers, mirrorVertical(upMoved.dataNumbers));
      expect(downMoved.score).assertEqual(upMoved.score);
      expect(upMoved.dataNumbers[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2100
     * @tc.name directionMatrixVerticalMirrorPairs2100
     * @tc.desc Verify up on a pair board mirrors down on its vertical mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_verticalMirrorPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M06_PAIRS, DIR_UP);
      let mirroredBoard: number[] = mirrorVertical(M06_PAIRS);
      let downMoved: GameRule = moveAllLines(mirroredBoard, DIR_DOWN);
      BoardKit.expectValues(downMoved.dataNumbers, mirrorVertical(upMoved.dataNumbers));
      expect(downMoved.score).assertEqual(upMoved.score);
      expect(upMoved.score).assertEqual(48);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2200
     * @tc.name directionMatrixVerticalMirrorTriple2200
     * @tc.desc Verify up on a triple board mirrors down on its vertical mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_verticalMirrorTriple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M07_TRIPLE, DIR_UP);
      let mirroredBoard: number[] = mirrorVertical(M07_TRIPLE);
      let downMoved: GameRule = moveAllLines(mirroredBoard, DIR_DOWN);
      BoardKit.expectValues(downMoved.dataNumbers, mirrorVertical(upMoved.dataNumbers));
      expect(downMoved.score).assertEqual(upMoved.score);
      expect(downMoved.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2300
     * @tc.name directionMatrixVerticalMirrorCorners2300
     * @tc.desc Verify up on a corner board mirrors down on its vertical mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_verticalMirrorCorners', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M09_CORNERS, DIR_UP);
      let mirroredBoard: number[] = mirrorVertical(M09_CORNERS);
      let downMoved: GameRule = moveAllLines(mirroredBoard, DIR_DOWN);
      BoardKit.expectValues(downMoved.dataNumbers, mirrorVertical(upMoved.dataNumbers));
      expect(downMoved.score).assertEqual(upMoved.score);
      expect(BoardKit.sum(downMoved.dataNumbers)).assertEqual(30);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2400
     * @tc.name directionMatrixVerticalMirrorSparse2400
     * @tc.desc Verify up on a sparse board mirrors down on its vertical mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_verticalMirrorSparse', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M12_MIXED, DIR_UP);
      let mirroredBoard: number[] = mirrorVertical(M12_MIXED);
      let downMoved: GameRule = moveAllLines(mirroredBoard, DIR_DOWN);
      BoardKit.expectValues(downMoved.dataNumbers, mirrorVertical(upMoved.dataNumbers));
      expect(downMoved.score).assertEqual(upMoved.score);
      expect(upMoved.dataNumbers[0]).assertEqual(8);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2500
     * @tc.name directionMatrixOneDirectionChangesSingle2500
     * @tc.desc Verify a single corner tile board changes in exactly two directions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_oneDirectionChangesSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M01_SINGLE_FIRST);
      expect(changed === 0).assertFalse();
      expect(changed).assertEqual(2);
      expect(BoardOracle.gameOver(M01_SINGLE_FIRST)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2600
     * @tc.name directionMatrixOneDirectionChangesTopRow2600
     * @tc.desc Verify a top row board changes in exactly one direction
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_oneDirectionChangesTopRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M03_TOP_ROW);
      expect(changed === 0).assertFalse();
      expect(changed).assertEqual(1);
      expect(BoardOracle.gameOver(M03_TOP_ROW)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2700
     * @tc.name directionMatrixOneDirectionChangesDiagonal2700
     * @tc.desc Verify a diagonal board changes in all four directions without merging
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_oneDirectionChangesDiagonal', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M05_DIAGONAL);
      expect(changed === 0).assertFalse();
      expect(changed).assertEqual(4);
      expect(moveAllLines(M05_DIAGONAL, DIR_LEFT).score).assertEqual(0);
      expect(BoardOracle.gameOver(M05_DIAGONAL)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2800
     * @tc.name directionMatrixOneDirectionChangesPairs2800
     * @tc.desc Verify a full pair board changes in all four directions through merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_oneDirectionChangesPairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M06_PAIRS);
      expect(changed === 0).assertFalse();
      expect(changed).assertEqual(4);
      expect(moveAllLines(M06_PAIRS, DIR_LEFT).score).assertEqual(48);
      expect(BoardOracle.gameOver(M06_PAIRS)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_2900
     * @tc.name directionMatrixOneDirectionChangesTriple2900
     * @tc.desc Verify a triple tile board changes in three directions and keeps its top row
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_oneDirectionChangesTriple', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M07_TRIPLE);
      let upMoved: GameRule = moveAllLines(M07_TRIPLE, DIR_UP);
      expect(changed === 0).assertFalse();
      expect(changed).assertEqual(3);
      BoardKit.expectValues(upMoved.dataNumbers, M07_TRIPLE);
      expect(BoardOracle.gameOver(M07_TRIPLE)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3000
     * @tc.name directionMatrixOneDirectionChangesAlternating3000
     * @tc.desc Verify a vertically alternating board changes only along the vertical axis
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_oneDirectionChangesAlternating', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M10_ALTERNATING);
      let leftMoved: GameRule = moveAllLines(M10_ALTERNATING, DIR_LEFT);
      let upMoved: GameRule = moveAllLines(M10_ALTERNATING, DIR_UP);
      expect(changed === 0).assertFalse();
      expect(changed).assertEqual(2);
      expect(sameBoard(leftMoved.dataNumbers, M10_ALTERNATING)).assertTrue();
      expect(sameBoard(upMoved.dataNumbers, M10_ALTERNATING)).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3100
     * @tc.name directionMatrixLeftMergesOnlyHorizontalPair3100
     * @tc.desc Verify a left move merges the horizontal pair and leaves the vertical pair unmerged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_leftMergesOnlyHorizontalPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let leftMoved: GameRule = moveAllLines(M13_MIXED_AXES, DIR_LEFT);
      expect(leftMoved.score).assertEqual(4);
      expect(BoardKit.positionsOf(leftMoved.dataNumbers, 32).length).assertEqual(0);
      expect(BoardKit.positionsOf(leftMoved.dataNumbers, 16).length).assertEqual(2);
      expect(leftMoved.dataNumbers[0]).assertEqual(4);
      expect(BoardKit.sum(leftMoved.dataNumbers)).assertEqual(44);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3200
     * @tc.name directionMatrixUpMergesOnlyVerticalPair3200
     * @tc.desc Verify an up move merges the vertical pair and keeps the horizontal pair apart
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_upMergesOnlyVerticalPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M13_MIXED_AXES, DIR_UP);
      expect(upMoved.score).assertEqual(32);
      expect(BoardKit.positionsOf(upMoved.dataNumbers, 2).length).assertEqual(2);
      expect(BoardKit.positionsOf(upMoved.dataNumbers, 4).length).assertEqual(0);
      expect(BoardKit.positionsOf(upMoved.dataNumbers, 32).length).assertEqual(1);
      expect(upMoved.dataNumbers[3]).assertEqual(32);
      expect(BoardKit.sum(upMoved.dataNumbers)).assertEqual(44);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3300
     * @tc.name directionMatrixDownMergesOnlyVerticalPair3300
     * @tc.desc Verify a down move merges the vertical pair at the bottom edge only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_downMergesOnlyVerticalPair', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let downMoved: GameRule = moveAllLines(M13_MIXED_AXES, DIR_DOWN);
      expect(downMoved.score).assertEqual(32);
      expect(downMoved.dataNumbers[15]).assertEqual(32);
      expect(BoardKit.positionsOf(downMoved.dataNumbers, 32).length).assertEqual(1);
      expect(BoardKit.positionsOf(downMoved.dataNumbers, 2).length).assertEqual(2);
      expect(BoardKit.sum(downMoved.dataNumbers)).assertEqual(44);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3400
     * @tc.name directionMatrixTransposeTurnsUpIntoLeft3400
     * @tc.desc Verify up on a board equals the transpose of left on its transposed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_transposeTurnsUpIntoLeft', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let upMoved: GameRule = moveAllLines(M05_DIAGONAL, DIR_UP);
      let rotatedBoard: number[] = transpose(M05_DIAGONAL);
      let leftMoved: GameRule = moveAllLines(rotatedBoard, DIR_LEFT);
      BoardKit.expectValues(transpose(upMoved.dataNumbers), leftMoved.dataNumbers);
      expect(upMoved.score).assertEqual(leftMoved.score);
      expect(leftMoved.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3500
     * @tc.name directionMatrixTransposeTurnsDownIntoRight3500
     * @tc.desc Verify down on a board equals the transpose of right on its transposed board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_transposeTurnsDownIntoRight', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let downMoved: GameRule = moveAllLines(M11_HIGH, DIR_DOWN);
      let rotatedBoard: number[] = transpose(M11_HIGH);
      let rightMoved: GameRule = moveAllLines(rotatedBoard, DIR_RIGHT);
      BoardKit.expectValues(transpose(downMoved.dataNumbers), rightMoved.dataNumbers);
      expect(downMoved.score).assertEqual(rightMoved.score);
      expect(rightMoved.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3600
     * @tc.name directionMatrixNoMoveEqualsDeadBoard3600
     * @tc.desc Verify a dead board has no changing direction and no empty cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_noMoveEqualsDeadBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M08_DEAD);
      let allNoOp: boolean = changed === 0;
      expect(allNoOp === BoardOracle.gameOver(M08_DEAD)).assertTrue();
      expect(allNoOp).assertTrue();
      expect(BoardKit.describe(M08_DEAD).match(/0/)).assertNull();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3700
     * @tc.name directionMatrixNoMoveEqualsLiveSingle3700
     * @tc.desc Verify a single tile board is not a no-move board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_noMoveEqualsLiveSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M01_SINGLE_FIRST);
      let allNoOp: boolean = changed === 0;
      expect(allNoOp === BoardOracle.gameOver(M01_SINGLE_FIRST)).assertTrue();
      expect(allNoOp).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3800
     * @tc.name directionMatrixNoMoveEqualsLiveTopRow3800
     * @tc.desc Verify a top row board is not a no-move board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_noMoveEqualsLiveTopRow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M03_TOP_ROW);
      let allNoOp: boolean = changed === 0;
      expect(allNoOp === BoardOracle.gameOver(M03_TOP_ROW)).assertTrue();
      let rule: GameRule = BoardKit.rule(M03_TOP_ROW);
      expect(rule.isGameOver() === BoardOracle.gameOver(M03_TOP_ROW)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_3900
     * @tc.name directionMatrixNoMoveEqualsLivePairs3900
     * @tc.desc Verify a full pair board is not a no-move board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_noMoveEqualsLivePairs', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M06_PAIRS);
      let allNoOp: boolean = changed === 0;
      expect(allNoOp === BoardOracle.gameOver(M06_PAIRS)).assertTrue();
      let rule: GameRule = BoardKit.rule(M06_PAIRS);
      expect(rule.isGameOver() === BoardOracle.gameOver(M06_PAIRS)).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4000
     * @tc.name directionMatrixNoMoveEqualsLiveAlternating4000
     * @tc.desc Verify a vertically mergeable board is not a no-move board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_noMoveEqualsLiveAlternating', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let changed: number = countChangedDirections(M10_ALTERNATING);
      let allNoOp: boolean = changed === 0;
      expect(allNoOp === BoardOracle.gameOver(M10_ALTERNATING)).assertTrue();
      expect(changed).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4100
     * @tc.name directionMatrixNoMoveEqualsLivePairBoard4100
     * @tc.desc Verify a full board with one merge is not a no-move board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_noMoveEqualsLivePairBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let board: number[] = BoardKit.horizontalPairBoard();
      let changed: number = countChangedDirections(board);
      let allNoOp: boolean = changed === 0;
      expect(allNoOp === BoardOracle.gameOver(board)).assertTrue();
      expect(allNoOp).assertFalse();
      expect(changed).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4200
     * @tc.name directionMatrixUpperLeftIsIgnored4200
     * @tc.desc Verify the direction literal LEFT is case sensitive and moves nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_upperLeftIsIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lower: GameRule = moveAllLines(M09_CORNERS, DIR_LEFT);
      let upper: GameRule = moveAllLines(M09_CORNERS, 'LEFT');
      expect(sameBoard(lower.dataNumbers, M09_CORNERS)).assertFalse();
      expect(sameBoard(upper.dataNumbers, M09_CORNERS)).assertTrue();
      expect(upper.score).assertEqual(0);
      expect(upper.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4300
     * @tc.name directionMatrixUpperRightIsIgnored4300
     * @tc.desc Verify the direction literal RIGHT is case sensitive and moves nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_upperRightIsIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lower: GameRule = moveAllLines(M06_PAIRS, DIR_RIGHT);
      let upper: GameRule = moveAllLines(M06_PAIRS, 'RIGHT');
      expect(sameBoard(lower.dataNumbers, M06_PAIRS)).assertFalse();
      expect(sameBoard(upper.dataNumbers, M06_PAIRS)).assertTrue();
      expect(upper.score).assertEqual(0);
      expect(lower.score).assertEqual(48);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4400
     * @tc.name directionMatrixUpperUpIsIgnored4400
     * @tc.desc Verify the direction literal UP is case sensitive and moves nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_upperUpIsIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lower: GameRule = moveAllLines(M11_HIGH, DIR_UP);
      let upper: GameRule = moveAllLines(M11_HIGH, 'UP');
      expect(sameBoard(lower.dataNumbers, M11_HIGH)).assertFalse();
      expect(sameBoard(upper.dataNumbers, M11_HIGH)).assertTrue();
      expect(upper.score).assertEqual(0);
      expect(upper.dataNumbers[CELLS]).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4500
     * @tc.name directionMatrixUpperDownIsIgnored4500
     * @tc.desc Verify the direction literal DOWN is case sensitive and moves nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_upperDownIsIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let lower: GameRule = moveAllLines(M12_MIXED, DIR_DOWN);
      let upper: GameRule = moveAllLines(M12_MIXED, 'DOWN');
      expect(sameBoard(lower.dataNumbers, M12_MIXED)).assertFalse();
      expect(sameBoard(upper.dataNumbers, M12_MIXED)).assertTrue();
      expect(upper.score).assertEqual(0);
      expect(upper.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4600
     * @tc.name directionMatrixMixedCaseIsIgnored4600
     * @tc.desc Verify mixed case direction literals are ignored while lowercase works
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_mixedCaseIsIgnored', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let canonical: GameRule = moveAllLines(M05_DIAGONAL, DIR_LEFT);
      let mixedLeft: GameRule = moveAllLines(M05_DIAGONAL, 'Left');
      let mixedUp: GameRule = moveAllLines(M05_DIAGONAL, 'uP');
      expect(sameBoard(canonical.dataNumbers, M05_DIAGONAL)).assertFalse();
      expect(sameBoard(mixedLeft.dataNumbers, M05_DIAGONAL)).assertTrue();
      expect(sameBoard(mixedUp.dataNumbers, M05_DIAGONAL)).assertTrue();
      expect(mixedLeft.score).assertEqual(0);
      expect(mixedUp.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4700
     * @tc.name directionMatrixLeftResultLength4700
     * @tc.desc Verify a left move over a full board returns sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_leftResultLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(M06_PAIRS, DIR_LEFT);
      expect(moved.dataNumbers.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(typeof moved.dataNumbers[index]).assertEqual('number');
      }
      expect(moved.dataNumbers[CELLS]).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4800
     * @tc.name directionMatrixRightResultLength4800
     * @tc.desc Verify a right move over a mergeable row returns sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_rightResultLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(M07_TRIPLE, DIR_RIGHT);
      expect(moved.dataNumbers.length).assertEqual(CELLS);
      expect(BoardOracle.move(M07_TRIPLE, DIR_RIGHT).length).assertEqual(CELLS);
      expect(moved.dataNumbers[3]).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_4900
     * @tc.name directionMatrixUpResultLength4900
     * @tc.desc Verify an up move over a full board returns sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_upResultLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(M11_HIGH, DIR_UP);
      expect(moved.dataNumbers.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(typeof moved.dataNumbers[index]).assertEqual('number');
      }
    });

    /**
     * @tc.number SUB_GAME2048_GAMERULEDIRECTIONMATRIX_5000
     * @tc.name directionMatrixDownResultLength5000
     * @tc.desc Verify a down move over a sparse board returns sixteen cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('directionMatrix_downResultLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      let moved: GameRule = moveAllLines(M12_MIXED, DIR_DOWN);
      expect(moved.dataNumbers.length).assertEqual(CELLS);
      expect(BoardOracle.move(M12_MIXED, DIR_DOWN).length).assertEqual(CELLS);
      expect(moved.dataNumbers[CELLS]).assertUndefined();
    });
  });
}
