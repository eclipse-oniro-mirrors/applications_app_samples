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
import { songList } from '../../../main/ets/model/SongListData';
import { SongItem } from '../../../main/ets/viewmodel/SongData';
import { SongDataSource } from '../../../main/ets/viewmodel/SongDataSource';
import SongItemBuilder from '../../../main/ets/viewmodel/SongItemBuilder';
import { MediaTools } from '../../../main/ets/common/utils/mediautils/MediaTools';
import { makeSong, RecordingListener, joinEvents } from './TestData';
import { appContext } from './TestContext';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

/**
 * 独立复算列表总时长：逐首把毫秒值向下取整到秒再累加，与列表页展示口径一致。
 */
function totalSeconds(msList: number[]): number {
  let sum: number = 0;
  for (let ms of msList) {
    sum += Math.floor(ms / 1000);
  }
  return sum;
}

/**
 * 统计列表数据源中满足条件的条目数，用于断言筛选结果而不依赖数据源的内部实现。
 */
function countMatching(source: SongDataSource, predicate: (song: SongItem) => boolean): number {
  let count: number = 0;
  for (let index = 0; index < source.totalCount(); index++) {
    if (predicate(source.getData(index))) {
      count++;
    }
  }
  return count;
}

export default function SongListScenarioSuite() {
  describe('SongListScenarioSuite', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_0100
     * @tc.name      testSongScenario0001
     * @tc.desc      验证目录数据源首尾取数与顺序：首项与目录首曲一致、末项与目录末曲一致、逐项编号按目录顺序递增
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_ListOrder_0001 begin');
      let source: SongDataSource = new SongDataSource(songList);
      let ids: number[] = [];
      let ordered: boolean = true;
      for (let index = 0; index < source.totalCount(); index++) {
        let song: SongItem = source.getData(index);
        ids.push(song.id);
        if (song.id !== songList[index].id || song.src !== songList[index].src) {
          ordered = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `总数=${source.totalCount()}, 首项=${source.getData(0).src}, ` +
        `末项=${source.getData(source.totalCount() - 1).src}, 编号=${ids.join(',')}, 顺序一致=${ordered}`);
      expect(source.totalCount()).assertEqual(songList.length);
      expect(source.getData(0)).assertEqual(songList[0]);
      expect(source.getData(source.totalCount() - 1)).assertEqual(songList[songList.length - 1]);
      expect(ordered).assertTrue();
      expect(ids).assertDeepEquals([1, 2, 3, 4, 5, 6, 7, 8]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_ListOrder_0001 end');
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_0400
     * @tc.name      testSongScenario0004
     * @tc.desc      验证列表批量追加场景：向空列表连续追加目录全部歌曲后总数与目录一致，事件顺序为连续递增的插入位置
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_AppendAll_0004 begin');
      let source: SongDataSource = new SongDataSource([]);
      let listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      for (let song of songList) {
        source.pushData(song);
      }
      let expectedEvents: string[] = [];
      for (let index = 0; index < songList.length; index++) {
        expectedEvents.push(`add:${index}`);
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `追加后总数=${source.totalCount()}, 事件=${joinEvents(listener)}, 末项=${source.getData(source.totalCount() - 1).src}`);
      expect(source.totalCount()).assertEqual(songList.length);
      expect(listener.events).assertDeepEquals(expectedEvents);
      expect(source.getData(0)).assertEqual(songList[0]);
      expect(source.getData(source.totalCount() - 1)).assertEqual(songList[songList.length - 1]);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_AppendAll_0004 end');
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_0500
     * @tc.name      testSongScenario0005
     * @tc.desc      验证删除歌曲后列表使用删除通知刷新：重新加载后总数减一，删除位置及之后的歌曲前移一位，被删歌曲不再出现
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_RemoveSong_0005 begin');
      let remaining: SongItem[] = songList.slice();
      let removed: SongItem = remaining[3];
      let follower: SongItem = remaining[4];
      remaining.splice(3, 1);
      let source: SongDataSource = new SongDataSource(remaining);
      let listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataDelete(3);
      source.notifyDataReload();
      let ids: number[] = [];
      for (let index = 0; index < source.totalCount(); index++) {
        ids.push(source.getData(index).id);
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `删除编号=${removed.id}, 新索引3=${source.getData(3).id}, 原后一首=${follower.id}, 事件=${joinEvents(listener)}, 剩余编号=${ids.join(',')}`);
      expect(source.totalCount()).assertEqual(songList.length - 1);
      expect(source.getData(3)).assertEqual(follower);
      expect(ids.indexOf(removed.id)).assertEqual(-1);
      expect(ids).assertDeepEquals([1, 2, 3, 5, 6, 7, 8]);
      expect(listener.events).assertDeepEquals(['delete:3', 'reload']);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_RemoveSong_0005 end');
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_0600
     * @tc.name      testSongScenario0006
     * @tc.desc      验证列表为空时的边界：取首项、末项、负索引与超出末尾的索引都返回未定义，且更换数据后重新加载事件触发一次
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_EmptyAndAccess_0006 begin');
      let source: SongDataSource = new SongDataSource([]);
      let listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataReload();
      let probes: SongItem[] = [source.getData(0), source.getData(-1), source.getData(1), source.getData(1000)];
      let undefinedCount: number = 0;
      for (let probe of probes) {
        if (probe === undefined) {
          undefinedCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `空列表总数=${source.totalCount()}, 越界取数返回未定义个数=${undefinedCount}, 事件=${joinEvents(listener)}`);
      expect(source.totalCount()).assertEqual(0);
      expect(undefinedCount).assertEqual(4);
      expect(listener.events).assertDeepEquals(['reload']);
      expect(source.getData(0) === source.getData(-1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_EmptyAndAccess_0006 end');
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_0700
     * @tc.name      testSongScenario0007
     * @tc.desc      验证拖动调整顺序场景：把末曲重新放到首位后首项变为末曲、原首项后移一位、总数不变，并通知一次移动事件
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_Reorder_0007 begin');
      let reordered: SongItem[] = songList.slice();
      let lastIndex: number = reordered.length - 1;
      let moved: SongItem = reordered[lastIndex];
      let oldFirst: SongItem = reordered[0];
      reordered.splice(lastIndex, 1);
      reordered.unshift(moved);
      let source: SongDataSource = new SongDataSource(reordered);
      let listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataMove(lastIndex, 0);
      let ids: number[] = [];
      for (let index = 0; index < source.totalCount(); index++) {
        ids.push(source.getData(index).id);
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `移动后编号=${ids.join(',')}, 首项=${source.getData(0).id}, 原首项新位置=${ids.indexOf(oldFirst.id)}, 事件=${joinEvents(listener)}`);
      expect(source.totalCount()).assertEqual(songList.length);
      expect(source.getData(0)).assertEqual(moved);
      expect(source.getData(1)).assertEqual(oldFirst);
      expect(ids).assertDeepEquals([8, 1, 2, 3, 4, 5, 6, 7]);
      expect(listener.events).assertDeepEquals(['move:7->0']);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_Reorder_0007 end');
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_0800
     * @tc.name      testSongScenario0008
     * @tc.desc      验证单曲更新场景：换入同位置的新歌曲后该位置数据变化、邻居保持原对象与顺序，数据源只通知一次更新位置
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_UpdateOne_0008 begin');
      let updated: SongItem[] = songList.slice();
      let neighbor: SongItem = updated[2];
      let replacement: SongItem = makeSong(99, 3, 'replaced.pcm');
      updated[3] = replacement;
      let source: SongDataSource = new SongDataSource(updated);
      let listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(3);
      let afterNeighbor: SongItem = source.getData(2);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `更新后索引3=${source.getData(3).src}, 末尾=${source.getData(source.totalCount() - 1).src}, ` +
        `邻居保持同一对象=${afterNeighbor === neighbor}, 事件=${joinEvents(listener)}`);
      expect(source.getData(3)).assertEqual(replacement);
      expect(afterNeighbor === neighbor).assertTrue();
      expect(source.getData(4)).assertEqual(songList[4]);
      expect(source.totalCount()).assertEqual(songList.length);
      expect(listener.events).assertDeepEquals(['change:3']);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_UpdateOne_0008 end');
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_0900
     * @tc.name      testSongScenario0009
     * @tc.desc      验证构建器按目录顺序逐首准备播放资源：每首都返回原对象，后一首覆盖前一首的播放文件描述符且长度为该文件真实字节数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_BuilderChain_0009 begin');
      let builder: SongItemBuilder = new SongItemBuilder();
      let sameRefs: boolean = true;
      let lengths: number[] = [];
      let expectedSizes: number[] = [];
      let sampleIndexes: number[] = [0, 1, 7];
      try {
        for (let index of sampleIndexes) {
          let song: SongItem = songList[index];
          let built: SongItem = await builder.build(song);
          if (built !== song) {
            sameRefs = false;
          }
          let descriptor = builder.getRawFileDescriptor();
          lengths.push(descriptor !== undefined ? descriptor.length : -1);
          expectedSizes.push(appContext().resourceManager.getRawFdSync(song.src).length);
          appContext().resourceManager.closeRawFdSync(song.src);
        }
      } finally {
        await builder.release();
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `逐首构建返回原对象=${sameRefs}, 描述符长度=${lengths.join(',')}, 实际文件字节=${expectedSizes.join(',')}`);
      expect(sameRefs).assertTrue();
      expect(lengths).assertDeepEquals(expectedSizes);
      expect(lengths.every((value: number) => value > 0)).assertTrue();
      expect(lengths.length).assertEqual(sampleIndexes.length);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_BuilderChain_0009 end');
    });

    /**
     * @tc.number    SUB_SONG_SCENARIO_1000
     * @tc.name      testSongScenario0010
     * @tc.desc      验证列表总时长汇总：按毫秒时间显示为零的目录曲目汇总为零秒，并在加入一首有长度的曲目后总时长随之增长为对应秒数
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongScenario0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_TotalDuration_0010 begin');
      let catalogMs: number[] = [];
      for (let song of songList) {
        catalogMs.push(0);
      }
      let catalogTotal: number = totalSeconds(catalogMs);
      catalogMs.push(65000);
      let mixedTotal: number = totalSeconds(catalogMs);
      let displayedCatalog: string = MediaTools.msToCountdownTime(catalogTotal * 1000);
      let displayedMixed: string = MediaTools.msToCountdownTime(mixedTotal * 1000);
      hilog.info(DOMAIN, TAG, '%{public}s',
        `目录总时长=${catalogTotal}s 显示=${displayedCatalog}, 加入65s后=${mixedTotal}s 显示=${displayedMixed}`);
      expect(catalogTotal).assertEqual(0);
      expect(displayedCatalog).assertEqual('00:00');
      expect(mixedTotal).assertEqual(catalogTotal + 65);
      expect(displayedMixed).assertEqual('01:05');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'Scenario_TotalDuration_0010 end');
    });
  });
}
