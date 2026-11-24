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

export default function marketDataBindingSuite() {
  describe('MarketDataBindingSuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0100
     * @tc.name    MarketDataBinding001
     * @tc.desc    Market push entry with probe title 366 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(9);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit366')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0200
     * @tc.name    MarketDataBinding002
     * @tc.desc    Market reload notify count 367 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit367')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0300
     * @tc.name    MarketDataBinding003
     * @tc.desc    Market push entry with probe title 368 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(11);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit368')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0400
     * @tc.name    MarketDataBinding004
     * @tc.desc    Market reload notify count 369 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit369')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0500
     * @tc.name    MarketDataBinding005
     * @tc.desc    Market push entry with probe title 370 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(13);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit370')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0600
     * @tc.name    MarketDataBinding006
     * @tc.desc    Market reload notify count 371 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit371')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0700
     * @tc.name    MarketDataBinding007
     * @tc.desc    Market push entry with probe title 372 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(15);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit372')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0800
     * @tc.name    MarketDataBinding008
     * @tc.desc    Market reload notify count 373 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit373')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0900
     * @tc.name    MarketDataBinding009
     * @tc.desc    Market push entry with probe title 374 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(17);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit374')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1000
     * @tc.name    MarketDataBinding010
     * @tc.desc    Market reload notify count 375 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit375')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1100
     * @tc.name    MarketDataBinding011
     * @tc.desc    Market push entry with probe title 376 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(19);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit376')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1200
     * @tc.name    MarketDataBinding012
     * @tc.desc    Market reload notify count 377 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit377')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1300
     * @tc.name    MarketDataBinding013
     * @tc.desc    Market push entry with probe title 378 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(0);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit378')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1400
     * @tc.name    MarketDataBinding014
     * @tc.desc    Market reload notify count 379 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit379')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1500
     * @tc.name    MarketDataBinding015
     * @tc.desc    Market push entry with probe title 380 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(2);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit380')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1600
     * @tc.name    MarketDataBinding016
     * @tc.desc    Market reload notify count 381 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit381')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1700
     * @tc.name    MarketDataBinding017
     * @tc.desc    Market push entry with probe title 382 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(4);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit382')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1800
     * @tc.name    MarketDataBinding018
     * @tc.desc    Market reload notify count 383 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit383')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1900
     * @tc.name    MarketDataBinding019
     * @tc.desc    Market push entry with probe title 384 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(6);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit384')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2000
     * @tc.name    MarketDataBinding020
     * @tc.desc    Market reload notify count 385 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit385')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2100
     * @tc.name    MarketDataBinding021
     * @tc.desc    Market push entry with probe title 386 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(8);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit386')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2200
     * @tc.name    MarketDataBinding022
     * @tc.desc    Market reload notify count 387 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit387')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2300
     * @tc.name    MarketDataBinding023
     * @tc.desc    Market push entry with probe title 388 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(10);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit388')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2400
     * @tc.name    MarketDataBinding024
     * @tc.desc    Market reload notify count 389 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit389')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2500
     * @tc.name    MarketDataBinding025
     * @tc.desc    Market push entry with probe title 390 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(12);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit390')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2600
     * @tc.name    MarketDataBinding026
     * @tc.desc    Market reload notify count 391 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit391')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2700
     * @tc.name    MarketDataBinding027
     * @tc.desc    Market push entry with probe title 392 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(14);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit392')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2800
     * @tc.name    MarketDataBinding028
     * @tc.desc    Market reload notify count 393 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit393')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2900
     * @tc.name    MarketDataBinding029
     * @tc.desc    Market push entry with probe title 394 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(16);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit394')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3000
     * @tc.name    MarketDataBinding030
     * @tc.desc    Market reload notify count 395 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit395')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3100
     * @tc.name    MarketDataBinding031
     * @tc.desc    Market push entry with probe title 396 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(18);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit396')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3200
     * @tc.name    MarketDataBinding032
     * @tc.desc    Market reload notify count 397 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit397')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3300
     * @tc.name    MarketDataBinding033
     * @tc.desc    Market push entry with probe title 398 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(20);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit398')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3400
     * @tc.name    MarketDataBinding034
     * @tc.desc    Market reload notify count 399 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit399')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3500
     * @tc.name    MarketDataBinding035
     * @tc.desc    Market push entry with probe title 400 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(1);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit400')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3600
     * @tc.name    MarketDataBinding036
     * @tc.desc    Market reload notify count 401 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit401')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3700
     * @tc.name    MarketDataBinding037
     * @tc.desc    Market push entry with probe title 402 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(3);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit402')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3800
     * @tc.name    MarketDataBinding038
     * @tc.desc    Market reload notify count 403 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit403')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3900
     * @tc.name    MarketDataBinding039
     * @tc.desc    Market push entry with probe title 404 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(5);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit404')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4000
     * @tc.name    MarketDataBinding040
     * @tc.desc    Market reload notify count 405 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit405')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4100
     * @tc.name    MarketDataBinding041
     * @tc.desc    Market push entry with probe title 406 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(7);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit406')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4200
     * @tc.name    MarketDataBinding042
     * @tc.desc    Market reload notify count 407 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit407')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4300
     * @tc.name    MarketDataBinding043
     * @tc.desc    Market push entry with probe title 408 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(9);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit408')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4400
     * @tc.name    MarketDataBinding044
     * @tc.desc    Market reload notify count 409 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit409')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4500
     * @tc.name    MarketDataBinding045
     * @tc.desc    Market push entry with probe title 410 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(11);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit410')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4600
     * @tc.name    MarketDataBinding046
     * @tc.desc    Market reload notify count 411 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit411')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4700
     * @tc.name    MarketDataBinding047
     * @tc.desc    Market push entry with probe title 412 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(13);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit412')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4800
     * @tc.name    MarketDataBinding048
     * @tc.desc    Market reload notify count 413 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit413')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4900
     * @tc.name    MarketDataBinding049
     * @tc.desc    Market push entry with probe title 414 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(15);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit414')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5000
     * @tc.name    MarketDataBinding050
     * @tc.desc    Market reload notify count 415 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit415')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5100
     * @tc.name    MarketDataBinding051
     * @tc.desc    Market push entry with probe title 416 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(17);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit416')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5200
     * @tc.name    MarketDataBinding052
     * @tc.desc    Market reload notify count 417 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit417')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5300
     * @tc.name    MarketDataBinding053
     * @tc.desc    Market push entry with probe title 418 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(19);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit418')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5400
     * @tc.name    MarketDataBinding054
     * @tc.desc    Market reload notify count 419 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit419')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5500
     * @tc.name    MarketDataBinding055
     * @tc.desc    Market push entry with probe title 420 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(0);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit420')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5600
     * @tc.name    MarketDataBinding056
     * @tc.desc    Market reload notify count 421 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit421')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5700
     * @tc.name    MarketDataBinding057
     * @tc.desc    Market push entry with probe title 422 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(2);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit422')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5800
     * @tc.name    MarketDataBinding058
     * @tc.desc    Market reload notify count 423 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit423')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5900
     * @tc.name    MarketDataBinding059
     * @tc.desc    Market push entry with probe title 424 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(4);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit424')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6000
     * @tc.name    MarketDataBinding060
     * @tc.desc    Market reload notify count 425 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit425')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6100
     * @tc.name    MarketDataBinding061
     * @tc.desc    Market push entry with probe title 426 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(6);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit426')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6200
     * @tc.name    MarketDataBinding062
     * @tc.desc    Market reload notify count 427 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit427')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6300
     * @tc.name    MarketDataBinding063
     * @tc.desc    Market push entry with probe title 428 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(8);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit428')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6400
     * @tc.name    MarketDataBinding064
     * @tc.desc    Market reload notify count 429 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit429')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6500
     * @tc.name    MarketDataBinding065
     * @tc.desc    Market push entry with probe title 430 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(10);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit430')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6600
     * @tc.name    MarketDataBinding066
     * @tc.desc    Market reload notify count 431 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit431')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6700
     * @tc.name    MarketDataBinding067
     * @tc.desc    Market push entry with probe title 432 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(12);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit432')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6800
     * @tc.name    MarketDataBinding068
     * @tc.desc    Market reload notify count 433 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit433')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6900
     * @tc.name    MarketDataBinding069
     * @tc.desc    Market push entry with probe title 434 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(14);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit434')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7000
     * @tc.name    MarketDataBinding070
     * @tc.desc    Market reload notify count 435 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit435')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7100
     * @tc.name    MarketDataBinding071
     * @tc.desc    Market push entry with probe title 436 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(16);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit436')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7200
     * @tc.name    MarketDataBinding072
     * @tc.desc    Market reload notify count 437 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit437')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7300
     * @tc.name    MarketDataBinding073
     * @tc.desc    Market push entry with probe title 438 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(18);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit438')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7400
     * @tc.name    MarketDataBinding074
     * @tc.desc    Market reload notify count 439 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit439')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7500
     * @tc.name    MarketDataBinding075
     * @tc.desc    Market push entry with probe title 440 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(20);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit440')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7600
     * @tc.name    MarketDataBinding076
     * @tc.desc    Market reload notify count 441 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit441')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7700
     * @tc.name    MarketDataBinding077
     * @tc.desc    Market push entry with probe title 442 probe 442
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(1);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit442')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7800
     * @tc.name    MarketDataBinding078
     * @tc.desc    Market reload notify count 443 probe 443
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit443')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7900
     * @tc.name    MarketDataBinding079
     * @tc.desc    Market push entry with probe title 444 probe 444
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(3);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit444')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8000
     * @tc.name    MarketDataBinding080
     * @tc.desc    Market reload notify count 445 probe 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit445')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8100
     * @tc.name    MarketDataBinding081
     * @tc.desc    Market push entry with probe title 446 probe 446
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(5);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit446')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8200
     * @tc.name    MarketDataBinding082
     * @tc.desc    Market reload notify count 447 probe 447
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit447')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8300
     * @tc.name    MarketDataBinding083
     * @tc.desc    Market push entry with probe title 448 probe 448
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(7);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit448')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8400
     * @tc.name    MarketDataBinding084
     * @tc.desc    Market reload notify count 449 probe 449
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit449')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8500
     * @tc.name    MarketDataBinding085
     * @tc.desc    Market push entry with probe title 450 probe 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketDataBinding085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(9);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit450')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

