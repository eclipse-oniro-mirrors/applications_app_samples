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

import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SongItem } from '../../../main/ets/viewmodel/SongData';
import { SongDataSource } from '../../../main/ets/viewmodel/SongDataSource';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

/**
 * DataChangeListener stub used to record notify events.
 */
class TestListener implements DataChangeListener {
  reloadCount: number = 0;
  addIndexes: number[] = [];
  deleteIndexes: number[] = [];
  changeIndexes: number[] = [];
  moveFrom: number = -1;
  moveTo: number = -1;

  onDataReloaded(): void {
    this.reloadCount++;
  }

  onDataAdd(index: number): void {
    this.addIndexes.push(index);
  }

  onDataMove(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
  }

  onDataDelete(index: number): void {
    this.deleteIndexes.push(index);
  }

  onDataChange(index: number): void {
    this.changeIndexes.push(index);
  }

  onDataAdded(index: number): void {
    this.addIndexes.push(index);
  }

  onDataMoved(from: number, to: number): void {
    this.moveFrom = from;
    this.moveTo = to;
  }

  onDataDeleted(index: number): void {
    this.deleteIndexes.push(index);
  }

  onDataChanged(index: number): void {
    this.changeIndexes.push(index);
  }

  onDatasetChange(dataOperations: DataOperation[]): void {
    this.reloadCount++;
  }
}

function makeSong(id: number, index: number): SongItem {
  let song: SongItem = new SongItem();
  song.id = id;
  song.index = index;
  song.src = `test_${id}.pcm`;
  song.lyric = '';
  return song;
}

export default function DataSource01Test() {
  describe('DataSource01Test', () => {
    let source: SongDataSource;
    let initSongs: SongItem[];

    beforeAll(() => {
      initSongs = [makeSong(1, 0), makeSong(2, 1), makeSong(3, 2)];
      source = new SongDataSource(initSongs);
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0100
     * @tc.name      testDataSource01Chapter0001
     * @tc.desc      Verify AudioMusicPlayer_DataSource_TotalCount_001
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_TotalCount_001 begin');
      let total: number = source.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `实际总数=${total}`);
      expect(total).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_TotalCount_001 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0200
     * @tc.name      testDataSource01Chapter0002
     * @tc.desc      Verify AudioMusicPlayer_DataSource_GetData_002
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_GetData_002 begin');
      let song: SongItem = source.getData(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `实际取到 id=${song.id}, src=${song.src}`);
      expect(song.id).assertEqual(2);
      expect(song.src).assertEqual('test_2.pcm');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_GetData_002 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0300
     * @tc.name      testDataSource01Chapter0003
     * @tc.desc      Verify AudioMusicPlayer_DataSource_PushData_003
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_PushData_003 begin');
      let before: number = source.totalCount();
      let song: SongItem = makeSong(4, 3);
      source.pushData(song);
      let after: number = source.totalCount();
      let lastId: number = source.getData(after - 1).id;
      hilog.info(DOMAIN, TAG, '%{public}s', `追加前总数=${before}, 追加后总数=${after}, 末尾id=${lastId}`);
      expect(after).assertEqual(before + 1);
      expect(lastId).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_PushData_003 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0400
     * @tc.name      testDataSource01Chapter0004
     * @tc.desc      Verify AudioMusicPlayer_DataSource_AddData_004
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_AddData_004 begin');
      let before: number = source.totalCount();
      let song: SongItem = makeSong(99, 0);
      source.addData(0, song);
      let after: number = source.totalCount();
      let headId: number = source.getData(0).id;
      let secondId: number = source.getData(1).id;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `插入前总数=${before}, 插入后总数=${after}, 头部id=${headId}, 第二位id=${secondId}`);
      expect(after).assertEqual(before + 1);
      expect(headId).assertEqual(99);
      expect(secondId).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_AddData_004 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0500
     * @tc.name      testDataSource01Chapter0005
     * @tc.desc      Verify AudioMusicPlayer_DataSource_RegisterDedup_005
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_RegisterDedup_005 begin');
      let source2: SongDataSource = new SongDataSource(initSongs);
      let listener: TestListener = new TestListener();
      source2.registerDataChangeListener(listener);
      source2.registerDataChangeListener(listener);
      source2.notifyDataAdd(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `实际收到的add通知=${listener.addIndexes.length}次`);
      expect(listener.addIndexes.length).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', `实际通知的index=${listener.addIndexes[0]}`);
      expect(listener.addIndexes[0]).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_RegisterDedup_005 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0600
     * @tc.name      testDataSource01Chapter0006
     * @tc.desc      Verify AudioMusicPlayer_DataSource_NotifyAllEvents_006
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_NotifyAllEvents_006 begin');
      let source3: SongDataSource = new SongDataSource(initSongs);
      let listener: TestListener = new TestListener();
      source3.registerDataChangeListener(listener);
      source3.notifyDataReload();
      source3.notifyDataChange(1);
      source3.notifyDataDelete(1);
      source3.notifyDataMove(0, 2);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `reload=${listener.reloadCount}, change=[${listener.changeIndexes}], ` +
        `delete=[${listener.deleteIndexes}], move=${listener.moveFrom}->${listener.moveTo}`);
      expect(listener.reloadCount).assertEqual(1);
      expect(listener.changeIndexes.length).assertEqual(1);
      expect(listener.changeIndexes[0]).assertEqual(1);
      expect(listener.deleteIndexes.length).assertEqual(1);
      expect(listener.deleteIndexes[0]).assertEqual(1);
      expect(listener.moveFrom).assertEqual(0);
      expect(listener.moveTo).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_NotifyAllEvents_006 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0700
     * @tc.name      testDataSource01Chapter0007
     * @tc.desc      Verify AudioMusicPlayer_DataSource_Unregister_007
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_Unregister_007 begin');
      let source4: SongDataSource = new SongDataSource(initSongs);
      let listener: TestListener = new TestListener();
      source4.registerDataChangeListener(listener);
      source4.unregisterDataChangeListener(listener);
      source4.notifyDataAdd(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `注销后收到的add通知=${listener.addIndexes.length}次`);
      expect(listener.addIndexes.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_Unregister_007 end');
    });

    /**
     * @tc.number    SUB_DATA_SOURCE_TEST01_0800
     * @tc.name      testDataSource01Chapter0008
     * @tc.desc      Verify AudioMusicPlayer_DataSource_UnregisterNotExist_008
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testDataSource01Chapter0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_UnregisterNotExist_008 begin');
      let source5: SongDataSource = new SongDataSource(initSongs);
      let listener: TestListener = new TestListener();
      source5.unregisterDataChangeListener(listener);
      let total: number = source5.totalCount();
      hilog.info(DOMAIN, TAG, '%{public}s', `未注册监听器注销后实际总数=${total}`);
      expect(total).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'DataSource_UnregisterNotExist_008 end');
    });
  });
}
