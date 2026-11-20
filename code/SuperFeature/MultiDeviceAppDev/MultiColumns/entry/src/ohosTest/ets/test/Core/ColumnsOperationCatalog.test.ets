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

export default function columnsOperationCatalogSuite() {
  describe('ColumnsOperationCatalogSuite', () => {
    let m: ColumnsModel = new ColumnsModel();

    beforeEach(() => {
      m = new ColumnsModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0122
     * @tc.name    ColumnsOperationCatalog122
     * @tc.desc    Columns navbar width for 442 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 442;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit122') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0123
     * @tc.name    ColumnsOperationCatalog123
     * @tc.desc    Columns navbar width for 443 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 443;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit123') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0124
     * @tc.name    ColumnsOperationCatalog124
     * @tc.desc    Columns navbar width for 444 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 444;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit124') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0125
     * @tc.name    ColumnsOperationCatalog125
     * @tc.desc    Columns navbar width for 445 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 445;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit125') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0126
     * @tc.name    ColumnsOperationCatalog126
     * @tc.desc    Columns navbar width for 446 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 446;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit126') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0127
     * @tc.name    ColumnsOperationCatalog127
     * @tc.desc    Columns navbar width for 447 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 447;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit127') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0128
     * @tc.name    ColumnsOperationCatalog128
     * @tc.desc    Columns navbar width for 448 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 448;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit128') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0129
     * @tc.name    ColumnsOperationCatalog129
     * @tc.desc    Columns navbar width for 449 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 449;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit129') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0130
     * @tc.name    ColumnsOperationCatalog130
     * @tc.desc    Columns navbar width for 450 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 450;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit130') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0131
     * @tc.name    ColumnsOperationCatalog131
     * @tc.desc    Columns navbar width for 451 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 451;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit131') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0132
     * @tc.name    ColumnsOperationCatalog132
     * @tc.desc    Columns navbar width for 452 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 452;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit132') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0133
     * @tc.name    ColumnsOperationCatalog133
     * @tc.desc    Columns navbar width for 453 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 453;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit133') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0134
     * @tc.name    ColumnsOperationCatalog134
     * @tc.desc    Columns navbar width for 454 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 454;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit134') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0135
     * @tc.name    ColumnsOperationCatalog135
     * @tc.desc    Columns navbar width for 455 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 455;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit135') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0136
     * @tc.name    ColumnsOperationCatalog136
     * @tc.desc    Columns navbar width for 456 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 456;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit136') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0137
     * @tc.name    ColumnsOperationCatalog137
     * @tc.desc    Columns navbar width for 457 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 457;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit137') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0138
     * @tc.name    ColumnsOperationCatalog138
     * @tc.desc    Columns navbar width for 458 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 458;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit138') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0139
     * @tc.name    ColumnsOperationCatalog139
     * @tc.desc    Columns navbar width for 459 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 459;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit139') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0140
     * @tc.name    ColumnsOperationCatalog140
     * @tc.desc    Columns navbar width for 460 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 460;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit140') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0141
     * @tc.name    ColumnsOperationCatalog141
     * @tc.desc    Columns navbar width for 461 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 461;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit141') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0142
     * @tc.name    ColumnsOperationCatalog142
     * @tc.desc    Columns navbar width for 462 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 462;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit142') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0143
     * @tc.name    ColumnsOperationCatalog143
     * @tc.desc    Columns navbar width for 463 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 463;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit143') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0144
     * @tc.name    ColumnsOperationCatalog144
     * @tc.desc    Columns navbar width for 464 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 464;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit144') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0145
     * @tc.name    ColumnsOperationCatalog145
     * @tc.desc    Columns navbar width for 465 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 465;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit145') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0146
     * @tc.name    ColumnsOperationCatalog146
     * @tc.desc    Columns navbar width for 466 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 466;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit146') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0147
     * @tc.name    ColumnsOperationCatalog147
     * @tc.desc    Columns navbar width for 467 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 467;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit147') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0148
     * @tc.name    ColumnsOperationCatalog148
     * @tc.desc    Columns navbar width for 468 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 468;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit148') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0149
     * @tc.name    ColumnsOperationCatalog149
     * @tc.desc    Columns navbar width for 469 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 469;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit149') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0150
     * @tc.name    ColumnsOperationCatalog150
     * @tc.desc    Columns navbar width for 470 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 470;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit150') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0151
     * @tc.name    ColumnsOperationCatalog151
     * @tc.desc    Columns navbar width for 471 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 471;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit151') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0152
     * @tc.name    ColumnsOperationCatalog152
     * @tc.desc    Columns navbar width for 472 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 472;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit152') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0153
     * @tc.name    ColumnsOperationCatalog153
     * @tc.desc    Columns navbar width for 473 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 473;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit153') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0154
     * @tc.name    ColumnsOperationCatalog154
     * @tc.desc    Columns navbar width for 474 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 474;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit154') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0155
     * @tc.name    ColumnsOperationCatalog155
     * @tc.desc    Columns navbar width for 475 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 475;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit155') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0156
     * @tc.name    ColumnsOperationCatalog156
     * @tc.desc    Columns navbar width for 476 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 476;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit156') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0157
     * @tc.name    ColumnsOperationCatalog157
     * @tc.desc    Columns navbar width for 477 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 477;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit157') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0158
     * @tc.name    ColumnsOperationCatalog158
     * @tc.desc    Columns navbar width for 478 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 478;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit158') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0159
     * @tc.name    ColumnsOperationCatalog159
     * @tc.desc    Columns navbar width for 479 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 479;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit159') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0160
     * @tc.name    ColumnsOperationCatalog160
     * @tc.desc    Columns navbar width for 480 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 480;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit160') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0161
     * @tc.name    ColumnsOperationCatalog161
     * @tc.desc    Columns navbar width for 481 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 481;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit161') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0162
     * @tc.name    ColumnsOperationCatalog162
     * @tc.desc    Columns navbar width for 482 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 482;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit162') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0163
     * @tc.name    ColumnsOperationCatalog163
     * @tc.desc    Columns navbar width for 483 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 483;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit163') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0164
     * @tc.name    ColumnsOperationCatalog164
     * @tc.desc    Columns navbar width for 484 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 484;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit164') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0165
     * @tc.name    ColumnsOperationCatalog165
     * @tc.desc    Columns navbar width for 485 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 485;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit165') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0166
     * @tc.name    ColumnsOperationCatalog166
     * @tc.desc    Columns navbar width for 486 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 486;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit166') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0167
     * @tc.name    ColumnsOperationCatalog167
     * @tc.desc    Columns navbar width for 487 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 487;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit167') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0168
     * @tc.name    ColumnsOperationCatalog168
     * @tc.desc    Columns navbar width for 488 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 488;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit168') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0169
     * @tc.name    ColumnsOperationCatalog169
     * @tc.desc    Columns navbar width for 489 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 489;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit169') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0170
     * @tc.name    ColumnsOperationCatalog170
     * @tc.desc    Columns navbar width for 490 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 490;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit170') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0171
     * @tc.name    ColumnsOperationCatalog171
     * @tc.desc    Columns navbar width for 491 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 491;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit171') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0172
     * @tc.name    ColumnsOperationCatalog172
     * @tc.desc    Columns navbar width for 492 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 492;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit172') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0173
     * @tc.name    ColumnsOperationCatalog173
     * @tc.desc    Columns navbar width for 493 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 493;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit173') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0174
     * @tc.name    ColumnsOperationCatalog174
     * @tc.desc    Columns navbar width for 494 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 494;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit174') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0175
     * @tc.name    ColumnsOperationCatalog175
     * @tc.desc    Columns navbar width for 495 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 495;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit175') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0176
     * @tc.name    ColumnsOperationCatalog176
     * @tc.desc    Columns navbar width for 496 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 496;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit176') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0177
     * @tc.name    ColumnsOperationCatalog177
     * @tc.desc    Columns navbar width for 497 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 497;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit177') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0178
     * @tc.name    ColumnsOperationCatalog178
     * @tc.desc    Columns navbar width for 498 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 498;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit178') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0179
     * @tc.name    ColumnsOperationCatalog179
     * @tc.desc    Columns navbar width for 499 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 499;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit179') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0180
     * @tc.name    ColumnsOperationCatalog180
     * @tc.desc    Columns navbar width for 500 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 500;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit180') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0181
     * @tc.name    ColumnsOperationCatalog181
     * @tc.desc    Columns navbar width for 501 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 501;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit181') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0182
     * @tc.name    ColumnsOperationCatalog182
     * @tc.desc    Columns navbar width for 502 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 502;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit182') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0183
     * @tc.name    ColumnsOperationCatalog183
     * @tc.desc    Columns navbar width for 503 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 503;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit183') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0184
     * @tc.name    ColumnsOperationCatalog184
     * @tc.desc    Columns navbar width for 504 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 504;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit184') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0185
     * @tc.name    ColumnsOperationCatalog185
     * @tc.desc    Columns navbar width for 505 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 505;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit185') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0186
     * @tc.name    ColumnsOperationCatalog186
     * @tc.desc    Columns navbar width for 506 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 506;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit186') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0187
     * @tc.name    ColumnsOperationCatalog187
     * @tc.desc    Columns navbar width for 507 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 507;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit187') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0188
     * @tc.name    ColumnsOperationCatalog188
     * @tc.desc    Columns navbar width for 508 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 508;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit188') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0189
     * @tc.name    ColumnsOperationCatalog189
     * @tc.desc    Columns navbar width for 509 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 509;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit189') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0190
     * @tc.name    ColumnsOperationCatalog190
     * @tc.desc    Columns navbar width for 510 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 510;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit190') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0191
     * @tc.name    ColumnsOperationCatalog191
     * @tc.desc    Columns navbar width for 511 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 511;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit191') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0192
     * @tc.name    ColumnsOperationCatalog192
     * @tc.desc    Columns navbar width for 512 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 512;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit192') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0193
     * @tc.name    ColumnsOperationCatalog193
     * @tc.desc    Columns navbar width for 513 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 513;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit193') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0194
     * @tc.name    ColumnsOperationCatalog194
     * @tc.desc    Columns navbar width for 514 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 514;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit194') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0195
     * @tc.name    ColumnsOperationCatalog195
     * @tc.desc    Columns navbar width for 515 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 515;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit195') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0196
     * @tc.name    ColumnsOperationCatalog196
     * @tc.desc    Columns navbar width for 516 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 516;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit196') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0197
     * @tc.name    ColumnsOperationCatalog197
     * @tc.desc    Columns navbar width for 517 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 517;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit197') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0198
     * @tc.name    ColumnsOperationCatalog198
     * @tc.desc    Columns navbar width for 518 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 518;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit198') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0199
     * @tc.name    ColumnsOperationCatalog199
     * @tc.desc    Columns navbar width for 519 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 519;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit199') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0200
     * @tc.name    ColumnsOperationCatalog200
     * @tc.desc    Columns navbar width for 520 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 520;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit200') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0201
     * @tc.name    ColumnsOperationCatalog201
     * @tc.desc    Columns navbar width for 521 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 521;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit201') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0202
     * @tc.name    ColumnsOperationCatalog202
     * @tc.desc    Columns navbar width for 522 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 522;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit202') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0203
     * @tc.name    ColumnsOperationCatalog203
     * @tc.desc    Columns navbar width for 523 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 523;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit203') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0204
     * @tc.name    ColumnsOperationCatalog204
     * @tc.desc    Columns navbar width for 524 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 524;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit204') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0205
     * @tc.name    ColumnsOperationCatalog205
     * @tc.desc    Columns navbar width for 525 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 525;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit205') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0206
     * @tc.name    ColumnsOperationCatalog206
     * @tc.desc    Columns navbar width for 526 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 526;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit206') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0207
     * @tc.name    ColumnsOperationCatalog207
     * @tc.desc    Columns navbar width for 527 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 527;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit207') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0208
     * @tc.name    ColumnsOperationCatalog208
     * @tc.desc    Columns navbar width for 528 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 528;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit208') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0209
     * @tc.name    ColumnsOperationCatalog209
     * @tc.desc    Columns navbar width for 529 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 529;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit209') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0210
     * @tc.name    ColumnsOperationCatalog210
     * @tc.desc    Columns navbar width for 530 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 530;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit210') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0211
     * @tc.name    ColumnsOperationCatalog211
     * @tc.desc    Columns navbar width for 531 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 531;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit211') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0212
     * @tc.name    ColumnsOperationCatalog212
     * @tc.desc    Columns navbar width for 532 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 532;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit212') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0213
     * @tc.name    ColumnsOperationCatalog213
     * @tc.desc    Columns navbar width for 533 probe 213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 533;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit213') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0214
     * @tc.name    ColumnsOperationCatalog214
     * @tc.desc    Columns navbar width for 534 probe 214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 534;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit214') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0215
     * @tc.name    ColumnsOperationCatalog215
     * @tc.desc    Columns navbar width for 535 probe 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 535;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit215') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0216
     * @tc.name    ColumnsOperationCatalog216
     * @tc.desc    Columns navbar width for 536 probe 216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 536;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit216') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0217
     * @tc.name    ColumnsOperationCatalog217
     * @tc.desc    Columns navbar width for 537 probe 217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 537;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit217') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0218
     * @tc.name    ColumnsOperationCatalog218
     * @tc.desc    Columns navbar width for 538 probe 218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 538;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit218') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0219
     * @tc.name    ColumnsOperationCatalog219
     * @tc.desc    Columns navbar width for 539 probe 219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 539;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit219') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0220
     * @tc.name    ColumnsOperationCatalog220
     * @tc.desc    Columns navbar width for 540 probe 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 540;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit220') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0221
     * @tc.name    ColumnsOperationCatalog221
     * @tc.desc    Columns navbar width for 541 probe 221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 541;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit221') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0222
     * @tc.name    ColumnsOperationCatalog222
     * @tc.desc    Columns navbar width for 542 probe 222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 542;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit222') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0223
     * @tc.name    ColumnsOperationCatalog223
     * @tc.desc    Columns navbar width for 543 probe 223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 543;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit223') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0224
     * @tc.name    ColumnsOperationCatalog224
     * @tc.desc    Columns navbar width for 544 probe 224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 544;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit224') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0225
     * @tc.name    ColumnsOperationCatalog225
     * @tc.desc    Columns navbar width for 545 probe 225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 545;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit225') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0226
     * @tc.name    ColumnsOperationCatalog226
     * @tc.desc    Columns navbar width for 546 probe 226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 546;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit226') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0227
     * @tc.name    ColumnsOperationCatalog227
     * @tc.desc    Columns navbar width for 547 probe 227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 547;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit227') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0228
     * @tc.name    ColumnsOperationCatalog228
     * @tc.desc    Columns navbar width for 548 probe 228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 548;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit228') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0229
     * @tc.name    ColumnsOperationCatalog229
     * @tc.desc    Columns navbar width for 549 probe 229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 549;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit229') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0230
     * @tc.name    ColumnsOperationCatalog230
     * @tc.desc    Columns navbar width for 550 probe 230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 550;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit230') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0231
     * @tc.name    ColumnsOperationCatalog231
     * @tc.desc    Columns navbar width for 551 probe 231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 551;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit231') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0232
     * @tc.name    ColumnsOperationCatalog232
     * @tc.desc    Columns navbar width for 552 probe 232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 552;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit232') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0233
     * @tc.name    ColumnsOperationCatalog233
     * @tc.desc    Columns navbar width for 553 probe 233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 553;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit233') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0234
     * @tc.name    ColumnsOperationCatalog234
     * @tc.desc    Columns navbar width for 554 probe 234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 554;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit234') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0235
     * @tc.name    ColumnsOperationCatalog235
     * @tc.desc    Columns navbar width for 555 probe 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 555;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit235') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0236
     * @tc.name    ColumnsOperationCatalog236
     * @tc.desc    Columns navbar width for 556 probe 236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 556;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit236') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0237
     * @tc.name    ColumnsOperationCatalog237
     * @tc.desc    Columns navbar width for 557 probe 237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 557;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit237') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0238
     * @tc.name    ColumnsOperationCatalog238
     * @tc.desc    Columns navbar width for 558 probe 238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 558;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit238') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0239
     * @tc.name    ColumnsOperationCatalog239
     * @tc.desc    Columns navbar width for 559 probe 239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 559;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit239') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0240
     * @tc.name    ColumnsOperationCatalog240
     * @tc.desc    Columns navbar width for 560 probe 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 560;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit240') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0241
     * @tc.name    ColumnsOperationCatalog241
     * @tc.desc    Columns navbar width for 561 probe 241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 561;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit241') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0242
     * @tc.name    ColumnsOperationCatalog242
     * @tc.desc    Columns navbar width for 562 probe 242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 562;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit242') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0243
     * @tc.name    ColumnsOperationCatalog243
     * @tc.desc    Columns navbar width for 563 probe 243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 563;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit243') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0244
     * @tc.name    ColumnsOperationCatalog244
     * @tc.desc    Columns navbar width for 564 probe 244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 564;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit244') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0245
     * @tc.name    ColumnsOperationCatalog245
     * @tc.desc    Columns navbar width for 565 probe 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 565;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit245') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0246
     * @tc.name    ColumnsOperationCatalog246
     * @tc.desc    Columns navbar width for 566 probe 246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 566;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit246') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0247
     * @tc.name    ColumnsOperationCatalog247
     * @tc.desc    Columns navbar width for 567 probe 247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 567;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit247') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0248
     * @tc.name    ColumnsOperationCatalog248
     * @tc.desc    Columns navbar width for 568 probe 248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 568;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit248') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0249
     * @tc.name    ColumnsOperationCatalog249
     * @tc.desc    Columns navbar width for 569 probe 249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 569;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit249') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0250
     * @tc.name    ColumnsOperationCatalog250
     * @tc.desc    Columns navbar width for 570 probe 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 570;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit250') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0251
     * @tc.name    ColumnsOperationCatalog251
     * @tc.desc    Columns navbar width for 571 probe 251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 571;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit251') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0252
     * @tc.name    ColumnsOperationCatalog252
     * @tc.desc    Columns navbar width for 572 probe 252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 572;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit252') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0253
     * @tc.name    ColumnsOperationCatalog253
     * @tc.desc    Columns navbar width for 573 probe 253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 573;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit253') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0254
     * @tc.name    ColumnsOperationCatalog254
     * @tc.desc    Columns navbar width for 574 probe 254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 574;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit254') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0255
     * @tc.name    ColumnsOperationCatalog255
     * @tc.desc    Columns navbar width for 575 probe 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 575;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit255') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0256
     * @tc.name    ColumnsOperationCatalog256
     * @tc.desc    Columns navbar width for 576 probe 256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 576;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit256') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0257
     * @tc.name    ColumnsOperationCatalog257
     * @tc.desc    Columns navbar width for 577 probe 257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 577;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit257') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0258
     * @tc.name    ColumnsOperationCatalog258
     * @tc.desc    Columns navbar width for 578 probe 258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 578;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit258') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0259
     * @tc.name    ColumnsOperationCatalog259
     * @tc.desc    Columns navbar width for 579 probe 259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 579;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit259') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0260
     * @tc.name    ColumnsOperationCatalog260
     * @tc.desc    Columns navbar width for 580 probe 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 580;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit260') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0261
     * @tc.name    ColumnsOperationCatalog261
     * @tc.desc    Columns navbar width for 581 probe 261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 581;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit261') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0262
     * @tc.name    ColumnsOperationCatalog262
     * @tc.desc    Columns navbar width for 582 probe 262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 582;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit262') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0263
     * @tc.name    ColumnsOperationCatalog263
     * @tc.desc    Columns navbar width for 583 probe 263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 583;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit263') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0264
     * @tc.name    ColumnsOperationCatalog264
     * @tc.desc    Columns navbar width for 584 probe 264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 584;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit264') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0265
     * @tc.name    ColumnsOperationCatalog265
     * @tc.desc    Columns navbar width for 585 probe 265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 585;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit265') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0266
     * @tc.name    ColumnsOperationCatalog266
     * @tc.desc    Columns navbar width for 586 probe 266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 586;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit266') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0267
     * @tc.name    ColumnsOperationCatalog267
     * @tc.desc    Columns navbar width for 587 probe 267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 587;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit267') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0268
     * @tc.name    ColumnsOperationCatalog268
     * @tc.desc    Columns navbar width for 588 probe 268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 588;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit268') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0269
     * @tc.name    ColumnsOperationCatalog269
     * @tc.desc    Columns navbar width for 589 probe 269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 589;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit269') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0270
     * @tc.name    ColumnsOperationCatalog270
     * @tc.desc    Columns navbar width for 590 probe 270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 590;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit270') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0271
     * @tc.name    ColumnsOperationCatalog271
     * @tc.desc    Columns navbar width for 591 probe 271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 591;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit271') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0272
     * @tc.name    ColumnsOperationCatalog272
     * @tc.desc    Columns navbar width for 592 probe 272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 592;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit272') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0273
     * @tc.name    ColumnsOperationCatalog273
     * @tc.desc    Columns navbar width for 593 probe 273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 593;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit273') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0274
     * @tc.name    ColumnsOperationCatalog274
     * @tc.desc    Columns navbar width for 594 probe 274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 594;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit274') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0275
     * @tc.name    ColumnsOperationCatalog275
     * @tc.desc    Columns navbar width for 595 probe 275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 595;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit275') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0276
     * @tc.name    ColumnsOperationCatalog276
     * @tc.desc    Columns navbar width for 596 probe 276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 596;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit276') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0277
     * @tc.name    ColumnsOperationCatalog277
     * @tc.desc    Columns navbar width for 597 probe 277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 597;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit277') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0278
     * @tc.name    ColumnsOperationCatalog278
     * @tc.desc    Columns navbar width for 598 probe 278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 598;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit278') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0279
     * @tc.name    ColumnsOperationCatalog279
     * @tc.desc    Columns navbar width for 599 probe 279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 599;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit279') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0280
     * @tc.name    ColumnsOperationCatalog280
     * @tc.desc    Columns navbar width for 600 probe 280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 600;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit280') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0281
     * @tc.name    ColumnsOperationCatalog281
     * @tc.desc    Columns navbar width for 601 probe 281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 601;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit281') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0282
     * @tc.name    ColumnsOperationCatalog282
     * @tc.desc    Columns navbar width for 602 probe 282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 602;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit282') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0283
     * @tc.name    ColumnsOperationCatalog283
     * @tc.desc    Columns navbar width for 603 probe 283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 603;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit283') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0284
     * @tc.name    ColumnsOperationCatalog284
     * @tc.desc    Columns navbar width for 604 probe 284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 604;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit284') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0285
     * @tc.name    ColumnsOperationCatalog285
     * @tc.desc    Columns navbar width for 605 probe 285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 605;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit285') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0286
     * @tc.name    ColumnsOperationCatalog286
     * @tc.desc    Columns navbar width for 606 probe 286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 606;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit286') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0287
     * @tc.name    ColumnsOperationCatalog287
     * @tc.desc    Columns navbar width for 607 probe 287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 607;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit287') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0288
     * @tc.name    ColumnsOperationCatalog288
     * @tc.desc    Columns navbar width for 608 probe 288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 608;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit288') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0289
     * @tc.name    ColumnsOperationCatalog289
     * @tc.desc    Columns navbar width for 609 probe 289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 609;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit289') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0290
     * @tc.name    ColumnsOperationCatalog290
     * @tc.desc    Columns navbar width for 610 probe 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 610;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit290') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0291
     * @tc.name    ColumnsOperationCatalog291
     * @tc.desc    Columns navbar width for 611 probe 291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 611;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit291') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0292
     * @tc.name    ColumnsOperationCatalog292
     * @tc.desc    Columns navbar width for 612 probe 292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 612;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit292') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0293
     * @tc.name    ColumnsOperationCatalog293
     * @tc.desc    Columns navbar width for 613 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 613;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit293') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0294
     * @tc.name    ColumnsOperationCatalog294
     * @tc.desc    Columns navbar width for 614 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 614;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit294') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0295
     * @tc.name    ColumnsOperationCatalog295
     * @tc.desc    Columns navbar width for 615 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 615;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit295') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0296
     * @tc.name    ColumnsOperationCatalog296
     * @tc.desc    Columns navbar width for 616 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 616;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit296') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0297
     * @tc.name    ColumnsOperationCatalog297
     * @tc.desc    Columns navbar width for 617 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 617;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit297') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0298
     * @tc.name    ColumnsOperationCatalog298
     * @tc.desc    Columns navbar width for 618 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 618;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit298') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0299
     * @tc.name    ColumnsOperationCatalog299
     * @tc.desc    Columns navbar width for 619 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 619;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit299') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0300
     * @tc.name    ColumnsOperationCatalog300
     * @tc.desc    Columns navbar width for 620 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 620;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit300') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0301
     * @tc.name    ColumnsOperationCatalog301
     * @tc.desc    Columns navbar width for 621 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 621;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit301') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0302
     * @tc.name    ColumnsOperationCatalog302
     * @tc.desc    Columns navbar width for 622 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 622;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit302') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0303
     * @tc.name    ColumnsOperationCatalog303
     * @tc.desc    Columns navbar width for 623 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 623;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit303') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0304
     * @tc.name    ColumnsOperationCatalog304
     * @tc.desc    Columns navbar width for 624 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 624;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit304') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0305
     * @tc.name    ColumnsOperationCatalog305
     * @tc.desc    Columns navbar width for 625 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 625;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit305') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0306
     * @tc.name    ColumnsOperationCatalog306
     * @tc.desc    Columns navbar width for 626 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 626;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit306') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0307
     * @tc.name    ColumnsOperationCatalog307
     * @tc.desc    Columns navbar width for 627 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 627;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit307') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0308
     * @tc.name    ColumnsOperationCatalog308
     * @tc.desc    Columns navbar width for 628 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 628;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit308') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0309
     * @tc.name    ColumnsOperationCatalog309
     * @tc.desc    Columns navbar width for 629 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 629;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit309') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0310
     * @tc.name    ColumnsOperationCatalog310
     * @tc.desc    Columns navbar width for 630 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 630;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit310') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0311
     * @tc.name    ColumnsOperationCatalog311
     * @tc.desc    Columns navbar width for 631 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 631;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit311') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0312
     * @tc.name    ColumnsOperationCatalog312
     * @tc.desc    Columns navbar width for 632 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 632;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit312') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0313
     * @tc.name    ColumnsOperationCatalog313
     * @tc.desc    Columns navbar width for 633 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 633;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit313') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0314
     * @tc.name    ColumnsOperationCatalog314
     * @tc.desc    Columns navbar width for 634 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 634;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit314') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0315
     * @tc.name    ColumnsOperationCatalog315
     * @tc.desc    Columns navbar width for 635 probe 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 635;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit315') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0316
     * @tc.name    ColumnsOperationCatalog316
     * @tc.desc    Columns navbar width for 636 probe 316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 636;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit316') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0317
     * @tc.name    ColumnsOperationCatalog317
     * @tc.desc    Columns navbar width for 637 probe 317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 637;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit317') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0318
     * @tc.name    ColumnsOperationCatalog318
     * @tc.desc    Columns navbar width for 638 probe 318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 638;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit318') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0319
     * @tc.name    ColumnsOperationCatalog319
     * @tc.desc    Columns navbar width for 639 probe 319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 639;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit319') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0320
     * @tc.name    ColumnsOperationCatalog320
     * @tc.desc    Columns navbar width for 640 probe 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 640;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit320') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0321
     * @tc.name    ColumnsOperationCatalog321
     * @tc.desc    Columns navbar width for 641 probe 321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 641;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit321') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0322
     * @tc.name    ColumnsOperationCatalog322
     * @tc.desc    Columns navbar width for 642 probe 322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 642;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit322') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0323
     * @tc.name    ColumnsOperationCatalog323
     * @tc.desc    Columns navbar width for 643 probe 323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 643;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit323') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0324
     * @tc.name    ColumnsOperationCatalog324
     * @tc.desc    Columns navbar width for 644 probe 324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 644;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit324') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0325
     * @tc.name    ColumnsOperationCatalog325
     * @tc.desc    Columns navbar width for 645 probe 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 645;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit325') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0326
     * @tc.name    ColumnsOperationCatalog326
     * @tc.desc    Columns navbar width for 646 probe 326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 646;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit326') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0327
     * @tc.name    ColumnsOperationCatalog327
     * @tc.desc    Columns navbar width for 647 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 647;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit327') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0328
     * @tc.name    ColumnsOperationCatalog328
     * @tc.desc    Columns navbar width for 648 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 648;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit328') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_COLUMNS_0329
     * @tc.name    ColumnsOperationCatalog329
     * @tc.desc    Columns navbar width for 649 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('ColumnsOperationCatalog329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const width: number = 649;
      const nav = m.navbarWidth(width);
      expect(Math.abs(nav - 0.4 * width) < 0.0001).assertEqual(true);
      expect(Math.abs(nav + m.contentWidth(width) - width) < 0.0001).assertEqual(true);
      expect(m.getMailByType('nohit329') === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
