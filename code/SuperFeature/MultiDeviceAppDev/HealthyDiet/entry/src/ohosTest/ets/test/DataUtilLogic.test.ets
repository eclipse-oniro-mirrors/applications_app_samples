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
  getFoods,
  getFoodCategories,
  getMileTimes,
  getSortedFoodData,
  getDietRecords,
  statistics,
  updateDietWeight
} from '../../../main/ets/model/DataUtil';
import {
  CategoryId,
  DietRecord,
  FoodInfo,
  MealTime,
  MealTimeId,
  OneMealStatisticsInfo
} from '../../../main/ets/model/DataModels';

const DATASET = 'DataUtilTest_';

function setDietRecords(records: Array<DietRecord>): void {
  AppStorage.SetOrCreate<Array<DietRecord>>('dietRecords', records);
}

function assertNear(actual: number, expected: number): void {
  expect(Math.abs(actual - expected) < 0.000001).assertTrue();
}

function idsOfFoods(foods: Array<FoodInfo>): Array<number> {
  const ids: Array<number> = [];
  foods.forEach((food: FoodInfo) => {
    ids.push(food.id);
  });
  ids.sort((left: number, right: number): number => left - right);
  return ids;
}

export default function dataUtilLogicTest() {
  describe('HealthyDietDataUtil', () => {
    /**
     * Food base data: non-empty, unique ids and valid field types
     */
    it(DATASET + 'getFoods_001', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      expect(foods.length).assertEqual(12);
      const ids: Array<number> = [];
      foods.forEach((food: FoodInfo) => {
        expect(ids.indexOf(food.id)).assertEqual(-1);
        ids.push(food.id);
        expect(typeof food.letter).assertEqual('string');
        expect(typeof food.calories).assertEqual('number');
        expect(typeof food.protein).assertEqual('number');
        expect(typeof food.fat).assertEqual('number');
        expect(typeof food.carbohydrates).assertEqual('number');
        expect(typeof food.vitaminC).assertEqual('number');
        expect(food.letter.length > 0).assertTrue();
      });
    })

    /**
     * First letter of each food is normalized to uppercase
     */
    it(DATASET + 'getFoods_002', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      foods.forEach((food: FoodInfo) => {
        const first: string = food.letter.substring(0, 1);
        expect(first).assertEqual(first.toUpperCase());
        expect(first.charCodeAt(0) >= 65 && first.charCodeAt(0) <= 90).assertTrue();
      });
    })

    /**
     * Food categories are fixed to 5 entries with stable order
     */
    it(DATASET + 'getFoodCategories_001', 0, () => {
      const categories = getFoodCategories();
      expect(categories.length).assertEqual(5);
      expect(categories[0].id).assertEqual(CategoryId.Vegetable);
      expect(categories[1].id).assertEqual(CategoryId.Fruit);
      expect(categories[2].id).assertEqual(CategoryId.Nut);
      expect(categories[3].id).assertEqual(CategoryId.Seafood);
      expect(categories[4].id).assertEqual(CategoryId.Dessert);
    })

    /**
     * All category name resources are defined
     */
    it(DATASET + 'getFoodCategories_002', 0, () => {
      const categories = getFoodCategories();
      categories.forEach((category) => {
        expect(typeof category.name).assertEqual('object');
      });
    })

    /**
     * Meal time labels are fixed to 4 entries with stable order
     */
    it(DATASET + 'getMileTimes_001', 0, () => {
      const times: Array<string> = getMileTimes();
      expect(times.length).assertEqual(4);
      expect(times[0]).assertEqual('早餐');
      expect(times[1]).assertEqual('午餐');
      expect(times[2]).assertEqual('晚餐');
      expect(times[3]).assertEqual('夜宵');
    })

    /**
     * Sorted food count and id set match the source data
     */
    it(DATASET + 'getSortedFoodData_001', 0, () => {
      const sorted: Array<FoodInfo> = getSortedFoodData();
      expect(sorted.length).assertEqual(getFoods().length);
      expect(JSON.stringify(idsOfFoods(sorted))).assertEqual(JSON.stringify(idsOfFoods(getFoods())));
    })

    /**
     * Foods with the same first letter stay in one contiguous group
     */
    it(DATASET + 'getSortedFoodData_002', 0, () => {
      const sorted: Array<FoodInfo> = getSortedFoodData();
      const visited: Array<string> = [];
      let currentLetter = '';
      sorted.forEach((food: FoodInfo) => {
        const letter: string = food.letter.substring(0, 1).toUpperCase();
        if (letter !== currentLetter) {
          expect(visited.indexOf(letter)).assertEqual(-1);
          visited.push(letter);
          currentLetter = letter;
        }
      });
      expect(visited.length > 1).assertTrue();
    })

    /**
     * Statistics is empty when there is no record
     */
    it(DATASET + 'statistics_001', 0, () => {
      setDietRecords([]);
      const result: Array<OneMealStatisticsInfo> = statistics();
      expect(result.length).assertEqual(0);
    })

    /**
     * One record is converted by weight for calories and nutrients
     */
    it(DATASET + 'statistics_002', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      const mealTime: MealTime = new MealTime(MealTimeId.Breakfast);
      setDietRecords([new DietRecord(1, foods[0].id, mealTime, 100, 'key1')]);
      const result: Array<OneMealStatisticsInfo> = statistics();
      expect(result.length).assertEqual(1);
      expect(result[0].mealFoods.length).assertEqual(1);
      assertNear(result[0].totalCalories, foods[0].calories * 100);
      assertNear(result[0].totalProtein, foods[0].protein * 100);
      assertNear(result[0].totalFat, foods[0].fat * 100);
      assertNear(result[0].totalCarbohydrates, foods[0].carbohydrates * 100);
    })

    /**
     * Records with zero weight are excluded from statistics
     */
    it(DATASET + 'statistics_003', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      const mealTime: MealTime = new MealTime(MealTimeId.Lunch);
      setDietRecords([
        new DietRecord(1, foods[0].id, mealTime, 0, 'key1'),
        new DietRecord(2, foods[1].id, mealTime, 50, 'key2')
      ]);
      const result: Array<OneMealStatisticsInfo> = statistics();
      expect(result.length).assertEqual(1);
      expect(result[0].mealFoods.length).assertEqual(1);
      expect(result[0].mealFoods[0].recordId).assertEqual(2);
      assertNear(result[0].totalCalories, foods[1].calories * 50);
    })

    /**
     * Unknown food does not produce calorie or nutrition totals
     */
    it(DATASET + 'statistics_004', 0, () => {
      const mealTime: MealTime = new MealTime(MealTimeId.Dinner);
      setDietRecords([new DietRecord(1, 9999, mealTime, 100, 'key1')]);
      const result: Array<OneMealStatisticsInfo> = statistics();
      let foodCount = 0;
      result.forEach((item: OneMealStatisticsInfo) => {
        foodCount += item.mealFoods.length;
        assertNear(item.totalCalories, 0);
        assertNear(item.totalProtein, 0);
      });
      expect(foodCount).assertEqual(0);
    })

    /**
     * Records are aggregated per meal time
     */
    it(DATASET + 'statistics_005', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      const breakfast: MealTime = new MealTime(MealTimeId.Breakfast);
      const lunch: MealTime = new MealTime(MealTimeId.Lunch);
      setDietRecords([
        new DietRecord(1, foods[0].id, breakfast, 100, 'key1'),
        new DietRecord(2, foods[1].id, breakfast, 50, 'key2'),
        new DietRecord(3, foods[2].id, lunch, 200, 'key3')
      ]);
      const result: Array<OneMealStatisticsInfo> = statistics();
      expect(result.length).assertEqual(2);
      const breakfastStat: OneMealStatisticsInfo = result[0].mealTime.id === MealTimeId.Breakfast ? result[0] : result[1];
      const lunchStat: OneMealStatisticsInfo = result[0].mealTime.id === MealTimeId.Lunch ? result[0] : result[1];
      expect(breakfastStat.mealFoods.length).assertEqual(2);
      assertNear(breakfastStat.totalCalories, foods[0].calories * 100 + foods[1].calories * 50);
      expect(lunchStat.mealFoods.length).assertEqual(1);
      assertNear(lunchStat.totalCalories, foods[2].calories * 200);
    })

    /**
     * Statistics keeps the key of the last record for UI refresh
     */
    it(DATASET + 'statistics_006', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      const mealTime: MealTime = new MealTime(MealTimeId.Supper);
      setDietRecords([
        new DietRecord(1, foods[0].id, mealTime, 100, 'first'),
        new DietRecord(2, foods[1].id, mealTime, 100, 'second')
      ]);
      const result: Array<OneMealStatisticsInfo> = statistics();
      expect(result.length).assertEqual(1);
      expect(result[0].key).assertEqual('second');
    })

    /**
     * Updated weight is persisted and can be read back
     */
    it(DATASET + 'updateDietWeight_001', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      const mealTime: MealTime = new MealTime(MealTimeId.Breakfast);
      setDietRecords([new DietRecord(1, foods[0].id, mealTime, 100, 'key1')]);
      updateDietWeight(1, 250);
      const records: Array<DietRecord> = getDietRecords();
      expect(records.length).assertEqual(1);
      expect(records[0].weight).assertEqual(250);
    })

    /**
     * Calorie statistics changes after weight update
     */
    it(DATASET + 'updateDietWeight_002', 0, () => {
      const foods: Array<FoodInfo> = getFoods();
      const mealTime: MealTime = new MealTime(MealTimeId.Lunch);
      setDietRecords([new DietRecord(1, foods[0].id, mealTime, 100, 'key1')]);
      updateDietWeight(1, 50);
      const result: Array<OneMealStatisticsInfo> = statistics();
      expect(result.length).assertEqual(1);
      assertNear(result[0].totalCalories, foods[0].calories * 50);
    })

    /**
     * Empty array is returned when no global records exist
     */
    it(DATASET + 'getDietRecords_001', 0, () => {
      setDietRecords([]);
      const records: Array<DietRecord> = getDietRecords();
      expect(records.length).assertEqual(0);
    })
  })
}
