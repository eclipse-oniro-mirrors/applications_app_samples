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
import { resourceManager } from '@kit.LocalizationKit';
import { SongItem } from '../../../main/ets/viewmodel/SongData';
import { SongDataSource } from '../../../main/ets/viewmodel/SongDataSource';
import { songList } from '../../../main/ets/model/SongListData';
import { RecordingListener, joinEvents, makeSong, makeSongs } from './TestData';
import { appContext } from './TestContext';
import { paceTurn } from './TestPace';

const TAG: string = 'Sample_AudioMusicPlayer';
const DOMAIN: number = 0xF811;
const BUNDLE: string = 'AudioMusicPlayer_';

function takeIds(source: SongDataSource): number[] {
  let ids: number[] = [];
  for (let i = 0; i < source.totalCount(); i++) {
    ids.push(source.getData(i).id);
  }
  return ids;
}

function firstKey(names: string[], prefix: string): number {
  for (let i = 0; i < names.length; i++) {
    if (names[i].startsWith(prefix)) {
      return i;
    }
  }
  return -1;
}

function nullKey(keys: number[], target: number): boolean {
  for (let key of keys) {
    if (key === target) {
      return true;
    }
  }
  return false;
}

export default function SongModelSuite() {
  describe('SongModelSuite', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0100
     * @tc.name      testSongModel0001
     * @tc.desc      验证新建歌曲条目默认值：主键与索引为零、文本字段为空串、封面标记带资源主键、背景非深色
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_Defaults_0001 begin');
      let song: SongItem = new SongItem();
      let markId: number = song.mark.id as number;
      let labelId: number = song.label.id as number;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `id=${song.id}, index=${song.index}, mark.id=${markId}, label.id=${labelId}`);
      expect(song.id).assertEqual(0);
      expect(song.index).assertEqual(0);
      expect(song.src).assertEqual('');
      expect(song.lyric).assertEqual('');
      expect(song.title === undefined).assertTrue();
      expect(song.singer === undefined).assertTrue();
      expect(song.isDarkBackground).assertFalse();
      expect(markId > 0).assertTrue();
      expect(markId === labelId).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_Defaults_0001 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0200
     * @tc.name      testSongModel0002
     * @tc.desc      验证歌曲条目实例互相独立：修改一个条目的深色背景、音频源与歌词路径不影响另一个条目
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_Isolation_0002 begin');
      let first: SongItem = new SongItem();
      let second: SongItem = new SongItem();
      first.isDarkBackground = true;
      first.src = 'isolation_a.pcm';
      first.lyric = 'lrcfiles/a.lrc';
      first.id = 1;
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首条=${first.id}/${first.src}, 次条=${second.id}/${second.src}/深色=${second.isDarkBackground}`);
      expect(second.isDarkBackground).assertFalse();
      expect(second.src).assertEqual('');
      expect(second.lyric).assertEqual('');
      expect(second.id).assertEqual(0);
      expect(first.src === second.src).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_Isolation_0002 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0300
     * @tc.name      testSongModel0003
     * @tc.desc      验证歌曲目录条目与歌曲总数一致：主键连续、索引等于位置、音频源与歌词路径非空
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_CatalogOrder_0003 begin');
      let sequential: boolean = true;
      let emptySrc: number = 0;
      for (let i = 0; i < songList.length; i++) {
        if (songList[i].id !== i + 1 || songList[i].index !== i) {
          sequential = false;
        }
        if (songList[i].src.length === 0) {
          emptySrc++;
        }
      }
      let lyricCount: number = 0;
      for (let song of songList) {
        if (song.lyric.length > 0) {
          lyricCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `顺序一致=${sequential}, 空音频源=${emptySrc}, 带歌词=${lyricCount}`);
      expect(songList.length).assertEqual(8);
      expect(sequential).assertTrue();
      expect(emptySrc).assertEqual(0);
      expect(lyricCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_CatalogOrder_0003 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0400
     * @tc.name      testSongModel0004
     * @tc.desc      验证封面标记与头像标签资源各有两个取值，且深色背景条目与封面标记取值分布合理
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_LabelVariants_0004 begin');
      let markIds: number[] = [];
      let labelIds: number[] = [];
      let darkCount: number = 0;
      for (let song of songList) {
        let markId: number = song.mark.id as number;
        let labelId: number = song.label.id as number;
        if (!nullKey(markIds, markId)) {
          markIds.push(markId);
        }
        if (!nullKey(labelIds, labelId)) {
          labelIds.push(labelId);
        }
        if (song.isDarkBackground) {
          darkCount++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `标记种类=${markIds.length}, 头像种类=${labelIds.length}, 深色条目=${darkCount}`);
      expect(markIds.length).assertEqual(2);
      expect(labelIds.length).assertEqual(8);
      expect(darkCount).assertEqual(5);
      expect(darkCount < songList.length).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_LabelVariants_0004 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0500
     * @tc.name      testSongModel0005
     * @tc.desc      验证歌曲目录中首曲带歌词且歌词路径指向真实文件，其余歌曲歌词路径为空串
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_LyricOnly_0005 begin');
      let manager: resourceManager.ResourceManager = appContext().resourceManager;
      let firstSong: SongItem = songList[0];
      let bytes: Uint8Array = await manager.getRawFileContent(firstSong.lyric);
      let othersEmpty: number = 0;
      for (let i = 1; i < songList.length; i++) {
        if (songList[i].lyric === '') {
          othersEmpty++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s',
        `首曲歌词=${firstSong.lyric}, 字节=${bytes.length}, 其余为空=${othersEmpty}`);
      expect(firstSong.lyric.length > 0).assertTrue();
      expect(bytes.length).assertEqual(1796);
      expect(othersEmpty).assertEqual(songList.length - 1);
      expect(firstSong.lyric.indexOf('/') > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_LyricOnly_0005 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0600
     * @tc.name      testSongModel0006
     * @tc.desc      验证歌曲源文件名唯一到类型：存在 pcm 与 wav 两种格式，同格式下多曲可共用同一文件
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    

    /**
     * @tc.number    SUB_SONG_MODEL_0700
     * @tc.name      testSongModel0007
     * @tc.desc      验证数据源以歌曲目录初始化后总数与目录一致，索引访问取到的元素即为目录同位置条目
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_CatalogSource_0007 begin');
      let source: SongDataSource = new SongDataSource(songList);
      let sameRefs: number = 0;
      for (let i = 0; i < songList.length; i++) {
        if (source.getData(i) === songList[i]) {
          sameRefs++;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `总数=${source.totalCount()}, 同引用=${sameRefs}`);
      expect(source.totalCount()).assertEqual(songList.length);
      expect(sameRefs).assertEqual(songList.length);
      expect(source.getData(0).src).assertEqual('Delacey - Dream It Possible.pcm');
      expect(source.getData(songList.length - 1).id).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_CatalogSource_0007 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0800
     * @tc.name      testSongModel0008
     * @tc.desc      验证累积追加一批歌曲后数据源保持插入顺序，事件序列与追加位置一一对应
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_BatchAppend_0008 begin');
      let source: SongDataSource = new SongDataSource([]);
      let listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      for (let song of makeSongs(8)) {
        source.pushData(song);
      }
      let ids: number[] = takeIds(source);
      let orderOk: boolean = true;
      for (let i = 0; i < ids.length; i++) {
        if (ids[i] !== i + 1) {
          orderOk = false;
        }
      }
      let events: string = joinEvents(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `ids=${ids.join(',')}, 事件=${events}`);
      expect(source.totalCount()).assertEqual(8);
      expect(orderOk).assertTrue();
      expect(events).assertEqual('add:0|add:1|add:2|add:3|add:4|add:5|add:6|add:7');
      expect(source.getData(7).src).assertEqual('t_8.pcm');
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_BatchAppend_0008 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_0900
     * @tc.name      testSongModel0009
     * @tc.desc      验证穿插插入头尾后对象引用保持不变，按 id 反查得到的位置与插入顺序吻合
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_Interleave_0009 begin');
      let head: SongItem = makeSong(101, 0);
      let middle: SongItem = makeSong(102, 1);
      let tail: SongItem = makeSong(103, 2);
      let source: SongDataSource = new SongDataSource([middle]);
      source.addData(0, head);
      source.pushData(tail);
      let names: string[] = [];
      for (let i = 0; i < source.totalCount(); i++) {
        names.push(`#${source.getData(i).id}:${source.getData(i).src}`);
      }
      let headIndex: number = firstKey(names, '#101');
      let middleIndex: number = firstKey(names, '#102');
      let tailIndex: number = firstKey(names, '#103');
      hilog.info(DOMAIN, TAG, '%{public}s', `顺序=${names.join(' > ')}`);
      expect(headIndex).assertEqual(0);
      expect(middleIndex).assertEqual(1);
      expect(tailIndex).assertEqual(2);
      expect(source.getData(0) === head).assertTrue();
      expect(source.getData(2) === tail).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_Interleave_0009 end');
    });

    /**
     * @tc.number    SUB_SONG_MODEL_1000
     * @tc.name      testSongModel0010
     * @tc.desc      验证为数据源单独通知各类变更时事件类型与参数严格对应，数据本身不被通知改变
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     LEVEL0
     */
    it('testSongModel0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_NotifyKinds_0010 begin');
      let source: SongDataSource = new SongDataSource(makeSongs(3));
      let listener: RecordingListener = new RecordingListener();
      source.registerDataChangeListener(listener);
      source.notifyDataChange(1);
      source.notifyDataMove(2, 0);
      source.notifyDataDelete(2);
      source.notifyDataAdd(3);
      source.notifyDataReload();
      let events: string = joinEvents(listener);
      hilog.info(DOMAIN, TAG, '%{public}s', `事件=${events}, 总数=${source.totalCount()}`);
      expect(events).assertEqual('change:1|move:2->0|delete:2|add:3|reload');
      expect(source.totalCount()).assertEqual(3);
      expect(takeIds(source).join(',')).assertEqual('1,2,3');
      expect(listener.events.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', BUNDLE + 'SongModel_NotifyKinds_0010 end');
    });
  });
}
