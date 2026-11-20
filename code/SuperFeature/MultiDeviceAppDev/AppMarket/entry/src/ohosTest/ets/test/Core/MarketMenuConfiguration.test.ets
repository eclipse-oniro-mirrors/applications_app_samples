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

export default function marketMenuConfigurationSuite() {
  describe('MarketMenuConfigurationSuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0102
     * @tc.name    MarketMenuConfiguration102
     * @tc.desc    Market slice partition with page size 3 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit102')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0103
     * @tc.name    MarketMenuConfiguration103
     * @tc.desc    Market entry fields for index 19 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 19;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit103')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0104
     * @tc.name    MarketMenuConfiguration104
     * @tc.desc    Market slice partition with page size 5 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit104')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0105
     * @tc.name    MarketMenuConfiguration105
     * @tc.desc    Market entry fields for index 0 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit105')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0106
     * @tc.name    MarketMenuConfiguration106
     * @tc.desc    Market slice partition with page size 7 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit106')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0107
     * @tc.name    MarketMenuConfiguration107
     * @tc.desc    Market entry fields for index 2 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit107')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0108
     * @tc.name    MarketMenuConfiguration108
     * @tc.desc    Market slice partition with page size 0 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit108')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0109
     * @tc.name    MarketMenuConfiguration109
     * @tc.desc    Market entry fields for index 4 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit109')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0110
     * @tc.name    MarketMenuConfiguration110
     * @tc.desc    Market slice partition with page size 2 probe 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit110')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0111
     * @tc.name    MarketMenuConfiguration111
     * @tc.desc    Market entry fields for index 6 probe 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit111')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0112
     * @tc.name    MarketMenuConfiguration112
     * @tc.desc    Market slice partition with page size 4 probe 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit112')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0113
     * @tc.name    MarketMenuConfiguration113
     * @tc.desc    Market entry fields for index 8 probe 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit113')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0114
     * @tc.name    MarketMenuConfiguration114
     * @tc.desc    Market slice partition with page size 6 probe 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit114')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0115
     * @tc.name    MarketMenuConfiguration115
     * @tc.desc    Market entry fields for index 10 probe 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit115')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0116
     * @tc.name    MarketMenuConfiguration116
     * @tc.desc    Market slice partition with page size 8 probe 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit116')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0117
     * @tc.name    MarketMenuConfiguration117
     * @tc.desc    Market entry fields for index 12 probe 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 12;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit117')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0118
     * @tc.name    MarketMenuConfiguration118
     * @tc.desc    Market slice partition with page size 1 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit118')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0119
     * @tc.name    MarketMenuConfiguration119
     * @tc.desc    Market entry fields for index 14 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 14;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit119')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0120
     * @tc.name    MarketMenuConfiguration120
     * @tc.desc    Market slice partition with page size 3 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit120')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0121
     * @tc.name    MarketMenuConfiguration121
     * @tc.desc    Market entry fields for index 16 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 16;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit121')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0122
     * @tc.name    MarketMenuConfiguration122
     * @tc.desc    Market slice partition with page size 5 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit122')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0123
     * @tc.name    MarketMenuConfiguration123
     * @tc.desc    Market entry fields for index 18 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 18;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit123')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0124
     * @tc.name    MarketMenuConfiguration124
     * @tc.desc    Market slice partition with page size 7 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit124')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0125
     * @tc.name    MarketMenuConfiguration125
     * @tc.desc    Market entry fields for index 20 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 20;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit125')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0126
     * @tc.name    MarketMenuConfiguration126
     * @tc.desc    Market slice partition with page size 0 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit126')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0127
     * @tc.name    MarketMenuConfiguration127
     * @tc.desc    Market entry fields for index 1 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit127')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0128
     * @tc.name    MarketMenuConfiguration128
     * @tc.desc    Market slice partition with page size 2 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit128')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0129
     * @tc.name    MarketMenuConfiguration129
     * @tc.desc    Market entry fields for index 3 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit129')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0130
     * @tc.name    MarketMenuConfiguration130
     * @tc.desc    Market slice partition with page size 4 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit130')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0131
     * @tc.name    MarketMenuConfiguration131
     * @tc.desc    Market entry fields for index 5 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit131')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0132
     * @tc.name    MarketMenuConfiguration132
     * @tc.desc    Market slice partition with page size 6 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit132')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0133
     * @tc.name    MarketMenuConfiguration133
     * @tc.desc    Market entry fields for index 7 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit133')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0134
     * @tc.name    MarketMenuConfiguration134
     * @tc.desc    Market slice partition with page size 8 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit134')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0135
     * @tc.name    MarketMenuConfiguration135
     * @tc.desc    Market entry fields for index 9 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit135')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0136
     * @tc.name    MarketMenuConfiguration136
     * @tc.desc    Market slice partition with page size 1 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit136')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0137
     * @tc.name    MarketMenuConfiguration137
     * @tc.desc    Market entry fields for index 11 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit137')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0138
     * @tc.name    MarketMenuConfiguration138
     * @tc.desc    Market slice partition with page size 3 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit138')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0139
     * @tc.name    MarketMenuConfiguration139
     * @tc.desc    Market entry fields for index 13 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 13;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit139')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0140
     * @tc.name    MarketMenuConfiguration140
     * @tc.desc    Market slice partition with page size 5 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit140')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0141
     * @tc.name    MarketMenuConfiguration141
     * @tc.desc    Market entry fields for index 15 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 15;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit141')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0142
     * @tc.name    MarketMenuConfiguration142
     * @tc.desc    Market slice partition with page size 7 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit142')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0143
     * @tc.name    MarketMenuConfiguration143
     * @tc.desc    Market entry fields for index 17 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 17;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit143')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0144
     * @tc.name    MarketMenuConfiguration144
     * @tc.desc    Market slice partition with page size 0 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit144')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0145
     * @tc.name    MarketMenuConfiguration145
     * @tc.desc    Market entry fields for index 19 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 19;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit145')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0146
     * @tc.name    MarketMenuConfiguration146
     * @tc.desc    Market slice partition with page size 2 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit146')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0147
     * @tc.name    MarketMenuConfiguration147
     * @tc.desc    Market entry fields for index 0 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit147')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0148
     * @tc.name    MarketMenuConfiguration148
     * @tc.desc    Market slice partition with page size 4 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit148')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0149
     * @tc.name    MarketMenuConfiguration149
     * @tc.desc    Market entry fields for index 2 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit149')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0150
     * @tc.name    MarketMenuConfiguration150
     * @tc.desc    Market slice partition with page size 6 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit150')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0151
     * @tc.name    MarketMenuConfiguration151
     * @tc.desc    Market entry fields for index 4 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit151')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0152
     * @tc.name    MarketMenuConfiguration152
     * @tc.desc    Market slice partition with page size 8 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit152')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0153
     * @tc.name    MarketMenuConfiguration153
     * @tc.desc    Market entry fields for index 6 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit153')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0154
     * @tc.name    MarketMenuConfiguration154
     * @tc.desc    Market slice partition with page size 1 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit154')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0155
     * @tc.name    MarketMenuConfiguration155
     * @tc.desc    Market entry fields for index 8 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit155')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0156
     * @tc.name    MarketMenuConfiguration156
     * @tc.desc    Market slice partition with page size 3 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit156')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0157
     * @tc.name    MarketMenuConfiguration157
     * @tc.desc    Market entry fields for index 10 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit157')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0158
     * @tc.name    MarketMenuConfiguration158
     * @tc.desc    Market slice partition with page size 5 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit158')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0159
     * @tc.name    MarketMenuConfiguration159
     * @tc.desc    Market entry fields for index 12 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 12;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit159')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0160
     * @tc.name    MarketMenuConfiguration160
     * @tc.desc    Market slice partition with page size 7 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit160')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0161
     * @tc.name    MarketMenuConfiguration161
     * @tc.desc    Market entry fields for index 14 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 14;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit161')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

