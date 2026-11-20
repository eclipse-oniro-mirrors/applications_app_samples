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
import { ColumnsModel } from '../Shared/ColumnsModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[ColumnsTests]';

export default function columnsConfigurationChangesSuite() {
  describe('ColumnsConfigurationChangesSuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0585
     * @tc.name    ColumnsConfigurationChanges585
     * @tc.desc    Columns fresh model 585 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(905) - 0.4 * 905) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit585') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0586
     * @tc.name    ColumnsConfigurationChanges586
     * @tc.desc    Columns fresh model 586 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(906) - 0.4 * 906) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit586') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0587
     * @tc.name    ColumnsConfigurationChanges587
     * @tc.desc    Columns fresh model 587 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(907) - 0.4 * 907) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit587') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0588
     * @tc.name    ColumnsConfigurationChanges588
     * @tc.desc    Columns fresh model 588 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(908) - 0.4 * 908) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit588') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0589
     * @tc.name    ColumnsConfigurationChanges589
     * @tc.desc    Columns fresh model 589 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(909) - 0.4 * 909) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit589') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0590
     * @tc.name    ColumnsConfigurationChanges590
     * @tc.desc    Columns fresh model 590 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(910) - 0.4 * 910) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit590') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0591
     * @tc.name    ColumnsConfigurationChanges591
     * @tc.desc    Columns fresh model 591 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(911) - 0.4 * 911) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit591') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0592
     * @tc.name    ColumnsConfigurationChanges592
     * @tc.desc    Columns fresh model 592 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(912) - 0.4 * 912) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit592') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0593
     * @tc.name    ColumnsConfigurationChanges593
     * @tc.desc    Columns fresh model 593 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(913) - 0.4 * 913) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit593') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0594
     * @tc.name    ColumnsConfigurationChanges594
     * @tc.desc    Columns fresh model 594 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(914) - 0.4 * 914) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit594') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0595
     * @tc.name    ColumnsConfigurationChanges595
     * @tc.desc    Columns fresh model 595 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(915) - 0.4 * 915) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit595') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0596
     * @tc.name    ColumnsConfigurationChanges596
     * @tc.desc    Columns fresh model 596 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(916) - 0.4 * 916) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit596') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0597
     * @tc.name    ColumnsConfigurationChanges597
     * @tc.desc    Columns fresh model 597 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(917) - 0.4 * 917) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit597') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0598
     * @tc.name    ColumnsConfigurationChanges598
     * @tc.desc    Columns fresh model 598 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(918) - 0.4 * 918) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit598') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0599
     * @tc.name    ColumnsConfigurationChanges599
     * @tc.desc    Columns fresh model 599 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(919) - 0.4 * 919) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit599') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0600
     * @tc.name    ColumnsConfigurationChanges600
     * @tc.desc    Columns fresh model 600 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(920) - 0.4 * 920) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit600') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0601
     * @tc.name    ColumnsConfigurationChanges601
     * @tc.desc    Columns fresh model 601 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(921) - 0.4 * 921) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit601') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0602
     * @tc.name    ColumnsConfigurationChanges602
     * @tc.desc    Columns fresh model 602 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(922) - 0.4 * 922) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit602') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0603
     * @tc.name    ColumnsConfigurationChanges603
     * @tc.desc    Columns fresh model 603 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(923) - 0.4 * 923) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit603') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0604
     * @tc.name    ColumnsConfigurationChanges604
     * @tc.desc    Columns fresh model 604 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(924) - 0.4 * 924) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit604') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0605
     * @tc.name    ColumnsConfigurationChanges605
     * @tc.desc    Columns fresh model 605 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(925) - 0.4 * 925) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit605') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0606
     * @tc.name    ColumnsConfigurationChanges606
     * @tc.desc    Columns fresh model 606 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(926) - 0.4 * 926) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit606') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0607
     * @tc.name    ColumnsConfigurationChanges607
     * @tc.desc    Columns fresh model 607 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(927) - 0.4 * 927) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit607') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0608
     * @tc.name    ColumnsConfigurationChanges608
     * @tc.desc    Columns fresh model 608 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(928) - 0.4 * 928) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit608') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0609
     * @tc.name    ColumnsConfigurationChanges609
     * @tc.desc    Columns fresh model 609 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(929) - 0.4 * 929) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit609') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0610
     * @tc.name    ColumnsConfigurationChanges610
     * @tc.desc    Columns fresh model 610 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(930) - 0.4 * 930) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit610') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0611
     * @tc.name    ColumnsConfigurationChanges611
     * @tc.desc    Columns fresh model 611 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges611', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(931) - 0.4 * 931) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit611') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0612
     * @tc.name    ColumnsConfigurationChanges612
     * @tc.desc    Columns fresh model 612 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges612', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(932) - 0.4 * 932) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit612') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0613
     * @tc.name    ColumnsConfigurationChanges613
     * @tc.desc    Columns fresh model 613 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges613', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(933) - 0.4 * 933) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit613') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0614
     * @tc.name    ColumnsConfigurationChanges614
     * @tc.desc    Columns fresh model 614 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges614', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(934) - 0.4 * 934) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit614') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0615
     * @tc.name    ColumnsConfigurationChanges615
     * @tc.desc    Columns fresh model 615 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges615', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(935) - 0.4 * 935) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit615') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0616
     * @tc.name    ColumnsConfigurationChanges616
     * @tc.desc    Columns fresh model 616 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges616', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(936) - 0.4 * 936) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit616') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0617
     * @tc.name    ColumnsConfigurationChanges617
     * @tc.desc    Columns fresh model 617 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges617', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(937) - 0.4 * 937) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit617') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0618
     * @tc.name    ColumnsConfigurationChanges618
     * @tc.desc    Columns fresh model 618 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges618', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(938) - 0.4 * 938) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit618') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0619
     * @tc.name    ColumnsConfigurationChanges619
     * @tc.desc    Columns fresh model 619 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges619', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(939) - 0.4 * 939) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit619') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0620
     * @tc.name    ColumnsConfigurationChanges620
     * @tc.desc    Columns fresh model 620 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges620', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(940) - 0.4 * 940) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit620') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0621
     * @tc.name    ColumnsConfigurationChanges621
     * @tc.desc    Columns fresh model 621 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges621', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(941) - 0.4 * 941) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit621') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0622
     * @tc.name    ColumnsConfigurationChanges622
     * @tc.desc    Columns fresh model 622 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges622', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(942) - 0.4 * 942) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit622') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0623
     * @tc.name    ColumnsConfigurationChanges623
     * @tc.desc    Columns fresh model 623 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges623', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(943) - 0.4 * 943) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit623') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0624
     * @tc.name    ColumnsConfigurationChanges624
     * @tc.desc    Columns fresh model 624 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges624', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(944) - 0.4 * 944) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit624') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0625
     * @tc.name    ColumnsConfigurationChanges625
     * @tc.desc    Columns fresh model 625 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges625', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(945) - 0.4 * 945) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit625') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0626
     * @tc.name    ColumnsConfigurationChanges626
     * @tc.desc    Columns fresh model 626 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges626', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(946) - 0.4 * 946) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit626') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0627
     * @tc.name    ColumnsConfigurationChanges627
     * @tc.desc    Columns fresh model 627 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges627', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(947) - 0.4 * 947) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit627') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0628
     * @tc.name    ColumnsConfigurationChanges628
     * @tc.desc    Columns fresh model 628 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges628', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(948) - 0.4 * 948) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit628') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0629
     * @tc.name    ColumnsConfigurationChanges629
     * @tc.desc    Columns fresh model 629 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges629', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(949) - 0.4 * 949) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit629') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0630
     * @tc.name    ColumnsConfigurationChanges630
     * @tc.desc    Columns fresh model 630 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges630', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(950) - 0.4 * 950) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit630') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0631
     * @tc.name    ColumnsConfigurationChanges631
     * @tc.desc    Columns fresh model 631 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges631', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(951) - 0.4 * 951) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit631') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0632
     * @tc.name    ColumnsConfigurationChanges632
     * @tc.desc    Columns fresh model 632 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges632', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(952) - 0.4 * 952) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit632') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0633
     * @tc.name    ColumnsConfigurationChanges633
     * @tc.desc    Columns fresh model 633 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges633', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(953) - 0.4 * 953) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit633') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0634
     * @tc.name    ColumnsConfigurationChanges634
     * @tc.desc    Columns fresh model 634 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges634', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(954) - 0.4 * 954) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit634') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0635
     * @tc.name    ColumnsConfigurationChanges635
     * @tc.desc    Columns fresh model 635 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges635', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(955) - 0.4 * 955) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit635') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0636
     * @tc.name    ColumnsConfigurationChanges636
     * @tc.desc    Columns fresh model 636 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges636', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(956) - 0.4 * 956) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit636') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0637
     * @tc.name    ColumnsConfigurationChanges637
     * @tc.desc    Columns fresh model 637 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges637', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(957) - 0.4 * 957) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit637') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0638
     * @tc.name    ColumnsConfigurationChanges638
     * @tc.desc    Columns fresh model 638 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges638', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(958) - 0.4 * 958) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit638') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0639
     * @tc.name    ColumnsConfigurationChanges639
     * @tc.desc    Columns fresh model 639 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges639', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(959) - 0.4 * 959) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit639') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0640
     * @tc.name    ColumnsConfigurationChanges640
     * @tc.desc    Columns fresh model 640 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges640', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(960) - 0.4 * 960) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit640') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0641
     * @tc.name    ColumnsConfigurationChanges641
     * @tc.desc    Columns fresh model 641 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges641', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(961) - 0.4 * 961) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit641') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0642
     * @tc.name    ColumnsConfigurationChanges642
     * @tc.desc    Columns fresh model 642 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges642', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(962) - 0.4 * 962) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit642') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0643
     * @tc.name    ColumnsConfigurationChanges643
     * @tc.desc    Columns fresh model 643 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges643', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(963) - 0.4 * 963) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit643') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0644
     * @tc.name    ColumnsConfigurationChanges644
     * @tc.desc    Columns fresh model 644 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges644', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(964) - 0.4 * 964) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit644') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0645
     * @tc.name    ColumnsConfigurationChanges645
     * @tc.desc    Columns fresh model 645 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges645', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(965) - 0.4 * 965) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit645') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0646
     * @tc.name    ColumnsConfigurationChanges646
     * @tc.desc    Columns fresh model 646 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges646', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(966) - 0.4 * 966) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit646') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0647
     * @tc.name    ColumnsConfigurationChanges647
     * @tc.desc    Columns fresh model 647 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges647', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(967) - 0.4 * 967) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit647') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0648
     * @tc.name    ColumnsConfigurationChanges648
     * @tc.desc    Columns fresh model 648 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges648', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(968) - 0.4 * 968) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit648') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0649
     * @tc.name    ColumnsConfigurationChanges649
     * @tc.desc    Columns fresh model 649 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges649', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(969) - 0.4 * 969) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit649') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0650
     * @tc.name    ColumnsConfigurationChanges650
     * @tc.desc    Columns fresh model 650 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges650', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(970) - 0.4 * 970) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit650') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0651
     * @tc.name    ColumnsConfigurationChanges651
     * @tc.desc    Columns fresh model 651 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges651', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(971) - 0.4 * 971) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit651') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0652
     * @tc.name    ColumnsConfigurationChanges652
     * @tc.desc    Columns fresh model 652 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges652', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(972) - 0.4 * 972) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit652') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0653
     * @tc.name    ColumnsConfigurationChanges653
     * @tc.desc    Columns fresh model 653 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges653', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(973) - 0.4 * 973) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit653') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0654
     * @tc.name    ColumnsConfigurationChanges654
     * @tc.desc    Columns fresh model 654 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges654', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(974) - 0.4 * 974) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit654') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0655
     * @tc.name    ColumnsConfigurationChanges655
     * @tc.desc    Columns fresh model 655 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges655', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(975) - 0.4 * 975) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit655') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0656
     * @tc.name    ColumnsConfigurationChanges656
     * @tc.desc    Columns fresh model 656 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges656', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(976) - 0.4 * 976) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit656') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0657
     * @tc.name    ColumnsConfigurationChanges657
     * @tc.desc    Columns fresh model 657 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges657', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(977) - 0.4 * 977) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit657') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0658
     * @tc.name    ColumnsConfigurationChanges658
     * @tc.desc    Columns fresh model 658 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges658', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(978) - 0.4 * 978) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit658') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0659
     * @tc.name    ColumnsConfigurationChanges659
     * @tc.desc    Columns fresh model 659 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges659', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(979) - 0.4 * 979) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit659') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0660
     * @tc.name    ColumnsConfigurationChanges660
     * @tc.desc    Columns fresh model 660 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges660', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(980) - 0.4 * 980) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit660') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0661
     * @tc.name    ColumnsConfigurationChanges661
     * @tc.desc    Columns fresh model 661 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges661', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(981) - 0.4 * 981) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit661') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0662
     * @tc.name    ColumnsConfigurationChanges662
     * @tc.desc    Columns fresh model 662 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges662', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(982) - 0.4 * 982) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit662') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0663
     * @tc.name    ColumnsConfigurationChanges663
     * @tc.desc    Columns fresh model 663 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges663', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(983) - 0.4 * 983) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit663') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0664
     * @tc.name    ColumnsConfigurationChanges664
     * @tc.desc    Columns fresh model 664 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges664', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(984) - 0.4 * 984) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit664') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0665
     * @tc.name    ColumnsConfigurationChanges665
     * @tc.desc    Columns fresh model 665 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges665', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(985) - 0.4 * 985) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit665') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0666
     * @tc.name    ColumnsConfigurationChanges666
     * @tc.desc    Columns fresh model 666 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges666', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(986) - 0.4 * 986) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit666') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0667
     * @tc.name    ColumnsConfigurationChanges667
     * @tc.desc    Columns fresh model 667 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges667', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(987) - 0.4 * 987) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit667') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0668
     * @tc.name    ColumnsConfigurationChanges668
     * @tc.desc    Columns fresh model 668 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges668', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(988) - 0.4 * 988) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit668') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0669
     * @tc.name    ColumnsConfigurationChanges669
     * @tc.desc    Columns fresh model 669 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges669', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(989) - 0.4 * 989) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit669') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0670
     * @tc.name    ColumnsConfigurationChanges670
     * @tc.desc    Columns fresh model 670 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges670', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(990) - 0.4 * 990) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit670') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0671
     * @tc.name    ColumnsConfigurationChanges671
     * @tc.desc    Columns fresh model 671 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges671', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(991) - 0.4 * 991) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit671') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0672
     * @tc.name    ColumnsConfigurationChanges672
     * @tc.desc    Columns fresh model 672 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges672', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(992) - 0.4 * 992) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit672') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0673
     * @tc.name    ColumnsConfigurationChanges673
     * @tc.desc    Columns fresh model 673 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsConfigurationChanges673', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(993) - 0.4 * 993) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit673') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

