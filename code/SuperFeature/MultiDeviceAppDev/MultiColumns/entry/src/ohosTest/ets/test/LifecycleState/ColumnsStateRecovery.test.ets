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

export default function columnsStateRecoverySuite() {
  describe('ColumnsStateRecoverySuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0674
     * @tc.name    ColumnsStateRecovery674
     * @tc.desc    Columns fresh model 674 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery674', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(994) - 0.4 * 994) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit674') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0675
     * @tc.name    ColumnsStateRecovery675
     * @tc.desc    Columns fresh model 675 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery675', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(995) - 0.4 * 995) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit675') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0676
     * @tc.name    ColumnsStateRecovery676
     * @tc.desc    Columns fresh model 676 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery676', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(996) - 0.4 * 996) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit676') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0677
     * @tc.name    ColumnsStateRecovery677
     * @tc.desc    Columns fresh model 677 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery677', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(997) - 0.4 * 997) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit677') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0678
     * @tc.name    ColumnsStateRecovery678
     * @tc.desc    Columns fresh model 678 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery678', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(998) - 0.4 * 998) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit678') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0679
     * @tc.name    ColumnsStateRecovery679
     * @tc.desc    Columns fresh model 679 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery679', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(999) - 0.4 * 999) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit679') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0680
     * @tc.name    ColumnsStateRecovery680
     * @tc.desc    Columns fresh model 680 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery680', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1000) - 0.4 * 1000) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit680') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0681
     * @tc.name    ColumnsStateRecovery681
     * @tc.desc    Columns fresh model 681 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery681', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1001) - 0.4 * 1001) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit681') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0682
     * @tc.name    ColumnsStateRecovery682
     * @tc.desc    Columns fresh model 682 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery682', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1002) - 0.4 * 1002) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit682') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0683
     * @tc.name    ColumnsStateRecovery683
     * @tc.desc    Columns fresh model 683 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery683', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1003) - 0.4 * 1003) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit683') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0684
     * @tc.name    ColumnsStateRecovery684
     * @tc.desc    Columns fresh model 684 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery684', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1004) - 0.4 * 1004) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit684') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0685
     * @tc.name    ColumnsStateRecovery685
     * @tc.desc    Columns fresh model 685 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery685', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1005) - 0.4 * 1005) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit685') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0686
     * @tc.name    ColumnsStateRecovery686
     * @tc.desc    Columns fresh model 686 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery686', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1006) - 0.4 * 1006) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit686') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0687
     * @tc.name    ColumnsStateRecovery687
     * @tc.desc    Columns fresh model 687 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery687', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1007) - 0.4 * 1007) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit687') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0688
     * @tc.name    ColumnsStateRecovery688
     * @tc.desc    Columns fresh model 688 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery688', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1008) - 0.4 * 1008) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit688') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0689
     * @tc.name    ColumnsStateRecovery689
     * @tc.desc    Columns fresh model 689 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery689', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1009) - 0.4 * 1009) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit689') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0690
     * @tc.name    ColumnsStateRecovery690
     * @tc.desc    Columns fresh model 690 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery690', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1010) - 0.4 * 1010) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit690') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0691
     * @tc.name    ColumnsStateRecovery691
     * @tc.desc    Columns fresh model 691 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery691', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1011) - 0.4 * 1011) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit691') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0692
     * @tc.name    ColumnsStateRecovery692
     * @tc.desc    Columns fresh model 692 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery692', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1012) - 0.4 * 1012) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit692') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0693
     * @tc.name    ColumnsStateRecovery693
     * @tc.desc    Columns fresh model 693 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery693', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1013) - 0.4 * 1013) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit693') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0694
     * @tc.name    ColumnsStateRecovery694
     * @tc.desc    Columns fresh model 694 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1014) - 0.4 * 1014) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit694') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0695
     * @tc.name    ColumnsStateRecovery695
     * @tc.desc    Columns fresh model 695 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1015) - 0.4 * 1015) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit695') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0696
     * @tc.name    ColumnsStateRecovery696
     * @tc.desc    Columns fresh model 696 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1016) - 0.4 * 1016) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit696') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0697
     * @tc.name    ColumnsStateRecovery697
     * @tc.desc    Columns fresh model 697 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1017) - 0.4 * 1017) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit697') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0698
     * @tc.name    ColumnsStateRecovery698
     * @tc.desc    Columns fresh model 698 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1018) - 0.4 * 1018) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit698') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0699
     * @tc.name    ColumnsStateRecovery699
     * @tc.desc    Columns fresh model 699 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1019) - 0.4 * 1019) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit699') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0700
     * @tc.name    ColumnsStateRecovery700
     * @tc.desc    Columns fresh model 700 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1020) - 0.4 * 1020) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit700') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0701
     * @tc.name    ColumnsStateRecovery701
     * @tc.desc    Columns fresh model 701 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1021) - 0.4 * 1021) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit701') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0702
     * @tc.name    ColumnsStateRecovery702
     * @tc.desc    Columns fresh model 702 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1022) - 0.4 * 1022) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit702') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0703
     * @tc.name    ColumnsStateRecovery703
     * @tc.desc    Columns fresh model 703 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1023) - 0.4 * 1023) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit703') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0704
     * @tc.name    ColumnsStateRecovery704
     * @tc.desc    Columns fresh model 704 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1024) - 0.4 * 1024) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit704') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0705
     * @tc.name    ColumnsStateRecovery705
     * @tc.desc    Columns fresh model 705 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1025) - 0.4 * 1025) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit705') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0706
     * @tc.name    ColumnsStateRecovery706
     * @tc.desc    Columns fresh model 706 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1026) - 0.4 * 1026) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit706') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0707
     * @tc.name    ColumnsStateRecovery707
     * @tc.desc    Columns fresh model 707 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1027) - 0.4 * 1027) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit707') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0708
     * @tc.name    ColumnsStateRecovery708
     * @tc.desc    Columns fresh model 708 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1028) - 0.4 * 1028) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit708') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0709
     * @tc.name    ColumnsStateRecovery709
     * @tc.desc    Columns fresh model 709 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1029) - 0.4 * 1029) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit709') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0710
     * @tc.name    ColumnsStateRecovery710
     * @tc.desc    Columns fresh model 710 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1030) - 0.4 * 1030) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit710') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0711
     * @tc.name    ColumnsStateRecovery711
     * @tc.desc    Columns fresh model 711 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1031) - 0.4 * 1031) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit711') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0712
     * @tc.name    ColumnsStateRecovery712
     * @tc.desc    Columns fresh model 712 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1032) - 0.4 * 1032) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit712') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0713
     * @tc.name    ColumnsStateRecovery713
     * @tc.desc    Columns fresh model 713 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1033) - 0.4 * 1033) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit713') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0714
     * @tc.name    ColumnsStateRecovery714
     * @tc.desc    Columns fresh model 714 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1034) - 0.4 * 1034) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit714') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0715
     * @tc.name    ColumnsStateRecovery715
     * @tc.desc    Columns fresh model 715 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1035) - 0.4 * 1035) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit715') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0716
     * @tc.name    ColumnsStateRecovery716
     * @tc.desc    Columns fresh model 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1036) - 0.4 * 1036) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit716') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0717
     * @tc.name    ColumnsStateRecovery717
     * @tc.desc    Columns fresh model 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1037) - 0.4 * 1037) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit717') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0718
     * @tc.name    ColumnsStateRecovery718
     * @tc.desc    Columns fresh model 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1038) - 0.4 * 1038) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit718') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0719
     * @tc.name    ColumnsStateRecovery719
     * @tc.desc    Columns fresh model 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1039) - 0.4 * 1039) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit719') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0720
     * @tc.name    ColumnsStateRecovery720
     * @tc.desc    Columns fresh model 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1040) - 0.4 * 1040) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit720') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0721
     * @tc.name    ColumnsStateRecovery721
     * @tc.desc    Columns fresh model 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1041) - 0.4 * 1041) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit721') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0722
     * @tc.name    ColumnsStateRecovery722
     * @tc.desc    Columns fresh model 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1042) - 0.4 * 1042) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit722') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0723
     * @tc.name    ColumnsStateRecovery723
     * @tc.desc    Columns fresh model 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1043) - 0.4 * 1043) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit723') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0724
     * @tc.name    ColumnsStateRecovery724
     * @tc.desc    Columns fresh model 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1044) - 0.4 * 1044) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit724') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0725
     * @tc.name    ColumnsStateRecovery725
     * @tc.desc    Columns fresh model 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1045) - 0.4 * 1045) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit725') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0726
     * @tc.name    ColumnsStateRecovery726
     * @tc.desc    Columns fresh model 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1046) - 0.4 * 1046) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit726') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0727
     * @tc.name    ColumnsStateRecovery727
     * @tc.desc    Columns fresh model 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1047) - 0.4 * 1047) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit727') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0728
     * @tc.name    ColumnsStateRecovery728
     * @tc.desc    Columns fresh model 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1048) - 0.4 * 1048) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit728') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0729
     * @tc.name    ColumnsStateRecovery729
     * @tc.desc    Columns fresh model 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1049) - 0.4 * 1049) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit729') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0730
     * @tc.name    ColumnsStateRecovery730
     * @tc.desc    Columns fresh model 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1050) - 0.4 * 1050) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit730') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0731
     * @tc.name    ColumnsStateRecovery731
     * @tc.desc    Columns fresh model 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1051) - 0.4 * 1051) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit731') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0732
     * @tc.name    ColumnsStateRecovery732
     * @tc.desc    Columns fresh model 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1052) - 0.4 * 1052) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit732') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0733
     * @tc.name    ColumnsStateRecovery733
     * @tc.desc    Columns fresh model 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1053) - 0.4 * 1053) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit733') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0734
     * @tc.name    ColumnsStateRecovery734
     * @tc.desc    Columns fresh model 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1054) - 0.4 * 1054) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit734') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0735
     * @tc.name    ColumnsStateRecovery735
     * @tc.desc    Columns fresh model 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1055) - 0.4 * 1055) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit735') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0736
     * @tc.name    ColumnsStateRecovery736
     * @tc.desc    Columns fresh model 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1056) - 0.4 * 1056) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit736') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0737
     * @tc.name    ColumnsStateRecovery737
     * @tc.desc    Columns fresh model 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1057) - 0.4 * 1057) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit737') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0738
     * @tc.name    ColumnsStateRecovery738
     * @tc.desc    Columns fresh model 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsStateRecovery738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: ColumnsModel = new ColumnsModel();
      expect(local.getMailKinds()).assertEqual(m.getMailKinds());
      expect(local.isRatioValid()).assertEqual(true);
      expect(Math.abs(local.navbarWidth(1058) - 0.4 * 1058) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit738') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

