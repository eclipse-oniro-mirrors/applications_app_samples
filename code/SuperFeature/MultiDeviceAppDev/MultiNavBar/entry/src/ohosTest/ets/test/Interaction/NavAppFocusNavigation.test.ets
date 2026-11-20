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

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0403
     * @tc.name    NavAppFocusNavigation403
     * @tc.desc    NavBar visibility toggle 3 probe 403
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation403', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 403) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0404
     * @tc.name    NavAppFocusNavigation404
     * @tc.desc    NavBar visibility toggle 4 probe 404
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation404', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 404) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0405
     * @tc.name    NavAppFocusNavigation405
     * @tc.desc    NavBar visibility toggle 0 probe 405
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation405', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 405) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0406
     * @tc.name    NavAppFocusNavigation406
     * @tc.desc    NavBar visibility toggle 1 probe 406
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation406', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 406) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0407
     * @tc.name    NavAppFocusNavigation407
     * @tc.desc    NavBar visibility toggle 2 probe 407
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation407', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 407) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0408
     * @tc.name    NavAppFocusNavigation408
     * @tc.desc    NavBar visibility toggle 3 probe 408
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation408', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 408) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0409
     * @tc.name    NavAppFocusNavigation409
     * @tc.desc    NavBar visibility toggle 4 probe 409
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation409', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 409) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0410
     * @tc.name    NavAppFocusNavigation410
     * @tc.desc    NavBar visibility toggle 0 probe 410
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation410', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 410) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0411
     * @tc.name    NavAppFocusNavigation411
     * @tc.desc    NavBar visibility toggle 1 probe 411
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation411', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 411) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0412
     * @tc.name    NavAppFocusNavigation412
     * @tc.desc    NavBar visibility toggle 2 probe 412
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation412', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 412) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0413
     * @tc.name    NavAppFocusNavigation413
     * @tc.desc    NavBar visibility toggle 3 probe 413
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation413', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 413) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0414
     * @tc.name    NavAppFocusNavigation414
     * @tc.desc    NavBar visibility toggle 4 probe 414
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation414', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 414) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0415
     * @tc.name    NavAppFocusNavigation415
     * @tc.desc    NavBar visibility toggle 0 probe 415
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation415', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 415) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0416
     * @tc.name    NavAppFocusNavigation416
     * @tc.desc    NavBar visibility toggle 1 probe 416
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation416', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 416) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0417
     * @tc.name    NavAppFocusNavigation417
     * @tc.desc    NavBar visibility toggle 2 probe 417
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation417', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 417) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0418
     * @tc.name    NavAppFocusNavigation418
     * @tc.desc    NavBar visibility toggle 3 probe 418
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation418', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 418) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0419
     * @tc.name    NavAppFocusNavigation419
     * @tc.desc    NavBar visibility toggle 4 probe 419
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation419', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 419) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0420
     * @tc.name    NavAppFocusNavigation420
     * @tc.desc    NavBar visibility toggle 0 probe 420
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation420', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 420) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0421
     * @tc.name    NavAppFocusNavigation421
     * @tc.desc    NavBar visibility toggle 1 probe 421
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation421', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 421) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0422
     * @tc.name    NavAppFocusNavigation422
     * @tc.desc    NavBar visibility toggle 2 probe 422
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation422', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 422) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0423
     * @tc.name    NavAppFocusNavigation423
     * @tc.desc    NavBar visibility toggle 3 probe 423
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation423', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 423) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0424
     * @tc.name    NavAppFocusNavigation424
     * @tc.desc    NavBar visibility toggle 4 probe 424
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation424', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 424) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0425
     * @tc.name    NavAppFocusNavigation425
     * @tc.desc    NavBar visibility toggle 0 probe 425
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation425', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 425) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0426
     * @tc.name    NavAppFocusNavigation426
     * @tc.desc    NavBar visibility toggle 1 probe 426
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation426', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 426) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0427
     * @tc.name    NavAppFocusNavigation427
     * @tc.desc    NavBar visibility toggle 2 probe 427
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation427', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 427) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0428
     * @tc.name    NavAppFocusNavigation428
     * @tc.desc    NavBar visibility toggle 3 probe 428
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation428', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 428) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0429
     * @tc.name    NavAppFocusNavigation429
     * @tc.desc    NavBar visibility toggle 4 probe 429
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation429', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 429) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0430
     * @tc.name    NavAppFocusNavigation430
     * @tc.desc    NavBar visibility toggle 0 probe 430
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation430', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 430) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0431
     * @tc.name    NavAppFocusNavigation431
     * @tc.desc    NavBar visibility toggle 1 probe 431
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation431', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 431) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0432
     * @tc.name    NavAppFocusNavigation432
     * @tc.desc    NavBar visibility toggle 2 probe 432
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation432', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 432) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0433
     * @tc.name    NavAppFocusNavigation433
     * @tc.desc    NavBar visibility toggle 3 probe 433
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation433', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 433) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0434
     * @tc.name    NavAppFocusNavigation434
     * @tc.desc    NavBar visibility toggle 4 probe 434
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation434', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 434) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0435
     * @tc.name    NavAppFocusNavigation435
     * @tc.desc    NavBar visibility toggle 0 probe 435
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation435', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 435) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0436
     * @tc.name    NavAppFocusNavigation436
     * @tc.desc    NavBar visibility toggle 1 probe 436
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation436', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 436) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0437
     * @tc.name    NavAppFocusNavigation437
     * @tc.desc    NavBar visibility toggle 2 probe 437
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation437', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 437) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0438
     * @tc.name    NavAppFocusNavigation438
     * @tc.desc    NavBar visibility toggle 3 probe 438
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation438', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 438) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0439
     * @tc.name    NavAppFocusNavigation439
     * @tc.desc    NavBar visibility toggle 4 probe 439
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation439', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 439) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0440
     * @tc.name    NavAppFocusNavigation440
     * @tc.desc    NavBar visibility toggle 0 probe 440
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation440', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 440) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0441
     * @tc.name    NavAppFocusNavigation441
     * @tc.desc    NavBar visibility toggle 1 probe 441
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation441', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 441) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0442
     * @tc.name    NavAppFocusNavigation442
     * @tc.desc    NavBar visibility toggle 2 probe 442
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation442', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 442) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0443
     * @tc.name    NavAppFocusNavigation443
     * @tc.desc    NavBar visibility toggle 3 probe 443
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation443', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 443) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0444
     * @tc.name    NavAppFocusNavigation444
     * @tc.desc    NavBar visibility toggle 4 probe 444
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation444', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 444) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0445
     * @tc.name    NavAppFocusNavigation445
     * @tc.desc    NavBar visibility toggle 0 probe 445
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation445', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 445) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0446
     * @tc.name    NavAppFocusNavigation446
     * @tc.desc    NavBar visibility toggle 1 probe 446
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation446', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 446) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0447
     * @tc.name    NavAppFocusNavigation447
     * @tc.desc    NavBar visibility toggle 2 probe 447
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation447', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 447) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0448
     * @tc.name    NavAppFocusNavigation448
     * @tc.desc    NavBar visibility toggle 3 probe 448
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation448', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 448) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0449
     * @tc.name    NavAppFocusNavigation449
     * @tc.desc    NavBar visibility toggle 4 probe 449
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation449', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 449) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0450
     * @tc.name    NavAppFocusNavigation450
     * @tc.desc    NavBar visibility toggle 0 probe 450
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation450', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 450) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0451
     * @tc.name    NavAppFocusNavigation451
     * @tc.desc    NavBar visibility toggle 1 probe 451
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation451', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 451) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0452
     * @tc.name    NavAppFocusNavigation452
     * @tc.desc    NavBar visibility toggle 2 probe 452
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation452', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 452) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0453
     * @tc.name    NavAppFocusNavigation453
     * @tc.desc    NavBar visibility toggle 3 probe 453
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation453', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 453) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0454
     * @tc.name    NavAppFocusNavigation454
     * @tc.desc    NavBar visibility toggle 4 probe 454
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation454', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 454) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0455
     * @tc.name    NavAppFocusNavigation455
     * @tc.desc    NavBar visibility toggle 0 probe 455
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation455', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 455) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0456
     * @tc.name    NavAppFocusNavigation456
     * @tc.desc    NavBar visibility toggle 1 probe 456
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation456', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 456) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0457
     * @tc.name    NavAppFocusNavigation457
     * @tc.desc    NavBar visibility toggle 2 probe 457
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation457', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 457) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0458
     * @tc.name    NavAppFocusNavigation458
     * @tc.desc    NavBar visibility toggle 3 probe 458
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation458', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 458) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0459
     * @tc.name    NavAppFocusNavigation459
     * @tc.desc    NavBar visibility toggle 4 probe 459
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation459', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 459) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0460
     * @tc.name    NavAppFocusNavigation460
     * @tc.desc    NavBar visibility toggle 0 probe 460
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation460', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 460) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0461
     * @tc.name    NavAppFocusNavigation461
     * @tc.desc    NavBar visibility toggle 1 probe 461
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation461', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 461) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0462
     * @tc.name    NavAppFocusNavigation462
     * @tc.desc    NavBar visibility toggle 2 probe 462
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation462', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 462) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0463
     * @tc.name    NavAppFocusNavigation463
     * @tc.desc    NavBar visibility toggle 3 probe 463
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation463', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 463) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0464
     * @tc.name    NavAppFocusNavigation464
     * @tc.desc    NavBar visibility toggle 4 probe 464
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation464', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 464) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0465
     * @tc.name    NavAppFocusNavigation465
     * @tc.desc    NavBar visibility toggle 0 probe 465
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation465', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 465) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0466
     * @tc.name    NavAppFocusNavigation466
     * @tc.desc    NavBar visibility toggle 1 probe 466
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation466', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 466) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0467
     * @tc.name    NavAppFocusNavigation467
     * @tc.desc    NavBar visibility toggle 2 probe 467
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation467', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 467) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0468
     * @tc.name    NavAppFocusNavigation468
     * @tc.desc    NavBar visibility toggle 3 probe 468
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation468', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 468) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0469
     * @tc.name    NavAppFocusNavigation469
     * @tc.desc    NavBar visibility toggle 4 probe 469
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation469', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 469) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0470
     * @tc.name    NavAppFocusNavigation470
     * @tc.desc    NavBar visibility toggle 0 probe 470
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation470', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 470) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0471
     * @tc.name    NavAppFocusNavigation471
     * @tc.desc    NavBar visibility toggle 1 probe 471
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation471', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 471) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0472
     * @tc.name    NavAppFocusNavigation472
     * @tc.desc    NavBar visibility toggle 2 probe 472
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation472', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 472) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0473
     * @tc.name    NavAppFocusNavigation473
     * @tc.desc    NavBar visibility toggle 3 probe 473
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation473', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 473) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0474
     * @tc.name    NavAppFocusNavigation474
     * @tc.desc    NavBar visibility toggle 4 probe 474
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation474', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 474) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0475
     * @tc.name    NavAppFocusNavigation475
     * @tc.desc    NavBar visibility toggle 0 probe 475
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation475', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 475) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0476
     * @tc.name    NavAppFocusNavigation476
     * @tc.desc    NavBar visibility toggle 1 probe 476
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation476', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 476) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0477
     * @tc.name    NavAppFocusNavigation477
     * @tc.desc    NavBar visibility toggle 2 probe 477
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation477', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 477) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0478
     * @tc.name    NavAppFocusNavigation478
     * @tc.desc    NavBar visibility toggle 3 probe 478
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation478', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 478) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0479
     * @tc.name    NavAppFocusNavigation479
     * @tc.desc    NavBar visibility toggle 4 probe 479
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation479', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 479) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0480
     * @tc.name    NavAppFocusNavigation480
     * @tc.desc    NavBar visibility toggle 0 probe 480
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation480', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 480) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0481
     * @tc.name    NavAppFocusNavigation481
     * @tc.desc    NavBar visibility toggle 1 probe 481
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation481', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 481) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0482
     * @tc.name    NavAppFocusNavigation482
     * @tc.desc    NavBar visibility toggle 2 probe 482
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation482', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 482) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0483
     * @tc.name    NavAppFocusNavigation483
     * @tc.desc    NavBar visibility toggle 3 probe 483
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation483', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 483) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0484
     * @tc.name    NavAppFocusNavigation484
     * @tc.desc    NavBar visibility toggle 4 probe 484
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation484', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 484) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0485
     * @tc.name    NavAppFocusNavigation485
     * @tc.desc    NavBar visibility toggle 0 probe 485
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation485', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 485) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0486
     * @tc.name    NavAppFocusNavigation486
     * @tc.desc    NavBar visibility toggle 1 probe 486
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation486', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 486) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0487
     * @tc.name    NavAppFocusNavigation487
     * @tc.desc    NavBar visibility toggle 2 probe 487
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation487', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 487) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0488
     * @tc.name    NavAppFocusNavigation488
     * @tc.desc    NavBar visibility toggle 3 probe 488
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation488', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 488) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0489
     * @tc.name    NavAppFocusNavigation489
     * @tc.desc    NavBar visibility toggle 4 probe 489
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation489', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 489) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0490
     * @tc.name    NavAppFocusNavigation490
     * @tc.desc    NavBar visibility toggle 0 probe 490
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation490', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 490) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0491
     * @tc.name    NavAppFocusNavigation491
     * @tc.desc    NavBar visibility toggle 1 probe 491
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation491', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 491) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0492
     * @tc.name    NavAppFocusNavigation492
     * @tc.desc    NavBar visibility toggle 2 probe 492
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation492', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 492) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0493
     * @tc.name    NavAppFocusNavigation493
     * @tc.desc    NavBar visibility toggle 3 probe 493
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation493', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 493) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0494
     * @tc.name    NavAppFocusNavigation494
     * @tc.desc    NavBar visibility toggle 4 probe 494
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation494', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 494) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0495
     * @tc.name    NavAppFocusNavigation495
     * @tc.desc    NavBar visibility toggle 0 probe 495
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation495', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 495) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0496
     * @tc.name    NavAppFocusNavigation496
     * @tc.desc    NavBar visibility toggle 1 probe 496
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation496', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 496) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0497
     * @tc.name    NavAppFocusNavigation497
     * @tc.desc    NavBar visibility toggle 2 probe 497
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation497', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 497) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0498
     * @tc.name    NavAppFocusNavigation498
     * @tc.desc    NavBar visibility toggle 3 probe 498
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation498', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 498) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0499
     * @tc.name    NavAppFocusNavigation499
     * @tc.desc    NavBar visibility toggle 4 probe 499
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation499', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 499) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0500
     * @tc.name    NavAppFocusNavigation500
     * @tc.desc    NavBar visibility toggle 0 probe 500
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation500', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 500) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0501
     * @tc.name    NavAppFocusNavigation501
     * @tc.desc    NavBar visibility toggle 1 probe 501
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation501', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 501) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0502
     * @tc.name    NavAppFocusNavigation502
     * @tc.desc    NavBar visibility toggle 2 probe 502
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation502', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 502) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0503
     * @tc.name    NavAppFocusNavigation503
     * @tc.desc    NavBar visibility toggle 3 probe 503
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation503', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 3;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 503) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0504
     * @tc.name    NavAppFocusNavigation504
     * @tc.desc    NavBar visibility toggle 4 probe 504
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation504', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 4;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 504) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0505
     * @tc.name    NavAppFocusNavigation505
     * @tc.desc    NavBar visibility toggle 0 probe 505
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation505', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 0;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 505) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0506
     * @tc.name    NavAppFocusNavigation506
     * @tc.desc    NavBar visibility toggle 1 probe 506
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation506', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 1;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 506) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_NAVBAR_0507
     * @tc.name    NavAppFocusNavigation507
     * @tc.desc    NavBar visibility toggle 2 probe 507
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('NavAppFocusNavigation507', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const idx: number = 2;
      expect(m.setVisible(idx, false)).assertEqual(true);
      expect(m.getNode(idx)?.isVisible).assertEqual(false);
      expect(m.setVisible(idx, true)).assertEqual(true);
      expect(m.getNode(1000 + 507) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
