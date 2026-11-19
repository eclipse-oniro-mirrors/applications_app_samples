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

export default function dietStatePersistenceSuite() {
  describe('DietStatePersistenceSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0741
     * @tc.name    DietStatePersistence741
     * @tc.desc    Diet clear entries 741 probe 741
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence741', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 42);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 741) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0742
     * @tc.name    DietStatePersistence742
     * @tc.desc    Diet clear entries 742 probe 742
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence742', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 43);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 742) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0743
     * @tc.name    DietStatePersistence743
     * @tc.desc    Diet clear entries 743 probe 743
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence743', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 44);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 743) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0744
     * @tc.name    DietStatePersistence744
     * @tc.desc    Diet clear entries 744 probe 744
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence744', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 45);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 744) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0745
     * @tc.name    DietStatePersistence745
     * @tc.desc    Diet clear entries 745 probe 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence745', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 46);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 745) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0746
     * @tc.name    DietStatePersistence746
     * @tc.desc    Diet clear entries 746 probe 746
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence746', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 47);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 746) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0747
     * @tc.name    DietStatePersistence747
     * @tc.desc    Diet clear entries 747 probe 747
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence747', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 48);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 747) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0748
     * @tc.name    DietStatePersistence748
     * @tc.desc    Diet clear entries 748 probe 748
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence748', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 49);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 748) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0749
     * @tc.name    DietStatePersistence749
     * @tc.desc    Diet clear entries 749 probe 749
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence749', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 50);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 749) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0750
     * @tc.name    DietStatePersistence750
     * @tc.desc    Diet clear entries 750 probe 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence750', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 51);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 750) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0751
     * @tc.name    DietStatePersistence751
     * @tc.desc    Diet clear entries 751 probe 751
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence751', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 52);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 751) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0752
     * @tc.name    DietStatePersistence752
     * @tc.desc    Diet clear entries 752 probe 752
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence752', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 53);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 752) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0753
     * @tc.name    DietStatePersistence753
     * @tc.desc    Diet clear entries 753 probe 753
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence753', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 54);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 753) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0754
     * @tc.name    DietStatePersistence754
     * @tc.desc    Diet clear entries 754 probe 754
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence754', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 55);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 754) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0755
     * @tc.name    DietStatePersistence755
     * @tc.desc    Diet clear entries 755 probe 755
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence755', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 56);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 755) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0756
     * @tc.name    DietStatePersistence756
     * @tc.desc    Diet clear entries 756 probe 756
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence756', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 57);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 756) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0757
     * @tc.name    DietStatePersistence757
     * @tc.desc    Diet clear entries 757 probe 757
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence757', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 58);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 757) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0758
     * @tc.name    DietStatePersistence758
     * @tc.desc    Diet clear entries 758 probe 758
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence758', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 59);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 758) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0759
     * @tc.name    DietStatePersistence759
     * @tc.desc    Diet clear entries 759 probe 759
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence759', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 60);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 759) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0760
     * @tc.name    DietStatePersistence760
     * @tc.desc    Diet clear entries 760 probe 760
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence760', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 61);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 760) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0761
     * @tc.name    DietStatePersistence761
     * @tc.desc    Diet clear entries 761 probe 761
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence761', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 62);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 761) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0762
     * @tc.name    DietStatePersistence762
     * @tc.desc    Diet clear entries 762 probe 762
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence762', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 63);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 762) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0763
     * @tc.name    DietStatePersistence763
     * @tc.desc    Diet clear entries 763 probe 763
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence763', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 64);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 763) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0764
     * @tc.name    DietStatePersistence764
     * @tc.desc    Diet clear entries 764 probe 764
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence764', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 65);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 764) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0765
     * @tc.name    DietStatePersistence765
     * @tc.desc    Diet clear entries 765 probe 765
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence765', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 66);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 765) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0766
     * @tc.name    DietStatePersistence766
     * @tc.desc    Diet clear entries 766 probe 766
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence766', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 67);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 766) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0767
     * @tc.name    DietStatePersistence767
     * @tc.desc    Diet clear entries 767 probe 767
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence767', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 68);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 767) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0768
     * @tc.name    DietStatePersistence768
     * @tc.desc    Diet clear entries 768 probe 768
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence768', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 69);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 768) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0769
     * @tc.name    DietStatePersistence769
     * @tc.desc    Diet clear entries 769 probe 769
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence769', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 70);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 769) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0770
     * @tc.name    DietStatePersistence770
     * @tc.desc    Diet clear entries 770 probe 770
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence770', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 71);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 770) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0771
     * @tc.name    DietStatePersistence771
     * @tc.desc    Diet clear entries 771 probe 771
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence771', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 72);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 771) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0772
     * @tc.name    DietStatePersistence772
     * @tc.desc    Diet clear entries 772 probe 772
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence772', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 73);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 772) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0773
     * @tc.name    DietStatePersistence773
     * @tc.desc    Diet clear entries 773 probe 773
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence773', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 74);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 773) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0774
     * @tc.name    DietStatePersistence774
     * @tc.desc    Diet clear entries 774 probe 774
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence774', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 75);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 774) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0775
     * @tc.name    DietStatePersistence775
     * @tc.desc    Diet clear entries 775 probe 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence775', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 76);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 775) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0776
     * @tc.name    DietStatePersistence776
     * @tc.desc    Diet clear entries 776 probe 776
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence776', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 77);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 776) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0777
     * @tc.name    DietStatePersistence777
     * @tc.desc    Diet clear entries 777 probe 777
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence777', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 78);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 777) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0778
     * @tc.name    DietStatePersistence778
     * @tc.desc    Diet clear entries 778 probe 778
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence778', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 79);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 778) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0779
     * @tc.name    DietStatePersistence779
     * @tc.desc    Diet clear entries 779 probe 779
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence779', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 80);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 779) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0780
     * @tc.name    DietStatePersistence780
     * @tc.desc    Diet clear entries 780 probe 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence780', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 81);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 780) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0781
     * @tc.name    DietStatePersistence781
     * @tc.desc    Diet clear entries 781 probe 781
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence781', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 82);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 781) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0782
     * @tc.name    DietStatePersistence782
     * @tc.desc    Diet clear entries 782 probe 782
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence782', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 83);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 782) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0783
     * @tc.name    DietStatePersistence783
     * @tc.desc    Diet clear entries 783 probe 783
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence783', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 84);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 783) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0784
     * @tc.name    DietStatePersistence784
     * @tc.desc    Diet clear entries 784 probe 784
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence784', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 85);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 784) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0785
     * @tc.name    DietStatePersistence785
     * @tc.desc    Diet clear entries 785 probe 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence785', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 86);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 785) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0786
     * @tc.name    DietStatePersistence786
     * @tc.desc    Diet clear entries 786 probe 786
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence786', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 87);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 786) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0787
     * @tc.name    DietStatePersistence787
     * @tc.desc    Diet clear entries 787 probe 787
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence787', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 88);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 787) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0788
     * @tc.name    DietStatePersistence788
     * @tc.desc    Diet clear entries 788 probe 788
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence788', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 89);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 788) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0789
     * @tc.name    DietStatePersistence789
     * @tc.desc    Diet clear entries 789 probe 789
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence789', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 90);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 789) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0790
     * @tc.name    DietStatePersistence790
     * @tc.desc    Diet clear entries 790 probe 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence790', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 91);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 790) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0791
     * @tc.name    DietStatePersistence791
     * @tc.desc    Diet clear entries 791 probe 791
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence791', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 92);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 791) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0792
     * @tc.name    DietStatePersistence792
     * @tc.desc    Diet clear entries 792 probe 792
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence792', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 93);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 792) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0793
     * @tc.name    DietStatePersistence793
     * @tc.desc    Diet clear entries 793 probe 793
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence793', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 94);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 793) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0794
     * @tc.name    DietStatePersistence794
     * @tc.desc    Diet clear entries 794 probe 794
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence794', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 95);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 794) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0795
     * @tc.name    DietStatePersistence795
     * @tc.desc    Diet clear entries 795 probe 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence795', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 96);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 795) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0796
     * @tc.name    DietStatePersistence796
     * @tc.desc    Diet clear entries 796 probe 796
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence796', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 97);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 796) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0797
     * @tc.name    DietStatePersistence797
     * @tc.desc    Diet clear entries 797 probe 797
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence797', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 98);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 797) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0798
     * @tc.name    DietStatePersistence798
     * @tc.desc    Diet clear entries 798 probe 798
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence798', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 99);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 798) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0799
     * @tc.name    DietStatePersistence799
     * @tc.desc    Diet clear entries 799 probe 799
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence799', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 100);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 799) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0800
     * @tc.name    DietStatePersistence800
     * @tc.desc    Diet clear entries 800 probe 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence800', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 1);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 800) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0801
     * @tc.name    DietStatePersistence801
     * @tc.desc    Diet clear entries 801 probe 801
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence801', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 2);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 801) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0802
     * @tc.name    DietStatePersistence802
     * @tc.desc    Diet clear entries 802 probe 802
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence802', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 3);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 802) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0803
     * @tc.name    DietStatePersistence803
     * @tc.desc    Diet clear entries 803 probe 803
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence803', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 4);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 803) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0804
     * @tc.name    DietStatePersistence804
     * @tc.desc    Diet clear entries 804 probe 804
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence804', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 5);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 804) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0805
     * @tc.name    DietStatePersistence805
     * @tc.desc    Diet clear entries 805 probe 805
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence805', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 6);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 805) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0806
     * @tc.name    DietStatePersistence806
     * @tc.desc    Diet clear entries 806 probe 806
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietStatePersistence806', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 7);
      m.clearEntries();
      expect(m.getEntryCount()).assertEqual(0);
      expect(m.isEmptyStatistics()).assertEqual(true);
      expect(m.getFoodById(1000 + 806) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

