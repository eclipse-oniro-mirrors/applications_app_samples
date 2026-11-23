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

export default function columnsDialogErrorRecoverySuite() {
  describe('ColumnsDialogErrorRecoverySuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0001
     * @tc.name    ColumnsDialogErrorRecovery001
     * @tc.desc    Columns navbar width for 321 probe 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 321;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit1') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0002
     * @tc.name    ColumnsDialogErrorRecovery002
     * @tc.desc    Columns navbar width for 322 probe 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 322;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit2') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0003
     * @tc.name    ColumnsDialogErrorRecovery003
     * @tc.desc    Columns navbar width for 323 probe 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 323;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit3') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0004
     * @tc.name    ColumnsDialogErrorRecovery004
     * @tc.desc    Columns navbar width for 324 probe 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 324;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit4') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0005
     * @tc.name    ColumnsDialogErrorRecovery005
     * @tc.desc    Columns navbar width for 325 probe 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 325;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit5') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0006
     * @tc.name    ColumnsDialogErrorRecovery006
     * @tc.desc    Columns navbar width for 326 probe 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 326;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit6') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0007
     * @tc.name    ColumnsDialogErrorRecovery007
     * @tc.desc    Columns navbar width for 327 probe 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 327;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit7') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0008
     * @tc.name    ColumnsDialogErrorRecovery008
     * @tc.desc    Columns navbar width for 328 probe 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 328;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit8') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0009
     * @tc.name    ColumnsDialogErrorRecovery009
     * @tc.desc    Columns navbar width for 329 probe 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 329;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit9') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0010
     * @tc.name    ColumnsDialogErrorRecovery010
     * @tc.desc    Columns navbar width for 330 probe 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 330;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit10') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0011
     * @tc.name    ColumnsDialogErrorRecovery011
     * @tc.desc    Columns navbar width for 331 probe 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 331;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit11') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0012
     * @tc.name    ColumnsDialogErrorRecovery012
     * @tc.desc    Columns navbar width for 332 probe 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 332;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit12') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0013
     * @tc.name    ColumnsDialogErrorRecovery013
     * @tc.desc    Columns navbar width for 333 probe 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 333;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit13') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0014
     * @tc.name    ColumnsDialogErrorRecovery014
     * @tc.desc    Columns navbar width for 334 probe 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 334;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit14') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0015
     * @tc.name    ColumnsDialogErrorRecovery015
     * @tc.desc    Columns navbar width for 335 probe 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 335;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit15') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0016
     * @tc.name    ColumnsDialogErrorRecovery016
     * @tc.desc    Columns navbar width for 336 probe 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 336;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit16') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0017
     * @tc.name    ColumnsDialogErrorRecovery017
     * @tc.desc    Columns navbar width for 337 probe 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 337;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit17') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0018
     * @tc.name    ColumnsDialogErrorRecovery018
     * @tc.desc    Columns navbar width for 338 probe 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 338;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit18') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0019
     * @tc.name    ColumnsDialogErrorRecovery019
     * @tc.desc    Columns navbar width for 339 probe 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 339;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit19') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0020
     * @tc.name    ColumnsDialogErrorRecovery020
     * @tc.desc    Columns navbar width for 340 probe 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 340;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit20') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0021
     * @tc.name    ColumnsDialogErrorRecovery021
     * @tc.desc    Columns navbar width for 341 probe 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 341;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit21') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0022
     * @tc.name    ColumnsDialogErrorRecovery022
     * @tc.desc    Columns navbar width for 342 probe 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 342;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit22') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0023
     * @tc.name    ColumnsDialogErrorRecovery023
     * @tc.desc    Columns navbar width for 343 probe 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 343;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit23') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0024
     * @tc.name    ColumnsDialogErrorRecovery024
     * @tc.desc    Columns navbar width for 344 probe 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 344;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit24') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0025
     * @tc.name    ColumnsDialogErrorRecovery025
     * @tc.desc    Columns navbar width for 345 probe 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 345;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit25') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0026
     * @tc.name    ColumnsDialogErrorRecovery026
     * @tc.desc    Columns navbar width for 346 probe 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 346;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit26') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0027
     * @tc.name    ColumnsDialogErrorRecovery027
     * @tc.desc    Columns navbar width for 347 probe 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 347;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit27') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0028
     * @tc.name    ColumnsDialogErrorRecovery028
     * @tc.desc    Columns navbar width for 348 probe 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 348;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit28') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0029
     * @tc.name    ColumnsDialogErrorRecovery029
     * @tc.desc    Columns navbar width for 349 probe 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 349;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit29') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0030
     * @tc.name    ColumnsDialogErrorRecovery030
     * @tc.desc    Columns navbar width for 350 probe 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 350;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit30') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0031
     * @tc.name    ColumnsDialogErrorRecovery031
     * @tc.desc    Columns navbar width for 351 probe 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 351;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit31') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0032
     * @tc.name    ColumnsDialogErrorRecovery032
     * @tc.desc    Columns navbar width for 352 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 352;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit32') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0033
     * @tc.name    ColumnsDialogErrorRecovery033
     * @tc.desc    Columns navbar width for 353 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 353;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit33') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0034
     * @tc.name    ColumnsDialogErrorRecovery034
     * @tc.desc    Columns navbar width for 354 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 354;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit34') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0035
     * @tc.name    ColumnsDialogErrorRecovery035
     * @tc.desc    Columns navbar width for 355 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 355;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit35') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0036
     * @tc.name    ColumnsDialogErrorRecovery036
     * @tc.desc    Columns navbar width for 356 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 356;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit36') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0037
     * @tc.name    ColumnsDialogErrorRecovery037
     * @tc.desc    Columns navbar width for 357 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 357;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit37') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0038
     * @tc.name    ColumnsDialogErrorRecovery038
     * @tc.desc    Columns navbar width for 358 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 358;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit38') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0039
     * @tc.name    ColumnsDialogErrorRecovery039
     * @tc.desc    Columns navbar width for 359 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 359;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit39') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0040
     * @tc.name    ColumnsDialogErrorRecovery040
     * @tc.desc    Columns navbar width for 360 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 360;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit40') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0041
     * @tc.name    ColumnsDialogErrorRecovery041
     * @tc.desc    Columns navbar width for 361 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 361;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit41') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0042
     * @tc.name    ColumnsDialogErrorRecovery042
     * @tc.desc    Columns navbar width for 362 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 362;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit42') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0043
     * @tc.name    ColumnsDialogErrorRecovery043
     * @tc.desc    Columns navbar width for 363 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 363;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit43') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0044
     * @tc.name    ColumnsDialogErrorRecovery044
     * @tc.desc    Columns navbar width for 364 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 364;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit44') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0045
     * @tc.name    ColumnsDialogErrorRecovery045
     * @tc.desc    Columns navbar width for 365 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 365;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit45') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0046
     * @tc.name    ColumnsDialogErrorRecovery046
     * @tc.desc    Columns navbar width for 366 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 366;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit46') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0047
     * @tc.name    ColumnsDialogErrorRecovery047
     * @tc.desc    Columns navbar width for 367 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 367;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit47') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0048
     * @tc.name    ColumnsDialogErrorRecovery048
     * @tc.desc    Columns navbar width for 368 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 368;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit48') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0049
     * @tc.name    ColumnsDialogErrorRecovery049
     * @tc.desc    Columns navbar width for 369 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 369;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit49') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0050
     * @tc.name    ColumnsDialogErrorRecovery050
     * @tc.desc    Columns navbar width for 370 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 370;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit50') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0051
     * @tc.name    ColumnsDialogErrorRecovery051
     * @tc.desc    Columns navbar width for 371 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 371;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit51') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0052
     * @tc.name    ColumnsDialogErrorRecovery052
     * @tc.desc    Columns navbar width for 372 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 372;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit52') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0053
     * @tc.name    ColumnsDialogErrorRecovery053
     * @tc.desc    Columns navbar width for 373 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 373;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit53') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0054
     * @tc.name    ColumnsDialogErrorRecovery054
     * @tc.desc    Columns navbar width for 374 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 374;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit54') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0055
     * @tc.name    ColumnsDialogErrorRecovery055
     * @tc.desc    Columns navbar width for 375 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 375;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit55') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0056
     * @tc.name    ColumnsDialogErrorRecovery056
     * @tc.desc    Columns navbar width for 376 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 376;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit56') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0057
     * @tc.name    ColumnsDialogErrorRecovery057
     * @tc.desc    Columns navbar width for 377 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 377;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit57') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0058
     * @tc.name    ColumnsDialogErrorRecovery058
     * @tc.desc    Columns navbar width for 378 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 378;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit58') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0059
     * @tc.name    ColumnsDialogErrorRecovery059
     * @tc.desc    Columns navbar width for 379 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 379;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit59') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0060
     * @tc.name    ColumnsDialogErrorRecovery060
     * @tc.desc    Columns navbar width for 380 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 380;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit60') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0061
     * @tc.name    ColumnsDialogErrorRecovery061
     * @tc.desc    Columns navbar width for 381 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 381;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit61') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0062
     * @tc.name    ColumnsDialogErrorRecovery062
     * @tc.desc    Columns navbar width for 382 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 382;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit62') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0063
     * @tc.name    ColumnsDialogErrorRecovery063
     * @tc.desc    Columns navbar width for 383 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 383;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit63') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0064
     * @tc.name    ColumnsDialogErrorRecovery064
     * @tc.desc    Columns navbar width for 384 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 384;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit64') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0065
     * @tc.name    ColumnsDialogErrorRecovery065
     * @tc.desc    Columns navbar width for 385 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 385;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit65') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0066
     * @tc.name    ColumnsDialogErrorRecovery066
     * @tc.desc    Columns navbar width for 386 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 386;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit66') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0067
     * @tc.name    ColumnsDialogErrorRecovery067
     * @tc.desc    Columns navbar width for 387 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 387;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit67') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0068
     * @tc.name    ColumnsDialogErrorRecovery068
     * @tc.desc    Columns navbar width for 388 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 388;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit68') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0069
     * @tc.name    ColumnsDialogErrorRecovery069
     * @tc.desc    Columns navbar width for 389 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 389;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit69') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0070
     * @tc.name    ColumnsDialogErrorRecovery070
     * @tc.desc    Columns navbar width for 390 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 390;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit70') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0071
     * @tc.name    ColumnsDialogErrorRecovery071
     * @tc.desc    Columns navbar width for 391 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 391;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit71') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0072
     * @tc.name    ColumnsDialogErrorRecovery072
     * @tc.desc    Columns navbar width for 392 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 392;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit72') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0073
     * @tc.name    ColumnsDialogErrorRecovery073
     * @tc.desc    Columns navbar width for 393 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 393;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit73') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0074
     * @tc.name    ColumnsDialogErrorRecovery074
     * @tc.desc    Columns navbar width for 394 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 394;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit74') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0075
     * @tc.name    ColumnsDialogErrorRecovery075
     * @tc.desc    Columns navbar width for 395 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 395;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit75') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0076
     * @tc.name    ColumnsDialogErrorRecovery076
     * @tc.desc    Columns navbar width for 396 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 396;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit76') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0077
     * @tc.name    ColumnsDialogErrorRecovery077
     * @tc.desc    Columns navbar width for 397 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 397;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit77') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0078
     * @tc.name    ColumnsDialogErrorRecovery078
     * @tc.desc    Columns navbar width for 398 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 398;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit78') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0079
     * @tc.name    ColumnsDialogErrorRecovery079
     * @tc.desc    Columns navbar width for 399 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 399;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit79') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0080
     * @tc.name    ColumnsDialogErrorRecovery080
     * @tc.desc    Columns navbar width for 400 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 400;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit80') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0081
     * @tc.name    ColumnsDialogErrorRecovery081
     * @tc.desc    Columns navbar width for 401 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 401;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit81') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0082
     * @tc.name    ColumnsDialogErrorRecovery082
     * @tc.desc    Columns navbar width for 402 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 402;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit82') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0083
     * @tc.name    ColumnsDialogErrorRecovery083
     * @tc.desc    Columns navbar width for 403 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 403;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit83') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0084
     * @tc.name    ColumnsDialogErrorRecovery084
     * @tc.desc    Columns navbar width for 404 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 404;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit84') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0085
     * @tc.name    ColumnsDialogErrorRecovery085
     * @tc.desc    Columns navbar width for 405 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 405;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit85') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0086
     * @tc.name    ColumnsDialogErrorRecovery086
     * @tc.desc    Columns navbar width for 406 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 406;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit86') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0087
     * @tc.name    ColumnsDialogErrorRecovery087
     * @tc.desc    Columns navbar width for 407 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 407;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit87') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0088
     * @tc.name    ColumnsDialogErrorRecovery088
     * @tc.desc    Columns navbar width for 408 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 408;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit88') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0089
     * @tc.name    ColumnsDialogErrorRecovery089
     * @tc.desc    Columns navbar width for 409 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 409;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit89') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0090
     * @tc.name    ColumnsDialogErrorRecovery090
     * @tc.desc    Columns navbar width for 410 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 410;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit90') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0091
     * @tc.name    ColumnsDialogErrorRecovery091
     * @tc.desc    Columns navbar width for 411 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 411;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit91') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0092
     * @tc.name    ColumnsDialogErrorRecovery092
     * @tc.desc    Columns navbar width for 412 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 412;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit92') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0093
     * @tc.name    ColumnsDialogErrorRecovery093
     * @tc.desc    Columns navbar width for 413 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 413;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit93') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0094
     * @tc.name    ColumnsDialogErrorRecovery094
     * @tc.desc    Columns navbar width for 414 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 414;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit94') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0095
     * @tc.name    ColumnsDialogErrorRecovery095
     * @tc.desc    Columns navbar width for 415 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 415;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit95') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0096
     * @tc.name    ColumnsDialogErrorRecovery096
     * @tc.desc    Columns navbar width for 416 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 416;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit96') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0097
     * @tc.name    ColumnsDialogErrorRecovery097
     * @tc.desc    Columns navbar width for 417 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 417;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit97') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0098
     * @tc.name    ColumnsDialogErrorRecovery098
     * @tc.desc    Columns navbar width for 418 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 418;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit98') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0099
     * @tc.name    ColumnsDialogErrorRecovery099
     * @tc.desc    Columns navbar width for 419 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 419;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit99') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0100
     * @tc.name    ColumnsDialogErrorRecovery100
     * @tc.desc    Columns navbar width for 420 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 420;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit100') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0101
     * @tc.name    ColumnsDialogErrorRecovery101
     * @tc.desc    Columns navbar width for 421 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 421;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit101') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0102
     * @tc.name    ColumnsDialogErrorRecovery102
     * @tc.desc    Columns navbar width for 422 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 422;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit102') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0103
     * @tc.name    ColumnsDialogErrorRecovery103
     * @tc.desc    Columns navbar width for 423 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 423;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit103') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0104
     * @tc.name    ColumnsDialogErrorRecovery104
     * @tc.desc    Columns navbar width for 424 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 424;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit104') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0105
     * @tc.name    ColumnsDialogErrorRecovery105
     * @tc.desc    Columns navbar width for 425 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 425;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit105') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0106
     * @tc.name    ColumnsDialogErrorRecovery106
     * @tc.desc    Columns navbar width for 426 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 426;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit106') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0107
     * @tc.name    ColumnsDialogErrorRecovery107
     * @tc.desc    Columns navbar width for 427 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 427;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit107') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0108
     * @tc.name    ColumnsDialogErrorRecovery108
     * @tc.desc    Columns navbar width for 428 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 428;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit108') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0109
     * @tc.name    ColumnsDialogErrorRecovery109
     * @tc.desc    Columns navbar width for 429 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 429;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit109') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0110
     * @tc.name    ColumnsDialogErrorRecovery110
     * @tc.desc    Columns navbar width for 430 probe 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 430;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit110') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0111
     * @tc.name    ColumnsDialogErrorRecovery111
     * @tc.desc    Columns navbar width for 431 probe 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 431;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit111') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0112
     * @tc.name    ColumnsDialogErrorRecovery112
     * @tc.desc    Columns navbar width for 432 probe 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 432;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit112') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0113
     * @tc.name    ColumnsDialogErrorRecovery113
     * @tc.desc    Columns navbar width for 433 probe 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 433;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit113') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0114
     * @tc.name    ColumnsDialogErrorRecovery114
     * @tc.desc    Columns navbar width for 434 probe 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 434;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit114') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0115
     * @tc.name    ColumnsDialogErrorRecovery115
     * @tc.desc    Columns navbar width for 435 probe 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 435;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit115') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0116
     * @tc.name    ColumnsDialogErrorRecovery116
     * @tc.desc    Columns navbar width for 436 probe 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 436;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit116') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0117
     * @tc.name    ColumnsDialogErrorRecovery117
     * @tc.desc    Columns navbar width for 437 probe 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 437;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit117') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0118
     * @tc.name    ColumnsDialogErrorRecovery118
     * @tc.desc    Columns navbar width for 438 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 438;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit118') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0119
     * @tc.name    ColumnsDialogErrorRecovery119
     * @tc.desc    Columns navbar width for 439 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 439;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit119') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0120
     * @tc.name    ColumnsDialogErrorRecovery120
     * @tc.desc    Columns navbar width for 440 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 440;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit120') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0121
     * @tc.name    ColumnsDialogErrorRecovery121
     * @tc.desc    Columns navbar width for 441 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsDialogErrorRecovery121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 441;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit121') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

