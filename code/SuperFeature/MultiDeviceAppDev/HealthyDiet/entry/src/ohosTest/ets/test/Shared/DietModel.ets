
export interface DietFood {
  id: number;
  letter: string;
  name: string;
  categoryId: number;
  calories: number;
  protein: number;
  fat: number;
  carbohydrates: number;
}

export interface DietEntry {
  id: number;
  foodId: number;
  mealTimeId: number;
  weight: number;
}

export interface DietMealStat {
  mealTimeId: number;
  totalCalories: number;
  totalProtein: number;
  totalFat: number;
  totalCarbohydrates: number;
  itemCount: number;
}

export const DIET_CATEGORY_COUNT: number = 5;
export const DIET_MEALTIME_COUNT: number = 4;
export const DIET_CIRCLE_RADIUS: number = 80;

export class DietModel {
  private foods: DietFood[] = [];
  private entries: DietEntry[] = [];

  constructor() {
    const letters = ['A', 'B', 'C', 'D', 'E', 'F'];
    for (let i = 0; i < 12; i++) {
      this.foods.push({
        id: i,
        letter: letters[i % letters.length],
        name: 'food' + String(i),
        categoryId: i % DIET_CATEGORY_COUNT,
        calories: 50 + i * 10,
        protein: 1 + i * 0.5,
        fat: 0.5 + i * 0.2,
        carbohydrates: 5 + i * 2
      });
    }
  }

  public getFoods(): DietFood[] {
    return this.foods;
  }

  public getFoodCount(): number {
    return this.foods.length;
  }

  public getFoodById(id: number): DietFood | undefined {
    for (let i = 0; i < this.foods.length; i++) {
      if (id === this.foods[i].id) {
        return this.foods[i];
      }
    }
    return undefined;
  }

  public addEntry(foodId: number, mealTimeId: number, weight: number): DietEntry {
    const entry: DietEntry = { id: this.entries.length, foodId: foodId, mealTimeId: mealTimeId, weight: weight };
    this.entries.push(entry);
    return entry;
  }

  public getEntries(): DietEntry[] {
    return this.entries;
  }

  public getEntryCount(): number {
    return this.entries.length;
  }

  public clearEntries(): void {
    this.entries = [];
  }

  public statistics(): DietMealStat[] {
    const stats: DietMealStat[] = [];
    for (let meal = 0; meal < DIET_MEALTIME_COUNT; meal++) {
      stats.push({
        mealTimeId: meal,
        totalCalories: 0,
        totalProtein: 0,
        totalFat: 0,
        totalCarbohydrates: 0,
        itemCount: 0
      });
    }
    for (let i = 0; i < this.entries.length; i++) {
      const entry = this.entries[i];
      const food = this.getFoodById(entry.foodId);
      if (food === undefined) {
        continue;
      }
      if (entry.mealTimeId < 0 || entry.mealTimeId >= stats.length) {
        continue;
      }
      const stat = stats[entry.mealTimeId];
      stat.totalCalories += food.calories * entry.weight / 100;
      stat.totalProtein += food.protein * entry.weight / 100;
      stat.totalFat += food.fat * entry.weight / 100;
      stat.totalCarbohydrates += food.carbohydrates * entry.weight / 100;
      stat.itemCount++;
    }
    return stats;
  }

  public groupByLetter(): string[] {
    const buckets = new Map<string, number>();
    for (let i = 0; i < this.foods.length; i++) {
      let letter = this.foods[i].letter.substring(0, 1).toUpperCase();
      if (!/^[A-Z]$/.test(letter)) {
        letter = '#';
      }
      const prev = buckets.get(letter);
      buckets.set(letter, prev === undefined ? 1 : prev + 1);
    }
    const keys: string[] = [];
    buckets.forEach((value: number, key: string) => {
      keys.push(key);
    });
    keys.sort((a: string, b: string) => {
      if (a === '#') {
        return 1;
      }
      if (b === '#') {
        return -1;
      }
      return a.charCodeAt(0) - b.charCodeAt(0);
    });
    return keys;
  }

  public getGroupCount(): number {
    return this.groupByLetter().length;
  }

  public totalCalories(): number {
    const stats = this.statistics();
    let sum = 0;
    for (let i = 0; i < stats.length; i++) {
      sum += stats[i].totalCalories;
    }
    return sum;
  }

  public calorieRatios(): number[] {
    const total = this.totalCalories();
    const stats = this.statistics();
    const ratios: number[] = [];
    for (let i = 0; i < stats.length; i++) {
      ratios.push(total === 0 ? 0 : stats[i].totalCalories / total);
    }
    return ratios;
  }

  public isEmptyStatistics(): boolean {
    const stats = this.statistics();
    for (let i = 0; i < stats.length; i++) {
      if (stats[i].itemCount !== 0 || stats[i].totalCalories !== 0) {
        return false;
      }
    }
    return true;
  }

  public isValidRadius(): boolean {
    return DIET_CIRCLE_RADIUS > 0;
  }

  public countByCategory(categoryId: number): number {
    let count = 0;
    for (let i = 0; i < this.foods.length; i++) {
      if (categoryId === this.foods[i].categoryId) {
        count++;
      }
    }
    return count;
  }

  public isValidWeight(weight: number): boolean {
    return weight > 0;
  }
}
