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

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0510
     * @tc.name    MarketConsistency051
     * @tc.desc    Market slice partition with page size 6 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit51')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0520
     * @tc.name    MarketConsistency052
     * @tc.desc    Market entry fields for index 10 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit52')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0530
     * @tc.name    MarketConsistency053
     * @tc.desc    Market slice partition with page size 8 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit53')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0540
     * @tc.name    MarketConsistency054
     * @tc.desc    Market entry fields for index 12 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 12;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit54')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0550
     * @tc.name    MarketConsistency055
     * @tc.desc    Market slice partition with page size 1 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit55')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0560
     * @tc.name    MarketConsistency056
     * @tc.desc    Market entry fields for index 14 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 14;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit56')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0570
     * @tc.name    MarketConsistency057
     * @tc.desc    Market slice partition with page size 3 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit57')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0580
     * @tc.name    MarketConsistency058
     * @tc.desc    Market entry fields for index 16 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 16;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit58')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0590
     * @tc.name    MarketConsistency059
     * @tc.desc    Market slice partition with page size 5 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit59')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0600
     * @tc.name    MarketConsistency060
     * @tc.desc    Market entry fields for index 18 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 18;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit60')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0610
     * @tc.name    MarketConsistency061
     * @tc.desc    Market slice partition with page size 7 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit61')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0620
     * @tc.name    MarketConsistency062
     * @tc.desc    Market entry fields for index 20 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 20;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit62')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0630
     * @tc.name    MarketConsistency063
     * @tc.desc    Market slice partition with page size 0 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit63')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0640
     * @tc.name    MarketConsistency064
     * @tc.desc    Market entry fields for index 1 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit64')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0650
     * @tc.name    MarketConsistency065
     * @tc.desc    Market slice partition with page size 2 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit65')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0660
     * @tc.name    MarketConsistency066
     * @tc.desc    Market entry fields for index 3 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit66')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0670
     * @tc.name    MarketConsistency067
     * @tc.desc    Market slice partition with page size 4 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit67')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0680
     * @tc.name    MarketConsistency068
     * @tc.desc    Market entry fields for index 5 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit68')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0690
     * @tc.name    MarketConsistency069
     * @tc.desc    Market slice partition with page size 6 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit69')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0700
     * @tc.name    MarketConsistency070
     * @tc.desc    Market entry fields for index 7 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit70')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0710
     * @tc.name    MarketConsistency071
     * @tc.desc    Market slice partition with page size 8 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit71')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0720
     * @tc.name    MarketConsistency072
     * @tc.desc    Market entry fields for index 9 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit72')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0730
     * @tc.name    MarketConsistency073
     * @tc.desc    Market slice partition with page size 1 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit73')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0740
     * @tc.name    MarketConsistency074
     * @tc.desc    Market entry fields for index 11 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit74')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0750
     * @tc.name    MarketConsistency075
     * @tc.desc    Market slice partition with page size 3 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit75')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0760
     * @tc.name    MarketConsistency076
     * @tc.desc    Market entry fields for index 13 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 13;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit76')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0770
     * @tc.name    MarketConsistency077
     * @tc.desc    Market slice partition with page size 5 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit77')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0780
     * @tc.name    MarketConsistency078
     * @tc.desc    Market entry fields for index 15 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 15;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit78')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0790
     * @tc.name    MarketConsistency079
     * @tc.desc    Market slice partition with page size 7 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit79')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0800
     * @tc.name    MarketConsistency080
     * @tc.desc    Market entry fields for index 17 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 17;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit80')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0810
     * @tc.name    MarketConsistency081
     * @tc.desc    Market slice partition with page size 0 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit81')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0820
     * @tc.name    MarketConsistency082
     * @tc.desc    Market entry fields for index 19 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 19;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit82')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0830
     * @tc.name    MarketConsistency083
     * @tc.desc    Market slice partition with page size 2 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit83')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0840
     * @tc.name    MarketConsistency084
     * @tc.desc    Market entry fields for index 0 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit84')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0850
     * @tc.name    MarketConsistency085
     * @tc.desc    Market slice partition with page size 4 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit85')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0860
     * @tc.name    MarketConsistency086
     * @tc.desc    Market entry fields for index 2 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit86')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0870
     * @tc.name    MarketConsistency087
     * @tc.desc    Market slice partition with page size 6 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit87')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0880
     * @tc.name    MarketConsistency088
     * @tc.desc    Market entry fields for index 4 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit88')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0890
     * @tc.name    MarketConsistency089
     * @tc.desc    Market slice partition with page size 8 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit89')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0900
     * @tc.name    MarketConsistency090
     * @tc.desc    Market entry fields for index 6 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit90')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0910
     * @tc.name    MarketConsistency091
     * @tc.desc    Market slice partition with page size 1 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit91')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0920
     * @tc.name    MarketConsistency092
     * @tc.desc    Market entry fields for index 8 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit92')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0930
     * @tc.name    MarketConsistency093
     * @tc.desc    Market slice partition with page size 3 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit93')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0940
     * @tc.name    MarketConsistency094
     * @tc.desc    Market entry fields for index 10 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit94')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0950
     * @tc.name    MarketConsistency095
     * @tc.desc    Market slice partition with page size 5 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit95')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0960
     * @tc.name    MarketConsistency096
     * @tc.desc    Market entry fields for index 12 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 12;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit96')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0970
     * @tc.name    MarketConsistency097
     * @tc.desc    Market slice partition with page size 7 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit97')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0980
     * @tc.name    MarketConsistency098
     * @tc.desc    Market entry fields for index 14 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 14;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit98')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0990
     * @tc.name    MarketConsistency099
     * @tc.desc    Market slice partition with page size 0 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit99')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1000
     * @tc.name    MarketConsistency100
     * @tc.desc    Market entry fields for index 16 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 16;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit100')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1010
     * @tc.name    MarketConsistency101
     * @tc.desc    Market slice partition with page size 2 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketConsistency101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit101')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

