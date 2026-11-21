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

import { describe, it, expect, beforeEach } from '@ohos/hypium';
import hilog from '@ohos.hilog';
import {
  AlbumSongSourceModel,
  AlbumPlayModeModel,
  AlbumRecordingListener,
  AlbumSongRecord,
  ALBUM_SONG_IDS,
  ALBUM_SONG_COUNT,
  ALBUM_VIP_IDS,
  ALBUM_PLAY_MODES,
  ALBUM_MODE_ORDER,
  ALBUM_MODE_RANDOM,
  ALBUM_MODE_SINGLE
} from '../Shared/AlbumSongSourceModel';

const DATASET = 'AlbumSongSourceValidation';
const DOMAIN: number = 0xF812;
const TAG: string = '[AlbumSongSourceValidation]';

function newSong(id: number): AlbumSongRecord {
  return { id: id, title: 'added' + String(id), singer: 'guest', isVip: false };
}

export default function albumSongSourceValidationSuite() {
  describe('AlbumSongSourceValidation', () => {
    let m: AlbumSongSourceModel = AlbumSongSourceModel.realAlbum();

    beforeEach(() => {
      m = AlbumSongSourceModel.realAlbum();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1777
     * @tc.name    AlbumSongSourceValidation1
     * @tc.desc    album catalog keeps the 24 shipped tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.totalCount()).assertEqual(24);
      expect(m.totalCount()).assertEqual(ALBUM_SONG_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1778
     * @tc.name    AlbumSongSourceValidation2
     * @tc.desc    album catalog starts at id 1 and ends at id 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const first: AlbumSongRecord | undefined = m.getData(0);
      const last: AlbumSongRecord | undefined = m.getData(23);
      expect(first === undefined ? -1 : first.id).assertEqual(1);
      expect(last === undefined ? -1 : last.id).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1779
     * @tc.name    AlbumSongSourceValidation3
     * @tc.desc    album catalog skips id 22 like the shipped song list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.indexOfId(22)).assertEqual(-1);
      expect(m.indexOfId(21)).assertEqual(20);
      expect(m.indexOfId(23)).assertEqual(21);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1780
     * @tc.name    AlbumSongSourceValidation4
     * @tc.desc    album catalog ids are strictly ascending
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let ascending: boolean = true;
      for (let i = 1; i < m.totalCount(); i++) {
        const prev: AlbumSongRecord | undefined = m.getData(i - 1);
        const cur: AlbumSongRecord | undefined = m.getData(i);
        if (prev !== undefined && cur !== undefined && prev.id >= cur.id) {
          ascending = false;
        }
      }
      expect(ascending).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1781
     * @tc.name    AlbumSongSourceValidation5
     * @tc.desc    album catalog only skips one identifier
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let gaps: number = 0;
      for (let i = 1; i < m.totalCount(); i++) {
        const prev: AlbumSongRecord | undefined = m.getData(i - 1);
        const cur: AlbumSongRecord | undefined = m.getData(i);
        if (prev !== undefined && cur !== undefined && cur.id - prev.id > 1) {
          gaps++;
        }
      }
      expect(gaps).assertEqual(1);
      expect(ALBUM_SONG_IDS.length).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1782
     * @tc.name    AlbumSongSourceValidation6
     * @tc.desc    album catalog ships exactly two vip tracks
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.vipCount()).assertEqual(2);
      expect(m.vipCount()).assertEqual(ALBUM_VIP_IDS.length);
      expect(m.indexOfId(1)).assertEqual(0);
      expect(m.indexOfId(12)).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1783
     * @tc.name    AlbumSongSourceValidation7
     * @tc.desc    album catalog vip tracks are the first and the twelfth entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const first: AlbumSongRecord | undefined = m.getData(0);
      const twelfth: AlbumSongRecord | undefined = m.getData(11);
      expect(first === undefined ? false : first.isVip).assertTrue();
      expect(twelfth === undefined ? false : twelfth.isVip).assertTrue();
      const second: AlbumSongRecord | undefined = m.getData(1);
      expect(second === undefined ? true : second.isVip).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1784
     * @tc.name    AlbumSongSourceValidation8
     * @tc.desc    album catalog identifies every track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueIds()).assertTrue();
      expect(m.totalCount()).assertEqual(ALBUM_SONG_IDS.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1785
     * @tc.name    AlbumSongSourceValidation9
     * @tc.desc    album catalog spreads singers over five buckets
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const singers: Set<string> = new Set<string>();
      for (let i = 0; i < m.totalCount(); i++) {
        const song: AlbumSongRecord | undefined = m.getData(i);
        if (song !== undefined) {
          singers.add(song.singer);
        }
      }
      expect(singers.size).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1786
     * @tc.name    AlbumSongSourceValidation10
     * @tc.desc    album catalog exposes the smallest and largest identifier
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let minId: number = 1000;
      let maxId: number = -1;
      for (let i = 0; i < m.totalCount(); i++) {
        const song: AlbumSongRecord | undefined = m.getData(i);
        if (song !== undefined) {
          minId = song.id < minId ? song.id : minId;
          maxId = song.id > maxId ? song.id : maxId;
        }
      }
      expect(minId).assertEqual(1);
      expect(maxId).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1787
     * @tc.name    AlbumSongSourceValidation11
     * @tc.desc    album catalog counts odd and even identifiers
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let odd: number = 0;
      for (let i = 0; i < m.totalCount(); i++) {
        const song: AlbumSongRecord | undefined = m.getData(i);
        if (song !== undefined && song.id % 2 === 1) {
          odd++;
        }
      }
      expect(odd).assertEqual(13);
      expect(m.totalCount() - odd).assertEqual(11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1788
     * @tc.name    AlbumSongSourceValidation12
     * @tc.desc    album catalog titles follow the track identifier
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'catalog12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const song: AlbumSongRecord | undefined = m.getData(5);
      expect(song === undefined ? '' : song.title).assertEqual('song6');
      expect(song === undefined ? '' : song.singer).assertEqual('singer1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1789
     * @tc.name    AlbumSongSourceValidation13
     * @tc.desc    first record is addressable by index zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'read1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const song: AlbumSongRecord | undefined = m.getData(0);
      expect(song === undefined ? -1 : song.id).assertEqual(1);
      expect(song === undefined ? '' : song.title).assertEqual('song1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1790
     * @tc.name    AlbumSongSourceValidation14
     * @tc.desc    last record is addressable by the final index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'read2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const song: AlbumSongRecord | undefined = m.getData(m.totalCount() - 1);
      expect(song === undefined ? -1 : song.id).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1791
     * @tc.name    AlbumSongSourceValidation15
     * @tc.desc    reading past the tail yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'read3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getData(24) === undefined).assertTrue();
      expect(m.getData(999) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1792
     * @tc.name    AlbumSongSourceValidation16
     * @tc.desc    reading a negative index yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'read4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.getData(-1) === undefined).assertTrue();
      expect(m.getData(-100) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1793
     * @tc.name    AlbumSongSourceValidation17
     * @tc.desc    inserting at the head shifts the previous first track
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'insert1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addData(0, newSong(100));
      const head: AlbumSongRecord | undefined = m.getData(0);
      expect(head === undefined ? -1 : head.id).assertEqual(100);
      expect(m.indexOfId(1)).assertEqual(1);
      expect(m.totalCount()).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1794
     * @tc.name    AlbumSongSourceValidation18
     * @tc.desc    inserting in the middle keeps both neighbours addressable
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'insert2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addData(12, newSong(101));
      expect(m.indexOfId(101)).assertEqual(12);
      expect(m.indexOfId(12)).assertEqual(11);
      expect(m.indexOfId(13)).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1795
     * @tc.name    AlbumSongSourceValidation19
     * @tc.desc    inserting at the tail index appends before the old last item
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'insert3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addData(24, newSong(102));
      expect(m.indexOfId(102)).assertEqual(24);
      expect(m.indexOfId(25)).assertEqual(23);
      expect(m.totalCount()).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1796
     * @tc.name    AlbumSongSourceValidation20
     * @tc.desc    pushData appends to the tail and reports the new index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'insert4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.pushData(newSong(103));
      expect(m.indexOfId(103)).assertEqual(24);
      expect(m.totalCount()).assertEqual(25);
      expect(listener.lastIndex).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1797
     * @tc.name    AlbumSongSourceValidation21
     * @tc.desc    insertion notifies listeners after the record is addressable
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'insert5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.addData(3, newSong(104));
      const inserted: AlbumSongRecord | undefined = m.getData(3);
      expect(listener.adds).assertEqual(1);
      expect(inserted === undefined ? -1 : inserted.id).assertEqual(104);
      expect(listener.lastIndex).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1798
     * @tc.name    AlbumSongSourceValidation22
     * @tc.desc    duplicate identifiers are rejected by the uniqueness probe
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'insert6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.hasUniqueIds()).assertTrue();
      m.pushData(newSong(5));
      expect(m.hasUniqueIds()).assertFalse();
      expect(m.indexOfId(5)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1799
     * @tc.name    AlbumSongSourceValidation23
     * @tc.desc    inserted vip record raises the vip counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'insert7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.vipCount();
      const vip: AlbumSongRecord = { id: 105, title: 'vip180', singer: 'guest', isVip: true };
      m.addData(0, vip);
      expect(m.vipCount()).assertEqual(before + 1);
      expect(m.vipCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1800
     * @tc.name    AlbumSongSourceValidation24
     * @tc.desc    deleting the head returns the removed record
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'delete1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const removed: AlbumSongRecord | undefined = m.deleteData(0);
      expect(removed === undefined ? -1 : removed.id).assertEqual(1);
      expect(m.totalCount()).assertEqual(23);
      expect(m.indexOfId(1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1801
     * @tc.name    AlbumSongSourceValidation25
     * @tc.desc    deletion shifts the following identifiers down by one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'delete2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.deleteData(0);
      expect(m.indexOfId(2)).assertEqual(0);
      expect(m.indexOfId(3)).assertEqual(1);
      expect(m.indexOfId(25)).assertEqual(22);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1802
     * @tc.name    AlbumSongSourceValidation26
     * @tc.desc    deleting outside the range is a no-op
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'delete3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.deleteData(24) === undefined).assertTrue();
      expect(m.deleteData(-1) === undefined).assertTrue();
      expect(m.totalCount()).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1803
     * @tc.name    AlbumSongSourceValidation27
     * @tc.desc    deleting the tail keeps the remainder unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'delete4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const removed: AlbumSongRecord | undefined = m.deleteData(23);
      expect(removed === undefined ? -1 : removed.id).assertEqual(25);
      expect(m.totalCount()).assertEqual(23);
      expect(m.hasUniqueIds()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1804
     * @tc.name    AlbumSongSourceValidation28
     * @tc.desc    deletion notifies listeners with the removed index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'delete5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.deleteData(11);
      expect(listener.deletes).assertEqual(1);
      expect(listener.lastIndex).assertEqual(11);
      expect(m.indexOfId(12)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1805
     * @tc.name    AlbumSongSourceValidation29
     * @tc.desc    deleting the vip record drops the vip counter
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'delete6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.vipCount();
      m.deleteData(11);
      expect(m.vipCount()).assertEqual(before - 1);
      expect(m.vipCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1806
     * @tc.name    AlbumSongSourceValidation30
     * @tc.desc    first registration is accepted
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      expect(m.registerDataChangeListener(listener)).assertTrue();
      expect(m.getListenerCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1807
     * @tc.name    AlbumSongSourceValidation31
     * @tc.desc    the same listener is registered only once
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      expect(m.registerDataChangeListener(listener)).assertFalse();
      expect(m.getListenerCount()).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1808
     * @tc.name    AlbumSongSourceValidation32
     * @tc.desc    unregistering a known listener succeeds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      expect(m.unregisterDataChangeListener(listener)).assertTrue();
      expect(m.getListenerCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1809
     * @tc.name    AlbumSongSourceValidation33
     * @tc.desc    unregistering an unknown listener is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      expect(m.unregisterDataChangeListener(listener)).assertFalse();
      expect(m.getListenerCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1810
     * @tc.name    AlbumSongSourceValidation34
     * @tc.desc    two listeners both receive the add notification
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const a: AlbumRecordingListener = new AlbumRecordingListener();
      const b: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(a);
      m.registerDataChangeListener(b);
      m.pushData(newSong(106));
      expect(a.adds).assertEqual(1);
      expect(b.adds).assertEqual(1);
      expect(a.lastIndex).assertEqual(b.lastIndex);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1811
     * @tc.name    AlbumSongSourceValidation35
     * @tc.desc    three listeners receive the change notification
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const a: AlbumRecordingListener = new AlbumRecordingListener();
      const b: AlbumRecordingListener = new AlbumRecordingListener();
      const c: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(a);
      m.registerDataChangeListener(b);
      m.registerDataChangeListener(c);
      m.notifyDataChange(7);
      expect(a.changes + b.changes + c.changes).assertEqual(3);
      expect(c.lastIndex).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1812
     * @tc.name    AlbumSongSourceValidation36
     * @tc.desc    the removed listener stops receiving notifications
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const kept: AlbumRecordingListener = new AlbumRecordingListener();
      const dropped: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(kept);
      m.registerDataChangeListener(dropped);
      m.unregisterDataChangeListener(dropped);
      m.notifyDataDelete(2);
      expect(kept.deletes).assertEqual(1);
      expect(dropped.deletes).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1813
     * @tc.name    AlbumSongSourceValidation37
     * @tc.desc    move notifications keep both indices
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.notifyDataMove(3, 9);
      expect(listener.moves).assertEqual(1);
      expect(listener.lastFrom).assertEqual(3);
      expect(listener.lastTo).assertEqual(9);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1814
     * @tc.name    AlbumSongSourceValidation38
     * @tc.desc    reload notifications are not counted as adds
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.notifyDataReload();
      expect(listener.reloads).assertEqual(1);
      expect(listener.adds).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1815
     * @tc.name    AlbumSongSourceValidation39
     * @tc.desc    notification sequence is recorded in dispatch order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.notifyDataAdd(1);
      m.notifyDataChange(2);
      m.notifyDataDelete(3);
      expect(listener.sequence).assertEqual('A1;C2;D3;');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1816
     * @tc.name    AlbumSongSourceValidation40
     * @tc.desc    notifications keep working after all listeners leave
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.unregisterDataChangeListener(listener);
      m.notifyDataAdd(0);
      expect(listener.adds).assertEqual(0);
      expect(m.getListenerCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1817
     * @tc.name    AlbumSongSourceValidation41
     * @tc.desc    double unregistration keeps the registry empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.unregisterDataChangeListener(listener);
      expect(m.unregisterDataChangeListener(listener)).assertFalse();
      expect(m.getListenerCount()).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1818
     * @tc.name    AlbumSongSourceValidation42
     * @tc.desc    listener registry survives data mutations
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'listener13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.addData(0, newSong(107));
      m.deleteData(0);
      m.pushData(newSong(108));
      expect(m.getListenerCount()).assertEqual(1);
      expect(listener.adds).assertEqual(2);
      expect(listener.deletes).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1819
     * @tc.name    AlbumSongSourceValidation43
     * @tc.desc    sm renders a single lane
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lanes1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.lanesOf('sm')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1820
     * @tc.name    AlbumSongSourceValidation44
     * @tc.desc    md renders a single lane
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lanes2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.lanesOf('md')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1821
     * @tc.name    AlbumSongSourceValidation45
     * @tc.desc    lg renders two lanes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lanes3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.lanesOf('lg')).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1822
     * @tc.name    AlbumSongSourceValidation46
     * @tc.desc    unknown breakpoint stays single lane
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lanes4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.lanesOf('')).assertEqual(1);
      expect(m.lanesOf('xl')).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1823
     * @tc.name    AlbumSongSourceValidation47
     * @tc.desc    lane count only changes for lg
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'lanes5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let trace: string = '';
      const points: string[] = ['sm', 'md', 'lg', ''];
      for (let i = 0; i < points.length; i++) {
        trace += String(m.lanesOf(points[i])) + ',';
      }
      expect(trace).assertEqual('1,1,2,1,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1824
     * @tc.name    AlbumSongSourceValidation48
     * @tc.desc    sm song font leaves a 10 vp singer caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'font1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.singerFontSize(14)).assertEqual(10);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1825
     * @tc.name    AlbumSongSourceValidation49
     * @tc.desc    md song font leaves a 12 vp singer caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'font2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.singerFontSize(16)).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1826
     * @tc.name    AlbumSongSourceValidation50
     * @tc.desc    lg song font leaves a 14 vp singer caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'font3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.singerFontSize(18)).assertEqual(14);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1827
     * @tc.name    AlbumSongSourceValidation51
     * @tc.desc    singer caption is always four vp smaller
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'font4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.singerFontSize(20) - m.singerFontSize(14)).assertEqual(6);
      expect(20 - m.singerFontSize(20)).assertEqual(4);
      expect(16 - m.singerFontSize(16)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1828
     * @tc.name    AlbumSongSourceValidation52
     * @tc.desc    order advances to random
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.nextMode(ALBUM_MODE_ORDER)).assertEqual(ALBUM_MODE_RANDOM);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1829
     * @tc.name    AlbumSongSourceValidation53
     * @tc.desc    random advances to single
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.nextMode(ALBUM_MODE_RANDOM)).assertEqual(ALBUM_MODE_SINGLE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1830
     * @tc.name    AlbumSongSourceValidation54
     * @tc.desc    single wraps back to order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.nextMode(ALBUM_MODE_SINGLE)).assertEqual(ALBUM_MODE_ORDER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1831
     * @tc.name    AlbumSongSourceValidation55
     * @tc.desc    unknown mode normalises to order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.nextMode('shuffle')).assertEqual(ALBUM_MODE_ORDER);
      expect(AlbumPlayModeModel.nextMode('')).assertEqual(ALBUM_MODE_ORDER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1832
     * @tc.name    AlbumSongSourceValidation56
     * @tc.desc    all three modes are recognised
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.isKnownMode(ALBUM_MODE_ORDER)).assertTrue();
      expect(AlbumPlayModeModel.isKnownMode(ALBUM_MODE_RANDOM)).assertTrue();
      expect(AlbumPlayModeModel.isKnownMode(ALBUM_MODE_SINGLE)).assertTrue();
      expect(ALBUM_PLAY_MODES.length).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1833
     * @tc.name    AlbumSongSourceValidation57
     * @tc.desc    unknown modes are not recognised
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.isKnownMode('shuffle')).assertFalse();
      expect(AlbumPlayModeModel.isKnownMode('loop')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1834
     * @tc.name    AlbumSongSourceValidation58
     * @tc.desc    three steps restore order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.cycleFrom(ALBUM_MODE_ORDER, 3)).assertEqual(ALBUM_MODE_ORDER);
      expect(AlbumPlayModeModel.cycleFrom(ALBUM_MODE_ORDER, 6)).assertEqual(ALBUM_MODE_ORDER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1835
     * @tc.name    AlbumSongSourceValidation59
     * @tc.desc    three steps from any mode return the same mode
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.cycleFrom(ALBUM_MODE_RANDOM, 3)).assertEqual(ALBUM_MODE_RANDOM);
      expect(AlbumPlayModeModel.cycleFrom(ALBUM_MODE_SINGLE, 3)).assertEqual(ALBUM_MODE_SINGLE);
      expect(AlbumPlayModeModel.cycleFrom(ALBUM_MODE_RANDOM, 2)).assertEqual(ALBUM_MODE_ORDER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1836
     * @tc.name    AlbumSongSourceValidation60
     * @tc.desc    unknown starting mode is normalised before cycling
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.cycleFrom('shuffle', 1)).assertEqual(ALBUM_MODE_RANDOM);
      expect(AlbumPlayModeModel.cycleFrom('shuffle', 0)).assertEqual(ALBUM_MODE_ORDER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1837
     * @tc.name    AlbumSongSourceValidation61
     * @tc.desc    zero steps never move the mode
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(AlbumPlayModeModel.cycleFrom(ALBUM_MODE_ORDER, 0)).assertEqual(ALBUM_MODE_ORDER);
      expect(AlbumPlayModeModel.cycleFrom(ALBUM_MODE_SINGLE, 0)).assertEqual(ALBUM_MODE_SINGLE);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1838
     * @tc.name    AlbumSongSourceValidation62
     * @tc.desc    each step yields a distinct mode across one full cycle
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'mode11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const seen: Set<string> = new Set<string>();
      let mode: string = ALBUM_MODE_ORDER;
      for (let i = 0; i < 3; i++) {
        seen.add(mode);
        mode = AlbumPlayModeModel.nextMode(mode);
      }
      expect(seen.size).assertEqual(3);
      expect(mode).assertEqual(ALBUM_MODE_ORDER);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1839
     * @tc.name    AlbumSongSourceValidation63
     * @tc.desc    insert then delete restores the original catalog
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'scenario1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addData(0, newSong(109));
      expect(m.totalCount()).assertEqual(25);
      m.deleteData(0);
      expect(m.totalCount()).assertEqual(24);
      expect(m.indexOfId(1)).assertEqual(0);
      expect(m.hasUniqueIds()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1840
     * @tc.name    AlbumSongSourceValidation64
     * @tc.desc    push then delete tail restores the catalog
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'scenario2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.pushData(newSong(110));
      const removed: AlbumSongRecord | undefined = m.deleteData(m.totalCount() - 1);
      expect(removed === undefined ? -1 : removed.id).assertEqual(110);
      const last: AlbumSongRecord | undefined = m.getData(23);
      expect(m.totalCount()).assertEqual(24);
      expect(last === undefined ? -1 : last.id).assertEqual(25);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1841
     * @tc.name    AlbumSongSourceValidation65
     * @tc.desc    inserted vip survives a following insert
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'scenario3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const vip: AlbumSongRecord = { id: 111, title: 'vip111', singer: 'guest', isVip: true };
      m.addData(0, vip);
      m.addData(0, newSong(112));
      expect(m.indexOfId(111)).assertEqual(1);
      expect(m.vipCount()).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1842
     * @tc.name    AlbumSongSourceValidation66
     * @tc.desc    listener sees a consistent index across mixed operations
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'scenario4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const listener: AlbumRecordingListener = new AlbumRecordingListener();
      m.registerDataChangeListener(listener);
      m.addData(0, newSong(113));
      m.notifyDataChange(5);
      m.notifyDataMove(1, 2);
      expect(listener.adds).assertEqual(1);
      expect(listener.changes).assertEqual(1);
      expect(listener.moves).assertEqual(1);
      expect(listener.lastFrom).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_ALBUM_1843
     * @tc.name    AlbumSongSourceValidation67
     * @tc.desc    catalog remains unique after a delete and re-insert cycle
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'scenario5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const removed: AlbumSongRecord | undefined = m.deleteData(10);
      m.pushData(removed === undefined ? newSong(114) : removed);
      expect(m.totalCount()).assertEqual(24);
      expect(m.hasUniqueIds()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })
  })
}
