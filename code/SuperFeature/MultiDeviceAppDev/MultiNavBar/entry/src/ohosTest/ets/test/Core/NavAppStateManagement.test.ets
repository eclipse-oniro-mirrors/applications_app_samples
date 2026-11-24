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

export default function navAppStateManagementSuite() {
  describe('NavAppStateManagementSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0001
     * @tc.name    NavAppStateManagement001
     * @tc.desc    NavBar sub count for top 1 probe 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 1) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0002
     * @tc.name    NavAppStateManagement002
     * @tc.desc    NavBar sub count for top 2 probe 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 2) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0003
     * @tc.name    NavAppStateManagement003
     * @tc.desc    NavBar sub count for top 3 probe 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 3) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0004
     * @tc.name    NavAppStateManagement004
     * @tc.desc    NavBar sub count for top 4 probe 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 4) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0005
     * @tc.name    NavAppStateManagement005
     * @tc.desc    NavBar sub count for top 0 probe 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 5) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0006
     * @tc.name    NavAppStateManagement006
     * @tc.desc    NavBar sub count for top 1 probe 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 6) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0007
     * @tc.name    NavAppStateManagement007
     * @tc.desc    NavBar sub count for top 2 probe 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 7) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0008
     * @tc.name    NavAppStateManagement008
     * @tc.desc    NavBar sub count for top 3 probe 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 8) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0009
     * @tc.name    NavAppStateManagement009
     * @tc.desc    NavBar sub count for top 4 probe 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 9) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0010
     * @tc.name    NavAppStateManagement010
     * @tc.desc    NavBar sub count for top 0 probe 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 10) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0011
     * @tc.name    NavAppStateManagement011
     * @tc.desc    NavBar sub count for top 1 probe 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 11) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0012
     * @tc.name    NavAppStateManagement012
     * @tc.desc    NavBar sub count for top 2 probe 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 12) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0013
     * @tc.name    NavAppStateManagement013
     * @tc.desc    NavBar sub count for top 3 probe 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 13) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0014
     * @tc.name    NavAppStateManagement014
     * @tc.desc    NavBar sub count for top 4 probe 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 14) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0015
     * @tc.name    NavAppStateManagement015
     * @tc.desc    NavBar sub count for top 0 probe 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 15) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0016
     * @tc.name    NavAppStateManagement016
     * @tc.desc    NavBar sub count for top 1 probe 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 16) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0017
     * @tc.name    NavAppStateManagement017
     * @tc.desc    NavBar sub count for top 2 probe 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 17) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0018
     * @tc.name    NavAppStateManagement018
     * @tc.desc    NavBar sub count for top 3 probe 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 18) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0019
     * @tc.name    NavAppStateManagement019
     * @tc.desc    NavBar sub count for top 4 probe 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 19) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0020
     * @tc.name    NavAppStateManagement020
     * @tc.desc    NavBar sub count for top 0 probe 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 20) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0021
     * @tc.name    NavAppStateManagement021
     * @tc.desc    NavBar sub count for top 1 probe 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 21) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0022
     * @tc.name    NavAppStateManagement022
     * @tc.desc    NavBar sub count for top 2 probe 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 22) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0023
     * @tc.name    NavAppStateManagement023
     * @tc.desc    NavBar sub count for top 3 probe 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 23) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0024
     * @tc.name    NavAppStateManagement024
     * @tc.desc    NavBar sub count for top 4 probe 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 24) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0025
     * @tc.name    NavAppStateManagement025
     * @tc.desc    NavBar sub count for top 0 probe 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 25) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0026
     * @tc.name    NavAppStateManagement026
     * @tc.desc    NavBar sub count for top 1 probe 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 26) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0027
     * @tc.name    NavAppStateManagement027
     * @tc.desc    NavBar sub count for top 2 probe 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 27) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0028
     * @tc.name    NavAppStateManagement028
     * @tc.desc    NavBar sub count for top 3 probe 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 28) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0029
     * @tc.name    NavAppStateManagement029
     * @tc.desc    NavBar sub count for top 4 probe 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 29) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0030
     * @tc.name    NavAppStateManagement030
     * @tc.desc    NavBar sub count for top 0 probe 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 30) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0031
     * @tc.name    NavAppStateManagement031
     * @tc.desc    NavBar sub count for top 1 probe 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 31) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0032
     * @tc.name    NavAppStateManagement032
     * @tc.desc    NavBar sub count for top 2 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 32) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0033
     * @tc.name    NavAppStateManagement033
     * @tc.desc    NavBar sub count for top 3 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 33) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0034
     * @tc.name    NavAppStateManagement034
     * @tc.desc    NavBar sub count for top 4 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 34) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0035
     * @tc.name    NavAppStateManagement035
     * @tc.desc    NavBar sub count for top 0 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 35) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0036
     * @tc.name    NavAppStateManagement036
     * @tc.desc    NavBar sub count for top 1 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 36) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0037
     * @tc.name    NavAppStateManagement037
     * @tc.desc    NavBar sub count for top 2 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 37) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0038
     * @tc.name    NavAppStateManagement038
     * @tc.desc    NavBar sub count for top 3 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 38) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0039
     * @tc.name    NavAppStateManagement039
     * @tc.desc    NavBar sub count for top 4 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 39) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0040
     * @tc.name    NavAppStateManagement040
     * @tc.desc    NavBar sub count for top 0 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 40) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0041
     * @tc.name    NavAppStateManagement041
     * @tc.desc    NavBar sub count for top 1 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 41) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0042
     * @tc.name    NavAppStateManagement042
     * @tc.desc    NavBar sub count for top 2 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 42) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0043
     * @tc.name    NavAppStateManagement043
     * @tc.desc    NavBar sub count for top 3 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 43) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0044
     * @tc.name    NavAppStateManagement044
     * @tc.desc    NavBar sub count for top 4 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 44) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0045
     * @tc.name    NavAppStateManagement045
     * @tc.desc    NavBar sub count for top 0 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 45) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0046
     * @tc.name    NavAppStateManagement046
     * @tc.desc    NavBar sub count for top 1 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 46) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0047
     * @tc.name    NavAppStateManagement047
     * @tc.desc    NavBar sub count for top 2 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 47) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0048
     * @tc.name    NavAppStateManagement048
     * @tc.desc    NavBar sub count for top 3 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 48) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0049
     * @tc.name    NavAppStateManagement049
     * @tc.desc    NavBar sub count for top 4 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 49) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0050
     * @tc.name    NavAppStateManagement050
     * @tc.desc    NavBar sub count for top 0 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 50) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0051
     * @tc.name    NavAppStateManagement051
     * @tc.desc    NavBar sub count for top 1 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 51) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0052
     * @tc.name    NavAppStateManagement052
     * @tc.desc    NavBar sub count for top 2 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 52) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0053
     * @tc.name    NavAppStateManagement053
     * @tc.desc    NavBar sub count for top 3 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 53) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0054
     * @tc.name    NavAppStateManagement054
     * @tc.desc    NavBar sub count for top 4 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 54) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0055
     * @tc.name    NavAppStateManagement055
     * @tc.desc    NavBar sub count for top 0 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 55) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0056
     * @tc.name    NavAppStateManagement056
     * @tc.desc    NavBar sub count for top 1 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 56) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0057
     * @tc.name    NavAppStateManagement057
     * @tc.desc    NavBar sub count for top 2 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 57) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0058
     * @tc.name    NavAppStateManagement058
     * @tc.desc    NavBar sub count for top 3 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 58) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0059
     * @tc.name    NavAppStateManagement059
     * @tc.desc    NavBar sub count for top 4 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 59) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0060
     * @tc.name    NavAppStateManagement060
     * @tc.desc    NavBar sub count for top 0 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 60) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0061
     * @tc.name    NavAppStateManagement061
     * @tc.desc    NavBar sub count for top 1 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 61) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0062
     * @tc.name    NavAppStateManagement062
     * @tc.desc    NavBar sub count for top 2 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 62) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0063
     * @tc.name    NavAppStateManagement063
     * @tc.desc    NavBar sub count for top 3 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 63) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0064
     * @tc.name    NavAppStateManagement064
     * @tc.desc    NavBar sub count for top 4 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 64) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0065
     * @tc.name    NavAppStateManagement065
     * @tc.desc    NavBar sub count for top 0 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 65) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0066
     * @tc.name    NavAppStateManagement066
     * @tc.desc    NavBar sub count for top 1 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 66) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0067
     * @tc.name    NavAppStateManagement067
     * @tc.desc    NavBar sub count for top 2 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 67) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0068
     * @tc.name    NavAppStateManagement068
     * @tc.desc    NavBar sub count for top 3 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 68) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0069
     * @tc.name    NavAppStateManagement069
     * @tc.desc    NavBar sub count for top 4 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 69) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0070
     * @tc.name    NavAppStateManagement070
     * @tc.desc    NavBar sub count for top 0 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 70) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0071
     * @tc.name    NavAppStateManagement071
     * @tc.desc    NavBar sub count for top 1 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 71) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0072
     * @tc.name    NavAppStateManagement072
     * @tc.desc    NavBar sub count for top 2 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 72) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0073
     * @tc.name    NavAppStateManagement073
     * @tc.desc    NavBar sub count for top 3 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 73) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0074
     * @tc.name    NavAppStateManagement074
     * @tc.desc    NavBar sub count for top 4 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 74) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0075
     * @tc.name    NavAppStateManagement075
     * @tc.desc    NavBar sub count for top 0 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 75) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0076
     * @tc.name    NavAppStateManagement076
     * @tc.desc    NavBar sub count for top 1 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 76) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0077
     * @tc.name    NavAppStateManagement077
     * @tc.desc    NavBar sub count for top 2 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 77) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0078
     * @tc.name    NavAppStateManagement078
     * @tc.desc    NavBar sub count for top 3 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 78) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0079
     * @tc.name    NavAppStateManagement079
     * @tc.desc    NavBar sub count for top 4 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 79) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0080
     * @tc.name    NavAppStateManagement080
     * @tc.desc    NavBar sub count for top 0 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 80) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0081
     * @tc.name    NavAppStateManagement081
     * @tc.desc    NavBar sub count for top 1 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 81) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0082
     * @tc.name    NavAppStateManagement082
     * @tc.desc    NavBar sub count for top 2 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 82) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0083
     * @tc.name    NavAppStateManagement083
     * @tc.desc    NavBar sub count for top 3 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 83) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0084
     * @tc.name    NavAppStateManagement084
     * @tc.desc    NavBar sub count for top 4 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 84) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0085
     * @tc.name    NavAppStateManagement085
     * @tc.desc    NavBar sub count for top 0 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 85) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0086
     * @tc.name    NavAppStateManagement086
     * @tc.desc    NavBar sub count for top 1 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 86) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0087
     * @tc.name    NavAppStateManagement087
     * @tc.desc    NavBar sub count for top 2 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 87) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0088
     * @tc.name    NavAppStateManagement088
     * @tc.desc    NavBar sub count for top 3 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 88) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0089
     * @tc.name    NavAppStateManagement089
     * @tc.desc    NavBar sub count for top 4 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 89) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0090
     * @tc.name    NavAppStateManagement090
     * @tc.desc    NavBar sub count for top 0 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 90) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0091
     * @tc.name    NavAppStateManagement091
     * @tc.desc    NavBar sub count for top 1 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 91) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0092
     * @tc.name    NavAppStateManagement092
     * @tc.desc    NavBar sub count for top 2 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 92) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0093
     * @tc.name    NavAppStateManagement093
     * @tc.desc    NavBar sub count for top 3 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 93) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0094
     * @tc.name    NavAppStateManagement094
     * @tc.desc    NavBar sub count for top 4 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 94) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0095
     * @tc.name    NavAppStateManagement095
     * @tc.desc    NavBar sub count for top 0 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 95) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0096
     * @tc.name    NavAppStateManagement096
     * @tc.desc    NavBar sub count for top 1 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 96) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0097
     * @tc.name    NavAppStateManagement097
     * @tc.desc    NavBar sub count for top 2 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 97) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0098
     * @tc.name    NavAppStateManagement098
     * @tc.desc    NavBar sub count for top 3 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 98) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0099
     * @tc.name    NavAppStateManagement099
     * @tc.desc    NavBar sub count for top 4 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 99) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0100
     * @tc.name    NavAppStateManagement100
     * @tc.desc    NavBar sub count for top 0 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 100) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0101
     * @tc.name    NavAppStateManagement101
     * @tc.desc    NavBar sub count for top 1 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 101) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0102
     * @tc.name    NavAppStateManagement102
     * @tc.desc    NavBar sub count for top 2 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 102) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0103
     * @tc.name    NavAppStateManagement103
     * @tc.desc    NavBar sub count for top 3 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateManagement103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.getSubCount(idx)).assertEqual(NAV_SUB_COUNTS[idx]);
      expect(m.countChildrenOf(idx)).assertEqual(0);
      expect(m.getNode(1000 + 103) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

