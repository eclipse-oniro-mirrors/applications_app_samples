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

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0957
     * @tc.name    MarketFocusManagerValidation957
     * @tc.desc    Market unknown keyword search 957 probe 957
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation957', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe957')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit957')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0958
     * @tc.name    MarketFocusManagerValidation958
     * @tc.desc    Market total pages formula for page size 2 probe 958
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation958', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit958')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0959
     * @tc.name    MarketFocusManagerValidation959
     * @tc.desc    Market unknown keyword search 959 probe 959
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation959', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe959')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit959')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0960
     * @tc.name    MarketFocusManagerValidation960
     * @tc.desc    Market total pages formula for page size 4 probe 960
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation960', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit960')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0961
     * @tc.name    MarketFocusManagerValidation961
     * @tc.desc    Market unknown keyword search 961 probe 961
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation961', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe961')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit961')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0962
     * @tc.name    MarketFocusManagerValidation962
     * @tc.desc    Market total pages formula for page size 6 probe 962
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation962', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit962')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0963
     * @tc.name    MarketFocusManagerValidation963
     * @tc.desc    Market unknown keyword search 963 probe 963
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation963', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe963')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit963')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0964
     * @tc.name    MarketFocusManagerValidation964
     * @tc.desc    Market total pages formula for page size 8 probe 964
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation964', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit964')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0965
     * @tc.name    MarketFocusManagerValidation965
     * @tc.desc    Market unknown keyword search 965 probe 965
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation965', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe965')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit965')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0966
     * @tc.name    MarketFocusManagerValidation966
     * @tc.desc    Market total pages formula for page size 10 probe 966
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation966', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit966')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0967
     * @tc.name    MarketFocusManagerValidation967
     * @tc.desc    Market unknown keyword search 967 probe 967
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation967', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe967')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit967')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0968
     * @tc.name    MarketFocusManagerValidation968
     * @tc.desc    Market total pages formula for page size 1 probe 968
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation968', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit968')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0969
     * @tc.name    MarketFocusManagerValidation969
     * @tc.desc    Market unknown keyword search 969 probe 969
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation969', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe969')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit969')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0970
     * @tc.name    MarketFocusManagerValidation970
     * @tc.desc    Market total pages formula for page size 3 probe 970
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation970', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit970')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0971
     * @tc.name    MarketFocusManagerValidation971
     * @tc.desc    Market unknown keyword search 971 probe 971
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation971', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe971')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit971')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0972
     * @tc.name    MarketFocusManagerValidation972
     * @tc.desc    Market total pages formula for page size 5 probe 972
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation972', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit972')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0973
     * @tc.name    MarketFocusManagerValidation973
     * @tc.desc    Market unknown keyword search 973 probe 973
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation973', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe973')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit973')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0974
     * @tc.name    MarketFocusManagerValidation974
     * @tc.desc    Market total pages formula for page size 7 probe 974
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation974', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit974')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0975
     * @tc.name    MarketFocusManagerValidation975
     * @tc.desc    Market unknown keyword search 975 probe 975
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation975', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe975')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit975')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0976
     * @tc.name    MarketFocusManagerValidation976
     * @tc.desc    Market total pages formula for page size 9 probe 976
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation976', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit976')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0977
     * @tc.name    MarketFocusManagerValidation977
     * @tc.desc    Market unknown keyword search 977 probe 977
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation977', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe977')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit977')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0978
     * @tc.name    MarketFocusManagerValidation978
     * @tc.desc    Market total pages formula for page size 11 probe 978
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation978', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit978')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0979
     * @tc.name    MarketFocusManagerValidation979
     * @tc.desc    Market unknown keyword search 979 probe 979
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation979', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe979')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit979')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0980
     * @tc.name    MarketFocusManagerValidation980
     * @tc.desc    Market total pages formula for page size 2 probe 980
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation980', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit980')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0981
     * @tc.name    MarketFocusManagerValidation981
     * @tc.desc    Market unknown keyword search 981 probe 981
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation981', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe981')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit981')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0982
     * @tc.name    MarketFocusManagerValidation982
     * @tc.desc    Market total pages formula for page size 4 probe 982
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation982', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit982')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0983
     * @tc.name    MarketFocusManagerValidation983
     * @tc.desc    Market unknown keyword search 983 probe 983
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation983', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe983')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit983')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0984
     * @tc.name    MarketFocusManagerValidation984
     * @tc.desc    Market total pages formula for page size 6 probe 984
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation984', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit984')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0985
     * @tc.name    MarketFocusManagerValidation985
     * @tc.desc    Market unknown keyword search 985 probe 985
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation985', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe985')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit985')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0986
     * @tc.name    MarketFocusManagerValidation986
     * @tc.desc    Market total pages formula for page size 8 probe 986
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation986', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit986')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0987
     * @tc.name    MarketFocusManagerValidation987
     * @tc.desc    Market unknown keyword search 987 probe 987
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation987', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe987')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit987')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0988
     * @tc.name    MarketFocusManagerValidation988
     * @tc.desc    Market total pages formula for page size 10 probe 988
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation988', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit988')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0989
     * @tc.name    MarketFocusManagerValidation989
     * @tc.desc    Market unknown keyword search 989 probe 989
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation989', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe989')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit989')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0990
     * @tc.name    MarketFocusManagerValidation990
     * @tc.desc    Market total pages formula for page size 1 probe 990
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation990', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit990')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0991
     * @tc.name    MarketFocusManagerValidation991
     * @tc.desc    Market unknown keyword search 991 probe 991
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation991', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe991')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit991')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0992
     * @tc.name    MarketFocusManagerValidation992
     * @tc.desc    Market total pages formula for page size 3 probe 992
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation992', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit992')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0993
     * @tc.name    MarketFocusManagerValidation993
     * @tc.desc    Market unknown keyword search 993 probe 993
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation993', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe993')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit993')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0994
     * @tc.name    MarketFocusManagerValidation994
     * @tc.desc    Market total pages formula for page size 5 probe 994
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation994', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit994')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0995
     * @tc.name    MarketFocusManagerValidation995
     * @tc.desc    Market unknown keyword search 995 probe 995
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation995', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe995')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit995')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0996
     * @tc.name    MarketFocusManagerValidation996
     * @tc.desc    Market total pages formula for page size 7 probe 996
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation996', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit996')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0997
     * @tc.name    MarketFocusManagerValidation997
     * @tc.desc    Market unknown keyword search 997 probe 997
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation997', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe997')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit997')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0998
     * @tc.name    MarketFocusManagerValidation998
     * @tc.desc    Market total pages formula for page size 9 probe 998
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation998', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit998')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_0999
     * @tc.name    MarketFocusManagerValidation999
     * @tc.desc    Market unknown keyword search 999 probe 999
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation999', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe999')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit999')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1000
     * @tc.name    MarketFocusManagerValidation1000
     * @tc.desc    Market total pages formula for page size 11 probe 1000
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1000', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1000')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1001
     * @tc.name    MarketFocusManagerValidation1001
     * @tc.desc    Market unknown keyword search 1001 probe 1001
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1001')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1001')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1002
     * @tc.name    MarketFocusManagerValidation1002
     * @tc.desc    Market total pages formula for page size 2 probe 1002
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1002')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1003
     * @tc.name    MarketFocusManagerValidation1003
     * @tc.desc    Market unknown keyword search 1003 probe 1003
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1003')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1003')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1004
     * @tc.name    MarketFocusManagerValidation1004
     * @tc.desc    Market total pages formula for page size 4 probe 1004
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1004')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1005
     * @tc.name    MarketFocusManagerValidation1005
     * @tc.desc    Market unknown keyword search 1005 probe 1005
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1005')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1005')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1006
     * @tc.name    MarketFocusManagerValidation1006
     * @tc.desc    Market total pages formula for page size 6 probe 1006
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1006')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1007
     * @tc.name    MarketFocusManagerValidation1007
     * @tc.desc    Market unknown keyword search 1007 probe 1007
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1007')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1007')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1008
     * @tc.name    MarketFocusManagerValidation1008
     * @tc.desc    Market total pages formula for page size 8 probe 1008
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1008')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1009
     * @tc.name    MarketFocusManagerValidation1009
     * @tc.desc    Market unknown keyword search 1009 probe 1009
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1009')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1009')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1010
     * @tc.name    MarketFocusManagerValidation1010
     * @tc.desc    Market total pages formula for page size 10 probe 1010
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1010')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1011
     * @tc.name    MarketFocusManagerValidation1011
     * @tc.desc    Market unknown keyword search 1011 probe 1011
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1011')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1011')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1012
     * @tc.name    MarketFocusManagerValidation1012
     * @tc.desc    Market total pages formula for page size 1 probe 1012
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1012')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1013
     * @tc.name    MarketFocusManagerValidation1013
     * @tc.desc    Market unknown keyword search 1013 probe 1013
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1013')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1013')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1014
     * @tc.name    MarketFocusManagerValidation1014
     * @tc.desc    Market total pages formula for page size 3 probe 1014
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1014')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1015
     * @tc.name    MarketFocusManagerValidation1015
     * @tc.desc    Market unknown keyword search 1015 probe 1015
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1015')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1015')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1016
     * @tc.name    MarketFocusManagerValidation1016
     * @tc.desc    Market total pages formula for page size 5 probe 1016
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1016')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1017
     * @tc.name    MarketFocusManagerValidation1017
     * @tc.desc    Market unknown keyword search 1017 probe 1017
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1017')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1017')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1018
     * @tc.name    MarketFocusManagerValidation1018
     * @tc.desc    Market total pages formula for page size 7 probe 1018
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1018')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1019
     * @tc.name    MarketFocusManagerValidation1019
     * @tc.desc    Market unknown keyword search 1019 probe 1019
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1019')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1019')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1020
     * @tc.name    MarketFocusManagerValidation1020
     * @tc.desc    Market total pages formula for page size 9 probe 1020
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1020')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1021
     * @tc.name    MarketFocusManagerValidation1021
     * @tc.desc    Market unknown keyword search 1021 probe 1021
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1021')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1021')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1022
     * @tc.name    MarketFocusManagerValidation1022
     * @tc.desc    Market total pages formula for page size 11 probe 1022
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1022')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1023
     * @tc.name    MarketFocusManagerValidation1023
     * @tc.desc    Market unknown keyword search 1023 probe 1023
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1023')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1023')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1024
     * @tc.name    MarketFocusManagerValidation1024
     * @tc.desc    Market total pages formula for page size 2 probe 1024
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1024')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1025
     * @tc.name    MarketFocusManagerValidation1025
     * @tc.desc    Market unknown keyword search 1025 probe 1025
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1025')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1025')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1026
     * @tc.name    MarketFocusManagerValidation1026
     * @tc.desc    Market total pages formula for page size 4 probe 1026
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1026')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1027
     * @tc.name    MarketFocusManagerValidation1027
     * @tc.desc    Market unknown keyword search 1027 probe 1027
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1027')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1027')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1028
     * @tc.name    MarketFocusManagerValidation1028
     * @tc.desc    Market total pages formula for page size 6 probe 1028
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 6;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1028')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1029
     * @tc.name    MarketFocusManagerValidation1029
     * @tc.desc    Market unknown keyword search 1029 probe 1029
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1029')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1029')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1030
     * @tc.name    MarketFocusManagerValidation1030
     * @tc.desc    Market total pages formula for page size 8 probe 1030
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 8;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1030')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1031
     * @tc.name    MarketFocusManagerValidation1031
     * @tc.desc    Market unknown keyword search 1031 probe 1031
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1031')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1031')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1032
     * @tc.name    MarketFocusManagerValidation1032
     * @tc.desc    Market total pages formula for page size 10 probe 1032
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 10;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1032')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1033
     * @tc.name    MarketFocusManagerValidation1033
     * @tc.desc    Market unknown keyword search 1033 probe 1033
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1033')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1033')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1034
     * @tc.name    MarketFocusManagerValidation1034
     * @tc.desc    Market total pages formula for page size 1 probe 1034
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 1;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1034')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1035
     * @tc.name    MarketFocusManagerValidation1035
     * @tc.desc    Market unknown keyword search 1035 probe 1035
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1035')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1035')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1036
     * @tc.name    MarketFocusManagerValidation1036
     * @tc.desc    Market total pages formula for page size 3 probe 1036
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 3;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1036')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1037
     * @tc.name    MarketFocusManagerValidation1037
     * @tc.desc    Market unknown keyword search 1037 probe 1037
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1037')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1037')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1038
     * @tc.name    MarketFocusManagerValidation1038
     * @tc.desc    Market total pages formula for page size 5 probe 1038
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 5;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1038')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1039
     * @tc.name    MarketFocusManagerValidation1039
     * @tc.desc    Market unknown keyword search 1039 probe 1039
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1039')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1039')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1040
     * @tc.name    MarketFocusManagerValidation1040
     * @tc.desc    Market total pages formula for page size 7 probe 1040
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 7;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1040')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1041
     * @tc.name    MarketFocusManagerValidation1041
     * @tc.desc    Market unknown keyword search 1041 probe 1041
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1041')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1041')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1042
     * @tc.name    MarketFocusManagerValidation1042
     * @tc.desc    Market total pages formula for page size 9 probe 1042
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 9;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1042')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1043
     * @tc.name    MarketFocusManagerValidation1043
     * @tc.desc    Market unknown keyword search 1043 probe 1043
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1043')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1043')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1044
     * @tc.name    MarketFocusManagerValidation1044
     * @tc.desc    Market total pages formula for page size 11 probe 1044
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 11;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1044')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1045
     * @tc.name    MarketFocusManagerValidation1045
     * @tc.desc    Market unknown keyword search 1045 probe 1045
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1045')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1045')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1046
     * @tc.name    MarketFocusManagerValidation1046
     * @tc.desc    Market total pages formula for page size 2 probe 1046
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 2;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1046')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1047
     * @tc.name    MarketFocusManagerValidation1047
     * @tc.desc    Market unknown keyword search 1047 probe 1047
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1047')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1047')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1048
     * @tc.name    MarketFocusManagerValidation1048
     * @tc.desc    Market total pages formula for page size 4 probe 1048
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const ps: number = 4;
      expect(m.totalPages(ps)).assertEqual(Math.ceil(m.totalCount() / ps));
      expect(m.totalPages(0)).assertEqual(0);
      expect(m.searchTitle('nohit1048')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_MARKET_1049
     * @tc.name    MarketFocusManagerValidation1049
     * @tc.desc    Market unknown keyword search 1049 probe 1049
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('MarketFocusManagerValidation1049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.searchTitle('zzprobe1049')).assertEqual(0);
      expect(m.searchTitle('')).assertLargerOrEqual(0);
      expect(m.searchTitle('nohit1049')).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
  });
}

