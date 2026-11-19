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
import { DietModel } from '../Shared/DietModel';

const DOMAIN: number = 0xF811;
const TAG: string = '[DietTests]';

export default function dietEndToEndSuite() {
  describe('DietEndToEndSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0001
     * @tc.name    DietEndToEnd001
     * @tc.desc    Diet add entry weight 2 probe 1
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd001', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 2);
      expect(entry.weight).assertEqual(2);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 1) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0002
     * @tc.name    DietEndToEnd002
     * @tc.desc    Diet food lookup for id 2 probe 2
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd002', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 2) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0003
     * @tc.name    DietEndToEnd003
     * @tc.desc    Diet add entry weight 4 probe 3
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd003', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 4);
      expect(entry.weight).assertEqual(4);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 3) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0004
     * @tc.name    DietEndToEnd004
     * @tc.desc    Diet food lookup for id 4 probe 4
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd004', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 4) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0005
     * @tc.name    DietEndToEnd005
     * @tc.desc    Diet add entry weight 6 probe 5
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd005', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 6);
      expect(entry.weight).assertEqual(6);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 5) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0006
     * @tc.name    DietEndToEnd006
     * @tc.desc    Diet food lookup for id 6 probe 6
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd006', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 6) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0007
     * @tc.name    DietEndToEnd007
     * @tc.desc    Diet add entry weight 8 probe 7
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd007', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 8);
      expect(entry.weight).assertEqual(8);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 7) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0008
     * @tc.name    DietEndToEnd008
     * @tc.desc    Diet food lookup for id 8 probe 8
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd008', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 8) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0009
     * @tc.name    DietEndToEnd009
     * @tc.desc    Diet add entry weight 10 probe 9
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd009', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 10);
      expect(entry.weight).assertEqual(10);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 9) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0010
     * @tc.name    DietEndToEnd010
     * @tc.desc    Diet food lookup for id 10 probe 10
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd010', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 10) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0011
     * @tc.name    DietEndToEnd011
     * @tc.desc    Diet add entry weight 12 probe 11
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd011', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 12);
      expect(entry.weight).assertEqual(12);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 11) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0012
     * @tc.name    DietEndToEnd012
     * @tc.desc    Diet food lookup for id 0 probe 12
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd012', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 12) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0013
     * @tc.name    DietEndToEnd013
     * @tc.desc    Diet add entry weight 14 probe 13
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd013', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 14);
      expect(entry.weight).assertEqual(14);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 13) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0014
     * @tc.name    DietEndToEnd014
     * @tc.desc    Diet food lookup for id 2 probe 14
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd014', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 14) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0015
     * @tc.name    DietEndToEnd015
     * @tc.desc    Diet add entry weight 16 probe 15
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd015', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 16);
      expect(entry.weight).assertEqual(16);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 15) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0016
     * @tc.name    DietEndToEnd016
     * @tc.desc    Diet food lookup for id 4 probe 16
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd016', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 16) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0017
     * @tc.name    DietEndToEnd017
     * @tc.desc    Diet add entry weight 18 probe 17
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd017', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 18);
      expect(entry.weight).assertEqual(18);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 17) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0018
     * @tc.name    DietEndToEnd018
     * @tc.desc    Diet food lookup for id 6 probe 18
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd018', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 18) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0019
     * @tc.name    DietEndToEnd019
     * @tc.desc    Diet add entry weight 20 probe 19
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd019', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 20);
      expect(entry.weight).assertEqual(20);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 19) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0020
     * @tc.name    DietEndToEnd020
     * @tc.desc    Diet food lookup for id 8 probe 20
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd020', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 20) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0021
     * @tc.name    DietEndToEnd021
     * @tc.desc    Diet add entry weight 22 probe 21
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd021', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 22);
      expect(entry.weight).assertEqual(22);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 21) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0022
     * @tc.name    DietEndToEnd022
     * @tc.desc    Diet food lookup for id 10 probe 22
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd022', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 22) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0023
     * @tc.name    DietEndToEnd023
     * @tc.desc    Diet add entry weight 24 probe 23
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd023', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 24);
      expect(entry.weight).assertEqual(24);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 23) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0024
     * @tc.name    DietEndToEnd024
     * @tc.desc    Diet food lookup for id 0 probe 24
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd024', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 24) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0025
     * @tc.name    DietEndToEnd025
     * @tc.desc    Diet add entry weight 26 probe 25
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd025', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 26);
      expect(entry.weight).assertEqual(26);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 25) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0026
     * @tc.name    DietEndToEnd026
     * @tc.desc    Diet food lookup for id 2 probe 26
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd026', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 26) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0027
     * @tc.name    DietEndToEnd027
     * @tc.desc    Diet add entry weight 28 probe 27
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd027', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 28);
      expect(entry.weight).assertEqual(28);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 27) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0028
     * @tc.name    DietEndToEnd028
     * @tc.desc    Diet food lookup for id 4 probe 28
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd028', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 28) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0029
     * @tc.name    DietEndToEnd029
     * @tc.desc    Diet add entry weight 30 probe 29
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd029', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 30);
      expect(entry.weight).assertEqual(30);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 29) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0030
     * @tc.name    DietEndToEnd030
     * @tc.desc    Diet food lookup for id 6 probe 30
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd030', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 30) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0031
     * @tc.name    DietEndToEnd031
     * @tc.desc    Diet add entry weight 32 probe 31
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd031', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 32);
      expect(entry.weight).assertEqual(32);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 31) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0032
     * @tc.name    DietEndToEnd032
     * @tc.desc    Diet food lookup for id 8 probe 32
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd032', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 32) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0033
     * @tc.name    DietEndToEnd033
     * @tc.desc    Diet add entry weight 34 probe 33
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd033', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 34);
      expect(entry.weight).assertEqual(34);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 33) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0034
     * @tc.name    DietEndToEnd034
     * @tc.desc    Diet food lookup for id 10 probe 34
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd034', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 34) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0035
     * @tc.name    DietEndToEnd035
     * @tc.desc    Diet add entry weight 36 probe 35
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd035', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 36);
      expect(entry.weight).assertEqual(36);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 35) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0036
     * @tc.name    DietEndToEnd036
     * @tc.desc    Diet food lookup for id 0 probe 36
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd036', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 36) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0037
     * @tc.name    DietEndToEnd037
     * @tc.desc    Diet add entry weight 38 probe 37
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd037', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 38);
      expect(entry.weight).assertEqual(38);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 37) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0038
     * @tc.name    DietEndToEnd038
     * @tc.desc    Diet food lookup for id 2 probe 38
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd038', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 38) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0039
     * @tc.name    DietEndToEnd039
     * @tc.desc    Diet add entry weight 40 probe 39
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd039', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 40);
      expect(entry.weight).assertEqual(40);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 39) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0040
     * @tc.name    DietEndToEnd040
     * @tc.desc    Diet food lookup for id 4 probe 40
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd040', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 40) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0041
     * @tc.name    DietEndToEnd041
     * @tc.desc    Diet add entry weight 42 probe 41
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd041', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 42);
      expect(entry.weight).assertEqual(42);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 41) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0042
     * @tc.name    DietEndToEnd042
     * @tc.desc    Diet food lookup for id 6 probe 42
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd042', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 42) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0043
     * @tc.name    DietEndToEnd043
     * @tc.desc    Diet add entry weight 44 probe 43
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd043', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 44);
      expect(entry.weight).assertEqual(44);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 43) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0044
     * @tc.name    DietEndToEnd044
     * @tc.desc    Diet food lookup for id 8 probe 44
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd044', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 44) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0045
     * @tc.name    DietEndToEnd045
     * @tc.desc    Diet add entry weight 46 probe 45
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd045', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 46);
      expect(entry.weight).assertEqual(46);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 45) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0046
     * @tc.name    DietEndToEnd046
     * @tc.desc    Diet food lookup for id 10 probe 46
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd046', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 46) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0047
     * @tc.name    DietEndToEnd047
     * @tc.desc    Diet add entry weight 48 probe 47
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd047', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 48);
      expect(entry.weight).assertEqual(48);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 47) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0048
     * @tc.name    DietEndToEnd048
     * @tc.desc    Diet food lookup for id 0 probe 48
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd048', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 48) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0049
     * @tc.name    DietEndToEnd049
     * @tc.desc    Diet add entry weight 50 probe 49
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd049', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 50);
      expect(entry.weight).assertEqual(50);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 49) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0050
     * @tc.name    DietEndToEnd050
     * @tc.desc    Diet food lookup for id 2 probe 50
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd050', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 50) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0051
     * @tc.name    DietEndToEnd051
     * @tc.desc    Diet add entry weight 52 probe 51
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd051', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 52);
      expect(entry.weight).assertEqual(52);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 51) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0052
     * @tc.name    DietEndToEnd052
     * @tc.desc    Diet food lookup for id 4 probe 52
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd052', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 52) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0053
     * @tc.name    DietEndToEnd053
     * @tc.desc    Diet add entry weight 54 probe 53
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd053', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 54);
      expect(entry.weight).assertEqual(54);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 53) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0054
     * @tc.name    DietEndToEnd054
     * @tc.desc    Diet food lookup for id 6 probe 54
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd054', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 54) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0055
     * @tc.name    DietEndToEnd055
     * @tc.desc    Diet add entry weight 56 probe 55
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd055', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 56);
      expect(entry.weight).assertEqual(56);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 55) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0056
     * @tc.name    DietEndToEnd056
     * @tc.desc    Diet food lookup for id 8 probe 56
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd056', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 56) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0057
     * @tc.name    DietEndToEnd057
     * @tc.desc    Diet add entry weight 58 probe 57
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd057', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 58);
      expect(entry.weight).assertEqual(58);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 57) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0058
     * @tc.name    DietEndToEnd058
     * @tc.desc    Diet food lookup for id 10 probe 58
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd058', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 58) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0059
     * @tc.name    DietEndToEnd059
     * @tc.desc    Diet add entry weight 60 probe 59
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd059', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 60);
      expect(entry.weight).assertEqual(60);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 59) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0060
     * @tc.name    DietEndToEnd060
     * @tc.desc    Diet food lookup for id 0 probe 60
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd060', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 60) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0061
     * @tc.name    DietEndToEnd061
     * @tc.desc    Diet add entry weight 62 probe 61
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd061', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 62);
      expect(entry.weight).assertEqual(62);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 61) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0062
     * @tc.name    DietEndToEnd062
     * @tc.desc    Diet food lookup for id 2 probe 62
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd062', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 62) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0063
     * @tc.name    DietEndToEnd063
     * @tc.desc    Diet add entry weight 64 probe 63
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd063', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 64);
      expect(entry.weight).assertEqual(64);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 63) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0064
     * @tc.name    DietEndToEnd064
     * @tc.desc    Diet food lookup for id 4 probe 64
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd064', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 64) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0065
     * @tc.name    DietEndToEnd065
     * @tc.desc    Diet add entry weight 66 probe 65
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd065', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 66);
      expect(entry.weight).assertEqual(66);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 65) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0066
     * @tc.name    DietEndToEnd066
     * @tc.desc    Diet food lookup for id 6 probe 66
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd066', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 66) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0067
     * @tc.name    DietEndToEnd067
     * @tc.desc    Diet add entry weight 68 probe 67
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd067', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 68);
      expect(entry.weight).assertEqual(68);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 67) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0068
     * @tc.name    DietEndToEnd068
     * @tc.desc    Diet food lookup for id 8 probe 68
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd068', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 68) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0069
     * @tc.name    DietEndToEnd069
     * @tc.desc    Diet add entry weight 70 probe 69
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd069', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 70);
      expect(entry.weight).assertEqual(70);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 69) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0070
     * @tc.name    DietEndToEnd070
     * @tc.desc    Diet food lookup for id 10 probe 70
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd070', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 70) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0071
     * @tc.name    DietEndToEnd071
     * @tc.desc    Diet add entry weight 72 probe 71
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd071', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 72);
      expect(entry.weight).assertEqual(72);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 71) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0072
     * @tc.name    DietEndToEnd072
     * @tc.desc    Diet food lookup for id 0 probe 72
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd072', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 72) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0073
     * @tc.name    DietEndToEnd073
     * @tc.desc    Diet add entry weight 74 probe 73
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd073', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 74);
      expect(entry.weight).assertEqual(74);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 73) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0074
     * @tc.name    DietEndToEnd074
     * @tc.desc    Diet food lookup for id 2 probe 74
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd074', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 74) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0075
     * @tc.name    DietEndToEnd075
     * @tc.desc    Diet add entry weight 76 probe 75
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd075', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 76);
      expect(entry.weight).assertEqual(76);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 75) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0076
     * @tc.name    DietEndToEnd076
     * @tc.desc    Diet food lookup for id 4 probe 76
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd076', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 76) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0077
     * @tc.name    DietEndToEnd077
     * @tc.desc    Diet add entry weight 78 probe 77
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd077', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 78);
      expect(entry.weight).assertEqual(78);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 77) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0078
     * @tc.name    DietEndToEnd078
     * @tc.desc    Diet food lookup for id 6 probe 78
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd078', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 78) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0079
     * @tc.name    DietEndToEnd079
     * @tc.desc    Diet add entry weight 80 probe 79
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd079', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 80);
      expect(entry.weight).assertEqual(80);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 79) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0080
     * @tc.name    DietEndToEnd080
     * @tc.desc    Diet food lookup for id 8 probe 80
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd080', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 80) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0081
     * @tc.name    DietEndToEnd081
     * @tc.desc    Diet add entry weight 82 probe 81
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd081', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 82);
      expect(entry.weight).assertEqual(82);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 81) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0082
     * @tc.name    DietEndToEnd082
     * @tc.desc    Diet food lookup for id 10 probe 82
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd082', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 82) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0083
     * @tc.name    DietEndToEnd083
     * @tc.desc    Diet add entry weight 84 probe 83
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd083', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 84);
      expect(entry.weight).assertEqual(84);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 83) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0084
     * @tc.name    DietEndToEnd084
     * @tc.desc    Diet food lookup for id 0 probe 84
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd084', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 84) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0085
     * @tc.name    DietEndToEnd085
     * @tc.desc    Diet add entry weight 86 probe 85
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd085', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 86);
      expect(entry.weight).assertEqual(86);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 85) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0086
     * @tc.name    DietEndToEnd086
     * @tc.desc    Diet food lookup for id 2 probe 86
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd086', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 86) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0087
     * @tc.name    DietEndToEnd087
     * @tc.desc    Diet add entry weight 88 probe 87
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd087', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 88);
      expect(entry.weight).assertEqual(88);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 87) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0088
     * @tc.name    DietEndToEnd088
     * @tc.desc    Diet food lookup for id 4 probe 88
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd088', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 88) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0089
     * @tc.name    DietEndToEnd089
     * @tc.desc    Diet add entry weight 90 probe 89
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd089', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 90);
      expect(entry.weight).assertEqual(90);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 89) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0090
     * @tc.name    DietEndToEnd090
     * @tc.desc    Diet food lookup for id 6 probe 90
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd090', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 90) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0091
     * @tc.name    DietEndToEnd091
     * @tc.desc    Diet add entry weight 92 probe 91
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd091', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 92);
      expect(entry.weight).assertEqual(92);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 91) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0092
     * @tc.name    DietEndToEnd092
     * @tc.desc    Diet food lookup for id 8 probe 92
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd092', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 92) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0093
     * @tc.name    DietEndToEnd093
     * @tc.desc    Diet add entry weight 94 probe 93
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd093', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 94);
      expect(entry.weight).assertEqual(94);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 93) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0094
     * @tc.name    DietEndToEnd094
     * @tc.desc    Diet food lookup for id 10 probe 94
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd094', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 94) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0095
     * @tc.name    DietEndToEnd095
     * @tc.desc    Diet add entry weight 96 probe 95
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd095', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 96);
      expect(entry.weight).assertEqual(96);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 95) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0096
     * @tc.name    DietEndToEnd096
     * @tc.desc    Diet food lookup for id 0 probe 96
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd096', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 96) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0097
     * @tc.name    DietEndToEnd097
     * @tc.desc    Diet add entry weight 98 probe 97
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd097', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 98);
      expect(entry.weight).assertEqual(98);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 97) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0098
     * @tc.name    DietEndToEnd098
     * @tc.desc    Diet food lookup for id 2 probe 98
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd098', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 98) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0099
     * @tc.name    DietEndToEnd099
     * @tc.desc    Diet add entry weight 100 probe 99
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd099', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 100);
      expect(entry.weight).assertEqual(100);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 99) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0100
     * @tc.name    DietEndToEnd100
     * @tc.desc    Diet food lookup for id 4 probe 100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd100', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 4;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 100) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0101
     * @tc.name    DietEndToEnd101
     * @tc.desc    Diet add entry weight 102 probe 101
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd101', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(5, 1, 102);
      expect(entry.weight).assertEqual(102);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 101) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0102
     * @tc.name    DietEndToEnd102
     * @tc.desc    Diet food lookup for id 6 probe 102
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd102', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 6;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 102) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0103
     * @tc.name    DietEndToEnd103
     * @tc.desc    Diet add entry weight 104 probe 103
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd103', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(7, 3, 104);
      expect(entry.weight).assertEqual(104);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 103) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0104
     * @tc.name    DietEndToEnd104
     * @tc.desc    Diet food lookup for id 8 probe 104
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd104', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 8;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 104) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0105
     * @tc.name    DietEndToEnd105
     * @tc.desc    Diet add entry weight 106 probe 105
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd105', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(9, 1, 106);
      expect(entry.weight).assertEqual(106);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 105) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0106
     * @tc.name    DietEndToEnd106
     * @tc.desc    Diet food lookup for id 10 probe 106
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd106', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 10;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 106) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0107
     * @tc.name    DietEndToEnd107
     * @tc.desc    Diet add entry weight 108 probe 107
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd107', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(11, 3, 108);
      expect(entry.weight).assertEqual(108);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 107) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0108
     * @tc.name    DietEndToEnd108
     * @tc.desc    Diet food lookup for id 0 probe 108
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd108', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 0;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 108) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0109
     * @tc.name    DietEndToEnd109
     * @tc.desc    Diet add entry weight 110 probe 109
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd109', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(1, 1, 110);
      expect(entry.weight).assertEqual(110);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 109) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0110
     * @tc.name    DietEndToEnd110
     * @tc.desc    Diet food lookup for id 2 probe 110
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd110', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 2;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 110) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0111
     * @tc.name    DietEndToEnd111
     * @tc.desc    Diet add entry weight 112 probe 111
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietEndToEnd111', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(3, 3, 112);
      expect(entry.weight).assertEqual(112);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 111) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

