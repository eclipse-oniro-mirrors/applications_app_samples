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

export default function navAppStateStoreSuite() {
  describe('NavAppStateStoreSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0525
     * @tc.name    NavAppStateStore525
     * @tc.desc    NavBar fresh model 525 probe 525
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore525', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 525) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0526
     * @tc.name    NavAppStateStore526
     * @tc.desc    NavBar fresh model 526 probe 526
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore526', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 526) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0527
     * @tc.name    NavAppStateStore527
     * @tc.desc    NavBar fresh model 527 probe 527
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore527', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 527) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0528
     * @tc.name    NavAppStateStore528
     * @tc.desc    NavBar fresh model 528 probe 528
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore528', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 528) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0529
     * @tc.name    NavAppStateStore529
     * @tc.desc    NavBar fresh model 529 probe 529
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore529', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 529) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0530
     * @tc.name    NavAppStateStore530
     * @tc.desc    NavBar fresh model 530 probe 530
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore530', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 530) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0531
     * @tc.name    NavAppStateStore531
     * @tc.desc    NavBar fresh model 531 probe 531
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore531', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 531) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0532
     * @tc.name    NavAppStateStore532
     * @tc.desc    NavBar fresh model 532 probe 532
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore532', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 532) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0533
     * @tc.name    NavAppStateStore533
     * @tc.desc    NavBar fresh model 533 probe 533
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore533', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 533) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0534
     * @tc.name    NavAppStateStore534
     * @tc.desc    NavBar fresh model 534 probe 534
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore534', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 534) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0535
     * @tc.name    NavAppStateStore535
     * @tc.desc    NavBar fresh model 535 probe 535
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore535', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 535) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0536
     * @tc.name    NavAppStateStore536
     * @tc.desc    NavBar fresh model 536 probe 536
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore536', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 536) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0537
     * @tc.name    NavAppStateStore537
     * @tc.desc    NavBar fresh model 537 probe 537
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore537', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 537) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0538
     * @tc.name    NavAppStateStore538
     * @tc.desc    NavBar fresh model 538 probe 538
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore538', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 538) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0539
     * @tc.name    NavAppStateStore539
     * @tc.desc    NavBar fresh model 539 probe 539
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore539', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 539) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0540
     * @tc.name    NavAppStateStore540
     * @tc.desc    NavBar fresh model 540 probe 540
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore540', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 540) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0541
     * @tc.name    NavAppStateStore541
     * @tc.desc    NavBar fresh model 541 probe 541
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore541', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 541) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0542
     * @tc.name    NavAppStateStore542
     * @tc.desc    NavBar fresh model 542 probe 542
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore542', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 542) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0543
     * @tc.name    NavAppStateStore543
     * @tc.desc    NavBar fresh model 543 probe 543
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore543', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 543) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0544
     * @tc.name    NavAppStateStore544
     * @tc.desc    NavBar fresh model 544 probe 544
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore544', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 544) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0545
     * @tc.name    NavAppStateStore545
     * @tc.desc    NavBar fresh model 545 probe 545
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore545', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 545) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0546
     * @tc.name    NavAppStateStore546
     * @tc.desc    NavBar fresh model 546 probe 546
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore546', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 546) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0547
     * @tc.name    NavAppStateStore547
     * @tc.desc    NavBar fresh model 547 probe 547
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore547', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 547) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0548
     * @tc.name    NavAppStateStore548
     * @tc.desc    NavBar fresh model 548 probe 548
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore548', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 548) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0549
     * @tc.name    NavAppStateStore549
     * @tc.desc    NavBar fresh model 549 probe 549
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore549', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 549) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0550
     * @tc.name    NavAppStateStore550
     * @tc.desc    NavBar fresh model 550 probe 550
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore550', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 550) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0551
     * @tc.name    NavAppStateStore551
     * @tc.desc    NavBar fresh model 551 probe 551
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore551', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 551) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0552
     * @tc.name    NavAppStateStore552
     * @tc.desc    NavBar fresh model 552 probe 552
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore552', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 552) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0553
     * @tc.name    NavAppStateStore553
     * @tc.desc    NavBar fresh model 553 probe 553
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore553', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 553) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0554
     * @tc.name    NavAppStateStore554
     * @tc.desc    NavBar fresh model 554 probe 554
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore554', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 554) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0555
     * @tc.name    NavAppStateStore555
     * @tc.desc    NavBar fresh model 555 probe 555
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore555', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 555) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0556
     * @tc.name    NavAppStateStore556
     * @tc.desc    NavBar fresh model 556 probe 556
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore556', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 556) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0557
     * @tc.name    NavAppStateStore557
     * @tc.desc    NavBar fresh model 557 probe 557
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore557', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 557) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0558
     * @tc.name    NavAppStateStore558
     * @tc.desc    NavBar fresh model 558 probe 558
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore558', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 558) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0559
     * @tc.name    NavAppStateStore559
     * @tc.desc    NavBar fresh model 559 probe 559
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore559', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 559) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0560
     * @tc.name    NavAppStateStore560
     * @tc.desc    NavBar fresh model 560 probe 560
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore560', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 560) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0561
     * @tc.name    NavAppStateStore561
     * @tc.desc    NavBar fresh model 561 probe 561
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore561', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 561) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0562
     * @tc.name    NavAppStateStore562
     * @tc.desc    NavBar fresh model 562 probe 562
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore562', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 562) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0563
     * @tc.name    NavAppStateStore563
     * @tc.desc    NavBar fresh model 563 probe 563
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore563', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 563) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0564
     * @tc.name    NavAppStateStore564
     * @tc.desc    NavBar fresh model 564 probe 564
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore564', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 564) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0565
     * @tc.name    NavAppStateStore565
     * @tc.desc    NavBar fresh model 565 probe 565
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore565', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 565) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0566
     * @tc.name    NavAppStateStore566
     * @tc.desc    NavBar fresh model 566 probe 566
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore566', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 566) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0567
     * @tc.name    NavAppStateStore567
     * @tc.desc    NavBar fresh model 567 probe 567
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore567', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 567) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0568
     * @tc.name    NavAppStateStore568
     * @tc.desc    NavBar fresh model 568 probe 568
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore568', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 568) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0569
     * @tc.name    NavAppStateStore569
     * @tc.desc    NavBar fresh model 569 probe 569
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore569', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 569) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0570
     * @tc.name    NavAppStateStore570
     * @tc.desc    NavBar fresh model 570 probe 570
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore570', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 570) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0571
     * @tc.name    NavAppStateStore571
     * @tc.desc    NavBar fresh model 571 probe 571
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore571', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 571) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0572
     * @tc.name    NavAppStateStore572
     * @tc.desc    NavBar fresh model 572 probe 572
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore572', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 572) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0573
     * @tc.name    NavAppStateStore573
     * @tc.desc    NavBar fresh model 573 probe 573
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore573', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 573) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0574
     * @tc.name    NavAppStateStore574
     * @tc.desc    NavBar fresh model 574 probe 574
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore574', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 574) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0575
     * @tc.name    NavAppStateStore575
     * @tc.desc    NavBar fresh model 575 probe 575
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore575', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 575) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0576
     * @tc.name    NavAppStateStore576
     * @tc.desc    NavBar fresh model 576 probe 576
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore576', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 576) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0577
     * @tc.name    NavAppStateStore577
     * @tc.desc    NavBar fresh model 577 probe 577
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore577', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 577) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0578
     * @tc.name    NavAppStateStore578
     * @tc.desc    NavBar fresh model 578 probe 578
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore578', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 578) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0579
     * @tc.name    NavAppStateStore579
     * @tc.desc    NavBar fresh model 579 probe 579
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore579', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 579) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0580
     * @tc.name    NavAppStateStore580
     * @tc.desc    NavBar fresh model 580 probe 580
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore580', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 580) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0581
     * @tc.name    NavAppStateStore581
     * @tc.desc    NavBar fresh model 581 probe 581
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore581', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 581) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0582
     * @tc.name    NavAppStateStore582
     * @tc.desc    NavBar fresh model 582 probe 582
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore582', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 582) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0583
     * @tc.name    NavAppStateStore583
     * @tc.desc    NavBar fresh model 583 probe 583
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore583', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 583) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0584
     * @tc.name    NavAppStateStore584
     * @tc.desc    NavBar fresh model 584 probe 584
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore584', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 584) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0585
     * @tc.name    NavAppStateStore585
     * @tc.desc    NavBar fresh model 585 probe 585
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore585', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 585) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0586
     * @tc.name    NavAppStateStore586
     * @tc.desc    NavBar fresh model 586 probe 586
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore586', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 586) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0587
     * @tc.name    NavAppStateStore587
     * @tc.desc    NavBar fresh model 587 probe 587
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore587', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 587) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0588
     * @tc.name    NavAppStateStore588
     * @tc.desc    NavBar fresh model 588 probe 588
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore588', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 588) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0589
     * @tc.name    NavAppStateStore589
     * @tc.desc    NavBar fresh model 589 probe 589
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore589', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 589) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0590
     * @tc.name    NavAppStateStore590
     * @tc.desc    NavBar fresh model 590 probe 590
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore590', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 590) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0591
     * @tc.name    NavAppStateStore591
     * @tc.desc    NavBar fresh model 591 probe 591
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore591', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 591) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0592
     * @tc.name    NavAppStateStore592
     * @tc.desc    NavBar fresh model 592 probe 592
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore592', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 592) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0593
     * @tc.name    NavAppStateStore593
     * @tc.desc    NavBar fresh model 593 probe 593
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore593', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 593) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0594
     * @tc.name    NavAppStateStore594
     * @tc.desc    NavBar fresh model 594 probe 594
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore594', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 594) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0595
     * @tc.name    NavAppStateStore595
     * @tc.desc    NavBar fresh model 595 probe 595
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore595', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 595) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0596
     * @tc.name    NavAppStateStore596
     * @tc.desc    NavBar fresh model 596 probe 596
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore596', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 596) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0597
     * @tc.name    NavAppStateStore597
     * @tc.desc    NavBar fresh model 597 probe 597
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore597', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 597) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0598
     * @tc.name    NavAppStateStore598
     * @tc.desc    NavBar fresh model 598 probe 598
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore598', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 598) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0599
     * @tc.name    NavAppStateStore599
     * @tc.desc    NavBar fresh model 599 probe 599
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore599', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 599) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0600
     * @tc.name    NavAppStateStore600
     * @tc.desc    NavBar fresh model 600 probe 600
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore600', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 600) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0601
     * @tc.name    NavAppStateStore601
     * @tc.desc    NavBar fresh model 601 probe 601
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore601', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 601) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0602
     * @tc.name    NavAppStateStore602
     * @tc.desc    NavBar fresh model 602 probe 602
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore602', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 602) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0603
     * @tc.name    NavAppStateStore603
     * @tc.desc    NavBar fresh model 603 probe 603
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore603', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 603) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0604
     * @tc.name    NavAppStateStore604
     * @tc.desc    NavBar fresh model 604 probe 604
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore604', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 604) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0605
     * @tc.name    NavAppStateStore605
     * @tc.desc    NavBar fresh model 605 probe 605
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore605', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 605) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0606
     * @tc.name    NavAppStateStore606
     * @tc.desc    NavBar fresh model 606 probe 606
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore606', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 606) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0607
     * @tc.name    NavAppStateStore607
     * @tc.desc    NavBar fresh model 607 probe 607
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore607', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 607) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0608
     * @tc.name    NavAppStateStore608
     * @tc.desc    NavBar fresh model 608 probe 608
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore608', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 608) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0609
     * @tc.name    NavAppStateStore609
     * @tc.desc    NavBar fresh model 609 probe 609
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore609', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 609) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0610
     * @tc.name    NavAppStateStore610
     * @tc.desc    NavBar fresh model 610 probe 610
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore610', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 610) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0611
     * @tc.name    NavAppStateStore611
     * @tc.desc    NavBar fresh model 611 probe 611
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore611', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 611) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0612
     * @tc.name    NavAppStateStore612
     * @tc.desc    NavBar fresh model 612 probe 612
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore612', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 612) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0613
     * @tc.name    NavAppStateStore613
     * @tc.desc    NavBar fresh model 613 probe 613
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore613', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 613) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0614
     * @tc.name    NavAppStateStore614
     * @tc.desc    NavBar fresh model 614 probe 614
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore614', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 614) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0615
     * @tc.name    NavAppStateStore615
     * @tc.desc    NavBar fresh model 615 probe 615
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore615', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 615) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0616
     * @tc.name    NavAppStateStore616
     * @tc.desc    NavBar fresh model 616 probe 616
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore616', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 616) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0617
     * @tc.name    NavAppStateStore617
     * @tc.desc    NavBar fresh model 617 probe 617
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore617', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 617) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0618
     * @tc.name    NavAppStateStore618
     * @tc.desc    NavBar fresh model 618 probe 618
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore618', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 618) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0619
     * @tc.name    NavAppStateStore619
     * @tc.desc    NavBar fresh model 619 probe 619
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore619', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 619) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0620
     * @tc.name    NavAppStateStore620
     * @tc.desc    NavBar fresh model 620 probe 620
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore620', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 620) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0621
     * @tc.name    NavAppStateStore621
     * @tc.desc    NavBar fresh model 621 probe 621
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore621', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 621) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0622
     * @tc.name    NavAppStateStore622
     * @tc.desc    NavBar fresh model 622 probe 622
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore622', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 622) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0623
     * @tc.name    NavAppStateStore623
     * @tc.desc    NavBar fresh model 623 probe 623
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore623', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 623) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0624
     * @tc.name    NavAppStateStore624
     * @tc.desc    NavBar fresh model 624 probe 624
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore624', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 624) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0625
     * @tc.name    NavAppStateStore625
     * @tc.desc    NavBar fresh model 625 probe 625
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore625', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 625) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0626
     * @tc.name    NavAppStateStore626
     * @tc.desc    NavBar fresh model 626 probe 626
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore626', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 626) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0627
     * @tc.name    NavAppStateStore627
     * @tc.desc    NavBar fresh model 627 probe 627
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore627', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 627) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0628
     * @tc.name    NavAppStateStore628
     * @tc.desc    NavBar fresh model 628 probe 628
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore628', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 628) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0629
     * @tc.name    NavAppStateStore629
     * @tc.desc    NavBar fresh model 629 probe 629
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore629', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 629) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0630
     * @tc.name    NavAppStateStore630
     * @tc.desc    NavBar fresh model 630 probe 630
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore630', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 630) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0631
     * @tc.name    NavAppStateStore631
     * @tc.desc    NavBar fresh model 631 probe 631
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore631', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 631) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0632
     * @tc.name    NavAppStateStore632
     * @tc.desc    NavBar fresh model 632 probe 632
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore632', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 632) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0633
     * @tc.name    NavAppStateStore633
     * @tc.desc    NavBar fresh model 633 probe 633
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore633', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 633) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0634
     * @tc.name    NavAppStateStore634
     * @tc.desc    NavBar fresh model 634 probe 634
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore634', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 634) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0635
     * @tc.name    NavAppStateStore635
     * @tc.desc    NavBar fresh model 635 probe 635
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore635', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 635) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0636
     * @tc.name    NavAppStateStore636
     * @tc.desc    NavBar fresh model 636 probe 636
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore636', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 636) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0637
     * @tc.name    NavAppStateStore637
     * @tc.desc    NavBar fresh model 637 probe 637
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore637', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 637) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0638
     * @tc.name    NavAppStateStore638
     * @tc.desc    NavBar fresh model 638 probe 638
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore638', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 638) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0639
     * @tc.name    NavAppStateStore639
     * @tc.desc    NavBar fresh model 639 probe 639
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore639', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 639) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0640
     * @tc.name    NavAppStateStore640
     * @tc.desc    NavBar fresh model 640 probe 640
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore640', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 640) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0641
     * @tc.name    NavAppStateStore641
     * @tc.desc    NavBar fresh model 641 probe 641
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore641', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 641) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0642
     * @tc.name    NavAppStateStore642
     * @tc.desc    NavBar fresh model 642 probe 642
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore642', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 642) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0643
     * @tc.name    NavAppStateStore643
     * @tc.desc    NavBar fresh model 643 probe 643
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore643', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 643) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0644
     * @tc.name    NavAppStateStore644
     * @tc.desc    NavBar fresh model 644 probe 644
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore644', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 644) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0645
     * @tc.name    NavAppStateStore645
     * @tc.desc    NavBar fresh model 645 probe 645
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore645', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 645) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0646
     * @tc.name    NavAppStateStore646
     * @tc.desc    NavBar fresh model 646 probe 646
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore646', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 646) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0647
     * @tc.name    NavAppStateStore647
     * @tc.desc    NavBar fresh model 647 probe 647
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore647', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 647) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0648
     * @tc.name    NavAppStateStore648
     * @tc.desc    NavBar fresh model 648 probe 648
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore648', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 648) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0649
     * @tc.name    NavAppStateStore649
     * @tc.desc    NavBar fresh model 649 probe 649
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore649', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 649) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0650
     * @tc.name    NavAppStateStore650
     * @tc.desc    NavBar fresh model 650 probe 650
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore650', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 650) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0651
     * @tc.name    NavAppStateStore651
     * @tc.desc    NavBar fresh model 651 probe 651
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore651', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 651) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0652
     * @tc.name    NavAppStateStore652
     * @tc.desc    NavBar fresh model 652 probe 652
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore652', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 652) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0653
     * @tc.name    NavAppStateStore653
     * @tc.desc    NavBar fresh model 653 probe 653
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore653', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 653) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0654
     * @tc.name    NavAppStateStore654
     * @tc.desc    NavBar fresh model 654 probe 654
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore654', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 654) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0655
     * @tc.name    NavAppStateStore655
     * @tc.desc    NavBar fresh model 655 probe 655
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore655', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 655) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0656
     * @tc.name    NavAppStateStore656
     * @tc.desc    NavBar fresh model 656 probe 656
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore656', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 656) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0657
     * @tc.name    NavAppStateStore657
     * @tc.desc    NavBar fresh model 657 probe 657
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore657', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 657) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0658
     * @tc.name    NavAppStateStore658
     * @tc.desc    NavBar fresh model 658 probe 658
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore658', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 658) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0659
     * @tc.name    NavAppStateStore659
     * @tc.desc    NavBar fresh model 659 probe 659
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore659', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 659) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0660
     * @tc.name    NavAppStateStore660
     * @tc.desc    NavBar fresh model 660 probe 660
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore660', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 660) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0661
     * @tc.name    NavAppStateStore661
     * @tc.desc    NavBar fresh model 661 probe 661
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore661', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 661) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0662
     * @tc.name    NavAppStateStore662
     * @tc.desc    NavBar fresh model 662 probe 662
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore662', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 662) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0663
     * @tc.name    NavAppStateStore663
     * @tc.desc    NavBar fresh model 663 probe 663
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore663', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 663) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0664
     * @tc.name    NavAppStateStore664
     * @tc.desc    NavBar fresh model 664 probe 664
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore664', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 664) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0665
     * @tc.name    NavAppStateStore665
     * @tc.desc    NavBar fresh model 665 probe 665
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore665', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 665) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0666
     * @tc.name    NavAppStateStore666
     * @tc.desc    NavBar fresh model 666 probe 666
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore666', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 666) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0667
     * @tc.name    NavAppStateStore667
     * @tc.desc    NavBar fresh model 667 probe 667
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore667', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 667) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0668
     * @tc.name    NavAppStateStore668
     * @tc.desc    NavBar fresh model 668 probe 668
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore668', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 668) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0669
     * @tc.name    NavAppStateStore669
     * @tc.desc    NavBar fresh model 669 probe 669
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore669', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 669) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0670
     * @tc.name    NavAppStateStore670
     * @tc.desc    NavBar fresh model 670 probe 670
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore670', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 670) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0671
     * @tc.name    NavAppStateStore671
     * @tc.desc    NavBar fresh model 671 probe 671
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore671', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 671) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0672
     * @tc.name    NavAppStateStore672
     * @tc.desc    NavBar fresh model 672 probe 672
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore672', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 672) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0673
     * @tc.name    NavAppStateStore673
     * @tc.desc    NavBar fresh model 673 probe 673
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore673', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 673) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0674
     * @tc.name    NavAppStateStore674
     * @tc.desc    NavBar fresh model 674 probe 674
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore674', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 674) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0675
     * @tc.name    NavAppStateStore675
     * @tc.desc    NavBar fresh model 675 probe 675
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore675', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 675) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0676
     * @tc.name    NavAppStateStore676
     * @tc.desc    NavBar fresh model 676 probe 676
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore676', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 676) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0677
     * @tc.name    NavAppStateStore677
     * @tc.desc    NavBar fresh model 677 probe 677
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore677', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 677) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0678
     * @tc.name    NavAppStateStore678
     * @tc.desc    NavBar fresh model 678 probe 678
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore678', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 678) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0679
     * @tc.name    NavAppStateStore679
     * @tc.desc    NavBar fresh model 679 probe 679
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore679', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 679) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0680
     * @tc.name    NavAppStateStore680
     * @tc.desc    NavBar fresh model 680 probe 680
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore680', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 680) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0681
     * @tc.name    NavAppStateStore681
     * @tc.desc    NavBar fresh model 681 probe 681
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore681', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 681) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0682
     * @tc.name    NavAppStateStore682
     * @tc.desc    NavBar fresh model 682 probe 682
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore682', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 682) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0683
     * @tc.name    NavAppStateStore683
     * @tc.desc    NavBar fresh model 683 probe 683
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore683', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 683) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0684
     * @tc.name    NavAppStateStore684
     * @tc.desc    NavBar fresh model 684 probe 684
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore684', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 684) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0685
     * @tc.name    NavAppStateStore685
     * @tc.desc    NavBar fresh model 685 probe 685
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore685', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 685) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0686
     * @tc.name    NavAppStateStore686
     * @tc.desc    NavBar fresh model 686 probe 686
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore686', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 686) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0687
     * @tc.name    NavAppStateStore687
     * @tc.desc    NavBar fresh model 687 probe 687
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore687', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 687) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0688
     * @tc.name    NavAppStateStore688
     * @tc.desc    NavBar fresh model 688 probe 688
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore688', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 688) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0689
     * @tc.name    NavAppStateStore689
     * @tc.desc    NavBar fresh model 689 probe 689
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore689', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 689) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0690
     * @tc.name    NavAppStateStore690
     * @tc.desc    NavBar fresh model 690 probe 690
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore690', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 690) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0691
     * @tc.name    NavAppStateStore691
     * @tc.desc    NavBar fresh model 691 probe 691
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore691', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 691) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0692
     * @tc.name    NavAppStateStore692
     * @tc.desc    NavBar fresh model 692 probe 692
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore692', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 692) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0693
     * @tc.name    NavAppStateStore693
     * @tc.desc    NavBar fresh model 693 probe 693
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore693', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 693) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0694
     * @tc.name    NavAppStateStore694
     * @tc.desc    NavBar fresh model 694 probe 694
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore694', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 694) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0695
     * @tc.name    NavAppStateStore695
     * @tc.desc    NavBar fresh model 695 probe 695
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore695', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 695) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0696
     * @tc.name    NavAppStateStore696
     * @tc.desc    NavBar fresh model 696 probe 696
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore696', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 696) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0697
     * @tc.name    NavAppStateStore697
     * @tc.desc    NavBar fresh model 697 probe 697
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore697', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 697) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0698
     * @tc.name    NavAppStateStore698
     * @tc.desc    NavBar fresh model 698 probe 698
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore698', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 698) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0699
     * @tc.name    NavAppStateStore699
     * @tc.desc    NavBar fresh model 699 probe 699
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore699', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 699) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0700
     * @tc.name    NavAppStateStore700
     * @tc.desc    NavBar fresh model 700 probe 700
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore700', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 700) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0701
     * @tc.name    NavAppStateStore701
     * @tc.desc    NavBar fresh model 701 probe 701
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore701', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 701) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0702
     * @tc.name    NavAppStateStore702
     * @tc.desc    NavBar fresh model 702 probe 702
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore702', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 702) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0703
     * @tc.name    NavAppStateStore703
     * @tc.desc    NavBar fresh model 703 probe 703
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore703', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 703) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0704
     * @tc.name    NavAppStateStore704
     * @tc.desc    NavBar fresh model 704 probe 704
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore704', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 704) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0705
     * @tc.name    NavAppStateStore705
     * @tc.desc    NavBar fresh model 705 probe 705
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore705', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 705) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0706
     * @tc.name    NavAppStateStore706
     * @tc.desc    NavBar fresh model 706 probe 706
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore706', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 706) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0707
     * @tc.name    NavAppStateStore707
     * @tc.desc    NavBar fresh model 707 probe 707
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore707', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 707) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0708
     * @tc.name    NavAppStateStore708
     * @tc.desc    NavBar fresh model 708 probe 708
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore708', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 708) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0709
     * @tc.name    NavAppStateStore709
     * @tc.desc    NavBar fresh model 709 probe 709
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore709', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 709) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0710
     * @tc.name    NavAppStateStore710
     * @tc.desc    NavBar fresh model 710 probe 710
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore710', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 710) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0711
     * @tc.name    NavAppStateStore711
     * @tc.desc    NavBar fresh model 711 probe 711
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore711', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 711) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0712
     * @tc.name    NavAppStateStore712
     * @tc.desc    NavBar fresh model 712 probe 712
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore712', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(2)?.name).assertEqual(m.getNode(2)?.name);
      expect(m.getNode(1000 + 712) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0713
     * @tc.name    NavAppStateStore713
     * @tc.desc    NavBar fresh model 713 probe 713
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore713', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(3)?.name).assertEqual(m.getNode(3)?.name);
      expect(m.getNode(1000 + 713) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0714
     * @tc.name    NavAppStateStore714
     * @tc.desc    NavBar fresh model 714 probe 714
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore714', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(4)?.name).assertEqual(m.getNode(4)?.name);
      expect(m.getNode(1000 + 714) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0715
     * @tc.name    NavAppStateStore715
     * @tc.desc    NavBar fresh model 715 probe 715
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore715', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(0)?.name).assertEqual(m.getNode(0)?.name);
      expect(m.getNode(1000 + 715) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0716
     * @tc.name    NavAppStateStore716
     * @tc.desc    NavBar fresh model 716 probe 716
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppStateStore716', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const local: NavBarModel = new NavBarModel();
      expect(local.getTopCount()).assertEqual(m.getTopCount());
      expect(local.hasUniqueNames()).assertEqual(true);
      expect(local.getNode(1)?.name).assertEqual(m.getNode(1)?.name);
      expect(m.getNode(1000 + 716) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

