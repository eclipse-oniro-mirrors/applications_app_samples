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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SongItem } from '../../../main/ets/viewmodel/SongData';
import { SongDataSource } from '../../../main/ets/viewmodel/SongDataSource';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

class EventRecorder implements DataChangeListener {
  events: string[] = [];

  onDataReloaded(): void {
    this.events.push('reload');
  }

  onDataAdd(index: number): void {
    this.events.push('add:' + index);
  }

  onDataMove(from: number, to: number): void {
    this.events.push('move:' + from + '>' + to);
  }

  onDataDelete(index: number): void {
    this.events.push('delete:' + index);
  }

  onDataChange(index: number): void {
    this.events.push('change:' + index);
  }

  onDataAdded(index: number): void {
    this.events.push('add:' + index);
  }

  onDataMoved(from: number, to: number): void {
    this.events.push('move:' + from + '>' + to);
  }

  onDataDeleted(index: number): void {
    this.events.push('delete:' + index);
  }

  onDataChanged(index: number): void {
    this.events.push('change:' + index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.events.push('reload');
  }
}

function makeSong(id: number): SongItem {
  let song: SongItem = new SongItem();
  song.id = id;
  song.index = id - 1;
  song.src = `seq_${id}.pcm`;
  return song;
}

function collectIds(source: SongDataSource): number[] {
  let ids: number[] = [];
  for (let i = 0; i < source.totalCount(); i++) {
    ids.push(source.getData(i).id);
  }
  return ids;
}

function isContiguousFromOne(ids: number[]): boolean {
  if (ids.length === 0) {
    return false;
  }
  for (let i = 0; i < ids.length; i++) {
    if (ids[i] !== i + 1) {
      return false;
    }
  }
  return true;
}

export default function DataSourceSequenceTest() {
  describe('DataSourceSequenceTest', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_SEQ_0100
     * @tc.name      testDataSourceSequence0001
     * @tc.desc      验证连续追加与头部插入后元素顺序与追加顺序一致且总数同步增长
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSourceSequence0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_AppendInsert_0001 begin');
      let source: SongDataSource = new SongDataSource([]);
      let listener: EventRecorder = new EventRecorder();
      source.registerDataChangeListener(listener);
      for (let id = 1; id <= 3; id++) {
        source.pushData(makeSong(id));
      }
      let appendedIds: number[] = collectIds(source);
      source.addData(0, makeSong(10));
      let headIds: number[] = collectIds(source);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `追加后=${appendedIds}, 头部插入后=${headIds}, 事件=${listener.events}`);
      expect(appendedIds.length).assertEqual(3);
      expect(isContiguousFromOne(appendedIds)).assertTrue();
      expect(headIds).assertDeepEquals([10, 1, 2, 3]);
      expect(source.totalCount()).assertEqual(4);
      expect(listener.events).assertDeepEquals(['add:0', 'add:1', 'add:2', 'add:0']);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_AppendInsert_0001 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_SEQ_0200
     * @tc.name      testDataSourceSequence0002
     * @tc.desc      验证尾部与中间插入时插入位置取原位置元素且后续元素整体后移
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSourceSequence0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_InsertMiddle_0002 begin');
      let source: SongDataSource = new SongDataSource([makeSong(1), makeSong(2), makeSong(4)]);
      let listener: EventRecorder = new EventRecorder();
      source.registerDataChangeListener(listener);
      let beforeIndexOne: number = source.getData(1).id;
      source.addData(2, makeSong(3));
      source.addData(4, makeSong(5));
      let ids: number[] = collectIds(source);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `插入前索引1=${beforeIndexOne}, 插入后=${ids}, 事件=${listener.events}`);
      expect(beforeIndexOne).assertEqual(2);
      expect(ids).assertDeepEquals([1, 2, 3, 4, 5]);
      expect(isContiguousFromOne(ids)).assertTrue();
      expect(source.getData(2).src).assertEqual('seq_3.pcm');
      expect(listener.events).assertDeepEquals(['add:2', 'add:4']);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_InsertMiddle_0002 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_SEQ_0300
     * @tc.name      testDataSourceSequence0003
     * @tc.desc      验证重复注册去重、取消注册后停止通知以及重新注册恢复通知
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSourceSequence0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_ListenerCycle_0003 begin');
      let source: SongDataSource = new SongDataSource([makeSong(1)]);
      let listener: EventRecorder = new EventRecorder();
      source.registerDataChangeListener(listener);
      source.registerDataChangeListener(listener);
      source.notifyDataChange(0);
      let afterDuplicate: number = listener.events.length;
      source.unregisterDataChangeListener(listener);
      source.notifyDataChange(0);
      source.notifyDataAdd(1);
      let afterUnregister: number = listener.events.length;
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(0);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `重复注册后事件数=${afterDuplicate}, 注销后事件数=${afterUnregister}, 事件=${listener.events}`);
      expect(afterDuplicate).assertEqual(1);
      expect(afterUnregister).assertEqual(1);
      expect(listener.events).assertDeepEquals(['change:0', 'delete:0']);
      expect(listener.events.length).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_ListenerCycle_0003 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_SEQ_0400
     * @tc.name      testDataSourceSequence0004
     * @tc.desc      验证多个监听器按注册顺序全部收到事件并按各自状态独立记录
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSourceSequence0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_MultiListener_0004 begin');
      let source: SongDataSource = new SongDataSource([makeSong(1), makeSong(2)]);
      let first: EventRecorder = new EventRecorder();
      let second: EventRecorder = new EventRecorder();
      let third: EventRecorder = new EventRecorder();
      source.registerDataChangeListener(first);
      source.registerDataChangeListener(second);
      source.registerDataChangeListener(third);
      source.unregisterDataChangeListener(second);
      source.notifyDataMove(0, 2);
      source.notifyDataReload();
      hilog.info(DOMAIN, TAG, '%{public}s',
        `监听1=${first.events}, 监听2=${second.events}, 监听3=${third.events}`);
      expect(first.events).assertDeepEquals(['move:0>2', 'reload']);
      expect(second.events.length).assertEqual(0);
      expect(third.events).assertDeepEquals(['move:0>2', 'reload']);
      expect(collectIds(source)).assertDeepEquals([1, 2]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_MultiListener_0004 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_SEQ_0500
     * @tc.name      testDataSourceSequence0005
     * @tc.desc      验证数据源构造后对传入数组的后续修改不影响内部数据且索引访问越界返回未定义
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSourceSequence0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_SourceIsolation_0005 begin');
      let input: SongItem[] = [makeSong(1), makeSong(2)];
      let source: SongDataSource = new SongDataSource(input);
      input.push(makeSong(3));
      let total: number = source.totalCount();
      let beyond: SongItem = source.getData(total);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `传入数组长度=${input.length}, 数据源总数=${total}, 越界访问是否为空=${beyond === undefined}`);
      expect(input.length).assertEqual(3);
      expect(total).assertEqual(2);
      expect(collectIds(source)).assertDeepEquals([1, 2]);
      expect(beyond === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_SourceIsolation_0005 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_SEQ_0600
     * @tc.name      testDataSourceSequence0006
     * @tc.desc      验证空数据源上追加、取首元素与通知事件的行为及总数返回值
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSourceSequence0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_EmptyThenPush_0006 begin');
      let source: SongDataSource = new SongDataSource([]);
      let listener: EventRecorder = new EventRecorder();
      source.registerDataChangeListener(listener);
      let emptyTotal: number = source.totalCount();
      let emptyItem: SongItem = source.getData(0);
      source.notifyDataReload();
      source.pushData(makeSong(7));
      let firstItem: SongItem = source.getData(0);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `初始总数=${emptyTotal}, 空取是否未定义=${emptyItem === undefined}, 追加后首元素id=${firstItem.id}`);
      expect(emptyTotal).assertEqual(0);
      expect(emptyItem === undefined).assertTrue();
      expect(firstItem.id).assertEqual(7);
      expect(source.totalCount()).assertEqual(1);
      expect(listener.events).assertDeepEquals(['reload', 'add:0']);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_EmptyThenPush_0006 end');
    });
  });
}
