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

export default function marketSessionManagementSuite() {
  describe('MarketSessionManagementSuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0100
     * @tc.name    MarketSessionManagement001
     * @tc.desc    Market fresh model count 611 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(2)?.id).assertEqual(String(2));
      expect(m.searchTitle('nohit611')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0200
     * @tc.name    MarketSessionManagement002
     * @tc.desc    Market fresh model count 612 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(3)?.id).assertEqual(String(3));
      expect(m.searchTitle('nohit612')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0300
     * @tc.name    MarketSessionManagement003
     * @tc.desc    Market fresh model count 613 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(4)?.id).assertEqual(String(4));
      expect(m.searchTitle('nohit613')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0400
     * @tc.name    MarketSessionManagement004
     * @tc.desc    Market fresh model count 614 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(5)?.id).assertEqual(String(5));
      expect(m.searchTitle('nohit614')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0500
     * @tc.name    MarketSessionManagement005
     * @tc.desc    Market fresh model count 615 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(6)?.id).assertEqual(String(6));
      expect(m.searchTitle('nohit615')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0600
     * @tc.name    MarketSessionManagement006
     * @tc.desc    Market fresh model count 616 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(7)?.id).assertEqual(String(7));
      expect(m.searchTitle('nohit616')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0700
     * @tc.name    MarketSessionManagement007
     * @tc.desc    Market fresh model count 617 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(8)?.id).assertEqual(String(8));
      expect(m.searchTitle('nohit617')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0800
     * @tc.name    MarketSessionManagement008
     * @tc.desc    Market fresh model count 618 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(9)?.id).assertEqual(String(9));
      expect(m.searchTitle('nohit618')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0900
     * @tc.name    MarketSessionManagement009
     * @tc.desc    Market fresh model count 619 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(10)?.id).assertEqual(String(10));
      expect(m.searchTitle('nohit619')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1000
     * @tc.name    MarketSessionManagement010
     * @tc.desc    Market fresh model count 620 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(11)?.id).assertEqual(String(11));
      expect(m.searchTitle('nohit620')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1100
     * @tc.name    MarketSessionManagement011
     * @tc.desc    Market fresh model count 621 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(12)?.id).assertEqual(String(12));
      expect(m.searchTitle('nohit621')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1200
     * @tc.name    MarketSessionManagement012
     * @tc.desc    Market fresh model count 622 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(13)?.id).assertEqual(String(13));
      expect(m.searchTitle('nohit622')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1300
     * @tc.name    MarketSessionManagement013
     * @tc.desc    Market fresh model count 623 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(14)?.id).assertEqual(String(14));
      expect(m.searchTitle('nohit623')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1400
     * @tc.name    MarketSessionManagement014
     * @tc.desc    Market fresh model count 624 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(15)?.id).assertEqual(String(15));
      expect(m.searchTitle('nohit624')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1500
     * @tc.name    MarketSessionManagement015
     * @tc.desc    Market fresh model count 625 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(16)?.id).assertEqual(String(16));
      expect(m.searchTitle('nohit625')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1600
     * @tc.name    MarketSessionManagement016
     * @tc.desc    Market fresh model count 626 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(17)?.id).assertEqual(String(17));
      expect(m.searchTitle('nohit626')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1700
     * @tc.name    MarketSessionManagement017
     * @tc.desc    Market fresh model count 627 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(18)?.id).assertEqual(String(18));
      expect(m.searchTitle('nohit627')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1800
     * @tc.name    MarketSessionManagement018
     * @tc.desc    Market fresh model count 628 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(19)?.id).assertEqual(String(19));
      expect(m.searchTitle('nohit628')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1900
     * @tc.name    MarketSessionManagement019
     * @tc.desc    Market fresh model count 629 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(20)?.id).assertEqual(String(20));
      expect(m.searchTitle('nohit629')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2000
     * @tc.name    MarketSessionManagement020
     * @tc.desc    Market fresh model count 630 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(0)?.id).assertEqual(String(0));
      expect(m.searchTitle('nohit630')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2100
     * @tc.name    MarketSessionManagement021
     * @tc.desc    Market fresh model count 631 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(1)?.id).assertEqual(String(1));
      expect(m.searchTitle('nohit631')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2200
     * @tc.name    MarketSessionManagement022
     * @tc.desc    Market fresh model count 632 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(2)?.id).assertEqual(String(2));
      expect(m.searchTitle('nohit632')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2300
     * @tc.name    MarketSessionManagement023
     * @tc.desc    Market fresh model count 633 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(3)?.id).assertEqual(String(3));
      expect(m.searchTitle('nohit633')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2400
     * @tc.name    MarketSessionManagement024
     * @tc.desc    Market fresh model count 634 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(4)?.id).assertEqual(String(4));
      expect(m.searchTitle('nohit634')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2500
     * @tc.name    MarketSessionManagement025
     * @tc.desc    Market fresh model count 635 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(5)?.id).assertEqual(String(5));
      expect(m.searchTitle('nohit635')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2600
     * @tc.name    MarketSessionManagement026
     * @tc.desc    Market fresh model count 636 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(6)?.id).assertEqual(String(6));
      expect(m.searchTitle('nohit636')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2700
     * @tc.name    MarketSessionManagement027
     * @tc.desc    Market fresh model count 637 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(7)?.id).assertEqual(String(7));
      expect(m.searchTitle('nohit637')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2800
     * @tc.name    MarketSessionManagement028
     * @tc.desc    Market fresh model count 638 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(8)?.id).assertEqual(String(8));
      expect(m.searchTitle('nohit638')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_2900
     * @tc.name    MarketSessionManagement029
     * @tc.desc    Market fresh model count 639 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(9)?.id).assertEqual(String(9));
      expect(m.searchTitle('nohit639')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3000
     * @tc.name    MarketSessionManagement030
     * @tc.desc    Market fresh model count 640 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(10)?.id).assertEqual(String(10));
      expect(m.searchTitle('nohit640')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3100
     * @tc.name    MarketSessionManagement031
     * @tc.desc    Market fresh model count 641 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(11)?.id).assertEqual(String(11));
      expect(m.searchTitle('nohit641')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3200
     * @tc.name    MarketSessionManagement032
     * @tc.desc    Market fresh model count 642 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(12)?.id).assertEqual(String(12));
      expect(m.searchTitle('nohit642')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3300
     * @tc.name    MarketSessionManagement033
     * @tc.desc    Market fresh model count 643 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(13)?.id).assertEqual(String(13));
      expect(m.searchTitle('nohit643')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3400
     * @tc.name    MarketSessionManagement034
     * @tc.desc    Market fresh model count 644 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(14)?.id).assertEqual(String(14));
      expect(m.searchTitle('nohit644')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3500
     * @tc.name    MarketSessionManagement035
     * @tc.desc    Market fresh model count 645 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(15)?.id).assertEqual(String(15));
      expect(m.searchTitle('nohit645')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3600
     * @tc.name    MarketSessionManagement036
     * @tc.desc    Market fresh model count 646 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(16)?.id).assertEqual(String(16));
      expect(m.searchTitle('nohit646')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3700
     * @tc.name    MarketSessionManagement037
     * @tc.desc    Market fresh model count 647 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(17)?.id).assertEqual(String(17));
      expect(m.searchTitle('nohit647')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3800
     * @tc.name    MarketSessionManagement038
     * @tc.desc    Market fresh model count 648 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(18)?.id).assertEqual(String(18));
      expect(m.searchTitle('nohit648')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_3900
     * @tc.name    MarketSessionManagement039
     * @tc.desc    Market fresh model count 649 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(19)?.id).assertEqual(String(19));
      expect(m.searchTitle('nohit649')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4000
     * @tc.name    MarketSessionManagement040
     * @tc.desc    Market fresh model count 650 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(20)?.id).assertEqual(String(20));
      expect(m.searchTitle('nohit650')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4100
     * @tc.name    MarketSessionManagement041
     * @tc.desc    Market fresh model count 651 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(0)?.id).assertEqual(String(0));
      expect(m.searchTitle('nohit651')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4200
     * @tc.name    MarketSessionManagement042
     * @tc.desc    Market fresh model count 652 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(1)?.id).assertEqual(String(1));
      expect(m.searchTitle('nohit652')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4300
     * @tc.name    MarketSessionManagement043
     * @tc.desc    Market fresh model count 653 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(2)?.id).assertEqual(String(2));
      expect(m.searchTitle('nohit653')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4400
     * @tc.name    MarketSessionManagement044
     * @tc.desc    Market fresh model count 654 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(3)?.id).assertEqual(String(3));
      expect(m.searchTitle('nohit654')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4500
     * @tc.name    MarketSessionManagement045
     * @tc.desc    Market fresh model count 655 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(4)?.id).assertEqual(String(4));
      expect(m.searchTitle('nohit655')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4600
     * @tc.name    MarketSessionManagement046
     * @tc.desc    Market fresh model count 656 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(5)?.id).assertEqual(String(5));
      expect(m.searchTitle('nohit656')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4700
     * @tc.name    MarketSessionManagement047
     * @tc.desc    Market fresh model count 657 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(6)?.id).assertEqual(String(6));
      expect(m.searchTitle('nohit657')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4800
     * @tc.name    MarketSessionManagement048
     * @tc.desc    Market fresh model count 658 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(7)?.id).assertEqual(String(7));
      expect(m.searchTitle('nohit658')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_4900
     * @tc.name    MarketSessionManagement049
     * @tc.desc    Market fresh model count 659 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(8)?.id).assertEqual(String(8));
      expect(m.searchTitle('nohit659')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5000
     * @tc.name    MarketSessionManagement050
     * @tc.desc    Market fresh model count 660 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(9)?.id).assertEqual(String(9));
      expect(m.searchTitle('nohit660')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5100
     * @tc.name    MarketSessionManagement051
     * @tc.desc    Market fresh model count 661 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(10)?.id).assertEqual(String(10));
      expect(m.searchTitle('nohit661')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5200
     * @tc.name    MarketSessionManagement052
     * @tc.desc    Market fresh model count 662 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(11)?.id).assertEqual(String(11));
      expect(m.searchTitle('nohit662')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5300
     * @tc.name    MarketSessionManagement053
     * @tc.desc    Market fresh model count 663 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(12)?.id).assertEqual(String(12));
      expect(m.searchTitle('nohit663')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5400
     * @tc.name    MarketSessionManagement054
     * @tc.desc    Market fresh model count 664 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(13)?.id).assertEqual(String(13));
      expect(m.searchTitle('nohit664')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5500
     * @tc.name    MarketSessionManagement055
     * @tc.desc    Market fresh model count 665 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(14)?.id).assertEqual(String(14));
      expect(m.searchTitle('nohit665')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5600
     * @tc.name    MarketSessionManagement056
     * @tc.desc    Market fresh model count 666 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(15)?.id).assertEqual(String(15));
      expect(m.searchTitle('nohit666')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5700
     * @tc.name    MarketSessionManagement057
     * @tc.desc    Market fresh model count 667 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(16)?.id).assertEqual(String(16));
      expect(m.searchTitle('nohit667')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5800
     * @tc.name    MarketSessionManagement058
     * @tc.desc    Market fresh model count 668 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(17)?.id).assertEqual(String(17));
      expect(m.searchTitle('nohit668')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_5900
     * @tc.name    MarketSessionManagement059
     * @tc.desc    Market fresh model count 669 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(18)?.id).assertEqual(String(18));
      expect(m.searchTitle('nohit669')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6000
     * @tc.name    MarketSessionManagement060
     * @tc.desc    Market fresh model count 670 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(19)?.id).assertEqual(String(19));
      expect(m.searchTitle('nohit670')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6100
     * @tc.name    MarketSessionManagement061
     * @tc.desc    Market fresh model count 671 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(20)?.id).assertEqual(String(20));
      expect(m.searchTitle('nohit671')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6200
     * @tc.name    MarketSessionManagement062
     * @tc.desc    Market fresh model count 672 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(0)?.id).assertEqual(String(0));
      expect(m.searchTitle('nohit672')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6300
     * @tc.name    MarketSessionManagement063
     * @tc.desc    Market fresh model count 673 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(1)?.id).assertEqual(String(1));
      expect(m.searchTitle('nohit673')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6400
     * @tc.name    MarketSessionManagement064
     * @tc.desc    Market fresh model count 674 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(2)?.id).assertEqual(String(2));
      expect(m.searchTitle('nohit674')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6500
     * @tc.name    MarketSessionManagement065
     * @tc.desc    Market fresh model count 675 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(3)?.id).assertEqual(String(3));
      expect(m.searchTitle('nohit675')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6600
     * @tc.name    MarketSessionManagement066
     * @tc.desc    Market fresh model count 676 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(4)?.id).assertEqual(String(4));
      expect(m.searchTitle('nohit676')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6700
     * @tc.name    MarketSessionManagement067
     * @tc.desc    Market fresh model count 677 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(5)?.id).assertEqual(String(5));
      expect(m.searchTitle('nohit677')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6800
     * @tc.name    MarketSessionManagement068
     * @tc.desc    Market fresh model count 678 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(6)?.id).assertEqual(String(6));
      expect(m.searchTitle('nohit678')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_6900
     * @tc.name    MarketSessionManagement069
     * @tc.desc    Market fresh model count 679 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(7)?.id).assertEqual(String(7));
      expect(m.searchTitle('nohit679')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7000
     * @tc.name    MarketSessionManagement070
     * @tc.desc    Market fresh model count 680 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(8)?.id).assertEqual(String(8));
      expect(m.searchTitle('nohit680')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7100
     * @tc.name    MarketSessionManagement071
     * @tc.desc    Market fresh model count 681 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(9)?.id).assertEqual(String(9));
      expect(m.searchTitle('nohit681')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7200
     * @tc.name    MarketSessionManagement072
     * @tc.desc    Market fresh model count 682 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(10)?.id).assertEqual(String(10));
      expect(m.searchTitle('nohit682')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7300
     * @tc.name    MarketSessionManagement073
     * @tc.desc    Market fresh model count 683 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(11)?.id).assertEqual(String(11));
      expect(m.searchTitle('nohit683')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7400
     * @tc.name    MarketSessionManagement074
     * @tc.desc    Market fresh model count 684 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(12)?.id).assertEqual(String(12));
      expect(m.searchTitle('nohit684')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7500
     * @tc.name    MarketSessionManagement075
     * @tc.desc    Market fresh model count 685 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(13)?.id).assertEqual(String(13));
      expect(m.searchTitle('nohit685')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7600
     * @tc.name    MarketSessionManagement076
     * @tc.desc    Market fresh model count 686 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(14)?.id).assertEqual(String(14));
      expect(m.searchTitle('nohit686')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7700
     * @tc.name    MarketSessionManagement077
     * @tc.desc    Market fresh model count 687 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(15)?.id).assertEqual(String(15));
      expect(m.searchTitle('nohit687')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7800
     * @tc.name    MarketSessionManagement078
     * @tc.desc    Market fresh model count 688 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(16)?.id).assertEqual(String(16));
      expect(m.searchTitle('nohit688')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_7900
     * @tc.name    MarketSessionManagement079
     * @tc.desc    Market fresh model count 689 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(17)?.id).assertEqual(String(17));
      expect(m.searchTitle('nohit689')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8000
     * @tc.name    MarketSessionManagement080
     * @tc.desc    Market fresh model count 690 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(18)?.id).assertEqual(String(18));
      expect(m.searchTitle('nohit690')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8100
     * @tc.name    MarketSessionManagement081
     * @tc.desc    Market fresh model count 691 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(19)?.id).assertEqual(String(19));
      expect(m.searchTitle('nohit691')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8200
     * @tc.name    MarketSessionManagement082
     * @tc.desc    Market fresh model count 692 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(20)?.id).assertEqual(String(20));
      expect(m.searchTitle('nohit692')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_8300
     * @tc.name    MarketSessionManagement083
     * @tc.desc    Market fresh model count 693 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketSessionManagement083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: MarketModel = new MarketModel();
      expect(local.totalCount()).assertEqual(m.totalCount());
      local.notifyDataReload();
      expect(local.getReloadNotifyCount()).assertEqual(1);
      expect(local.getData(0)?.id).assertEqual(String(0));
      expect(m.searchTitle('nohit693')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

