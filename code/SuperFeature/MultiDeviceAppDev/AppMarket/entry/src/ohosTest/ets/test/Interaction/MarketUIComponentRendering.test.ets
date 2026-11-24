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

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0530
     * @tc.name    MarketUIComponentRendering530
     * @tc.desc    Market reload notify count 530 probe 530
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering530', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit530')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0531
     * @tc.name    MarketUIComponentRendering531
     * @tc.desc    Market push entry with probe title 531 probe 531
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering531', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(6);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit531')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0532
     * @tc.name    MarketUIComponentRendering532
     * @tc.desc    Market reload notify count 532 probe 532
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering532', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit532')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0533
     * @tc.name    MarketUIComponentRendering533
     * @tc.desc    Market push entry with probe title 533 probe 533
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering533', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(8);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit533')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0534
     * @tc.name    MarketUIComponentRendering534
     * @tc.desc    Market reload notify count 534 probe 534
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering534', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit534')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0535
     * @tc.name    MarketUIComponentRendering535
     * @tc.desc    Market push entry with probe title 535 probe 535
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering535', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(10);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit535')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0536
     * @tc.name    MarketUIComponentRendering536
     * @tc.desc    Market reload notify count 536 probe 536
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering536', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit536')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0537
     * @tc.name    MarketUIComponentRendering537
     * @tc.desc    Market push entry with probe title 537 probe 537
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering537', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(12);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit537')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0538
     * @tc.name    MarketUIComponentRendering538
     * @tc.desc    Market reload notify count 538 probe 538
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering538', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit538')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0539
     * @tc.name    MarketUIComponentRendering539
     * @tc.desc    Market push entry with probe title 539 probe 539
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering539', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(14);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit539')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0540
     * @tc.name    MarketUIComponentRendering540
     * @tc.desc    Market reload notify count 540 probe 540
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering540', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit540')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0541
     * @tc.name    MarketUIComponentRendering541
     * @tc.desc    Market push entry with probe title 541 probe 541
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering541', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(16);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit541')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0542
     * @tc.name    MarketUIComponentRendering542
     * @tc.desc    Market reload notify count 542 probe 542
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering542', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit542')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0543
     * @tc.name    MarketUIComponentRendering543
     * @tc.desc    Market push entry with probe title 543 probe 543
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering543', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(18);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit543')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0544
     * @tc.name    MarketUIComponentRendering544
     * @tc.desc    Market reload notify count 544 probe 544
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering544', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit544')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0545
     * @tc.name    MarketUIComponentRendering545
     * @tc.desc    Market push entry with probe title 545 probe 545
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering545', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(20);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit545')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0546
     * @tc.name    MarketUIComponentRendering546
     * @tc.desc    Market reload notify count 546 probe 546
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering546', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit546')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0547
     * @tc.name    MarketUIComponentRendering547
     * @tc.desc    Market push entry with probe title 547 probe 547
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering547', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(1);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit547')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0548
     * @tc.name    MarketUIComponentRendering548
     * @tc.desc    Market reload notify count 548 probe 548
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering548', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit548')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0549
     * @tc.name    MarketUIComponentRendering549
     * @tc.desc    Market push entry with probe title 549 probe 549
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering549', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(3);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit549')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0550
     * @tc.name    MarketUIComponentRendering550
     * @tc.desc    Market reload notify count 550 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit550')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0551
     * @tc.name    MarketUIComponentRendering551
     * @tc.desc    Market push entry with probe title 551 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(5);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit551')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0552
     * @tc.name    MarketUIComponentRendering552
     * @tc.desc    Market reload notify count 552 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit552')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0553
     * @tc.name    MarketUIComponentRendering553
     * @tc.desc    Market push entry with probe title 553 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(7);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit553')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0554
     * @tc.name    MarketUIComponentRendering554
     * @tc.desc    Market reload notify count 554 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit554')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0555
     * @tc.name    MarketUIComponentRendering555
     * @tc.desc    Market push entry with probe title 555 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(9);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit555')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0556
     * @tc.name    MarketUIComponentRendering556
     * @tc.desc    Market reload notify count 556 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit556')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0557
     * @tc.name    MarketUIComponentRendering557
     * @tc.desc    Market push entry with probe title 557 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(11);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit557')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0558
     * @tc.name    MarketUIComponentRendering558
     * @tc.desc    Market reload notify count 558 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit558')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0559
     * @tc.name    MarketUIComponentRendering559
     * @tc.desc    Market push entry with probe title 559 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(13);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit559')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0560
     * @tc.name    MarketUIComponentRendering560
     * @tc.desc    Market reload notify count 560 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit560')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0561
     * @tc.name    MarketUIComponentRendering561
     * @tc.desc    Market push entry with probe title 561 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(15);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit561')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0562
     * @tc.name    MarketUIComponentRendering562
     * @tc.desc    Market reload notify count 562 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit562')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0563
     * @tc.name    MarketUIComponentRendering563
     * @tc.desc    Market push entry with probe title 563 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(17);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit563')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0564
     * @tc.name    MarketUIComponentRendering564
     * @tc.desc    Market reload notify count 564 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit564')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0565
     * @tc.name    MarketUIComponentRendering565
     * @tc.desc    Market push entry with probe title 565 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(19);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit565')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0566
     * @tc.name    MarketUIComponentRendering566
     * @tc.desc    Market reload notify count 566 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit566')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0567
     * @tc.name    MarketUIComponentRendering567
     * @tc.desc    Market push entry with probe title 567 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(0);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit567')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0568
     * @tc.name    MarketUIComponentRendering568
     * @tc.desc    Market reload notify count 568 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit568')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0569
     * @tc.name    MarketUIComponentRendering569
     * @tc.desc    Market push entry with probe title 569 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(2);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit569')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0570
     * @tc.name    MarketUIComponentRendering570
     * @tc.desc    Market reload notify count 570 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit570')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0571
     * @tc.name    MarketUIComponentRendering571
     * @tc.desc    Market push entry with probe title 571 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(4);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit571')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0572
     * @tc.name    MarketUIComponentRendering572
     * @tc.desc    Market reload notify count 572 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit572')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0573
     * @tc.name    MarketUIComponentRendering573
     * @tc.desc    Market push entry with probe title 573 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(6);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit573')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0574
     * @tc.name    MarketUIComponentRendering574
     * @tc.desc    Market reload notify count 574 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit574')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0575
     * @tc.name    MarketUIComponentRendering575
     * @tc.desc    Market push entry with probe title 575 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(8);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit575')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0576
     * @tc.name    MarketUIComponentRendering576
     * @tc.desc    Market reload notify count 576 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit576')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0577
     * @tc.name    MarketUIComponentRendering577
     * @tc.desc    Market push entry with probe title 577 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(10);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit577')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0578
     * @tc.name    MarketUIComponentRendering578
     * @tc.desc    Market reload notify count 578 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit578')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0579
     * @tc.name    MarketUIComponentRendering579
     * @tc.desc    Market push entry with probe title 579 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(12);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit579')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0580
     * @tc.name    MarketUIComponentRendering580
     * @tc.desc    Market reload notify count 580 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit580')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0581
     * @tc.name    MarketUIComponentRendering581
     * @tc.desc    Market push entry with probe title 581 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(14);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit581')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0582
     * @tc.name    MarketUIComponentRendering582
     * @tc.desc    Market reload notify count 582 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit582')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0583
     * @tc.name    MarketUIComponentRendering583
     * @tc.desc    Market push entry with probe title 583 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(16);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit583')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0584
     * @tc.name    MarketUIComponentRendering584
     * @tc.desc    Market reload notify count 584 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit584')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0585
     * @tc.name    MarketUIComponentRendering585
     * @tc.desc    Market push entry with probe title 585 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(18);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit585')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0586
     * @tc.name    MarketUIComponentRendering586
     * @tc.desc    Market reload notify count 586 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit586')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0587
     * @tc.name    MarketUIComponentRendering587
     * @tc.desc    Market push entry with probe title 587 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(20);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit587')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0588
     * @tc.name    MarketUIComponentRendering588
     * @tc.desc    Market reload notify count 588 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit588')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0589
     * @tc.name    MarketUIComponentRendering589
     * @tc.desc    Market push entry with probe title 589 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(1);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit589')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0590
     * @tc.name    MarketUIComponentRendering590
     * @tc.desc    Market reload notify count 590 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit590')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0591
     * @tc.name    MarketUIComponentRendering591
     * @tc.desc    Market push entry with probe title 591 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(3);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit591')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0592
     * @tc.name    MarketUIComponentRendering592
     * @tc.desc    Market reload notify count 592 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit592')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0593
     * @tc.name    MarketUIComponentRendering593
     * @tc.desc    Market push entry with probe title 593 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(5);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit593')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0594
     * @tc.name    MarketUIComponentRendering594
     * @tc.desc    Market reload notify count 594 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit594')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0595
     * @tc.name    MarketUIComponentRendering595
     * @tc.desc    Market push entry with probe title 595 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(7);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit595')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0596
     * @tc.name    MarketUIComponentRendering596
     * @tc.desc    Market reload notify count 596 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit596')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0597
     * @tc.name    MarketUIComponentRendering597
     * @tc.desc    Market push entry with probe title 597 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(9);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit597')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0598
     * @tc.name    MarketUIComponentRendering598
     * @tc.desc    Market reload notify count 598 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit598')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0599
     * @tc.name    MarketUIComponentRendering599
     * @tc.desc    Market push entry with probe title 599 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(11);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit599')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0600
     * @tc.name    MarketUIComponentRendering600
     * @tc.desc    Market reload notify count 600 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit600')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0601
     * @tc.name    MarketUIComponentRendering601
     * @tc.desc    Market push entry with probe title 601 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(13);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit601')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0602
     * @tc.name    MarketUIComponentRendering602
     * @tc.desc    Market reload notify count 602 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit602')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0603
     * @tc.name    MarketUIComponentRendering603
     * @tc.desc    Market push entry with probe title 603 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(15);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit603')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0604
     * @tc.name    MarketUIComponentRendering604
     * @tc.desc    Market reload notify count 604 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit604')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0605
     * @tc.name    MarketUIComponentRendering605
     * @tc.desc    Market push entry with probe title 605 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(17);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit605')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0606
     * @tc.name    MarketUIComponentRendering606
     * @tc.desc    Market reload notify count 606 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit606')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0607
     * @tc.name    MarketUIComponentRendering607
     * @tc.desc    Market push entry with probe title 607 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(19);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit607')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0608
     * @tc.name    MarketUIComponentRendering608
     * @tc.desc    Market reload notify count 608 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit608')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0609
     * @tc.name    MarketUIComponentRendering609
     * @tc.desc    Market push entry with probe title 609 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.totalCount();
      const seedItem = m.getData(0);
      expect(seedItem !== undefined).assertEqual(true);
      if (seedItem !== undefined) { m.pushData(seedItem); }
      expect(m.totalCount()).assertEqual(before + 1);
      expect(m.getAddNotifyCount()).assertLarger(0);
      expect(m.searchTitle('nohit609')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0610
     * @tc.name    MarketUIComponentRendering610
     * @tc.desc    Market reload notify count 610 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketUIComponentRendering610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getReloadNotifyCount();
      m.notifyDataReload();
      expect(m.getReloadNotifyCount()).assertEqual(before + 1);
      expect(m.searchTitle('nohit610')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

