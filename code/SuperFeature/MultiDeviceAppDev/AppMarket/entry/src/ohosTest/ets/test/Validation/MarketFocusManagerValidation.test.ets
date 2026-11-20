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

export default function marketFocusManagerValidationSuite() {
  describe('MarketFocusManagerValidationSuite', () => {
    let m: MarketModel = new MarketModel();

    beforeEach(() => {
      m = new MarketModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0866
     * @tc.name    MarketFocusManagerValidation866
     * @tc.desc    Market total pages formula for page size 9 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit866')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0867
     * @tc.name    MarketFocusManagerValidation867
     * @tc.desc    Market unknown keyword search 867 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe867')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit867')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0868
     * @tc.name    MarketFocusManagerValidation868
     * @tc.desc    Market total pages formula for page size 11 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit868')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0869
     * @tc.name    MarketFocusManagerValidation869
     * @tc.desc    Market unknown keyword search 869 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe869')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit869')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0870
     * @tc.name    MarketFocusManagerValidation870
     * @tc.desc    Market total pages formula for page size 2 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit870')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0871
     * @tc.name    MarketFocusManagerValidation871
     * @tc.desc    Market unknown keyword search 871 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe871')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit871')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0872
     * @tc.name    MarketFocusManagerValidation872
     * @tc.desc    Market total pages formula for page size 4 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit872')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0873
     * @tc.name    MarketFocusManagerValidation873
     * @tc.desc    Market unknown keyword search 873 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe873')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit873')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0874
     * @tc.name    MarketFocusManagerValidation874
     * @tc.desc    Market total pages formula for page size 6 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit874')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0875
     * @tc.name    MarketFocusManagerValidation875
     * @tc.desc    Market unknown keyword search 875 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe875')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit875')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0876
     * @tc.name    MarketFocusManagerValidation876
     * @tc.desc    Market total pages formula for page size 8 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit876')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0877
     * @tc.name    MarketFocusManagerValidation877
     * @tc.desc    Market unknown keyword search 877 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe877')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit877')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0878
     * @tc.name    MarketFocusManagerValidation878
     * @tc.desc    Market total pages formula for page size 10 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit878')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0879
     * @tc.name    MarketFocusManagerValidation879
     * @tc.desc    Market unknown keyword search 879 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe879')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit879')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0880
     * @tc.name    MarketFocusManagerValidation880
     * @tc.desc    Market total pages formula for page size 1 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit880')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0881
     * @tc.name    MarketFocusManagerValidation881
     * @tc.desc    Market unknown keyword search 881 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe881')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit881')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0882
     * @tc.name    MarketFocusManagerValidation882
     * @tc.desc    Market total pages formula for page size 3 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit882')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0883
     * @tc.name    MarketFocusManagerValidation883
     * @tc.desc    Market unknown keyword search 883 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe883')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit883')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0884
     * @tc.name    MarketFocusManagerValidation884
     * @tc.desc    Market total pages formula for page size 5 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit884')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0885
     * @tc.name    MarketFocusManagerValidation885
     * @tc.desc    Market unknown keyword search 885 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe885')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit885')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0886
     * @tc.name    MarketFocusManagerValidation886
     * @tc.desc    Market total pages formula for page size 7 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit886')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0887
     * @tc.name    MarketFocusManagerValidation887
     * @tc.desc    Market unknown keyword search 887 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe887')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit887')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0888
     * @tc.name    MarketFocusManagerValidation888
     * @tc.desc    Market total pages formula for page size 9 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit888')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0889
     * @tc.name    MarketFocusManagerValidation889
     * @tc.desc    Market unknown keyword search 889 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe889')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit889')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0890
     * @tc.name    MarketFocusManagerValidation890
     * @tc.desc    Market total pages formula for page size 11 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit890')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0891
     * @tc.name    MarketFocusManagerValidation891
     * @tc.desc    Market unknown keyword search 891 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe891')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit891')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0892
     * @tc.name    MarketFocusManagerValidation892
     * @tc.desc    Market total pages formula for page size 2 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit892')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0893
     * @tc.name    MarketFocusManagerValidation893
     * @tc.desc    Market unknown keyword search 893 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe893')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit893')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0894
     * @tc.name    MarketFocusManagerValidation894
     * @tc.desc    Market total pages formula for page size 4 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit894')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0895
     * @tc.name    MarketFocusManagerValidation895
     * @tc.desc    Market unknown keyword search 895 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe895')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit895')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0896
     * @tc.name    MarketFocusManagerValidation896
     * @tc.desc    Market total pages formula for page size 6 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit896')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0897
     * @tc.name    MarketFocusManagerValidation897
     * @tc.desc    Market unknown keyword search 897 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe897')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit897')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0898
     * @tc.name    MarketFocusManagerValidation898
     * @tc.desc    Market total pages formula for page size 8 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit898')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0899
     * @tc.name    MarketFocusManagerValidation899
     * @tc.desc    Market unknown keyword search 899 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe899')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit899')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0900
     * @tc.name    MarketFocusManagerValidation900
     * @tc.desc    Market total pages formula for page size 10 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit900')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0901
     * @tc.name    MarketFocusManagerValidation901
     * @tc.desc    Market unknown keyword search 901 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe901')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit901')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0902
     * @tc.name    MarketFocusManagerValidation902
     * @tc.desc    Market total pages formula for page size 1 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit902')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0903
     * @tc.name    MarketFocusManagerValidation903
     * @tc.desc    Market unknown keyword search 903 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe903')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit903')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0904
     * @tc.name    MarketFocusManagerValidation904
     * @tc.desc    Market total pages formula for page size 3 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit904')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0905
     * @tc.name    MarketFocusManagerValidation905
     * @tc.desc    Market unknown keyword search 905 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe905')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit905')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0906
     * @tc.name    MarketFocusManagerValidation906
     * @tc.desc    Market total pages formula for page size 5 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit906')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0907
     * @tc.name    MarketFocusManagerValidation907
     * @tc.desc    Market unknown keyword search 907 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe907')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit907')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0908
     * @tc.name    MarketFocusManagerValidation908
     * @tc.desc    Market total pages formula for page size 7 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit908')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0909
     * @tc.name    MarketFocusManagerValidation909
     * @tc.desc    Market unknown keyword search 909 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe909')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit909')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0910
     * @tc.name    MarketFocusManagerValidation910
     * @tc.desc    Market total pages formula for page size 9 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit910')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0911
     * @tc.name    MarketFocusManagerValidation911
     * @tc.desc    Market unknown keyword search 911 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe911')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit911')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0912
     * @tc.name    MarketFocusManagerValidation912
     * @tc.desc    Market total pages formula for page size 11 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit912')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0913
     * @tc.name    MarketFocusManagerValidation913
     * @tc.desc    Market unknown keyword search 913 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe913')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit913')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0914
     * @tc.name    MarketFocusManagerValidation914
     * @tc.desc    Market total pages formula for page size 2 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit914')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0915
     * @tc.name    MarketFocusManagerValidation915
     * @tc.desc    Market unknown keyword search 915 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe915')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit915')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0916
     * @tc.name    MarketFocusManagerValidation916
     * @tc.desc    Market total pages formula for page size 4 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit916')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0917
     * @tc.name    MarketFocusManagerValidation917
     * @tc.desc    Market unknown keyword search 917 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe917')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit917')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0918
     * @tc.name    MarketFocusManagerValidation918
     * @tc.desc    Market total pages formula for page size 6 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit918')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0919
     * @tc.name    MarketFocusManagerValidation919
     * @tc.desc    Market unknown keyword search 919 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe919')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit919')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0920
     * @tc.name    MarketFocusManagerValidation920
     * @tc.desc    Market total pages formula for page size 8 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit920')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0921
     * @tc.name    MarketFocusManagerValidation921
     * @tc.desc    Market unknown keyword search 921 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe921')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit921')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0922
     * @tc.name    MarketFocusManagerValidation922
     * @tc.desc    Market total pages formula for page size 10 probe 922
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation922', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit922')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0923
     * @tc.name    MarketFocusManagerValidation923
     * @tc.desc    Market unknown keyword search 923 probe 923
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation923', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe923')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit923')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0924
     * @tc.name    MarketFocusManagerValidation924
     * @tc.desc    Market total pages formula for page size 1 probe 924
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation924', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit924')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0925
     * @tc.name    MarketFocusManagerValidation925
     * @tc.desc    Market unknown keyword search 925 probe 925
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation925', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe925')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit925')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0926
     * @tc.name    MarketFocusManagerValidation926
     * @tc.desc    Market total pages formula for page size 3 probe 926
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation926', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit926')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0927
     * @tc.name    MarketFocusManagerValidation927
     * @tc.desc    Market unknown keyword search 927 probe 927
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation927', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe927')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit927')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0928
     * @tc.name    MarketFocusManagerValidation928
     * @tc.desc    Market total pages formula for page size 5 probe 928
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation928', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit928')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0929
     * @tc.name    MarketFocusManagerValidation929
     * @tc.desc    Market unknown keyword search 929 probe 929
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation929', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe929')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit929')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0930
     * @tc.name    MarketFocusManagerValidation930
     * @tc.desc    Market total pages formula for page size 7 probe 930
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation930', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit930')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0931
     * @tc.name    MarketFocusManagerValidation931
     * @tc.desc    Market unknown keyword search 931 probe 931
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation931', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe931')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit931')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0932
     * @tc.name    MarketFocusManagerValidation932
     * @tc.desc    Market total pages formula for page size 9 probe 932
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation932', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit932')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0933
     * @tc.name    MarketFocusManagerValidation933
     * @tc.desc    Market unknown keyword search 933 probe 933
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation933', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe933')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit933')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0934
     * @tc.name    MarketFocusManagerValidation934
     * @tc.desc    Market total pages formula for page size 11 probe 934
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation934', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit934')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0935
     * @tc.name    MarketFocusManagerValidation935
     * @tc.desc    Market unknown keyword search 935 probe 935
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation935', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe935')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit935')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0936
     * @tc.name    MarketFocusManagerValidation936
     * @tc.desc    Market total pages formula for page size 2 probe 936
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation936', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit936')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0937
     * @tc.name    MarketFocusManagerValidation937
     * @tc.desc    Market unknown keyword search 937 probe 937
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation937', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe937')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit937')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0938
     * @tc.name    MarketFocusManagerValidation938
     * @tc.desc    Market total pages formula for page size 4 probe 938
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation938', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit938')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0939
     * @tc.name    MarketFocusManagerValidation939
     * @tc.desc    Market unknown keyword search 939 probe 939
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation939', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe939')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit939')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0940
     * @tc.name    MarketFocusManagerValidation940
     * @tc.desc    Market total pages formula for page size 6 probe 940
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation940', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit940')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0941
     * @tc.name    MarketFocusManagerValidation941
     * @tc.desc    Market unknown keyword search 941 probe 941
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation941', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe941')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit941')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0942
     * @tc.name    MarketFocusManagerValidation942
     * @tc.desc    Market total pages formula for page size 8 probe 942
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation942', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit942')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0943
     * @tc.name    MarketFocusManagerValidation943
     * @tc.desc    Market unknown keyword search 943 probe 943
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation943', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe943')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit943')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0944
     * @tc.name    MarketFocusManagerValidation944
     * @tc.desc    Market total pages formula for page size 10 probe 944
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation944', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit944')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0945
     * @tc.name    MarketFocusManagerValidation945
     * @tc.desc    Market unknown keyword search 945 probe 945
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation945', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe945')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit945')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0946
     * @tc.name    MarketFocusManagerValidation946
     * @tc.desc    Market total pages formula for page size 1 probe 946
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation946', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit946')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0947
     * @tc.name    MarketFocusManagerValidation947
     * @tc.desc    Market unknown keyword search 947 probe 947
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation947', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe947')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit947')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0948
     * @tc.name    MarketFocusManagerValidation948
     * @tc.desc    Market total pages formula for page size 3 probe 948
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation948', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit948')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0949
     * @tc.name    MarketFocusManagerValidation949
     * @tc.desc    Market unknown keyword search 949 probe 949
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation949', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe949')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit949')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0950
     * @tc.name    MarketFocusManagerValidation950
     * @tc.desc    Market total pages formula for page size 5 probe 950
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation950', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit950')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0951
     * @tc.name    MarketFocusManagerValidation951
     * @tc.desc    Market unknown keyword search 951 probe 951
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation951', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe951')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit951')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0952
     * @tc.name    MarketFocusManagerValidation952
     * @tc.desc    Market total pages formula for page size 7 probe 952
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation952', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit952')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0953
     * @tc.name    MarketFocusManagerValidation953
     * @tc.desc    Market unknown keyword search 953 probe 953
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation953', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe953')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit953')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0954
     * @tc.name    MarketFocusManagerValidation954
     * @tc.desc    Market total pages formula for page size 9 probe 954
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation954', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit954')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0955
     * @tc.name    MarketFocusManagerValidation955
     * @tc.desc    Market unknown keyword search 955 probe 955
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation955', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe955')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit955')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0956
     * @tc.name    MarketFocusManagerValidation956
     * @tc.desc    Market total pages formula for page size 11 probe 956
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation956', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit956')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

