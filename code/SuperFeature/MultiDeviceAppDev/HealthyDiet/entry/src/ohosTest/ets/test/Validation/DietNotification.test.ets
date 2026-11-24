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

export default function dietNotificationSuite() {
  describe('DietNotificationSuite', () => {
    let m: DietModel = new DietModel();

    beforeEach(() => {
      m = new DietModel();
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1123
     * @tc.name    DietNotification1123
     * @tc.desc    Diet weight validity for 3 probe 1123
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1123', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1123) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1124
     * @tc.name    DietNotification1124
     * @tc.desc    Diet category count for 4 probe 1124
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1124', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1124) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1125
     * @tc.name    DietNotification1125
     * @tc.desc    Diet weight validity for 5 probe 1125
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1125', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1125) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1126
     * @tc.name    DietNotification1126
     * @tc.desc    Diet category count for 1 probe 1126
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1126', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1126) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1127
     * @tc.name    DietNotification1127
     * @tc.desc    Diet weight validity for 7 probe 1127
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1127', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1127) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1128
     * @tc.name    DietNotification1128
     * @tc.desc    Diet category count for 3 probe 1128
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1128', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1128) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1129
     * @tc.name    DietNotification1129
     * @tc.desc    Diet weight validity for -3 probe 1129
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1129', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1129) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1130
     * @tc.name    DietNotification1130
     * @tc.desc    Diet category count for 0 probe 1130
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1130', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1130) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1131
     * @tc.name    DietNotification1131
     * @tc.desc    Diet weight validity for -1 probe 1131
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1131', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1131) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1132
     * @tc.name    DietNotification1132
     * @tc.desc    Diet category count for 2 probe 1132
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1132', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1132) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1133
     * @tc.name    DietNotification1133
     * @tc.desc    Diet weight validity for 1 probe 1133
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1133', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1133) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1134
     * @tc.name    DietNotification1134
     * @tc.desc    Diet category count for 4 probe 1134
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1134', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1134) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1135
     * @tc.name    DietNotification1135
     * @tc.desc    Diet weight validity for 3 probe 1135
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1135', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1135) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1136
     * @tc.name    DietNotification1136
     * @tc.desc    Diet category count for 1 probe 1136
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1136', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1136) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1137
     * @tc.name    DietNotification1137
     * @tc.desc    Diet weight validity for 5 probe 1137
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1137', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1137) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1138
     * @tc.name    DietNotification1138
     * @tc.desc    Diet category count for 3 probe 1138
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1138', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1138) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1139
     * @tc.name    DietNotification1139
     * @tc.desc    Diet weight validity for 7 probe 1139
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1139', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1139) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1140
     * @tc.name    DietNotification1140
     * @tc.desc    Diet category count for 0 probe 1140
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1140', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1140) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1141
     * @tc.name    DietNotification1141
     * @tc.desc    Diet weight validity for -3 probe 1141
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1141', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1141) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1142
     * @tc.name    DietNotification1142
     * @tc.desc    Diet category count for 2 probe 1142
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1142', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1142) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1143
     * @tc.name    DietNotification1143
     * @tc.desc    Diet weight validity for -1 probe 1143
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1143', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1143) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1144
     * @tc.name    DietNotification1144
     * @tc.desc    Diet category count for 4 probe 1144
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1144', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1144) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1145
     * @tc.name    DietNotification1145
     * @tc.desc    Diet weight validity for 1 probe 1145
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1145', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1145) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1146
     * @tc.name    DietNotification1146
     * @tc.desc    Diet category count for 1 probe 1146
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1146', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1146) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1147
     * @tc.name    DietNotification1147
     * @tc.desc    Diet weight validity for 3 probe 1147
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1147', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1147) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1148
     * @tc.name    DietNotification1148
     * @tc.desc    Diet category count for 3 probe 1148
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1148', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1148) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1149
     * @tc.name    DietNotification1149
     * @tc.desc    Diet weight validity for 5 probe 1149
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1149', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1149) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1150
     * @tc.name    DietNotification1150
     * @tc.desc    Diet category count for 0 probe 1150
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1150', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1150) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1151
     * @tc.name    DietNotification1151
     * @tc.desc    Diet weight validity for 7 probe 1151
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1151', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1151) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1152
     * @tc.name    DietNotification1152
     * @tc.desc    Diet category count for 2 probe 1152
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1152', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1152) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1153
     * @tc.name    DietNotification1153
     * @tc.desc    Diet weight validity for -3 probe 1153
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1153', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1153) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1154
     * @tc.name    DietNotification1154
     * @tc.desc    Diet category count for 4 probe 1154
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1154', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1154) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1155
     * @tc.name    DietNotification1155
     * @tc.desc    Diet weight validity for -1 probe 1155
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1155', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1155) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1156
     * @tc.name    DietNotification1156
     * @tc.desc    Diet category count for 1 probe 1156
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1156', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1156) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1157
     * @tc.name    DietNotification1157
     * @tc.desc    Diet weight validity for 1 probe 1157
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1157', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1157) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1158
     * @tc.name    DietNotification1158
     * @tc.desc    Diet category count for 3 probe 1158
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1158', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1158) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1159
     * @tc.name    DietNotification1159
     * @tc.desc    Diet weight validity for 3 probe 1159
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1159', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1159) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1160
     * @tc.name    DietNotification1160
     * @tc.desc    Diet category count for 0 probe 1160
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1160', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1160) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1161
     * @tc.name    DietNotification1161
     * @tc.desc    Diet weight validity for 5 probe 1161
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1161', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1161) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1162
     * @tc.name    DietNotification1162
     * @tc.desc    Diet category count for 2 probe 1162
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1162', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1162) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1163
     * @tc.name    DietNotification1163
     * @tc.desc    Diet weight validity for 7 probe 1163
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1163', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1163) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1164
     * @tc.name    DietNotification1164
     * @tc.desc    Diet category count for 4 probe 1164
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1164', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1164) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1165
     * @tc.name    DietNotification1165
     * @tc.desc    Diet weight validity for -3 probe 1165
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1165', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1165) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1166
     * @tc.name    DietNotification1166
     * @tc.desc    Diet category count for 1 probe 1166
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1166', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1166) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1167
     * @tc.name    DietNotification1167
     * @tc.desc    Diet weight validity for -1 probe 1167
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1167', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1167) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1168
     * @tc.name    DietNotification1168
     * @tc.desc    Diet category count for 3 probe 1168
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1168', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1168) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1169
     * @tc.name    DietNotification1169
     * @tc.desc    Diet weight validity for 1 probe 1169
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1169', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1169) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1170
     * @tc.name    DietNotification1170
     * @tc.desc    Diet category count for 0 probe 1170
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1170', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1170) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1171
     * @tc.name    DietNotification1171
     * @tc.desc    Diet weight validity for 3 probe 1171
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1171', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1171) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1172
     * @tc.name    DietNotification1172
     * @tc.desc    Diet category count for 2 probe 1172
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1172', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1172) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1173
     * @tc.name    DietNotification1173
     * @tc.desc    Diet weight validity for 5 probe 1173
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1173', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1173) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1174
     * @tc.name    DietNotification1174
     * @tc.desc    Diet category count for 4 probe 1174
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1174', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1174) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1175
     * @tc.name    DietNotification1175
     * @tc.desc    Diet weight validity for 7 probe 1175
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1175', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1175) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1176
     * @tc.name    DietNotification1176
     * @tc.desc    Diet category count for 1 probe 1176
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1176', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1176) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1177
     * @tc.name    DietNotification1177
     * @tc.desc    Diet weight validity for -3 probe 1177
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1177', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1177) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1178
     * @tc.name    DietNotification1178
     * @tc.desc    Diet category count for 3 probe 1178
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1178', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1178) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1179
     * @tc.name    DietNotification1179
     * @tc.desc    Diet weight validity for -1 probe 1179
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1179', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1179) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1180
     * @tc.name    DietNotification1180
     * @tc.desc    Diet category count for 0 probe 1180
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1180', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1180) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1181
     * @tc.name    DietNotification1181
     * @tc.desc    Diet weight validity for 1 probe 1181
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1181', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1181) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1182
     * @tc.name    DietNotification1182
     * @tc.desc    Diet category count for 2 probe 1182
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1182', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1182) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1183
     * @tc.name    DietNotification1183
     * @tc.desc    Diet weight validity for 3 probe 1183
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1183', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1183) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1184
     * @tc.name    DietNotification1184
     * @tc.desc    Diet category count for 4 probe 1184
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1184', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1184) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1185
     * @tc.name    DietNotification1185
     * @tc.desc    Diet weight validity for 5 probe 1185
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1185', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1185) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1186
     * @tc.name    DietNotification1186
     * @tc.desc    Diet category count for 1 probe 1186
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1186', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1186) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1187
     * @tc.name    DietNotification1187
     * @tc.desc    Diet weight validity for 7 probe 1187
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1187', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1187) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1188
     * @tc.name    DietNotification1188
     * @tc.desc    Diet category count for 3 probe 1188
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1188', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1188) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1189
     * @tc.name    DietNotification1189
     * @tc.desc    Diet weight validity for -3 probe 1189
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1189', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1189) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1190
     * @tc.name    DietNotification1190
     * @tc.desc    Diet category count for 0 probe 1190
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1190', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1190) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1191
     * @tc.name    DietNotification1191
     * @tc.desc    Diet weight validity for -1 probe 1191
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1191', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1191) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1192
     * @tc.name    DietNotification1192
     * @tc.desc    Diet category count for 2 probe 1192
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1192', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1192) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1193
     * @tc.name    DietNotification1193
     * @tc.desc    Diet weight validity for 1 probe 1193
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1193', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1193) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1194
     * @tc.name    DietNotification1194
     * @tc.desc    Diet category count for 4 probe 1194
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1194', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1194) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1195
     * @tc.name    DietNotification1195
     * @tc.desc    Diet weight validity for 3 probe 1195
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1195', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1195) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1196
     * @tc.name    DietNotification1196
     * @tc.desc    Diet category count for 1 probe 1196
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1196', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1196) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1197
     * @tc.name    DietNotification1197
     * @tc.desc    Diet weight validity for 5 probe 1197
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1197', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1197) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1198
     * @tc.name    DietNotification1198
     * @tc.desc    Diet category count for 3 probe 1198
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1198', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1198) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1199
     * @tc.name    DietNotification1199
     * @tc.desc    Diet weight validity for 7 probe 1199
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1199', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1199) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1200
     * @tc.name    DietNotification1200
     * @tc.desc    Diet category count for 0 probe 1200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1200', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1200) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1201
     * @tc.name    DietNotification1201
     * @tc.desc    Diet weight validity for -3 probe 1201
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1201', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1201) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1202
     * @tc.name    DietNotification1202
     * @tc.desc    Diet category count for 2 probe 1202
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1202', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1202) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1203
     * @tc.name    DietNotification1203
     * @tc.desc    Diet weight validity for -1 probe 1203
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1203', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1203) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1204
     * @tc.name    DietNotification1204
     * @tc.desc    Diet category count for 4 probe 1204
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1204', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1204) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1205
     * @tc.name    DietNotification1205
     * @tc.desc    Diet weight validity for 1 probe 1205
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1205', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1205) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1206
     * @tc.name    DietNotification1206
     * @tc.desc    Diet category count for 1 probe 1206
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1206', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1206) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1207
     * @tc.name    DietNotification1207
     * @tc.desc    Diet weight validity for 3 probe 1207
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1207', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1207) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1208
     * @tc.name    DietNotification1208
     * @tc.desc    Diet category count for 3 probe 1208
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1208', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1208) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1209
     * @tc.name    DietNotification1209
     * @tc.desc    Diet weight validity for 5 probe 1209
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1209', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1209) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1210
     * @tc.name    DietNotification1210
     * @tc.desc    Diet category count for 0 probe 1210
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1210', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1210) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1211
     * @tc.name    DietNotification1211
     * @tc.desc    Diet weight validity for 7 probe 1211
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1211', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1211) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1212
     * @tc.name    DietNotification1212
     * @tc.desc    Diet category count for 2 probe 1212
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1212', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1212) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1213
     * @tc.name    DietNotification1213
     * @tc.desc    Diet weight validity for -3 probe 1213
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1213', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1213) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1214
     * @tc.name    DietNotification1214
     * @tc.desc    Diet category count for 4 probe 1214
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1214', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1214) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1215
     * @tc.name    DietNotification1215
     * @tc.desc    Diet weight validity for -1 probe 1215
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1215', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1215) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1216
     * @tc.name    DietNotification1216
     * @tc.desc    Diet category count for 1 probe 1216
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1216', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1216) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1217
     * @tc.name    DietNotification1217
     * @tc.desc    Diet weight validity for 1 probe 1217
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1217', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1217) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1218
     * @tc.name    DietNotification1218
     * @tc.desc    Diet category count for 3 probe 1218
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1218', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1218) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1219
     * @tc.name    DietNotification1219
     * @tc.desc    Diet weight validity for 3 probe 1219
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1219', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1219) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1220
     * @tc.name    DietNotification1220
     * @tc.desc    Diet category count for 0 probe 1220
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1220', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1220) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1221
     * @tc.name    DietNotification1221
     * @tc.desc    Diet weight validity for 5 probe 1221
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1221', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1221) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1222
     * @tc.name    DietNotification1222
     * @tc.desc    Diet category count for 2 probe 1222
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1222', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1222) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1223
     * @tc.name    DietNotification1223
     * @tc.desc    Diet weight validity for 7 probe 1223
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1223', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1223) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1224
     * @tc.name    DietNotification1224
     * @tc.desc    Diet category count for 4 probe 1224
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1224', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1224) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1225
     * @tc.name    DietNotification1225
     * @tc.desc    Diet weight validity for -3 probe 1225
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1225', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1225) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1226
     * @tc.name    DietNotification1226
     * @tc.desc    Diet category count for 1 probe 1226
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1226', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1226) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1227
     * @tc.name    DietNotification1227
     * @tc.desc    Diet weight validity for -1 probe 1227
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1227', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1227) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1228
     * @tc.name    DietNotification1228
     * @tc.desc    Diet category count for 3 probe 1228
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1228', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1228) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1229
     * @tc.name    DietNotification1229
     * @tc.desc    Diet weight validity for 1 probe 1229
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1229', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1229) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1230
     * @tc.name    DietNotification1230
     * @tc.desc    Diet category count for 0 probe 1230
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1230', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1230) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1231
     * @tc.name    DietNotification1231
     * @tc.desc    Diet weight validity for 3 probe 1231
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1231', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1231) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1232
     * @tc.name    DietNotification1232
     * @tc.desc    Diet category count for 2 probe 1232
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1232', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1232) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1233
     * @tc.name    DietNotification1233
     * @tc.desc    Diet weight validity for 5 probe 1233
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1233', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1233) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1234
     * @tc.name    DietNotification1234
     * @tc.desc    Diet category count for 4 probe 1234
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1234', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1234) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1235
     * @tc.name    DietNotification1235
     * @tc.desc    Diet weight validity for 7 probe 1235
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1235', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1235) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1236
     * @tc.name    DietNotification1236
     * @tc.desc    Diet category count for 1 probe 1236
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1236', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1236) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1237
     * @tc.name    DietNotification1237
     * @tc.desc    Diet weight validity for -3 probe 1237
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1237', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1237) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1238
     * @tc.name    DietNotification1238
     * @tc.desc    Diet category count for 3 probe 1238
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1238', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1238) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1239
     * @tc.name    DietNotification1239
     * @tc.desc    Diet weight validity for -1 probe 1239
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1239', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1239) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1240
     * @tc.name    DietNotification1240
     * @tc.desc    Diet category count for 0 probe 1240
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1240', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1240) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1241
     * @tc.name    DietNotification1241
     * @tc.desc    Diet weight validity for 1 probe 1241
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1241', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1241) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1242
     * @tc.name    DietNotification1242
     * @tc.desc    Diet category count for 2 probe 1242
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1242', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1242) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1243
     * @tc.name    DietNotification1243
     * @tc.desc    Diet weight validity for 3 probe 1243
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1243', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1243) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1244
     * @tc.name    DietNotification1244
     * @tc.desc    Diet category count for 4 probe 1244
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1244', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1244) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1245
     * @tc.name    DietNotification1245
     * @tc.desc    Diet weight validity for 5 probe 1245
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1245', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1245) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1246
     * @tc.name    DietNotification1246
     * @tc.desc    Diet category count for 1 probe 1246
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1246', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1246) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1247
     * @tc.name    DietNotification1247
     * @tc.desc    Diet weight validity for 7 probe 1247
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1247', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1247) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1248
     * @tc.name    DietNotification1248
     * @tc.desc    Diet category count for 3 probe 1248
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1248', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1248) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1249
     * @tc.name    DietNotification1249
     * @tc.desc    Diet weight validity for -3 probe 1249
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1249', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1249) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1250
     * @tc.name    DietNotification1250
     * @tc.desc    Diet category count for 0 probe 1250
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1250', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1250) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1251
     * @tc.name    DietNotification1251
     * @tc.desc    Diet weight validity for -1 probe 1251
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1251', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1251) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1252
     * @tc.name    DietNotification1252
     * @tc.desc    Diet category count for 2 probe 1252
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1252', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1252) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1253
     * @tc.name    DietNotification1253
     * @tc.desc    Diet weight validity for 1 probe 1253
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1253', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1253) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1254
     * @tc.name    DietNotification1254
     * @tc.desc    Diet category count for 4 probe 1254
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1254', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1254) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1255
     * @tc.name    DietNotification1255
     * @tc.desc    Diet weight validity for 3 probe 1255
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1255', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1255) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1256
     * @tc.name    DietNotification1256
     * @tc.desc    Diet category count for 1 probe 1256
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1256', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1256) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1257
     * @tc.name    DietNotification1257
     * @tc.desc    Diet weight validity for 5 probe 1257
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1257', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1257) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1258
     * @tc.name    DietNotification1258
     * @tc.desc    Diet category count for 3 probe 1258
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1258', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1258) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1259
     * @tc.name    DietNotification1259
     * @tc.desc    Diet weight validity for 7 probe 1259
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1259', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1259) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1260
     * @tc.name    DietNotification1260
     * @tc.desc    Diet category count for 0 probe 1260
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1260', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1260) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1261
     * @tc.name    DietNotification1261
     * @tc.desc    Diet weight validity for -3 probe 1261
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1261', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1261) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1262
     * @tc.name    DietNotification1262
     * @tc.desc    Diet category count for 2 probe 1262
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1262', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1262) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1263
     * @tc.name    DietNotification1263
     * @tc.desc    Diet weight validity for -1 probe 1263
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1263', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1263) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1264
     * @tc.name    DietNotification1264
     * @tc.desc    Diet category count for 4 probe 1264
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1264', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1264) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1265
     * @tc.name    DietNotification1265
     * @tc.desc    Diet weight validity for 1 probe 1265
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1265', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1265) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1266
     * @tc.name    DietNotification1266
     * @tc.desc    Diet category count for 1 probe 1266
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1266', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1266) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1267
     * @tc.name    DietNotification1267
     * @tc.desc    Diet weight validity for 3 probe 1267
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1267', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1267) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1268
     * @tc.name    DietNotification1268
     * @tc.desc    Diet category count for 3 probe 1268
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1268', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1268) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1269
     * @tc.name    DietNotification1269
     * @tc.desc    Diet weight validity for 5 probe 1269
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1269', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1269) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1270
     * @tc.name    DietNotification1270
     * @tc.desc    Diet category count for 0 probe 1270
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1270', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1270) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1271
     * @tc.name    DietNotification1271
     * @tc.desc    Diet weight validity for 7 probe 1271
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1271', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1271) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1272
     * @tc.name    DietNotification1272
     * @tc.desc    Diet category count for 2 probe 1272
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1272', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1272) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1273
     * @tc.name    DietNotification1273
     * @tc.desc    Diet weight validity for -3 probe 1273
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1273', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1273) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1274
     * @tc.name    DietNotification1274
     * @tc.desc    Diet category count for 4 probe 1274
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1274', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1274) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1275
     * @tc.name    DietNotification1275
     * @tc.desc    Diet weight validity for -1 probe 1275
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1275', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1275) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1276
     * @tc.name    DietNotification1276
     * @tc.desc    Diet category count for 1 probe 1276
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1276', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1276) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1277
     * @tc.name    DietNotification1277
     * @tc.desc    Diet weight validity for 1 probe 1277
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1277', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1277) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1278
     * @tc.name    DietNotification1278
     * @tc.desc    Diet category count for 3 probe 1278
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1278', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1278) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1279
     * @tc.name    DietNotification1279
     * @tc.desc    Diet weight validity for 3 probe 1279
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1279', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1279) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1280
     * @tc.name    DietNotification1280
     * @tc.desc    Diet category count for 0 probe 1280
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1280', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1280) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1281
     * @tc.name    DietNotification1281
     * @tc.desc    Diet weight validity for 5 probe 1281
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1281', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1281) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1282
     * @tc.name    DietNotification1282
     * @tc.desc    Diet category count for 2 probe 1282
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1282', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1282) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1283
     * @tc.name    DietNotification1283
     * @tc.desc    Diet weight validity for 7 probe 1283
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1283', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1283) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1284
     * @tc.name    DietNotification1284
     * @tc.desc    Diet category count for 4 probe 1284
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1284', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1284) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1285
     * @tc.name    DietNotification1285
     * @tc.desc    Diet weight validity for -3 probe 1285
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1285', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1285) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1286
     * @tc.name    DietNotification1286
     * @tc.desc    Diet category count for 1 probe 1286
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1286', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1286) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1287
     * @tc.name    DietNotification1287
     * @tc.desc    Diet weight validity for -1 probe 1287
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1287', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1287) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1288
     * @tc.name    DietNotification1288
     * @tc.desc    Diet category count for 3 probe 1288
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1288', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1288) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1289
     * @tc.name    DietNotification1289
     * @tc.desc    Diet weight validity for 1 probe 1289
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1289', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1289) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1290
     * @tc.name    DietNotification1290
     * @tc.desc    Diet category count for 0 probe 1290
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1290', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1290) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1291
     * @tc.name    DietNotification1291
     * @tc.desc    Diet weight validity for 3 probe 1291
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1291', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1291) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1292
     * @tc.name    DietNotification1292
     * @tc.desc    Diet category count for 2 probe 1292
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1292', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1292) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1293
     * @tc.name    DietNotification1293
     * @tc.desc    Diet weight validity for 5 probe 1293
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1293', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1293) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1294
     * @tc.name    DietNotification1294
     * @tc.desc    Diet category count for 4 probe 1294
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1294', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1294) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1295
     * @tc.name    DietNotification1295
     * @tc.desc    Diet weight validity for 7 probe 1295
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1295', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1295) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1296
     * @tc.name    DietNotification1296
     * @tc.desc    Diet category count for 1 probe 1296
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1296', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1296) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1297
     * @tc.name    DietNotification1297
     * @tc.desc    Diet weight validity for -3 probe 1297
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1297', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1297) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1298
     * @tc.name    DietNotification1298
     * @tc.desc    Diet category count for 3 probe 1298
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1298', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1298) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1299
     * @tc.name    DietNotification1299
     * @tc.desc    Diet weight validity for -1 probe 1299
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1299', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1299) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1300
     * @tc.name    DietNotification1300
     * @tc.desc    Diet category count for 0 probe 1300
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1300', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1300) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1301
     * @tc.name    DietNotification1301
     * @tc.desc    Diet weight validity for 1 probe 1301
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1301', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1301) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1302
     * @tc.name    DietNotification1302
     * @tc.desc    Diet category count for 2 probe 1302
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1302', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1302) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1303
     * @tc.name    DietNotification1303
     * @tc.desc    Diet weight validity for 3 probe 1303
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1303', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1303) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1304
     * @tc.name    DietNotification1304
     * @tc.desc    Diet category count for 4 probe 1304
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1304', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1304) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1305
     * @tc.name    DietNotification1305
     * @tc.desc    Diet weight validity for 5 probe 1305
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1305', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1305) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1306
     * @tc.name    DietNotification1306
     * @tc.desc    Diet category count for 1 probe 1306
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1306', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1306) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1307
     * @tc.name    DietNotification1307
     * @tc.desc    Diet weight validity for 7 probe 1307
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1307', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1307) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1308
     * @tc.name    DietNotification1308
     * @tc.desc    Diet category count for 3 probe 1308
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1308', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1308) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1309
     * @tc.name    DietNotification1309
     * @tc.desc    Diet weight validity for -3 probe 1309
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1309', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1309) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1310
     * @tc.name    DietNotification1310
     * @tc.desc    Diet category count for 0 probe 1310
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1310', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1310) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1311
     * @tc.name    DietNotification1311
     * @tc.desc    Diet weight validity for -1 probe 1311
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1311', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1311) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1312
     * @tc.name    DietNotification1312
     * @tc.desc    Diet category count for 2 probe 1312
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1312', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1312) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1313
     * @tc.name    DietNotification1313
     * @tc.desc    Diet weight validity for 1 probe 1313
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1313', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1313) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1314
     * @tc.name    DietNotification1314
     * @tc.desc    Diet category count for 4 probe 1314
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1314', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1314) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1315
     * @tc.name    DietNotification1315
     * @tc.desc    Diet weight validity for 3 probe 1315
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1315', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1315) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1316
     * @tc.name    DietNotification1316
     * @tc.desc    Diet category count for 1 probe 1316
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1316', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1316) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1317
     * @tc.name    DietNotification1317
     * @tc.desc    Diet weight validity for 5 probe 1317
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1317', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1317) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1318
     * @tc.name    DietNotification1318
     * @tc.desc    Diet category count for 3 probe 1318
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1318', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1318) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1319
     * @tc.name    DietNotification1319
     * @tc.desc    Diet weight validity for 7 probe 1319
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1319', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 7;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1319) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1320
     * @tc.name    DietNotification1320
     * @tc.desc    Diet category count for 0 probe 1320
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1320', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 0;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1320) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1321
     * @tc.name    DietNotification1321
     * @tc.desc    Diet weight validity for -3 probe 1321
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1321', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1321) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1322
     * @tc.name    DietNotification1322
     * @tc.desc    Diet category count for 2 probe 1322
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1322', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 2;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1322) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1323
     * @tc.name    DietNotification1323
     * @tc.desc    Diet weight validity for -1 probe 1323
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1323', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = -1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1323) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1324
     * @tc.name    DietNotification1324
     * @tc.desc    Diet category count for 4 probe 1324
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1324', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 4;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1324) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1325
     * @tc.name    DietNotification1325
     * @tc.desc    Diet weight validity for 1 probe 1325
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1325', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 1;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1325) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1326
     * @tc.name    DietNotification1326
     * @tc.desc    Diet category count for 1 probe 1326
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1326', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 1;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1326) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1327
     * @tc.name    DietNotification1327
     * @tc.desc    Diet weight validity for 3 probe 1327
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1327', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 3;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1327) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1328
     * @tc.name    DietNotification1328
     * @tc.desc    Diet category count for 3 probe 1328
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1328', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const target: number = 3;
      let expected = 0;
      for (let k = 0; k < m.getFoodCount(); k++) {
        if (m.getFoods()[k].categoryId === target) { expected++; }
      }
      expect(m.countByCategory(target)).assertEqual(expected);
      expect(m.getFoodById(1000 + 1328) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

    /**
     * @tc.number  SUB_MULTIDEVICE_DIET_1329
     * @tc.name    DietNotification1329
     * @tc.desc    Diet weight validity for 5 probe 1329
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level0
     */
    it('DietNotification1329', 0, async () => {
      hilog.info(DOMAIN, TAG, '%{public}s', 'case begin');
      await new Promise<void>((resolve: (value: void | PromiseLike<void>) => void) => { setTimeout(() => resolve(), 10); });
      const weight: number = 5;
      expect(m.isValidWeight(weight)).assertEqual(weight > 0);
      expect(m.getFoodById(1000 + 1329) === undefined).assertEqual(true);
      hilog.info(DOMAIN, TAG, '%{public}s', 'case end');
    });

  });
}

