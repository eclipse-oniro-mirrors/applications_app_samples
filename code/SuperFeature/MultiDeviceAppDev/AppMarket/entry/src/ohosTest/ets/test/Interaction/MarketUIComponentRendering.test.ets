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

export default function marketUIComponentRenderingSuite() {
  describe('MarketUIComponentRenderingSuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0451
     * @tc.name    MarketUIComponentRendering451
     * @tc.desc    Market push entry with probe title 451 probe 451
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering451', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(10);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit451')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0452
     * @tc.name    MarketUIComponentRendering452
     * @tc.desc    Market reload notify count 452 probe 452
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering452', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit452')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0453
     * @tc.name    MarketUIComponentRendering453
     * @tc.desc    Market push entry with probe title 453 probe 453
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering453', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(12);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit453')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0454
     * @tc.name    MarketUIComponentRendering454
     * @tc.desc    Market reload notify count 454 probe 454
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering454', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit454')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0455
     * @tc.name    MarketUIComponentRendering455
     * @tc.desc    Market push entry with probe title 455 probe 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering455', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(14);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit455')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0456
     * @tc.name    MarketUIComponentRendering456
     * @tc.desc    Market reload notify count 456 probe 456
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering456', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit456')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0457
     * @tc.name    MarketUIComponentRendering457
     * @tc.desc    Market push entry with probe title 457 probe 457
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering457', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(16);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit457')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0458
     * @tc.name    MarketUIComponentRendering458
     * @tc.desc    Market reload notify count 458 probe 458
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering458', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit458')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0459
     * @tc.name    MarketUIComponentRendering459
     * @tc.desc    Market push entry with probe title 459 probe 459
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering459', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(18);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit459')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0460
     * @tc.name    MarketUIComponentRendering460
     * @tc.desc    Market reload notify count 460 probe 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering460', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit460')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0461
     * @tc.name    MarketUIComponentRendering461
     * @tc.desc    Market push entry with probe title 461 probe 461
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering461', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(20);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit461')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0462
     * @tc.name    MarketUIComponentRendering462
     * @tc.desc    Market reload notify count 462 probe 462
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering462', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit462')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0463
     * @tc.name    MarketUIComponentRendering463
     * @tc.desc    Market push entry with probe title 463 probe 463
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering463', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(1);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit463')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0464
     * @tc.name    MarketUIComponentRendering464
     * @tc.desc    Market reload notify count 464 probe 464
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering464', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit464')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0465
     * @tc.name    MarketUIComponentRendering465
     * @tc.desc    Market push entry with probe title 465 probe 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering465', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(3);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit465')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0466
     * @tc.name    MarketUIComponentRendering466
     * @tc.desc    Market reload notify count 466 probe 466
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering466', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit466')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0467
     * @tc.name    MarketUIComponentRendering467
     * @tc.desc    Market push entry with probe title 467 probe 467
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering467', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(5);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit467')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0468
     * @tc.name    MarketUIComponentRendering468
     * @tc.desc    Market reload notify count 468 probe 468
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering468', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit468')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0469
     * @tc.name    MarketUIComponentRendering469
     * @tc.desc    Market push entry with probe title 469 probe 469
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering469', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(7);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit469')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0470
     * @tc.name    MarketUIComponentRendering470
     * @tc.desc    Market reload notify count 470 probe 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering470', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit470')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0471
     * @tc.name    MarketUIComponentRendering471
     * @tc.desc    Market push entry with probe title 471 probe 471
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering471', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(9);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit471')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0472
     * @tc.name    MarketUIComponentRendering472
     * @tc.desc    Market reload notify count 472 probe 472
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering472', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit472')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0473
     * @tc.name    MarketUIComponentRendering473
     * @tc.desc    Market push entry with probe title 473 probe 473
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering473', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(11);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit473')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0474
     * @tc.name    MarketUIComponentRendering474
     * @tc.desc    Market reload notify count 474 probe 474
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering474', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit474')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0475
     * @tc.name    MarketUIComponentRendering475
     * @tc.desc    Market push entry with probe title 475 probe 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering475', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(13);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit475')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0476
     * @tc.name    MarketUIComponentRendering476
     * @tc.desc    Market reload notify count 476 probe 476
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering476', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit476')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0477
     * @tc.name    MarketUIComponentRendering477
     * @tc.desc    Market push entry with probe title 477 probe 477
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering477', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(15);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit477')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0478
     * @tc.name    MarketUIComponentRendering478
     * @tc.desc    Market reload notify count 478 probe 478
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering478', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit478')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0479
     * @tc.name    MarketUIComponentRendering479
     * @tc.desc    Market push entry with probe title 479 probe 479
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering479', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(17);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit479')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0480
     * @tc.name    MarketUIComponentRendering480
     * @tc.desc    Market reload notify count 480 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit480')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0481
     * @tc.name    MarketUIComponentRendering481
     * @tc.desc    Market push entry with probe title 481 probe 481
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering481', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(19);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit481')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0482
     * @tc.name    MarketUIComponentRendering482
     * @tc.desc    Market reload notify count 482 probe 482
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering482', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit482')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0483
     * @tc.name    MarketUIComponentRendering483
     * @tc.desc    Market push entry with probe title 483 probe 483
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering483', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(0);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit483')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0484
     * @tc.name    MarketUIComponentRendering484
     * @tc.desc    Market reload notify count 484 probe 484
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering484', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit484')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0485
     * @tc.name    MarketUIComponentRendering485
     * @tc.desc    Market push entry with probe title 485 probe 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering485', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(2);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit485')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0486
     * @tc.name    MarketUIComponentRendering486
     * @tc.desc    Market reload notify count 486 probe 486
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering486', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit486')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0487
     * @tc.name    MarketUIComponentRendering487
     * @tc.desc    Market push entry with probe title 487 probe 487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering487', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(4);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit487')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0488
     * @tc.name    MarketUIComponentRendering488
     * @tc.desc    Market reload notify count 488 probe 488
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering488', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit488')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0489
     * @tc.name    MarketUIComponentRendering489
     * @tc.desc    Market push entry with probe title 489 probe 489
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering489', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(6);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit489')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0490
     * @tc.name    MarketUIComponentRendering490
     * @tc.desc    Market reload notify count 490 probe 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering490', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit490')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0491
     * @tc.name    MarketUIComponentRendering491
     * @tc.desc    Market push entry with probe title 491 probe 491
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering491', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(8);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit491')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0492
     * @tc.name    MarketUIComponentRendering492
     * @tc.desc    Market reload notify count 492 probe 492
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering492', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit492')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0493
     * @tc.name    MarketUIComponentRendering493
     * @tc.desc    Market push entry with probe title 493 probe 493
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering493', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(10);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit493')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0494
     * @tc.name    MarketUIComponentRendering494
     * @tc.desc    Market reload notify count 494 probe 494
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering494', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit494')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0495
     * @tc.name    MarketUIComponentRendering495
     * @tc.desc    Market push entry with probe title 495 probe 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering495', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(12);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit495')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0496
     * @tc.name    MarketUIComponentRendering496
     * @tc.desc    Market reload notify count 496 probe 496
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering496', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit496')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0497
     * @tc.name    MarketUIComponentRendering497
     * @tc.desc    Market push entry with probe title 497 probe 497
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering497', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(14);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit497')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0498
     * @tc.name    MarketUIComponentRendering498
     * @tc.desc    Market reload notify count 498 probe 498
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering498', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit498')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0499
     * @tc.name    MarketUIComponentRendering499
     * @tc.desc    Market push entry with probe title 499 probe 499
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering499', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(16);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit499')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0500
     * @tc.name    MarketUIComponentRendering500
     * @tc.desc    Market reload notify count 500 probe 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering500', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit500')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0501
     * @tc.name    MarketUIComponentRendering501
     * @tc.desc    Market push entry with probe title 501 probe 501
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering501', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(18);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit501')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0502
     * @tc.name    MarketUIComponentRendering502
     * @tc.desc    Market reload notify count 502 probe 502
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering502', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit502')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0503
     * @tc.name    MarketUIComponentRendering503
     * @tc.desc    Market push entry with probe title 503 probe 503
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering503', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(20);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit503')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0504
     * @tc.name    MarketUIComponentRendering504
     * @tc.desc    Market reload notify count 504 probe 504
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering504', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit504')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0505
     * @tc.name    MarketUIComponentRendering505
     * @tc.desc    Market push entry with probe title 505 probe 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering505', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(1);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit505')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0506
     * @tc.name    MarketUIComponentRendering506
     * @tc.desc    Market reload notify count 506 probe 506
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering506', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit506')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0507
     * @tc.name    MarketUIComponentRendering507
     * @tc.desc    Market push entry with probe title 507 probe 507
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering507', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(3);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit507')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0508
     * @tc.name    MarketUIComponentRendering508
     * @tc.desc    Market reload notify count 508 probe 508
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering508', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit508')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0509
     * @tc.name    MarketUIComponentRendering509
     * @tc.desc    Market push entry with probe title 509 probe 509
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering509', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(5);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit509')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0510
     * @tc.name    MarketUIComponentRendering510
     * @tc.desc    Market reload notify count 510 probe 510
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering510', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit510')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0511
     * @tc.name    MarketUIComponentRendering511
     * @tc.desc    Market push entry with probe title 511 probe 511
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering511', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(7);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit511')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0512
     * @tc.name    MarketUIComponentRendering512
     * @tc.desc    Market reload notify count 512 probe 512
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering512', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit512')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0513
     * @tc.name    MarketUIComponentRendering513
     * @tc.desc    Market push entry with probe title 513 probe 513
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering513', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(9);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit513')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0514
     * @tc.name    MarketUIComponentRendering514
     * @tc.desc    Market reload notify count 514 probe 514
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering514', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit514')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0515
     * @tc.name    MarketUIComponentRendering515
     * @tc.desc    Market push entry with probe title 515 probe 515
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering515', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(11);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit515')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0516
     * @tc.name    MarketUIComponentRendering516
     * @tc.desc    Market reload notify count 516 probe 516
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering516', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit516')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0517
     * @tc.name    MarketUIComponentRendering517
     * @tc.desc    Market push entry with probe title 517 probe 517
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering517', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(13);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit517')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0518
     * @tc.name    MarketUIComponentRendering518
     * @tc.desc    Market reload notify count 518 probe 518
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering518', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit518')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0519
     * @tc.name    MarketUIComponentRendering519
     * @tc.desc    Market push entry with probe title 519 probe 519
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering519', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(15);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit519')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0520
     * @tc.name    MarketUIComponentRendering520
     * @tc.desc    Market reload notify count 520 probe 520
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering520', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit520')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0521
     * @tc.name    MarketUIComponentRendering521
     * @tc.desc    Market push entry with probe title 521 probe 521
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering521', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(17);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit521')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0522
     * @tc.name    MarketUIComponentRendering522
     * @tc.desc    Market reload notify count 522 probe 522
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering522', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit522')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0523
     * @tc.name    MarketUIComponentRendering523
     * @tc.desc    Market push entry with probe title 523 probe 523
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering523', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(19);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit523')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0524
     * @tc.name    MarketUIComponentRendering524
     * @tc.desc    Market reload notify count 524 probe 524
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering524', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit524')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0525
     * @tc.name    MarketUIComponentRendering525
     * @tc.desc    Market push entry with probe title 525 probe 525
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering525', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(0);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit525')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0526
     * @tc.name    MarketUIComponentRendering526
     * @tc.desc    Market reload notify count 526 probe 526
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering526', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit526')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0527
     * @tc.name    MarketUIComponentRendering527
     * @tc.desc    Market push entry with probe title 527 probe 527
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering527', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(2);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit527')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0528
     * @tc.name    MarketUIComponentRendering528
     * @tc.desc    Market reload notify count 528 probe 528
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering528', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit528')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0529
     * @tc.name    MarketUIComponentRendering529
     * @tc.desc    Market push entry with probe title 529 probe 529
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering529', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(4);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit529')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

