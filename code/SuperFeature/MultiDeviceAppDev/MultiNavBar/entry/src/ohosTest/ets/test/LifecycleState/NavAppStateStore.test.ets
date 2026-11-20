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
