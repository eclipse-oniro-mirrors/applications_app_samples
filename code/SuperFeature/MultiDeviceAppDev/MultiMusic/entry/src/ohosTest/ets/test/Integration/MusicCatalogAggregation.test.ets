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
  MusicCatalogModel,
  MusicBreakpoint,
  MusicCatalogPadding,
  MusicCatalogOffset,
  MusicCatalogSong,
  MusicGenre,
  MUSIC_GENRE_PAGES,
  MUSIC_GENRE_COUNT,
  MUSIC_CATALOG_SONG_COUNT,
  MUSIC_PADDING_SM,
  MUSIC_PADDING_MD,
  MUSIC_PADDING_LG,
  MUSIC_OFFSET_SM,
  MUSIC_OFFSET_MD,
  MUSIC_OFFSET_LG,
  MUSIC_BREAKPOINTS
} from '../Shared/MusicCatalogModel';

const DATASET = 'MusicCatalogAggregation';
const DOMAIN: number = 0xF802;
const TAG: string = '[MusicCatalogAggregation]';

export default function musicCatalogAggregationSuite() {
  describe('MusicCatalogAggregation', () => {
    let m: MusicCatalogModel = new MusicCatalogModel();

    beforeEach(() => {
      m = new MusicCatalogModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1545
     * @tc.name    MusicCatalogAggregation1
     * @tc.desc    song catalog keeps twelve entries
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.songCount()).assertEqual(12);
      expect(m.songCount()).assertEqual(MUSIC_CATALOG_SONG_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1546
     * @tc.name    MusicCatalogAggregation2
     * @tc.desc    first song uses the list12 cover
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const first: MusicCatalogSong | undefined = m.songAt(0);
      expect(first === undefined ? '' : first.cover).assertEqual('list12');
      expect(first === undefined ? '' : first.title).assertEqual('song1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1547
     * @tc.name    MusicCatalogAggregation3
     * @tc.desc    last song uses the list1 cover
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const last: MusicCatalogSong | undefined = m.songAt(11);
      expect(last === undefined ? '' : last.cover).assertEqual('list1');
      expect(last === undefined ? '' : last.title).assertEqual('song12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1548
     * @tc.name    MusicCatalogAggregation4
     * @tc.desc    covers descend from list12 to list1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const first: MusicCatalogSong | undefined = m.songAt(0);
      const last: MusicCatalogSong | undefined = m.songAt(11);
      const second: MusicCatalogSong | undefined = m.songAt(1);
      expect(first === undefined ? '' : first.cover).assertEqual('list12');
      expect(second === undefined ? '' : second.cover).assertEqual('list11');
      expect(last === undefined ? '' : last.cover).assertEqual('list1');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1549
     * @tc.name    MusicCatalogAggregation5
     * @tc.desc    every song cover is unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const covers: Set<string> = new Set<string>();
      for (let i = 0; i < m.songCount(); i++) {
        const song: MusicCatalogSong | undefined = m.songAt(i);
        if (song !== undefined) {
          covers.add(song.cover);
        }
      }
      expect(covers.size).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1550
     * @tc.name    MusicCatalogAggregation6
     * @tc.desc    every song title is unique
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const titles: Set<string> = new Set<string>();
      for (let i = 0; i < m.songCount(); i++) {
        const song: MusicCatalogSong | undefined = m.songAt(i);
        if (song !== undefined) {
          titles.add(song.title);
        }
      }
      expect(titles.size).assertEqual(12);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1551
     * @tc.name    MusicCatalogAggregation7
     * @tc.desc    song index fields match their position
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let consistent: boolean = true;
      for (let i = 0; i < m.songCount(); i++) {
        const song: MusicCatalogSong | undefined = m.songAt(i);
        if (song === undefined || song.index !== i) {
          consistent = false;
        }
      }
      expect(consistent).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1552
     * @tc.name    MusicCatalogAggregation8
     * @tc.desc    song lookup past the tail yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.songAt(12) === undefined).assertTrue();
      expect(m.songAt(120) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1553
     * @tc.name    MusicCatalogAggregation9
     * @tc.desc    song lookup before the head yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.songAt(-1) === undefined).assertTrue();
      expect(m.songAt(-12) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1554
     * @tc.name    MusicCatalogAggregation10
     * @tc.desc    song list keeps twelve elements for iteration
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'songs10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.songs().length).assertEqual(12);
      expect(m.songs()[0].cover).assertEqual('list12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1555
     * @tc.name    MusicCatalogAggregation11
     * @tc.desc    genre catalog keeps thirteen cards
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.genreCount()).assertEqual(13);
      expect(m.genreCount()).assertEqual(MUSIC_GENRE_COUNT);
      expect(m.genreCount()).assertEqual(MUSIC_GENRE_PAGES.length);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1556
     * @tc.name    MusicCatalogAggregation12
     * @tc.desc    first five genres share a sixteen page count
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesOf(0)).assertEqual(16);
      expect(m.pagesOf(1)).assertEqual(16);
      expect(m.pagesOf(4)).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1557
     * @tc.name    MusicCatalogAggregation13
     * @tc.desc    coffee, noon and vintage genres expose their page counts
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesOf(5)).assertEqual(24);
      expect(m.pagesOf(6)).assertEqual(30);
      expect(m.pagesOf(11)).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1558
     * @tc.name    MusicCatalogAggregation14
     * @tc.desc    out of range genre lookups report minus one
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesOf(13)).assertEqual(-1);
      expect(m.pagesOf(-1)).assertEqual(-1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1559
     * @tc.name    MusicCatalogAggregation15
     * @tc.desc    genre catalog totals 287 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.totalGenrePages()).assertEqual(287);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1560
     * @tc.name    MusicCatalogAggregation16
     * @tc.desc    seven genres share the sixteen page baseline
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countWithPages(16)).assertEqual(7);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1561
     * @tc.name    MusicCatalogAggregation17
     * @tc.desc    two genres use thirty pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countWithPages(30)).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1562
     * @tc.name    MusicCatalogAggregation18
     * @tc.desc    only one genre reaches forty eight pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countWithPages(48)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1563
     * @tc.name    MusicCatalogAggregation19
     * @tc.desc    seventeen pages is not a shipped genre size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.countWithPages(17)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1564
     * @tc.name    MusicCatalogAggregation20
     * @tc.desc    largest genre sits at the last position
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.maxPagesIndex()).assertEqual(11);
      expect(m.pagesOf(m.maxPagesIndex())).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1565
     * @tc.name    MusicCatalogAggregation21
     * @tc.desc    smallest genre starts the catalog
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.minPagesIndex()).assertEqual(0);
      expect(m.pagesOf(m.minPagesIndex())).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1566
     * @tc.name    MusicCatalogAggregation22
     * @tc.desc    page span between the largest and smallest genre is 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pageSpan()).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1567
     * @tc.name    MusicCatalogAggregation23
     * @tc.desc    average genre size stays near 22 pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const average: number = m.averagePages();
      expect(Math.abs(average - 22.076923076923077) < 1e-9).assertTrue();
      expect(Math.abs(average * 13 - 287) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1568
     * @tc.name    MusicCatalogAggregation24
     * @tc.desc    genre names follow the catalog index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const genre: MusicGenre | undefined = m.genreAt(5);
      expect(genre === undefined ? '' : genre.name).assertEqual('genre5');
      expect(genre === undefined ? -1 : genre.pages).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1569
     * @tc.name    MusicCatalogAggregation25
     * @tc.desc    genre lookup past the tail yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'genres15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.genreAt(13) === undefined).assertTrue();
      expect(m.genreAt(-1) === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1570
     * @tc.name    MusicCatalogAggregation26
     * @tc.desc    empty prefix sums to zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(0)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1571
     * @tc.name    MusicCatalogAggregation27
     * @tc.desc    single prefix equals the first card
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(1)).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1572
     * @tc.name    MusicCatalogAggregation28
     * @tc.desc    five card prefix sums to eighty
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(5)).assertEqual(80);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1573
     * @tc.name    MusicCatalogAggregation29
     * @tc.desc    six card prefix adds the coffee card
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(6)).assertEqual(104);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1574
     * @tc.name    MusicCatalogAggregation30
     * @tc.desc    full prefix equals the catalog total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(13)).assertEqual(m.totalGenrePages());
      expect(m.prefixPages(13)).assertEqual(287);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1575
     * @tc.name    MusicCatalogAggregation31
     * @tc.desc    prefix beyond the catalog is clamped
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(14)).assertEqual(287);
      expect(m.prefixPages(999)).assertEqual(287);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1576
     * @tc.name    MusicCatalogAggregation32
     * @tc.desc    negative prefix count yields zero
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(-1)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1577
     * @tc.name    MusicCatalogAggregation33
     * @tc.desc    prefix increments by the next card size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'prefix8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.prefixPages(11)).assertEqual(223);
      expect(m.prefixPages(12)).assertEqual(271);
      expect(m.prefixPages(12) - m.prefixPages(11)).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1578
     * @tc.name    MusicCatalogAggregation34
     * @tc.desc    descending order starts with the forty eight page card
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderByPagesDesc();
      expect(order[0]).assertEqual(11);
      expect(m.pagesOf(order[0])).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1579
     * @tc.name    MusicCatalogAggregation35
     * @tc.desc    descending order places a thirty page card second
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderByPagesDesc();
      expect(order.length).assertEqual(13);
      expect(m.pagesOf(order[1])).assertEqual(30);
      expect(order[1] === 6 || order[1] === 10).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1580
     * @tc.name    MusicCatalogAggregation36
     * @tc.desc    descending order ends with sixteen page cards
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderByPagesDesc();
      const last: number = order[order.length - 1];
      expect(m.pagesOf(last)).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1581
     * @tc.name    MusicCatalogAggregation37
     * @tc.desc    descending order is monotonically non increasing
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderByPagesDesc();
      let monotonic: boolean = true;
      for (let i = 1; i < order.length; i++) {
        if (m.pagesOf(order[i - 1]) < m.pagesOf(order[i])) {
          monotonic = false;
        }
      }
      expect(monotonic).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1582
     * @tc.name    MusicCatalogAggregation38
     * @tc.desc    descending order is a permutation of every index
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const order: number[] = m.orderByPagesDesc();
      const unique: Set<number> = new Set<number>();
      for (let i = 0; i < order.length; i++) {
        unique.add(order[i]);
      }
      expect(unique.size).assertEqual(13);
      expect(unique.has(0)).assertTrue();
      expect(unique.has(12)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1583
     * @tc.name    MusicCatalogAggregation39
     * @tc.desc    sorting does not mutate the catalog
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'order6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.orderByPagesDesc();
      expect(m.pagesOf(0)).assertEqual(16);
      expect(m.pagesOf(5)).assertEqual(24);
      expect(m.pagesOf(11)).assertEqual(48);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1584
     * @tc.name    MusicCatalogAggregation40
     * @tc.desc    five cards per page needs three pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesFor(5)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1585
     * @tc.name    MusicCatalogAggregation41
     * @tc.desc    one card per page needs thirteen pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesFor(1)).assertEqual(13);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1586
     * @tc.name    MusicCatalogAggregation42
     * @tc.desc    thirteen cards per page needs a single page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesFor(13)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1587
     * @tc.name    MusicCatalogAggregation43
     * @tc.desc    four cards per page needs four pages
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesFor(4)).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1588
     * @tc.name    MusicCatalogAggregation44
     * @tc.desc    non positive page size is rejected
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesFor(0)).assertEqual(0);
      expect(m.pagesFor(-3)).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1589
     * @tc.name    MusicCatalogAggregation45
     * @tc.desc    oversized page still reports one page
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pagesFor(100)).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1590
     * @tc.name    MusicCatalogAggregation46
     * @tc.desc    page size of sixteen pages is valid
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isPagesValid(16)).assertTrue();
      expect(m.isPagesValid(1)).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1591
     * @tc.name    MusicCatalogAggregation47
     * @tc.desc    upper page bound is inclusive
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isPagesValid(48)).assertTrue();
      expect(m.isPagesValid(49)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1592
     * @tc.name    MusicCatalogAggregation48
     * @tc.desc    zero and negative page sizes are invalid
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'paging9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isPagesValid(0)).assertFalse();
      expect(m.isPagesValid(-1)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1593
     * @tc.name    MusicCatalogAggregation49
     * @tc.desc    sm resolves the compact padding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding: MusicCatalogPadding | undefined = new MusicBreakpoint<MusicCatalogPadding>(
        MUSIC_PADDING_SM, MUSIC_PADDING_MD, MUSIC_PADDING_LG).getValue('sm');
      expect(padding === undefined ? -1 : padding.left).assertEqual(16);
      expect(padding === undefined ? -1 : padding.right).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1594
     * @tc.name    MusicCatalogAggregation50
     * @tc.desc    md resolves the medium padding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding: MusicCatalogPadding | undefined = new MusicBreakpoint<MusicCatalogPadding>(
        MUSIC_PADDING_SM, MUSIC_PADDING_MD, MUSIC_PADDING_LG).getValue('md');
      expect(padding === undefined ? -1 : padding.left).assertEqual(16);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1595
     * @tc.name    MusicCatalogAggregation51
     * @tc.desc    lg resolves the wide padding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const padding: MusicCatalogPadding | undefined = new MusicBreakpoint<MusicCatalogPadding>(
        MUSIC_PADDING_SM, MUSIC_PADDING_MD, MUSIC_PADDING_LG).getValue('lg');
      expect(padding === undefined ? -1 : padding.left).assertEqual(24);
      expect(padding === undefined ? -1 : padding.right).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1596
     * @tc.name    MusicCatalogAggregation52
     * @tc.desc    unknown breakpoint yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const value: number | undefined = new MusicBreakpoint<number>(1, 2, 3).getValue('xl');
      expect(value === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1597
     * @tc.name    MusicCatalogAggregation53
     * @tc.desc    empty breakpoint yields undefined
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const value: string | undefined = new MusicBreakpoint<string>('a', 'b', 'c').getValue('');
      expect(value === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1598
     * @tc.name    MusicCatalogAggregation54
     * @tc.desc    breakpoint lookup is case sensitive
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(new MusicBreakpoint<number>(1, 2, 3).getValue('SM') === undefined).assertTrue();
      expect(new MusicBreakpoint<number>(1, 2, 3).getValue('Md') === undefined).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1599
     * @tc.name    MusicCatalogAggregation55
     * @tc.desc    string payloads resolve per breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: MusicBreakpoint<string> = new MusicBreakpoint<string>('48vp', '100%', '100%');
      expect(bp.getValue('sm')).assertEqual('48vp');
      expect(bp.getValue('md')).assertEqual('100%');
      expect(bp.getValue('lg')).assertEqual('100%');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1600
     * @tc.name    MusicCatalogAggregation56
     * @tc.desc    boolean payloads resolve per breakpoint
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint8', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: MusicBreakpoint<boolean> = new MusicBreakpoint<boolean>(true, false, false);
      expect(bp.getValue('sm')).assertTrue();
      expect(bp.getValue('md')).assertFalse();
      expect(bp.getValue('lg')).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1601
     * @tc.name    MusicCatalogAggregation57
     * @tc.desc    falsy payloads are preserved
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint9', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: MusicBreakpoint<number> = new MusicBreakpoint<number>(0, 0, 0);
      expect(bp.getValue('sm')).assertEqual(0);
      expect(bp.getValue('lg')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1602
     * @tc.name    MusicCatalogAggregation58
     * @tc.desc    every declared breakpoint resolves a value
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint10', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: MusicBreakpoint<string> = new MusicBreakpoint<string>('s', 'm', 'l');
      let trace: string = '';
      for (let i = 0; i < MUSIC_BREAKPOINTS.length; i++) {
        trace += bp.getValue(MUSIC_BREAKPOINTS[i]) as string;
      }
      expect(trace).assertEqual('sml');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1603
     * @tc.name    MusicCatalogAggregation59
     * @tc.desc    offset table mirrors the recommendation card offsets
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint11', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const bp: MusicBreakpoint<MusicCatalogOffset> = new MusicBreakpoint<MusicCatalogOffset>(
        MUSIC_OFFSET_SM, MUSIC_OFFSET_MD, MUSIC_OFFSET_LG);
      const sm: MusicCatalogOffset | undefined = bp.getValue('sm');
      const md: MusicCatalogOffset | undefined = bp.getValue('md');
      expect(sm === undefined ? -1 : sm.x).assertEqual(0);
      expect(md === undefined ? -1 : md.x).assertEqual(11);
      expect(md === undefined ? -1 : md.y).assertEqual(-11);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1604
     * @tc.name    MusicCatalogAggregation60
     * @tc.desc    lg and md share the card offset
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint12', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(MUSIC_OFFSET_LG.x).assertEqual(MUSIC_OFFSET_MD.x);
      expect(MUSIC_OFFSET_LG.y).assertEqual(MUSIC_OFFSET_MD.y);
      expect(MUSIC_OFFSET_MD.x === -MUSIC_OFFSET_MD.y).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1605
     * @tc.name    MusicCatalogAggregation61
     * @tc.desc    md and sm share the card padding
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint13', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(MUSIC_PADDING_MD.left).assertEqual(MUSIC_PADDING_SM.left);
      expect(MUSIC_PADDING_MD.right).assertEqual(MUSIC_PADDING_SM.right);
      expect(MUSIC_PADDING_LG.left > MUSIC_PADDING_MD.left).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1606
     * @tc.name    MusicCatalogAggregation62
     * @tc.desc    padding table is symmetric on both sides
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint14', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: MusicCatalogPadding[] = [MUSIC_PADDING_SM, MUSIC_PADDING_MD, MUSIC_PADDING_LG];
      let trace: string = '';
      for (let i = 0; i < values.length; i++) {
        expect(values[i].left).assertEqual(values[i].right);
        trace += String(values[i].left) + ',';
      }
      expect(trace).assertEqual('16,16,24,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1607
     * @tc.name    MusicCatalogAggregation63
     * @tc.desc    offset table expands only on non compact breakpoints
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint15', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const values: MusicCatalogOffset[] = [MUSIC_OFFSET_SM, MUSIC_OFFSET_MD, MUSIC_OFFSET_LG];
      let trace: string = '';
      for (let i = 0; i < values.length; i++) {
        trace += String(values[i].x) + '/' + String(values[i].y) + ',';
      }
      expect(trace).assertEqual('0/0,11/-11,11/-11,');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1608
     * @tc.name    MusicCatalogAggregation64
     * @tc.desc    nested breakpoint resolves the inner table
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'breakpoint16', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const inner: MusicBreakpoint<number> = new MusicBreakpoint<number>(16, 16, 24);
      const outer: MusicBreakpoint<MusicBreakpoint<number>> = new MusicBreakpoint<MusicBreakpoint<number>>(
        inner, inner, inner);
      const resolved: MusicBreakpoint<number> | undefined = outer.getValue('lg');
      expect(resolved === undefined ? -1 : resolved.getValue('lg')).assertEqual(24);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1609
     * @tc.name    MusicCatalogAggregation65
     * @tc.desc    page span matches the reported extremes
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'aggregate1', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.pageSpan()).assertEqual(m.pagesOf(m.maxPagesIndex()) - m.pagesOf(m.minPagesIndex()));
      expect(m.pageSpan()).assertEqual(32);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1610
     * @tc.name    MusicCatalogAggregation66
     * @tc.desc    distinct page buckets add up to the catalog size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'aggregate2', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const buckets: number[] = [16, 18, 24, 25, 30, 48];
      let total: number = 0;
      for (let i = 0; i < buckets.length; i++) {
        total += m.countWithPages(buckets[i]);
      }
      expect(total).assertEqual(m.genreCount());
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1611
     * @tc.name    MusicCatalogAggregation67
     * @tc.desc    prefix deltas reproduce every card size
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'aggregate3', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let mismatches: number = 0;
      for (let i = 0; i < m.genreCount(); i++) {
        if (m.prefixPages(i + 1) - m.prefixPages(i) !== m.pagesOf(i)) {
          mismatches++;
        }
      }
      expect(mismatches).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1612
     * @tc.name    MusicCatalogAggregation68
     * @tc.desc    average times card count reconstructs the total
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'aggregate4', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(Math.abs(m.averagePages() * m.genreCount() - m.totalGenrePages()) < 1e-9).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1613
     * @tc.name    MusicCatalogAggregation69
     * @tc.desc    catalog page counts stay inside the validity window
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'aggregate5', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      let invalid: number = 0;
      for (let i = 0; i < m.genreCount(); i++) {
        if (!m.isPagesValid(m.pagesOf(i))) {
          invalid++;
        }
      }
      expect(invalid).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1614
     * @tc.name    MusicCatalogAggregation70
     * @tc.desc    song and genre catalogs are sized independently
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'aggregate6', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.songCount() + m.genreCount()).assertEqual(25);
      expect(m.songCount() !== m.genreCount()).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })

    /**
     * @tc.number  SUB_MULTIDEVICE_MUSIC_1615
     * @tc.name    MusicCatalogAggregation71
     * @tc.desc    catalog rebuilds deterministically
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it(DATASET + 'aggregate7', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const other: MusicCatalogModel = new MusicCatalogModel();
      const rebuilt: MusicCatalogSong | undefined = other.songAt(0);
      expect(other.totalGenrePages()).assertEqual(m.totalGenrePages());
      expect(other.pagesOf(11)).assertEqual(m.pagesOf(11));
      expect(rebuilt === undefined ? '' : rebuilt.cover).assertEqual('list12');
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    })
  })
}
