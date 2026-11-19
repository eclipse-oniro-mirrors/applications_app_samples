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
import { DataType, MyDataSource } from '../../../../main/ets/model/GameModuel';
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS, FIRST_CELL, LAST_CELL } from '../common/Game2048TestKit';

/** 套件名，与 describe 的第一个参数保持一致。 */
const SUITE_NAME: string = 'appIntegrationTest';
/** 棋盘一侧的线数，移动与同步都按四条线处理。 */
const LINES: number = 4;

/**
 * 复刻 Index.ets 中 dataView 的第一段循环：把规则盘的 16 个格值逐格写进
 * @State 装饰的 MyDataSource。镜像只改写单元格的 data 字段，不重建对象，
 * 也不增删单元格。
 */
function syncRuleToSource(rule: GameRule, source: MyDataSource): void {
  rule.dataNumbers.forEach((value: number, index: number) => {
    source.dataArray[index].data = value;
  });
}

/** 把 MyDataSource 读回成普通数组，便于与规则盘整体比较。 */
function sourceValues(source: MyDataSource): number[] {
  let values: number[] = [];
  for (let index: number = 0; index < source.totalCount(); index++) {
    values.push(source.getData(index).data);
  }
  return values;
}

/** 按索引顺序读出所有单元格的 id。 */
function sourceIds(source: MyDataSource): number[] {
  let ids: number[] = [];
  for (let index: number = 0; index < source.totalCount(); index++) {
    ids.push(source.getData(index).id);
  }
  return ids;
}

/** 列出棋盘上所有非零格的索引，用于比较两个棋盘的占格位置。 */
function occupiedIndices(values: number[]): number[] {
  let indices: number[] = [];
  for (let index: number = 0; index < values.length; index++) {
    if (values[index] !== 0) {
      indices.push(index);
    }
  }
  return indices;
}

/** 统计 DataSource 上非零格的个数。 */
function occupiedOfSource(source: MyDataSource): number {
  return BoardKit.countNonZero(sourceValues(source));
}

/** 构造一个十六格全零的 DataSource，等价于页面的初始 @State。 */
function blankSource(): MyDataSource {
  return new MyDataSource(BoardKit.data(BoardKit.blank()));
}

/** 用给定格值构造 DataSource，id 按 0..15 递增。 */
function sourceOf(values: number[]): MyDataSource {
  return new MyDataSource(BoardKit.data(values));
}

/** 按 id 查单元格，id 不存在时返回 null。 */
function findCellById(source: MyDataSource, id: number): DataType | null {
  for (let index: number = 0; index < source.totalCount(); index++) {
    if (source.getData(index).id === id) {
      return source.getData(index);
    }
  }
  return null;
}

/**
 * 页面状态桥：把 Index.ets 里紧挨着 @State 的 dataView / gameStart 两段
 * 逻辑抽出来，使「规则 → DataSource → 页面变量」这条链可以在设备上直接跑。
 */
class PageBridge {
  rule: GameRule;
  source: MyDataSource;
  gameStatus: number = GameStatus.BEFORE;
  curScore: number = 0;

  constructor(rule: GameRule, source: MyDataSource) {
    this.rule = rule;
    this.source = source;
  }

  /** 复刻 dataView：先镜像棋盘，再把 status / score 抄到页面变量。 */
  dataView(): void {
    syncRuleToSource(this.rule, this.source);
    this.gameStatus = this.rule.status;
    this.curScore = this.rule.score;
  }

  /** 复刻 gameStart：init 之后镜像新盘，并把状态推进到 RUNNING。 */
  gameStart(): void {
    this.rule.init();
    syncRuleToSource(this.rule, this.source);
    this.gameStatus = GameStatus.RUNNING;
  }

  /** 复刻一次手势落点：只调用确定性的单行移动。 */
  moveLine(direction: string, line: number): void {
    this.rule.moveInRow(direction, line);
  }
}

/**
 * GameRule 与 MyDataSource 的同步契约套件。
 *
 * 页面从不把 GameRule 交给 Grid 渲染，而是把规则盘的每个格值抄进
 * @State MyDataSource；分数与状态再各自抄进 curScore / gameStatus。
 * 本套件固化「抄写只发生在一个方向」「抄写不重建单元格」「抄写后
 * 页面变量跟随」这几条契约，并覆盖 gameStart 的重开镜像。
 */
export default function appIntegrationTest() {
  describe('appIntegrationTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log(SUITE_NAME, 'suite begin');
    });

    afterAll(() => {
      BoardKit.log(SUITE_NAME, 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0100
     * @tc.name appIntegrationMirrorsSingleTile0100
     * @tc.desc Verify one tile on the rule board reaches the matching DataSource cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_mirrorsSingleTile', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[FIRST_CELL] = 2;
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      expect(source.getData(FIRST_CELL).data).assertEqual(2);
      expect(source.getData(1).data).assertEqual(0);
      expect(occupiedOfSource(source)).assertEqual(1);
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log(SUITE_NAME, 'single tile mirrored');
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0200
     * @tc.name appIntegrationMirrorsSixteenCells0200
     * @tc.desc Verify sixteen distinct tile values are mirrored cell by cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_mirrorsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192, 16384, 32768, 65536];
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      for (let index: number = 0; index < CELLS; index++) {
        expect(source.getData(index).data).assertEqual(values[index]);
      }
      BoardKit.expectValues(sourceValues(source), values);
      expect(sourceValues(source)).assertContain(65536);
      expect(occupiedOfSource(source)).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0300
     * @tc.name appIntegrationMirrorsRowMajorOrder0300
     * @tc.desc Verify the mirror keeps row major order instead of transposing the grid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_mirrorsRowMajorOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        values.push(index + 1);
      }
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      expect(source.getData(4).data).assertEqual(5);
      expect(source.getData(7).data).assertEqual(8);
      expect(source.getData(12).data).assertEqual(13);
      expect(source.getData(LAST_CELL).data).assertEqual(16);
      BoardKit.expectValues(sourceValues(source), values);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0400
     * @tc.name appIntegrationMirrorsSparseBoard0400
     * @tc.desc Verify a sparse board keeps its exact five occupied positions after sync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_mirrorsSparseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[0] = 2;
      values[5] = 4;
      values[6] = 8;
      values[11] = 16;
      values[15] = 32;
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      expect(source.getData(6).data).assertEqual(8);
      expect(source.getData(11).data).assertEqual(16);
      expect(occupiedOfSource(source)).assertEqual(5);
      BoardKit.expectValues(occupiedIndices(sourceValues(source)), [0, 5, 6, 11, 15]);
      BoardKit.expectValues(sourceValues(source), values);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0500
     * @tc.name appIntegrationMirrorsDenseBoard0500
     * @tc.desc Verify a fully occupied rule board is mirrored without dropping a cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_mirrorsDenseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      BoardKit.expectValues(sourceValues(source), values);
      BoardKit.expectNoZero(sourceValues(source));
      expect(occupiedOfSource(source)).assertEqual(CELLS);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(1).data).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0600
     * @tc.name appIntegrationMirrorsEmptyBoard0600
     * @tc.desc Verify an all zero rule board clears every DataSource cell
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_mirrorsEmptyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      let source: MyDataSource = sourceOf(BoardKit.repeatedRow([2, 4, 8, 16]));
      rule.dataNumbers = BoardKit.blank();
      syncRuleToSource(rule, source);
      BoardKit.expectAllZeros(sourceValues(source));
      expect(occupiedOfSource(source)).assertEqual(0);
      expect(source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0700
     * @tc.name appIntegrationSyncKeepsLength0700
     * @tc.desc Verify repeated syncs never grow or shrink the DataSource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncKeepsLength', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let first: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 0, 4, 0]));
      syncRuleToSource(first, source);
      expect(source.totalCount()).assertEqual(CELLS);
      let second: GameRule = BoardKit.rule(BoardKit.overBoard());
      syncRuleToSource(second, source);
      expect(source.totalCount()).assertEqual(CELLS);
      let third: GameRule = BoardKit.rule(BoardKit.blank());
      syncRuleToSource(third, source);
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.expectAllZeros(sourceValues(source));
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0800
     * @tc.name appIntegrationSyncWritesDataOnly0800
     * @tc.desc Verify the mirror writes tile values without touching DataSource ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncWritesDataOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[2] = 4;
      values[9] = 8;
      let ids: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        ids.push(100 + index);
      }
      let list: DataType[] = BoardKit.dataWithIds(ids, values);
      let rule: GameRule = new GameRule(list);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      BoardKit.expectValues(sourceValues(source), values);
      let expectedIds: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        expectedIds.push(index);
      }
      BoardKit.expectValues(sourceIds(source), expectedIds);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_0900
     * @tc.name appIntegrationSyncKeepsIdsAcrossBoards0900
     * @tc.desc Verify ids stay stable when consecutive boards are mirrored
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncKeepsIdsAcrossBoards', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let sparse: GameRule = BoardKit.rule(BoardKit.row([2, 4, 8, 16]));
      syncRuleToSource(sparse, source);
      let firstIds: number[] = sourceIds(source);
      let dense: GameRule = BoardKit.rule(BoardKit.repeatedRow([8, 16, 32, 64]));
      syncRuleToSource(dense, source);
      let secondIds: number[] = sourceIds(source);
      BoardKit.expectValues(secondIds, firstIds);
      expect(secondIds[0]).assertEqual(0);
      expect(secondIds[LAST_CELL]).assertEqual(15);
      expect(source.getData(LAST_CELL).data).assertEqual(64);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1000
     * @tc.name appIntegrationSyncKeepsCellIdentities1000
     * @tc.desc Verify mirroring reuses the existing DataType objects instead of replacing them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncKeepsCellIdentities', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let before: DataType[] = source.dataArray.slice();
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      syncRuleToSource(rule, source);
      for (let index: number = 0; index < CELLS; index++) {
        expect(source.getData(index) === before[index]).assertTrue();
      }
      expect(source.getData(3).data).assertEqual(4);
      expect(source.totalCount()).assertEqual(before.length);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1100
     * @tc.name appIntegrationSyncLeavesRuleBoard1100
     * @tc.desc Verify a sync never writes back into the rule board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncLeavesRuleBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 4, 8, 16],
        [0, 0, 0, 0],
        [32, 64, 128, 256],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      let snapshot: number[] = BoardKit.valuesOf(rule);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      BoardKit.expectValues(rule.dataNumbers, snapshot);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(8).data).assertEqual(32);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1200
     * @tc.name appIntegrationSyncLeavesScoreStatus1200
     * @tc.desc Verify a sync leaves the rule score and status fields untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncLeavesScoreStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 2, 2, 2]));
      rule.score = 88;
      rule.status = GameStatus.OVER;
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      expect(rule.score).assertEqual(88);
      expect(rule.status).assertEqual(GameStatus.OVER);
      expect(source.getData(0).data).assertEqual(2);
      expect(source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1300
     * @tc.name appIntegrationSyncTwiceIsIdempotent1300
     * @tc.desc Verify two consecutive syncs of one rule leave an identical DataSource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncTwiceIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[3] = 8;
      values[10] = 32;
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      let first: number[] = sourceValues(source);
      syncRuleToSource(rule, source);
      let second: number[] = sourceValues(source);
      BoardKit.expectValues(second, first);
      BoardKit.expectValues(second, values);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1400
     * @tc.name appIntegrationSyncFiveRoundsStable1400
     * @tc.desc Verify five different boards mirrored in a row always land exactly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncFiveRoundsStable', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let boards: number[][] = [];
      boards.push(BoardKit.blank());
      boards.push(BoardKit.row([2, 4, 8, 16]));
      boards.push(BoardKit.overBoard());
      boards.push(BoardKit.repeatedRow([2, 0, 4, 0]));
      boards.push(BoardKit.repeatedColumn([2, 4, 8, 16]));
      let source: MyDataSource = blankSource();
      for (let round: number = 0; round < boards.length; round++) {
        let rule: GameRule = BoardKit.rule(boards[round]);
        syncRuleToSource(rule, source);
        BoardKit.expectValues(sourceValues(source), boards[round]);
        expect(source.totalCount()).assertEqual(CELLS);
      }
      expect(source.getData(0).data).assertEqual(2);
      expect(source.getData(LAST_CELL).data).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1500
     * @tc.name appIntegrationSyncOneCellChange1500
     * @tc.desc Verify a single rule cell change is the only cell the next sync rewrites
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncOneCellChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.repeatedRow([2, 4, 8, 16]));
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      let before: number[] = sourceValues(source);
      rule.dataNumbers[6] = 512;
      syncRuleToSource(rule, source);
      let after: number[] = sourceValues(source);
      expect(BoardKit.singleDifference(before, after)).assertEqual(6);
      expect(after[6]).assertEqual(512);
      expect(after[5]).assertEqual(before[5]);
      expect(after[7]).assertEqual(before[7]);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1600
     * @tc.name appIntegrationSyncTwoCellChange1600
     * @tc.desc Verify two changed rule cells produce exactly two rewritten DataSource cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncTwoCellChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      let before: number[] = sourceValues(source);
      rule.dataNumbers[3] = 128;
      rule.dataNumbers[12] = 512;
      syncRuleToSource(rule, source);
      let after: number[] = sourceValues(source);
      expect(after[3]).assertEqual(128);
      expect(after[12]).assertEqual(512);
      expect(BoardKit.singleDifference(before, after)).assertEqual(-1);
      expect(after[4]).assertEqual(0);
      expect(after[11]).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1700
     * @tc.name appIntegrationSyncAfterMerge1700
     * @tc.desc Verify a merged tile and its emptied partner both reach the DataSource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncAfterMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      rule.moveInRow('left', 0);
      syncRuleToSource(rule, source);
      expect(rule.dataNumbers[0]).assertEqual(4);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(rule.score).assertEqual(4);
      expect(source.getData(0).data).assertEqual(4);
      expect(source.getData(1).data).assertEqual(0);
      expect(source.getData(2).data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1800
     * @tc.name appIntegrationSyncOtherRowsIntact1800
     * @tc.desc Verify moving one row and syncing leaves the other three rows unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncOtherRowsIntact', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 0, 0, 0],
        [8, 0, 0, 0],
        [16, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      rule.moveInRow('left', 0);
      syncRuleToSource(rule, source);
      expect(source.getData(0).data).assertEqual(4);
      expect(source.getData(4).data).assertEqual(4);
      expect(source.getData(8).data).assertEqual(8);
      expect(source.getData(12).data).assertEqual(16);
      BoardKit.expectValues(BoardKit.rowOf(sourceValues(source), 3), [16, 0, 0, 0]);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_1900
     * @tc.name appIntegrationSyncShortRule1900
     * @tc.desc Verify a fifteen cell rule writes fifteen cells and leaves the last one alone
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_syncShortRule', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let short: DataType[] = BoardKit.data(BoardKit.zeros(15));
      short[7].data = 8;
      let rule: GameRule = new GameRule(short);
      let source: MyDataSource = blankSource();
      source.dataArray[LAST_CELL].data = 64;
      syncRuleToSource(rule, source);
      expect(source.getData(7).data).assertEqual(8);
      expect(source.getData(LAST_CELL).data).assertEqual(64);
      expect(rule.dataNumbers.length).assertEqual(15);
      expect(source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2000
     * @tc.name appIntegrationGameStartSpawnsTwoTiles2000
     * @tc.desc Verify gameStart spawns exactly two tiles and mirrors them into the DataSource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartSpawnsTwoTiles', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.gameStart();
      expect(occupiedOfSource(source)).assertEqual(2);
      expect(BoardKit.countNonZero(rule.dataNumbers)).assertEqual(2);
      BoardKit.expectValues(sourceValues(source), rule.dataNumbers);
      expect(source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2100
     * @tc.name appIntegrationGameStartSpawnValues2100
     * @tc.desc Verify gameStart only spawns tiles worth two or four
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartSpawnValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.gameStart();
      let synced: number[] = sourceValues(source);
      BoardKit.expectTileSet(synced, [0, 2, 4]);
      let large: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (synced[index] > 4) {
          large = large + 1;
        }
      }
      expect(large).assertEqual(0);
      expect(BoardKit.countNonZero(synced)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2200
     * @tc.name appIntegrationGameStartRunning2200
     * @tc.desc Verify gameStart moves both the rule and the page status into RUNNING
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      expect(bridge.gameStatus).assertEqual(GameStatus.BEFORE);
      bridge.gameStart();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(bridge.gameStatus).assertEqual(GameStatus.RUNNING);
      expect(bridge.gameStatus === GameStatus.BEFORE).assertFalse();
      expect(rule.status === 1).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2300
     * @tc.name appIntegrationGameStartZeroesScore2300
     * @tc.desc Verify gameStart resets a previously accumulated rule score to zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartZeroesScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.row([2, 2, 4, 4]));
      rule.score = 96;
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.gameStart();
      expect(rule.score).assertEqual(0);
      expect(rule.score > 0).assertFalse();
      bridge.dataView();
      expect(bridge.curScore).assertEqual(0);
      expect(occupiedOfSource(source)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2400
     * @tc.name appIntegrationGameStartTwice2400
     * @tc.desc Verify calling gameStart twice still leaves exactly two tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartTwice', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.gameStart();
      let first: number[] = sourceValues(source);
      bridge.gameStart();
      let second: number[] = sourceValues(source);
      expect(BoardKit.countNonZero(first)).assertEqual(2);
      expect(BoardKit.countNonZero(second)).assertEqual(2);
      expect(second.length).assertEqual(CELLS);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2500
     * @tc.name appIntegrationGameStartClearsDense2500
     * @tc.desc Verify gameStart wipes a dense board instead of keeping stale large tiles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartClearsDense', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dense: number[] = BoardKit.repeatedRow([16, 32, 64, 128]);
      let rule: GameRule = BoardKit.rule(dense);
      let source: MyDataSource = sourceOf(dense);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.gameStart();
      let synced: number[] = sourceValues(source);
      let stale: number = 0;
      for (let index: number = 0; index < CELLS; index++) {
        if (synced[index] === 16 || synced[index] === 32 || synced[index] === 64 || synced[index] === 128) {
          stale = stale + 1;
        }
      }
      expect(stale).assertEqual(0);
      expect(BoardKit.countNonZero(synced)).assertEqual(2);
      expect(synced.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2600
     * @tc.name appIntegrationGameStartPositions2600
     * @tc.desc Verify the spawned tiles occupy the same indices on the rule and the DataSource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartPositions', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.gameStart();
      let ruleIndices: number[] = occupiedIndices(rule.dataNumbers);
      let sourceIndices: number[] = occupiedIndices(sourceValues(source));
      expect(ruleIndices.length).assertEqual(2);
      BoardKit.expectValues(sourceIndices, ruleIndices);
      expect(sourceIndices[0] !== sourceIndices[1]).assertTrue();
      expect(sourceIndices[1] <= LAST_CELL).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2700
     * @tc.name appIntegrationGameStartAfterOver2700
     * @tc.desc Verify gameStart revives an OVER session back into RUNNING for both sides
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_gameStartAfterOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      let source: MyDataSource = sourceOf(BoardKit.overBoard());
      let bridge: PageBridge = new PageBridge(rule, source);
      rule.status = GameStatus.OVER;
      bridge.dataView();
      expect(bridge.gameStatus).assertEqual(GameStatus.OVER);
      bridge.gameStart();
      expect(rule.status).assertEqual(GameStatus.RUNNING);
      expect(bridge.gameStatus).assertEqual(GameStatus.RUNNING);
      expect(rule.isGameOver()).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2800
     * @tc.name appIntegrationDataViewRunning2800
     * @tc.desc Verify dataView copies the RUNNING status into the page status variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_dataViewRunning', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.dataView();
      expect(bridge.gameStatus).assertEqual(1);
      expect(bridge.gameStatus === GameStatus.RUNNING).assertTrue();
      BoardKit.expectValues(sourceValues(source), values);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_2900
     * @tc.name appIntegrationDataViewBefore2900
     * @tc.desc Verify a fresh bridge reports the BEFORE status through dataView
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_dataViewBefore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.blank());
      let source: MyDataSource = blankSource();
      let bridge: PageBridge = new PageBridge(rule, source);
      expect(bridge.gameStatus).assertEqual(GameStatus.BEFORE);
      bridge.dataView();
      expect(bridge.gameStatus).assertEqual(-1);
      expect(bridge.gameStatus === GameStatus.BEFORE).assertTrue();
      expect(bridge.curScore).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3000
     * @tc.name appIntegrationDataViewOver3000
     * @tc.desc Verify dataView copies the OVER status that opens the score dialog
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_dataViewOver', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let rule: GameRule = BoardKit.rule(BoardKit.overBoard());
      rule.status = GameStatus.OVER;
      rule.score = 2048;
      let source: MyDataSource = sourceOf(BoardKit.overBoard());
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.dataView();
      expect(bridge.gameStatus).assertEqual(0);
      expect(bridge.gameStatus === GameStatus.OVER).assertTrue();
      expect(bridge.curScore).assertEqual(2048);
      expect(bridge.gameStatus === GameStatus.RUNNING).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3100
     * @tc.name appIntegrationDataViewScore3100
     * @tc.desc Verify dataView copies the four points earned by a single merge
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_dataViewScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.moveLine('left', 0);
      expect(rule.score).assertEqual(4);
      bridge.dataView();
      expect(bridge.curScore).assertEqual(4);
      expect(bridge.curScore).assertEqual(rule.score);
      expect(bridge.gameStatus).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3200
     * @tc.name appIntegrationDataViewScoreAccumulates3200
     * @tc.desc Verify dataView follows a score that grows across two separate merges
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_dataViewScoreAccumulates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.moveLine('left', 0);
      bridge.dataView();
      expect(bridge.curScore).assertEqual(4);
      bridge.moveLine('left', 1);
      expect(rule.score).assertEqual(12);
      bridge.dataView();
      expect(bridge.curScore).assertEqual(12);
      expect(source.getData(4).data).assertEqual(8);
      expect(source.getData(5).data).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3300
     * @tc.name appIntegrationDataViewZeroWithoutMerge3300
     * @tc.desc Verify a move without any merge keeps the mirrored score at zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_dataViewZeroWithoutMerge', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 0, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.moveLine('left', 0);
      bridge.dataView();
      expect(rule.score).assertEqual(0);
      expect(bridge.curScore).assertEqual(0);
      expect(source.getData(0).data).assertEqual(2);
      expect(occupiedOfSource(source)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3400
     * @tc.name appIntegrationSourceEditIsolated3400
     * @tc.desc Verify editing a DataSource cell cannot reach the rule board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_sourceEditIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = sourceOf(values);
      syncRuleToSource(rule, source);
      source.getData(3).data = 999;
      expect(rule.dataNumbers[3]).assertEqual(16);
      expect(source.getData(3).data).assertEqual(999);
      expect(sourceValues(source)).assertContain(999);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3500
     * @tc.name appIntegrationNextSyncRepairsSource3500
     * @tc.desc Verify the next dataView overwrites a tampered DataSource cell with the rule value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_nextSyncRepairsSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.dataView();
      source.getData(3).data = 999;
      expect(source.getData(3).data === rule.dataNumbers[3]).assertFalse();
      bridge.dataView();
      expect(source.getData(3).data).assertEqual(16);
      BoardKit.expectValues(sourceValues(source), values);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3600
     * @tc.name appIntegrationReplacedCellIsolated3600
     * @tc.desc Verify swapping a whole DataType object out of the DataSource cannot reach the rule
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_replacedCellIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = sourceOf(values);
      syncRuleToSource(rule, source);
      source.dataArray[5] = new DataType(5, 777);
      expect(rule.dataNumbers[5]).assertEqual(0);
      expect(source.getData(5).data).assertEqual(777);
      syncRuleToSource(rule, source);
      expect(source.getData(5).data).assertEqual(rule.dataNumbers[5]);
      expect(source.getData(5).id).assertEqual(5);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3700
     * @tc.name appIntegrationSlotIdEditIsolated3700
     * @tc.desc Verify an id edited on the DataSource is not rewritten by the mirror
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_slotIdEditIsolated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = sourceOf(values);
      source.getData(6).id = 42;
      syncRuleToSource(rule, source);
      expect(source.getData(6).id).assertEqual(42);
      expect(source.getData(6).data).assertEqual(0);
      expect(rule.dataNumbers[6]).assertEqual(0);
      let found: DataType | null = findCellById(source, 42);
      expect(found !== null).assertTrue();
      expect(sourceIds(source)).assertContain(42);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3800
     * @tc.name appIntegrationMoveThenSyncKeepsIds3800
     * @tc.desc Verify a move followed by dataView keeps all sixteen DataSource ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_moveThenSyncKeepsIds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.moveLine('left', 0);
      bridge.dataView();
      let expectedIds: number[] = [];
      for (let index: number = 0; index < CELLS; index++) {
        expectedIds.push(index);
      }
      BoardKit.expectValues(sourceIds(source), expectedIds);
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(0).data).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_3900
     * @tc.name appIntegrationMergeFreeMoveSync3900
     * @tc.desc Verify a merge free move syncs the shifted board with a zero score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_mergeFreeMoveSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[1] = 8;
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.moveLine('left', 0);
      bridge.dataView();
      expect(rule.dataNumbers[0]).assertEqual(8);
      expect(rule.dataNumbers[1]).assertEqual(0);
      expect(bridge.curScore).assertEqual(0);
      expect(source.getData(0).data).assertEqual(8);
      expect(occupiedOfSource(source)).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_4000
     * @tc.name appIntegrationFourRowMoveSync4000
     * @tc.desc Verify four merges in one gesture sync a sixty point score and four rows
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_fourRowMoveSync', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.rows([
        [2, 2, 0, 0],
        [4, 4, 0, 0],
        [8, 8, 0, 0],
        [16, 16, 0, 0]
      ]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      for (let line: number = 0; line < LINES; line++) {
        bridge.moveLine('left', line);
      }
      expect(rule.score).assertEqual(60);
      bridge.dataView();
      expect(bridge.curScore).assertEqual(60);
      BoardKit.expectValues(sourceValues(source), [4, 0, 0, 0, 8, 0, 0, 0, 16, 0, 0, 0, 32, 0, 0, 0]);
      expect(occupiedOfSource(source)).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_4100
     * @tc.name appIntegrationRestartAfterScoredSession4100
     * @tc.desc Verify a restart after a scored session clears the mirrored score and board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_restartAfterScoredSession', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 2, 0, 0]);
      let rule: GameRule = BoardKit.rule(values);
      rule.status = GameStatus.RUNNING;
      let source: MyDataSource = sourceOf(values);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.moveLine('left', 0);
      bridge.dataView();
      expect(bridge.curScore).assertEqual(4);
      bridge.gameStart();
      expect(rule.score).assertEqual(0);
      bridge.dataView();
      expect(bridge.curScore).assertEqual(0);
      expect(bridge.gameStatus).assertEqual(GameStatus.RUNNING);
      expect(occupiedOfSource(source)).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_4200
     * @tc.name appIntegrationRestartKeepsSixteenSlots4200
     * @tc.desc Verify a restart keeps sixteen DataSource slots with index based ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_restartKeepsSixteenSlots', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let dense: number[] = BoardKit.overBoard();
      let rule: GameRule = BoardKit.rule(dense);
      let source: MyDataSource = sourceOf(dense);
      let bridge: PageBridge = new PageBridge(rule, source);
      bridge.gameStart();
      expect(source.totalCount()).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(source.getData(index).id).assertEqual(index);
      }
      expect(BoardKit.countNonZero(sourceValues(source))).assertEqual(2);
      expect(rule.dataNumbers.length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_4300
     * @tc.name appIntegrationOutOfRangeCell4300
     * @tc.desc Verify the mirror never adds a seventeenth slot beyond the board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_outOfRangeCell', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.blank();
      values[FIRST_CELL] = 2;
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      let outside: DataType | undefined = source.getData(CELLS);
      expect(outside).assertUndefined();
      expect(source.totalCount()).assertEqual(CELLS);
      expect(source.getData(LAST_CELL).id).assertEqual(LAST_CELL);
    });

    /**
     * @tc.number SUB_GAME2048_APPINTEGRATION_4400
     * @tc.name appIntegrationUnknownIdLookup4400
     * @tc.desc Verify an id that the board never uses resolves to null after sync
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appIntegration_unknownIdLookup', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let rule: GameRule = BoardKit.rule(values);
      let source: MyDataSource = blankSource();
      syncRuleToSource(rule, source);
      let missing: DataType | null = findCellById(source, 99);
      expect(missing).assertNull();
      let present: DataType | null = findCellById(source, 7);
      expect(present !== null).assertTrue();
      let cell: DataType = present as DataType;
      expect(cell.data).assertEqual(0);
      expect(cell.id).assertEqual(7);
    });
  });
}
