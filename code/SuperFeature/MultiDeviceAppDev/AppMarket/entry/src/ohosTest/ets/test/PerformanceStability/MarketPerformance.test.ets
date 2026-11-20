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

export default function marketPerformanceSuite() {
  describe('MarketPerformanceSuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0694
     * @tc.name    MarketPerformance694
     * @tc.desc    Market repeated slicing 694 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit694')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0695
     * @tc.name    MarketPerformance695
     * @tc.desc    Market repeated slicing 695 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit695')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0696
     * @tc.name    MarketPerformance696
     * @tc.desc    Market repeated slicing 696 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit696')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0697
     * @tc.name    MarketPerformance697
     * @tc.desc    Market repeated slicing 697 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit697')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0698
     * @tc.name    MarketPerformance698
     * @tc.desc    Market repeated slicing 698 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit698')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0699
     * @tc.name    MarketPerformance699
     * @tc.desc    Market repeated slicing 699 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit699')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0700
     * @tc.name    MarketPerformance700
     * @tc.desc    Market repeated slicing 700 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit700')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0701
     * @tc.name    MarketPerformance701
     * @tc.desc    Market repeated slicing 701 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit701')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0702
     * @tc.name    MarketPerformance702
     * @tc.desc    Market repeated slicing 702 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit702')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0703
     * @tc.name    MarketPerformance703
     * @tc.desc    Market repeated slicing 703 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit703')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0704
     * @tc.name    MarketPerformance704
     * @tc.desc    Market repeated slicing 704 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit704')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0705
     * @tc.name    MarketPerformance705
     * @tc.desc    Market repeated slicing 705 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit705')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0706
     * @tc.name    MarketPerformance706
     * @tc.desc    Market repeated slicing 706 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit706')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0707
     * @tc.name    MarketPerformance707
     * @tc.desc    Market repeated slicing 707 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit707')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0708
     * @tc.name    MarketPerformance708
     * @tc.desc    Market repeated slicing 708 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit708')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0709
     * @tc.name    MarketPerformance709
     * @tc.desc    Market repeated slicing 709 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit709')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0710
     * @tc.name    MarketPerformance710
     * @tc.desc    Market repeated slicing 710 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit710')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0711
     * @tc.name    MarketPerformance711
     * @tc.desc    Market repeated slicing 711 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit711')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0712
     * @tc.name    MarketPerformance712
     * @tc.desc    Market repeated slicing 712 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit712')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0713
     * @tc.name    MarketPerformance713
     * @tc.desc    Market repeated slicing 713 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit713')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0714
     * @tc.name    MarketPerformance714
     * @tc.desc    Market repeated slicing 714 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit714')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0715
     * @tc.name    MarketPerformance715
     * @tc.desc    Market repeated slicing 715 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit715')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0716
     * @tc.name    MarketPerformance716
     * @tc.desc    Market repeated slicing 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit716')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0717
     * @tc.name    MarketPerformance717
     * @tc.desc    Market repeated slicing 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit717')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0718
     * @tc.name    MarketPerformance718
     * @tc.desc    Market repeated slicing 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit718')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0719
     * @tc.name    MarketPerformance719
     * @tc.desc    Market repeated slicing 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit719')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0720
     * @tc.name    MarketPerformance720
     * @tc.desc    Market repeated slicing 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit720')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0721
     * @tc.name    MarketPerformance721
     * @tc.desc    Market repeated slicing 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit721')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0722
     * @tc.name    MarketPerformance722
     * @tc.desc    Market repeated slicing 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit722')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0723
     * @tc.name    MarketPerformance723
     * @tc.desc    Market repeated slicing 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit723')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0724
     * @tc.name    MarketPerformance724
     * @tc.desc    Market repeated slicing 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit724')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0725
     * @tc.name    MarketPerformance725
     * @tc.desc    Market repeated slicing 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit725')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0726
     * @tc.name    MarketPerformance726
     * @tc.desc    Market repeated slicing 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit726')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0727
     * @tc.name    MarketPerformance727
     * @tc.desc    Market repeated slicing 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit727')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0728
     * @tc.name    MarketPerformance728
     * @tc.desc    Market repeated slicing 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit728')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0729
     * @tc.name    MarketPerformance729
     * @tc.desc    Market repeated slicing 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit729')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0730
     * @tc.name    MarketPerformance730
     * @tc.desc    Market repeated slicing 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit730')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0731
     * @tc.name    MarketPerformance731
     * @tc.desc    Market repeated slicing 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit731')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0732
     * @tc.name    MarketPerformance732
     * @tc.desc    Market repeated slicing 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit732')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0733
     * @tc.name    MarketPerformance733
     * @tc.desc    Market repeated slicing 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit733')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0734
     * @tc.name    MarketPerformance734
     * @tc.desc    Market repeated slicing 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit734')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0735
     * @tc.name    MarketPerformance735
     * @tc.desc    Market repeated slicing 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit735')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0736
     * @tc.name    MarketPerformance736
     * @tc.desc    Market repeated slicing 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit736')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0737
     * @tc.name    MarketPerformance737
     * @tc.desc    Market repeated slicing 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit737')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0738
     * @tc.name    MarketPerformance738
     * @tc.desc    Market repeated slicing 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit738')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0739
     * @tc.name    MarketPerformance739
     * @tc.desc    Market repeated slicing 739 probe 739
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance739', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit739')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0740
     * @tc.name    MarketPerformance740
     * @tc.desc    Market repeated slicing 740 probe 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance740', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit740')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0741
     * @tc.name    MarketPerformance741
     * @tc.desc    Market repeated slicing 741 probe 741
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance741', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit741')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0742
     * @tc.name    MarketPerformance742
     * @tc.desc    Market repeated slicing 742 probe 742
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance742', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit742')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0743
     * @tc.name    MarketPerformance743
     * @tc.desc    Market repeated slicing 743 probe 743
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance743', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit743')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0744
     * @tc.name    MarketPerformance744
     * @tc.desc    Market repeated slicing 744 probe 744
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance744', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit744')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0745
     * @tc.name    MarketPerformance745
     * @tc.desc    Market repeated slicing 745 probe 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance745', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit745')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0746
     * @tc.name    MarketPerformance746
     * @tc.desc    Market repeated slicing 746 probe 746
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance746', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit746')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0747
     * @tc.name    MarketPerformance747
     * @tc.desc    Market repeated slicing 747 probe 747
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance747', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit747')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0748
     * @tc.name    MarketPerformance748
     * @tc.desc    Market repeated slicing 748 probe 748
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance748', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit748')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0749
     * @tc.name    MarketPerformance749
     * @tc.desc    Market repeated slicing 749 probe 749
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance749', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit749')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0750
     * @tc.name    MarketPerformance750
     * @tc.desc    Market repeated slicing 750 probe 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance750', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit750')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0751
     * @tc.name    MarketPerformance751
     * @tc.desc    Market repeated slicing 751 probe 751
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance751', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit751')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0752
     * @tc.name    MarketPerformance752
     * @tc.desc    Market repeated slicing 752 probe 752
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance752', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit752')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0753
     * @tc.name    MarketPerformance753
     * @tc.desc    Market repeated slicing 753 probe 753
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance753', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit753')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0754
     * @tc.name    MarketPerformance754
     * @tc.desc    Market repeated slicing 754 probe 754
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance754', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit754')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0755
     * @tc.name    MarketPerformance755
     * @tc.desc    Market repeated slicing 755 probe 755
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance755', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit755')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0756
     * @tc.name    MarketPerformance756
     * @tc.desc    Market repeated slicing 756 probe 756
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance756', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit756')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0757
     * @tc.name    MarketPerformance757
     * @tc.desc    Market repeated slicing 757 probe 757
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance757', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit757')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0758
     * @tc.name    MarketPerformance758
     * @tc.desc    Market repeated slicing 758 probe 758
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance758', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit758')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0759
     * @tc.name    MarketPerformance759
     * @tc.desc    Market repeated slicing 759 probe 759
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance759', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit759')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0760
     * @tc.name    MarketPerformance760
     * @tc.desc    Market repeated slicing 760 probe 760
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance760', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit760')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0761
     * @tc.name    MarketPerformance761
     * @tc.desc    Market repeated slicing 761 probe 761
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance761', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit761')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0762
     * @tc.name    MarketPerformance762
     * @tc.desc    Market repeated slicing 762 probe 762
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance762', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit762')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0763
     * @tc.name    MarketPerformance763
     * @tc.desc    Market repeated slicing 763 probe 763
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance763', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit763')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0764
     * @tc.name    MarketPerformance764
     * @tc.desc    Market repeated slicing 764 probe 764
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance764', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit764')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0765
     * @tc.name    MarketPerformance765
     * @tc.desc    Market repeated slicing 765 probe 765
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance765', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit765')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0766
     * @tc.name    MarketPerformance766
     * @tc.desc    Market repeated slicing 766 probe 766
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance766', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit766')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0767
     * @tc.name    MarketPerformance767
     * @tc.desc    Market repeated slicing 767 probe 767
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance767', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit767')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0768
     * @tc.name    MarketPerformance768
     * @tc.desc    Market repeated slicing 768 probe 768
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance768', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit768')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0769
     * @tc.name    MarketPerformance769
     * @tc.desc    Market repeated slicing 769 probe 769
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance769', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit769')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0770
     * @tc.name    MarketPerformance770
     * @tc.desc    Market repeated slicing 770 probe 770
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance770', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit770')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0771
     * @tc.name    MarketPerformance771
     * @tc.desc    Market repeated slicing 771 probe 771
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance771', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit771')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0772
     * @tc.name    MarketPerformance772
     * @tc.desc    Market repeated slicing 772 probe 772
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance772', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit772')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0773
     * @tc.name    MarketPerformance773
     * @tc.desc    Market repeated slicing 773 probe 773
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance773', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit773')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0774
     * @tc.name    MarketPerformance774
     * @tc.desc    Market repeated slicing 774 probe 774
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance774', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit774')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0775
     * @tc.name    MarketPerformance775
     * @tc.desc    Market repeated slicing 775 probe 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance775', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit775')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0776
     * @tc.name    MarketPerformance776
     * @tc.desc    Market repeated slicing 776 probe 776
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance776', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit776')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0777
     * @tc.name    MarketPerformance777
     * @tc.desc    Market repeated slicing 777 probe 777
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance777', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit777')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0778
     * @tc.name    MarketPerformance778
     * @tc.desc    Market repeated slicing 778 probe 778
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance778', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit778')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

