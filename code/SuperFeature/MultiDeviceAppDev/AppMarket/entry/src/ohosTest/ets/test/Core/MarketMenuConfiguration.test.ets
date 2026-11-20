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

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0162
     * @tc.name    MarketMenuConfiguration162
     * @tc.desc    Market slice partition with page size 0 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit162')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0163
     * @tc.name    MarketMenuConfiguration163
     * @tc.desc    Market entry fields for index 16 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 16;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit163')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0164
     * @tc.name    MarketMenuConfiguration164
     * @tc.desc    Market slice partition with page size 2 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit164')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0165
     * @tc.name    MarketMenuConfiguration165
     * @tc.desc    Market entry fields for index 18 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 18;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit165')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0166
     * @tc.name    MarketMenuConfiguration166
     * @tc.desc    Market slice partition with page size 4 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit166')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0167
     * @tc.name    MarketMenuConfiguration167
     * @tc.desc    Market entry fields for index 20 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 20;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit167')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0168
     * @tc.name    MarketMenuConfiguration168
     * @tc.desc    Market slice partition with page size 6 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit168')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0169
     * @tc.name    MarketMenuConfiguration169
     * @tc.desc    Market entry fields for index 1 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit169')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0170
     * @tc.name    MarketMenuConfiguration170
     * @tc.desc    Market slice partition with page size 8 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit170')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0171
     * @tc.name    MarketMenuConfiguration171
     * @tc.desc    Market entry fields for index 3 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit171')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0172
     * @tc.name    MarketMenuConfiguration172
     * @tc.desc    Market slice partition with page size 1 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit172')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0173
     * @tc.name    MarketMenuConfiguration173
     * @tc.desc    Market entry fields for index 5 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit173')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0174
     * @tc.name    MarketMenuConfiguration174
     * @tc.desc    Market slice partition with page size 3 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit174')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0175
     * @tc.name    MarketMenuConfiguration175
     * @tc.desc    Market entry fields for index 7 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit175')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0176
     * @tc.name    MarketMenuConfiguration176
     * @tc.desc    Market slice partition with page size 5 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit176')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0177
     * @tc.name    MarketMenuConfiguration177
     * @tc.desc    Market entry fields for index 9 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit177')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0178
     * @tc.name    MarketMenuConfiguration178
     * @tc.desc    Market slice partition with page size 7 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit178')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0179
     * @tc.name    MarketMenuConfiguration179
     * @tc.desc    Market entry fields for index 11 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit179')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0180
     * @tc.name    MarketMenuConfiguration180
     * @tc.desc    Market slice partition with page size 0 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit180')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0181
     * @tc.name    MarketMenuConfiguration181
     * @tc.desc    Market entry fields for index 13 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 13;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit181')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0182
     * @tc.name    MarketMenuConfiguration182
     * @tc.desc    Market slice partition with page size 2 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit182')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0183
     * @tc.name    MarketMenuConfiguration183
     * @tc.desc    Market entry fields for index 15 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 15;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit183')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0184
     * @tc.name    MarketMenuConfiguration184
     * @tc.desc    Market slice partition with page size 4 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit184')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0185
     * @tc.name    MarketMenuConfiguration185
     * @tc.desc    Market entry fields for index 17 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 17;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit185')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0186
     * @tc.name    MarketMenuConfiguration186
     * @tc.desc    Market slice partition with page size 6 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit186')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0187
     * @tc.name    MarketMenuConfiguration187
     * @tc.desc    Market entry fields for index 19 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 19;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit187')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0188
     * @tc.name    MarketMenuConfiguration188
     * @tc.desc    Market slice partition with page size 8 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit188')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0189
     * @tc.name    MarketMenuConfiguration189
     * @tc.desc    Market entry fields for index 0 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit189')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0190
     * @tc.name    MarketMenuConfiguration190
     * @tc.desc    Market slice partition with page size 1 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit190')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0191
     * @tc.name    MarketMenuConfiguration191
     * @tc.desc    Market entry fields for index 2 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit191')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0192
     * @tc.name    MarketMenuConfiguration192
     * @tc.desc    Market slice partition with page size 3 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit192')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0193
     * @tc.name    MarketMenuConfiguration193
     * @tc.desc    Market entry fields for index 4 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit193')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0194
     * @tc.name    MarketMenuConfiguration194
     * @tc.desc    Market slice partition with page size 5 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit194')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0195
     * @tc.name    MarketMenuConfiguration195
     * @tc.desc    Market entry fields for index 6 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit195')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0196
     * @tc.name    MarketMenuConfiguration196
     * @tc.desc    Market slice partition with page size 7 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit196')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0197
     * @tc.name    MarketMenuConfiguration197
     * @tc.desc    Market entry fields for index 8 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 8;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit197')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0198
     * @tc.name    MarketMenuConfiguration198
     * @tc.desc    Market slice partition with page size 0 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit198')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0199
     * @tc.name    MarketMenuConfiguration199
     * @tc.desc    Market entry fields for index 10 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 10;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit199')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0200
     * @tc.name    MarketMenuConfiguration200
     * @tc.desc    Market slice partition with page size 2 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit200')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0201
     * @tc.name    MarketMenuConfiguration201
     * @tc.desc    Market entry fields for index 12 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 12;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit201')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0202
     * @tc.name    MarketMenuConfiguration202
     * @tc.desc    Market slice partition with page size 4 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit202')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0203
     * @tc.name    MarketMenuConfiguration203
     * @tc.desc    Market entry fields for index 14 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 14;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit203')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0204
     * @tc.name    MarketMenuConfiguration204
     * @tc.desc    Market slice partition with page size 6 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit204')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0205
     * @tc.name    MarketMenuConfiguration205
     * @tc.desc    Market entry fields for index 16 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 16;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit205')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0206
     * @tc.name    MarketMenuConfiguration206
     * @tc.desc    Market slice partition with page size 8 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 8;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit206')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0207
     * @tc.name    MarketMenuConfiguration207
     * @tc.desc    Market entry fields for index 18 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 18;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit207')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0208
     * @tc.name    MarketMenuConfiguration208
     * @tc.desc    Market slice partition with page size 1 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit208')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0209
     * @tc.name    MarketMenuConfiguration209
     * @tc.desc    Market entry fields for index 20 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 20;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit209')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0210
     * @tc.name    MarketMenuConfiguration210
     * @tc.desc    Market slice partition with page size 3 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit210')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0211
     * @tc.name    MarketMenuConfiguration211
     * @tc.desc    Market entry fields for index 1 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit211')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0212
     * @tc.name    MarketMenuConfiguration212
     * @tc.desc    Market slice partition with page size 5 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit212')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0213
     * @tc.name    MarketMenuConfiguration213
     * @tc.desc    Market entry fields for index 3 probe 213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit213')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0214
     * @tc.name    MarketMenuConfiguration214
     * @tc.desc    Market slice partition with page size 7 probe 214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 7;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit214')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0215
     * @tc.name    MarketMenuConfiguration215
     * @tc.desc    Market entry fields for index 5 probe 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit215')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0216
     * @tc.name    MarketMenuConfiguration216
     * @tc.desc    Market slice partition with page size 0 probe 216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit216')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0217
     * @tc.name    MarketMenuConfiguration217
     * @tc.desc    Market entry fields for index 7 probe 217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit217')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0218
     * @tc.name    MarketMenuConfiguration218
     * @tc.desc    Market slice partition with page size 2 probe 218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit218')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0219
     * @tc.name    MarketMenuConfiguration219
     * @tc.desc    Market entry fields for index 9 probe 219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 9;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit219')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0220
     * @tc.name    MarketMenuConfiguration220
     * @tc.desc    Market slice partition with page size 4 probe 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit220')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0221
     * @tc.name    MarketMenuConfiguration221
     * @tc.desc    Market entry fields for index 11 probe 221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 11;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit221')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0222
     * @tc.name    MarketMenuConfiguration222
     * @tc.desc    Market slice partition with page size 6 probe 222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 6;
      const pages = m.totalPages(ps);
      let covered = 0;
      for (let k = 0; k < pages; k++) { covered += m.slicePage(k, ps).length; }
      expect(covered).assertEqual(m.totalCount());
      expect(m.slicePage(pages, ps).length).assertEqual(0);
      expect(m.getData(0) !== undefined).assertEqual(true);
      expect(m.searchTitle('nohit222')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0223
     * @tc.name    MarketMenuConfiguration223
     * @tc.desc    Market entry fields for index 13 probe 223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketMenuConfiguration223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 13;
      const item = m.getData(idx);
      expect(item !== undefined).assertEqual(true);
      expect((item?.id ?? '')).assertEqual(String(idx));
      expect((item?.title.length ?? 0) > 0).assertEqual(true);
      expect(m.searchTitle('nohit223')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

