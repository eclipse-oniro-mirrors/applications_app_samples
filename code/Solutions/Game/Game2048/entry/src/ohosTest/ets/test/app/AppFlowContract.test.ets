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
import { DataType, MyDataSource } from '../../../../main/ets/model/GameModuel';
import { GameStatus } from '../../../../main/ets/muck/GameData';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/** 套件名，与 describe 的第一个参数保持一致。 */
const SUITE_NAME: string = 'appFlowContractTest';
/** 生产代码使用的三个存储键。 */
const KEY_GAME_DATA: string = 'gameData';
const KEY_SCORE: string = 'score';
const KEY_STATUS: string = 'gameStatus';

/**
 * 文件内的内存存储，替代 data_preferences。
 *
 * 只提供 put / has / get / flush 四个被 handleLocalData 用到的入口，并把
 * 每个入口的调用次数单独计数，于是「写几次、刷几次、读几次、有没有越权
 * 读」都能直接断言，而不依赖真实文件系统。
 */
class MemoryStore {
  private entries: Map<string, string> = new Map<string, string>();
  putCalls: number = 0;
  flushCalls: number = 0;
  hasCalls: number = 0;
  getCalls: number = 0;

  put(key: string, value: string): void {
    this.entries.set(key, value);
    this.putCalls = this.putCalls + 1;
  }

  has(key: string): boolean {
    this.hasCalls = this.hasCalls + 1;
    return this.entries.has(key);
  }

  get(key: string): string | null {
    this.getCalls = this.getCalls + 1;
    if (this.entries.has(key)) {
      return this.entries.get(key) as string;
    }
    return null;
  }

  flush(): void {
    this.flushCalls = this.flushCalls + 1;
  }

  keyCount(): number {
    return this.entries.size;
  }

  keys(): string[] {
    let list: string[] = [];
    this.entries.forEach((value: string, key: string) => {
      list.push(key);
    });
    return list;
  }

  resetCounters(): void {
    this.putCalls = 0;
    this.flushCalls = 0;
    this.hasCalls = 0;
    this.getCalls = 0;
  }

  totalCalls(): number {
    return this.putCalls + this.flushCalls + this.hasCalls + this.getCalls;
  }
}

/**
 * handleLocalData 读写的三项页面数据。三个字段都允许 undefined，用来
 * 复现生产守卫 `score === undefined || status === undefined ||
 * dataNumbers === undefined` 的三条提前返回路径。
 */
class LocalState {
  score: number | undefined = undefined;
  status: number | undefined = undefined;
  dataNumbers: number[] | undefined = undefined;
  source: MyDataSource;

  constructor(score: number | undefined, status: number | undefined, numbers: number[] | undefined) {
    this.score = score;
    this.status = status;
    this.dataNumbers = numbers;
    let seed: number[] = numbers === undefined ? BoardKit.blank() : numbers;
    this.source = new MyDataSource(BoardKit.data(seed));
  }
}

/**
 * 复刻 Index.ets 的 handleLocalData。
 *
 * 顺序与生产完全一致：先执行三项 undefined 守卫，再按 method 分派。
 * 'put' 写 gameData / score / gameStatus 三个键并 flush 一次；'has' 只在
 * gameData 存在时读取三个键，并把盘面同时写回规则数组与 DataSource。
 * 其余 method（包括大小写不同的写法）既不写也不读。
 */
function handleLocalData(store: MemoryStore, state: LocalState, method: string): boolean {
  if (state.score === undefined || state.status === undefined || state.dataNumbers === undefined) {
    return false;
  }
  let numbers: number[] = state.dataNumbers as number[];
  let score: number = state.score as number;
  let status: number = state.status as number;
  if (method === 'put') {
    store.put(KEY_GAME_DATA, JSON.stringify(state.source));
    store.put(KEY_SCORE, score.toString());
    store.put(KEY_STATUS, status.toString());
    store.flush();
    return true;
  } else if (method === 'has') {
    if (store.has(KEY_GAME_DATA)) {
      state.score = Number(store.get(KEY_SCORE) as string);
      state.status = Number(store.get(KEY_STATUS) as string);
      let restored: MyDataSource = JSON.parse(store.get(KEY_GAME_DATA) as string) as MyDataSource;
      let cells: DataType[] = restored.dataArray;
      for (let index: number = 0; index < cells.length; index++) {
        numbers[index] = cells[index].data;
        state.source.dataArray[index].data = cells[index].data;
      }
      return true;
    }
    return false;
  }
  return false;
}

/** 一条带有三颗已知棋子、其余为空的中局盘面。 */
function readyBoard(): number[] {
  let numbers: number[] = BoardKit.blank();
  numbers[0] = 2;
  numbers[5] = 4;
  numbers[15] = 8;
  return numbers;
}

/** 读取 LocalState 持有的规则数组。 */
function boardOfState(state: LocalState): number[] {
  return state.dataNumbers as number[];
}

/** 读取 LocalState 的 DataSource 镜像。 */
function boardOfSource(state: LocalState): number[] {
  let values: number[] = [];
  for (let index: number = 0; index < state.source.totalCount(); index++) {
    values.push(state.source.getData(index).data);
  }
  return values;
}

/** 取 gameData 文本，缺失时返回空串。 */
function gameText(store: MemoryStore): string {
  let text: string | null = store.get(KEY_GAME_DATA);
  return text === null ? '' : text;
}

/** 把 gameData 文本还原成盘面数组。 */
function decodedBoard(store: MemoryStore): number[] {
  let text: string = gameText(store);
  if (text === '') {
    return [];
  }
  let restored: MyDataSource = JSON.parse(text) as MyDataSource;
  let cells: DataType[] = restored.dataArray;
  let values: number[] = [];
  for (let index: number = 0; index < cells.length; index++) {
    values.push(cells[index].data);
  }
  return values;
}

/** 先用一次 put 预置存储，再清零计数，便于断言 has 分支的读写次数。 */
function storeFrom(state: LocalState): MemoryStore {
  let store: MemoryStore = new MemoryStore();
  handleLocalData(store, state, 'put');
  store.resetCounters();
  return store;
}

/**
 * handleLocalData 方法分支契约套件。
 *
 * 生产代码把落盘与读盘压在一个方法里，靠 method 字符串分派，并在最前面
 * 用三个 undefined 判断短路。本套件用文件内 MemoryStore 复刻这条分支，
 * 逐条固化「put 写三个键并 flush」「has 读三个键」「守卫先于分派」
 * 「未知 method 不写不读」四类契约。真实 preferences 由 Persistence
 * 与 SessionPersistence 套件覆盖，这里不触碰文件系统。
 */
export default function appFlowContractTest() {
  describe('appFlowContractTest', () => {
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
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0100
     * @tc.name appFlowPutWritesGameDataKey0100
     * @tc.desc Verify the put branch stores a gameData entry alongside the two scalar keys
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putWritesGameDataKey', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      expect(handleLocalData(store, state, 'put')).assertTrue();
      expect(store.has(KEY_GAME_DATA)).assertTrue();
      expect(store.keyCount()).assertEqual(3);
      expect(store.keys()).assertContain(KEY_GAME_DATA);
      expect(store.putCalls).assertEqual(3);
      BoardKit.log(SUITE_NAME, 'put wrote three keys');
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0200
     * @tc.name appFlowPutStoresScoreAsString0200
     * @tc.desc Verify the score key holds the decimal text of the score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putStoresScoreAsString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      expect(store.get(KEY_SCORE)).assertEqual('16');
      expect(typeof store.get(KEY_SCORE)).assertEqual('string');
      expect(Number(store.get(KEY_SCORE) as string)).assertEqual(16);
      expect(store.getCalls).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0300
     * @tc.name appFlowPutStoresStatusAsString0300
     * @tc.desc Verify the gameStatus key holds the decimal text of the status code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putStoresStatusAsString', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(8, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      expect(store.get(KEY_STATUS)).assertEqual('1');
      expect(store.get(KEY_STATUS)).assertEqual(GameStatus.RUNNING.toString());
      expect(Number(store.get(KEY_STATUS) as string)).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0400
     * @tc.name appFlowPutStoresZeroScore0400
     * @tc.desc Verify a zero score is written as the single character zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putStoresZeroScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(0, GameStatus.RUNNING, BoardKit.blank());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      expect(store.get(KEY_SCORE)).assertEqual('0');
      expect((store.get(KEY_SCORE) as string).length).assertEqual(1);
      expect(Number(store.get(KEY_SCORE) as string)).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0500
     * @tc.name appFlowPutStoresBeforeStatus0500
     * @tc.desc Verify the negative BEFORE status keeps its minus sign in text form
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putStoresBeforeStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      expect(store.get(KEY_STATUS)).assertEqual('-1');
      expect((store.get(KEY_STATUS) as string).indexOf('-') >= 0).assertTrue();
      expect(Number(store.get(KEY_STATUS) as string)).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0600
     * @tc.name appFlowPutFlushesOnce0600
     * @tc.desc Verify the put branch flushes the store exactly once after three writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putFlushesOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(32, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      expect(store.flushCalls).assertEqual(1);
      expect(store.putCalls).assertEqual(3);
      expect(store.totalCalls()).assertEqual(4);
      expect(store.putCalls > store.flushCalls).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0700
     * @tc.name appFlowPutCallsThreeWrites0700
     * @tc.desc Verify the put branch performs exactly three store writes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putCallsThreeWrites', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(64, GameStatus.OVER, BoardKit.overBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      expect(store.putCalls).assertEqual(3);
      expect(store.keyCount()).assertEqual(3);
      expect(store.keys()).assertContain(KEY_SCORE);
      expect(store.keys()).assertContain(KEY_STATUS);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0800
     * @tc.name appFlowPutNeverReads0800
     * @tc.desc Verify the put branch performs no has or get lookup at all
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putNeverReads', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      expect(store.hasCalls).assertEqual(0);
      expect(store.getCalls).assertEqual(0);
      expect(store.totalCalls()).assertEqual(4);
      expect(state.score).assertEqual(16);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_0900
     * @tc.name appFlowPutReturnsTrue0900
     * @tc.desc Verify a guarded put reports success to its caller
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putReturnsTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      let store: MemoryStore = new MemoryStore();
      let written: boolean = handleLocalData(store, state, 'put');
      expect(written).assertTrue();
      expect(written === false).assertFalse();
      expect(store.keyCount() === 3).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1000
     * @tc.name appFlowPutGameDataHoldsSixteenCells1000
     * @tc.desc Verify the serialized gameData still describes sixteen board cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putGameDataHoldsSixteenCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      let decoded: number[] = decodedBoard(store);
      expect(decoded.length).assertEqual(CELLS);
      BoardKit.expectValues(decoded, readyBoard());
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1100
     * @tc.name appFlowPutGameDataKeepsValues1100
     * @tc.desc Verify three known tiles survive the gameData round trip at their own cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putGameDataKeepsValues', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      let decoded: number[] = decodedBoard(store);
      expect(decoded[0]).assertEqual(2);
      expect(decoded[5]).assertEqual(4);
      expect(decoded[15]).assertEqual(8);
      expect(BoardKit.countNonZero(decoded)).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1200
     * @tc.name appFlowPutKeySetIsThree1200
     * @tc.desc Verify the put branch never introduces a fourth key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putKeySetIsThree', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      let keys: string[] = store.keys();
      expect(keys.length).assertEqual(3);
      expect(keys).assertContain(KEY_GAME_DATA);
      expect(keys).assertContain(KEY_SCORE);
      expect(keys).assertContain(KEY_STATUS);
      expect(store.keyCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1300
     * @tc.name appFlowPutOverwritesGameData1300
     * @tc.desc Verify a second put replaces the stored board instead of appending
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putOverwritesGameData', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let first: LocalState = new LocalState(8, GameStatus.RUNNING, BoardKit.row([2, 4, 8, 16]));
      handleLocalData(store, first, 'put');
      let second: LocalState = new LocalState(16, GameStatus.RUNNING, BoardKit.row([32, 64, 128, 256]));
      handleLocalData(store, second, 'put');
      let decoded: number[] = decodedBoard(store);
      BoardKit.expectValues(decoded, BoardKit.row([32, 64, 128, 256]));
      expect(decoded[0]).assertEqual(32);
      expect(store.keyCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1400
     * @tc.name appFlowPutOverwritesScore1400
     * @tc.desc Verify a second put replaces the stored score text
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putOverwritesScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      handleLocalData(store, state, 'put');
      expect(store.get(KEY_SCORE)).assertEqual('16');
      state.score = 48;
      handleLocalData(store, state, 'put');
      expect(store.get(KEY_SCORE)).assertEqual('48');
      expect(store.keyCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1500
     * @tc.name appFlowPutThreeRounds1500
     * @tc.desc Verify three puts write nine times while the key set stays at three
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putThreeRounds', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let state: LocalState = new LocalState(0, GameStatus.RUNNING, readyBoard());
      let scores: number[] = [8, 16, 24];
      for (let round: number = 0; round < scores.length; round++) {
        state.score = scores[round];
        handleLocalData(store, state, 'put');
      }
      expect(store.putCalls).assertEqual(9);
      expect(store.flushCalls).assertEqual(3);
      expect(store.keyCount()).assertEqual(3);
      expect(store.get(KEY_SCORE)).assertEqual('24');
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1600
     * @tc.name appFlowPutEmptyBoard1600
     * @tc.desc Verify an empty board is stored as sixteen zero cells with a zero score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putEmptyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      let store: MemoryStore = new MemoryStore();
      handleLocalData(store, state, 'put');
      let decoded: number[] = decodedBoard(store);
      expect(decoded.length).assertEqual(CELLS);
      BoardKit.expectAllZeros(decoded);
      expect(store.get(KEY_SCORE)).assertEqual('0');
      expect(store.get(KEY_STATUS)).assertEqual('-1');
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1700
     * @tc.name appFlowHasRestoresScore1700
     * @tc.desc Verify the has branch replaces the live score with the stored score
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasRestoresScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(64, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      expect(handleLocalData(store, target, 'has')).assertTrue();
      expect(target.score).assertEqual(64);
      expect(target.score === 0).assertFalse();
      expect(Number(store.get(KEY_SCORE) as string)).assertEqual(64);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1800
     * @tc.name appFlowHasRestoresStatus1800
     * @tc.desc Verify the has branch restores an OVER status from its text key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasRestoresStatus', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(2048, GameStatus.OVER, BoardKit.overBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      expect(target.status).assertEqual(GameStatus.OVER);
      expect(target.status === 0).assertTrue();
      expect(target.status === GameStatus.RUNNING).assertFalse();
      expect(target.score).assertEqual(2048);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_1900
     * @tc.name appFlowHasRestoresBoardArray1900
     * @tc.desc Verify the has branch writes every stored cell back into the rule array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasRestoresBoardArray', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(16, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      BoardKit.expectValues(boardOfState(target), readyBoard());
      expect(boardOfState(target)[0]).assertEqual(2);
      expect(boardOfState(target)[15]).assertEqual(8);
      expect(boardOfState(target).length).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2000
     * @tc.name appFlowHasMirrorsSource2000
     * @tc.desc Verify the has branch also mirrors the restored board into the DataSource
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasMirrorsSource', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(16, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      BoardKit.expectValues(boardOfSource(target), readyBoard());
      expect(target.source.getData(5).data).assertEqual(4);
      expect(target.source.totalCount()).assertEqual(CELLS);
      expect(BoardKit.countNonZero(boardOfSource(target))).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2100
     * @tc.name appFlowHasReadsThreeKeys2100
     * @tc.desc Verify the has branch performs one has check and three reads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasReadsThreeKeys', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(32, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      expect(store.hasCalls).assertEqual(1);
      expect(store.getCalls).assertEqual(3);
      expect(store.totalCalls()).assertEqual(4);
      expect(store.putCalls).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2200
     * @tc.name appFlowHasWritesNothing2200
     * @tc.desc Verify the has branch never writes or flushes the store
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasWritesNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(32, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      expect(store.putCalls).assertEqual(0);
      expect(store.flushCalls).assertEqual(0);
      expect(store.keyCount()).assertEqual(3);
      expect(store.totalCalls()).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2300
     * @tc.name appFlowHasReturnsTrue2300
     * @tc.desc Verify a has call with stored gameData reports success
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasReturnsTrue', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(4, GameStatus.RUNNING, BoardKit.row([2, 2, 0, 0])));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      let restored: boolean = handleLocalData(store, target, 'has');
      expect(restored).assertTrue();
      expect(restored === false).assertFalse();
      expect(target.score).assertEqual(4);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2400
     * @tc.name appFlowHasReturnsFalseWhenMissing2400
     * @tc.desc Verify an empty store makes the has branch return false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasReturnsFalseWhenMissing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, readyBoard());
      let restored: boolean = handleLocalData(store, target, 'has');
      expect(restored).assertFalse();
      expect(store.hasCalls).assertEqual(1);
      expect(store.getCalls).assertEqual(0);
      expect(target.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2500
     * @tc.name appFlowHasMissingKeepsScore2500
     * @tc.desc Verify a missing gameData leaves the live score untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasMissingKeepsScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let target: LocalState = new LocalState(7, GameStatus.RUNNING, readyBoard());
      handleLocalData(store, target, 'has');
      expect(target.score).assertEqual(7);
      expect(target.status).assertEqual(GameStatus.RUNNING);
      expect(target.score === 7).assertTrue();
      expect(target.score === 0).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2600
     * @tc.name appFlowHasMissingKeepsBoard2600
     * @tc.desc Verify a missing gameData leaves both the rule array and the DataSource untouched
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasMissingKeepsBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let values: number[] = BoardKit.row([2, 4, 8, 16]);
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, values);
      handleLocalData(store, target, 'has');
      BoardKit.expectValues(boardOfState(target), values);
      BoardKit.expectValues(boardOfSource(target), values);
      expect(boardOfState(target)[0]).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2700
     * @tc.name appFlowHasMissingLeavesStoreEmpty2700
     * @tc.desc Verify a failed has call neither creates keys nor reads past the has check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasMissingLeavesStoreEmpty', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      expect(store.keyCount()).assertEqual(0);
      expect(store.hasCalls).assertEqual(1);
      expect(store.getCalls).assertEqual(0);
      expect(store.totalCalls()).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2800
     * @tc.name appFlowHasTwiceIsIdempotent2800
     * @tc.desc Verify restoring twice yields the same state and doubles the read count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasTwiceIsIdempotent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(128, GameStatus.RUNNING, readyBoard()));
      let first: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      let second: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, first, 'has');
      handleLocalData(store, second, 'has');
      expect(first.score).assertEqual(second.score);
      expect(first.status).assertEqual(second.status);
      BoardKit.expectValues(boardOfState(second), boardOfState(first));
      expect(store.getCalls).assertEqual(6);
      expect(store.hasCalls).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_2900
     * @tc.name appFlowPutThenHasRoundTrip2900
     * @tc.desc Verify a put followed by a has restores score, status and board together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_putThenHasRoundTrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let origin: LocalState = new LocalState(48, GameStatus.OVER, readyBoard());
      handleLocalData(store, origin, 'put');
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      expect(target.score).assertEqual(48);
      expect(target.status).assertEqual(GameStatus.OVER);
      BoardKit.expectValues(boardOfState(target), readyBoard());
      BoardKit.expectValues(boardOfSource(target), readyBoard());
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3000
     * @tc.name appFlowHasDenseBoard3000
     * @tc.desc Verify a dense stored board comes back with sixteen occupied cells
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasDenseBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(0, GameStatus.RUNNING, BoardKit.overBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      let board: number[] = boardOfState(target);
      expect(board.length).assertEqual(CELLS);
      BoardKit.expectNoZero(board);
      expect(BoardKit.countNonZero(board)).assertEqual(CELLS);
      expect(BoardKit.sum(board) > 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3100
     * @tc.name appFlowHasEmptyBoard3100
     * @tc.desc Verify a stored empty board clears a previously dense live board
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasEmptyBoard', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(0, GameStatus.BEFORE, BoardKit.blank()));
      let target: LocalState = new LocalState(512, GameStatus.OVER, BoardKit.overBoard());
      handleLocalData(store, target, 'has');
      BoardKit.expectAllZeros(boardOfState(target));
      BoardKit.expectAllZeros(boardOfSource(target));
      expect(target.score).assertEqual(0);
      expect(target.status).assertEqual(GameStatus.BEFORE);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3200
     * @tc.name appFlowHasLargeScore3200
     * @tc.desc Verify a six digit stored score is converted back to the same number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_hasLargeScore', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(123456, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      handleLocalData(store, target, 'has');
      let restoredScore: number = target.score === undefined ? -1 : target.score;
      expect(restoredScore).assertEqual(123456);
      expect(restoredScore > 100000).assertTrue();
      expect(store.get(KEY_SCORE)).assertEqual('123456');
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3300
     * @tc.name appFlowGuardUndefinedScorePut3300
     * @tc.desc Verify an undefined score short circuits the put branch before any write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_guardUndefinedScorePut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(undefined, GameStatus.RUNNING, readyBoard());
      let store: MemoryStore = new MemoryStore();
      expect(handleLocalData(store, state, 'put')).assertFalse();
      expect(store.putCalls).assertEqual(0);
      expect(store.flushCalls).assertEqual(0);
      expect(store.keyCount()).assertEqual(0);
      expect(state.score).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3400
     * @tc.name appFlowGuardUndefinedStatusPut3400
     * @tc.desc Verify an undefined status short circuits the put branch before any write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_guardUndefinedStatusPut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, undefined, readyBoard());
      let store: MemoryStore = new MemoryStore();
      expect(handleLocalData(store, state, 'put')).assertFalse();
      expect(store.putCalls).assertEqual(0);
      expect(store.flushCalls).assertEqual(0);
      expect(store.has(KEY_GAME_DATA)).assertFalse();
      expect(state.status).assertUndefined();
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3500
     * @tc.name appFlowGuardUndefinedDataNumbersPut3500
     * @tc.desc Verify an undefined board short circuits the put branch before any write
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_guardUndefinedDataNumbersPut', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, undefined);
      let store: MemoryStore = new MemoryStore();
      expect(handleLocalData(store, state, 'put')).assertFalse();
      expect(store.putCalls).assertEqual(0);
      expect(store.keyCount()).assertEqual(0);
      expect(state.dataNumbers).assertUndefined();
      expect(state.source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3600
     * @tc.name appFlowGuardUndefinedScoreHas3600
     * @tc.desc Verify an undefined score blocks the has branch before the has lookup
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_guardUndefinedScoreHas', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(64, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(undefined, GameStatus.BEFORE, BoardKit.blank());
      expect(handleLocalData(store, target, 'has')).assertFalse();
      expect(store.hasCalls).assertEqual(0);
      expect(store.getCalls).assertEqual(0);
      expect(target.score).assertUndefined();
      BoardKit.expectAllZeros(boardOfState(target));
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3700
     * @tc.name appFlowUnknownMethodWritesNothing3700
     * @tc.desc Verify an unknown method string neither writes nor flushes
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_unknownMethodWritesNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      expect(handleLocalData(store, state, 'save')).assertFalse();
      expect(store.putCalls).assertEqual(0);
      expect(store.flushCalls).assertEqual(0);
      expect(store.keyCount()).assertEqual(0);
      expect(store.totalCalls()).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3800
     * @tc.name appFlowUnknownMethodReadsNothing3800
     * @tc.desc Verify an unknown method does not even read an already stored session
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_unknownMethodReadsNothing', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = storeFrom(new LocalState(64, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      expect(handleLocalData(store, target, 'restore')).assertFalse();
      expect(store.hasCalls).assertEqual(0);
      expect(store.getCalls).assertEqual(0);
      expect(target.score).assertEqual(0);
      expect(store.keyCount()).assertEqual(3);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_3900
     * @tc.name appFlowMethodLiteralsAreCaseSensitive3900
     * @tc.desc Verify uppercase variants of put and has never reach either branch
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_methodLiteralsAreCaseSensitive', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let upperStore: MemoryStore = new MemoryStore();
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      expect(handleLocalData(upperStore, state, 'PUT')).assertFalse();
      expect(upperStore.putCalls).assertEqual(0);
      let seeded: MemoryStore = storeFrom(new LocalState(64, GameStatus.RUNNING, readyBoard()));
      let target: LocalState = new LocalState(0, GameStatus.BEFORE, BoardKit.blank());
      expect(handleLocalData(seeded, target, 'Has')).assertFalse();
      expect(seeded.hasCalls).assertEqual(0);
      expect(target.score).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_4000
     * @tc.name appFlowEmptyMethodIsUnknown4000
     * @tc.desc Verify an empty method string is treated as unknown and touches nothing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_emptyMethodIsUnknown', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      expect(handleLocalData(store, state, '')).assertFalse();
      expect(store.totalCalls()).assertEqual(0);
      expect(store.keyCount()).assertEqual(0);
      expect(state.score).assertEqual(16);
      expect(state.status).assertEqual(GameStatus.RUNNING);
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_4100
     * @tc.name appFlowJsonHasDataArrayWrapper4100
     * @tc.desc Verify the stored gameData text wraps the cells under a dataArray key
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_jsonHasDataArrayWrapper', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let state: LocalState = new LocalState(16, GameStatus.RUNNING, readyBoard());
      handleLocalData(store, state, 'put');
      let text: string = gameText(store);
      expect(text).assertContain('"dataArray"');
      expect(text).assertContain('"id"');
      expect(text).assertContain('"data"');
      expect(text.length > CELLS).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_APPFLOWCONTRACT_4200
     * @tc.name appFlowJsonRoundTripKeepsCells4200
     * @tc.desc Verify a stored board parses back to sixteen cells with index based ids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('appFlow_jsonRoundTripKeepsCells', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let store: MemoryStore = new MemoryStore();
      let values: number[] = BoardKit.repeatedRow([16, 0, 32, 0]);
      let state: LocalState = new LocalState(512, GameStatus.RUNNING, values);
      handleLocalData(store, state, 'put');
      let restored: MyDataSource = JSON.parse(gameText(store)) as MyDataSource;
      expect(restored.dataArray.length).assertEqual(CELLS);
      for (let index: number = 0; index < CELLS; index++) {
        expect(restored.dataArray[index].data).assertEqual(values[index]);
        expect(restored.dataArray[index].id).assertEqual(index);
      }
      expect(BoardKit.countNonZero(decodedBoard(store))).assertEqual(8);
    });
  });
}
