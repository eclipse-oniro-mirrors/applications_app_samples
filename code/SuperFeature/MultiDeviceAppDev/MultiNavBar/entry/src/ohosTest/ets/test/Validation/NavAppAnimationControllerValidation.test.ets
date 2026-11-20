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

export default function navAppAnimationControllerValidationSuite() {
  describe('NavAppAnimationControllerValidationSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0749
     * @tc.name    NavAppAnimationControllerValidation749
     * @tc.desc    NavBar index validity for 5 probe 749
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation749', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 749) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0750
     * @tc.name    NavAppAnimationControllerValidation750
     * @tc.desc    NavBar index validity for 6 probe 750
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation750', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 750) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0751
     * @tc.name    NavAppAnimationControllerValidation751
     * @tc.desc    NavBar index validity for 7 probe 751
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation751', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 751) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0752
     * @tc.name    NavAppAnimationControllerValidation752
     * @tc.desc    NavBar index validity for 0 probe 752
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation752', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 752) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0753
     * @tc.name    NavAppAnimationControllerValidation753
     * @tc.desc    NavBar index validity for 1 probe 753
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation753', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 753) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0754
     * @tc.name    NavAppAnimationControllerValidation754
     * @tc.desc    NavBar index validity for 2 probe 754
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation754', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 754) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0755
     * @tc.name    NavAppAnimationControllerValidation755
     * @tc.desc    NavBar index validity for 3 probe 755
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation755', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 755) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0756
     * @tc.name    NavAppAnimationControllerValidation756
     * @tc.desc    NavBar index validity for 4 probe 756
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation756', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 756) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0757
     * @tc.name    NavAppAnimationControllerValidation757
     * @tc.desc    NavBar index validity for 5 probe 757
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation757', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 757) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0758
     * @tc.name    NavAppAnimationControllerValidation758
     * @tc.desc    NavBar index validity for 6 probe 758
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation758', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 758) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0759
     * @tc.name    NavAppAnimationControllerValidation759
     * @tc.desc    NavBar index validity for 7 probe 759
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation759', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 759) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0760
     * @tc.name    NavAppAnimationControllerValidation760
     * @tc.desc    NavBar index validity for 0 probe 760
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation760', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 760) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0761
     * @tc.name    NavAppAnimationControllerValidation761
     * @tc.desc    NavBar index validity for 1 probe 761
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation761', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 761) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0762
     * @tc.name    NavAppAnimationControllerValidation762
     * @tc.desc    NavBar index validity for 2 probe 762
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation762', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 762) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0763
     * @tc.name    NavAppAnimationControllerValidation763
     * @tc.desc    NavBar index validity for 3 probe 763
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation763', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 763) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0764
     * @tc.name    NavAppAnimationControllerValidation764
     * @tc.desc    NavBar index validity for 4 probe 764
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation764', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 764) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0765
     * @tc.name    NavAppAnimationControllerValidation765
     * @tc.desc    NavBar index validity for 5 probe 765
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation765', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 765) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0766
     * @tc.name    NavAppAnimationControllerValidation766
     * @tc.desc    NavBar index validity for 6 probe 766
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation766', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 766) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0767
     * @tc.name    NavAppAnimationControllerValidation767
     * @tc.desc    NavBar index validity for 7 probe 767
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation767', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 767) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0768
     * @tc.name    NavAppAnimationControllerValidation768
     * @tc.desc    NavBar index validity for 0 probe 768
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation768', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 768) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0769
     * @tc.name    NavAppAnimationControllerValidation769
     * @tc.desc    NavBar index validity for 1 probe 769
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation769', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 769) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0770
     * @tc.name    NavAppAnimationControllerValidation770
     * @tc.desc    NavBar index validity for 2 probe 770
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation770', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 770) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0771
     * @tc.name    NavAppAnimationControllerValidation771
     * @tc.desc    NavBar index validity for 3 probe 771
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation771', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 771) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0772
     * @tc.name    NavAppAnimationControllerValidation772
     * @tc.desc    NavBar index validity for 4 probe 772
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation772', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 772) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0773
     * @tc.name    NavAppAnimationControllerValidation773
     * @tc.desc    NavBar index validity for 5 probe 773
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation773', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 773) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0774
     * @tc.name    NavAppAnimationControllerValidation774
     * @tc.desc    NavBar index validity for 6 probe 774
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation774', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 774) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0775
     * @tc.name    NavAppAnimationControllerValidation775
     * @tc.desc    NavBar index validity for 7 probe 775
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation775', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 775) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0776
     * @tc.name    NavAppAnimationControllerValidation776
     * @tc.desc    NavBar index validity for 0 probe 776
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation776', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 776) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0777
     * @tc.name    NavAppAnimationControllerValidation777
     * @tc.desc    NavBar index validity for 1 probe 777
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation777', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 777) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0778
     * @tc.name    NavAppAnimationControllerValidation778
     * @tc.desc    NavBar index validity for 2 probe 778
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation778', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 778) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0779
     * @tc.name    NavAppAnimationControllerValidation779
     * @tc.desc    NavBar index validity for 3 probe 779
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation779', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 779) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0780
     * @tc.name    NavAppAnimationControllerValidation780
     * @tc.desc    NavBar index validity for 4 probe 780
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation780', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 780) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0781
     * @tc.name    NavAppAnimationControllerValidation781
     * @tc.desc    NavBar index validity for 5 probe 781
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation781', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 781) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0782
     * @tc.name    NavAppAnimationControllerValidation782
     * @tc.desc    NavBar index validity for 6 probe 782
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation782', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 782) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0783
     * @tc.name    NavAppAnimationControllerValidation783
     * @tc.desc    NavBar index validity for 7 probe 783
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation783', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 783) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0784
     * @tc.name    NavAppAnimationControllerValidation784
     * @tc.desc    NavBar index validity for 0 probe 784
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation784', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 784) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0785
     * @tc.name    NavAppAnimationControllerValidation785
     * @tc.desc    NavBar index validity for 1 probe 785
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation785', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 785) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0786
     * @tc.name    NavAppAnimationControllerValidation786
     * @tc.desc    NavBar index validity for 2 probe 786
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation786', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 786) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0787
     * @tc.name    NavAppAnimationControllerValidation787
     * @tc.desc    NavBar index validity for 3 probe 787
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation787', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 787) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0788
     * @tc.name    NavAppAnimationControllerValidation788
     * @tc.desc    NavBar index validity for 4 probe 788
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation788', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 788) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0789
     * @tc.name    NavAppAnimationControllerValidation789
     * @tc.desc    NavBar index validity for 5 probe 789
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation789', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 789) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0790
     * @tc.name    NavAppAnimationControllerValidation790
     * @tc.desc    NavBar index validity for 6 probe 790
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation790', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 790) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0791
     * @tc.name    NavAppAnimationControllerValidation791
     * @tc.desc    NavBar index validity for 7 probe 791
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation791', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 791) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0792
     * @tc.name    NavAppAnimationControllerValidation792
     * @tc.desc    NavBar index validity for 0 probe 792
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation792', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 792) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0793
     * @tc.name    NavAppAnimationControllerValidation793
     * @tc.desc    NavBar index validity for 1 probe 793
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation793', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 793) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0794
     * @tc.name    NavAppAnimationControllerValidation794
     * @tc.desc    NavBar index validity for 2 probe 794
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation794', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 794) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0795
     * @tc.name    NavAppAnimationControllerValidation795
     * @tc.desc    NavBar index validity for 3 probe 795
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation795', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 795) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0796
     * @tc.name    NavAppAnimationControllerValidation796
     * @tc.desc    NavBar index validity for 4 probe 796
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation796', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 796) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0797
     * @tc.name    NavAppAnimationControllerValidation797
     * @tc.desc    NavBar index validity for 5 probe 797
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation797', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 797) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0798
     * @tc.name    NavAppAnimationControllerValidation798
     * @tc.desc    NavBar index validity for 6 probe 798
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation798', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 798) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0799
     * @tc.name    NavAppAnimationControllerValidation799
     * @tc.desc    NavBar index validity for 7 probe 799
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation799', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 799) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0800
     * @tc.name    NavAppAnimationControllerValidation800
     * @tc.desc    NavBar index validity for 0 probe 800
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation800', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 800) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0801
     * @tc.name    NavAppAnimationControllerValidation801
     * @tc.desc    NavBar index validity for 1 probe 801
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation801', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 801) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0802
     * @tc.name    NavAppAnimationControllerValidation802
     * @tc.desc    NavBar index validity for 2 probe 802
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation802', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 802) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0803
     * @tc.name    NavAppAnimationControllerValidation803
     * @tc.desc    NavBar index validity for 3 probe 803
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation803', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 803) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0804
     * @tc.name    NavAppAnimationControllerValidation804
     * @tc.desc    NavBar index validity for 4 probe 804
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation804', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 804) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0805
     * @tc.name    NavAppAnimationControllerValidation805
     * @tc.desc    NavBar index validity for 5 probe 805
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation805', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 805) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0806
     * @tc.name    NavAppAnimationControllerValidation806
     * @tc.desc    NavBar index validity for 6 probe 806
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation806', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 806) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0807
     * @tc.name    NavAppAnimationControllerValidation807
     * @tc.desc    NavBar index validity for 7 probe 807
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation807', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 807) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0808
     * @tc.name    NavAppAnimationControllerValidation808
     * @tc.desc    NavBar index validity for 0 probe 808
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation808', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 808) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0809
     * @tc.name    NavAppAnimationControllerValidation809
     * @tc.desc    NavBar index validity for 1 probe 809
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation809', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 809) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0810
     * @tc.name    NavAppAnimationControllerValidation810
     * @tc.desc    NavBar index validity for 2 probe 810
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation810', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 810) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0811
     * @tc.name    NavAppAnimationControllerValidation811
     * @tc.desc    NavBar index validity for 3 probe 811
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation811', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 811) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0812
     * @tc.name    NavAppAnimationControllerValidation812
     * @tc.desc    NavBar index validity for 4 probe 812
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation812', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 812) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0813
     * @tc.name    NavAppAnimationControllerValidation813
     * @tc.desc    NavBar index validity for 5 probe 813
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation813', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 813) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0814
     * @tc.name    NavAppAnimationControllerValidation814
     * @tc.desc    NavBar index validity for 6 probe 814
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation814', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 814) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0815
     * @tc.name    NavAppAnimationControllerValidation815
     * @tc.desc    NavBar index validity for 7 probe 815
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation815', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 815) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0816
     * @tc.name    NavAppAnimationControllerValidation816
     * @tc.desc    NavBar index validity for 0 probe 816
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation816', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 816) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0817
     * @tc.name    NavAppAnimationControllerValidation817
     * @tc.desc    NavBar index validity for 1 probe 817
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation817', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 817) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0818
     * @tc.name    NavAppAnimationControllerValidation818
     * @tc.desc    NavBar index validity for 2 probe 818
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation818', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 818) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0819
     * @tc.name    NavAppAnimationControllerValidation819
     * @tc.desc    NavBar index validity for 3 probe 819
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation819', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 819) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0820
     * @tc.name    NavAppAnimationControllerValidation820
     * @tc.desc    NavBar index validity for 4 probe 820
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation820', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 820) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0821
     * @tc.name    NavAppAnimationControllerValidation821
     * @tc.desc    NavBar index validity for 5 probe 821
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation821', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 821) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0822
     * @tc.name    NavAppAnimationControllerValidation822
     * @tc.desc    NavBar index validity for 6 probe 822
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation822', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 822) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0823
     * @tc.name    NavAppAnimationControllerValidation823
     * @tc.desc    NavBar index validity for 7 probe 823
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation823', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 823) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0824
     * @tc.name    NavAppAnimationControllerValidation824
     * @tc.desc    NavBar index validity for 0 probe 824
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation824', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 824) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0825
     * @tc.name    NavAppAnimationControllerValidation825
     * @tc.desc    NavBar index validity for 1 probe 825
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation825', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 825) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0826
     * @tc.name    NavAppAnimationControllerValidation826
     * @tc.desc    NavBar index validity for 2 probe 826
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation826', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 826) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0827
     * @tc.name    NavAppAnimationControllerValidation827
     * @tc.desc    NavBar index validity for 3 probe 827
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation827', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 827) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0828
     * @tc.name    NavAppAnimationControllerValidation828
     * @tc.desc    NavBar index validity for 4 probe 828
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation828', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 828) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0829
     * @tc.name    NavAppAnimationControllerValidation829
     * @tc.desc    NavBar index validity for 5 probe 829
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation829', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 829) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0830
     * @tc.name    NavAppAnimationControllerValidation830
     * @tc.desc    NavBar index validity for 6 probe 830
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation830', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 830) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0831
     * @tc.name    NavAppAnimationControllerValidation831
     * @tc.desc    NavBar index validity for 7 probe 831
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation831', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 831) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0832
     * @tc.name    NavAppAnimationControllerValidation832
     * @tc.desc    NavBar index validity for 0 probe 832
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation832', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 832) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0833
     * @tc.name    NavAppAnimationControllerValidation833
     * @tc.desc    NavBar index validity for 1 probe 833
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation833', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 833) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0834
     * @tc.name    NavAppAnimationControllerValidation834
     * @tc.desc    NavBar index validity for 2 probe 834
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation834', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 834) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0835
     * @tc.name    NavAppAnimationControllerValidation835
     * @tc.desc    NavBar index validity for 3 probe 835
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation835', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 835) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0836
     * @tc.name    NavAppAnimationControllerValidation836
     * @tc.desc    NavBar index validity for 4 probe 836
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation836', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 836) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0837
     * @tc.name    NavAppAnimationControllerValidation837
     * @tc.desc    NavBar index validity for 5 probe 837
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation837', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 837) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0838
     * @tc.name    NavAppAnimationControllerValidation838
     * @tc.desc    NavBar index validity for 6 probe 838
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation838', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 838) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0839
     * @tc.name    NavAppAnimationControllerValidation839
     * @tc.desc    NavBar index validity for 7 probe 839
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation839', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 839) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0840
     * @tc.name    NavAppAnimationControllerValidation840
     * @tc.desc    NavBar index validity for 0 probe 840
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation840', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 840) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0841
     * @tc.name    NavAppAnimationControllerValidation841
     * @tc.desc    NavBar index validity for 1 probe 841
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation841', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 841) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0842
     * @tc.name    NavAppAnimationControllerValidation842
     * @tc.desc    NavBar index validity for 2 probe 842
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation842', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 842) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0843
     * @tc.name    NavAppAnimationControllerValidation843
     * @tc.desc    NavBar index validity for 3 probe 843
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation843', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 843) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0844
     * @tc.name    NavAppAnimationControllerValidation844
     * @tc.desc    NavBar index validity for 4 probe 844
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation844', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 844) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0845
     * @tc.name    NavAppAnimationControllerValidation845
     * @tc.desc    NavBar index validity for 5 probe 845
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation845', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 845) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0846
     * @tc.name    NavAppAnimationControllerValidation846
     * @tc.desc    NavBar index validity for 6 probe 846
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation846', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 846) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0847
     * @tc.name    NavAppAnimationControllerValidation847
     * @tc.desc    NavBar index validity for 7 probe 847
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation847', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 847) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0848
     * @tc.name    NavAppAnimationControllerValidation848
     * @tc.desc    NavBar index validity for 0 probe 848
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation848', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 848) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0849
     * @tc.name    NavAppAnimationControllerValidation849
     * @tc.desc    NavBar index validity for 1 probe 849
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation849', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 849) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0850
     * @tc.name    NavAppAnimationControllerValidation850
     * @tc.desc    NavBar index validity for 2 probe 850
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation850', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 850) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0851
     * @tc.name    NavAppAnimationControllerValidation851
     * @tc.desc    NavBar index validity for 3 probe 851
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation851', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 851) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0852
     * @tc.name    NavAppAnimationControllerValidation852
     * @tc.desc    NavBar index validity for 4 probe 852
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation852', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 852) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0853
     * @tc.name    NavAppAnimationControllerValidation853
     * @tc.desc    NavBar index validity for 5 probe 853
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation853', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 853) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0854
     * @tc.name    NavAppAnimationControllerValidation854
     * @tc.desc    NavBar index validity for 6 probe 854
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation854', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 854) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0855
     * @tc.name    NavAppAnimationControllerValidation855
     * @tc.desc    NavBar index validity for 7 probe 855
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation855', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 855) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0856
     * @tc.name    NavAppAnimationControllerValidation856
     * @tc.desc    NavBar index validity for 0 probe 856
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation856', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 856) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0857
     * @tc.name    NavAppAnimationControllerValidation857
     * @tc.desc    NavBar index validity for 1 probe 857
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation857', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 857) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0858
     * @tc.name    NavAppAnimationControllerValidation858
     * @tc.desc    NavBar index validity for 2 probe 858
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation858', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 858) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0859
     * @tc.name    NavAppAnimationControllerValidation859
     * @tc.desc    NavBar index validity for 3 probe 859
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation859', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 859) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0860
     * @tc.name    NavAppAnimationControllerValidation860
     * @tc.desc    NavBar index validity for 4 probe 860
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation860', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 860) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0861
     * @tc.name    NavAppAnimationControllerValidation861
     * @tc.desc    NavBar index validity for 5 probe 861
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation861', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 861) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0862
     * @tc.name    NavAppAnimationControllerValidation862
     * @tc.desc    NavBar index validity for 6 probe 862
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation862', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 862) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0863
     * @tc.name    NavAppAnimationControllerValidation863
     * @tc.desc    NavBar index validity for 7 probe 863
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation863', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 863) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0864
     * @tc.name    NavAppAnimationControllerValidation864
     * @tc.desc    NavBar index validity for 0 probe 864
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation864', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 864) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0865
     * @tc.name    NavAppAnimationControllerValidation865
     * @tc.desc    NavBar index validity for 1 probe 865
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation865', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 865) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0866
     * @tc.name    NavAppAnimationControllerValidation866
     * @tc.desc    NavBar index validity for 2 probe 866
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation866', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 866) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0867
     * @tc.name    NavAppAnimationControllerValidation867
     * @tc.desc    NavBar index validity for 3 probe 867
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation867', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 867) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0868
     * @tc.name    NavAppAnimationControllerValidation868
     * @tc.desc    NavBar index validity for 4 probe 868
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation868', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 868) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0869
     * @tc.name    NavAppAnimationControllerValidation869
     * @tc.desc    NavBar index validity for 5 probe 869
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation869', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 869) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0870
     * @tc.name    NavAppAnimationControllerValidation870
     * @tc.desc    NavBar index validity for 6 probe 870
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation870', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 870) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0871
     * @tc.name    NavAppAnimationControllerValidation871
     * @tc.desc    NavBar index validity for 7 probe 871
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation871', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 871) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0872
     * @tc.name    NavAppAnimationControllerValidation872
     * @tc.desc    NavBar index validity for 0 probe 872
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation872', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 872) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0873
     * @tc.name    NavAppAnimationControllerValidation873
     * @tc.desc    NavBar index validity for 1 probe 873
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation873', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 873) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0874
     * @tc.name    NavAppAnimationControllerValidation874
     * @tc.desc    NavBar index validity for 2 probe 874
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation874', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 874) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0875
     * @tc.name    NavAppAnimationControllerValidation875
     * @tc.desc    NavBar index validity for 3 probe 875
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation875', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 875) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0876
     * @tc.name    NavAppAnimationControllerValidation876
     * @tc.desc    NavBar index validity for 4 probe 876
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation876', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 876) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0877
     * @tc.name    NavAppAnimationControllerValidation877
     * @tc.desc    NavBar index validity for 5 probe 877
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation877', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 877) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0878
     * @tc.name    NavAppAnimationControllerValidation878
     * @tc.desc    NavBar index validity for 6 probe 878
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation878', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 878) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0879
     * @tc.name    NavAppAnimationControllerValidation879
     * @tc.desc    NavBar index validity for 7 probe 879
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation879', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 879) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0880
     * @tc.name    NavAppAnimationControllerValidation880
     * @tc.desc    NavBar index validity for 0 probe 880
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation880', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 880) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0881
     * @tc.name    NavAppAnimationControllerValidation881
     * @tc.desc    NavBar index validity for 1 probe 881
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation881', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 881) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0882
     * @tc.name    NavAppAnimationControllerValidation882
     * @tc.desc    NavBar index validity for 2 probe 882
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation882', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 882) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0883
     * @tc.name    NavAppAnimationControllerValidation883
     * @tc.desc    NavBar index validity for 3 probe 883
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation883', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 883) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0884
     * @tc.name    NavAppAnimationControllerValidation884
     * @tc.desc    NavBar index validity for 4 probe 884
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation884', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 884) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0885
     * @tc.name    NavAppAnimationControllerValidation885
     * @tc.desc    NavBar index validity for 5 probe 885
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation885', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 885) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0886
     * @tc.name    NavAppAnimationControllerValidation886
     * @tc.desc    NavBar index validity for 6 probe 886
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation886', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 886) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0887
     * @tc.name    NavAppAnimationControllerValidation887
     * @tc.desc    NavBar index validity for 7 probe 887
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation887', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 887) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0888
     * @tc.name    NavAppAnimationControllerValidation888
     * @tc.desc    NavBar index validity for 0 probe 888
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation888', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 888) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0889
     * @tc.name    NavAppAnimationControllerValidation889
     * @tc.desc    NavBar index validity for 1 probe 889
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation889', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 889) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0890
     * @tc.name    NavAppAnimationControllerValidation890
     * @tc.desc    NavBar index validity for 2 probe 890
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation890', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 890) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0891
     * @tc.name    NavAppAnimationControllerValidation891
     * @tc.desc    NavBar index validity for 3 probe 891
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation891', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 891) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0892
     * @tc.name    NavAppAnimationControllerValidation892
     * @tc.desc    NavBar index validity for 4 probe 892
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation892', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 892) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0893
     * @tc.name    NavAppAnimationControllerValidation893
     * @tc.desc    NavBar index validity for 5 probe 893
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation893', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 893) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0894
     * @tc.name    NavAppAnimationControllerValidation894
     * @tc.desc    NavBar index validity for 6 probe 894
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation894', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 894) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0895
     * @tc.name    NavAppAnimationControllerValidation895
     * @tc.desc    NavBar index validity for 7 probe 895
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation895', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 895) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0896
     * @tc.name    NavAppAnimationControllerValidation896
     * @tc.desc    NavBar index validity for 0 probe 896
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation896', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 896) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0897
     * @tc.name    NavAppAnimationControllerValidation897
     * @tc.desc    NavBar index validity for 1 probe 897
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation897', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 897) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0898
     * @tc.name    NavAppAnimationControllerValidation898
     * @tc.desc    NavBar index validity for 2 probe 898
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation898', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 898) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0899
     * @tc.name    NavAppAnimationControllerValidation899
     * @tc.desc    NavBar index validity for 3 probe 899
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation899', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 899) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0900
     * @tc.name    NavAppAnimationControllerValidation900
     * @tc.desc    NavBar index validity for 4 probe 900
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation900', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 900) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0901
     * @tc.name    NavAppAnimationControllerValidation901
     * @tc.desc    NavBar index validity for 5 probe 901
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation901', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 901) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0902
     * @tc.name    NavAppAnimationControllerValidation902
     * @tc.desc    NavBar index validity for 6 probe 902
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation902', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 902) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0903
     * @tc.name    NavAppAnimationControllerValidation903
     * @tc.desc    NavBar index validity for 7 probe 903
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation903', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 903) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0904
     * @tc.name    NavAppAnimationControllerValidation904
     * @tc.desc    NavBar index validity for 0 probe 904
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation904', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 904) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0905
     * @tc.name    NavAppAnimationControllerValidation905
     * @tc.desc    NavBar index validity for 1 probe 905
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation905', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 905) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0906
     * @tc.name    NavAppAnimationControllerValidation906
     * @tc.desc    NavBar index validity for 2 probe 906
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation906', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 906) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0907
     * @tc.name    NavAppAnimationControllerValidation907
     * @tc.desc    NavBar index validity for 3 probe 907
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation907', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 907) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0908
     * @tc.name    NavAppAnimationControllerValidation908
     * @tc.desc    NavBar index validity for 4 probe 908
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation908', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 908) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0909
     * @tc.name    NavAppAnimationControllerValidation909
     * @tc.desc    NavBar index validity for 5 probe 909
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation909', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 909) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0910
     * @tc.name    NavAppAnimationControllerValidation910
     * @tc.desc    NavBar index validity for 6 probe 910
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation910', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 910) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0911
     * @tc.name    NavAppAnimationControllerValidation911
     * @tc.desc    NavBar index validity for 7 probe 911
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation911', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 911) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0912
     * @tc.name    NavAppAnimationControllerValidation912
     * @tc.desc    NavBar index validity for 0 probe 912
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation912', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 912) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0913
     * @tc.name    NavAppAnimationControllerValidation913
     * @tc.desc    NavBar index validity for 1 probe 913
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation913', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 913) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0914
     * @tc.name    NavAppAnimationControllerValidation914
     * @tc.desc    NavBar index validity for 2 probe 914
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation914', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 914) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0915
     * @tc.name    NavAppAnimationControllerValidation915
     * @tc.desc    NavBar index validity for 3 probe 915
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation915', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 915) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0916
     * @tc.name    NavAppAnimationControllerValidation916
     * @tc.desc    NavBar index validity for 4 probe 916
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation916', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 916) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0917
     * @tc.name    NavAppAnimationControllerValidation917
     * @tc.desc    NavBar index validity for 5 probe 917
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation917', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 917) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0918
     * @tc.name    NavAppAnimationControllerValidation918
     * @tc.desc    NavBar index validity for 6 probe 918
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation918', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 918) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0919
     * @tc.name    NavAppAnimationControllerValidation919
     * @tc.desc    NavBar index validity for 7 probe 919
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation919', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 919) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0920
     * @tc.name    NavAppAnimationControllerValidation920
     * @tc.desc    NavBar index validity for 0 probe 920
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation920', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 920) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0921
     * @tc.name    NavAppAnimationControllerValidation921
     * @tc.desc    NavBar index validity for 1 probe 921
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation921', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 921) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0922
     * @tc.name    NavAppAnimationControllerValidation922
     * @tc.desc    NavBar index validity for 2 probe 922
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation922', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 922) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0923
     * @tc.name    NavAppAnimationControllerValidation923
     * @tc.desc    NavBar index validity for 3 probe 923
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation923', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 923) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0924
     * @tc.name    NavAppAnimationControllerValidation924
     * @tc.desc    NavBar index validity for 4 probe 924
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation924', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 924) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0925
     * @tc.name    NavAppAnimationControllerValidation925
     * @tc.desc    NavBar index validity for 5 probe 925
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation925', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 925) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0926
     * @tc.name    NavAppAnimationControllerValidation926
     * @tc.desc    NavBar index validity for 6 probe 926
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation926', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 926) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0927
     * @tc.name    NavAppAnimationControllerValidation927
     * @tc.desc    NavBar index validity for 7 probe 927
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation927', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 927) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0928
     * @tc.name    NavAppAnimationControllerValidation928
     * @tc.desc    NavBar index validity for 0 probe 928
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation928', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 928) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0929
     * @tc.name    NavAppAnimationControllerValidation929
     * @tc.desc    NavBar index validity for 1 probe 929
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation929', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 929) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0930
     * @tc.name    NavAppAnimationControllerValidation930
     * @tc.desc    NavBar index validity for 2 probe 930
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation930', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 930) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0931
     * @tc.name    NavAppAnimationControllerValidation931
     * @tc.desc    NavBar index validity for 3 probe 931
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation931', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 931) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0932
     * @tc.name    NavAppAnimationControllerValidation932
     * @tc.desc    NavBar index validity for 4 probe 932
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation932', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 932) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0933
     * @tc.name    NavAppAnimationControllerValidation933
     * @tc.desc    NavBar index validity for 5 probe 933
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation933', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 933) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0934
     * @tc.name    NavAppAnimationControllerValidation934
     * @tc.desc    NavBar index validity for 6 probe 934
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation934', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 934) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0935
     * @tc.name    NavAppAnimationControllerValidation935
     * @tc.desc    NavBar index validity for 7 probe 935
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation935', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 935) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0936
     * @tc.name    NavAppAnimationControllerValidation936
     * @tc.desc    NavBar index validity for 0 probe 936
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation936', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 936) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0937
     * @tc.name    NavAppAnimationControllerValidation937
     * @tc.desc    NavBar index validity for 1 probe 937
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation937', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 937) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0938
     * @tc.name    NavAppAnimationControllerValidation938
     * @tc.desc    NavBar index validity for 2 probe 938
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation938', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 938) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0939
     * @tc.name    NavAppAnimationControllerValidation939
     * @tc.desc    NavBar index validity for 3 probe 939
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation939', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 939) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0940
     * @tc.name    NavAppAnimationControllerValidation940
     * @tc.desc    NavBar index validity for 4 probe 940
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation940', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 940) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0941
     * @tc.name    NavAppAnimationControllerValidation941
     * @tc.desc    NavBar index validity for 5 probe 941
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation941', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 941) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0942
     * @tc.name    NavAppAnimationControllerValidation942
     * @tc.desc    NavBar index validity for 6 probe 942
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation942', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 942) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0943
     * @tc.name    NavAppAnimationControllerValidation943
     * @tc.desc    NavBar index validity for 7 probe 943
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation943', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 943) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0944
     * @tc.name    NavAppAnimationControllerValidation944
     * @tc.desc    NavBar index validity for 0 probe 944
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation944', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 944) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0945
     * @tc.name    NavAppAnimationControllerValidation945
     * @tc.desc    NavBar index validity for 1 probe 945
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation945', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 945) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0946
     * @tc.name    NavAppAnimationControllerValidation946
     * @tc.desc    NavBar index validity for 2 probe 946
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation946', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 946) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0947
     * @tc.name    NavAppAnimationControllerValidation947
     * @tc.desc    NavBar index validity for 3 probe 947
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation947', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 947) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0948
     * @tc.name    NavAppAnimationControllerValidation948
     * @tc.desc    NavBar index validity for 4 probe 948
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation948', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 948) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0949
     * @tc.name    NavAppAnimationControllerValidation949
     * @tc.desc    NavBar index validity for 5 probe 949
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation949', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 949) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0950
     * @tc.name    NavAppAnimationControllerValidation950
     * @tc.desc    NavBar index validity for 6 probe 950
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation950', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 950) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0951
     * @tc.name    NavAppAnimationControllerValidation951
     * @tc.desc    NavBar index validity for 7 probe 951
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation951', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 951) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0952
     * @tc.name    NavAppAnimationControllerValidation952
     * @tc.desc    NavBar index validity for 0 probe 952
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation952', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 952) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0953
     * @tc.name    NavAppAnimationControllerValidation953
     * @tc.desc    NavBar index validity for 1 probe 953
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation953', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 953) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0954
     * @tc.name    NavAppAnimationControllerValidation954
     * @tc.desc    NavBar index validity for 2 probe 954
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation954', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 954) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0955
     * @tc.name    NavAppAnimationControllerValidation955
     * @tc.desc    NavBar index validity for 3 probe 955
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation955', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 955) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0956
     * @tc.name    NavAppAnimationControllerValidation956
     * @tc.desc    NavBar index validity for 4 probe 956
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation956', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 956) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0957
     * @tc.name    NavAppAnimationControllerValidation957
     * @tc.desc    NavBar index validity for 5 probe 957
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation957', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 957) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0958
     * @tc.name    NavAppAnimationControllerValidation958
     * @tc.desc    NavBar index validity for 6 probe 958
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation958', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 958) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0959
     * @tc.name    NavAppAnimationControllerValidation959
     * @tc.desc    NavBar index validity for 7 probe 959
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation959', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 959) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0960
     * @tc.name    NavAppAnimationControllerValidation960
     * @tc.desc    NavBar index validity for 0 probe 960
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation960', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 960) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0961
     * @tc.name    NavAppAnimationControllerValidation961
     * @tc.desc    NavBar index validity for 1 probe 961
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation961', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 961) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0962
     * @tc.name    NavAppAnimationControllerValidation962
     * @tc.desc    NavBar index validity for 2 probe 962
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation962', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 962) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0963
     * @tc.name    NavAppAnimationControllerValidation963
     * @tc.desc    NavBar index validity for 3 probe 963
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation963', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 963) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0964
     * @tc.name    NavAppAnimationControllerValidation964
     * @tc.desc    NavBar index validity for 4 probe 964
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation964', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 964) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0965
     * @tc.name    NavAppAnimationControllerValidation965
     * @tc.desc    NavBar index validity for 5 probe 965
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation965', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 965) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0966
     * @tc.name    NavAppAnimationControllerValidation966
     * @tc.desc    NavBar index validity for 6 probe 966
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation966', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 966) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0967
     * @tc.name    NavAppAnimationControllerValidation967
     * @tc.desc    NavBar index validity for 7 probe 967
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation967', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 967) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0968
     * @tc.name    NavAppAnimationControllerValidation968
     * @tc.desc    NavBar index validity for 0 probe 968
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation968', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 968) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0969
     * @tc.name    NavAppAnimationControllerValidation969
     * @tc.desc    NavBar index validity for 1 probe 969
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation969', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 969) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0970
     * @tc.name    NavAppAnimationControllerValidation970
     * @tc.desc    NavBar index validity for 2 probe 970
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation970', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 970) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0971
     * @tc.name    NavAppAnimationControllerValidation971
     * @tc.desc    NavBar index validity for 3 probe 971
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation971', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 971) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0972
     * @tc.name    NavAppAnimationControllerValidation972
     * @tc.desc    NavBar index validity for 4 probe 972
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation972', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 972) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0973
     * @tc.name    NavAppAnimationControllerValidation973
     * @tc.desc    NavBar index validity for 5 probe 973
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation973', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 5;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 973) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0974
     * @tc.name    NavAppAnimationControllerValidation974
     * @tc.desc    NavBar index validity for 6 probe 974
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation974', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 6;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 974) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0975
     * @tc.name    NavAppAnimationControllerValidation975
     * @tc.desc    NavBar index validity for 7 probe 975
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation975', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 7;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 975) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0976
     * @tc.name    NavAppAnimationControllerValidation976
     * @tc.desc    NavBar index validity for 0 probe 976
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation976', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 976) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0977
     * @tc.name    NavAppAnimationControllerValidation977
     * @tc.desc    NavBar index validity for 1 probe 977
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation977', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 977) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0978
     * @tc.name    NavAppAnimationControllerValidation978
     * @tc.desc    NavBar index validity for 2 probe 978
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation978', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 978) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0979
     * @tc.name    NavAppAnimationControllerValidation979
     * @tc.desc    NavBar index validity for 3 probe 979
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation979', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 979) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0980
     * @tc.name    NavAppAnimationControllerValidation980
     * @tc.desc    NavBar index validity for 4 probe 980
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppAnimationControllerValidation980', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.isValidIndex(idx)).assertEqual(idx >= 0 && idx < m.getTopCount());
      expect(m.getNode(1000 + 980) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
