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

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0779
     * @tc.name    MarketPerformance779
     * @tc.desc    Market repeated slicing 779 probe 779
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance779', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit779')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0780
     * @tc.name    MarketPerformance780
     * @tc.desc    Market repeated slicing 780 probe 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance780', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit780')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0781
     * @tc.name    MarketPerformance781
     * @tc.desc    Market repeated slicing 781 probe 781
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance781', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit781')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0782
     * @tc.name    MarketPerformance782
     * @tc.desc    Market repeated slicing 782 probe 782
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance782', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit782')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0783
     * @tc.name    MarketPerformance783
     * @tc.desc    Market repeated slicing 783 probe 783
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance783', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit783')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0784
     * @tc.name    MarketPerformance784
     * @tc.desc    Market repeated slicing 784 probe 784
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance784', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit784')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0785
     * @tc.name    MarketPerformance785
     * @tc.desc    Market repeated slicing 785 probe 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance785', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit785')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0786
     * @tc.name    MarketPerformance786
     * @tc.desc    Market repeated slicing 786 probe 786
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance786', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit786')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0787
     * @tc.name    MarketPerformance787
     * @tc.desc    Market repeated slicing 787 probe 787
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance787', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit787')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0788
     * @tc.name    MarketPerformance788
     * @tc.desc    Market repeated slicing 788 probe 788
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance788', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit788')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0789
     * @tc.name    MarketPerformance789
     * @tc.desc    Market repeated slicing 789 probe 789
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance789', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit789')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0790
     * @tc.name    MarketPerformance790
     * @tc.desc    Market repeated slicing 790 probe 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance790', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit790')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0791
     * @tc.name    MarketPerformance791
     * @tc.desc    Market repeated slicing 791 probe 791
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance791', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit791')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0792
     * @tc.name    MarketPerformance792
     * @tc.desc    Market repeated slicing 792 probe 792
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance792', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit792')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0793
     * @tc.name    MarketPerformance793
     * @tc.desc    Market repeated slicing 793 probe 793
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance793', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit793')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0794
     * @tc.name    MarketPerformance794
     * @tc.desc    Market repeated slicing 794 probe 794
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance794', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit794')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0795
     * @tc.name    MarketPerformance795
     * @tc.desc    Market repeated slicing 795 probe 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance795', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit795')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0796
     * @tc.name    MarketPerformance796
     * @tc.desc    Market repeated slicing 796 probe 796
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance796', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit796')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0797
     * @tc.name    MarketPerformance797
     * @tc.desc    Market repeated slicing 797 probe 797
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance797', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit797')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0798
     * @tc.name    MarketPerformance798
     * @tc.desc    Market repeated slicing 798 probe 798
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance798', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit798')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0799
     * @tc.name    MarketPerformance799
     * @tc.desc    Market repeated slicing 799 probe 799
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance799', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit799')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0800
     * @tc.name    MarketPerformance800
     * @tc.desc    Market repeated slicing 800 probe 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance800', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit800')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0801
     * @tc.name    MarketPerformance801
     * @tc.desc    Market repeated slicing 801 probe 801
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance801', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit801')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0802
     * @tc.name    MarketPerformance802
     * @tc.desc    Market repeated slicing 802 probe 802
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance802', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit802')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0803
     * @tc.name    MarketPerformance803
     * @tc.desc    Market repeated slicing 803 probe 803
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance803', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit803')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0804
     * @tc.name    MarketPerformance804
     * @tc.desc    Market repeated slicing 804 probe 804
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance804', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit804')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0805
     * @tc.name    MarketPerformance805
     * @tc.desc    Market repeated slicing 805 probe 805
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance805', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit805')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0806
     * @tc.name    MarketPerformance806
     * @tc.desc    Market repeated slicing 806 probe 806
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance806', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit806')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0807
     * @tc.name    MarketPerformance807
     * @tc.desc    Market repeated slicing 807 probe 807
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance807', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit807')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0808
     * @tc.name    MarketPerformance808
     * @tc.desc    Market repeated slicing 808 probe 808
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance808', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit808')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0809
     * @tc.name    MarketPerformance809
     * @tc.desc    Market repeated slicing 809 probe 809
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance809', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit809')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0810
     * @tc.name    MarketPerformance810
     * @tc.desc    Market repeated slicing 810 probe 810
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance810', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit810')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0811
     * @tc.name    MarketPerformance811
     * @tc.desc    Market repeated slicing 811 probe 811
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance811', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit811')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0812
     * @tc.name    MarketPerformance812
     * @tc.desc    Market repeated slicing 812 probe 812
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance812', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit812')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0813
     * @tc.name    MarketPerformance813
     * @tc.desc    Market repeated slicing 813 probe 813
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance813', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit813')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0814
     * @tc.name    MarketPerformance814
     * @tc.desc    Market repeated slicing 814 probe 814
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance814', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit814')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0815
     * @tc.name    MarketPerformance815
     * @tc.desc    Market repeated slicing 815 probe 815
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance815', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit815')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0816
     * @tc.name    MarketPerformance816
     * @tc.desc    Market repeated slicing 816 probe 816
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance816', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit816')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0817
     * @tc.name    MarketPerformance817
     * @tc.desc    Market repeated slicing 817 probe 817
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance817', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit817')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0818
     * @tc.name    MarketPerformance818
     * @tc.desc    Market repeated slicing 818 probe 818
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance818', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit818')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0819
     * @tc.name    MarketPerformance819
     * @tc.desc    Market repeated slicing 819 probe 819
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance819', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit819')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0820
     * @tc.name    MarketPerformance820
     * @tc.desc    Market repeated slicing 820 probe 820
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance820', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit820')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0821
     * @tc.name    MarketPerformance821
     * @tc.desc    Market repeated slicing 821 probe 821
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance821', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit821')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0822
     * @tc.name    MarketPerformance822
     * @tc.desc    Market repeated slicing 822 probe 822
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance822', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit822')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0823
     * @tc.name    MarketPerformance823
     * @tc.desc    Market repeated slicing 823 probe 823
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance823', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit823')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0824
     * @tc.name    MarketPerformance824
     * @tc.desc    Market repeated slicing 824 probe 824
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance824', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit824')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0825
     * @tc.name    MarketPerformance825
     * @tc.desc    Market repeated slicing 825 probe 825
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance825', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit825')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0826
     * @tc.name    MarketPerformance826
     * @tc.desc    Market repeated slicing 826 probe 826
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance826', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit826')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0827
     * @tc.name    MarketPerformance827
     * @tc.desc    Market repeated slicing 827 probe 827
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance827', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit827')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0828
     * @tc.name    MarketPerformance828
     * @tc.desc    Market repeated slicing 828 probe 828
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance828', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit828')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0829
     * @tc.name    MarketPerformance829
     * @tc.desc    Market repeated slicing 829 probe 829
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance829', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit829')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0830
     * @tc.name    MarketPerformance830
     * @tc.desc    Market repeated slicing 830 probe 830
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance830', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit830')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0831
     * @tc.name    MarketPerformance831
     * @tc.desc    Market repeated slicing 831 probe 831
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance831', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit831')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0832
     * @tc.name    MarketPerformance832
     * @tc.desc    Market repeated slicing 832 probe 832
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance832', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit832')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0833
     * @tc.name    MarketPerformance833
     * @tc.desc    Market repeated slicing 833 probe 833
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance833', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit833')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0834
     * @tc.name    MarketPerformance834
     * @tc.desc    Market repeated slicing 834 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit834')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0835
     * @tc.name    MarketPerformance835
     * @tc.desc    Market repeated slicing 835 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit835')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0836
     * @tc.name    MarketPerformance836
     * @tc.desc    Market repeated slicing 836 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit836')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0837
     * @tc.name    MarketPerformance837
     * @tc.desc    Market repeated slicing 837 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit837')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0838
     * @tc.name    MarketPerformance838
     * @tc.desc    Market repeated slicing 838 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit838')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0839
     * @tc.name    MarketPerformance839
     * @tc.desc    Market repeated slicing 839 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit839')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0840
     * @tc.name    MarketPerformance840
     * @tc.desc    Market repeated slicing 840 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit840')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0841
     * @tc.name    MarketPerformance841
     * @tc.desc    Market repeated slicing 841 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit841')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0842
     * @tc.name    MarketPerformance842
     * @tc.desc    Market repeated slicing 842 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit842')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0843
     * @tc.name    MarketPerformance843
     * @tc.desc    Market repeated slicing 843 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit843')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0844
     * @tc.name    MarketPerformance844
     * @tc.desc    Market repeated slicing 844 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit844')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0845
     * @tc.name    MarketPerformance845
     * @tc.desc    Market repeated slicing 845 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit845')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0846
     * @tc.name    MarketPerformance846
     * @tc.desc    Market repeated slicing 846 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit846')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0847
     * @tc.name    MarketPerformance847
     * @tc.desc    Market repeated slicing 847 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit847')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0848
     * @tc.name    MarketPerformance848
     * @tc.desc    Market repeated slicing 848 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit848')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0849
     * @tc.name    MarketPerformance849
     * @tc.desc    Market repeated slicing 849 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit849')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0850
     * @tc.name    MarketPerformance850
     * @tc.desc    Market repeated slicing 850 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit850')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0851
     * @tc.name    MarketPerformance851
     * @tc.desc    Market repeated slicing 851 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit851')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0852
     * @tc.name    MarketPerformance852
     * @tc.desc    Market repeated slicing 852 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit852')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0853
     * @tc.name    MarketPerformance853
     * @tc.desc    Market repeated slicing 853 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit853')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0854
     * @tc.name    MarketPerformance854
     * @tc.desc    Market repeated slicing 854 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit854')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0855
     * @tc.name    MarketPerformance855
     * @tc.desc    Market repeated slicing 855 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit855')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0856
     * @tc.name    MarketPerformance856
     * @tc.desc    Market repeated slicing 856 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit856')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0857
     * @tc.name    MarketPerformance857
     * @tc.desc    Market repeated slicing 857 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit857')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0858
     * @tc.name    MarketPerformance858
     * @tc.desc    Market repeated slicing 858 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit858')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0859
     * @tc.name    MarketPerformance859
     * @tc.desc    Market repeated slicing 859 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit859')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0860
     * @tc.name    MarketPerformance860
     * @tc.desc    Market repeated slicing 860 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 2;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit860')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0861
     * @tc.name    MarketPerformance861
     * @tc.desc    Market repeated slicing 861 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 3;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit861')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0862
     * @tc.name    MarketPerformance862
     * @tc.desc    Market repeated slicing 862 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 4;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit862')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0863
     * @tc.name    MarketPerformance863
     * @tc.desc    Market repeated slicing 863 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 5;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit863')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0864
     * @tc.name    MarketPerformance864
     * @tc.desc    Market repeated slicing 864 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 0;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit864')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0865
     * @tc.name    MarketPerformance865
     * @tc.desc    Market repeated slicing 865 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketPerformance865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1 + 1;
      for (let k = 0; k < m.totalPages(ps); k++) {
        expect(m.slicePage(k, ps).length <= ps).assertEqual(true);
      }
      expect(m.searchTitle('nohit865')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

