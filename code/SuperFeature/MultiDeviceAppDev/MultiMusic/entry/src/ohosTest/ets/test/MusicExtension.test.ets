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

import { describe, it, expect } from '@ohos/hypium';
import { IconItem, OffsetDataType, PaddingDataType, SongType } from '../../../main/ets/model/DataType';
import { songsList } from '../../../main/ets/model/DataSummary';
import {
  MUSIC_PLAYLIST_COUNT,
  MUSIC_TITLE_PREFIX,
  MusicModel,
  MusicOffset,
  MusicPadding,
  MusicPlaylistItem
} from './Shared/MusicModel';

const DATASET = 'MusicExtensionTest_';

export default function musicExtensionSuite() {
  describe('MusicFeatureExtension', () => {
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1316
     * @tc.name    MusicExtension1316
     * @tc.desc    Icon item instances do not share mutable fields
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'IconItem_001', 0, () => {
      const first: IconItem = new IconItem($r('app.media.list1'), 'first');
      const second: IconItem = new IconItem($r('app.media.list2'), 'second');
      expect(first.description as string).assertEqual('first');
      expect(second.description as string).assertEqual('second');
      expect(first.imageSrc.id === second.imageSrc.id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1317
     * @tc.name    MusicExtension1317
     * @tc.desc    Offset instances keep independent coordinates
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'OffsetDataType_001', 0, () => {
      const first: OffsetDataType = new OffsetDataType(1, 2);
      const second: OffsetDataType = new OffsetDataType(3, 4);
      expect(first.x + first.y).assertEqual(3);
      expect(second.x + second.y).assertEqual(7);
      expect(first.x).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1318
     * @tc.name    MusicExtension1318
     * @tc.desc    Song item keeps a negative play count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'SongType_001', 0, () => {
      const song: SongType = new SongType($r('app.media.list1'), $r('app.media.list2'), -3);
      expect(song.count).assertEqual(-3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1319
     * @tc.name    MusicExtension1319
     * @tc.desc    The two halves of the recommendation list repeat the same captions
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songsList_001', 0, () => {
      for (let i = 0; i < 6; i++) {
        expect(songsList[i].description as string).assertEqual(songsList[i + 6].description as string);
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1320
     * @tc.name    MusicExtension1320
     * @tc.desc    The first and last recommendations use different cover resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songsList_002', 0, () => {
      expect(songsList[0].imageSrc.id === songsList[songsList.length - 1].imageSrc.id).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1321
     * @tc.name    MusicExtension1321
     * @tc.desc    Exposed playlist array has the advertised length
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getPlaylists_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      expect(list.length).assertEqual(MUSIC_PLAYLIST_COUNT);
      expect(list.length).assertEqual(model.getPlaylistCount());
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1322
     * @tc.name    MusicExtension1322
     * @tc.desc    Playlist index field matches the array position
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getPlaylists_002', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      for (let i = 0; i < list.length; i++) {
        expect(list[i].index).assertEqual(i);
      }
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1323
     * @tc.name    MusicExtension1323
     * @tc.desc    Playlist titles follow the prefix and one based numbering
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getPlaylists_003', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      expect(list[0].title).assertEqual(MUSIC_TITLE_PREFIX + '1');
      expect(list[6].title).assertEqual(MUSIC_TITLE_PREFIX + '7');
      expect(list[list.length - 1].title).assertEqual(MUSIC_TITLE_PREFIX + String(MUSIC_PLAYLIST_COUNT));
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1324
     * @tc.name    MusicExtension1324
     * @tc.desc    Playlist accessor reuses the same backing array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'getPlaylists_004', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists() === model.getPlaylists()).assertTrue();
      expect(model.getPlaylists()[0] === model.getPlaylistByIndex(0)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1325
     * @tc.name    MusicExtension1325
     * @tc.desc    Playlist lookup rejects both negative and upper bound indices
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'getPlaylistByIndex_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylistByIndex(-1) === undefined).assertTrue();
      expect(model.getPlaylistByIndex(MUSIC_PLAYLIST_COUNT) === undefined).assertTrue();
      expect(model.getPlaylistByIndex(MUSIC_PLAYLIST_COUNT - 1) !== undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1326
     * @tc.name    MusicExtension1326
     * @tc.desc    Offset factory preserves fractional components
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'makeOffset_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const offset: MusicOffset = model.makeOffset(-1.5, 0.5);
      expect(offset.x).assertEqual(-1.5);
      expect(offset.y).assertEqual(0.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1327
     * @tc.name    MusicExtension1327
     * @tc.desc    Offset accumulation keeps negative components
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'accumulateOffset_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const result: MusicOffset = model.accumulateOffset(model.makeOffset(-2, 3), model.makeOffset(1, -5));
      expect(result.x).assertEqual(-1);
      expect(result.y).assertEqual(-2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1328
     * @tc.name    MusicExtension1328
     * @tc.desc    Accumulating a zero offset leaves the original vector unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'accumulateOffset_002', 0, () => {
      const model: MusicModel = new MusicModel();
      const base: MusicOffset = model.makeOffset(5, -7);
      const result: MusicOffset = model.accumulateOffset(base, model.makeOffset(0, 0));
      expect(result.x).assertEqual(5);
      expect(result.y).assertEqual(-7);
      expect(result === base).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1329
     * @tc.name    MusicExtension1329
     * @tc.desc    Offset accumulation is commutative for both axes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'accumulateOffset_003', 0, () => {
      const model: MusicModel = new MusicModel();
      const a: MusicOffset = model.makeOffset(1.5, -2.5);
      const b: MusicOffset = model.makeOffset(-0.5, 4);
      const ab: MusicOffset = model.accumulateOffset(a, b);
      const ba: MusicOffset = model.accumulateOffset(b, a);
      expect(ab.x).assertEqual(ba.x);
      expect(ab.y).assertEqual(ba.y);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1330
     * @tc.name    MusicExtension1330
     * @tc.desc    Zero padding is accepted as valid
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'isValidPadding_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.isValidPadding(model.makePadding(0, 0))).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1331
     * @tc.name    MusicExtension1331
     * @tc.desc    Negative padding on either side is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'isValidPadding_002', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.isValidPadding(model.makePadding(-1, 0))).assertFalse();
      expect(model.isValidPadding(model.makePadding(0, -1))).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1332
     * @tc.name    MusicExtension1332
     * @tc.desc    Horizontal padding sums both sides including negative values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'horizontalPadding_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(-4, 10);
      expect(model.horizontalPadding(padding)).assertEqual(6);
      expect(model.horizontalPadding(model.makePadding(24, 16))).assertEqual(40);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1333
     * @tc.name    MusicExtension1333
     * @tc.desc    Clamping lifts negative coordinates up to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampOffset_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const result: MusicOffset = model.clampOffset(model.makeOffset(-10, -20), 100, 200);
      expect(result.x).assertEqual(0);
      expect(result.y).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1334
     * @tc.name    MusicExtension1334
     * @tc.desc    Clamping pins coordinates that exceed the maximum to the limit
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampOffset_002', 0, () => {
      const model: MusicModel = new MusicModel();
      const result: MusicOffset = model.clampOffset(model.makeOffset(150, 250), 100, 200);
      expect(result.x).assertEqual(100);
      expect(result.y).assertEqual(200);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1335
     * @tc.name    MusicExtension1335
     * @tc.desc    A coordinate already on the limit stays untouched by clamping
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampOffset_003', 0, () => {
      const model: MusicModel = new MusicModel();
      const result: MusicOffset = model.clampOffset(model.makeOffset(100, 0), 100, 200);
      expect(result.x).assertEqual(100);
      expect(result.y).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1336
     * @tc.name    MusicExtension1336
     * @tc.desc    Generated playlist titles are pairwise unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'hasUniqueTitles_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.hasUniqueTitles()).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1337
     * @tc.name    MusicExtension1337
     * @tc.desc    Page count for an empty or negative page size is zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPages_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(0)).assertEqual(0);
      expect(model.totalPages(-5)).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1338
     * @tc.name    MusicExtension1338
     * @tc.desc    Page count rounds a partial final page up
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPages_002', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(5)).assertEqual(3);
      expect(model.totalPages(12)).assertEqual(1);
      expect(model.totalPages(13)).assertEqual(1);
      expect(model.totalPages(1)).assertEqual(MUSIC_PLAYLIST_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1339
     * @tc.name    MusicExtension1339
     * @tc.desc    Last page exposes only the remaining entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(2, 5).length).assertEqual(2);
      expect(model.slicePage(2, 5)[0].index).assertEqual(10);
      expect(model.slicePage(0, 5).length).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1340
     * @tc.name    MusicExtension1340
     * @tc.desc    A page beyond the last index yields an empty array
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'slicePage_002', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(3, 5).length).assertEqual(0);
      expect(model.slicePage(12, 5).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1341
     * @tc.name    MusicExtension1341
     * @tc.desc    Search is case sensitive and matches the common title prefix
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchTitle_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('list')).assertEqual(MUSIC_PLAYLIST_COUNT);
      expect(model.searchTitle('LIST')).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1342
     * @tc.name    MusicExtension1342
     * @tc.desc    Search matches digits inside multi digit titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchTitle_002', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('list1')).assertEqual(4);
      expect(model.searchTitle('list12')).assertEqual(1);
      expect(model.searchTitle('1')).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1343
     * @tc.name    MusicExtension1343
     * @tc.desc    Empty keyword matches every entry while a missing keyword matches none
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchTitle_003', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('')).assertEqual(MUSIC_PLAYLIST_COUNT);
      expect(model.searchTitle('no-such-title')).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1344
     * @tc.name    MusicExtension1344
     * @tc.desc    Negative page index yields an empty page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceNegativePage_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(-1, 3).length).assertEqual(0);
      expect(model.slicePage(-2, 12).length).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1345
     * @tc.name    MusicExtension1345
     * @tc.desc    Page size larger than the list returns every entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceOversizePage_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 100);
      expect(page.length).assertEqual(MUSIC_PLAYLIST_COUNT);
      expect(page[0] === model.getPlaylists()[0]).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1346
     * @tc.name    MusicExtension1346
     * @tc.desc    Fractional page size rounds up to whole pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPagesFraction_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(2.5)).assertEqual(5);
      expect(model.totalPages(0.5)).assertEqual(24);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1347
     * @tc.name    MusicExtension1347
     * @tc.desc    Oversized page size still reports one page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPagesOversize_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(MUSIC_PLAYLIST_COUNT + 100)).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1348
     * @tc.name    MusicExtension1348
     * @tc.desc    Fractional playlist index is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'fractionalIndex_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylistByIndex(1.5) === undefined).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1349
     * @tc.name    MusicExtension1349
     * @tc.desc    Prefix ending in digit one matches four multi digit titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchPrefixDigits_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('list1')).assertEqual(4);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1350
     * @tc.name    MusicExtension1350
     * @tc.desc    Bare list prefix matches every generated title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchPrefix_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle(MUSIC_TITLE_PREFIX)).assertEqual(MUSIC_PLAYLIST_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1351
     * @tc.name    MusicExtension1351
     * @tc.desc    Exact single title keyword matches one entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchExact_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('list5')).assertEqual(1);
      expect(model.searchTitle('list12')).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1352
     * @tc.name    MusicExtension1352
     * @tc.desc    Offset factory returns a new object on each call
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'offsetFresh_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const first: MusicOffset = model.makeOffset(1, 2);
      const second: MusicOffset = model.makeOffset(1, 2);
      expect(first === second).assertFalse();
      expect(first.x).assertEqual(second.x);
      expect(first.y).assertEqual(second.y);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1353
     * @tc.name    MusicExtension1353
     * @tc.desc    Offset accumulation leaves both inputs untouched
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'accumulateImmutable_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const left: MusicOffset = model.makeOffset(1, 2);
      const right: MusicOffset = model.makeOffset(3, 4);
      const sum: MusicOffset = model.accumulateOffset(left, right);
      expect(sum.x).assertEqual(4);
      expect(sum.y).assertEqual(6);
      expect(left.x).assertEqual(1);
      expect(right.y).assertEqual(4);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1354
     * @tc.name    MusicExtension1354
     * @tc.desc    Clamping against a negative maximum pins to that maximum
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampNegativeLimit_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 5, y: 5 }, -1, -1);
      expect(clamped.x).assertEqual(-1);
      expect(clamped.y).assertEqual(-1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1355
     * @tc.name    MusicExtension1355
     * @tc.desc    Clamping keeps axes independent when only height overflows
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampAxisIndependent_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 3, y: 9 }, 5, 4);
      expect(clamped.x).assertEqual(3);
      expect(clamped.y).assertEqual(4);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1356
     * @tc.name    MusicExtension1356
     * @tc.desc    Horizontal padding keeps fractional side widths
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingFraction_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(1.5, 2.5);
      expect(model.horizontalPadding(padding)).assertEqual(4);
      expect(padding.left).assertEqual(1.5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1357
     * @tc.name    MusicExtension1357
     * @tc.desc    Zero padding is valid while a single negative side is not
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingBoundary_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.isValidPadding(model.makePadding(0, 0))).assertTrue();
      expect(model.isValidPadding(model.makePadding(0, 10))).assertTrue();
      expect(model.isValidPadding(model.makePadding(-1, 0))).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1358
     * @tc.name    MusicExtension1358
     * @tc.desc    Appending through the exposed list raises count and search hits
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'playlistMutation_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      list.push({ index: MUSIC_PLAYLIST_COUNT, title: 'list13' });
      expect(model.getPlaylistCount()).assertEqual(MUSIC_PLAYLIST_COUNT + 1);
      expect(model.searchTitle('list13')).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1359
     * @tc.name    MusicExtension1359
     * @tc.desc    Duplicating an exposed title breaks title uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'uniqueTitlesMutation_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      list[1].title = list[0].title;
      expect(model.hasUniqueTitles()).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1360
     * @tc.name    MusicExtension1360
     * @tc.desc    Exposed playlist object reflects later field mutation
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'playlistAlias_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      list[0].title = 'renamed';
      expect(model.searchTitle('renamed')).assertEqual(1);
      expect(model.searchTitle('list1')).assertEqual(3);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1361
     * @tc.name    MusicExtension1361
     * @tc.desc    Recommendation list exposes twelve entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListCount_001', 0, () => {
      expect(songsList.length).assertEqual(12);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1362
     * @tc.name    MusicExtension1362
     * @tc.desc    Recommendation covers are pairwise distinct
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListCoversUnique_001', 0, () => {
      const ids: Set<number> = new Set<number>();
      for (let i = 0; i < songsList.length; i++) {
        ids.add(songsList[i].imageSrc.id);
      }
      expect(ids.size).assertEqual(songsList.length);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1363
     * @tc.name    MusicExtension1363
     * @tc.desc    Every recommendation carries a non empty caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListText_001', 0, () => {
      for (let i = 0; i < songsList.length; i++) {
        expect(typeof songsList[i].description).assertEqual('string');
        expect((songsList[i].description as string).length > 0).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1364
     * @tc.name    MusicExtension1364
     * @tc.desc    Both halves of the recommendation list repeat all six captions
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListPairs_001', 0, () => {
      for (let i = 0; i < 6; i++) {
        expect(songsList[i].description as string).assertEqual(songsList[i + 6].description as string);
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1365
     * @tc.name    MusicExtension1365
     * @tc.desc    Repeated captions use different cover resources
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songListCovers_001', 0, () => {
      for (let i = 0; i < 6; i++) {
        expect(songsList[i].imageSrc.id === songsList[i + 6].imageSrc.id).assertFalse();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1366
     * @tc.name    MusicExtension1366
     * @tc.desc    Padding factory returns a new object on each call
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingFresh_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const first: MusicPadding = model.makePadding(4, 6);
      const second: MusicPadding = model.makePadding(4, 6);
      expect(first === second).assertFalse();
      expect(first.left).assertEqual(second.left);
      expect(first.right).assertEqual(second.right);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1367
     * @tc.name    MusicExtension1367
     * @tc.desc    Search matches a keyword in the middle of a generated title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchMiddle_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('ist1')).assertEqual(4);
      expect(model.searchTitle('st5')).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1368
     * @tc.name    MusicExtension1368
     * @tc.desc    Song entry keeps a zero play count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songTypeZero_001', 0, () => {
      const song: SongType = new SongType($r('app.media.list1'), $r('app.media.list2'), 0);
      expect(song.count).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1369
     * @tc.name    MusicExtension1369
     * @tc.desc    Song entry keeps a large play count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songTypeLarge_001', 0, () => {
      const song: SongType = new SongType($r('app.media.list2'), $r('app.media.list1'), 999999);
      expect(song.count).assertEqual(999999);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1370
     * @tc.name    MusicExtension1370
     * @tc.desc    Icon entry keeps a plain string caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'iconString_001', 0, () => {
      const item: IconItem = new IconItem($r('app.media.list1'), 'plain caption');
      expect(typeof item.description).assertEqual('string');
      expect(item.description as string).assertEqual('plain caption');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1371
     * @tc.name    MusicExtension1371
     * @tc.desc    Two song entries stay independent objects
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songTypeIsolation_001', 0, () => {
      const first: SongType = new SongType($r('app.media.list1'), $r('app.media.list2'), 3);
      const second: SongType = new SongType($r('app.media.list1'), $r('app.media.list2'), 3);
      first.count = 7;
      expect(second.count).assertEqual(3);
      expect(first === second).assertFalse();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1372
     * @tc.name    MusicExtension1372
     * @tc.desc    Index lookup returns the same object held by the list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'playlistIdentity_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const found: MusicPlaylistItem | undefined = model.getPlaylistByIndex(4);
      expect(found !== undefined).assertTrue();
      expect(found === model.getPlaylists()[4]).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1373
     * @tc.name    MusicExtension1373
     * @tc.desc    Sliced page is a copy that does not affect the backing list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceCopy_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 3);
      page.push({ index: 99, title: 'extra' });
      expect(page.length).assertEqual(4);
      expect(model.getPlaylistCount()).assertEqual(MUSIC_PLAYLIST_COUNT);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1374
     * @tc.name    MusicExtension1374
     * @tc.desc    Every practical page size yields a whole page count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPagesIntegers_001', 0, () => {
      const model: MusicModel = new MusicModel();
      for (let size = 1; size <= 6; size++) {
        expect(Number.isInteger(model.totalPages(size))).assertTrue();
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1375
     * @tc.name    MusicExtension1375
     * @tc.desc    Page count never grows when the page size grows
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'totalPagesMonotonic_001', 0, () => {
      const model: MusicModel = new MusicModel();
      let previous: number = model.totalPages(1);
      for (let size = 2; size <= 12; size++) {
        const current: number = model.totalPages(size);
        expect(current <= previous).assertTrue();
        previous = current;
      }
      expect(previous).assertEqual(1);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1376
     * @tc.name    MusicExtension1376
     * @tc.desc    Three equal pages cover every playlist entry in order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pagesCoverAll_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const indexes: number[] = [];
      for (let page = 0; page < 3; page++) {
        const chunk: MusicPlaylistItem[] = model.slicePage(page, 4);
        expect(chunk.length).assertEqual(4);
        for (let i = 0; i < chunk.length; i++) {
          indexes.push(chunk[i].index);
        }
      }
      expect(indexes.length).assertEqual(12);
      expect(indexes[0]).assertEqual(0);
      expect(indexes[11]).assertEqual(11);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1377
     * @tc.name    MusicExtension1377
     * @tc.desc    Lookup resolves both ends of the playlist
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lookupEnds_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const first: MusicPlaylistItem | undefined = model.getPlaylistByIndex(0);
      const last: MusicPlaylistItem | undefined = model.getPlaylistByIndex(11);
      expect((first as MusicPlaylistItem).index).assertEqual(0);
      expect((last as MusicPlaylistItem).index).assertEqual(11);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1378
     * @tc.name    MusicExtension1378
     * @tc.desc    Chained offset accumulation sums all three vectors
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'offsetChain_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const a: MusicOffset = model.makeOffset(1, 2);
      const b: MusicOffset = model.makeOffset(3, 4);
      const c: MusicOffset = model.makeOffset(5, 6);
      const sum: MusicOffset = model.accumulateOffset(model.accumulateOffset(a, b), c);
      expect(sum.x).assertEqual(9);
      expect(sum.y).assertEqual(12);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1379
     * @tc.name    MusicExtension1379
     * @tc.desc    Accumulating a vector with itself doubles both axes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'offsetDouble_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const a: MusicOffset = model.makeOffset(-2, 4);
      const sum: MusicOffset = model.accumulateOffset(a, a);
      expect(sum.x).assertEqual(-4);
      expect(sum.y).assertEqual(8);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1380
     * @tc.name    MusicExtension1380
     * @tc.desc    Clamping to a zero maximum pins both axes to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampZeroMax_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 3, y: 4 }, 0, 0);
      expect(clamped.x).assertEqual(0);
      expect(clamped.y).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1381
     * @tc.name    MusicExtension1381
     * @tc.desc    Clamping honours a fractional maximum
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampFractionMax_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 1.5, y: 2.5 }, 1.25, 2.25);
      expect(clamped.x).assertEqual(1.25);
      expect(clamped.y).assertEqual(2.25);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1382
     * @tc.name    MusicExtension1382
     * @tc.desc    Horizontal padding sums large and fractional sides exactly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingLarge_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.horizontalPadding(model.makePadding(1000000, 0.5))).assertEqual(1000000.5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1383
     * @tc.name    MusicExtension1383
     * @tc.desc    Very large non negative sides remain valid padding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingHugeValid_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.isValidPadding(model.makePadding(1000000, 1000000))).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1384
     * @tc.name    MusicExtension1384
     * @tc.desc    Appending a fresh title keeps title uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'uniqueAppend_001', 0, () => {
      const model: MusicModel = new MusicModel();
      model.getPlaylists().push({ index: 12, title: 'fresh' });
      expect(model.getPlaylistCount()).assertEqual(13);
      expect(model.hasUniqueTitles()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1385
     * @tc.name    MusicExtension1385
     * @tc.desc    Clearing the playlist leaves an empty container
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clearPlaylists_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      list.splice(0, list.length);
      expect(model.getPlaylistCount()).assertEqual(0);
      expect(model.hasUniqueTitles()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1386
     * @tc.name    MusicExtension1386
     * @tc.desc    Page count and search collapse after clearing the playlist
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clearPages_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      list.splice(0, list.length);
      expect(model.totalPages(3)).assertEqual(0);
      expect(model.searchTitle('list')).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1387
     * @tc.name    MusicExtension1387
     * @tc.desc    Index lookup and page slicing return nothing after clearing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clearLookup_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      list.splice(0, list.length);
      expect(model.getPlaylistByIndex(0) === undefined).assertTrue();
      expect(model.slicePage(0, 5).length).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1388
     * @tc.name    MusicExtension1388
     * @tc.desc    Appending to a cleared playlist restores search and paging
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'refillPlaylist_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const list: MusicPlaylistItem[] = model.getPlaylists();
      list.splice(0, list.length);
      list.push({ index: 0, title: 'solo' });
      expect(model.getPlaylistCount()).assertEqual(1);
      expect(model.searchTitle('solo')).assertEqual(1);
      expect(model.totalPages(1)).assertEqual(1);
      expect(model.hasUniqueTitles()).assertTrue();
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1389
     * @tc.name    MusicExtension1389
     * @tc.desc    Recommendation captions collapse to six distinct texts
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songCaptionSet_001', 0, () => {
      const captions: Set<string> = new Set<string>();
      for (let i = 0; i < songsList.length; i++) {
        captions.add(songsList[i].description as string);
      }
      expect(captions.size).assertEqual(6);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1390
     * @tc.name    MusicExtension1390
     * @tc.desc    Every recommendation caption is a plain string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songTextTypes_001', 0, () => {
      for (let i = 0; i < songsList.length; i++) {
        expect(typeof songsList[i].description).assertEqual('string');
      }
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1391
     * @tc.name    MusicExtension1391
     * @tc.desc    Offset factory stores zero and negative coordinates unchanged
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'offsetStored_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const left: MusicOffset = model.makeOffset(0, -3);
      expect(left.x).assertEqual(0);
      expect(left.y).assertEqual(-3);
      const right: MusicOffset = model.makeOffset(2.5, 0.5);
      expect(right.x).assertEqual(2.5);
      expect(right.y).assertEqual(0.5);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1392
     * @tc.name    MusicExtension1392
     * @tc.desc    Removing the first playlist entry shifts the remaining order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'spliceFirst_001', 0, () => {
      const model: MusicModel = new MusicModel();
      model.getPlaylists().splice(0, 1);
      expect(model.getPlaylistCount()).assertEqual(11);
      expect(model.getPlaylists()[0].title).assertEqual('list2');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1393
     * @tc.name    MusicExtension1393
     * @tc.desc    Index lookup returns the numbered title at that position
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lookupTitle_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect((model.getPlaylistByIndex(5) as MusicPlaylistItem).title).assertEqual('list6');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1394
     * @tc.name    MusicExtension1394
     * @tc.desc    A sliced page keeps the numbered titles in order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceTitles_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(1, 3);
      expect(page[0].title).assertEqual('list4');
      expect(page[1].title).assertEqual('list5');
      expect(page[2].title).assertEqual('list6');
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1395
     * @tc.name    MusicExtension1395
     * @tc.desc    Negative zero resolves to the first playlist entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lookupNegativeZero_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const found: MusicPlaylistItem | undefined = model.getPlaylistByIndex(-0);
      expect((found as MusicPlaylistItem).index).assertEqual(0);
    })
    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1396
     * @tc.name    MusicExtension1396
     * @tc.desc    Clamping leaves the supplied offset object untouched
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampImmutable_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const input: MusicOffset = { x: 9, y: 9 };
      const clamped: MusicOffset = model.clampOffset(input, 5, 5);
      expect(clamped.x).assertEqual(5);
      expect(clamped.y).assertEqual(5);
      expect(input.x).assertEqual(9);
      expect(input.y).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1397
     * @tc.name    MusicExtension1397
     * @tc.desc    Lookup resolves a playlist appended through the exposed list
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lookupAppendedPlaylist_001', 0, () => {
      const model: MusicModel = new MusicModel();
      model.getPlaylists().push({ index: 12, title: 'list13' });
      const found: MusicPlaylistItem | undefined = model.getPlaylistByIndex(12);
      expect(model.getPlaylistCount()).assertEqual(13);
      expect((found as MusicPlaylistItem).title).assertEqual('list13');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1398
     * @tc.name    MusicExtension1398
     * @tc.desc    Lookup rejects the largest safe integer index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lookupMaxIndex_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylistByIndex(Number.MAX_SAFE_INTEGER) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1399
     * @tc.name    MusicExtension1399
     * @tc.desc    A page size equal to the playlist yields one page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'pagesWholeList_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(24)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1400
     * @tc.name    MusicExtension1400
     * @tc.desc    The first page of five keeps the numbered order
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceFirstFive_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].title).assertEqual('list1');
      expect(page[4].title).assertEqual('list5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1401
     * @tc.name    MusicExtension1401
     * @tc.desc    The third page of five keeps only the last two entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceLastPartial_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(2, 5);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list11');
      expect(page[1].title).assertEqual('list12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1402
     * @tc.name    MusicExtension1402
     * @tc.desc    A negative page size keeps every entry but the last
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'sliceNegativeSize_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, -1);
      expect(page.length).assertEqual(11);
      expect(page[10].title).assertEqual('list11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1403
     * @tc.name    MusicExtension1403
     * @tc.desc    A negative zero side counts as valid zero padding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingNegativeZero_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.isValidPadding(model.makePadding(-0, 0))).assertTrue();
      expect(model.horizontalPadding(model.makePadding(-0, 0))).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1404
     * @tc.name    MusicExtension1404
     * @tc.desc    Fractional offsets with mixed signs add exactly
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'accumulateMixedFraction_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: -1.5, y: 2.25 }, { x: 0.5, y: -0.25 });
      expect(sum.x).assertEqual(-1);
      expect(sum.y).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1405
     * @tc.name    MusicExtension1405
     * @tc.desc    Large padding sides sum without overflow
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingLargeSides_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.horizontalPadding(model.makePadding(1000000, 2000000))).assertEqual(3000000);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1406
     * @tc.name    MusicExtension1406
     * @tc.desc    Padding data type keeps both constructor arguments
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingDataTypeFields_001', 0, () => {
      const padding: PaddingDataType = new PaddingDataType(7, 9);
      expect(padding.left).assertEqual(7);
      expect(padding.right).assertEqual(9);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1407
     * @tc.name    MusicExtension1407
     * @tc.desc    Two padding data instances keep independent sides
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'paddingDataTypeIndependent_001', 0, () => {
      const first: PaddingDataType = new PaddingDataType(1, 2);
      const second: PaddingDataType = new PaddingDataType(1, 2);
      first.left = 5;
      expect(second.left).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1408
     * @tc.name    MusicExtension1408
     * @tc.desc    An icon item may reuse one resource for icon and caption
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'iconSameResource_001', 0, () => {
      const item: IconItem = new IconItem(songsList[0].imageSrc, songsList[0].imageSrc);
      expect((item.description as Resource).id).assertEqual(item.imageSrc.id);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1409
     * @tc.name    MusicExtension1409
     * @tc.desc    Song type keeps a large play count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songTypeLargeCount_001', 0, () => {
      const song: SongType = new SongType(songsList[0].imageSrc, songsList[0].imageSrc, 999999);
      expect(song.count).assertEqual(999999);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1410
     * @tc.name    MusicExtension1410
     * @tc.desc    Song type keeps a negative play count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'songTypeNegativeCount_001', 0, () => {
      const song: SongType = new SongType(songsList[0].imageSrc, songsList[0].imageSrc, -1);
      expect(song.count).assertEqual(-1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1411
     * @tc.name    MusicExtension1411
     * @tc.desc    A two digit keyword matches only the final title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchDigitsOnly_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('12')).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1412
     * @tc.name    MusicExtension1412
     * @tc.desc    An absent keyword matches no playlist title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'searchNoMatch_001', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('zzz')).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1413
     * @tc.name    MusicExtension1413
     * @tc.desc    The shared title prefix is list of four characters
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'prefixConstant_001', 0, () => {
      expect(MUSIC_TITLE_PREFIX).assertEqual('list');
      expect(MUSIC_TITLE_PREFIX.length).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1414
     * @tc.name    MusicExtension1414
     * @tc.desc    Clearing the playlist leaves no page and no entry
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clearSlicePages_001', 0, () => {
      const model: MusicModel = new MusicModel();
      model.getPlaylists().splice(0, model.getPlaylistCount());
      expect(model.slicePage(0, 5).length).assertEqual(0);
      expect(model.totalPages(5)).assertEqual(0);
      expect(model.getPlaylistCount()).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1415
     * @tc.name    MusicExtension1415
     * @tc.desc    Popping the last entry makes its index invalid
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'lookupAfterPop_001', 0, () => {
      const model: MusicModel = new MusicModel();
      model.getPlaylists().pop();
      expect(model.getPlaylistCount()).assertEqual(11);
      expect(model.getPlaylistByIndex(11) === undefined).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1416
     * @tc.name    MusicExtension1416
     * @tc.desc    Clamping pins both axes to a fractional maximum
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'clampFractionalBoth_001', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 9.5, y: 9.5 }, 4.5, 4.5);
      expect(clamped.x).assertEqual(4.5);
      expect(clamped.y).assertEqual(4.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1417
     * @tc.name    MusicExtension1417
     * @tc.desc    Playlist 1 keeps index 0 and title list1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl00', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(0);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(0);
      expect((item as MusicPlaylistItem).title).assertEqual('list1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1418
     * @tc.name    MusicExtension1418
     * @tc.desc    Exposed playlist 1 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw00', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[0].title).assertEqual('list1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1419
     * @tc.name    MusicExtension1419
     * @tc.desc    Playlist 2 keeps index 1 and title list2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl01', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(1);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(1);
      expect((item as MusicPlaylistItem).title).assertEqual('list2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1420
     * @tc.name    MusicExtension1420
     * @tc.desc    Exposed playlist 2 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw01', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[1].title).assertEqual('list2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1421
     * @tc.name    MusicExtension1421
     * @tc.desc    Playlist 3 keeps index 2 and title list3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl02', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(2);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(2);
      expect((item as MusicPlaylistItem).title).assertEqual('list3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1422
     * @tc.name    MusicExtension1422
     * @tc.desc    Exposed playlist 3 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw02', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[2].title).assertEqual('list3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1423
     * @tc.name    MusicExtension1423
     * @tc.desc    Playlist 4 keeps index 3 and title list4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl03', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(3);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(3);
      expect((item as MusicPlaylistItem).title).assertEqual('list4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1424
     * @tc.name    MusicExtension1424
     * @tc.desc    Exposed playlist 4 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw03', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[3].title).assertEqual('list4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1425
     * @tc.name    MusicExtension1425
     * @tc.desc    Playlist 5 keeps index 4 and title list5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl04', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(4);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(4);
      expect((item as MusicPlaylistItem).title).assertEqual('list5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1426
     * @tc.name    MusicExtension1426
     * @tc.desc    Exposed playlist 5 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw04', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[4].title).assertEqual('list5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1427
     * @tc.name    MusicExtension1427
     * @tc.desc    Playlist 6 keeps index 5 and title list6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl05', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(5);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(5);
      expect((item as MusicPlaylistItem).title).assertEqual('list6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1428
     * @tc.name    MusicExtension1428
     * @tc.desc    Exposed playlist 6 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw05', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[5].title).assertEqual('list6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1429
     * @tc.name    MusicExtension1429
     * @tc.desc    Playlist 7 keeps index 6 and title list7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl06', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(6);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(6);
      expect((item as MusicPlaylistItem).title).assertEqual('list7');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1430
     * @tc.name    MusicExtension1430
     * @tc.desc    Exposed playlist 7 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw06', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[6].title).assertEqual('list7');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1431
     * @tc.name    MusicExtension1431
     * @tc.desc    Playlist 8 keeps index 7 and title list8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl07', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(7);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(7);
      expect((item as MusicPlaylistItem).title).assertEqual('list8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1432
     * @tc.name    MusicExtension1432
     * @tc.desc    Exposed playlist 8 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw07', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[7].title).assertEqual('list8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1433
     * @tc.name    MusicExtension1433
     * @tc.desc    Playlist 9 keeps index 8 and title list9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl08', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(8);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(8);
      expect((item as MusicPlaylistItem).title).assertEqual('list9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1434
     * @tc.name    MusicExtension1434
     * @tc.desc    Exposed playlist 9 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw08', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[8].title).assertEqual('list9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1435
     * @tc.name    MusicExtension1435
     * @tc.desc    Playlist 10 keeps index 9 and title list10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl09', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(9);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(9);
      expect((item as MusicPlaylistItem).title).assertEqual('list10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1436
     * @tc.name    MusicExtension1436
     * @tc.desc    Exposed playlist 10 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw09', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[9].title).assertEqual('list10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1437
     * @tc.name    MusicExtension1437
     * @tc.desc    Playlist 11 keeps index 10 and title list11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl10', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(10);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(10);
      expect((item as MusicPlaylistItem).title).assertEqual('list11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1438
     * @tc.name    MusicExtension1438
     * @tc.desc    Exposed playlist 11 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw10', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[10].title).assertEqual('list11');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1439
     * @tc.name    MusicExtension1439
     * @tc.desc    Playlist 12 keeps index 11 and title list12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pl11', 0, () => {
      const model: MusicModel = new MusicModel();
      const item: MusicPlaylistItem | undefined = model.getPlaylistByIndex(11);
      expect(item !== undefined).assertTrue();
      expect((item as MusicPlaylistItem).index).assertEqual(11);
      expect((item as MusicPlaylistItem).title).assertEqual('list12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1440
     * @tc.name    MusicExtension1440
     * @tc.desc    Exposed playlist 12 keeps the seeded title
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5plraw11', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.getPlaylists()[11].title).assertEqual('list12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1441
     * @tc.name    MusicExtension1441
     * @tc.desc    Page size 0 yields 0 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp00', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(0)).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1442
     * @tc.name    MusicExtension1442
     * @tc.desc    Page size -1 yields 0 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp01', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(-1)).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1443
     * @tc.name    MusicExtension1443
     * @tc.desc    Page size 0.5 yields 24 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp02', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(0.5)).assertEqual(24);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1444
     * @tc.name    MusicExtension1444
     * @tc.desc    Page size 1 yields 12 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp03', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(1)).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1445
     * @tc.name    MusicExtension1445
     * @tc.desc    Page size 1.0001 yields 12 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp04', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(1.0001)).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1446
     * @tc.name    MusicExtension1446
     * @tc.desc    Page size 1.5 yields 8 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp05', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(1.5)).assertEqual(8);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1447
     * @tc.name    MusicExtension1447
     * @tc.desc    Page size 2 yields 6 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp06', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(2)).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1448
     * @tc.name    MusicExtension1448
     * @tc.desc    Page size 2.5 yields 5 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp07', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(2.5)).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1449
     * @tc.name    MusicExtension1449
     * @tc.desc    Page size 3 yields 4 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp08', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(3)).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1450
     * @tc.name    MusicExtension1450
     * @tc.desc    Page size 4 yields 3 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp09', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(4)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1451
     * @tc.name    MusicExtension1451
     * @tc.desc    Page size 5 yields 3 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp10', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(5)).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1452
     * @tc.name    MusicExtension1452
     * @tc.desc    Page size 6 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp11', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(6)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1453
     * @tc.name    MusicExtension1453
     * @tc.desc    Page size 7 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp12', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(7)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1454
     * @tc.name    MusicExtension1454
     * @tc.desc    Page size 8 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp13', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(8)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1455
     * @tc.name    MusicExtension1455
     * @tc.desc    Page size 9 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp14', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(9)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1456
     * @tc.name    MusicExtension1456
     * @tc.desc    Page size 10 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp15', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(10)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1457
     * @tc.name    MusicExtension1457
     * @tc.desc    Page size 11 yields 2 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp16', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(11)).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1458
     * @tc.name    MusicExtension1458
     * @tc.desc    Page size 12 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp17', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(12)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1459
     * @tc.name    MusicExtension1459
     * @tc.desc    Page size 13 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp18', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(13)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1460
     * @tc.name    MusicExtension1460
     * @tc.desc    Page size 25 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp20', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(25)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1461
     * @tc.name    MusicExtension1461
     * @tc.desc    Page size 100 yields 1 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5tp21', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(100)).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1462
     * @tc.name    MusicExtension1462
     * @tc.desc    Page 0 of size 1 keeps 1 entries from list1 to list1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl1_0', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('list1');
      expect(page[page.length - 1].title).assertEqual('list1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1463
     * @tc.name    MusicExtension1463
     * @tc.desc    Page 1 of size 1 keeps 1 entries from list2 to list2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl1_1', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(1, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('list2');
      expect(page[page.length - 1].title).assertEqual('list2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1464
     * @tc.name    MusicExtension1464
     * @tc.desc    Page 2 of size 1 keeps 1 entries from list3 to list3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl1_2', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(2, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('list3');
      expect(page[page.length - 1].title).assertEqual('list3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1465
     * @tc.name    MusicExtension1465
     * @tc.desc    Page 3 of size 1 keeps 1 entries from list4 to list4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl1_3', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(3, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('list4');
      expect(page[page.length - 1].title).assertEqual('list4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1466
     * @tc.name    MusicExtension1466
     * @tc.desc    Page 4 of size 1 keeps 1 entries from list5 to list5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl1_4', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(4, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('list5');
      expect(page[page.length - 1].title).assertEqual('list5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1467
     * @tc.name    MusicExtension1467
     * @tc.desc    Page 5 of size 1 keeps 1 entries from list6 to list6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl1_5', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(5, 1);
      expect(page.length).assertEqual(1);
      expect(page[0].title).assertEqual('list6');
      expect(page[page.length - 1].title).assertEqual('list6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1468
     * @tc.name    MusicExtension1468
     * @tc.desc    Page 0 of size 2 keeps 2 entries from list1 to list2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl2_0', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list1');
      expect(page[page.length - 1].title).assertEqual('list2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1469
     * @tc.name    MusicExtension1469
     * @tc.desc    Page 1 of size 2 keeps 2 entries from list3 to list4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl2_1', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(1, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list3');
      expect(page[page.length - 1].title).assertEqual('list4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1470
     * @tc.name    MusicExtension1470
     * @tc.desc    Page 2 of size 2 keeps 2 entries from list5 to list6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl2_2', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(2, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list5');
      expect(page[page.length - 1].title).assertEqual('list6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1471
     * @tc.name    MusicExtension1471
     * @tc.desc    Page 3 of size 2 keeps 2 entries from list7 to list8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl2_3', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(3, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list7');
      expect(page[page.length - 1].title).assertEqual('list8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1472
     * @tc.name    MusicExtension1472
     * @tc.desc    Page 4 of size 2 keeps 2 entries from list9 to list10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl2_4', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(4, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list9');
      expect(page[page.length - 1].title).assertEqual('list10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1473
     * @tc.name    MusicExtension1473
     * @tc.desc    Page 5 of size 2 keeps 2 entries from list11 to list12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl2_5', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(5, 2);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list11');
      expect(page[page.length - 1].title).assertEqual('list12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1474
     * @tc.name    MusicExtension1474
     * @tc.desc    Page 0 of size 3 keeps 3 entries from list1 to list3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl3_0', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('list1');
      expect(page[page.length - 1].title).assertEqual('list3');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1475
     * @tc.name    MusicExtension1475
     * @tc.desc    Page 1 of size 3 keeps 3 entries from list4 to list6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl3_1', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(1, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('list4');
      expect(page[page.length - 1].title).assertEqual('list6');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1476
     * @tc.name    MusicExtension1476
     * @tc.desc    Page 2 of size 3 keeps 3 entries from list7 to list9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl3_2', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(2, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('list7');
      expect(page[page.length - 1].title).assertEqual('list9');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1477
     * @tc.name    MusicExtension1477
     * @tc.desc    Page 3 of size 3 keeps 3 entries from list10 to list12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl3_3', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(3, 3);
      expect(page.length).assertEqual(3);
      expect(page[0].title).assertEqual('list10');
      expect(page[page.length - 1].title).assertEqual('list12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1478
     * @tc.name    MusicExtension1478
     * @tc.desc    Page 4 of size 3 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl3_4', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(4, 3).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1479
     * @tc.name    MusicExtension1479
     * @tc.desc    Page 5 of size 3 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl3_5', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(5, 3).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1480
     * @tc.name    MusicExtension1480
     * @tc.desc    Page 0 of size 4 keeps 4 entries from list1 to list4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl4_0', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('list1');
      expect(page[page.length - 1].title).assertEqual('list4');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1481
     * @tc.name    MusicExtension1481
     * @tc.desc    Page 1 of size 4 keeps 4 entries from list5 to list8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl4_1', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(1, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('list5');
      expect(page[page.length - 1].title).assertEqual('list8');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1482
     * @tc.name    MusicExtension1482
     * @tc.desc    Page 2 of size 4 keeps 4 entries from list9 to list12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl4_2', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(2, 4);
      expect(page.length).assertEqual(4);
      expect(page[0].title).assertEqual('list9');
      expect(page[page.length - 1].title).assertEqual('list12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1483
     * @tc.name    MusicExtension1483
     * @tc.desc    Page 3 of size 4 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl4_3', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(3, 4).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1484
     * @tc.name    MusicExtension1484
     * @tc.desc    Page 4 of size 4 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl4_4', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(4, 4).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1485
     * @tc.name    MusicExtension1485
     * @tc.desc    Page 5 of size 4 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl4_5', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(5, 4).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1486
     * @tc.name    MusicExtension1486
     * @tc.desc    Page 0 of size 5 keeps 5 entries from list1 to list5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl5_0', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(0, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].title).assertEqual('list1');
      expect(page[page.length - 1].title).assertEqual('list5');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1487
     * @tc.name    MusicExtension1487
     * @tc.desc    Page 1 of size 5 keeps 5 entries from list6 to list10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl5_1', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(1, 5);
      expect(page.length).assertEqual(5);
      expect(page[0].title).assertEqual('list6');
      expect(page[page.length - 1].title).assertEqual('list10');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1488
     * @tc.name    MusicExtension1488
     * @tc.desc    Page 2 of size 5 keeps 2 entries from list11 to list12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl5_2', 0, () => {
      const model: MusicModel = new MusicModel();
      const page: MusicPlaylistItem[] = model.slicePage(2, 5);
      expect(page.length).assertEqual(2);
      expect(page[0].title).assertEqual('list11');
      expect(page[page.length - 1].title).assertEqual('list12');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1489
     * @tc.name    MusicExtension1489
     * @tc.desc    Page 3 of size 5 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl5_3', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(3, 5).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1490
     * @tc.name    MusicExtension1490
     * @tc.desc    Page 4 of size 5 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl5_4', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(4, 5).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1491
     * @tc.name    MusicExtension1491
     * @tc.desc    Page 5 of size 5 is empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5sl5_5', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.slicePage(5, 5).length).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1492
     * @tc.name    MusicExtension1492
     * @tc.desc    Offset accumulation 1 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc00', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 1, y: 2 }, { x: 3, y: 4 });
      expect(sum.x).assertEqual(4);
      expect(sum.y).assertEqual(6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1493
     * @tc.name    MusicExtension1493
     * @tc.desc    Offset accumulation 2 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc01', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: -1, y: -2 }, { x: -3, y: -4 });
      expect(sum.x).assertEqual(-4);
      expect(sum.y).assertEqual(-6);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1494
     * @tc.name    MusicExtension1494
     * @tc.desc    Offset accumulation 3 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc02', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 0, y: 0 }, { x: 0, y: 0 });
      expect(sum.x).assertEqual(0);
      expect(sum.y).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1495
     * @tc.name    MusicExtension1495
     * @tc.desc    Offset accumulation 4 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc03', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 1.5, y: 2.5 }, { x: 0.5, y: 0.5 });
      expect(sum.x).assertEqual(2);
      expect(sum.y).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1496
     * @tc.name    MusicExtension1496
     * @tc.desc    Offset accumulation 5 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc04', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 10, y: -10 }, { x: -5, y: 5 });
      expect(sum.x).assertEqual(5);
      expect(sum.y).assertEqual(-5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1497
     * @tc.name    MusicExtension1497
     * @tc.desc    Offset accumulation 6 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc05', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 0.1, y: 0.2 }, { x: 0.3, y: 0.4 });
      /* Binary floating point adds rounding error here: 0.2 + 0.4 = 0.6000000000000001, so compare with tolerance */
      expect(Math.abs(sum.x - 0.4) < 1e-9).assertTrue();
      expect(Math.abs(sum.y - 0.6) < 1e-9).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1498
     * @tc.name    MusicExtension1498
     * @tc.desc    Offset accumulation 7 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc06', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 100, y: 200 }, { x: 300, y: 400 });
      expect(sum.x).assertEqual(400);
      expect(sum.y).assertEqual(600);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1499
     * @tc.name    MusicExtension1499
     * @tc.desc    Offset accumulation 8 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc07', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: -5, y: 7 }, { x: 5, y: -7 });
      expect(sum.x).assertEqual(0);
      expect(sum.y).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1500
     * @tc.name    MusicExtension1500
     * @tc.desc    Offset accumulation 9 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc08', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 2, y: 2 }, { x: 2, y: 2 });
      expect(sum.x).assertEqual(4);
      expect(sum.y).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1501
     * @tc.name    MusicExtension1501
     * @tc.desc    Offset accumulation 10 keeps both sums
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5acc09', 0, () => {
      const model: MusicModel = new MusicModel();
      const sum: MusicOffset = model.accumulateOffset({ x: 999, y: -999 }, { x: 1, y: -1 });
      expect(sum.x).assertEqual(1000);
      expect(sum.y).assertEqual(-1000);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1502
     * @tc.name    MusicExtension1502
     * @tc.desc    Clamped offset 1 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl00', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 3, y: 4 }, 5, 5);
      expect(clamped.x).assertEqual(3);
      expect(clamped.y).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1503
     * @tc.name    MusicExtension1503
     * @tc.desc    Clamped offset 2 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl01', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: -3, y: -4 }, 5, 5);
      expect(clamped.x).assertEqual(0);
      expect(clamped.y).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1504
     * @tc.name    MusicExtension1504
     * @tc.desc    Clamped offset 3 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl02', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 10, y: 10 }, 5, 5);
      expect(clamped.x).assertEqual(5);
      expect(clamped.y).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1505
     * @tc.name    MusicExtension1505
     * @tc.desc    Clamped offset 4 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl03', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 5, y: 5 }, 5, 5);
      expect(clamped.x).assertEqual(5);
      expect(clamped.y).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1506
     * @tc.name    MusicExtension1506
     * @tc.desc    Clamped offset 5 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl04', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 0, y: 0 }, 0, 0);
      expect(clamped.x).assertEqual(0);
      expect(clamped.y).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1507
     * @tc.name    MusicExtension1507
     * @tc.desc    Clamped offset 6 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl05', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 2, y: 8 }, 5, 4);
      expect(clamped.x).assertEqual(2);
      expect(clamped.y).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1508
     * @tc.name    MusicExtension1508
     * @tc.desc    Clamped offset 7 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl06', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 8, y: 2 }, 5, 4);
      expect(clamped.x).assertEqual(5);
      expect(clamped.y).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1509
     * @tc.name    MusicExtension1509
     * @tc.desc    Clamped offset 8 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl07', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 2.5, y: 2.5 }, 2.5, 2.5);
      expect(clamped.x).assertEqual(2.5);
      expect(clamped.y).assertEqual(2.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1510
     * @tc.name    MusicExtension1510
     * @tc.desc    Clamped offset 9 keeps both axes inside the box
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5cl08', 0, () => {
      const model: MusicModel = new MusicModel();
      const clamped: MusicOffset = model.clampOffset({ x: 1, y: 9 }, 100, 3.5);
      expect(clamped.x).assertEqual(1);
      expect(clamped.y).assertEqual(3.5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1511
     * @tc.name    MusicExtension1511
     * @tc.desc    Padding pair 1 reports valid with sum 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad00', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(0, 0);
      expect(model.horizontalPadding(padding)).assertEqual(0);
      expect(model.isValidPadding(padding)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1512
     * @tc.name    MusicExtension1512
     * @tc.desc    Padding pair 2 reports valid with sum 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad01', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(1, 1);
      expect(model.horizontalPadding(padding)).assertEqual(2);
      expect(model.isValidPadding(padding)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1513
     * @tc.name    MusicExtension1513
     * @tc.desc    Padding pair 3 reports valid with sum 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad02', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(12, 12);
      expect(model.horizontalPadding(padding)).assertEqual(24);
      expect(model.isValidPadding(padding)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1514
     * @tc.name    MusicExtension1514
     * @tc.desc    Padding pair 4 reports valid with sum 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad03', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(0, 24);
      expect(model.horizontalPadding(padding)).assertEqual(24);
      expect(model.isValidPadding(padding)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1515
     * @tc.name    MusicExtension1515
     * @tc.desc    Padding pair 5 reports valid with sum 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad04', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(7.5, 2.5);
      expect(model.horizontalPadding(padding)).assertEqual(10);
      expect(model.isValidPadding(padding)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1516
     * @tc.name    MusicExtension1516
     * @tc.desc    Padding pair 6 reports invalid with sum 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad05', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(-1, 1);
      expect(model.horizontalPadding(padding)).assertEqual(0);
      expect(model.isValidPadding(padding)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1517
     * @tc.name    MusicExtension1517
     * @tc.desc    Padding pair 7 reports invalid with sum 0
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad06', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(1, -1);
      expect(model.horizontalPadding(padding)).assertEqual(0);
      expect(model.isValidPadding(padding)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1518
     * @tc.name    MusicExtension1518
     * @tc.desc    Padding pair 8 reports invalid with sum -4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad07', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(-2, -2);
      expect(model.horizontalPadding(padding)).assertEqual(-4);
      expect(model.isValidPadding(padding)).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1519
     * @tc.name    MusicExtension1519
     * @tc.desc    Padding pair 9 reports valid with sum 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad08', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(100, 200);
      expect(model.horizontalPadding(padding)).assertEqual(300);
      expect(model.isValidPadding(padding)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1520
     * @tc.name    MusicExtension1520
     * @tc.desc    Padding pair 10 reports valid with sum 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pad09', 0, () => {
      const model: MusicModel = new MusicModel();
      const padding: MusicPadding = model.makePadding(0.5, 0.5);
      expect(model.horizontalPadding(padding)).assertEqual(1);
      expect(model.isValidPadding(padding)).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1521
     * @tc.name    MusicExtension1521
     * @tc.desc    Keyword 1 matches 12 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search00', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('')).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1522
     * @tc.name    MusicExtension1522
     * @tc.desc    Keyword 2 matches 12 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search01', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('list')).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1523
     * @tc.name    MusicExtension1523
     * @tc.desc    Keyword 3 matches 4 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search02', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('1')).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1524
     * @tc.name    MusicExtension1524
     * @tc.desc    Keyword 6 matches 1 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search05', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('list12')).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1525
     * @tc.name    MusicExtension1525
     * @tc.desc    Keyword 7 matches 0 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search06', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('L')).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1526
     * @tc.name    MusicExtension1526
     * @tc.desc    Keyword 8 matches 0 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search07', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('13')).assertEqual(0);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1527
     * @tc.name    MusicExtension1527
     * @tc.desc    Keyword 9 matches 12 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search08', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('st')).assertEqual(12);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1528
     * @tc.name    MusicExtension1528
     * @tc.desc    Keyword 10 matches 2 playlist titles
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5search09', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.searchTitle('2')).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1529
     * @tc.name    MusicExtension1529
     * @tc.desc    Padding data type 1 keeps its constructor values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5padtype0', 0, () => {
      const padding: PaddingDataType = new PaddingDataType(0, 1);
      expect(padding.left).assertEqual(0);
      expect(padding.right).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1530
     * @tc.name    MusicExtension1530
     * @tc.desc    Padding data type 2 keeps its constructor values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5padtype1', 0, () => {
      const padding: PaddingDataType = new PaddingDataType(1, 2);
      expect(padding.left).assertEqual(1);
      expect(padding.right).assertEqual(2);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1531
     * @tc.name    MusicExtension1531
     * @tc.desc    Padding data type 3 keeps its constructor values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5padtype2', 0, () => {
      const padding: PaddingDataType = new PaddingDataType(2, 3);
      expect(padding.left).assertEqual(2);
      expect(padding.right).assertEqual(3);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1532
     * @tc.name    MusicExtension1532
     * @tc.desc    Padding data type 4 keeps its constructor values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5padtype3', 0, () => {
      const padding: PaddingDataType = new PaddingDataType(3, 4);
      expect(padding.left).assertEqual(3);
      expect(padding.right).assertEqual(4);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1533
     * @tc.name    MusicExtension1533
     * @tc.desc    Padding data type 5 keeps its constructor values
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5padtype4', 0, () => {
      const padding: PaddingDataType = new PaddingDataType(4, 5);
      expect(padding.left).assertEqual(4);
      expect(padding.right).assertEqual(5);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1534
     * @tc.name    MusicExtension1534
     * @tc.desc    Icon item 1 keeps the caption string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5icon0', 0, () => {
      const item: IconItem = new IconItem($r('app.media.list1'), 'caption0');
      expect(item.description as string).assertEqual('caption0');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1535
     * @tc.name    MusicExtension1535
     * @tc.desc    Icon item 2 keeps the caption string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5icon1', 0, () => {
      const item: IconItem = new IconItem($r('app.media.list1'), 'caption1');
      expect(item.description as string).assertEqual('caption1');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1536
     * @tc.name    MusicExtension1536
     * @tc.desc    Icon item 3 keeps the caption string
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5icon2', 0, () => {
      const item: IconItem = new IconItem($r('app.media.list1'), 'caption2');
      expect(item.description as string).assertEqual('caption2');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1537
     * @tc.name    MusicExtension1537
     * @tc.desc    Song type keeps the play count 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5song1', 0, () => {
      const song: SongType = new SongType($r('app.media.list1'), $r('app.media.list2'), 1);
      expect(song.count).assertEqual(1);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1538
     * @tc.name    MusicExtension1538
     * @tc.desc    Song type keeps the play count 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5song2', 0, () => {
      const song: SongType = new SongType($r('app.media.list1'), $r('app.media.list2'), 99);
      expect(song.count).assertEqual(99);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1539
     * @tc.name    MusicExtension1539
     * @tc.desc    Song type keeps the play count 1000000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5song3', 0, () => {
      const song: SongType = new SongType($r('app.media.list1'), $r('app.media.list2'), 1000000);
      expect(song.count).assertEqual(1000000);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1540
     * @tc.name    MusicExtension1540
     * @tc.desc    The playlist holds twelve entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5count', 0, () => {
      expect(MUSIC_PLAYLIST_COUNT).assertEqual(12);
      expect(new MusicModel().getPlaylistCount()).assertEqual(MUSIC_PLAYLIST_COUNT);
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1541
     * @tc.name    MusicExtension1541
     * @tc.desc    The shared prefix is four characters long
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5prefix', 0, () => {
      expect(MUSIC_TITLE_PREFIX.length).assertEqual(4);
      expect(MUSIC_TITLE_PREFIX).assertEqual('list');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1542
     * @tc.name    MusicExtension1542
     * @tc.desc    Duplicating a title breaks title uniqueness
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5duptitle', 0, () => {
      const model: MusicModel = new MusicModel();
      model.getPlaylists()[1].title = model.getPlaylists()[0].title;
      expect(model.hasUniqueTitles()).assertFalse();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1543
     * @tc.name    MusicExtension1543
     * @tc.desc    The seeded song list is not empty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5songs', 0, () => {
      expect(songsList.length > 0).assertTrue();
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1544
     * @tc.name    MusicExtension1544
     * @tc.desc    A negative page size reports no page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level1
     */
    it(DATASET + 'b5pagesNeg', 0, () => {
      const model: MusicModel = new MusicModel();
      expect(model.totalPages(-5)).assertEqual(0);
    })
  })
}
