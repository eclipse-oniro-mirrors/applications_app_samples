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
import { MyDataSource } from '../../../../main/ets/model/GameModuel';
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/**
 * 通知种类与监听器数量的组合矩阵测试套件。
 *
 * 生产实现的三个通知方法各自只调用一个回调：notifyDataReload 调 onDataReloaded，
 * notifyDataAdd 调 onDataAdded，notifyDataChange 调 onDataChanged，随后者的新名
 * 回调（onDataAdd / onDataChange）不会被这些方法触发。本套件按监听器个数与索引
 * 取值两个维度逐格固化“谁被调用、被调用几次、携带哪个索引”，不涉及登记注销顺序。
 */

/**
 * 记录十种回调次数与索引账本的监听器实现。
 * 新旧两套回调名分别计数，用来证明通知方法实际命中哪一个名字。
 */
class CountListener implements DataChangeListener {
  public tag: string = '';
  public reloadCount: number = 0;
  public addCount: number = 0;
  public addedCount: number = 0;
  public changeCount: number = 0;
  public changedCount: number = 0;
  public moveCount: number = 0;
  public deleteCount: number = 0;
  public datasetChangeCount: number = 0;
  public addIndexes: number[] = [];
  public addedIndexes: number[] = [];
  public changeIndexes: number[] = [];
  public changedIndexes: number[] = [];

  constructor(tag: string) {
    this.tag = tag;
  }

  onDataReloaded(): void {
    this.reloadCount = this.reloadCount + 1;
  }

  onDataAdded(index: number): void {
    this.addedCount = this.addedCount + 1;
    this.addedIndexes.push(index);
  }

  onDataAdd(index: number): void {
    this.addCount = this.addCount + 1;
    this.addIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveCount = this.moveCount + 1;
  }

  onDataMove(from: number, to: number): void {
    this.moveCount = this.moveCount + 1;
  }

  onDataDeleted(index: number): void {
    this.deleteCount = this.deleteCount + 1;
  }

  onDataDelete(index: number): void {
    this.deleteCount = this.deleteCount + 1;
  }

  onDataChanged(index: number): void {
    this.changedCount = this.changedCount + 1;
    this.changedIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changeCount = this.changeCount + 1;
    this.changeIndexes.push(index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetChangeCount = this.datasetChangeCount + 1;
  }
}

/**
 * 构造一个十六格数据源，通知测试不依赖具体棋盘数值。
 */
function blankSource(): MyDataSource {
  return new MyDataSource(BoardKit.data(BoardKit.blank()));
}

/**
 * 按入参顺序逐个登记监听器。
 */
function attachAll(source: MyDataSource, listeners: DataChangeListener[]): void {
  for (let index: number = 0; index < listeners.length; index++) {
    source.registerDataChangeListener(listeners[index]);
  }
}

/**
 * 返回索引账本在指定位置的记录，位置从未写入时返回 null。
 */
function entryAt(ledger: number[], position: number): number | null {
  if (position < 0 || position >= ledger.length) {
    return null;
  }
  return ledger[position];
}

/**
 * MyDataSource 通知矩阵测试套件。
 */
export default function myDataSourceNotificationMatrixTest() {
  describe('myDataSourceNotificationMatrixTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('myDataSourceNotificationMatrixTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('myDataSourceNotificationMatrixTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0100
     * @tc.name oneListenerReceivesReload0100
     * @tc.desc Verify one registered listener receives a single reload callback and no other kind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_oneListenerReceivesReload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.addedCount).assertEqual(0);
      expect(listener.changedCount).assertEqual(0);
      expect(listener.datasetChangeCount).assertEqual(0);
      BoardKit.log('matrix_oneListenerReceivesReload', 'reload=' + listener.reloadCount);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0200
     * @tc.name oneListenerReceivesAdd0200
     * @tc.desc Verify one registered listener receives an add callback carrying index five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_oneListenerReceivesAdd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      expect(listener.addedCount).assertEqual(1);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(5);
      expect(listener.addCount).assertEqual(0);
      BoardKit.log('matrix_oneListenerReceivesAdd', 'index=' + listener.addedIndexes[0]);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0300
     * @tc.name oneListenerReceivesChange0300
     * @tc.desc Verify one registered listener receives a change callback carrying index five
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_oneListenerReceivesChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(5);
      expect(listener.changedCount).assertEqual(1);
      expect(listener.changedIndexes.length).assertEqual(1);
      expect(listener.changedIndexes[0]).assertEqual(5);
      expect(listener.changeCount).assertEqual(0);
      BoardKit.log('matrix_oneListenerReceivesChange', 'index=' + listener.changedIndexes[0]);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0400
     * @tc.name twoListenersBothReceiveReload0400
     * @tc.desc Verify a reload reaches both of two registered listeners exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoListenersBothReceiveReload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      attachAll(source, [alpha, beta]);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(1);
      expect(alpha.reloadCount + beta.reloadCount).assertEqual(2);
      BoardKit.log('matrix_twoListenersBothReceiveReload', 'two listeners, two callbacks');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0500
     * @tc.name twoListenersBothReceiveAdd0500
     * @tc.desc Verify an add at index two reaches both listeners with the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoListenersBothReceiveAdd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      attachAll(source, [alpha, beta]);
      source.notifyDataAdd(2);
      expect(alpha.addedIndexes[0]).assertEqual(2);
      expect(beta.addedIndexes[0]).assertEqual(2);
      expect(alpha.addedCount).assertEqual(1);
      expect(beta.addedCount).assertEqual(1);
      BoardKit.log('matrix_twoListenersBothReceiveAdd', 'shared index 2');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0600
     * @tc.name twoListenersBothReceiveChange0600
     * @tc.desc Verify a change at index nine reaches both listeners with independent ledgers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoListenersBothReceiveChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      attachAll(source, [alpha, beta]);
      source.notifyDataChange(9);
      expect(alpha.changedIndexes.length).assertEqual(1);
      expect(beta.changedIndexes.length).assertEqual(1);
      expect(alpha.changedIndexes[0]).assertEqual(9);
      expect(beta.changedIndexes[0]).assertEqual(9);
      BoardKit.log('matrix_twoListenersBothReceiveChange', 'shared index 9');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0700
     * @tc.name threeListenersAllReceiveReload0700
     * @tc.desc Verify a reload reaches each of three listeners exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeListenersAllReceiveReload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(1);
      expect(beta.reloadCount).assertEqual(1);
      expect(gamma.reloadCount).assertEqual(1);
      expect(alpha.reloadCount + beta.reloadCount + gamma.reloadCount).assertEqual(3);
      BoardKit.log('matrix_threeListenersAllReceiveReload', 'three listeners, three callbacks');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0800
     * @tc.name threeListenersAllReceiveAdd0800
     * @tc.desc Verify an add reaches each of three listeners and every one records the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeListenersAllReceiveAdd', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      source.notifyDataAdd(0);
      expect(alpha.addedIndexes[0]).assertEqual(0);
      expect(beta.addedIndexes[0]).assertEqual(0);
      expect(gamma.addedIndexes[0]).assertEqual(0);
      expect(gamma.addedCount).assertEqual(1);
      BoardKit.log('matrix_threeListenersAllReceiveAdd', 'three listeners share index 0');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_0900
     * @tc.name threeListenersAllReceiveChange0900
     * @tc.desc Verify a change reaches each of three listeners and every one records the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeListenersAllReceiveChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      source.notifyDataChange(15);
      expect(alpha.changedIndexes[0]).assertEqual(15);
      expect(beta.changedIndexes[0]).assertEqual(15);
      expect(gamma.changedIndexes[0]).assertEqual(15);
      expect(alpha.changedCount + beta.changedCount + gamma.changedCount).assertEqual(3);
      BoardKit.log('matrix_threeListenersAllReceiveChange', 'three listeners share index 15');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1000
     * @tc.name addAtIndexZeroDelivered1000
     * @tc.desc Verify index zero is delivered as zero rather than being treated as absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addAtIndexZeroDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.addedIndexes[0]).assertEqual(0);
      expect(listener.addedIndexes[0] === 0).assertTrue();
      expect(listener.addedIndexes).assertContain(0);
      BoardKit.log('matrix_addAtIndexZeroDelivered', 'index 0 preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1100
     * @tc.name addAtIndexFiveDelivered1100
     * @tc.desc Verify a middle index is forwarded unchanged to the add callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addAtIndexFiveDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      expect(listener.addedIndexes[0]).assertEqual(5);
      expect(listener.addedIndexes).assertContain(5);
      expect(listener.addedIndexes.length).assertEqual(1);
      BoardKit.log('matrix_addAtIndexFiveDelivered', 'index 5 preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1200
     * @tc.name addAtIndexFifteenDelivered1200
     * @tc.desc Verify the last board index is forwarded unchanged to the add callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addAtIndexFifteenDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(CELLS - 1);
      expect(listener.addedIndexes[0]).assertEqual(15);
      expect(listener.addedIndexes[0]).assertEqual(CELLS - 1);
      expect(listener.addedCount).assertEqual(1);
      BoardKit.log('matrix_addAtIndexFifteenDelivered', 'index 15 preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1300
     * @tc.name addIndexesKeepCallOrder1300
     * @tc.desc Verify consecutive adds at zero, five and fifteen are recorded in call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addIndexesKeepCallOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      source.notifyDataAdd(5);
      source.notifyDataAdd(15);
      expect(listener.addedIndexes.length).assertEqual(3);
      expect(listener.addedIndexes[0]).assertEqual(0);
      expect(listener.addedIndexes[1]).assertEqual(5);
      expect(listener.addedIndexes[2]).assertEqual(15);
      BoardKit.log('matrix_addIndexesKeepCallOrder', 'order 0,5,15');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1400
     * @tc.name addBeyondBoardIndexDelivered1400
     * @tc.desc Verify an index past the board is forwarded without clamping because the source never validates it
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addBeyondBoardIndexDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(CELLS);
      expect(listener.addedIndexes[0]).assertEqual(16);
      expect(listener.addedIndexes[0] === CELLS).assertTrue();
      expect(listener.addedIndexes[0] === CELLS - 1).assertFalse();
      BoardKit.log('matrix_addBeyondBoardIndexDelivered', 'index 16 not clamped');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1500
     * @tc.name changeAtIndexZeroDelivered1500
     * @tc.desc Verify index zero is forwarded unchanged to the change callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_changeAtIndexZeroDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      expect(listener.changedIndexes[0]).assertEqual(0);
      expect(listener.changedIndexes).assertContain(0);
      expect(listener.changedCount).assertEqual(1);
      BoardKit.log('matrix_changeAtIndexZeroDelivered', 'index 0 preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1600
     * @tc.name changeAtIndexFiveDelivered1600
     * @tc.desc Verify a middle index is forwarded unchanged to the change callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_changeAtIndexFiveDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(5);
      expect(listener.changedIndexes[0]).assertEqual(5);
      expect(listener.changedIndexes.length).assertEqual(1);
      expect(listener.changedIndexes).assertContain(5);
      BoardKit.log('matrix_changeAtIndexFiveDelivered', 'index 5 preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1700
     * @tc.name changeAtIndexFifteenDelivered1700
     * @tc.desc Verify the last board index is forwarded unchanged to the change callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_changeAtIndexFifteenDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(CELLS - 1);
      expect(listener.changedIndexes[0]).assertEqual(15);
      expect(listener.changedIndexes[0]).assertEqual(CELLS - 1);
      expect(listener.changedIndexes.length).assertEqual(1);
      BoardKit.log('matrix_changeAtIndexFifteenDelivered', 'index 15 preserved');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1800
     * @tc.name changeIndexesKeepCallOrder1800
     * @tc.desc Verify consecutive changes at fifteen, five and zero are recorded in call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_changeIndexesKeepCallOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(15);
      source.notifyDataChange(5);
      source.notifyDataChange(0);
      expect(listener.changedIndexes[0]).assertEqual(15);
      expect(listener.changedIndexes[1]).assertEqual(5);
      expect(listener.changedIndexes[2]).assertEqual(0);
      expect(listener.changedIndexes.length).assertEqual(3);
      BoardKit.log('matrix_changeIndexesKeepCallOrder', 'order 15,5,0');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_1900
     * @tc.name changeNegativeIndexDelivered1900
     * @tc.desc Verify a negative change index is not rejected, since the notification path performs no validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_changeNegativeIndexDelivered', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(-1);
      expect(listener.changedIndexes[0]).assertEqual(-1);
      expect(listener.changedIndexes[0] < 0).assertTrue();
      expect(listener.changedIndexes).assertContain(-1);
      BoardKit.log('matrix_changeNegativeIndexDelivered', 'index -1 forwarded');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2000
     * @tc.name oneListenerCountsThreeKindsSeparately2000
     * @tc.desc Verify reload, add and change increment three independent counters on one listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_oneListenerCountsThreeKindsSeparately', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(2);
      source.notifyDataChange(4);
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.addedCount).assertEqual(1);
      expect(listener.changedCount).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(2);
      expect(listener.changedIndexes[0]).assertEqual(4);
      BoardKit.log('matrix_oneListenerCountsThreeKindsSeparately', '1/1/1');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2100
     * @tc.name twoRoundsOfThreeKindsAccumulate2100
     * @tc.desc Verify two rounds of all three notification kinds raise every counter to two
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoRoundsOfThreeKindsAccumulate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      for (let round: number = 0; round < 2; round++) {
        source.notifyDataReload();
        source.notifyDataAdd(3);
        source.notifyDataChange(3);
      }
      expect(listener.reloadCount).assertEqual(2);
      expect(listener.addedCount).assertEqual(2);
      expect(listener.changedCount).assertEqual(2);
      expect(listener.addedIndexes.length).assertEqual(2);
      expect(listener.changedIndexes.length).assertEqual(2);
      BoardKit.log('matrix_twoRoundsOfThreeKindsAccumulate', '2/2/2');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2200
     * @tc.name addAndChangeIndexesStaySeparate2200
     * @tc.desc Verify add and change ledgers never borrow each other's index even when kinds interleave
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addAndChangeIndexesStaySeparate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataChange(9);
      source.notifyDataAdd(2);
      expect(listener.addedIndexes.length).assertEqual(2);
      expect(listener.changedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(1);
      expect(listener.addedIndexes[1]).assertEqual(2);
      expect(listener.changedIndexes[0]).assertEqual(9);
      BoardKit.log('matrix_addAndChangeIndexesStaySeparate', 'ledgers independent');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2300
     * @tc.name lateRegisteredListenerStartsWithZero2300
     * @tc.desc Verify a listener registered late starts from zero while an earlier listener keeps its history
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_lateRegisteredListenerStartsWithZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      source.registerDataChangeListener(alpha);
      source.notifyDataReload();
      source.notifyDataReload();
      source.registerDataChangeListener(beta);
      source.notifyDataReload();
      expect(alpha.reloadCount).assertEqual(3);
      expect(beta.reloadCount).assertEqual(1);
      expect(entryAt(beta.changedIndexes, 0)).assertNull();
      BoardKit.log('matrix_lateRegisteredListenerStartsWithZero', 'late listener starts clean');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2400
     * @tc.name unregisteredListenerKeepsFrozenCounts2400
     * @tc.desc Verify a removed listener stops counting while its peer continues from the same baseline
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_unregisteredListenerKeepsFrozenCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      attachAll(source, [alpha, beta]);
      source.notifyDataAdd(0);
      source.unregisterDataChangeListener(beta);
      source.notifyDataAdd(1);
      expect(alpha.addedCount).assertEqual(2);
      expect(beta.addedCount).assertEqual(1);
      expect(beta.addedIndexes.length).assertEqual(1);
      expect(beta.addedIndexes[0]).assertEqual(0);
      BoardKit.log('matrix_unregisteredListenerKeepsFrozenCounts', 'frozen at one');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2500
     * @tc.name twoListenersReceiveSameIndex2500
     * @tc.desc Verify one notification hands every registered listener the identical index value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_twoListenersReceiveSameIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      attachAll(source, [alpha, beta]);
      source.notifyDataAdd(13);
      source.notifyDataChange(13);
      expect(alpha.addedIndexes[0]).assertEqual(13);
      expect(beta.addedIndexes[0]).assertEqual(13);
      expect(alpha.changedIndexes[0]).assertEqual(13);
      expect(beta.changedIndexes[0]).assertEqual(13);
      BoardKit.log('matrix_twoListenersReceiveSameIndex', 'index 13 shared');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2600
     * @tc.name reloadWithoutListenersIsSilent2600
     * @tc.desc Verify a reload notification on a source with no listeners neither throws nor leaves state behind
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_reloadWithoutListenersIsSilent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let threw: boolean = false;
      try {
        source.notifyDataReload();
      } catch (error) {
        threw = true;
        BoardKit.warn('matrix_reloadWithoutListenersIsSilent', 'unexpected throw');
      }
      expect(threw).assertFalse();
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('matrix_reloadWithoutListenersIsSilent', 'no listener, no throw');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2700
     * @tc.name addWithoutListenersIsSilent2700
     * @tc.desc Verify an add notification with no listeners does not throw or resize the source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addWithoutListenersIsSilent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      let threw: boolean = false;
      try {
        source.notifyDataAdd(5);
      } catch (error) {
        threw = true;
        BoardKit.warn('matrix_addWithoutListenersIsSilent', 'unexpected throw');
      }
      expect(threw).assertFalse();
      expect(listener.addedCount).assertEqual(0);
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('matrix_addWithoutListenersIsSilent', 'no listener, no throw');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2800
     * @tc.name changeWithoutListenersIsSilent2800
     * @tc.desc Verify a change notification with no listeners does not throw or record any index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_changeWithoutListenersIsSilent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      let threw: boolean = false;
      try {
        source.notifyDataChange(7);
        source.notifyDataChange(8);
      } catch (error) {
        threw = true;
        BoardKit.warn('matrix_changeWithoutListenersIsSilent', 'unexpected throw');
      }
      expect(threw).assertFalse();
      expect(listener.changedCount).assertEqual(0);
      expect(entryAt(listener.changedIndexes, 0)).assertNull();
      BoardKit.log('matrix_changeWithoutListenersIsSilent', 'no listener, no record');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_2900
     * @tc.name silentThenRegisterDeliversSingle2900
     * @tc.desc Verify notifications issued before registration are not queued and a later one arrives once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_silentThenRegisterDeliversSingle', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(1);
      source.registerDataChangeListener(listener);
      expect(listener.reloadCount).assertEqual(0);
      expect(listener.addedCount).assertEqual(0);
      expect(listener.changedCount).assertEqual(0);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
      BoardKit.log('matrix_silentThenRegisterDeliversSingle', 'no replay, then one');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3000
     * @tc.name tenReloadsAccumulateToTen3000
     * @tc.desc Verify ten reload notifications on one listener produce a count of exactly ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_tenReloadsAccumulateToTen', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      for (let round: number = 0; round < 10; round++) {
        source.notifyDataReload();
      }
      expect(listener.reloadCount).assertEqual(10);
      expect(listener.addedCount).assertEqual(0);
      expect(listener.changedCount).assertEqual(0);
      expect(listener.reloadCount === 0).assertFalse();
      BoardKit.log('matrix_tenReloadsAccumulateToTen', 'reload=' + listener.reloadCount);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3100
     * @tc.name tenAddsRecordTenIndexes3100
     * @tc.desc Verify ten add notifications leave a ten entry index ledger in call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_tenAddsRecordTenIndexes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      for (let round: number = 0; round < 10; round++) {
        source.notifyDataAdd(round % CELLS);
      }
      expect(listener.addedCount).assertEqual(10);
      expect(listener.addedIndexes.length).assertEqual(10);
      expect(listener.addedIndexes[0]).assertEqual(0);
      expect(listener.addedIndexes[9]).assertEqual(9);
      expect(listener.addedIndexes).assertContain(5);
      BoardKit.log('matrix_tenAddsRecordTenIndexes', 'ledger size=' + listener.addedIndexes.length);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3200
     * @tc.name tenChangesRecordTenIndexes3200
     * @tc.desc Verify ten change notifications leave a ten entry index ledger with the last index on top
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_tenChangesRecordTenIndexes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      for (let round: number = 0; round < 10; round++) {
        source.notifyDataChange(round);
      }
      expect(listener.changedCount).assertEqual(10);
      expect(listener.changedIndexes.length).assertEqual(10);
      expect(listener.changedIndexes[0]).assertEqual(0);
      expect(listener.changedIndexes[9]).assertEqual(9);
      expect(listener.changedIndexes[10]).assertUndefined();
      BoardKit.log('matrix_tenChangesRecordTenIndexes', 'ledger size=' + listener.changedIndexes.length);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3300
     * @tc.name tenMixedNotifiesSplitCounts3300
     * @tc.desc Verify ten notifications split as four reloads, three adds and three changes keep separate totals
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_tenMixedNotifiesSplitCounts', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      for (let round: number = 0; round < 4; round++) {
        source.notifyDataReload();
      }
      for (let round: number = 0; round < 3; round++) {
        source.notifyDataAdd(round);
      }
      for (let round: number = 0; round < 3; round++) {
        source.notifyDataChange(round + 4);
      }
      expect(listener.reloadCount).assertEqual(4);
      expect(listener.addedCount).assertEqual(3);
      expect(listener.changedCount).assertEqual(3);
      expect(listener.reloadCount + listener.addedCount + listener.changedCount).assertEqual(10);
      BoardKit.log('matrix_tenMixedNotifiesSplitCounts', '4/3/3');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3400
     * @tc.name threeListenersTenReloadsEach3400
     * @tc.desc Verify ten reloads give each of three listeners the same count of ten
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeListenersTenReloadsEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      for (let round: number = 0; round < 10; round++) {
        source.notifyDataReload();
      }
      expect(alpha.reloadCount).assertEqual(10);
      expect(beta.reloadCount).assertEqual(10);
      expect(gamma.reloadCount).assertEqual(10);
      BoardKit.log('matrix_threeListenersTenReloadsEach', 'three times ten');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3500
     * @tc.name threeListenersTenAddsEach3500
     * @tc.desc Verify ten adds leave every one of three listeners with a ten entry index ledger
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeListenersTenAddsEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      for (let round: number = 0; round < 10; round++) {
        source.notifyDataAdd(round % CELLS);
      }
      expect(alpha.addedIndexes.length).assertEqual(10);
      expect(beta.addedIndexes.length).assertEqual(10);
      expect(gamma.addedIndexes.length).assertEqual(10);
      expect(beta.addedIndexes[9]).assertEqual(9);
      BoardKit.log('matrix_threeListenersTenAddsEach', 'ledgers of ten');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3600
     * @tc.name threeListenersTenChangesEach3600
     * @tc.desc Verify ten changes give each of three listeners the same count and the last index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeListenersTenChangesEach', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      for (let round: number = 0; round < 10; round++) {
        source.notifyDataChange(round);
      }
      expect(alpha.changedCount).assertEqual(10);
      expect(beta.changedCount).assertEqual(10);
      expect(gamma.changedCount).assertEqual(10);
      expect(gamma.changedIndexes[9]).assertEqual(9);
      BoardKit.log('matrix_threeListenersTenChangesEach', 'three times ten changes');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3700
     * @tc.name threeListenersMixedTenAllEqual3700
     * @tc.desc Verify a mixed batch of ten notifications leaves three listeners with identical counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_threeListenersMixedTenAllEqual', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      for (let round: number = 0; round < 4; round++) {
        source.notifyDataReload();
      }
      for (let round: number = 0; round < 3; round++) {
        source.notifyDataAdd(round);
      }
      for (let round: number = 0; round < 3; round++) {
        source.notifyDataChange(round);
      }
      expect(alpha.reloadCount).assertEqual(beta.reloadCount);
      expect(beta.reloadCount).assertEqual(gamma.reloadCount);
      expect(alpha.addedCount).assertEqual(gamma.addedCount);
      expect(alpha.changedCount).assertEqual(beta.changedCount);
      expect(gamma.reloadCount).assertEqual(4);
      BoardKit.log('matrix_threeListenersMixedTenAllEqual', 'identical counters');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3800
     * @tc.name addNotificationReachesAddedCallbackOnly3800
     * @tc.desc Verify notifyDataAdd hits the legacy onDataAdded callback and leaves the onDataAdd counter empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addNotificationReachesAddedCallbackOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(4);
      expect(listener.addedCount).assertEqual(1);
      expect(listener.addCount).assertEqual(0);
      expect(listener.addedIndexes[0]).assertEqual(4);
      expect(listener.addIndexes.length).assertEqual(0);
      BoardKit.log('matrix_addNotificationReachesAddedCallbackOnly', 'legacy callback only');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_3900
     * @tc.name changeNotificationReachesChangedCallbackOnly3900
     * @tc.desc Verify notifyDataChange hits the legacy onDataChanged callback and leaves the onDataChange counter empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_changeNotificationReachesChangedCallbackOnly', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataChange(4);
      expect(listener.changedCount).assertEqual(1);
      expect(listener.changeCount).assertEqual(0);
      expect(listener.changedIndexes[0]).assertEqual(4);
      expect(listener.changeIndexes.length).assertEqual(0);
      BoardKit.log('matrix_changeNotificationReachesChangedCallbackOnly', 'legacy callback only');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_4000
     * @tc.name reloadNotificationReachesReloadedCallback4000
     * @tc.desc Verify a reload notification reaches onDataReloaded and touches no indexed callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_reloadNotificationReachesReloadedCallback', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.addedIndexes.length).assertEqual(0);
      expect(listener.changedIndexes.length).assertEqual(0);
      expect(listener.datasetChangeCount).assertEqual(0);
      BoardKit.log('matrix_reloadNotificationReachesReloadedCallback', 'reload only');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_4100
     * @tc.name aliasAddCallbackStaysSilent4100
     * @tc.desc Verify the newer onDataAdd alias is not invoked by any of the three notification kinds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_aliasAddCallbackStaysSilent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(6);
      source.notifyDataChange(6);
      expect(listener.addCount).assertEqual(0);
      expect(listener.addIndexes.length).assertEqual(0);
      expect(listener.addedCount).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(6);
      BoardKit.log('matrix_aliasAddCallbackStaysSilent', 'alias untouched');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_4200
     * @tc.name aliasChangeCallbackStaysSilent4200
     * @tc.desc Verify the newer onDataChange alias is not invoked by any of the three notification kinds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_aliasChangeCallbackStaysSilent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(6);
      source.notifyDataChange(6);
      expect(listener.changeCount).assertEqual(0);
      expect(listener.changeIndexes.length).assertEqual(0);
      expect(listener.changedCount).assertEqual(1);
      expect(listener.changedIndexes[0]).assertEqual(6);
      BoardKit.log('matrix_aliasChangeCallbackStaysSilent', 'alias untouched');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_4300
     * @tc.name datasetChangeCounterStartsAtZero4300
     * @tc.desc Verify a freshly registered listener has never seen a batch dataset change
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_datasetChangeCounterStartsAtZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      expect(listener.datasetChangeCount).assertEqual(0);
      expect(listener.datasetChangeCount > 0).assertFalse();
      expect(listener.reloadCount).assertEqual(0);
      BoardKit.log('matrix_datasetChangeCounterStartsAtZero', 'dataset counter at zero');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_4400
     * @tc.name datasetChangeUnaffectedByDataNotifications4400
     * @tc.desc Verify the batch dataset callback counter stays zero through reload, add and change rounds
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_datasetChangeUnaffectedByDataNotifications', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let listener: CountListener = new CountListener('alpha');
      source.registerDataChangeListener(listener);
      for (let round: number = 0; round < 2; round++) {
        source.notifyDataReload();
        source.notifyDataAdd(round);
        source.notifyDataChange(round);
      }
      expect(listener.datasetChangeCount).assertEqual(0);
      expect(listener.reloadCount).assertEqual(2);
      expect(listener.addedCount).assertEqual(2);
      expect(listener.changedCount).assertEqual(2);
      BoardKit.log('matrix_datasetChangeUnaffectedByDataNotifications', 'batch counter still zero');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_4500
     * @tc.name addDataEmitsAddAtRequestedIndex4500
     * @tc.desc Verify addData notifies every listener with its index while leaving the cell count unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addDataEmitsAddAtRequestedIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      attachAll(source, [alpha, beta]);
      source.addData(5, '2');
      expect(alpha.addedCount).assertEqual(1);
      expect(beta.addedCount).assertEqual(1);
      expect(alpha.addedIndexes[0]).assertEqual(5);
      expect(beta.addedIndexes[0]).assertEqual(5);
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('matrix_addDataEmitsAddAtRequestedIndex', 'addData notifies at index 5');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCENOTIFICATIONMATRIX_4600
     * @tc.name addDataIndexReachesEachListenerUnchanged4600
     * @tc.desc Verify addData at the last index forwards fifteen to each of three listeners
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('matrix_addDataIndexReachesEachListenerUnchanged', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = blankSource();
      let alpha: CountListener = new CountListener('alpha');
      let beta: CountListener = new CountListener('beta');
      let gamma: CountListener = new CountListener('gamma');
      attachAll(source, [alpha, beta, gamma]);
      source.addData(15, '4');
      expect(alpha.addedIndexes[0]).assertEqual(15);
      expect(beta.addedIndexes[0]).assertEqual(15);
      expect(gamma.addedIndexes[0]).assertEqual(15);
      expect(source.totalCount()).assertEqual(CELLS);
      BoardKit.log('matrix_addDataIndexReachesEachListenerUnchanged', 'addData index 15 shared');
    });
  });
}
