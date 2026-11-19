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
import { DietModel } from '../Shared/DietModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[DietTests]';

export default function dietAccessControlSuite() {
  describe('DietAccessControlSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0807
     * @tc.name    DietAccessControl807
     * @tc.desc    Diet invalid weight rejected 807 probe 807
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl807', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-28)).assertEqual(false);
      expect(m.getFoodById(1000 + 807) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0808
     * @tc.name    DietAccessControl808
     * @tc.desc    Diet invalid weight rejected 808 probe 808
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl808', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-29)).assertEqual(false);
      expect(m.getFoodById(1000 + 808) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0809
     * @tc.name    DietAccessControl809
     * @tc.desc    Diet invalid weight rejected 809 probe 809
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl809', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-30)).assertEqual(false);
      expect(m.getFoodById(1000 + 809) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0810
     * @tc.name    DietAccessControl810
     * @tc.desc    Diet invalid weight rejected 810 probe 810
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl810', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-1)).assertEqual(false);
      expect(m.getFoodById(1000 + 810) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0811
     * @tc.name    DietAccessControl811
     * @tc.desc    Diet invalid weight rejected 811 probe 811
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl811', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-2)).assertEqual(false);
      expect(m.getFoodById(1000 + 811) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0812
     * @tc.name    DietAccessControl812
     * @tc.desc    Diet invalid weight rejected 812 probe 812
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl812', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-3)).assertEqual(false);
      expect(m.getFoodById(1000 + 812) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0813
     * @tc.name    DietAccessControl813
     * @tc.desc    Diet invalid weight rejected 813 probe 813
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl813', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-4)).assertEqual(false);
      expect(m.getFoodById(1000 + 813) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0814
     * @tc.name    DietAccessControl814
     * @tc.desc    Diet invalid weight rejected 814 probe 814
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl814', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-5)).assertEqual(false);
      expect(m.getFoodById(1000 + 814) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0815
     * @tc.name    DietAccessControl815
     * @tc.desc    Diet invalid weight rejected 815 probe 815
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl815', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-6)).assertEqual(false);
      expect(m.getFoodById(1000 + 815) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0816
     * @tc.name    DietAccessControl816
     * @tc.desc    Diet invalid weight rejected 816 probe 816
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl816', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-7)).assertEqual(false);
      expect(m.getFoodById(1000 + 816) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0817
     * @tc.name    DietAccessControl817
     * @tc.desc    Diet invalid weight rejected 817 probe 817
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl817', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-8)).assertEqual(false);
      expect(m.getFoodById(1000 + 817) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0818
     * @tc.name    DietAccessControl818
     * @tc.desc    Diet invalid weight rejected 818 probe 818
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl818', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-9)).assertEqual(false);
      expect(m.getFoodById(1000 + 818) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0819
     * @tc.name    DietAccessControl819
     * @tc.desc    Diet invalid weight rejected 819 probe 819
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl819', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-10)).assertEqual(false);
      expect(m.getFoodById(1000 + 819) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0820
     * @tc.name    DietAccessControl820
     * @tc.desc    Diet invalid weight rejected 820 probe 820
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl820', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-11)).assertEqual(false);
      expect(m.getFoodById(1000 + 820) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0821
     * @tc.name    DietAccessControl821
     * @tc.desc    Diet invalid weight rejected 821 probe 821
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl821', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-12)).assertEqual(false);
      expect(m.getFoodById(1000 + 821) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0822
     * @tc.name    DietAccessControl822
     * @tc.desc    Diet invalid weight rejected 822 probe 822
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl822', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-13)).assertEqual(false);
      expect(m.getFoodById(1000 + 822) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0823
     * @tc.name    DietAccessControl823
     * @tc.desc    Diet invalid weight rejected 823 probe 823
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl823', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-14)).assertEqual(false);
      expect(m.getFoodById(1000 + 823) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0824
     * @tc.name    DietAccessControl824
     * @tc.desc    Diet invalid weight rejected 824 probe 824
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl824', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-15)).assertEqual(false);
      expect(m.getFoodById(1000 + 824) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0825
     * @tc.name    DietAccessControl825
     * @tc.desc    Diet invalid weight rejected 825 probe 825
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl825', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-16)).assertEqual(false);
      expect(m.getFoodById(1000 + 825) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0826
     * @tc.name    DietAccessControl826
     * @tc.desc    Diet invalid weight rejected 826 probe 826
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl826', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-17)).assertEqual(false);
      expect(m.getFoodById(1000 + 826) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0827
     * @tc.name    DietAccessControl827
     * @tc.desc    Diet invalid weight rejected 827 probe 827
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl827', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-18)).assertEqual(false);
      expect(m.getFoodById(1000 + 827) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0828
     * @tc.name    DietAccessControl828
     * @tc.desc    Diet invalid weight rejected 828 probe 828
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl828', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-19)).assertEqual(false);
      expect(m.getFoodById(1000 + 828) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0829
     * @tc.name    DietAccessControl829
     * @tc.desc    Diet invalid weight rejected 829 probe 829
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl829', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-20)).assertEqual(false);
      expect(m.getFoodById(1000 + 829) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0830
     * @tc.name    DietAccessControl830
     * @tc.desc    Diet invalid weight rejected 830 probe 830
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl830', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-21)).assertEqual(false);
      expect(m.getFoodById(1000 + 830) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0831
     * @tc.name    DietAccessControl831
     * @tc.desc    Diet invalid weight rejected 831 probe 831
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl831', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-22)).assertEqual(false);
      expect(m.getFoodById(1000 + 831) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0832
     * @tc.name    DietAccessControl832
     * @tc.desc    Diet invalid weight rejected 832 probe 832
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl832', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-23)).assertEqual(false);
      expect(m.getFoodById(1000 + 832) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0833
     * @tc.name    DietAccessControl833
     * @tc.desc    Diet invalid weight rejected 833 probe 833
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl833', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-24)).assertEqual(false);
      expect(m.getFoodById(1000 + 833) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0834
     * @tc.name    DietAccessControl834
     * @tc.desc    Diet invalid weight rejected 834 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-25)).assertEqual(false);
      expect(m.getFoodById(1000 + 834) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0835
     * @tc.name    DietAccessControl835
     * @tc.desc    Diet invalid weight rejected 835 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-26)).assertEqual(false);
      expect(m.getFoodById(1000 + 835) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0836
     * @tc.name    DietAccessControl836
     * @tc.desc    Diet invalid weight rejected 836 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-27)).assertEqual(false);
      expect(m.getFoodById(1000 + 836) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0837
     * @tc.name    DietAccessControl837
     * @tc.desc    Diet invalid weight rejected 837 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-28)).assertEqual(false);
      expect(m.getFoodById(1000 + 837) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0838
     * @tc.name    DietAccessControl838
     * @tc.desc    Diet invalid weight rejected 838 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-29)).assertEqual(false);
      expect(m.getFoodById(1000 + 838) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0839
     * @tc.name    DietAccessControl839
     * @tc.desc    Diet invalid weight rejected 839 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-30)).assertEqual(false);
      expect(m.getFoodById(1000 + 839) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0840
     * @tc.name    DietAccessControl840
     * @tc.desc    Diet invalid weight rejected 840 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-1)).assertEqual(false);
      expect(m.getFoodById(1000 + 840) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0841
     * @tc.name    DietAccessControl841
     * @tc.desc    Diet invalid weight rejected 841 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-2)).assertEqual(false);
      expect(m.getFoodById(1000 + 841) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0842
     * @tc.name    DietAccessControl842
     * @tc.desc    Diet invalid weight rejected 842 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-3)).assertEqual(false);
      expect(m.getFoodById(1000 + 842) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0843
     * @tc.name    DietAccessControl843
     * @tc.desc    Diet invalid weight rejected 843 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-4)).assertEqual(false);
      expect(m.getFoodById(1000 + 843) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0844
     * @tc.name    DietAccessControl844
     * @tc.desc    Diet invalid weight rejected 844 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-5)).assertEqual(false);
      expect(m.getFoodById(1000 + 844) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0845
     * @tc.name    DietAccessControl845
     * @tc.desc    Diet invalid weight rejected 845 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-6)).assertEqual(false);
      expect(m.getFoodById(1000 + 845) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0846
     * @tc.name    DietAccessControl846
     * @tc.desc    Diet invalid weight rejected 846 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-7)).assertEqual(false);
      expect(m.getFoodById(1000 + 846) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0847
     * @tc.name    DietAccessControl847
     * @tc.desc    Diet invalid weight rejected 847 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-8)).assertEqual(false);
      expect(m.getFoodById(1000 + 847) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0848
     * @tc.name    DietAccessControl848
     * @tc.desc    Diet invalid weight rejected 848 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-9)).assertEqual(false);
      expect(m.getFoodById(1000 + 848) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0849
     * @tc.name    DietAccessControl849
     * @tc.desc    Diet invalid weight rejected 849 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-10)).assertEqual(false);
      expect(m.getFoodById(1000 + 849) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0850
     * @tc.name    DietAccessControl850
     * @tc.desc    Diet invalid weight rejected 850 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-11)).assertEqual(false);
      expect(m.getFoodById(1000 + 850) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0851
     * @tc.name    DietAccessControl851
     * @tc.desc    Diet invalid weight rejected 851 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-12)).assertEqual(false);
      expect(m.getFoodById(1000 + 851) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0852
     * @tc.name    DietAccessControl852
     * @tc.desc    Diet invalid weight rejected 852 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-13)).assertEqual(false);
      expect(m.getFoodById(1000 + 852) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0853
     * @tc.name    DietAccessControl853
     * @tc.desc    Diet invalid weight rejected 853 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-14)).assertEqual(false);
      expect(m.getFoodById(1000 + 853) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0854
     * @tc.name    DietAccessControl854
     * @tc.desc    Diet invalid weight rejected 854 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-15)).assertEqual(false);
      expect(m.getFoodById(1000 + 854) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0855
     * @tc.name    DietAccessControl855
     * @tc.desc    Diet invalid weight rejected 855 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-16)).assertEqual(false);
      expect(m.getFoodById(1000 + 855) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0856
     * @tc.name    DietAccessControl856
     * @tc.desc    Diet invalid weight rejected 856 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-17)).assertEqual(false);
      expect(m.getFoodById(1000 + 856) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0857
     * @tc.name    DietAccessControl857
     * @tc.desc    Diet invalid weight rejected 857 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-18)).assertEqual(false);
      expect(m.getFoodById(1000 + 857) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0858
     * @tc.name    DietAccessControl858
     * @tc.desc    Diet invalid weight rejected 858 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-19)).assertEqual(false);
      expect(m.getFoodById(1000 + 858) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0859
     * @tc.name    DietAccessControl859
     * @tc.desc    Diet invalid weight rejected 859 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-20)).assertEqual(false);
      expect(m.getFoodById(1000 + 859) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0860
     * @tc.name    DietAccessControl860
     * @tc.desc    Diet invalid weight rejected 860 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-21)).assertEqual(false);
      expect(m.getFoodById(1000 + 860) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0861
     * @tc.name    DietAccessControl861
     * @tc.desc    Diet invalid weight rejected 861 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-22)).assertEqual(false);
      expect(m.getFoodById(1000 + 861) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0862
     * @tc.name    DietAccessControl862
     * @tc.desc    Diet invalid weight rejected 862 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-23)).assertEqual(false);
      expect(m.getFoodById(1000 + 862) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0863
     * @tc.name    DietAccessControl863
     * @tc.desc    Diet invalid weight rejected 863 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-24)).assertEqual(false);
      expect(m.getFoodById(1000 + 863) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0864
     * @tc.name    DietAccessControl864
     * @tc.desc    Diet invalid weight rejected 864 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-25)).assertEqual(false);
      expect(m.getFoodById(1000 + 864) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0865
     * @tc.name    DietAccessControl865
     * @tc.desc    Diet invalid weight rejected 865 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-26)).assertEqual(false);
      expect(m.getFoodById(1000 + 865) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0866
     * @tc.name    DietAccessControl866
     * @tc.desc    Diet invalid weight rejected 866 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-27)).assertEqual(false);
      expect(m.getFoodById(1000 + 866) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0867
     * @tc.name    DietAccessControl867
     * @tc.desc    Diet invalid weight rejected 867 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-28)).assertEqual(false);
      expect(m.getFoodById(1000 + 867) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0868
     * @tc.name    DietAccessControl868
     * @tc.desc    Diet invalid weight rejected 868 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-29)).assertEqual(false);
      expect(m.getFoodById(1000 + 868) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0869
     * @tc.name    DietAccessControl869
     * @tc.desc    Diet invalid weight rejected 869 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-30)).assertEqual(false);
      expect(m.getFoodById(1000 + 869) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0870
     * @tc.name    DietAccessControl870
     * @tc.desc    Diet invalid weight rejected 870 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-1)).assertEqual(false);
      expect(m.getFoodById(1000 + 870) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0871
     * @tc.name    DietAccessControl871
     * @tc.desc    Diet invalid weight rejected 871 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-2)).assertEqual(false);
      expect(m.getFoodById(1000 + 871) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0872
     * @tc.name    DietAccessControl872
     * @tc.desc    Diet invalid weight rejected 872 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-3)).assertEqual(false);
      expect(m.getFoodById(1000 + 872) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0873
     * @tc.name    DietAccessControl873
     * @tc.desc    Diet invalid weight rejected 873 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-4)).assertEqual(false);
      expect(m.getFoodById(1000 + 873) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0874
     * @tc.name    DietAccessControl874
     * @tc.desc    Diet invalid weight rejected 874 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-5)).assertEqual(false);
      expect(m.getFoodById(1000 + 874) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0875
     * @tc.name    DietAccessControl875
     * @tc.desc    Diet invalid weight rejected 875 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-6)).assertEqual(false);
      expect(m.getFoodById(1000 + 875) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0876
     * @tc.name    DietAccessControl876
     * @tc.desc    Diet invalid weight rejected 876 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-7)).assertEqual(false);
      expect(m.getFoodById(1000 + 876) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0877
     * @tc.name    DietAccessControl877
     * @tc.desc    Diet invalid weight rejected 877 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-8)).assertEqual(false);
      expect(m.getFoodById(1000 + 877) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0878
     * @tc.name    DietAccessControl878
     * @tc.desc    Diet invalid weight rejected 878 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-9)).assertEqual(false);
      expect(m.getFoodById(1000 + 878) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0879
     * @tc.name    DietAccessControl879
     * @tc.desc    Diet invalid weight rejected 879 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-10)).assertEqual(false);
      expect(m.getFoodById(1000 + 879) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0880
     * @tc.name    DietAccessControl880
     * @tc.desc    Diet invalid weight rejected 880 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-11)).assertEqual(false);
      expect(m.getFoodById(1000 + 880) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0881
     * @tc.name    DietAccessControl881
     * @tc.desc    Diet invalid weight rejected 881 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-12)).assertEqual(false);
      expect(m.getFoodById(1000 + 881) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0882
     * @tc.name    DietAccessControl882
     * @tc.desc    Diet invalid weight rejected 882 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-13)).assertEqual(false);
      expect(m.getFoodById(1000 + 882) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0883
     * @tc.name    DietAccessControl883
     * @tc.desc    Diet invalid weight rejected 883 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-14)).assertEqual(false);
      expect(m.getFoodById(1000 + 883) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0884
     * @tc.name    DietAccessControl884
     * @tc.desc    Diet invalid weight rejected 884 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-15)).assertEqual(false);
      expect(m.getFoodById(1000 + 884) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0885
     * @tc.name    DietAccessControl885
     * @tc.desc    Diet invalid weight rejected 885 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-16)).assertEqual(false);
      expect(m.getFoodById(1000 + 885) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0886
     * @tc.name    DietAccessControl886
     * @tc.desc    Diet invalid weight rejected 886 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-17)).assertEqual(false);
      expect(m.getFoodById(1000 + 886) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0887
     * @tc.name    DietAccessControl887
     * @tc.desc    Diet invalid weight rejected 887 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-18)).assertEqual(false);
      expect(m.getFoodById(1000 + 887) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0888
     * @tc.name    DietAccessControl888
     * @tc.desc    Diet invalid weight rejected 888 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-19)).assertEqual(false);
      expect(m.getFoodById(1000 + 888) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0889
     * @tc.name    DietAccessControl889
     * @tc.desc    Diet invalid weight rejected 889 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-20)).assertEqual(false);
      expect(m.getFoodById(1000 + 889) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0890
     * @tc.name    DietAccessControl890
     * @tc.desc    Diet invalid weight rejected 890 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-21)).assertEqual(false);
      expect(m.getFoodById(1000 + 890) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0891
     * @tc.name    DietAccessControl891
     * @tc.desc    Diet invalid weight rejected 891 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-22)).assertEqual(false);
      expect(m.getFoodById(1000 + 891) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0892
     * @tc.name    DietAccessControl892
     * @tc.desc    Diet invalid weight rejected 892 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-23)).assertEqual(false);
      expect(m.getFoodById(1000 + 892) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0893
     * @tc.name    DietAccessControl893
     * @tc.desc    Diet invalid weight rejected 893 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-24)).assertEqual(false);
      expect(m.getFoodById(1000 + 893) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0894
     * @tc.name    DietAccessControl894
     * @tc.desc    Diet invalid weight rejected 894 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-25)).assertEqual(false);
      expect(m.getFoodById(1000 + 894) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0895
     * @tc.name    DietAccessControl895
     * @tc.desc    Diet invalid weight rejected 895 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-26)).assertEqual(false);
      expect(m.getFoodById(1000 + 895) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0896
     * @tc.name    DietAccessControl896
     * @tc.desc    Diet invalid weight rejected 896 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-27)).assertEqual(false);
      expect(m.getFoodById(1000 + 896) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0897
     * @tc.name    DietAccessControl897
     * @tc.desc    Diet invalid weight rejected 897 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-28)).assertEqual(false);
      expect(m.getFoodById(1000 + 897) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0898
     * @tc.name    DietAccessControl898
     * @tc.desc    Diet invalid weight rejected 898 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-29)).assertEqual(false);
      expect(m.getFoodById(1000 + 898) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0899
     * @tc.name    DietAccessControl899
     * @tc.desc    Diet invalid weight rejected 899 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-30)).assertEqual(false);
      expect(m.getFoodById(1000 + 899) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0900
     * @tc.name    DietAccessControl900
     * @tc.desc    Diet invalid weight rejected 900 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-1)).assertEqual(false);
      expect(m.getFoodById(1000 + 900) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0901
     * @tc.name    DietAccessControl901
     * @tc.desc    Diet invalid weight rejected 901 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-2)).assertEqual(false);
      expect(m.getFoodById(1000 + 901) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0902
     * @tc.name    DietAccessControl902
     * @tc.desc    Diet invalid weight rejected 902 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-3)).assertEqual(false);
      expect(m.getFoodById(1000 + 902) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0903
     * @tc.name    DietAccessControl903
     * @tc.desc    Diet invalid weight rejected 903 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-4)).assertEqual(false);
      expect(m.getFoodById(1000 + 903) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0904
     * @tc.name    DietAccessControl904
     * @tc.desc    Diet invalid weight rejected 904 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-5)).assertEqual(false);
      expect(m.getFoodById(1000 + 904) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0905
     * @tc.name    DietAccessControl905
     * @tc.desc    Diet invalid weight rejected 905 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-6)).assertEqual(false);
      expect(m.getFoodById(1000 + 905) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0906
     * @tc.name    DietAccessControl906
     * @tc.desc    Diet invalid weight rejected 906 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-7)).assertEqual(false);
      expect(m.getFoodById(1000 + 906) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0907
     * @tc.name    DietAccessControl907
     * @tc.desc    Diet invalid weight rejected 907 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-8)).assertEqual(false);
      expect(m.getFoodById(1000 + 907) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0908
     * @tc.name    DietAccessControl908
     * @tc.desc    Diet invalid weight rejected 908 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-9)).assertEqual(false);
      expect(m.getFoodById(1000 + 908) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0909
     * @tc.name    DietAccessControl909
     * @tc.desc    Diet invalid weight rejected 909 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-10)).assertEqual(false);
      expect(m.getFoodById(1000 + 909) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0910
     * @tc.name    DietAccessControl910
     * @tc.desc    Diet invalid weight rejected 910 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-11)).assertEqual(false);
      expect(m.getFoodById(1000 + 910) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0911
     * @tc.name    DietAccessControl911
     * @tc.desc    Diet invalid weight rejected 911 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-12)).assertEqual(false);
      expect(m.getFoodById(1000 + 911) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0912
     * @tc.name    DietAccessControl912
     * @tc.desc    Diet invalid weight rejected 912 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-13)).assertEqual(false);
      expect(m.getFoodById(1000 + 912) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0913
     * @tc.name    DietAccessControl913
     * @tc.desc    Diet invalid weight rejected 913 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-14)).assertEqual(false);
      expect(m.getFoodById(1000 + 913) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0914
     * @tc.name    DietAccessControl914
     * @tc.desc    Diet invalid weight rejected 914 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-15)).assertEqual(false);
      expect(m.getFoodById(1000 + 914) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0915
     * @tc.name    DietAccessControl915
     * @tc.desc    Diet invalid weight rejected 915 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-16)).assertEqual(false);
      expect(m.getFoodById(1000 + 915) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0916
     * @tc.name    DietAccessControl916
     * @tc.desc    Diet invalid weight rejected 916 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-17)).assertEqual(false);
      expect(m.getFoodById(1000 + 916) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0917
     * @tc.name    DietAccessControl917
     * @tc.desc    Diet invalid weight rejected 917 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-18)).assertEqual(false);
      expect(m.getFoodById(1000 + 917) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0918
     * @tc.name    DietAccessControl918
     * @tc.desc    Diet invalid weight rejected 918 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-19)).assertEqual(false);
      expect(m.getFoodById(1000 + 918) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0919
     * @tc.name    DietAccessControl919
     * @tc.desc    Diet invalid weight rejected 919 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-20)).assertEqual(false);
      expect(m.getFoodById(1000 + 919) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0920
     * @tc.name    DietAccessControl920
     * @tc.desc    Diet invalid weight rejected 920 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-21)).assertEqual(false);
      expect(m.getFoodById(1000 + 920) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0921
     * @tc.name    DietAccessControl921
     * @tc.desc    Diet invalid weight rejected 921 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietAccessControl921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      expect(m.isValidWeight(0)).assertEqual(false);
      expect(m.isValidWeight(-22)).assertEqual(false);
      expect(m.getFoodById(1000 + 921) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
