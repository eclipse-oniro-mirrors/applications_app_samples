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

export default function dietPositioningSuite() {
  describe('DietPositioningSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0523
     * @tc.name    DietPositioning523
     * @tc.desc    Diet statistics after entries 523 probe 523
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning523', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 124);
      m.addEntry(8, 1, 75);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 523) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0524
     * @tc.name    DietPositioning524
     * @tc.desc    Diet statistics after entries 524 probe 524
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning524', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 125);
      m.addEntry(9, 2, 76);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 524) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0525
     * @tc.name    DietPositioning525
     * @tc.desc    Diet statistics after entries 525 probe 525
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning525', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 126);
      m.addEntry(10, 3, 77);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 525) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0526
     * @tc.name    DietPositioning526
     * @tc.desc    Diet statistics after entries 526 probe 526
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning526', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 127);
      m.addEntry(11, 0, 78);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 526) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0527
     * @tc.name    DietPositioning527
     * @tc.desc    Diet statistics after entries 527 probe 527
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning527', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 128);
      m.addEntry(0, 1, 79);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 527) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0528
     * @tc.name    DietPositioning528
     * @tc.desc    Diet statistics after entries 528 probe 528
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning528', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 129);
      m.addEntry(1, 2, 80);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 528) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0529
     * @tc.name    DietPositioning529
     * @tc.desc    Diet statistics after entries 529 probe 529
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning529', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 130);
      m.addEntry(2, 3, 81);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 529) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0530
     * @tc.name    DietPositioning530
     * @tc.desc    Diet statistics after entries 530 probe 530
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning530', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 131);
      m.addEntry(3, 0, 82);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 530) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0531
     * @tc.name    DietPositioning531
     * @tc.desc    Diet statistics after entries 531 probe 531
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning531', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 132);
      m.addEntry(4, 1, 83);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 531) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0532
     * @tc.name    DietPositioning532
     * @tc.desc    Diet statistics after entries 532 probe 532
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning532', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 133);
      m.addEntry(5, 2, 84);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 532) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0533
     * @tc.name    DietPositioning533
     * @tc.desc    Diet statistics after entries 533 probe 533
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning533', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 134);
      m.addEntry(6, 3, 85);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 533) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0534
     * @tc.name    DietPositioning534
     * @tc.desc    Diet statistics after entries 534 probe 534
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning534', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 135);
      m.addEntry(7, 0, 86);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 534) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0535
     * @tc.name    DietPositioning535
     * @tc.desc    Diet statistics after entries 535 probe 535
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning535', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 136);
      m.addEntry(8, 1, 87);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 535) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0536
     * @tc.name    DietPositioning536
     * @tc.desc    Diet statistics after entries 536 probe 536
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning536', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 137);
      m.addEntry(9, 2, 88);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 536) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0537
     * @tc.name    DietPositioning537
     * @tc.desc    Diet statistics after entries 537 probe 537
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning537', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 138);
      m.addEntry(10, 3, 89);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 537) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0538
     * @tc.name    DietPositioning538
     * @tc.desc    Diet statistics after entries 538 probe 538
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning538', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 139);
      m.addEntry(11, 0, 90);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 538) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0539
     * @tc.name    DietPositioning539
     * @tc.desc    Diet statistics after entries 539 probe 539
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning539', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 140);
      m.addEntry(0, 1, 91);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 539) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0540
     * @tc.name    DietPositioning540
     * @tc.desc    Diet statistics after entries 540 probe 540
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning540', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 141);
      m.addEntry(1, 2, 92);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 540) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0541
     * @tc.name    DietPositioning541
     * @tc.desc    Diet statistics after entries 541 probe 541
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning541', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 142);
      m.addEntry(2, 3, 93);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 541) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0542
     * @tc.name    DietPositioning542
     * @tc.desc    Diet statistics after entries 542 probe 542
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning542', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 143);
      m.addEntry(3, 0, 94);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 542) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0543
     * @tc.name    DietPositioning543
     * @tc.desc    Diet statistics after entries 543 probe 543
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning543', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 144);
      m.addEntry(4, 1, 95);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 543) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0544
     * @tc.name    DietPositioning544
     * @tc.desc    Diet statistics after entries 544 probe 544
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning544', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 145);
      m.addEntry(5, 2, 96);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 544) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0545
     * @tc.name    DietPositioning545
     * @tc.desc    Diet statistics after entries 545 probe 545
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning545', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 146);
      m.addEntry(6, 3, 97);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 545) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0546
     * @tc.name    DietPositioning546
     * @tc.desc    Diet statistics after entries 546 probe 546
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning546', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 147);
      m.addEntry(7, 0, 98);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 546) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0547
     * @tc.name    DietPositioning547
     * @tc.desc    Diet statistics after entries 547 probe 547
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning547', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 148);
      m.addEntry(8, 1, 99);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 547) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0548
     * @tc.name    DietPositioning548
     * @tc.desc    Diet statistics after entries 548 probe 548
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning548', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 149);
      m.addEntry(9, 2, 100);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 548) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0549
     * @tc.name    DietPositioning549
     * @tc.desc    Diet statistics after entries 549 probe 549
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning549', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 150);
      m.addEntry(10, 3, 101);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 549) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0550
     * @tc.name    DietPositioning550
     * @tc.desc    Diet statistics after entries 550 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 151);
      m.addEntry(11, 0, 102);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 550) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0551
     * @tc.name    DietPositioning551
     * @tc.desc    Diet statistics after entries 551 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 152);
      m.addEntry(0, 1, 103);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 551) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0552
     * @tc.name    DietPositioning552
     * @tc.desc    Diet statistics after entries 552 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 153);
      m.addEntry(1, 2, 104);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 552) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0553
     * @tc.name    DietPositioning553
     * @tc.desc    Diet statistics after entries 553 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 154);
      m.addEntry(2, 3, 105);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 553) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0554
     * @tc.name    DietPositioning554
     * @tc.desc    Diet statistics after entries 554 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 155);
      m.addEntry(3, 0, 106);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 554) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0555
     * @tc.name    DietPositioning555
     * @tc.desc    Diet statistics after entries 555 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 156);
      m.addEntry(4, 1, 107);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 555) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0556
     * @tc.name    DietPositioning556
     * @tc.desc    Diet statistics after entries 556 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 157);
      m.addEntry(5, 2, 108);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 556) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0557
     * @tc.name    DietPositioning557
     * @tc.desc    Diet statistics after entries 557 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 158);
      m.addEntry(6, 3, 109);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 557) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0558
     * @tc.name    DietPositioning558
     * @tc.desc    Diet statistics after entries 558 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 159);
      m.addEntry(7, 0, 110);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 558) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0559
     * @tc.name    DietPositioning559
     * @tc.desc    Diet statistics after entries 559 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 160);
      m.addEntry(8, 1, 111);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 559) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0560
     * @tc.name    DietPositioning560
     * @tc.desc    Diet statistics after entries 560 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 161);
      m.addEntry(9, 2, 112);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 560) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0561
     * @tc.name    DietPositioning561
     * @tc.desc    Diet statistics after entries 561 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 162);
      m.addEntry(10, 3, 113);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 561) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0562
     * @tc.name    DietPositioning562
     * @tc.desc    Diet statistics after entries 562 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 163);
      m.addEntry(11, 0, 114);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 562) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0563
     * @tc.name    DietPositioning563
     * @tc.desc    Diet statistics after entries 563 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 164);
      m.addEntry(0, 1, 115);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 563) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0564
     * @tc.name    DietPositioning564
     * @tc.desc    Diet statistics after entries 564 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 165);
      m.addEntry(1, 2, 116);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 564) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0565
     * @tc.name    DietPositioning565
     * @tc.desc    Diet statistics after entries 565 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 166);
      m.addEntry(2, 3, 117);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 565) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0566
     * @tc.name    DietPositioning566
     * @tc.desc    Diet statistics after entries 566 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 167);
      m.addEntry(3, 0, 118);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 566) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0567
     * @tc.name    DietPositioning567
     * @tc.desc    Diet statistics after entries 567 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 168);
      m.addEntry(4, 1, 119);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 567) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0568
     * @tc.name    DietPositioning568
     * @tc.desc    Diet statistics after entries 568 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 169);
      m.addEntry(5, 2, 120);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 568) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0569
     * @tc.name    DietPositioning569
     * @tc.desc    Diet statistics after entries 569 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 170);
      m.addEntry(6, 3, 121);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 569) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0570
     * @tc.name    DietPositioning570
     * @tc.desc    Diet statistics after entries 570 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 171);
      m.addEntry(7, 0, 122);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 570) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0571
     * @tc.name    DietPositioning571
     * @tc.desc    Diet statistics after entries 571 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 172);
      m.addEntry(8, 1, 123);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 571) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0572
     * @tc.name    DietPositioning572
     * @tc.desc    Diet statistics after entries 572 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 173);
      m.addEntry(9, 2, 124);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 572) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0573
     * @tc.name    DietPositioning573
     * @tc.desc    Diet statistics after entries 573 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 174);
      m.addEntry(10, 3, 125);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 573) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0574
     * @tc.name    DietPositioning574
     * @tc.desc    Diet statistics after entries 574 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 175);
      m.addEntry(11, 0, 126);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 574) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0575
     * @tc.name    DietPositioning575
     * @tc.desc    Diet statistics after entries 575 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 176);
      m.addEntry(0, 1, 127);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 575) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0576
     * @tc.name    DietPositioning576
     * @tc.desc    Diet statistics after entries 576 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 177);
      m.addEntry(1, 2, 128);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 576) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0577
     * @tc.name    DietPositioning577
     * @tc.desc    Diet statistics after entries 577 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(1, 1, 178);
      m.addEntry(2, 3, 129);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 577) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0578
     * @tc.name    DietPositioning578
     * @tc.desc    Diet statistics after entries 578 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(2, 2, 179);
      m.addEntry(3, 0, 130);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 578) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0579
     * @tc.name    DietPositioning579
     * @tc.desc    Diet statistics after entries 579 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(3, 3, 180);
      m.addEntry(4, 1, 131);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 579) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0580
     * @tc.name    DietPositioning580
     * @tc.desc    Diet statistics after entries 580 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(4, 0, 181);
      m.addEntry(5, 2, 132);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 580) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0581
     * @tc.name    DietPositioning581
     * @tc.desc    Diet statistics after entries 581 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(5, 1, 182);
      m.addEntry(6, 3, 133);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 581) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0582
     * @tc.name    DietPositioning582
     * @tc.desc    Diet statistics after entries 582 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(6, 2, 183);
      m.addEntry(7, 0, 134);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 582) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0583
     * @tc.name    DietPositioning583
     * @tc.desc    Diet statistics after entries 583 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(7, 3, 184);
      m.addEntry(8, 1, 135);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 583) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0584
     * @tc.name    DietPositioning584
     * @tc.desc    Diet statistics after entries 584 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(8, 0, 185);
      m.addEntry(9, 2, 136);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 584) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0585
     * @tc.name    DietPositioning585
     * @tc.desc    Diet statistics after entries 585 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(9, 1, 186);
      m.addEntry(10, 3, 137);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 585) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0586
     * @tc.name    DietPositioning586
     * @tc.desc    Diet statistics after entries 586 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(10, 2, 187);
      m.addEntry(11, 0, 138);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 586) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0587
     * @tc.name    DietPositioning587
     * @tc.desc    Diet statistics after entries 587 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(11, 3, 188);
      m.addEntry(0, 1, 139);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 587) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0588
     * @tc.name    DietPositioning588
     * @tc.desc    Diet statistics after entries 588 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietPositioning588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      m.addEntry(0, 0, 189);
      m.addEntry(1, 2, 140);
      expect(m.statistics().length <= 4).assertEqual(true);
      expect(m.totalCalories() >= 0).assertEqual(true);
      expect(m.getFoodById(1000 + 588) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

