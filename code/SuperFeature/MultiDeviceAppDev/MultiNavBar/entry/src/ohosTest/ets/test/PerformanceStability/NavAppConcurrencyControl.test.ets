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
import { NavBarModel } from '../Shared/NavBarModel';
import { NAV_SUB_COUNTS } from '../Shared/NavBarModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[NavAppTests]';

export default function navAppConcurrencyControlSuite() {
  describe('NavAppConcurrencyControlSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0717
     * @tc.name    NavAppConcurrencyControl717
     * @tc.desc    NavBar repeated node access 717 probe 717
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl717', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 2) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 717) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0718
     * @tc.name    NavAppConcurrencyControl718
     * @tc.desc    NavBar repeated node access 718 probe 718
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl718', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 3) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 718) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0719
     * @tc.name    NavAppConcurrencyControl719
     * @tc.desc    NavBar repeated node access 719 probe 719
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl719', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 4) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 719) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0720
     * @tc.name    NavAppConcurrencyControl720
     * @tc.desc    NavBar repeated node access 720 probe 720
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl720', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 0) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 720) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0721
     * @tc.name    NavAppConcurrencyControl721
     * @tc.desc    NavBar repeated node access 721 probe 721
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl721', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 1) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 721) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0722
     * @tc.name    NavAppConcurrencyControl722
     * @tc.desc    NavBar repeated node access 722 probe 722
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl722', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 2) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 722) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0723
     * @tc.name    NavAppConcurrencyControl723
     * @tc.desc    NavBar repeated node access 723 probe 723
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl723', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 3) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 723) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0724
     * @tc.name    NavAppConcurrencyControl724
     * @tc.desc    NavBar repeated node access 724 probe 724
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl724', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 4) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 724) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0725
     * @tc.name    NavAppConcurrencyControl725
     * @tc.desc    NavBar repeated node access 725 probe 725
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl725', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 0) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 725) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0726
     * @tc.name    NavAppConcurrencyControl726
     * @tc.desc    NavBar repeated node access 726 probe 726
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl726', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 1) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 726) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0727
     * @tc.name    NavAppConcurrencyControl727
     * @tc.desc    NavBar repeated node access 727 probe 727
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl727', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 2) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 727) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0728
     * @tc.name    NavAppConcurrencyControl728
     * @tc.desc    NavBar repeated node access 728 probe 728
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl728', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 3) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 728) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0729
     * @tc.name    NavAppConcurrencyControl729
     * @tc.desc    NavBar repeated node access 729 probe 729
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl729', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 4) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 729) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0730
     * @tc.name    NavAppConcurrencyControl730
     * @tc.desc    NavBar repeated node access 730 probe 730
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl730', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 0) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 730) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0731
     * @tc.name    NavAppConcurrencyControl731
     * @tc.desc    NavBar repeated node access 731 probe 731
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl731', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 1) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 731) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0732
     * @tc.name    NavAppConcurrencyControl732
     * @tc.desc    NavBar repeated node access 732 probe 732
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl732', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 2) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 732) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0733
     * @tc.name    NavAppConcurrencyControl733
     * @tc.desc    NavBar repeated node access 733 probe 733
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl733', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 3) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 733) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0734
     * @tc.name    NavAppConcurrencyControl734
     * @tc.desc    NavBar repeated node access 734 probe 734
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl734', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 4) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 734) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0735
     * @tc.name    NavAppConcurrencyControl735
     * @tc.desc    NavBar repeated node access 735 probe 735
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl735', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 0) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 735) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0736
     * @tc.name    NavAppConcurrencyControl736
     * @tc.desc    NavBar repeated node access 736 probe 736
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl736', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 1) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 736) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0737
     * @tc.name    NavAppConcurrencyControl737
     * @tc.desc    NavBar repeated node access 737 probe 737
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl737', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 2) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 737) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0738
     * @tc.name    NavAppConcurrencyControl738
     * @tc.desc    NavBar repeated node access 738 probe 738
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl738', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 3) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 738) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0739
     * @tc.name    NavAppConcurrencyControl739
     * @tc.desc    NavBar repeated node access 739 probe 739
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl739', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 4) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 739) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0740
     * @tc.name    NavAppConcurrencyControl740
     * @tc.desc    NavBar repeated node access 740 probe 740
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl740', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 0) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 740) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0741
     * @tc.name    NavAppConcurrencyControl741
     * @tc.desc    NavBar repeated node access 741 probe 741
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl741', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 1) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 741) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0742
     * @tc.name    NavAppConcurrencyControl742
     * @tc.desc    NavBar repeated node access 742 probe 742
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl742', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 2) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 742) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0743
     * @tc.name    NavAppConcurrencyControl743
     * @tc.desc    NavBar repeated node access 743 probe 743
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl743', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 3) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 743) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0744
     * @tc.name    NavAppConcurrencyControl744
     * @tc.desc    NavBar repeated node access 744 probe 744
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl744', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 4) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 744) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0745
     * @tc.name    NavAppConcurrencyControl745
     * @tc.desc    NavBar repeated node access 745 probe 745
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl745', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 0) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 745) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0746
     * @tc.name    NavAppConcurrencyControl746
     * @tc.desc    NavBar repeated node access 746 probe 746
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl746', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 1) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 746) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0747
     * @tc.name    NavAppConcurrencyControl747
     * @tc.desc    NavBar repeated node access 747 probe 747
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl747', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 2) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 747) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0748
     * @tc.name    NavAppConcurrencyControl748
     * @tc.desc    NavBar repeated node access 748 probe 748
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppConcurrencyControl748', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      for (let k = 0; k < m.getTopCount(); k++) {
        expect(m.getNode((k + 3) % m.getTopCount()) !== undefined).assertEqual(true);
      }
      expect(m.getNode(1000 + 748) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

