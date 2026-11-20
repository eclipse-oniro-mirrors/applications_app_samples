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
import { MarketModel } from '../Shared/MarketModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[MarketTests]';

export default function marketConsistencySuite() {
  describe('MarketConsistencySuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0010
     * @tc.name    MarketConsistency001
     * @tc.desc    Market slice partition with page size 1 probe 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit1')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0020
     * @tc.name    MarketConsistency002
     * @tc.desc    Market entry fields for index 2 probe 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit2')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0030
     * @tc.name    MarketConsistency003
     * @tc.desc    Market slice partition with page size 3 probe 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit3')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0040
     * @tc.name    MarketConsistency004
     * @tc.desc    Market entry fields for index 4 probe 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit4')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0050
     * @tc.name    MarketConsistency005
     * @tc.desc    Market slice partition with page size 5 probe 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit5')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0060
     * @tc.name    MarketConsistency006
     * @tc.desc    Market entry fields for index 6 probe 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit6')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0070
     * @tc.name    MarketConsistency007
     * @tc.desc    Market slice partition with page size 7 probe 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit7')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0080
     * @tc.name    MarketConsistency008
     * @tc.desc    Market entry fields for index 8 probe 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit8')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0090
     * @tc.name    MarketConsistency009
     * @tc.desc    Market slice partition with page size 0 probe 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit9')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0100
     * @tc.name    MarketConsistency010
     * @tc.desc    Market entry fields for index 10 probe 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit10')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0110
     * @tc.name    MarketConsistency011
     * @tc.desc    Market slice partition with page size 2 probe 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit11')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0120
     * @tc.name    MarketConsistency012
     * @tc.desc    Market entry fields for index 12 probe 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 12;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit12')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0130
     * @tc.name    MarketConsistency013
     * @tc.desc    Market slice partition with page size 4 probe 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit13')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0140
     * @tc.name    MarketConsistency014
     * @tc.desc    Market entry fields for index 14 probe 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 14;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit14')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0150
     * @tc.name    MarketConsistency015
     * @tc.desc    Market slice partition with page size 6 probe 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit15')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0160
     * @tc.name    MarketConsistency016
     * @tc.desc    Market entry fields for index 16 probe 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 16;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit16')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0170
     * @tc.name    MarketConsistency017
     * @tc.desc    Market slice partition with page size 8 probe 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit17')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0180
     * @tc.name    MarketConsistency018
     * @tc.desc    Market entry fields for index 18 probe 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 18;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit18')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0190
     * @tc.name    MarketConsistency019
     * @tc.desc    Market slice partition with page size 1 probe 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit19')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0200
     * @tc.name    MarketConsistency020
     * @tc.desc    Market entry fields for index 20 probe 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 20;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit20')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0210
     * @tc.name    MarketConsistency021
     * @tc.desc    Market slice partition with page size 3 probe 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit21')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0220
     * @tc.name    MarketConsistency022
     * @tc.desc    Market entry fields for index 1 probe 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit22')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0230
     * @tc.name    MarketConsistency023
     * @tc.desc    Market slice partition with page size 5 probe 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit23')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0240
     * @tc.name    MarketConsistency024
     * @tc.desc    Market entry fields for index 3 probe 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit24')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0250
     * @tc.name    MarketConsistency025
     * @tc.desc    Market slice partition with page size 7 probe 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit25')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0260
     * @tc.name    MarketConsistency026
     * @tc.desc    Market entry fields for index 5 probe 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit26')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0270
     * @tc.name    MarketConsistency027
     * @tc.desc    Market slice partition with page size 0 probe 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit27')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0280
     * @tc.name    MarketConsistency028
     * @tc.desc    Market entry fields for index 7 probe 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit28')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0290
     * @tc.name    MarketConsistency029
     * @tc.desc    Market slice partition with page size 2 probe 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit29')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0300
     * @tc.name    MarketConsistency030
     * @tc.desc    Market entry fields for index 9 probe 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit30')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0310
     * @tc.name    MarketConsistency031
     * @tc.desc    Market slice partition with page size 4 probe 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit31')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0320
     * @tc.name    MarketConsistency032
     * @tc.desc    Market entry fields for index 11 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit32')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0330
     * @tc.name    MarketConsistency033
     * @tc.desc    Market slice partition with page size 6 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit33')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0340
     * @tc.name    MarketConsistency034
     * @tc.desc    Market entry fields for index 13 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 13;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit34')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0350
     * @tc.name    MarketConsistency035
     * @tc.desc    Market slice partition with page size 8 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit35')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0360
     * @tc.name    MarketConsistency036
     * @tc.desc    Market entry fields for index 15 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 15;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit36')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0370
     * @tc.name    MarketConsistency037
     * @tc.desc    Market slice partition with page size 1 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit37')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0380
     * @tc.name    MarketConsistency038
     * @tc.desc    Market entry fields for index 17 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 17;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit38')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0390
     * @tc.name    MarketConsistency039
     * @tc.desc    Market slice partition with page size 3 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit39')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0400
     * @tc.name    MarketConsistency040
     * @tc.desc    Market entry fields for index 19 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 19;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit40')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0410
     * @tc.name    MarketConsistency041
     * @tc.desc    Market slice partition with page size 5 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit41')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0420
     * @tc.name    MarketConsistency042
     * @tc.desc    Market entry fields for index 0 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit42')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0430
     * @tc.name    MarketConsistency043
     * @tc.desc    Market slice partition with page size 7 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit43')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0440
     * @tc.name    MarketConsistency044
     * @tc.desc    Market entry fields for index 2 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit44')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0450
     * @tc.name    MarketConsistency045
     * @tc.desc    Market slice partition with page size 0 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit45')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0460
     * @tc.name    MarketConsistency046
     * @tc.desc    Market entry fields for index 4 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit46')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0470
     * @tc.name    MarketConsistency047
     * @tc.desc    Market slice partition with page size 2 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit47')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0480
     * @tc.name    MarketConsistency048
     * @tc.desc    Market entry fields for index 6 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit48')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0490
     * @tc.name    MarketConsistency049
     * @tc.desc    Market slice partition with page size 4 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit49')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0500
     * @tc.name    MarketConsistency050
     * @tc.desc    Market entry fields for index 8 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit50')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

