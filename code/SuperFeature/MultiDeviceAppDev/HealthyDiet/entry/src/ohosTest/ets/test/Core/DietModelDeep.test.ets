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

export default function dietModelDeepSuite() {
  describe('DietModelDeepSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0112
     * @tc.name    DietModelDeep112
     * @tc.desc    Diet add entry weight 113 probe 112
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep112', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 113);
      expect(entry.weight).assertEqual(113);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 112) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0113
     * @tc.name    DietModelDeep113
     * @tc.desc    Diet food lookup for id 5 probe 113
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep113', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 113) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0114
     * @tc.name    DietModelDeep114
     * @tc.desc    Diet add entry weight 115 probe 114
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep114', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 115);
      expect(entry.weight).assertEqual(115);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 114) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0115
     * @tc.name    DietModelDeep115
     * @tc.desc    Diet food lookup for id 7 probe 115
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep115', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 115) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0116
     * @tc.name    DietModelDeep116
     * @tc.desc    Diet add entry weight 117 probe 116
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep116', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 117);
      expect(entry.weight).assertEqual(117);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 116) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0117
     * @tc.name    DietModelDeep117
     * @tc.desc    Diet food lookup for id 9 probe 117
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep117', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 117) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0118
     * @tc.name    DietModelDeep118
     * @tc.desc    Diet add entry weight 119 probe 118
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep118', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 119);
      expect(entry.weight).assertEqual(119);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 118) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0119
     * @tc.name    DietModelDeep119
     * @tc.desc    Diet food lookup for id 11 probe 119
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep119', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 119) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0120
     * @tc.name    DietModelDeep120
     * @tc.desc    Diet add entry weight 121 probe 120
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep120', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 121);
      expect(entry.weight).assertEqual(121);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 120) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0121
     * @tc.name    DietModelDeep121
     * @tc.desc    Diet food lookup for id 1 probe 121
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep121', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 121) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0122
     * @tc.name    DietModelDeep122
     * @tc.desc    Diet add entry weight 123 probe 122
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep122', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 123);
      expect(entry.weight).assertEqual(123);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 122) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0123
     * @tc.name    DietModelDeep123
     * @tc.desc    Diet food lookup for id 3 probe 123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 123) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0124
     * @tc.name    DietModelDeep124
     * @tc.desc    Diet add entry weight 125 probe 124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 125);
      expect(entry.weight).assertEqual(125);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 124) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0125
     * @tc.name    DietModelDeep125
     * @tc.desc    Diet food lookup for id 5 probe 125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 125) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0126
     * @tc.name    DietModelDeep126
     * @tc.desc    Diet add entry weight 127 probe 126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 127);
      expect(entry.weight).assertEqual(127);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 126) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0127
     * @tc.name    DietModelDeep127
     * @tc.desc    Diet food lookup for id 7 probe 127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 127) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0128
     * @tc.name    DietModelDeep128
     * @tc.desc    Diet add entry weight 129 probe 128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 129);
      expect(entry.weight).assertEqual(129);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 128) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0129
     * @tc.name    DietModelDeep129
     * @tc.desc    Diet food lookup for id 9 probe 129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 129) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0130
     * @tc.name    DietModelDeep130
     * @tc.desc    Diet add entry weight 131 probe 130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 131);
      expect(entry.weight).assertEqual(131);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 130) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0131
     * @tc.name    DietModelDeep131
     * @tc.desc    Diet food lookup for id 11 probe 131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 131) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0132
     * @tc.name    DietModelDeep132
     * @tc.desc    Diet add entry weight 133 probe 132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 133);
      expect(entry.weight).assertEqual(133);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 132) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0133
     * @tc.name    DietModelDeep133
     * @tc.desc    Diet food lookup for id 1 probe 133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 133) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0134
     * @tc.name    DietModelDeep134
     * @tc.desc    Diet add entry weight 135 probe 134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 135);
      expect(entry.weight).assertEqual(135);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 134) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0135
     * @tc.name    DietModelDeep135
     * @tc.desc    Diet food lookup for id 3 probe 135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 135) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0136
     * @tc.name    DietModelDeep136
     * @tc.desc    Diet add entry weight 137 probe 136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 137);
      expect(entry.weight).assertEqual(137);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 136) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0137
     * @tc.name    DietModelDeep137
     * @tc.desc    Diet food lookup for id 5 probe 137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 137) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0138
     * @tc.name    DietModelDeep138
     * @tc.desc    Diet add entry weight 139 probe 138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 139);
      expect(entry.weight).assertEqual(139);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 138) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0139
     * @tc.name    DietModelDeep139
     * @tc.desc    Diet food lookup for id 7 probe 139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 139) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0140
     * @tc.name    DietModelDeep140
     * @tc.desc    Diet add entry weight 141 probe 140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 141);
      expect(entry.weight).assertEqual(141);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 140) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0141
     * @tc.name    DietModelDeep141
     * @tc.desc    Diet food lookup for id 9 probe 141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 141) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0142
     * @tc.name    DietModelDeep142
     * @tc.desc    Diet add entry weight 143 probe 142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 143);
      expect(entry.weight).assertEqual(143);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 142) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0143
     * @tc.name    DietModelDeep143
     * @tc.desc    Diet food lookup for id 11 probe 143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 143) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0144
     * @tc.name    DietModelDeep144
     * @tc.desc    Diet add entry weight 145 probe 144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 145);
      expect(entry.weight).assertEqual(145);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 144) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0145
     * @tc.name    DietModelDeep145
     * @tc.desc    Diet food lookup for id 1 probe 145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 145) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0146
     * @tc.name    DietModelDeep146
     * @tc.desc    Diet add entry weight 147 probe 146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 147);
      expect(entry.weight).assertEqual(147);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 146) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0147
     * @tc.name    DietModelDeep147
     * @tc.desc    Diet food lookup for id 3 probe 147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 147) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0148
     * @tc.name    DietModelDeep148
     * @tc.desc    Diet add entry weight 149 probe 148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 149);
      expect(entry.weight).assertEqual(149);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 148) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0149
     * @tc.name    DietModelDeep149
     * @tc.desc    Diet food lookup for id 5 probe 149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 149) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0150
     * @tc.name    DietModelDeep150
     * @tc.desc    Diet add entry weight 151 probe 150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 151);
      expect(entry.weight).assertEqual(151);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 150) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0151
     * @tc.name    DietModelDeep151
     * @tc.desc    Diet food lookup for id 7 probe 151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 151) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0152
     * @tc.name    DietModelDeep152
     * @tc.desc    Diet add entry weight 153 probe 152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 153);
      expect(entry.weight).assertEqual(153);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 152) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0153
     * @tc.name    DietModelDeep153
     * @tc.desc    Diet food lookup for id 9 probe 153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 153) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0154
     * @tc.name    DietModelDeep154
     * @tc.desc    Diet add entry weight 155 probe 154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 155);
      expect(entry.weight).assertEqual(155);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 154) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0155
     * @tc.name    DietModelDeep155
     * @tc.desc    Diet food lookup for id 11 probe 155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 155) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0156
     * @tc.name    DietModelDeep156
     * @tc.desc    Diet add entry weight 157 probe 156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 157);
      expect(entry.weight).assertEqual(157);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 156) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0157
     * @tc.name    DietModelDeep157
     * @tc.desc    Diet food lookup for id 1 probe 157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 157) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0158
     * @tc.name    DietModelDeep158
     * @tc.desc    Diet add entry weight 159 probe 158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 159);
      expect(entry.weight).assertEqual(159);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 158) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0159
     * @tc.name    DietModelDeep159
     * @tc.desc    Diet food lookup for id 3 probe 159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 159) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0160
     * @tc.name    DietModelDeep160
     * @tc.desc    Diet add entry weight 161 probe 160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 161);
      expect(entry.weight).assertEqual(161);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 160) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0161
     * @tc.name    DietModelDeep161
     * @tc.desc    Diet food lookup for id 5 probe 161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 161) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0162
     * @tc.name    DietModelDeep162
     * @tc.desc    Diet add entry weight 163 probe 162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 163);
      expect(entry.weight).assertEqual(163);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 162) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0163
     * @tc.name    DietModelDeep163
     * @tc.desc    Diet food lookup for id 7 probe 163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 163) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0164
     * @tc.name    DietModelDeep164
     * @tc.desc    Diet add entry weight 165 probe 164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 165);
      expect(entry.weight).assertEqual(165);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 164) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0165
     * @tc.name    DietModelDeep165
     * @tc.desc    Diet food lookup for id 9 probe 165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 165) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0166
     * @tc.name    DietModelDeep166
     * @tc.desc    Diet add entry weight 167 probe 166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 167);
      expect(entry.weight).assertEqual(167);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 166) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0167
     * @tc.name    DietModelDeep167
     * @tc.desc    Diet food lookup for id 11 probe 167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 167) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0168
     * @tc.name    DietModelDeep168
     * @tc.desc    Diet add entry weight 169 probe 168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 169);
      expect(entry.weight).assertEqual(169);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 168) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0169
     * @tc.name    DietModelDeep169
     * @tc.desc    Diet food lookup for id 1 probe 169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 169) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0170
     * @tc.name    DietModelDeep170
     * @tc.desc    Diet add entry weight 171 probe 170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 171);
      expect(entry.weight).assertEqual(171);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 170) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0171
     * @tc.name    DietModelDeep171
     * @tc.desc    Diet food lookup for id 3 probe 171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 171) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0172
     * @tc.name    DietModelDeep172
     * @tc.desc    Diet add entry weight 173 probe 172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 173);
      expect(entry.weight).assertEqual(173);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 172) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0173
     * @tc.name    DietModelDeep173
     * @tc.desc    Diet food lookup for id 5 probe 173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 173) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0174
     * @tc.name    DietModelDeep174
     * @tc.desc    Diet add entry weight 175 probe 174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 175);
      expect(entry.weight).assertEqual(175);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 174) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0175
     * @tc.name    DietModelDeep175
     * @tc.desc    Diet food lookup for id 7 probe 175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 175) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0176
     * @tc.name    DietModelDeep176
     * @tc.desc    Diet add entry weight 177 probe 176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 177);
      expect(entry.weight).assertEqual(177);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 176) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0177
     * @tc.name    DietModelDeep177
     * @tc.desc    Diet food lookup for id 9 probe 177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 177) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0178
     * @tc.name    DietModelDeep178
     * @tc.desc    Diet add entry weight 179 probe 178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 179);
      expect(entry.weight).assertEqual(179);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 178) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0179
     * @tc.name    DietModelDeep179
     * @tc.desc    Diet food lookup for id 11 probe 179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 179) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0180
     * @tc.name    DietModelDeep180
     * @tc.desc    Diet add entry weight 181 probe 180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 181);
      expect(entry.weight).assertEqual(181);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 180) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0181
     * @tc.name    DietModelDeep181
     * @tc.desc    Diet food lookup for id 1 probe 181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 181) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0182
     * @tc.name    DietModelDeep182
     * @tc.desc    Diet add entry weight 183 probe 182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 183);
      expect(entry.weight).assertEqual(183);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 182) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0183
     * @tc.name    DietModelDeep183
     * @tc.desc    Diet food lookup for id 3 probe 183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 183) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0184
     * @tc.name    DietModelDeep184
     * @tc.desc    Diet add entry weight 185 probe 184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 185);
      expect(entry.weight).assertEqual(185);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0185
     * @tc.name    DietModelDeep185
     * @tc.desc    Diet food lookup for id 5 probe 185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0186
     * @tc.name    DietModelDeep186
     * @tc.desc    Diet add entry weight 187 probe 186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 187);
      expect(entry.weight).assertEqual(187);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0187
     * @tc.name    DietModelDeep187
     * @tc.desc    Diet food lookup for id 7 probe 187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0188
     * @tc.name    DietModelDeep188
     * @tc.desc    Diet add entry weight 189 probe 188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 189);
      expect(entry.weight).assertEqual(189);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0189
     * @tc.name    DietModelDeep189
     * @tc.desc    Diet food lookup for id 9 probe 189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0190
     * @tc.name    DietModelDeep190
     * @tc.desc    Diet add entry weight 191 probe 190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 191);
      expect(entry.weight).assertEqual(191);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0191
     * @tc.name    DietModelDeep191
     * @tc.desc    Diet food lookup for id 11 probe 191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0192
     * @tc.name    DietModelDeep192
     * @tc.desc    Diet add entry weight 193 probe 192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 193);
      expect(entry.weight).assertEqual(193);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0193
     * @tc.name    DietModelDeep193
     * @tc.desc    Diet food lookup for id 1 probe 193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0194
     * @tc.name    DietModelDeep194
     * @tc.desc    Diet add entry weight 195 probe 194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 195);
      expect(entry.weight).assertEqual(195);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0195
     * @tc.name    DietModelDeep195
     * @tc.desc    Diet food lookup for id 3 probe 195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0196
     * @tc.name    DietModelDeep196
     * @tc.desc    Diet add entry weight 197 probe 196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 197);
      expect(entry.weight).assertEqual(197);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0197
     * @tc.name    DietModelDeep197
     * @tc.desc    Diet food lookup for id 5 probe 197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0198
     * @tc.name    DietModelDeep198
     * @tc.desc    Diet add entry weight 199 probe 198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 199);
      expect(entry.weight).assertEqual(199);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0199
     * @tc.name    DietModelDeep199
     * @tc.desc    Diet food lookup for id 7 probe 199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0200
     * @tc.name    DietModelDeep200
     * @tc.desc    Diet add entry weight 201 probe 200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 201);
      expect(entry.weight).assertEqual(201);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0201
     * @tc.name    DietModelDeep201
     * @tc.desc    Diet food lookup for id 9 probe 201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0202
     * @tc.name    DietModelDeep202
     * @tc.desc    Diet add entry weight 203 probe 202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 203);
      expect(entry.weight).assertEqual(203);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0203
     * @tc.name    DietModelDeep203
     * @tc.desc    Diet food lookup for id 11 probe 203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0204
     * @tc.name    DietModelDeep204
     * @tc.desc    Diet add entry weight 205 probe 204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 205);
      expect(entry.weight).assertEqual(205);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0205
     * @tc.name    DietModelDeep205
     * @tc.desc    Diet food lookup for id 1 probe 205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0206
     * @tc.name    DietModelDeep206
     * @tc.desc    Diet add entry weight 207 probe 206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 207);
      expect(entry.weight).assertEqual(207);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0207
     * @tc.name    DietModelDeep207
     * @tc.desc    Diet food lookup for id 3 probe 207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0208
     * @tc.name    DietModelDeep208
     * @tc.desc    Diet add entry weight 209 probe 208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 209);
      expect(entry.weight).assertEqual(209);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0209
     * @tc.name    DietModelDeep209
     * @tc.desc    Diet food lookup for id 5 probe 209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0210
     * @tc.name    DietModelDeep210
     * @tc.desc    Diet add entry weight 211 probe 210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 211);
      expect(entry.weight).assertEqual(211);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0211
     * @tc.name    DietModelDeep211
     * @tc.desc    Diet food lookup for id 7 probe 211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0212
     * @tc.name    DietModelDeep212
     * @tc.desc    Diet add entry weight 213 probe 212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 213);
      expect(entry.weight).assertEqual(213);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0213
     * @tc.name    DietModelDeep213
     * @tc.desc    Diet food lookup for id 9 probe 213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 213) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0214
     * @tc.name    DietModelDeep214
     * @tc.desc    Diet add entry weight 215 probe 214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 215);
      expect(entry.weight).assertEqual(215);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 214) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });
