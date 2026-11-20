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

export default function navAppFocusNavigationSuite() {
  describe('NavAppFocusNavigationSuite', () => {
    let m: NavBarModel = new NavBarModel();

    beforeEach(() => {
      m = new NavBarModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0300
     * @tc.name    NavAppFocusNavigation300
     * @tc.desc    NavBar visibility toggle 0 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 300) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0301
     * @tc.name    NavAppFocusNavigation301
     * @tc.desc    NavBar visibility toggle 1 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 301) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0302
     * @tc.name    NavAppFocusNavigation302
     * @tc.desc    NavBar visibility toggle 2 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 302) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0303
     * @tc.name    NavAppFocusNavigation303
     * @tc.desc    NavBar visibility toggle 3 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 303) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0304
     * @tc.name    NavAppFocusNavigation304
     * @tc.desc    NavBar visibility toggle 4 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 304) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0305
     * @tc.name    NavAppFocusNavigation305
     * @tc.desc    NavBar visibility toggle 0 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 305) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0306
     * @tc.name    NavAppFocusNavigation306
     * @tc.desc    NavBar visibility toggle 1 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 306) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0307
     * @tc.name    NavAppFocusNavigation307
     * @tc.desc    NavBar visibility toggle 2 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 307) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0308
     * @tc.name    NavAppFocusNavigation308
     * @tc.desc    NavBar visibility toggle 3 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 308) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0309
     * @tc.name    NavAppFocusNavigation309
     * @tc.desc    NavBar visibility toggle 4 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 309) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0310
     * @tc.name    NavAppFocusNavigation310
     * @tc.desc    NavBar visibility toggle 0 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 310) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0311
     * @tc.name    NavAppFocusNavigation311
     * @tc.desc    NavBar visibility toggle 1 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 311) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0312
     * @tc.name    NavAppFocusNavigation312
     * @tc.desc    NavBar visibility toggle 2 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 312) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0313
     * @tc.name    NavAppFocusNavigation313
     * @tc.desc    NavBar visibility toggle 3 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 313) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0314
     * @tc.name    NavAppFocusNavigation314
     * @tc.desc    NavBar visibility toggle 4 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 314) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0315
     * @tc.name    NavAppFocusNavigation315
     * @tc.desc    NavBar visibility toggle 0 probe 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 315) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0316
     * @tc.name    NavAppFocusNavigation316
     * @tc.desc    NavBar visibility toggle 1 probe 316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 316) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0317
     * @tc.name    NavAppFocusNavigation317
     * @tc.desc    NavBar visibility toggle 2 probe 317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 317) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0318
     * @tc.name    NavAppFocusNavigation318
     * @tc.desc    NavBar visibility toggle 3 probe 318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 318) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0319
     * @tc.name    NavAppFocusNavigation319
     * @tc.desc    NavBar visibility toggle 4 probe 319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 319) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0320
     * @tc.name    NavAppFocusNavigation320
     * @tc.desc    NavBar visibility toggle 0 probe 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 320) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0321
     * @tc.name    NavAppFocusNavigation321
     * @tc.desc    NavBar visibility toggle 1 probe 321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 321) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0322
     * @tc.name    NavAppFocusNavigation322
     * @tc.desc    NavBar visibility toggle 2 probe 322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 322) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0323
     * @tc.name    NavAppFocusNavigation323
     * @tc.desc    NavBar visibility toggle 3 probe 323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 323) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0324
     * @tc.name    NavAppFocusNavigation324
     * @tc.desc    NavBar visibility toggle 4 probe 324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 324) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0325
     * @tc.name    NavAppFocusNavigation325
     * @tc.desc    NavBar visibility toggle 0 probe 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 325) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0326
     * @tc.name    NavAppFocusNavigation326
     * @tc.desc    NavBar visibility toggle 1 probe 326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 326) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0327
     * @tc.name    NavAppFocusNavigation327
     * @tc.desc    NavBar visibility toggle 2 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 327) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0328
     * @tc.name    NavAppFocusNavigation328
     * @tc.desc    NavBar visibility toggle 3 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 328) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0329
     * @tc.name    NavAppFocusNavigation329
     * @tc.desc    NavBar visibility toggle 4 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 329) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0330
     * @tc.name    NavAppFocusNavigation330
     * @tc.desc    NavBar visibility toggle 0 probe 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 330) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0331
     * @tc.name    NavAppFocusNavigation331
     * @tc.desc    NavBar visibility toggle 1 probe 331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 331) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0332
     * @tc.name    NavAppFocusNavigation332
     * @tc.desc    NavBar visibility toggle 2 probe 332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 332) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0333
     * @tc.name    NavAppFocusNavigation333
     * @tc.desc    NavBar visibility toggle 3 probe 333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 333) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0334
     * @tc.name    NavAppFocusNavigation334
     * @tc.desc    NavBar visibility toggle 4 probe 334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 334) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0335
     * @tc.name    NavAppFocusNavigation335
     * @tc.desc    NavBar visibility toggle 0 probe 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 335) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0336
     * @tc.name    NavAppFocusNavigation336
     * @tc.desc    NavBar visibility toggle 1 probe 336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 336) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0337
     * @tc.name    NavAppFocusNavigation337
     * @tc.desc    NavBar visibility toggle 2 probe 337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 337) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0338
     * @tc.name    NavAppFocusNavigation338
     * @tc.desc    NavBar visibility toggle 3 probe 338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 338) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0339
     * @tc.name    NavAppFocusNavigation339
     * @tc.desc    NavBar visibility toggle 4 probe 339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 339) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0340
     * @tc.name    NavAppFocusNavigation340
     * @tc.desc    NavBar visibility toggle 0 probe 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 340) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0341
     * @tc.name    NavAppFocusNavigation341
     * @tc.desc    NavBar visibility toggle 1 probe 341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 341) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0342
     * @tc.name    NavAppFocusNavigation342
     * @tc.desc    NavBar visibility toggle 2 probe 342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 342) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0343
     * @tc.name    NavAppFocusNavigation343
     * @tc.desc    NavBar visibility toggle 3 probe 343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 343) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0344
     * @tc.name    NavAppFocusNavigation344
     * @tc.desc    NavBar visibility toggle 4 probe 344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 344) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0345
     * @tc.name    NavAppFocusNavigation345
     * @tc.desc    NavBar visibility toggle 0 probe 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 345) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0346
     * @tc.name    NavAppFocusNavigation346
     * @tc.desc    NavBar visibility toggle 1 probe 346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 346) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0347
     * @tc.name    NavAppFocusNavigation347
     * @tc.desc    NavBar visibility toggle 2 probe 347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 347) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0348
     * @tc.name    NavAppFocusNavigation348
     * @tc.desc    NavBar visibility toggle 3 probe 348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 348) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0349
     * @tc.name    NavAppFocusNavigation349
     * @tc.desc    NavBar visibility toggle 4 probe 349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 349) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0350
     * @tc.name    NavAppFocusNavigation350
     * @tc.desc    NavBar visibility toggle 0 probe 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 350) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0351
     * @tc.name    NavAppFocusNavigation351
     * @tc.desc    NavBar visibility toggle 1 probe 351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 351) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0352
     * @tc.name    NavAppFocusNavigation352
     * @tc.desc    NavBar visibility toggle 2 probe 352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 352) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0353
     * @tc.name    NavAppFocusNavigation353
     * @tc.desc    NavBar visibility toggle 3 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 353) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0354
     * @tc.name    NavAppFocusNavigation354
     * @tc.desc    NavBar visibility toggle 4 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 354) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0355
     * @tc.name    NavAppFocusNavigation355
     * @tc.desc    NavBar visibility toggle 0 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 355) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0356
     * @tc.name    NavAppFocusNavigation356
     * @tc.desc    NavBar visibility toggle 1 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 356) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0357
     * @tc.name    NavAppFocusNavigation357
     * @tc.desc    NavBar visibility toggle 2 probe 357
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation357', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 357) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0358
     * @tc.name    NavAppFocusNavigation358
     * @tc.desc    NavBar visibility toggle 3 probe 358
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation358', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 358) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0359
     * @tc.name    NavAppFocusNavigation359
     * @tc.desc    NavBar visibility toggle 4 probe 359
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation359', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 359) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0360
     * @tc.name    NavAppFocusNavigation360
     * @tc.desc    NavBar visibility toggle 0 probe 360
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation360', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 360) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0361
     * @tc.name    NavAppFocusNavigation361
     * @tc.desc    NavBar visibility toggle 1 probe 361
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation361', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 361) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0362
     * @tc.name    NavAppFocusNavigation362
     * @tc.desc    NavBar visibility toggle 2 probe 362
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation362', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 362) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0363
     * @tc.name    NavAppFocusNavigation363
     * @tc.desc    NavBar visibility toggle 3 probe 363
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation363', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 363) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0364
     * @tc.name    NavAppFocusNavigation364
     * @tc.desc    NavBar visibility toggle 4 probe 364
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation364', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 364) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0365
     * @tc.name    NavAppFocusNavigation365
     * @tc.desc    NavBar visibility toggle 0 probe 365
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation365', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 365) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0366
     * @tc.name    NavAppFocusNavigation366
     * @tc.desc    NavBar visibility toggle 1 probe 366
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation366', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 366) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0367
     * @tc.name    NavAppFocusNavigation367
     * @tc.desc    NavBar visibility toggle 2 probe 367
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation367', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 367) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0368
     * @tc.name    NavAppFocusNavigation368
     * @tc.desc    NavBar visibility toggle 3 probe 368
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation368', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 368) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0369
     * @tc.name    NavAppFocusNavigation369
     * @tc.desc    NavBar visibility toggle 4 probe 369
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation369', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 369) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0370
     * @tc.name    NavAppFocusNavigation370
     * @tc.desc    NavBar visibility toggle 0 probe 370
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation370', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 370) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0371
     * @tc.name    NavAppFocusNavigation371
     * @tc.desc    NavBar visibility toggle 1 probe 371
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation371', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 371) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0372
     * @tc.name    NavAppFocusNavigation372
     * @tc.desc    NavBar visibility toggle 2 probe 372
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation372', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 372) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0373
     * @tc.name    NavAppFocusNavigation373
     * @tc.desc    NavBar visibility toggle 3 probe 373
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation373', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 373) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0374
     * @tc.name    NavAppFocusNavigation374
     * @tc.desc    NavBar visibility toggle 4 probe 374
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation374', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 374) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0375
     * @tc.name    NavAppFocusNavigation375
     * @tc.desc    NavBar visibility toggle 0 probe 375
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation375', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 375) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0376
     * @tc.name    NavAppFocusNavigation376
     * @tc.desc    NavBar visibility toggle 1 probe 376
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation376', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 376) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0377
     * @tc.name    NavAppFocusNavigation377
     * @tc.desc    NavBar visibility toggle 2 probe 377
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation377', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 377) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0378
     * @tc.name    NavAppFocusNavigation378
     * @tc.desc    NavBar visibility toggle 3 probe 378
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation378', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 378) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0379
     * @tc.name    NavAppFocusNavigation379
     * @tc.desc    NavBar visibility toggle 4 probe 379
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation379', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 379) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0380
     * @tc.name    NavAppFocusNavigation380
     * @tc.desc    NavBar visibility toggle 0 probe 380
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation380', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 380) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0381
     * @tc.name    NavAppFocusNavigation381
     * @tc.desc    NavBar visibility toggle 1 probe 381
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation381', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 381) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0382
     * @tc.name    NavAppFocusNavigation382
     * @tc.desc    NavBar visibility toggle 2 probe 382
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation382', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 382) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0383
     * @tc.name    NavAppFocusNavigation383
     * @tc.desc    NavBar visibility toggle 3 probe 383
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation383', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 383) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0384
     * @tc.name    NavAppFocusNavigation384
     * @tc.desc    NavBar visibility toggle 4 probe 384
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation384', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 384) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0385
     * @tc.name    NavAppFocusNavigation385
     * @tc.desc    NavBar visibility toggle 0 probe 385
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation385', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 385) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0386
     * @tc.name    NavAppFocusNavigation386
     * @tc.desc    NavBar visibility toggle 1 probe 386
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation386', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 386) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0387
     * @tc.name    NavAppFocusNavigation387
     * @tc.desc    NavBar visibility toggle 2 probe 387
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation387', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 387) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0388
     * @tc.name    NavAppFocusNavigation388
     * @tc.desc    NavBar visibility toggle 3 probe 388
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation388', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 388) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0389
     * @tc.name    NavAppFocusNavigation389
     * @tc.desc    NavBar visibility toggle 4 probe 389
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation389', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 389) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0390
     * @tc.name    NavAppFocusNavigation390
     * @tc.desc    NavBar visibility toggle 0 probe 390
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation390', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 390) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0391
     * @tc.name    NavAppFocusNavigation391
     * @tc.desc    NavBar visibility toggle 1 probe 391
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation391', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 391) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0392
     * @tc.name    NavAppFocusNavigation392
     * @tc.desc    NavBar visibility toggle 2 probe 392
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation392', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 392) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0393
     * @tc.name    NavAppFocusNavigation393
     * @tc.desc    NavBar visibility toggle 3 probe 393
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation393', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 393) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0394
     * @tc.name    NavAppFocusNavigation394
     * @tc.desc    NavBar visibility toggle 4 probe 394
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation394', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 394) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0395
     * @tc.name    NavAppFocusNavigation395
     * @tc.desc    NavBar visibility toggle 0 probe 395
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation395', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 395) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0396
     * @tc.name    NavAppFocusNavigation396
     * @tc.desc    NavBar visibility toggle 1 probe 396
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation396', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 396) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0397
     * @tc.name    NavAppFocusNavigation397
     * @tc.desc    NavBar visibility toggle 2 probe 397
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation397', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 397) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0398
     * @tc.name    NavAppFocusNavigation398
     * @tc.desc    NavBar visibility toggle 3 probe 398
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation398', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 398) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0399
     * @tc.name    NavAppFocusNavigation399
     * @tc.desc    NavBar visibility toggle 4 probe 399
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation399', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 399) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0400
     * @tc.name    NavAppFocusNavigation400
     * @tc.desc    NavBar visibility toggle 0 probe 400
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation400', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 400) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0401
     * @tc.name    NavAppFocusNavigation401
     * @tc.desc    NavBar visibility toggle 1 probe 401
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation401', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 401) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0402
     * @tc.name    NavAppFocusNavigation402
     * @tc.desc    NavBar visibility toggle 2 probe 402
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation402', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 402) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
