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

import { describe, it, expect } from '@ohos/hypium';
import {
  CategoryId,
  DietRecord,
  MealFoodInfo,
  MealTime,
  MealTimeId,
  OneMealStatisticsInfo
} from '../../../main/ets/model/DataModels';

const DATASET = 'DataModelsTest_';

export default function dataModelsLogicTest() {
  describe('HealthyDietDataModels', () => {
    /**
     * Category enum values are stable
     */
    it(DATASET + 'CategoryId_001', 0, () => {
      expect(CategoryId.Fruit).assertEqual(0);
      expect(CategoryId.Vegetable).assertEqual(1);
      expect(CategoryId.Nut).assertEqual(2);
      expect(CategoryId.Seafood).assertEqual(3);
      expect(CategoryId.Dessert).assertEqual(4);
    })

    /**
     * Meal time enum values are stable
     */
    it(DATASET + 'MealTimeId_001', 0, () => {
      expect(MealTimeId.Breakfast).assertEqual(0);
      expect(MealTimeId.Lunch).assertEqual(1);
      expect(MealTimeId.Dinner).assertEqual(2);
      expect(MealTimeId.Supper).assertEqual(3);
    })

    /**
     * Breakfast MealTime has id and name resource assigned
     */
    it(DATASET + 'MealTime_001', 0, () => {
      const mealTime: MealTime = new MealTime(MealTimeId.Breakfast);
      expect(mealTime.id).assertEqual(MealTimeId.Breakfast);
      expect(typeof mealTime.name).assertEqual('object');
    })

    /**
     * All four meal times can be constructed with matching id
     */
    it(DATASET + 'MealTime_002', 0, () => {
      const ids: Array<MealTimeId> = [
        MealTimeId.Breakfast,
        MealTimeId.Lunch,
        MealTimeId.Dinner,
        MealTimeId.Supper
      ];
      ids.forEach((id: MealTimeId) => {
        const mealTime: MealTime = new MealTime(id);
        expect(mealTime.id).assertEqual(id);
        expect(typeof mealTime.name).assertEqual('object');
      });
    })

    /**
     * DietRecord constructor stores all fields in order
     */
    it(DATASET + 'DietRecord_001', 0, () => {
      const mealTime: MealTime = new MealTime(MealTimeId.Lunch);
      const record: DietRecord = new DietRecord(7, 3, mealTime, 120, 'recordKey');
      expect(record.id).assertEqual(7);
      expect(record.foodId).assertEqual(3);
      expect(record.mealTime.id).assertEqual(MealTimeId.Lunch);
      expect(record.weight).assertEqual(120);
      expect(record.key).assertEqual('recordKey');
    })

    /**
     * OneMealStatisticsInfo starts with zero totals and empty list
     */
    it(DATASET + 'OneMealStatisticsInfo_001', 0, () => {
      const mealTime: MealTime = new MealTime(MealTimeId.Dinner);
      const info: OneMealStatisticsInfo = new OneMealStatisticsInfo(mealTime);
      expect(info.mealTime.id).assertEqual(MealTimeId.Dinner);
      expect(info.mealFoods.length).assertEqual(0);
      expect(info.totalCalories).assertEqual(0);
      expect(info.totalFat).assertEqual(0);
      expect(info.totalCarbohydrates).assertEqual(0);
      expect(info.totalProtein).assertEqual(0);
      expect(info.key).assertEqual('');
    })

    /**
     * OneMealStatisticsInfo totals can be accumulated
     */
    it(DATASET + 'OneMealStatisticsInfo_002', 0, () => {
      const mealTime: MealTime = new MealTime(MealTimeId.Supper);
      const info: OneMealStatisticsInfo = new OneMealStatisticsInfo(mealTime);
      info.totalCalories += 100;
      info.totalCalories += 50.5;
      info.totalFat += 3;
      expect(info.totalCalories).assertEqual(150.5);
      expect(info.totalFat).assertEqual(3);
    })

    /**
     * MealFoodInfo constructor stores all fields in order
     */
    it(DATASET + 'MealFoodInfo_001', 0, () => {
      const mealTime: MealTime = new MealTime(MealTimeId.Breakfast);
      const food: MealFoodInfo = new MealFoodInfo(5, 'foodName', mealTime.name, 88, 1.2, 0.3, 4.5, 150, 'mealKey');
      expect(food.recordId).assertEqual(5);
      expect(food.name).assertEqual('foodName');
      expect(food.calories).assertEqual(88);
      expect(food.protein).assertEqual(1.2);
      expect(food.fat).assertEqual(0.3);
      expect(food.carbohydrates).assertEqual(4.5);
      expect(food.weight).assertEqual(150);
      expect(food.key).assertEqual('mealKey');
    })

    /**
     * MealFoodInfo accepts both string and Resource names
     */
    it(DATASET + 'MealFoodInfo_002', 0, () => {
      const mealTime: MealTime = new MealTime(MealTimeId.Dinner);
      const food: MealFoodInfo = new MealFoodInfo(1, mealTime.name, mealTime.name, 10, 0, 0, 0, 10, 'k');
      expect(typeof food.name).assertEqual('object');
      expect(typeof food.image).assertEqual('object');
    })
  })
}
