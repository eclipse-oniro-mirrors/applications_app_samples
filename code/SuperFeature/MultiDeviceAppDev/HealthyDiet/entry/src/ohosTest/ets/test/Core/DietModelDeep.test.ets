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

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0215
     * @tc.name    DietModelDeep215
     * @tc.desc    Diet food lookup for id 11 probe 215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 215) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0216
     * @tc.name    DietModelDeep216
     * @tc.desc    Diet add entry weight 217 probe 216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 217);
      expect(entry.weight).assertEqual(217);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 216) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0217
     * @tc.name    DietModelDeep217
     * @tc.desc    Diet food lookup for id 1 probe 217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 217) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0218
     * @tc.name    DietModelDeep218
     * @tc.desc    Diet add entry weight 219 probe 218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 219);
      expect(entry.weight).assertEqual(219);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 218) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0219
     * @tc.name    DietModelDeep219
     * @tc.desc    Diet food lookup for id 3 probe 219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 219) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0220
     * @tc.name    DietModelDeep220
     * @tc.desc    Diet add entry weight 221 probe 220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 221);
      expect(entry.weight).assertEqual(221);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 220) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0221
     * @tc.name    DietModelDeep221
     * @tc.desc    Diet food lookup for id 5 probe 221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 221) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0222
     * @tc.name    DietModelDeep222
     * @tc.desc    Diet add entry weight 223 probe 222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 223);
      expect(entry.weight).assertEqual(223);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 222) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0223
     * @tc.name    DietModelDeep223
     * @tc.desc    Diet food lookup for id 7 probe 223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 223) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0224
     * @tc.name    DietModelDeep224
     * @tc.desc    Diet add entry weight 225 probe 224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 225);
      expect(entry.weight).assertEqual(225);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 224) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0225
     * @tc.name    DietModelDeep225
     * @tc.desc    Diet food lookup for id 9 probe 225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 225) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0226
     * @tc.name    DietModelDeep226
     * @tc.desc    Diet add entry weight 227 probe 226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 227);
      expect(entry.weight).assertEqual(227);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 226) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0227
     * @tc.name    DietModelDeep227
     * @tc.desc    Diet food lookup for id 11 probe 227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 227) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0228
     * @tc.name    DietModelDeep228
     * @tc.desc    Diet add entry weight 229 probe 228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 229);
      expect(entry.weight).assertEqual(229);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 228) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0229
     * @tc.name    DietModelDeep229
     * @tc.desc    Diet food lookup for id 1 probe 229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 229) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0230
     * @tc.name    DietModelDeep230
     * @tc.desc    Diet add entry weight 231 probe 230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 231);
      expect(entry.weight).assertEqual(231);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 230) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0231
     * @tc.name    DietModelDeep231
     * @tc.desc    Diet food lookup for id 3 probe 231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 231) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0232
     * @tc.name    DietModelDeep232
     * @tc.desc    Diet add entry weight 233 probe 232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 233);
      expect(entry.weight).assertEqual(233);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 232) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0233
     * @tc.name    DietModelDeep233
     * @tc.desc    Diet food lookup for id 5 probe 233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 233) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0234
     * @tc.name    DietModelDeep234
     * @tc.desc    Diet add entry weight 235 probe 234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 235);
      expect(entry.weight).assertEqual(235);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0235
     * @tc.name    DietModelDeep235
     * @tc.desc    Diet food lookup for id 7 probe 235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0236
     * @tc.name    DietModelDeep236
     * @tc.desc    Diet add entry weight 237 probe 236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 237);
      expect(entry.weight).assertEqual(237);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0237
     * @tc.name    DietModelDeep237
     * @tc.desc    Diet food lookup for id 9 probe 237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0238
     * @tc.name    DietModelDeep238
     * @tc.desc    Diet add entry weight 239 probe 238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 239);
      expect(entry.weight).assertEqual(239);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0239
     * @tc.name    DietModelDeep239
     * @tc.desc    Diet food lookup for id 11 probe 239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0240
     * @tc.name    DietModelDeep240
     * @tc.desc    Diet add entry weight 241 probe 240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 241);
      expect(entry.weight).assertEqual(241);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0241
     * @tc.name    DietModelDeep241
     * @tc.desc    Diet food lookup for id 1 probe 241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0242
     * @tc.name    DietModelDeep242
     * @tc.desc    Diet add entry weight 243 probe 242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 243);
      expect(entry.weight).assertEqual(243);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0243
     * @tc.name    DietModelDeep243
     * @tc.desc    Diet food lookup for id 3 probe 243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0244
     * @tc.name    DietModelDeep244
     * @tc.desc    Diet add entry weight 245 probe 244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 245);
      expect(entry.weight).assertEqual(245);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0245
     * @tc.name    DietModelDeep245
     * @tc.desc    Diet food lookup for id 5 probe 245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0246
     * @tc.name    DietModelDeep246
     * @tc.desc    Diet add entry weight 247 probe 246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 247);
      expect(entry.weight).assertEqual(247);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0247
     * @tc.name    DietModelDeep247
     * @tc.desc    Diet food lookup for id 7 probe 247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0248
     * @tc.name    DietModelDeep248
     * @tc.desc    Diet add entry weight 249 probe 248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 249);
      expect(entry.weight).assertEqual(249);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0249
     * @tc.name    DietModelDeep249
     * @tc.desc    Diet food lookup for id 9 probe 249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0250
     * @tc.name    DietModelDeep250
     * @tc.desc    Diet add entry weight 251 probe 250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 251);
      expect(entry.weight).assertEqual(251);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0251
     * @tc.name    DietModelDeep251
     * @tc.desc    Diet food lookup for id 11 probe 251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0252
     * @tc.name    DietModelDeep252
     * @tc.desc    Diet add entry weight 253 probe 252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 253);
      expect(entry.weight).assertEqual(253);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0253
     * @tc.name    DietModelDeep253
     * @tc.desc    Diet food lookup for id 1 probe 253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0254
     * @tc.name    DietModelDeep254
     * @tc.desc    Diet add entry weight 255 probe 254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 255);
      expect(entry.weight).assertEqual(255);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0255
     * @tc.name    DietModelDeep255
     * @tc.desc    Diet food lookup for id 3 probe 255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0256
     * @tc.name    DietModelDeep256
     * @tc.desc    Diet add entry weight 257 probe 256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 257);
      expect(entry.weight).assertEqual(257);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0257
     * @tc.name    DietModelDeep257
     * @tc.desc    Diet food lookup for id 5 probe 257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 257) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0258
     * @tc.name    DietModelDeep258
     * @tc.desc    Diet add entry weight 259 probe 258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 259);
      expect(entry.weight).assertEqual(259);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 258) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0259
     * @tc.name    DietModelDeep259
     * @tc.desc    Diet food lookup for id 7 probe 259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 259) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0260
     * @tc.name    DietModelDeep260
     * @tc.desc    Diet add entry weight 261 probe 260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 261);
      expect(entry.weight).assertEqual(261);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 260) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0261
     * @tc.name    DietModelDeep261
     * @tc.desc    Diet food lookup for id 9 probe 261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 261) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0262
     * @tc.name    DietModelDeep262
     * @tc.desc    Diet add entry weight 263 probe 262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 263);
      expect(entry.weight).assertEqual(263);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 262) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0263
     * @tc.name    DietModelDeep263
     * @tc.desc    Diet food lookup for id 11 probe 263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 263) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0264
     * @tc.name    DietModelDeep264
     * @tc.desc    Diet add entry weight 265 probe 264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 265);
      expect(entry.weight).assertEqual(265);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 264) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0265
     * @tc.name    DietModelDeep265
     * @tc.desc    Diet food lookup for id 1 probe 265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 265) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0266
     * @tc.name    DietModelDeep266
     * @tc.desc    Diet add entry weight 267 probe 266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 267);
      expect(entry.weight).assertEqual(267);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 266) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0267
     * @tc.name    DietModelDeep267
     * @tc.desc    Diet food lookup for id 3 probe 267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 267) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0268
     * @tc.name    DietModelDeep268
     * @tc.desc    Diet add entry weight 269 probe 268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 269);
      expect(entry.weight).assertEqual(269);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 268) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0269
     * @tc.name    DietModelDeep269
     * @tc.desc    Diet food lookup for id 5 probe 269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 269) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0270
     * @tc.name    DietModelDeep270
     * @tc.desc    Diet add entry weight 271 probe 270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 271);
      expect(entry.weight).assertEqual(271);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 270) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0271
     * @tc.name    DietModelDeep271
     * @tc.desc    Diet food lookup for id 7 probe 271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 271) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0272
     * @tc.name    DietModelDeep272
     * @tc.desc    Diet add entry weight 273 probe 272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 273);
      expect(entry.weight).assertEqual(273);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0273
     * @tc.name    DietModelDeep273
     * @tc.desc    Diet food lookup for id 9 probe 273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0274
     * @tc.name    DietModelDeep274
     * @tc.desc    Diet add entry weight 275 probe 274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 275);
      expect(entry.weight).assertEqual(275);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0275
     * @tc.name    DietModelDeep275
     * @tc.desc    Diet food lookup for id 11 probe 275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0276
     * @tc.name    DietModelDeep276
     * @tc.desc    Diet add entry weight 277 probe 276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 277);
      expect(entry.weight).assertEqual(277);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0277
     * @tc.name    DietModelDeep277
     * @tc.desc    Diet food lookup for id 1 probe 277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0278
     * @tc.name    DietModelDeep278
     * @tc.desc    Diet add entry weight 279 probe 278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 279);
      expect(entry.weight).assertEqual(279);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0279
     * @tc.name    DietModelDeep279
     * @tc.desc    Diet food lookup for id 3 probe 279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0280
     * @tc.name    DietModelDeep280
     * @tc.desc    Diet add entry weight 281 probe 280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 281);
      expect(entry.weight).assertEqual(281);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 280) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0281
     * @tc.name    DietModelDeep281
     * @tc.desc    Diet food lookup for id 5 probe 281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 281) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0282
     * @tc.name    DietModelDeep282
     * @tc.desc    Diet add entry weight 283 probe 282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 283);
      expect(entry.weight).assertEqual(283);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 282) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0283
     * @tc.name    DietModelDeep283
     * @tc.desc    Diet food lookup for id 7 probe 283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 283) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0284
     * @tc.name    DietModelDeep284
     * @tc.desc    Diet add entry weight 285 probe 284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 285);
      expect(entry.weight).assertEqual(285);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 284) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0285
     * @tc.name    DietModelDeep285
     * @tc.desc    Diet food lookup for id 9 probe 285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 285) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0286
     * @tc.name    DietModelDeep286
     * @tc.desc    Diet add entry weight 287 probe 286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 287);
      expect(entry.weight).assertEqual(287);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 286) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0287
     * @tc.name    DietModelDeep287
     * @tc.desc    Diet food lookup for id 11 probe 287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 287) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0288
     * @tc.name    DietModelDeep288
     * @tc.desc    Diet add entry weight 289 probe 288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 289);
      expect(entry.weight).assertEqual(289);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 288) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0289
     * @tc.name    DietModelDeep289
     * @tc.desc    Diet food lookup for id 1 probe 289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 289) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0290
     * @tc.name    DietModelDeep290
     * @tc.desc    Diet add entry weight 291 probe 290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 291);
      expect(entry.weight).assertEqual(291);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 290) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0291
     * @tc.name    DietModelDeep291
     * @tc.desc    Diet food lookup for id 3 probe 291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 291) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0292
     * @tc.name    DietModelDeep292
     * @tc.desc    Diet add entry weight 293 probe 292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 293);
      expect(entry.weight).assertEqual(293);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 292) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0293
     * @tc.name    DietModelDeep293
     * @tc.desc    Diet food lookup for id 5 probe 293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 293) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0294
     * @tc.name    DietModelDeep294
     * @tc.desc    Diet add entry weight 295 probe 294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 295);
      expect(entry.weight).assertEqual(295);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 294) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0295
     * @tc.name    DietModelDeep295
     * @tc.desc    Diet food lookup for id 7 probe 295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 295) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0296
     * @tc.name    DietModelDeep296
     * @tc.desc    Diet add entry weight 297 probe 296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 297);
      expect(entry.weight).assertEqual(297);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 296) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0297
     * @tc.name    DietModelDeep297
     * @tc.desc    Diet food lookup for id 9 probe 297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 297) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0298
     * @tc.name    DietModelDeep298
     * @tc.desc    Diet add entry weight 299 probe 298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 299);
      expect(entry.weight).assertEqual(299);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 298) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0299
     * @tc.name    DietModelDeep299
     * @tc.desc    Diet food lookup for id 11 probe 299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 299) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0300
     * @tc.name    DietModelDeep300
     * @tc.desc    Diet add entry weight 301 probe 300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 301);
      expect(entry.weight).assertEqual(301);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 300) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0301
     * @tc.name    DietModelDeep301
     * @tc.desc    Diet food lookup for id 1 probe 301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 301) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0302
     * @tc.name    DietModelDeep302
     * @tc.desc    Diet add entry weight 303 probe 302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 303);
      expect(entry.weight).assertEqual(303);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 302) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0303
     * @tc.name    DietModelDeep303
     * @tc.desc    Diet food lookup for id 3 probe 303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 303) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0304
     * @tc.name    DietModelDeep304
     * @tc.desc    Diet add entry weight 305 probe 304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 305);
      expect(entry.weight).assertEqual(305);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 304) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0305
     * @tc.name    DietModelDeep305
     * @tc.desc    Diet food lookup for id 5 probe 305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 305) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0306
     * @tc.name    DietModelDeep306
     * @tc.desc    Diet add entry weight 307 probe 306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 307);
      expect(entry.weight).assertEqual(307);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 306) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0307
     * @tc.name    DietModelDeep307
     * @tc.desc    Diet food lookup for id 7 probe 307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 307) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0308
     * @tc.name    DietModelDeep308
     * @tc.desc    Diet add entry weight 309 probe 308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 309);
      expect(entry.weight).assertEqual(309);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 308) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0309
     * @tc.name    DietModelDeep309
     * @tc.desc    Diet food lookup for id 9 probe 309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 309) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0310
     * @tc.name    DietModelDeep310
     * @tc.desc    Diet add entry weight 311 probe 310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 311);
      expect(entry.weight).assertEqual(311);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 310) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0311
     * @tc.name    DietModelDeep311
     * @tc.desc    Diet food lookup for id 11 probe 311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 311) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0312
     * @tc.name    DietModelDeep312
     * @tc.desc    Diet add entry weight 313 probe 312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 313);
      expect(entry.weight).assertEqual(313);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 312) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0313
     * @tc.name    DietModelDeep313
     * @tc.desc    Diet food lookup for id 1 probe 313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 313) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0314
     * @tc.name    DietModelDeep314
     * @tc.desc    Diet add entry weight 315 probe 314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 315);
      expect(entry.weight).assertEqual(315);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 314) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0315
     * @tc.name    DietModelDeep315
     * @tc.desc    Diet food lookup for id 3 probe 315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 315) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0316
     * @tc.name    DietModelDeep316
     * @tc.desc    Diet add entry weight 317 probe 316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 317);
      expect(entry.weight).assertEqual(317);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 316) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0317
     * @tc.name    DietModelDeep317
     * @tc.desc    Diet food lookup for id 5 probe 317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 317) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0318
     * @tc.name    DietModelDeep318
     * @tc.desc    Diet add entry weight 319 probe 318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 319);
      expect(entry.weight).assertEqual(319);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 318) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0319
     * @tc.name    DietModelDeep319
     * @tc.desc    Diet food lookup for id 7 probe 319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 319) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0320
     * @tc.name    DietModelDeep320
     * @tc.desc    Diet add entry weight 321 probe 320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 321);
      expect(entry.weight).assertEqual(321);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 320) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0321
     * @tc.name    DietModelDeep321
     * @tc.desc    Diet food lookup for id 9 probe 321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 321) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0322
     * @tc.name    DietModelDeep322
     * @tc.desc    Diet add entry weight 323 probe 322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 323);
      expect(entry.weight).assertEqual(323);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 322) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0323
     * @tc.name    DietModelDeep323
     * @tc.desc    Diet food lookup for id 11 probe 323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 323) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0324
     * @tc.name    DietModelDeep324
     * @tc.desc    Diet add entry weight 325 probe 324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 325);
      expect(entry.weight).assertEqual(325);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 324) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0325
     * @tc.name    DietModelDeep325
     * @tc.desc    Diet food lookup for id 1 probe 325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 325) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0326
     * @tc.name    DietModelDeep326
     * @tc.desc    Diet add entry weight 327 probe 326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 327);
      expect(entry.weight).assertEqual(327);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 326) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0327
     * @tc.name    DietModelDeep327
     * @tc.desc    Diet food lookup for id 3 probe 327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 327) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0328
     * @tc.name    DietModelDeep328
     * @tc.desc    Diet add entry weight 329 probe 328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 329);
      expect(entry.weight).assertEqual(329);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 328) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0329
     * @tc.name    DietModelDeep329
     * @tc.desc    Diet food lookup for id 5 probe 329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 329) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0330
     * @tc.name    DietModelDeep330
     * @tc.desc    Diet add entry weight 331 probe 330
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep330', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 331);
      expect(entry.weight).assertEqual(331);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 330) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0331
     * @tc.name    DietModelDeep331
     * @tc.desc    Diet food lookup for id 7 probe 331
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep331', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 331) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0332
     * @tc.name    DietModelDeep332
     * @tc.desc    Diet add entry weight 333 probe 332
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep332', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 333);
      expect(entry.weight).assertEqual(333);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 332) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0333
     * @tc.name    DietModelDeep333
     * @tc.desc    Diet food lookup for id 9 probe 333
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep333', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 333) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0334
     * @tc.name    DietModelDeep334
     * @tc.desc    Diet add entry weight 335 probe 334
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep334', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 335);
      expect(entry.weight).assertEqual(335);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 334) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0335
     * @tc.name    DietModelDeep335
     * @tc.desc    Diet food lookup for id 11 probe 335
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep335', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 335) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0336
     * @tc.name    DietModelDeep336
     * @tc.desc    Diet add entry weight 337 probe 336
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep336', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 337);
      expect(entry.weight).assertEqual(337);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 336) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0337
     * @tc.name    DietModelDeep337
     * @tc.desc    Diet food lookup for id 1 probe 337
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep337', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 337) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0338
     * @tc.name    DietModelDeep338
     * @tc.desc    Diet add entry weight 339 probe 338
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep338', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 339);
      expect(entry.weight).assertEqual(339);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 338) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0339
     * @tc.name    DietModelDeep339
     * @tc.desc    Diet food lookup for id 3 probe 339
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep339', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 339) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0340
     * @tc.name    DietModelDeep340
     * @tc.desc    Diet add entry weight 341 probe 340
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep340', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 341);
      expect(entry.weight).assertEqual(341);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 340) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0341
     * @tc.name    DietModelDeep341
     * @tc.desc    Diet food lookup for id 5 probe 341
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep341', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 341) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0342
     * @tc.name    DietModelDeep342
     * @tc.desc    Diet add entry weight 343 probe 342
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep342', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 343);
      expect(entry.weight).assertEqual(343);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 342) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0343
     * @tc.name    DietModelDeep343
     * @tc.desc    Diet food lookup for id 7 probe 343
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep343', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 343) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0344
     * @tc.name    DietModelDeep344
     * @tc.desc    Diet add entry weight 345 probe 344
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep344', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 345);
      expect(entry.weight).assertEqual(345);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 344) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0345
     * @tc.name    DietModelDeep345
     * @tc.desc    Diet food lookup for id 9 probe 345
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep345', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 9;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 345) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0346
     * @tc.name    DietModelDeep346
     * @tc.desc    Diet add entry weight 347 probe 346
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep346', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(10, 2, 347);
      expect(entry.weight).assertEqual(347);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 346) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0347
     * @tc.name    DietModelDeep347
     * @tc.desc    Diet food lookup for id 11 probe 347
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep347', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 11;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 347) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0348
     * @tc.name    DietModelDeep348
     * @tc.desc    Diet add entry weight 349 probe 348
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep348', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(0, 0, 349);
      expect(entry.weight).assertEqual(349);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 348) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0349
     * @tc.name    DietModelDeep349
     * @tc.desc    Diet food lookup for id 1 probe 349
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep349', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 1;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 349) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0350
     * @tc.name    DietModelDeep350
     * @tc.desc    Diet add entry weight 351 probe 350
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep350', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(2, 2, 351);
      expect(entry.weight).assertEqual(351);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 350) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0351
     * @tc.name    DietModelDeep351
     * @tc.desc    Diet food lookup for id 3 probe 351
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep351', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 3;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 351) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0352
     * @tc.name    DietModelDeep352
     * @tc.desc    Diet add entry weight 353 probe 352
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep352', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(4, 0, 353);
      expect(entry.weight).assertEqual(353);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 352) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0353
     * @tc.name    DietModelDeep353
     * @tc.desc    Diet food lookup for id 5 probe 353
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep353', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 5;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 353) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0354
     * @tc.name    DietModelDeep354
     * @tc.desc    Diet add entry weight 355 probe 354
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep354', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(6, 2, 355);
      expect(entry.weight).assertEqual(355);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 354) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0355
     * @tc.name    DietModelDeep355
     * @tc.desc    Diet food lookup for id 7 probe 355
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep355', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const id: number = 7;
      const food = m.getFoodById(id);
      expect(food !== undefined).assertEqual(true);
      expect(food?.id).assertEqual(id);
      expect(m.getFoodById(1000 + 355) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_0356
     * @tc.name    DietModelDeep356
     * @tc.desc    Diet add entry weight 357 probe 356
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietModelDeep356', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const before: number = m.getEntryCount();
      const entry = m.addEntry(8, 0, 357);
      expect(entry.weight).assertEqual(357);
      expect(m.getEntryCount()).assertEqual(before + 1);
      expect(m.getFoodById(1000 + 356) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

