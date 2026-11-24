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

export default function dietVisualEffectsSuite() {
  describe('DietVisualEffectsSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0589
     * @tc.name    DietVisualEffects589
     * @tc.desc    Diet statistics after entries 589 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 190);
      m.addEntry(2, 3, 141);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 589) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0590
     * @tc.name    DietVisualEffects590
     * @tc.desc    Diet statistics after entries 590 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 191);
      m.addEntry(3, 0, 142);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 590) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0591
     * @tc.name    DietVisualEffects591
     * @tc.desc    Diet statistics after entries 591 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 192);
      m.addEntry(4, 1, 143);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 591) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0592
     * @tc.name    DietVisualEffects592
     * @tc.desc    Diet statistics after entries 592 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 193);
      m.addEntry(5, 2, 144);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 592) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0593
     * @tc.name    DietVisualEffects593
     * @tc.desc    Diet statistics after entries 593 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 194);
      m.addEntry(6, 3, 145);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 593) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0594
     * @tc.name    DietVisualEffects594
     * @tc.desc    Diet statistics after entries 594 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 195);
      m.addEntry(7, 0, 146);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 594) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0595
     * @tc.name    DietVisualEffects595
     * @tc.desc    Diet statistics after entries 595 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 196);
      m.addEntry(8, 1, 147);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 595) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0596
     * @tc.name    DietVisualEffects596
     * @tc.desc    Diet statistics after entries 596 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 197);
      m.addEntry(9, 2, 148);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 596) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0597
     * @tc.name    DietVisualEffects597
     * @tc.desc    Diet statistics after entries 597 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 198);
      m.addEntry(10, 3, 149);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 597) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0598
     * @tc.name    DietVisualEffects598
     * @tc.desc    Diet statistics after entries 598 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 199);
      m.addEntry(11, 0, 150);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 598) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0599
     * @tc.name    DietVisualEffects599
     * @tc.desc    Diet statistics after entries 599 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 200);
      m.addEntry(0, 1, 151);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 599) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0600
     * @tc.name    DietVisualEffects600
     * @tc.desc    Diet statistics after entries 600 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 1);
      m.addEntry(1, 2, 2);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 600) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0601
     * @tc.name    DietVisualEffects601
     * @tc.desc    Diet statistics after entries 601 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 2);
      m.addEntry(2, 3, 3);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 601) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0602
     * @tc.name    DietVisualEffects602
     * @tc.desc    Diet statistics after entries 602 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 3);
      m.addEntry(3, 0, 4);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 602) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0603
     * @tc.name    DietVisualEffects603
     * @tc.desc    Diet statistics after entries 603 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 4);
      m.addEntry(4, 1, 5);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 603) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0604
     * @tc.name    DietVisualEffects604
     * @tc.desc    Diet statistics after entries 604 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 5);
      m.addEntry(5, 2, 6);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 604) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0605
     * @tc.name    DietVisualEffects605
     * @tc.desc    Diet statistics after entries 605 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 6);
      m.addEntry(6, 3, 7);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 605) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0606
     * @tc.name    DietVisualEffects606
     * @tc.desc    Diet statistics after entries 606 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 7);
      m.addEntry(7, 0, 8);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 606) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0607
     * @tc.name    DietVisualEffects607
     * @tc.desc    Diet statistics after entries 607 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 8);
      m.addEntry(8, 1, 9);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 607) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0608
     * @tc.name    DietVisualEffects608
     * @tc.desc    Diet statistics after entries 608 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 9);
      m.addEntry(9, 2, 10);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 608) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0609
     * @tc.name    DietVisualEffects609
     * @tc.desc    Diet statistics after entries 609 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 10);
      m.addEntry(10, 3, 11);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 609) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0610
     * @tc.name    DietVisualEffects610
     * @tc.desc    Diet statistics after entries 610 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 11);
      m.addEntry(11, 0, 12);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 610) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0611
     * @tc.name    DietVisualEffects611
     * @tc.desc    Diet statistics after entries 611 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects611', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 12);
      m.addEntry(0, 1, 13);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 611) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0612
     * @tc.name    DietVisualEffects612
     * @tc.desc    Diet statistics after entries 612 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects612', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 13);
      m.addEntry(1, 2, 14);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 612) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0613
     * @tc.name    DietVisualEffects613
     * @tc.desc    Diet statistics after entries 613 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects613', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 14);
      m.addEntry(2, 3, 15);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 613) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0614
     * @tc.name    DietVisualEffects614
     * @tc.desc    Diet statistics after entries 614 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects614', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 15);
      m.addEntry(3, 0, 16);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 614) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0615
     * @tc.name    DietVisualEffects615
     * @tc.desc    Diet statistics after entries 615 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects615', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 16);
      m.addEntry(4, 1, 17);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 615) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0616
     * @tc.name    DietVisualEffects616
     * @tc.desc    Diet statistics after entries 616 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects616', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 17);
      m.addEntry(5, 2, 18);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 616) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0617
     * @tc.name    DietVisualEffects617
     * @tc.desc    Diet statistics after entries 617 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects617', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 18);
      m.addEntry(6, 3, 19);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 617) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0618
     * @tc.name    DietVisualEffects618
     * @tc.desc    Diet statistics after entries 618 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects618', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 19);
      m.addEntry(7, 0, 20);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 618) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0619
     * @tc.name    DietVisualEffects619
     * @tc.desc    Diet statistics after entries 619 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects619', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 20);
      m.addEntry(8, 1, 21);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 619) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0620
     * @tc.name    DietVisualEffects620
     * @tc.desc    Diet statistics after entries 620 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects620', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 21);
      m.addEntry(9, 2, 22);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 620) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0621
     * @tc.name    DietVisualEffects621
     * @tc.desc    Diet statistics after entries 621 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects621', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 22);
      m.addEntry(10, 3, 23);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 621) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0622
     * @tc.name    DietVisualEffects622
     * @tc.desc    Diet statistics after entries 622 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects622', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 23);
      m.addEntry(11, 0, 24);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 622) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0623
     * @tc.name    DietVisualEffects623
     * @tc.desc    Diet statistics after entries 623 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects623', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 24);
      m.addEntry(0, 1, 25);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 623) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0624
     * @tc.name    DietVisualEffects624
     * @tc.desc    Diet statistics after entries 624 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects624', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 25);
      m.addEntry(1, 2, 26);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 624) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0625
     * @tc.name    DietVisualEffects625
     * @tc.desc    Diet statistics after entries 625 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects625', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 26);
      m.addEntry(2, 3, 27);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 625) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0626
     * @tc.name    DietVisualEffects626
     * @tc.desc    Diet statistics after entries 626 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects626', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 27);
      m.addEntry(3, 0, 28);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 626) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0627
     * @tc.name    DietVisualEffects627
     * @tc.desc    Diet statistics after entries 627 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects627', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 28);
      m.addEntry(4, 1, 29);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 627) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0628
     * @tc.name    DietVisualEffects628
     * @tc.desc    Diet statistics after entries 628 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects628', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 29);
      m.addEntry(5, 2, 30);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 628) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0629
     * @tc.name    DietVisualEffects629
     * @tc.desc    Diet statistics after entries 629 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects629', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 30);
      m.addEntry(6, 3, 31);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 629) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0630
     * @tc.name    DietVisualEffects630
     * @tc.desc    Diet statistics after entries 630 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects630', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 31);
      m.addEntry(7, 0, 32);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 630) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0631
     * @tc.name    DietVisualEffects631
     * @tc.desc    Diet statistics after entries 631 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects631', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 32);
      m.addEntry(8, 1, 33);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 631) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0632
     * @tc.name    DietVisualEffects632
     * @tc.desc    Diet statistics after entries 632 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects632', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 33);
      m.addEntry(9, 2, 34);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 632) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0633
     * @tc.name    DietVisualEffects633
     * @tc.desc    Diet statistics after entries 633 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects633', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 34);
      m.addEntry(10, 3, 35);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 633) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0634
     * @tc.name    DietVisualEffects634
     * @tc.desc    Diet statistics after entries 634 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects634', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 35);
      m.addEntry(11, 0, 36);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 634) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0635
     * @tc.name    DietVisualEffects635
     * @tc.desc    Diet statistics after entries 635 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects635', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 36);
      m.addEntry(0, 1, 37);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 635) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0636
     * @tc.name    DietVisualEffects636
     * @tc.desc    Diet statistics after entries 636 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects636', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 37);
      m.addEntry(1, 2, 38);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 636) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0637
     * @tc.name    DietVisualEffects637
     * @tc.desc    Diet statistics after entries 637 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects637', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 38);
      m.addEntry(2, 3, 39);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 637) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0638
     * @tc.name    DietVisualEffects638
     * @tc.desc    Diet statistics after entries 638 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects638', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 39);
      m.addEntry(3, 0, 40);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 638) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0639
     * @tc.name    DietVisualEffects639
     * @tc.desc    Diet statistics after entries 639 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects639', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 40);
      m.addEntry(4, 1, 41);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 639) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0640
     * @tc.name    DietVisualEffects640
     * @tc.desc    Diet statistics after entries 640 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects640', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 41);
      m.addEntry(5, 2, 42);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 640) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0641
     * @tc.name    DietVisualEffects641
     * @tc.desc    Diet statistics after entries 641 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects641', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 42);
      m.addEntry(6, 3, 43);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 641) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0642
     * @tc.name    DietVisualEffects642
     * @tc.desc    Diet statistics after entries 642 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects642', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 43);
      m.addEntry(7, 0, 44);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 642) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0643
     * @tc.name    DietVisualEffects643
     * @tc.desc    Diet statistics after entries 643 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects643', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 44);
      m.addEntry(8, 1, 45);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 643) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0644
     * @tc.name    DietVisualEffects644
     * @tc.desc    Diet statistics after entries 644 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects644', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 45);
      m.addEntry(9, 2, 46);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 644) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0645
     * @tc.name    DietVisualEffects645
     * @tc.desc    Diet statistics after entries 645 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects645', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 46);
      m.addEntry(10, 3, 47);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 645) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0646
     * @tc.name    DietVisualEffects646
     * @tc.desc    Diet statistics after entries 646 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects646', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 47);
      m.addEntry(11, 0, 48);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 646) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0647
     * @tc.name    DietVisualEffects647
     * @tc.desc    Diet statistics after entries 647 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects647', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 48);
      m.addEntry(0, 1, 49);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 647) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0648
     * @tc.name    DietVisualEffects648
     * @tc.desc    Diet statistics after entries 648 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects648', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 49);
      m.addEntry(1, 2, 50);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 648) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0649
     * @tc.name    DietVisualEffects649
     * @tc.desc    Diet statistics after entries 649 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects649', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 50);
      m.addEntry(2, 3, 51);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 649) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0650
     * @tc.name    DietVisualEffects650
     * @tc.desc    Diet statistics after entries 650 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects650', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 51);
      m.addEntry(3, 0, 52);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 650) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0651
     * @tc.name    DietVisualEffects651
     * @tc.desc    Diet statistics after entries 651 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects651', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 52);
      m.addEntry(4, 1, 53);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 651) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0652
     * @tc.name    DietVisualEffects652
     * @tc.desc    Diet statistics after entries 652 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects652', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 53);
      m.addEntry(5, 2, 54);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 652) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0653
     * @tc.name    DietVisualEffects653
     * @tc.desc    Diet statistics after entries 653 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects653', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 54);
      m.addEntry(6, 3, 55);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 653) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0654
     * @tc.name    DietVisualEffects654
     * @tc.desc    Diet statistics after entries 654 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects654', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 55);
      m.addEntry(7, 0, 56);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 654) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0655
     * @tc.name    DietVisualEffects655
     * @tc.desc    Diet statistics after entries 655 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects655', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 56);
      m.addEntry(8, 1, 57);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 655) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0656
     * @tc.name    DietVisualEffects656
     * @tc.desc    Diet statistics after entries 656 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects656', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 57);
      m.addEntry(9, 2, 58);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 656) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0657
     * @tc.name    DietVisualEffects657
     * @tc.desc    Diet statistics after entries 657 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects657', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 58);
      m.addEntry(10, 3, 59);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 657) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0658
     * @tc.name    DietVisualEffects658
     * @tc.desc    Diet statistics after entries 658 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects658', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 59);
      m.addEntry(11, 0, 60);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 658) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0659
     * @tc.name    DietVisualEffects659
     * @tc.desc    Diet statistics after entries 659 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects659', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 60);
      m.addEntry(0, 1, 61);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 659) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0660
     * @tc.name    DietVisualEffects660
     * @tc.desc    Diet statistics after entries 660 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects660', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 61);
      m.addEntry(1, 2, 62);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 660) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0661
     * @tc.name    DietVisualEffects661
     * @tc.desc    Diet statistics after entries 661 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects661', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 62);
      m.addEntry(2, 3, 63);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 661) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0662
     * @tc.name    DietVisualEffects662
     * @tc.desc    Diet statistics after entries 662 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects662', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 63);
      m.addEntry(3, 0, 64);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 662) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0663
     * @tc.name    DietVisualEffects663
     * @tc.desc    Diet statistics after entries 663 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects663', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 64);
      m.addEntry(4, 1, 65);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 663) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0664
     * @tc.name    DietVisualEffects664
     * @tc.desc    Diet statistics after entries 664 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects664', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 65);
      m.addEntry(5, 2, 66);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 664) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0665
     * @tc.name    DietVisualEffects665
     * @tc.desc    Diet statistics after entries 665 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects665', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 66);
      m.addEntry(6, 3, 67);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 665) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0666
     * @tc.name    DietVisualEffects666
     * @tc.desc    Diet statistics after entries 666 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects666', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 67);
      m.addEntry(7, 0, 68);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 666) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0667
     * @tc.name    DietVisualEffects667
     * @tc.desc    Diet statistics after entries 667 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects667', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 68);
      m.addEntry(8, 1, 69);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 667) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0668
     * @tc.name    DietVisualEffects668
     * @tc.desc    Diet statistics after entries 668 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects668', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 69);
      m.addEntry(9, 2, 70);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 668) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0669
     * @tc.name    DietVisualEffects669
     * @tc.desc    Diet statistics after entries 669 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects669', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 70);
      m.addEntry(10, 3, 71);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 669) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0670
     * @tc.name    DietVisualEffects670
     * @tc.desc    Diet statistics after entries 670 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects670', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 71);
      m.addEntry(11, 0, 72);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 670) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0671
     * @tc.name    DietVisualEffects671
     * @tc.desc    Diet statistics after entries 671 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects671', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 72);
      m.addEntry(0, 1, 73);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 671) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0672
     * @tc.name    DietVisualEffects672
     * @tc.desc    Diet statistics after entries 672 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects672', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 73);
      m.addEntry(1, 2, 74);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 672) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0673
     * @tc.name    DietVisualEffects673
     * @tc.desc    Diet statistics after entries 673 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects673', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 74);
      m.addEntry(2, 3, 75);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 673) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0674
     * @tc.name    DietVisualEffects674
     * @tc.desc    Diet statistics after entries 674 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects674', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 75);
      m.addEntry(3, 0, 76);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 674) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0675
     * @tc.name    DietVisualEffects675
     * @tc.desc    Diet statistics after entries 675 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects675', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 76);
      m.addEntry(4, 1, 77);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 675) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0676
     * @tc.name    DietVisualEffects676
     * @tc.desc    Diet statistics after entries 676 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects676', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 77);
      m.addEntry(5, 2, 78);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 676) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0677
     * @tc.name    DietVisualEffects677
     * @tc.desc    Diet statistics after entries 677 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects677', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 78);
      m.addEntry(6, 3, 79);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 677) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0678
     * @tc.name    DietVisualEffects678
     * @tc.desc    Diet statistics after entries 678 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects678', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 79);
      m.addEntry(7, 0, 80);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 678) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0679
     * @tc.name    DietVisualEffects679
     * @tc.desc    Diet statistics after entries 679 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects679', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 80);
      m.addEntry(8, 1, 81);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 679) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0680
     * @tc.name    DietVisualEffects680
     * @tc.desc    Diet statistics after entries 680 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects680', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 81);
      m.addEntry(9, 2, 82);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 680) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0681
     * @tc.name    DietVisualEffects681
     * @tc.desc    Diet statistics after entries 681 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects681', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 82);
      m.addEntry(10, 3, 83);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 681) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0682
     * @tc.name    DietVisualEffects682
     * @tc.desc    Diet statistics after entries 682 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects682', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 83);
      m.addEntry(11, 0, 84);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 682) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0683
     * @tc.name    DietVisualEffects683
     * @tc.desc    Diet statistics after entries 683 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects683', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 84);
      m.addEntry(0, 1, 85);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 683) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0684
     * @tc.name    DietVisualEffects684
     * @tc.desc    Diet statistics after entries 684 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects684', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 85);
      m.addEntry(1, 2, 86);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 684) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0685
     * @tc.name    DietVisualEffects685
     * @tc.desc    Diet statistics after entries 685 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects685', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 86);
      m.addEntry(2, 3, 87);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 685) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0686
     * @tc.name    DietVisualEffects686
     * @tc.desc    Diet statistics after entries 686 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects686', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 87);
      m.addEntry(3, 0, 88);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 686) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0687
     * @tc.name    DietVisualEffects687
     * @tc.desc    Diet statistics after entries 687 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects687', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 88);
      m.addEntry(4, 1, 89);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 687) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0688
     * @tc.name    DietVisualEffects688
     * @tc.desc    Diet statistics after entries 688 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects688', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 89);
      m.addEntry(5, 2, 90);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 688) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0689
     * @tc.name    DietVisualEffects689
     * @tc.desc    Diet statistics after entries 689 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects689', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 90);
      m.addEntry(6, 3, 91);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 689) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0690
     * @tc.name    DietVisualEffects690
     * @tc.desc    Diet statistics after entries 690 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects690', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 91);
      m.addEntry(7, 0, 92);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 690) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0691
     * @tc.name    DietVisualEffects691
     * @tc.desc    Diet statistics after entries 691 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects691', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 92);
      m.addEntry(8, 1, 93);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 691) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0692
     * @tc.name    DietVisualEffects692
     * @tc.desc    Diet statistics after entries 692 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects692', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 93);
      m.addEntry(9, 2, 94);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 692) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0693
     * @tc.name    DietVisualEffects693
     * @tc.desc    Diet statistics after entries 693 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects693', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 94);
      m.addEntry(10, 3, 95);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 693) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0694
     * @tc.name    DietVisualEffects694
     * @tc.desc    Diet statistics after entries 694 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 95);
      m.addEntry(11, 0, 96);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 694) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0695
     * @tc.name    DietVisualEffects695
     * @tc.desc    Diet statistics after entries 695 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 96);
      m.addEntry(0, 1, 97);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 695) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0696
     * @tc.name    DietVisualEffects696
     * @tc.desc    Diet statistics after entries 696 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 97);
      m.addEntry(1, 2, 98);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 696) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0697
     * @tc.name    DietVisualEffects697
     * @tc.desc    Diet statistics after entries 697 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 98);
      m.addEntry(2, 3, 99);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 697) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0698
     * @tc.name    DietVisualEffects698
     * @tc.desc    Diet statistics after entries 698 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 99);
      m.addEntry(3, 0, 100);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 698) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0699
     * @tc.name    DietVisualEffects699
     * @tc.desc    Diet statistics after entries 699 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 100);
      m.addEntry(4, 1, 101);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 699) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0700
     * @tc.name    DietVisualEffects700
     * @tc.desc    Diet statistics after entries 700 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 101);
      m.addEntry(5, 2, 102);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 700) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0701
     * @tc.name    DietVisualEffects701
     * @tc.desc    Diet statistics after entries 701 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 102);
      m.addEntry(6, 3, 103);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 701) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0702
     * @tc.name    DietVisualEffects702
     * @tc.desc    Diet statistics after entries 702 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 103);
      m.addEntry(7, 0, 104);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 702) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0703
     * @tc.name    DietVisualEffects703
     * @tc.desc    Diet statistics after entries 703 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 104);
      m.addEntry(8, 1, 105);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 703) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0704
     * @tc.name    DietVisualEffects704
     * @tc.desc    Diet statistics after entries 704 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 105);
      m.addEntry(9, 2, 106);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 704) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0705
     * @tc.name    DietVisualEffects705
     * @tc.desc    Diet statistics after entries 705 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 106);
      m.addEntry(10, 3, 107);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 705) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0706
     * @tc.name    DietVisualEffects706
     * @tc.desc    Diet statistics after entries 706 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 107);
      m.addEntry(11, 0, 108);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 706) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0707
     * @tc.name    DietVisualEffects707
     * @tc.desc    Diet statistics after entries 707 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 108);
      m.addEntry(0, 1, 109);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 707) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0708
     * @tc.name    DietVisualEffects708
     * @tc.desc    Diet statistics after entries 708 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 109);
      m.addEntry(1, 2, 110);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 708) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0709
     * @tc.name    DietVisualEffects709
     * @tc.desc    Diet statistics after entries 709 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 110);
      m.addEntry(2, 3, 111);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 709) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0710
     * @tc.name    DietVisualEffects710
     * @tc.desc    Diet statistics after entries 710 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 111);
      m.addEntry(3, 0, 112);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 710) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0711
     * @tc.name    DietVisualEffects711
     * @tc.desc    Diet statistics after entries 711 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 112);
      m.addEntry(4, 1, 113);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 711) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0712
     * @tc.name    DietVisualEffects712
     * @tc.desc    Diet statistics after entries 712 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 113);
      m.addEntry(5, 2, 114);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 712) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0713
     * @tc.name    DietVisualEffects713
     * @tc.desc    Diet statistics after entries 713 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 114);
      m.addEntry(6, 3, 115);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 713) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0714
     * @tc.name    DietVisualEffects714
     * @tc.desc    Diet statistics after entries 714 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 115);
      m.addEntry(7, 0, 116);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 714) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0715
     * @tc.name    DietVisualEffects715
     * @tc.desc    Diet statistics after entries 715 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 116);
      m.addEntry(8, 1, 117);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 715) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0716
     * @tc.name    DietVisualEffects716
     * @tc.desc    Diet statistics after entries 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 117);
      m.addEntry(9, 2, 118);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 716) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0717
     * @tc.name    DietVisualEffects717
     * @tc.desc    Diet statistics after entries 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 118);
      m.addEntry(10, 3, 119);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 717) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0718
     * @tc.name    DietVisualEffects718
     * @tc.desc    Diet statistics after entries 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 119);
      m.addEntry(11, 0, 120);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 718) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0719
     * @tc.name    DietVisualEffects719
     * @tc.desc    Diet statistics after entries 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 120);
      m.addEntry(0, 1, 121);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 719) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0720
     * @tc.name    DietVisualEffects720
     * @tc.desc    Diet statistics after entries 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 121);
      m.addEntry(1, 2, 122);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 720) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0721
     * @tc.name    DietVisualEffects721
     * @tc.desc    Diet statistics after entries 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 122);
      m.addEntry(2, 3, 123);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 721) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0722
     * @tc.name    DietVisualEffects722
     * @tc.desc    Diet statistics after entries 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 123);
      m.addEntry(3, 0, 124);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 722) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0723
     * @tc.name    DietVisualEffects723
     * @tc.desc    Diet statistics after entries 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 124);
      m.addEntry(4, 1, 125);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 723) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0724
     * @tc.name    DietVisualEffects724
     * @tc.desc    Diet statistics after entries 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 125);
      m.addEntry(5, 2, 126);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 724) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0725
     * @tc.name    DietVisualEffects725
     * @tc.desc    Diet statistics after entries 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 126);
      m.addEntry(6, 3, 127);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 725) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0726
     * @tc.name    DietVisualEffects726
     * @tc.desc    Diet statistics after entries 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 127);
      m.addEntry(7, 0, 128);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 726) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0727
     * @tc.name    DietVisualEffects727
     * @tc.desc    Diet statistics after entries 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 128);
      m.addEntry(8, 1, 129);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 727) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0728
     * @tc.name    DietVisualEffects728
     * @tc.desc    Diet statistics after entries 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 129);
      m.addEntry(9, 2, 130);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 728) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0729
     * @tc.name    DietVisualEffects729
     * @tc.desc    Diet statistics after entries 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 130);
      m.addEntry(10, 3, 131);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 729) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0730
     * @tc.name    DietVisualEffects730
     * @tc.desc    Diet statistics after entries 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 131);
      m.addEntry(11, 0, 132);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 730) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0731
     * @tc.name    DietVisualEffects731
     * @tc.desc    Diet statistics after entries 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 132);
      m.addEntry(0, 1, 133);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 731) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0732
     * @tc.name    DietVisualEffects732
     * @tc.desc    Diet statistics after entries 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 133);
      m.addEntry(1, 2, 134);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 732) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0733
     * @tc.name    DietVisualEffects733
     * @tc.desc    Diet statistics after entries 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 134);
      m.addEntry(2, 3, 135);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 733) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0734
     * @tc.name    DietVisualEffects734
     * @tc.desc    Diet statistics after entries 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 135);
      m.addEntry(3, 0, 136);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 734) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0735
     * @tc.name    DietVisualEffects735
     * @tc.desc    Diet statistics after entries 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 136);
      m.addEntry(4, 1, 137);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 735) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0736
     * @tc.name    DietVisualEffects736
     * @tc.desc    Diet statistics after entries 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 137);
      m.addEntry(5, 2, 138);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 736) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0737
     * @tc.name    DietVisualEffects737
     * @tc.desc    Diet statistics after entries 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 138);
      m.addEntry(6, 3, 139);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 737) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0738
     * @tc.name    DietVisualEffects738
     * @tc.desc    Diet statistics after entries 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 139);
      m.addEntry(7, 0, 140);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 738) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0739
     * @tc.name    DietVisualEffects739
     * @tc.desc    Diet statistics after entries 739 probe 739
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects739', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 140);
      m.addEntry(8, 1, 141);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 739) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0740
     * @tc.name    DietVisualEffects740
     * @tc.desc    Diet statistics after entries 740 probe 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietVisualEffects740', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 141);
      m.addEntry(9, 2, 142);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 740) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

