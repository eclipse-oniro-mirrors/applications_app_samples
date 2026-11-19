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
import { BoardKit, CELLS } from '../common/Game2048TestKit';

/**
 * 记录型监听器：把每个回调落进独立的计数器、索引数组与顺序轨迹。
 *
 * 生产实现只调用 onDataReloaded / onDataAdded / onDataChanged 三个回调，
 * 其余方法必须实现以满足 DataChangeListener 接口，同时被单独记录，便于
 * 证明「生产通知走的是哪个通道」。trace 由调用方注入，用于观察多个监听器
 * 之间的通知顺序。
 */
class RecordingListener implements DataChangeListener {
  public tag: string;
  public trace: string[];
  public reloadCount: number = 0;
  public addedIndexes: number[] = [];
  public legacyAddIndexes: number[] = [];
  public changeIndexes: number[] = [];
  public legacyChangeIndexes: number[] = [];
  public legacyMoveCount: number = 0;
  public legacyMoveFrom: number = -1;
  public legacyMoveTo: number = -1;
  public moveCount: number = 0;
  public moveFrom: number = -1;
  public moveTo: number = -1;
  public legacyDeleteIndexes: number[] = [];
  public deleteIndexes: number[] = [];
  public datasetChangeCount: number = 0;
  public datasetOperationCount: number = 0;

  constructor(tag: string, trace: string[]) {
    this.tag = tag;
    this.trace = trace;
  }

  onDataReloaded(): void {
    this.reloadCount = this.reloadCount + 1;
    this.trace.push(this.tag + ':reloaded');
  }

  onDataAdded(index: number): void {
    this.addedIndexes.push(index);
    this.trace.push(this.tag + ':added');
  }

  onDataAdd(index: number): void {
    this.legacyAddIndexes.push(index);
    this.trace.push(this.tag + ':add');
  }

  onDataMoved(from: number, to: number): void {
    this.legacyMoveCount = this.legacyMoveCount + 1;
    this.legacyMoveFrom = from;
    this.legacyMoveTo = to;
    this.trace.push(this.tag + ':moved');
  }

  onDataMove(from: number, to: number): void {
    this.moveCount = this.moveCount + 1;
    this.moveFrom = from;
    this.moveTo = to;
    this.trace.push(this.tag + ':move');
  }

  onDataDeleted(index: number): void {
    this.legacyDeleteIndexes.push(index);
    this.trace.push(this.tag + ':deleted');
  }

  onDataDelete(index: number): void {
    this.deleteIndexes.push(index);
    this.trace.push(this.tag + ':delete');
  }

  onDataChanged(index: number): void {
    this.changeIndexes.push(index);
    this.trace.push(this.tag + ':changed');
  }

  onDataChange(index: number): void {
    this.legacyChangeIndexes.push(index);
    this.trace.push(this.tag + ':change');
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.datasetChangeCount = this.datasetChangeCount + 1;
    this.datasetOperationCount = this.datasetOperationCount + dataOperations.length;
    this.trace.push(this.tag + ':dataset');
  }
}

/** 创建一个十六格空数据源，供监听器套件复用。 */
function emptySource(): MyDataSource {
  let list: DataType[] = BoardKit.data(BoardKit.zeros(CELLS));
  return new MyDataSource(list);
}

/**
 * MyDataSource 监听器语义测试套件。
 *
 * 注册使用 indexOf 去重后 push，所以同一实例无论注册多少次都只保留一项；
 * 注销按首次出现位置 splice。生产通知只有三个入口：notifyDataReload、
 * notifyDataAdd、notifyDataChange，分别只触发 onDataReloaded、onDataAdded、
 * onDataChanged；带 d 后缀的历史方法不会被生产路径调用。本套件固化注册表、
 * 通知通道、顺序、隔离与历史事件五类契约。
 */
export default function myDataSourceListenerTest() {
  describe('myDataSourceListenerTest', () => {
    beforeEach(async () => {
      await new Promise<void>((resolve: () => void) => {
        setTimeout(resolve, 1);
      });
    });

    beforeAll(() => {
      BoardKit.log('myDataSourceListenerTest', 'suite begin');
    });

    afterAll(() => {
      BoardKit.log('myDataSourceListenerTest', 'suite end');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0100
     * @tc.name listenerReloadReachesOnce0100
     * @tc.desc Verify one registered listener receives one reload callback per notification
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_reloadReachesOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
      expect(trace.length).assertEqual(1);
      expect(trace[0]).assertEqual('A:reloaded');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0200
     * @tc.name listenerReloadTwiceAccumulates0200
     * @tc.desc Verify two reload notifications accumulate into two callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_reloadTwiceAccumulates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(2);
      expect(trace.length).assertEqual(2);
      expect(trace[1]).assertEqual('A:reloaded');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0300
     * @tc.name listenerAddRecordsIndex0300
     * @tc.desc Verify notifyDataAdd delivers the supplied index to onDataAdded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_addRecordsIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(7);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(7);
      expect(trace[0]).assertEqual('A:added');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0400
     * @tc.name listenerAddSkipsLegacyChannel0400
     * @tc.desc Verify the production add notification never reaches the deprecated onDataAdd method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_addSkipsLegacyChannel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(3);
      expect(listener.legacyAddIndexes.length).assertEqual(0);
      expect(listener.legacyAddIndexes.indexOf(3) < 0).assertTrue();
      expect(trace.indexOf('A:add') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0500
     * @tc.name listenerLegacyAddIsSeparate0500
     * @tc.desc Verify the compatibility onDataAdd method records into its own channel only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_legacyAddIsSeparate', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      listener.onDataAdd(7);
      expect(listener.legacyAddIndexes.length).assertEqual(1);
      expect(listener.legacyAddIndexes[0]).assertEqual(7);
      expect(listener.addedIndexes.length).assertEqual(0);
      expect(trace[0]).assertEqual('A:add');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0600
     * @tc.name listenerChangeRecordsIndex0600
     * @tc.desc Verify notifyDataChange delivers the supplied index to onDataChanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_changeRecordsIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(11);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(11);
      expect(trace[0]).assertEqual('A:changed');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0700
     * @tc.name listenerChangeSkipsLegacyChannel0700
     * @tc.desc Verify the production change notification never reaches the deprecated onDataChange method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_changeSkipsLegacyChannel', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(11);
      expect(listener.legacyChangeIndexes.length).assertEqual(0);
      expect(listener.legacyChangeIndexes.indexOf(11) < 0).assertTrue();
      expect(trace.indexOf('A:change') < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0800
     * @tc.name listenerSameInstanceTwiceOnce0800
     * @tc.desc Verify registering one instance twice keeps a single entry in the listener list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_sameInstanceTwiceOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(5);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(5);
      expect(trace.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_0900
     * @tc.name listenerDuplicateWithSecondListener0900
     * @tc.desc Verify a duplicate registration cannot shadow a second listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_duplicateWithSecondListener', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      expect(first.reloadCount).assertEqual(1);
      expect(second.reloadCount).assertEqual(1);
      expect(trace.length).assertEqual(2);
      expect(trace[0]).assertEqual('A:reloaded');
      expect(trace[1]).assertEqual('B:reloaded');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1000
     * @tc.name listenerTwoReceiveAddOnce1000
     * @tc.desc Verify two listeners each receive one add callback with the same index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_twoReceiveAddOnce', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataAdd(9);
      expect(first.addedIndexes).assertContain(9);
      expect(second.addedIndexes).assertContain(9);
      expect(first.addedIndexes.length).assertEqual(1);
      expect(second.addedIndexes.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1100
     * @tc.name listenerTwoReceiveReload1100
     * @tc.desc Verify two listeners each count one reload callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_twoReceiveReload', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      expect(first.reloadCount).assertEqual(1);
      expect(second.reloadCount).assertEqual(1);
      expect(trace.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1200
     * @tc.name listenerTwoReceiveSameChange1200
     * @tc.desc Verify both listeners see the identical change index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_twoReceiveSameChange', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(15);
      expect(first.changeIndexes).assertContain(15);
      expect(second.changeIndexes).assertContain(15);
      expect(first.changeIndexes[0]).assertEqual(second.changeIndexes[0]);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1300
     * @tc.name listenerUnregisterStopsAll1300
     * @tc.desc Verify an unregistered listener receives no further reload add or change callbacks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_unregisterStopsAll', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(1);
      source.notifyDataChange(2);
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataAdd(3);
      source.notifyDataChange(4);
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.addedIndexes.indexOf(3) < 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1400
     * @tc.name listenerUnregisterOneOfTwo1400
     * @tc.desc Verify unregistering one listener leaves the other one active
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_unregisterOneOfTwo', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.notifyDataAdd(4);
      expect(first.addedIndexes.length).assertEqual(0);
      expect(second.addedIndexes).assertContain(4);
      expect(second.addedIndexes.length).assertEqual(1);
      expect(trace.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1500
     * @tc.name listenerUnregisterUnknownNoThrow1500
     * @tc.desc Verify unregistering a never registered listener is a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_unregisterUnknownNoThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let active: RecordingListener = new RecordingListener('A', trace);
      let stranger: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      let threw: boolean = false;
      source.registerDataChangeListener(active);
      try {
        source.unregisterDataChangeListener(stranger);
      } catch (error) {
        threw = true;
        BoardKit.warn('listener_unregisterUnknownNoThrow', 'unregister threw for an unknown listener');
      }
      expect(threw).assertFalse();
      source.notifyDataReload();
      expect(active.reloadCount).assertEqual(1);
      expect(stranger.reloadCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1600
     * @tc.name listenerUnregisterTwiceNoThrow1600
     * @tc.desc Verify a second unregister of the same listener is a silent no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_unregisterTwiceNoThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      let threw: boolean = false;
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      try {
        source.unregisterDataChangeListener(listener);
      } catch (error) {
        threw = true;
        BoardKit.warn('listener_unregisterTwiceNoThrow', 'second unregister threw');
      }
      expect(threw).assertFalse();
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1700
     * @tc.name listenerReRegisterReceivesAgain1700
     * @tc.desc Verify a listener removed and registered again receives later notifications
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_reRegisterReceivesAgain', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.unregisterDataChangeListener(listener);
      source.notifyDataReload();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(2);
      expect(trace.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1800
     * @tc.name listenerReRegisterNotDuplicated1800
     * @tc.desc Verify re-registering after removal followed by another registration still notifies once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_reRegisterNotDuplicated', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(6);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(6);
      expect(trace.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_1900
     * @tc.name listenerRegisterAfterReloadNoHistory1900
     * @tc.desc Verify a reload fired before registration is never replayed to the new listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_registerAfterReloadNoHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.notifyDataReload();
      source.registerDataChangeListener(listener);
      expect(listener.reloadCount).assertEqual(0);
      expect(trace.length).assertEqual(0);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2000
     * @tc.name listenerRegisterAfterAddNoHistory2000
     * @tc.desc Verify an add fired before registration is never replayed to the new listener
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_registerAfterAddNoHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.notifyDataAdd(6);
      source.registerDataChangeListener(listener);
      expect(listener.addedIndexes.length).assertEqual(0);
      source.notifyDataAdd(7);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2100
     * @tc.name listenerNotifyWithoutListenersNoThrow2100
     * @tc.desc Verify all three notification entrances tolerate an empty listener list
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_notifyWithoutListenersNoThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let source: MyDataSource = emptySource();
      let threw: boolean = false;
      try {
        source.notifyDataReload();
        source.notifyDataAdd(0);
        source.notifyDataChange(0);
      } catch (error) {
        threw = true;
        BoardKit.warn('listener_notifyWithoutListenersNoThrow', 'notification threw without listeners');
      }
      expect(threw).assertFalse();
      expect(source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2200
     * @tc.name listenerReloadOrderFollowsRegistration2200
     * @tc.desc Verify listeners are notified in the order they registered
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_reloadOrderFollowsRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let third: RecordingListener = new RecordingListener('C', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataReload();
      expect(trace.length).assertEqual(3);
      expect(trace[0]).assertEqual('A:reloaded');
      expect(trace[1]).assertEqual('B:reloaded');
      expect(trace[2]).assertEqual('C:reloaded');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2300
     * @tc.name listenerChangeOrderFollowsRegistration2300
     * @tc.desc Verify change notifications also follow the registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_changeOrderFollowsRegistration', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataChange(4);
      expect(trace[0]).assertEqual('A:changed');
      expect(trace[1]).assertEqual('B:changed');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2400
     * @tc.name listenerDuplicateKeepsOrder2400
     * @tc.desc Verify a duplicate registration of a middle listener does not move it to the end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_duplicateKeepsOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let third: RecordingListener = new RecordingListener('C', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.notifyDataReload();
      expect(trace.length).assertEqual(3);
      expect(trace[1]).assertEqual('B:reloaded');
      expect(trace[2]).assertEqual('C:reloaded');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2500
     * @tc.name listenerUnregisterMiddleKeepsOrder2500
     * @tc.desc Verify removing the middle listener keeps the remaining registration order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_unregisterMiddleKeepsOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let third: RecordingListener = new RecordingListener('C', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.unregisterDataChangeListener(second);
      source.notifyDataReload();
      expect(trace.length).assertEqual(2);
      expect(trace[0]).assertEqual('A:reloaded');
      expect(trace[1]).assertEqual('C:reloaded');
      expect(second.reloadCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2600
     * @tc.name listenerCountersAreIndependent2600
     * @tc.desc Verify two listeners keep separate counters when one is removed later
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_countersAreIndependent', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.notifyDataReload();
      source.unregisterDataChangeListener(second);
      source.notifyDataAdd(4);
      expect(first.reloadCount).assertEqual(1);
      expect(first.addedIndexes.length).assertEqual(1);
      expect(second.reloadCount).assertEqual(1);
      expect(second.addedIndexes.length).assertEqual(0);
      expect(first.addedIndexes === second.addedIndexes).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2700
     * @tc.name listenerReloadLeavesAddCounters2700
     * @tc.desc Verify reload notifications never increment the add or change counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_reloadLeavesAddCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(2);
      expect(listener.addedIndexes.length).assertEqual(0);
      expect(listener.changeIndexes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2800
     * @tc.name listenerAddLeavesChangeCounters2800
     * @tc.desc Verify add notifications never increment the change or reload counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_addLeavesChangeCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2);
      source.notifyDataAdd(3);
      expect(listener.addedIndexes.length).assertEqual(2);
      expect(listener.changeIndexes.length).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_2900
     * @tc.name listenerChangeLeavesReloadCount2900
     * @tc.desc Verify change notifications never increment the reload counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_changeLeavesReloadCount', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(8);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.reloadCount).assertEqual(0);
      expect(listener.addedIndexes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3000
     * @tc.name listenerChangeAccumulatesIndexes3000
     * @tc.desc Verify repeated change notifications append every index in call order
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_changeAccumulatesIndexes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      source.notifyDataChange(5);
      source.notifyDataChange(15);
      expect(listener.changeIndexes.length).assertEqual(3);
      expect(listener.changeIndexes[0]).assertEqual(0);
      expect(listener.changeIndexes[1]).assertEqual(5);
      expect(listener.changeIndexes[2]).assertEqual(15);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3100
     * @tc.name listenerChangeKeepsDuplicates3100
     * @tc.desc Verify notifying the same index twice appends two entries instead of collapsing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_changeKeepsDuplicates', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(3);
      source.notifyDataChange(3);
      expect(listener.changeIndexes.length).assertEqual(2);
      expect(listener.changeIndexes[0]).assertEqual(3);
      expect(listener.changeIndexes[1]).assertEqual(3);
      expect(listener.changeIndexes).assertContain(3);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3200
     * @tc.name listenerAddAccumulatesIndexes3200
     * @tc.desc Verify repeated add notifications accumulate distinct indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_addAccumulatesIndexes', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(1);
      source.notifyDataAdd(4);
      source.notifyDataAdd(15);
      expect(listener.addedIndexes.length).assertEqual(3);
      BoardKit.expectValues(listener.addedIndexes, [1, 4, 15]);
      expect(listener.addedIndexes).assertContain(15);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3300
     * @tc.name listenerAddPreservesCallOrder3300
     * @tc.desc Verify add indices keep the exact order of the notification calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_addPreservesCallOrder', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(15);
      source.notifyDataAdd(0);
      source.notifyDataAdd(7);
      expect(listener.addedIndexes[0]).assertEqual(15);
      expect(listener.addedIndexes[1]).assertEqual(0);
      expect(listener.addedIndexes[2]).assertEqual(7);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3400
     * @tc.name listenerUnregisteredKeepsHistory3400
     * @tc.desc Verify unregistering does not erase the callbacks already recorded
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_unregisteredKeepsHistory', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(2);
      source.unregisterDataChangeListener(listener);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(2);
      expect(trace.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3500
     * @tc.name listenerAddIndexZero3500
     * @tc.desc Verify index zero is delivered as zero instead of being treated as absent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_addIndexZero', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(0);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(0);
      expect(listener.addedIndexes[0] === 0).assertTrue();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3600
     * @tc.name listenerAddLastIndex3600
     * @tc.desc Verify the last board index is delivered without clamping
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_addLastIndex', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataAdd(CELLS - 1);
      expect(listener.addedIndexes.length).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(15);
      expect(listener.addedIndexes[0] === CELLS).assertFalse();
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3700
     * @tc.name listenerNegativeIndexPassedThrough3700
     * @tc.desc Verify the notification layer validates neither negative nor oversized indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_negativeIndexPassedThrough', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(-1);
      source.notifyDataChange(1024);
      expect(listener.changeIndexes.length).assertEqual(2);
      expect(listener.changeIndexes[0]).assertEqual(-1);
      expect(listener.changeIndexes[1]).assertEqual(1024);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3800
     * @tc.name listenerNotifyAfterAllRemovedNoThrow3800
     * @tc.desc Verify notifications after every listener was removed leave the source stable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_notifyAfterAllRemovedNoThrow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      let source: MyDataSource = emptySource();
      let threw: boolean = false;
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.unregisterDataChangeListener(first);
      source.unregisterDataChangeListener(second);
      try {
        source.notifyDataReload();
        source.notifyDataAdd(2);
        source.notifyDataChange(3);
      } catch (error) {
        threw = true;
        BoardKit.warn('listener_notifyAfterAllRemovedNoThrow', 'notification threw with no listeners');
      }
      expect(threw).assertFalse();
      expect(first.reloadCount).assertEqual(0);
      expect(second.reloadCount).assertEqual(0);
      expect(source.totalCount()).assertEqual(CELLS);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_3900
     * @tc.name listenerDatasetChangeCountsCalls3900
     * @tc.desc Verify onDatasetChange is implemented and counts each invocation and operation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_datasetChangeCountsCalls', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let operations: DataOperation[] = [];
      listener.onDatasetChange(operations);
      listener.onDatasetChange(operations);
      expect(listener.datasetChangeCount).assertEqual(2);
      expect(listener.datasetOperationCount).assertEqual(0);
      expect(listener.reloadCount).assertEqual(0);
      expect(listener.changeIndexes.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_4000
     * @tc.name listenerImplementsAllMethods4000
     * @tc.desc Verify every DataChangeListener method is implemented and records its own state
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_implementsAllMethods', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let operations: DataOperation[] = [];
      listener.onDataReloaded();
      listener.onDataAdded(5);
      listener.onDataAdd(6);
      listener.onDataMoved(1, 2);
      listener.onDataMove(3, 4);
      listener.onDataDeleted(7);
      listener.onDataDelete(8);
      listener.onDataChanged(9);
      listener.onDataChange(10);
      listener.onDatasetChange(operations);
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.addedIndexes[0]).assertEqual(5);
      expect(listener.legacyAddIndexes[0]).assertEqual(6);
      expect(listener.legacyMoveFrom).assertEqual(1);
      expect(listener.legacyMoveTo).assertEqual(2);
      expect(listener.legacyMoveCount).assertEqual(1);
      expect(listener.moveFrom).assertEqual(3);
      expect(listener.moveTo).assertEqual(4);
      expect(listener.moveCount).assertEqual(1);
      expect(listener.legacyDeleteIndexes[0]).assertEqual(7);
      expect(listener.deleteIndexes[0]).assertEqual(8);
      expect(listener.changeIndexes[0]).assertEqual(9);
      expect(listener.legacyChangeIndexes[0]).assertEqual(10);
      expect(listener.datasetChangeCount).assertEqual(1);
      expect(trace.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_4100
     * @tc.name listenerDirectCallsStayPerInstance4100
     * @tc.desc Verify direct callback calls on one listener cannot leak into another instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_directCallsStayPerInstance', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let first: RecordingListener = new RecordingListener('A', trace);
      let second: RecordingListener = new RecordingListener('B', trace);
      first.onDataReloaded();
      first.onDataAdd(2);
      expect(first.reloadCount).assertEqual(1);
      expect(first.legacyAddIndexes.length).assertEqual(1);
      expect(second.reloadCount).assertEqual(0);
      expect(second.legacyAddIndexes.length).assertEqual(0);
      expect(trace.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_4200
     * @tc.name listenerReRegisterKeepsCounters4200
     * @tc.desc Verify removing and re-adding a listener does not reset its counters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_reRegisterKeepsCounters', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let source: MyDataSource = emptySource();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      source.unregisterDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      expect(listener.reloadCount).assertEqual(2);
      expect(trace.length).assertEqual(2);
      expect(trace[1]).assertEqual('A:reloaded');
    });

    /**
     * @tc.number SUB_GAME2048_MYDATASOURCELISTENER_4300
     * @tc.name listenerSharedAcrossSources4300
     * @tc.desc Verify one listener instance registered on two sources is notified by each source independently
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('listener_sharedAcrossSources', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let trace: string[] = [];
      let listener: RecordingListener = new RecordingListener('A', trace);
      let first: MyDataSource = emptySource();
      let second: MyDataSource = emptySource();
      first.registerDataChangeListener(listener);
      second.registerDataChangeListener(listener);
      first.notifyDataReload();
      second.notifyDataReload();
      expect(listener.reloadCount).assertEqual(2);
      first.unregisterDataChangeListener(listener);
      first.notifyDataReload();
      expect(listener.reloadCount).assertEqual(2);
      second.notifyDataReload();
      expect(listener.reloadCount).assertEqual(3);
    });
  });
}
