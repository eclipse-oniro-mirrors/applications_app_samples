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

import { describe, it, expect, beforeAll, afterAll } from '@ohos/hypium';
import { Driver } from '@ohos.UiTest';
import {
  getDriver,
  KEY_BACK,
  pressAndWait,
  waitForHomePageStable,
  homeComponentCount,
  TIMEOUT_PAGE_RENDER,
  DELAY_KEY_NAVIGATION,
  serializedDelay
} from '../Shared/SharedDriver';

// 食物分类枚举：与主工程 CategoryId 保持一致，Fruit 为默认值 0
enum FoodCategory {
  FRUIT = 0, VEGETABLE = 1, NUT = 2, SEAFOOD = 3, DESSERT = 4
}

// 食物项信息模型：封装单个食物条目的图片、焦点图片、焦点状态、名称、分类与营养成分
class FoodItemInfoModel {
  public id: number;
  public letter: string;
  public image: string;
  public onFocusImage: string;
  public isFocus: boolean;
  public categoryId: number;
  public calories: number;
  public protein: number;
  public fat: number;
  public carbohydrates: number;
  public vitaminC: number;

  constructor(id: number, letter: string, image: string, onFocusImage: string, isFocus: boolean, categoryId: number,
    calories: number, protein: number, fat: number, carbohydrates: number, vitaminC: number) {
    this.id = id;
    this.letter = letter;
    this.image = image;
    this.onFocusImage = onFocusImage;
    this.isFocus = isFocus;
    this.categoryId = categoryId;
    this.calories = calories;
    this.protein = protein;
    this.fat = fat;
    this.carbohydrates = carbohydrates;
    this.vitaminC = vitaminC;
  }

  // 工厂方法：以无参方式创建默认（空）食物项，用于边界场景
  public static createDefault(): FoodItemInfoModel {
    return new FoodItemInfoModel(0, '', '', '', false, FoodCategory.FRUIT, 0, 0, 0, 0, 0);
  }

  public getDisplayName(): string {
    return this.letter;
  }

  // 焦点图片选择：聚焦时返回聚焦图片，否则返回普通图片
  public getCurrentImage(): string {
    return this.isFocus ? this.onFocusImage : this.image;
  }

  public setFocusState(isFocused: boolean): void {
    this.isFocus = isFocused;
  }

  public setImage(image: string): void {
    this.image = image;
  }

  public isValidCategory(): boolean {
    return this.categoryId >= FoodCategory.FRUIT && this.categoryId <= FoodCategory.DESSERT;
  }

  // 热量判定：高于给定阈值时视为高热量食物
  public isHighCalorie(threshold: number = 100): boolean {
    return this.calories > threshold;
  }

  // 类型识别：判断当前食物项是否属于蔬菜/坚果/海鲜/甜点分类
  public isVegetable(): boolean {
    return this.categoryId === FoodCategory.VEGETABLE;
  }

  public isFruit(): boolean {
    return this.categoryId === FoodCategory.FRUIT;
  }

  public isNut(): boolean {
    return this.categoryId === FoodCategory.NUT;
  }

  public isSeafood(): boolean {
    return this.categoryId === FoodCategory.SEAFOOD;
  }

  public isDessert(): boolean {
    return this.categoryId === FoodCategory.DESSERT;
  }

  public getCategoryDescription(): string {
    switch (this.categoryId) {
      case FoodCategory.VEGETABLE:
        return 'vegetable';
      case FoodCategory.FRUIT:
        return 'fruit';
      case FoodCategory.NUT:
        return 'nut';
      case FoodCategory.SEAFOOD:
        return 'seafood';
      case FoodCategory.DESSERT:
        return 'dessert';
      default:
        return 'unknown';
    }
  }

  // 营养成分合计：用于校验详情页展示的数据一致性
  public getNutritionTotal(): number {
    return this.protein + this.fat + this.carbohydrates + this.vitaminC;
  }

  public clone(): FoodItemInfoModel {
    return new FoodItemInfoModel(this.id, this.letter, this.image, this.onFocusImage, this.isFocus, this.categoryId,
      this.calories, this.protein, this.fat, this.carbohydrates, this.vitaminC);
  }

  public equals(other: FoodItemInfoModel): boolean {
    return this.id === other.id && this.letter === other.letter && this.image === other.image &&
      this.onFocusImage === other.onFocusImage && this.isFocus === other.isFocus &&
      this.categoryId === other.categoryId && this.calories === other.calories;
  }

  public toString(): string {
    return `FoodItemInfo{letter: ${this.letter}, categoryId: ${this.categoryId}, calories: ${this.calories}}`;
  }
}

// 食物项排序器：按热量排序，保证菜单展示顺序稳定
class FoodItemSorter {
  public static sortByCalories(items: FoodItemInfoModel[]): FoodItemInfoModel[] {
    const copied: FoodItemInfoModel[] = [...items];
    copied.sort((a: FoodItemInfoModel, b: FoodItemInfoModel) => a.calories - b.calories);
    return copied;
  }
}
// 图片主题枚举：描述食物条目的图片风格
enum IconTheme {
  LIGHT = 'light', DARK = 'dark', HIGH_CONTRAST = 'high_contrast'
}

// 食物角色枚举：描述食物项在食谱中的角色分类
enum ItemRole {
  PRIMARY = 'primary', SECONDARY = 'secondary', SPECIAL = 'special'
}

// 食物项描述接口：描述食物项的静态元数据
interface FoodItemDescriptor {
  letter: string;
  categoryId: number;
  role: ItemRole;
  theme: IconTheme;
}

// 排序标准接口：描述食物项排序的键与方向
interface SortCriteria {
  ascending: boolean;
  stable: boolean;
}

// 食物项构建器：以链式方式构建食物项模型
class FoodItemInfoBuilder {
  private id: number = 0;
  private letter: string = '';
  private image: string = '';
  private onFocusImage: string = '';
  private isFocus: boolean = false;
  private categoryId: number = FoodCategory.FRUIT;
  private calories: number = 0;

  public setId(id: number): FoodItemInfoBuilder {
    this.id = id;
    return this;
  }

  public setLetter(letter: string): FoodItemInfoBuilder {
    this.letter = letter;
    return this;
  }

  public setImage(image: string): FoodItemInfoBuilder {
    this.image = image;
    return this;
  }

  public setOnFocusImage(onFocusImage: string): FoodItemInfoBuilder {
    this.onFocusImage = onFocusImage;
    return this;
  }

  public setFocus(isFocus: boolean): FoodItemInfoBuilder {
    this.isFocus = isFocus;
    return this;
  }

  public setCategoryId(categoryId: number): FoodItemInfoBuilder {
    this.categoryId = categoryId;
    return this;
  }

  public setCalories(calories: number): FoodItemInfoBuilder {
    this.calories = calories;
    return this;
  }

  public build(): FoodItemInfoModel {
    return new FoodItemInfoModel(this.id, this.letter, this.image, this.onFocusImage, this.isFocus, this.categoryId,
      this.calories, 0, 0, 0, 0);
  }
}

// 食物项校验器：校验食物项字段的合法性
class FoodItemValidator {
  public static hasValidImage(item: FoodItemInfoModel): boolean {
    return item.image.length > 0;
  }

  public static hasValidLetter(item: FoodItemInfoModel): boolean {
    return item.letter.length > 0;
  }

  public static hasFocusImage(item: FoodItemInfoModel): boolean {
    return item.onFocusImage.length > 0;
  }

  public static hasValidCalories(item: FoodItemInfoModel): boolean {
    return item.calories >= 0;
  }

  public static isComplete(item: FoodItemInfoModel): boolean {
    return FoodItemValidator.hasValidImage(item) && FoodItemValidator.hasFocusImage(item) &&
      FoodItemValidator.hasValidLetter(item) && item.isValidCategory();
  }

  public static isDefault(item: FoodItemInfoModel): boolean {
    return item.id === 0 && item.letter.length === 0 && item.image.length === 0 && item.calories === 0 &&
      item.categoryId === FoodCategory.FRUIT;
  }
}

// 食物项比较器：按名称长度、热量与焦点比较食物项
class FoodItemComparator {
  public static compareByLetterLength(a: FoodItemInfoModel, b: FoodItemInfoModel): number {
    return a.letter.length - b.letter.length;
  }

  public static compareByCalories(a: FoodItemInfoModel, b: FoodItemInfoModel): number {
    return a.calories - b.calories;
  }

  public static compareByFocus(a: FoodItemInfoModel, b: FoodItemInfoModel): number {
    if (a.isFocus === b.isFocus) {
      return 0;
    }
    return a.isFocus ? -1 : 1;
  }
}

// 食物项集合：管理一组食物项并支持批量操作
class FoodItemCollection {
  private items: FoodItemInfoModel[] = [];

  public add(item: FoodItemInfoModel): void {
    this.items.push(item);
  }

  public addAll(items: FoodItemInfoModel[]): void {
    this.items.push(...items);
  }

  public getItems(): FoodItemInfoModel[] {
    return [...this.items];
  }

  public getCount(): number {
    return this.items.length;
  }

  public getByCategory(categoryId: number): FoodItemInfoModel[] {
    return this.items.filter((item: FoodItemInfoModel) => item.categoryId === categoryId);
  }

  public getByLetter(letter: string): FoodItemInfoModel | null {
    const found: FoodItemInfoModel[] = this.items.filter((item: FoodItemInfoModel) => item.letter === letter);
    if (found.length === 0) {
      return null;
    }
    return found[0];
  }

  public getFocusedItem(): FoodItemInfoModel | null {
    const focused: FoodItemInfoModel[] = this.items.filter((item: FoodItemInfoModel) => item.isFocus);
    if (focused.length === 0) {
      return null;
    }
    return focused[0];
  }

  public getTotalCalories(): number {
    let total: number = 0;
    this.items.forEach((item: FoodItemInfoModel) => {
      total += item.calories;
    });
    return total;
  }

  public clear(): void {
    this.items = [];
  }
}

// 食物项统计：统计食物项集合的分类与热量分布
class FoodItemStatistics {
  private items: FoodItemInfoModel[] = [];

  public collect(items: FoodItemInfoModel[]): void {
    this.items.push(...items);
  }

  public getTotalCount(): number {
    return this.items.length;
  }

  public getVegetableCount(): number {
    return this.items.filter((item: FoodItemInfoModel) => item.isVegetable()).length;
  }

  public getFruitCount(): number {
    return this.items.filter((item: FoodItemInfoModel) => item.isFruit()).length;
  }

  public getNutCount(): number {
    return this.items.filter((item: FoodItemInfoModel) => item.isNut()).length;
  }

  public getSeafoodCount(): number {
    return this.items.filter((item: FoodItemInfoModel) => item.isSeafood()).length;
  }

  public getDessertCount(): number {
    return this.items.filter((item: FoodItemInfoModel) => item.isDessert()).length;
  }

  public getFocusedCount(): number {
    return this.items.filter((item: FoodItemInfoModel) => item.isFocus).length;
  }

  public getHighCalorieCount(threshold: number = 100): number {
    return this.items.filter((item: FoodItemInfoModel) => item.isHighCalorie(threshold)).length;
  }

  public getAverageCalories(): number {
    if (this.items.length === 0) {
      return 0;
    }
    let total: number = 0;
    this.items.forEach((item: FoodItemInfoModel) => {
      total += item.calories;
    });
    return total / this.items.length;
  }

  public clear(): void {
    this.items = [];
  }
}
// 食物项描述工厂：根据分类生成标准描述元数据
class FoodItemDescriptorFactory {
  public static create(letter: string, categoryId: number, theme: IconTheme): FoodItemDescriptor {
    let role: ItemRole = ItemRole.SECONDARY;
    if (categoryId === FoodCategory.DESSERT) {
      role = ItemRole.SPECIAL;
    } else if (categoryId === FoodCategory.VEGETABLE || categoryId === FoodCategory.FRUIT) {
      role = ItemRole.PRIMARY;
    }
    const descriptor: FoodItemDescriptor = {
      letter: letter,
      categoryId: categoryId,
      role: role,
      theme: theme
    };
    return descriptor;
  }

  public static getRoleName(role: ItemRole): string {
    switch (role) {
      case ItemRole.PRIMARY:
        return 'main dish';
      case ItemRole.SECONDARY:
        return 'side dish';
      case ItemRole.SPECIAL:
        return 'special dish';
      default:
        return 'unknown role';
    }
  }

  public static getThemeName(theme: IconTheme): string {
    switch (theme) {
      case IconTheme.LIGHT:
        return 'light theme';
      case IconTheme.DARK:
        return 'dark theme';
      case IconTheme.HIGH_CONTRAST:
        return 'high contrast theme';
      default:
        return 'unknown theme';
    }
  }
}

// 食物项工厂：批量创建标准食物项集合，数据取自主工程 MokeData
class FoodItemInfoFactory {
  public static createTomato(): FoodItemInfoModel {
    return new FoodItemInfoModel(0, 'Tomato', 'app.media.tomato', 'app.media.tomato_focus', false,
      FoodCategory.VEGETABLE, 15, 0.9, 0.2, 3.3, 14.0);
  }

  public static createCucumber(): FoodItemInfoModel {
    return new FoodItemInfoModel(1, 'Cucumber', 'app.media.cucumber', 'app.media.cucumber_focus', false,
      FoodCategory.VEGETABLE, 16, 0.8, 0.2, 2.9, 9.0);
  }

  public static createWalnut(): FoodItemInfoModel {
    return new FoodItemInfoModel(0, 'Walnut', 'app.media.walnut', 'app.media.walnut_focus', false,
      FoodCategory.NUT, 646, 14.9, 58.8, 19.1, 1.0);
  }

  public static createBlueberry(): FoodItemInfoModel {
    return new FoodItemInfoModel(1, 'Blueberry', 'app.media.blueberry', 'app.media.blueberry_focus', false,
      FoodCategory.FRUIT, 57, 0.7, 0.3, 14.5, 9.7);
  }

  public static createIceCream(): FoodItemInfoModel {
    return new FoodItemInfoModel(0, 'IceCream', 'app.media.icecream', 'app.media.icecream_focus', false,
      FoodCategory.DESSERT, 150, 3.5, 11, 24, 0.6);
  }

  public static createCrab(): FoodItemInfoModel {
    return new FoodItemInfoModel(1, 'Crab', 'app.media.crab', 'app.media.crab_focus', true,
      FoodCategory.SEAFOOD, 97, 19, 1.5, 0, 7.6);
  }

  // 标准集：一份蔬菜、一份坚果、一份甜点，覆盖三种展示形态
  public static createStandardSet(): FoodItemInfoModel[] {
    const items: FoodItemInfoModel[] = [];
    items.push(FoodItemInfoFactory.createTomato());
    items.push(FoodItemInfoFactory.createWalnut());
    items.push(FoodItemInfoFactory.createIceCream());
    return items;
  }

  public static createCount(count: number): FoodItemInfoModel[] {
    const items: FoodItemInfoModel[] = [];
    for (let i = 0; i < count; i++) {
      items.push(new FoodItemInfoModel(i, 'Food' + i, 'image' + i, 'image_focus' + i, false, i % 5, i * 10, 0, 0, 0, 0));
    }
    return items;
  }
}

// 食物项字段提取器：从食物项集合提取指定字段
class FoodItemFieldExtractor {
  public static extractLetters(items: FoodItemInfoModel[]): string[] {
    const letters: string[] = [];
    items.forEach((item: FoodItemInfoModel) => {
      letters.push(item.letter);
    });
    return letters;
  }

  public static extractImages(items: FoodItemInfoModel[]): string[] {
    const images: string[] = [];
    items.forEach((item: FoodItemInfoModel) => {
      images.push(item.image);
    });
    return images;
  }

  public static extractCategoryIds(items: FoodItemInfoModel[]): number[] {
    const categoryIds: number[] = [];
    items.forEach((item: FoodItemInfoModel) => {
      categoryIds.push(item.categoryId);
    });
    return categoryIds;
  }

  public static extractCalories(items: FoodItemInfoModel[]): number[] {
    const calories: number[] = [];
    items.forEach((item: FoodItemInfoModel) => {
      calories.push(item.calories);
    });
    return calories;
  }

  public static extractFocused(items: FoodItemInfoModel[]): FoodItemInfoModel[] {
    return items.filter((item: FoodItemInfoModel) => item.isFocus);
  }
}

// 食物项排序管理器：支持多种排序策略
class FoodItemSortManager {
  private items: FoodItemInfoModel[] = [];

  public setItems(items: FoodItemInfoModel[]): void {
    this.items = [...items];
  }

  public sortByCalories(): FoodItemInfoModel[] {
    const copied: FoodItemInfoModel[] = [...this.items];
    copied.sort((a: FoodItemInfoModel, b: FoodItemInfoModel) => a.calories - b.calories);
    return copied;
  }

  public sortByLetterLength(): FoodItemInfoModel[] {
    const copied: FoodItemInfoModel[] = [...this.items];
    copied.sort((a: FoodItemInfoModel, b: FoodItemInfoModel) => a.letter.length - b.letter.length);
    return copied;
  }

  public sortByCategoryId(): FoodItemInfoModel[] {
    const copied: FoodItemInfoModel[] = [...this.items];
    copied.sort((a: FoodItemInfoModel, b: FoodItemInfoModel) => a.categoryId - b.categoryId);
    return copied;
  }

  public getItemCount(): number {
    return this.items.length;
  }

  public clear(): void {
    this.items = [];
  }
}

export default function foodItemModelTest() {
  describe('FoodItemModel_Test', () => {
    let driver: Driver;

    // 测试前置：初始化驱动并等待主页渲染，确保测试环境干净
    beforeAll(async () => {
      driver = getDriver();
      await serializedDelay(driver, 1000);
    });

    // 测试清理：退回主页并释放资源
    afterAll(async () => {
      await pressAndWait(driver, KEY_BACK, 2, DELAY_KEY_NAVIGATION);
      await serializedDelay(driver, 500);
    });

    // 适配 FoodInfo_Construction：默认构造创建空食物项
    it('default_constructor_should_create_empty_item', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoModel.createDefault();
      expect(item.id).assertEqual(0);
      expect(item.letter).assertEqual('');
      expect(item.image).assertEqual('');
      expect(item.isFocus).assertFalse();
      expect(item.categoryId).assertEqual(FoodCategory.FRUIT);
      expect(item.calories).assertEqual(0);
    });

    // 适配 FoodInfo_Construction：带参构造正确提取字段
    it('constructor_with_params_should_extract_fields_correctly', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoModel(1, 'Crab', 'app.media.crab', 'app.media.crab_focus', true,
        FoodCategory.SEAFOOD, 97, 19, 1.5, 0, 7.6);
      expect(item.id).assertEqual(1);
      expect(item.letter).assertEqual('Crab');
      expect(item.image).assertEqual('app.media.crab');
      expect(item.onFocusImage).assertEqual('app.media.crab_focus');
      expect(item.isFocus).assertTrue();
      expect(item.categoryId).assertEqual(FoodCategory.SEAFOOD);
      expect(item.calories).assertEqual(97);
    });

    // 适配 FoodInfo_Construction_Boundary：空名称与空图片
    it('empty_letter_and_image_should_be_handled', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoModel(0, '', '', '', false, FoodCategory.VEGETABLE, 0, 0, 0, 0, 0);
      expect(item.getDisplayName()).assertEqual('');
      expect(item.getCurrentImage()).assertEqual('');
      expect(item.isValidCategory()).assertTrue();
    });

    // 适配 FoodInfo_Construction_Boundary：超长名称
    it('very_long_letter_should_be_handled', 0, async () => {
      const longName: string = 'a'.repeat(1000);
      const item: FoodItemInfoModel = new FoodItemInfoModel(0, longName, 'app.media.tomato', 'focus', false,
        FoodCategory.VEGETABLE, 15, 0, 0, 0, 0);
      expect(item.getDisplayName().length).assertEqual(1000);
    });

    // 适配 FoodInfo_Construction_Boundary：特殊字符名称
    it('special_characters_letter_should_be_handled', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoModel(0, 'IceCream*()', 'image!@#', 'focus$%^', false,
        FoodCategory.DESSERT, 150, 0, 0, 0, 0);
      expect(item.getDisplayName()).assertEqual('IceCream*()');
      expect(item.getCurrentImage()).assertEqual('image!@#');
    });

    // 适配 FoodInfo_Type_Detection：isVegetable 识别
    it('is_vegetable_should_return_true_for_vegetable_category', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      expect(item.isVegetable()).assertTrue();
      expect(item.isNut()).assertFalse();
      expect(item.isDessert()).assertFalse();
    });

    // 适配 FoodInfo_Type_Detection：isNut 识别
    it('is_nut_should_return_true_for_nut_category', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createWalnut();
      expect(item.isNut()).assertTrue();
      expect(item.isVegetable()).assertFalse();
    });

    // 适配 FoodInfo_Type_Detection：isSeafood 识别
    it('is_seafood_should_return_true_for_seafood_category', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createCrab();
      expect(item.isSeafood()).assertTrue();
      expect(item.isDessert()).assertFalse();
    });

    // 适配 FoodInfo_Type_Detection：非法分类不属于任何有效分类
    it('invalid_category_should_not_match_any_known_category', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoModel(0, 'Unknown', 'image', 'focus', false, -1, 0, 0, 0, 0, 0);
      expect(item.isVegetable()).assertFalse();
      expect(item.isFruit()).assertFalse();
      expect(item.isNut()).assertFalse();
      expect(item.isSeafood()).assertFalse();
      expect(item.isDessert()).assertFalse();
      expect(item.isValidCategory()).assertFalse();
    });

    // 适配 FoodInfo_Type_Detection：默认 isFocus 为 false
    it('is_focus_should_be_false_by_default', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createBlueberry();
      expect(item.isFocus).assertFalse();
    });

    // 适配 FoodInfo_Type_Detection：setFocusState 后 isFocus 为 true
    it('is_focus_should_be_true_after_set_focus_state', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createBlueberry();
      item.setFocusState(true);
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentImage()).assertEqual('app.media.blueberry_focus');
    });

    // 适配 FoodInfo_Image_Dimensions：图片默认值
    it('image_should_default_to_empty', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoModel.createDefault();
      expect(item.image).assertEqual('');
      expect(item.onFocusImage).assertEqual('');
    });

    // 适配 FoodInfo_Image_Dimensions：setImage 更新图片
    it('set_image_should_update_image_value', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      item.setImage('app.media.cucumber');
      expect(item.image).assertEqual('app.media.cucumber');
      expect(item.getCurrentImage()).assertEqual('app.media.cucumber');
    });

    // 适配 FoodInfo_Path_Operations：getCurrentImage 反映焦点切换
    it('get_current_image_should_reflect_focus_state', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createWalnut();
      expect(item.getCurrentImage()).assertEqual('app.media.walnut');
      item.setFocusState(true);
      expect(item.getCurrentImage()).assertEqual('app.media.walnut_focus');
    });

    // 适配 FoodInfo_toString：toString 包含关键字段
    it('to_string_should_contain_key_fields', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createWalnut();
      const str: string = item.toString();
      expect(str.includes('Walnut')).assertTrue();
      expect(str.includes('646')).assertTrue();
      expect(str.includes('categoryId')).assertTrue();
    });

    // 适配 FoodInfo_Immutability：名称与分类不可变
    it('letter_and_category_should_be_immutable', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createIceCream();
      const letterBefore: string = item.letter;
      const categoryBefore: number = item.categoryId;
      item.setFocusState(true);
      item.setImage('changed');
      expect(item.letter).assertEqual(letterBefore);
      expect(item.categoryId).assertEqual(categoryBefore);
    });
    // 适配 FoodInfo_Integration_Scenarios：番茄项链路正确
    it('tomato_item_integration_chain_should_be_correct', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      expect(item.isVegetable()).assertTrue();
      expect(item.getCurrentImage()).assertEqual('app.media.tomato');
      expect(item.getCategoryDescription()).assertEqual('vegetable');
      expect(item.getDisplayName()).assertEqual('Tomato');
    });

    // 适配 FoodInfo_Integration_Scenarios：核桃项链路正确
    it('walnut_item_integration_chain_should_be_correct', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoFactory.createWalnut();
      expect(item.isNut()).assertTrue();
      expect(item.calories).assertEqual(646);
      expect(item.isHighCalorie()).assertTrue();
      expect(item.getCategoryDescription()).assertEqual('nut');
    });

    // 适配 FoodInfo_Edge_Regression：空字符串名称不崩溃
    it('empty_letter_should_not_crash', 0, async () => {
      const item: FoodItemInfoModel = FoodItemInfoModel.createDefault();
      expect(item.getDisplayName()).assertEqual('');
      expect(item.toString().includes('letter')).assertTrue();
    });

    // 适配 FoodInfo_Sorting：按热量升序排序
    it('items_should_sort_by_calories', 0, async () => {
      const walnut: FoodItemInfoModel = FoodItemInfoFactory.createWalnut();
      const iceCream: FoodItemInfoModel = FoodItemInfoFactory.createIceCream();
      const tomato: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      const sorted: FoodItemInfoModel[] = FoodItemSorter.sortByCalories([walnut, iceCream, tomato]);
      expect(sorted[0].letter).assertEqual('Tomato');
      expect(sorted[1].letter).assertEqual('IceCream');
      expect(sorted[2].letter).assertEqual('Walnut');
    });

    // 适配 FoodInfo_Sorting：排序不修改原数组
    it('sorting_should_not_mutate_source_array', 0, async () => {
      const criteria: SortCriteria = { ascending: true, stable: true };
      expect(criteria.ascending).assertTrue();
      expect(criteria.stable).assertTrue();
      const source: FoodItemInfoModel[] = FoodItemInfoFactory.createStandardSet();
      FoodItemSorter.sortByCalories(source);
      expect(source[0].letter).assertEqual('Tomato');
      expect(source[1].letter).assertEqual('Walnut');
      expect(source[2].letter).assertEqual('IceCream');
    });

    // 适配 FoodInfo_Edge_Regression：克隆独立副本
    it('clone_should_create_independent_copy', 0, async () => {
      const original: FoodItemInfoModel = FoodItemInfoFactory.createCrab();
      const cloned: FoodItemInfoModel = original.clone();
      expect(original.equals(cloned)).assertTrue();
      cloned.setFocusState(false);
      expect(original.isFocus).assertTrue();
      expect(cloned.isFocus).assertFalse();
    });

    // 适配 FoodItemBuilder_Chain：构建器链式设置名称
    it('builder_should_set_letter_via_chain', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoBuilder().setLetter('Blueberry').build();
      expect(item.letter).assertEqual('Blueberry');
      expect(item.getDisplayName()).assertEqual('Blueberry');
    });

    // 适配 FoodItemBuilder_Chain：构建器链式设置图片
    it('builder_should_set_image_via_chain', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoBuilder().setImage('app.media.blueberry').build();
      expect(item.image).assertEqual('app.media.blueberry');
    });

    // 适配 FoodItemBuilder_Chain：构建器链式设置焦点图片
    it('builder_should_set_focus_image_via_chain', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoBuilder().setOnFocusImage('app.media.blueberry_focus').build();
      expect(item.onFocusImage).assertEqual('app.media.blueberry_focus');
    });

    // 适配 FoodItemBuilder_Chain：构建器链式设置热量
    it('builder_should_set_calories_via_chain', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoBuilder().setCalories(57).build();
      expect(item.calories).assertEqual(57);
      expect(item.isHighCalorie()).assertFalse();
    });

    // 适配 FoodItemBuilder_Chain：构建器链式设置分类
    it('builder_should_set_category_via_chain', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoBuilder().setCategoryId(FoodCategory.NUT).build();
      expect(item.categoryId).assertEqual(FoodCategory.NUT);
      expect(item.isNut()).assertTrue();
    });

    // 适配 FoodItemBuilder_Chain：构建器链式设置焦点状态
    it('builder_should_set_focus_state_via_chain', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoBuilder().setFocus(true).build();
      expect(item.isFocus).assertTrue();
      expect(item.getCurrentImage()).assertEqual('');
    });

    // 适配 FoodItemBuilder_Default：构建器默认值为空字段
    it('builder_should_produce_default_when_no_setter', 0, async () => {
      const item: FoodItemInfoModel = new FoodItemInfoBuilder().build();
      expect(item.id).assertEqual(0);
      expect(item.letter).assertEqual('');
      expect(item.image).assertEqual('');
      expect(item.isFocus).assertFalse();
      expect(item.categoryId).assertEqual(FoodCategory.FRUIT);
      expect(item.calories).assertEqual(0);
    });
    // 适配 FoodItemValidator：图片有效性校验
    it('validator_should_validate_image', 0, async () => {
      const valid: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      const invalid: FoodItemInfoModel = FoodItemInfoModel.createDefault();
      expect(FoodItemValidator.hasValidImage(valid)).assertTrue();
      expect(FoodItemValidator.hasValidImage(invalid)).assertFalse();
    });

    // 适配 FoodItemValidator：名称有效性校验
    it('validator_should_validate_letter', 0, async () => {
      const valid: FoodItemInfoModel = FoodItemInfoFactory.createCucumber();
      expect(FoodItemValidator.hasValidLetter(valid)).assertTrue();
      expect(FoodItemValidator.hasValidLetter(FoodItemInfoModel.createDefault())).assertFalse();
    });

    // 适配 FoodItemValidator：焦点图片有效性校验
    it('validator_should_validate_focus_image', 0, async () => {
      const valid: FoodItemInfoModel = FoodItemInfoFactory.createCucumber();
      expect(FoodItemValidator.hasFocusImage(valid)).assertTrue();
      expect(FoodItemValidator.hasFocusImage(FoodItemInfoModel.createDefault())).assertFalse();
    });

    // 适配 FoodItemValidator：热量有效性校验
    it('validator_should_validate_calories', 0, async () => {
      const valid: FoodItemInfoModel = FoodItemInfoFactory.createIceCream();
      const invalid: FoodItemInfoModel = new FoodItemInfoModel(0, 'Bad', 'image', 'focus', false,
        FoodCategory.DESSERT, -1, 0, 0, 0, 0);
      expect(FoodItemValidator.hasValidCalories(valid)).assertTrue();
      expect(FoodItemValidator.hasValidCalories(invalid)).assertFalse();
    });

    // 适配 FoodItemValidator：完整食物项校验
    it('validator_should_confirm_complete_item', 0, async () => {
      const valid: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      expect(FoodItemValidator.isComplete(valid)).assertTrue();
      expect(FoodItemValidator.isComplete(FoodItemInfoModel.createDefault())).assertFalse();
    });

    // 适配 FoodItemValidator：默认项识别
    it('validator_should_identify_default_item', 0, async () => {
      const defaultItem: FoodItemInfoModel = FoodItemInfoModel.createDefault();
      const normal: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      expect(FoodItemValidator.isDefault(defaultItem)).assertTrue();
      expect(FoodItemValidator.isDefault(normal)).assertFalse();
    });

    // 适配 FoodItemValidator：非法分类导致不完整
    it('validator_should_reject_invalid_category', 0, async () => {
      const invalid: FoodItemInfoModel = new FoodItemInfoModel(0, 'Bad', 'image', 'focus', false, 99, 10, 0, 0, 0, 0);
      expect(FoodItemValidator.isComplete(invalid)).assertFalse();
    });

    // 适配 FoodItemComparator：按名称长度比较
    it('comparator_should_compare_by_letter_length', 0, async () => {
      const short: FoodItemInfoModel = FoodItemInfoFactory.createCrab();
      const long: FoodItemInfoModel = FoodItemInfoFactory.createBlueberry();
      expect(FoodItemComparator.compareByLetterLength(short, long)).assertLessOrEqual(-1);
      expect(FoodItemComparator.compareByLetterLength(long, short)).assertLargerOrEqual(1);
    });

    // 适配 FoodItemComparator：按热量比较
    it('comparator_should_compare_by_calories', 0, async () => {
      const tomato: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      const walnut: FoodItemInfoModel = FoodItemInfoFactory.createWalnut();
      expect(FoodItemComparator.compareByCalories(tomato, walnut)).assertLessOrEqual(-1);
      expect(FoodItemComparator.compareByCalories(walnut, tomato)).assertLargerOrEqual(1);
    });

    // 适配 FoodItemComparator：按焦点状态比较
    it('comparator_should_compare_by_focus', 0, async () => {
      const focused: FoodItemInfoModel = FoodItemInfoFactory.createCrab();
      const unfocused: FoodItemInfoModel = FoodItemInfoFactory.createTomato();
      expect(FoodItemComparator.compareByFocus(focused, unfocused)).assertEqual(-1);
      expect(FoodItemComparator.compareByFocus(unfocused, focused)).assertEqual(1);
      expect(FoodItemComparator.compareByFocus(focused, focused)).assertEqual(0);
    });

    // 适配 FoodItemCollection：添加与数量统计
    it('collection_should_add_and_count_items', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.add(FoodItemInfoFactory.createTomato());
      collection.add(FoodItemInfoFactory.createWalnut());
      expect(collection.getCount()).assertEqual(2);
    });

    // 适配 FoodItemCollection：批量添加
    it('collection_should_add_all_items', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.addAll(FoodItemInfoFactory.createStandardSet());
      expect(collection.getCount()).assertEqual(3);
    });

    // 适配 FoodItemCollection：按分类筛选
    it('collection_should_filter_by_category', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.addAll(FoodItemInfoFactory.createStandardSet());
      const nuts: FoodItemInfoModel[] = collection.getByCategory(FoodCategory.NUT);
      expect(nuts.length).assertEqual(1);
      expect(nuts[0].letter).assertEqual('Walnut');
    });

    // 适配 FoodItemCollection：按名称查找
    it('collection_should_find_item_by_letter', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.addAll(FoodItemInfoFactory.createStandardSet());
      const found: FoodItemInfoModel | null = collection.getByLetter('IceCream');
      expect(found === null).assertFalse();
      expect(found?.calories).assertEqual(150);
      expect(collection.getByLetter('Onion') === null).assertTrue();
    });

    // 适配 FoodItemCollection：获取焦点项
    it('collection_should_return_focused_item', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.addAll(FoodItemInfoFactory.createStandardSet());
      collection.add(FoodItemInfoFactory.createCrab());
      const focused: FoodItemInfoModel | null = collection.getFocusedItem();
      expect(focused === null).assertFalse();
      expect(focused?.letter).assertEqual('Crab');
    });

    // 适配 FoodItemCollection：无焦点项返回 null
    it('collection_should_return_null_without_focused_item', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.add(FoodItemInfoFactory.createTomato());
      collection.add(FoodItemInfoFactory.createWalnut());
      expect(collection.getFocusedItem() === null).assertTrue();
    });

    // 适配 FoodItemCollection：热量合计
    it('collection_should_sum_calories', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.add(FoodItemInfoFactory.createTomato());
      collection.add(FoodItemInfoFactory.createCucumber());
      expect(collection.getTotalCalories()).assertEqual(31);
    });

    // 适配 FoodItemCollection：清空后计数为零
    it('collection_should_reset_after_clear', 0, async () => {
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.addAll(FoodItemInfoFactory.createStandardSet());
      collection.clear();
      expect(collection.getCount()).assertEqual(0);
      expect(collection.getItems().length).assertEqual(0);
    });
    // 适配 FoodItemStatistics：分类分布统计
    it('statistics_should_count_category_distribution', 0, async () => {
      const stats: FoodItemStatistics = new FoodItemStatistics();
      stats.collect(FoodItemInfoFactory.createStandardSet());
      expect(stats.getVegetableCount()).assertEqual(1);
      expect(stats.getNutCount()).assertEqual(1);
      expect(stats.getDessertCount()).assertEqual(1);
      expect(stats.getFruitCount()).assertEqual(0);
    });

    // 适配 FoodItemStatistics：焦点项统计
    it('statistics_should_count_focused_items', 0, async () => {
      const stats: FoodItemStatistics = new FoodItemStatistics();
      stats.collect(FoodItemInfoFactory.createStandardSet());
      stats.collect([FoodItemInfoFactory.createCrab()]);
      expect(stats.getFocusedCount()).assertEqual(1);
    });

    // 适配 FoodItemStatistics：高热量统计
    it('statistics_should_count_high_calorie_items', 0, async () => {
      const stats: FoodItemStatistics = new FoodItemStatistics();
      stats.collect([FoodItemInfoFactory.createTomato(), FoodItemInfoFactory.createWalnut(),
        FoodItemInfoFactory.createBlueberry(), FoodItemInfoFactory.createIceCream()]);
      expect(stats.getHighCalorieCount()).assertEqual(2);
      expect(stats.getHighCalorieCount(600)).assertEqual(1);
    });

    // 适配 FoodItemStatistics：平均热量计算
    it('statistics_should_compute_average_calories', 0, async () => {
      const stats: FoodItemStatistics = new FoodItemStatistics();
      expect(stats.getAverageCalories()).assertEqual(0);
      stats.collect([FoodItemInfoFactory.createTomato(), FoodItemInfoFactory.createCucumber()]);
      expect(stats.getAverageCalories()).assertEqual(15.5);
    });

    // 适配 FoodItemStatistics：清空后统计为零
    it('statistics_should_reset_after_clear', 0, async () => {
      const stats: FoodItemStatistics = new FoodItemStatistics();
      stats.collect(FoodItemInfoFactory.createStandardSet());
      stats.clear();
      expect(stats.getVegetableCount()).assertEqual(0);
      expect(stats.getTotalCount()).assertEqual(0);
    });

    // 适配 FoodItemStatistics：批量收集累积统计
    it('statistics_should_accumulate_collect', 0, async () => {
      const stats: FoodItemStatistics = new FoodItemStatistics();
      stats.collect(FoodItemInfoFactory.createStandardSet());
      stats.collect(FoodItemInfoFactory.createStandardSet());
      expect(stats.getNutCount()).assertEqual(2);
      expect(stats.getTotalCount()).assertEqual(6);
    });

    // 适配 DescriptorFactory：甜点项角色为特殊
    it('descriptor_factory_should_categorize_dessert_as_special', 0, async () => {
      const descriptor: FoodItemDescriptor =
        FoodItemDescriptorFactory.create('IceCream', FoodCategory.DESSERT, IconTheme.DARK);
      expect(descriptor.role).assertEqual(ItemRole.SPECIAL);
      expect(descriptor.categoryId).assertEqual(FoodCategory.DESSERT);
    });

    // 适配 DescriptorFactory：蔬菜项角色为主食
    it('descriptor_factory_should_categorize_vegetable_as_primary', 0, async () => {
      const descriptor: FoodItemDescriptor =
        FoodItemDescriptorFactory.create('Tomato', FoodCategory.VEGETABLE, IconTheme.LIGHT);
      expect(descriptor.role).assertEqual(ItemRole.PRIMARY);
      expect(descriptor.theme).assertEqual(IconTheme.LIGHT);
    });

    // 适配 DescriptorFactory：坚果项角色为配菜
    it('descriptor_factory_should_categorize_nut_as_secondary', 0, async () => {
      const descriptor: FoodItemDescriptor =
        FoodItemDescriptorFactory.create('Walnut', FoodCategory.NUT, IconTheme.HIGH_CONTRAST);
      expect(descriptor.role).assertEqual(ItemRole.SECONDARY);
      expect(descriptor.theme).assertEqual(IconTheme.HIGH_CONTRAST);
    });

    // 适配 DescriptorFactory：角色名称映射
    it('descriptor_factory_should_map_role_names', 0, async () => {
      expect(FoodItemDescriptorFactory.getRoleName(ItemRole.PRIMARY)).assertEqual('main dish');
      expect(FoodItemDescriptorFactory.getRoleName(ItemRole.SECONDARY)).assertEqual('side dish');
      expect(FoodItemDescriptorFactory.getRoleName(ItemRole.SPECIAL)).assertEqual('special dish');
    });

    // 适配 DescriptorFactory：主题名称映射
    it('descriptor_factory_should_map_theme_names', 0, async () => {
      expect(FoodItemDescriptorFactory.getThemeName(IconTheme.LIGHT)).assertEqual('light theme');
      expect(FoodItemDescriptorFactory.getThemeName(IconTheme.DARK)).assertEqual('dark theme');
      expect(FoodItemDescriptorFactory.getThemeName(IconTheme.HIGH_CONTRAST)).assertEqual('high contrast theme');
    });

    // 适配 FoodItemInfoFactory：标准集包含三类食物
    it('item_factory_should_create_standard_set', 0, async () => {
      const items: FoodItemInfoModel[] = FoodItemInfoFactory.createStandardSet();
      expect(items.length).assertEqual(3);
      expect(items[0].isVegetable()).assertTrue();
      expect(items[1].isNut()).assertTrue();
      expect(items[2].isDessert()).assertTrue();
    });

    // 适配 FoodItemInfoFactory：按数量创建集合
    it('item_factory_should_create_count_items', 0, async () => {
      const items: FoodItemInfoModel[] = FoodItemInfoFactory.createCount(5);
      expect(items.length).assertEqual(5);
      expect(items[0].getDisplayName()).assertEqual('Food0');
      expect(items[4].getDisplayName()).assertEqual('Food4');
      expect(items[4].calories).assertEqual(40);
    });

    // 适配 FieldExtractor：提取名称列表
    it('field_extractor_should_extract_letters', 0, async () => {
      const letters: string[] = FoodItemFieldExtractor.extractLetters(FoodItemInfoFactory.createStandardSet());
      expect(letters.length).assertEqual(3);
      expect(letters.includes('Tomato')).assertTrue();
      expect(letters.includes('Walnut')).assertTrue();
      expect(letters.includes('IceCream')).assertTrue();
    });

    // 适配 FieldExtractor：提取图片列表
    it('field_extractor_should_extract_images', 0, async () => {
      const images: string[] = FoodItemFieldExtractor.extractImages(FoodItemInfoFactory.createStandardSet());
      expect(images.length).assertEqual(3);
      expect(images[0]).assertEqual('app.media.tomato');
    });

    // 适配 FieldExtractor：提取分类列表
    it('field_extractor_should_extract_category_ids', 0, async () => {
      const categoryIds: number[] = FoodItemFieldExtractor.extractCategoryIds(FoodItemInfoFactory.createStandardSet());
      expect(categoryIds.length).assertEqual(3);
      expect(categoryIds[0]).assertEqual(FoodCategory.VEGETABLE);
      expect(categoryIds[2]).assertEqual(FoodCategory.DESSERT);
    });

    // 适配 FieldExtractor：提取热量列表
    it('field_extractor_should_extract_calories', 0, async () => {
      const calories: number[] = FoodItemFieldExtractor.extractCalories(FoodItemInfoFactory.createStandardSet());
      expect(calories.length).assertEqual(3);
      expect(calories[0]).assertEqual(15);
      expect(calories[1]).assertEqual(646);
    });

    // 适配 FieldExtractor：提取焦点项列表
    it('field_extractor_should_extract_focused_items', 0, async () => {
      const focused: FoodItemInfoModel[] = FoodItemFieldExtractor.extractFocused([FoodItemInfoFactory.createCrab()]);
      expect(focused.length).assertEqual(1);
      expect(focused[0].letter).assertEqual('Crab');
    });

    // 适配 SortManager：按热量排序
    it('sort_manager_should_sort_by_calories', 0, async () => {
      const manager: FoodItemSortManager = new FoodItemSortManager();
      manager.setItems(FoodItemInfoFactory.createStandardSet());
      const sorted: FoodItemInfoModel[] = manager.sortByCalories();
      expect(sorted[0].isVegetable()).assertTrue();
      expect(sorted[1].isDessert()).assertTrue();
      expect(sorted[2].isNut()).assertTrue();
    });

    // 适配 SortManager：按分类排序
    it('sort_manager_should_sort_by_category_id', 0, async () => {
      const manager: FoodItemSortManager = new FoodItemSortManager();
      manager.setItems(FoodItemInfoFactory.createStandardSet());
      const sorted: FoodItemInfoModel[] = manager.sortByCategoryId();
      expect(sorted[0].categoryId).assertEqual(FoodCategory.VEGETABLE);
      expect(sorted[2].categoryId).assertEqual(FoodCategory.DESSERT);
    });

    // 适配 SortManager：条目计数与清空
    it('sort_manager_should_count_and_clear', 0, async () => {
      const manager: FoodItemSortManager = new FoodItemSortManager();
      manager.setItems(FoodItemInfoFactory.createStandardSet());
      expect(manager.getItemCount()).assertEqual(3);
      manager.clear();
      expect(manager.getItemCount()).assertEqual(0);
    });

    // 集成：主页渲染后食物模型仍可正常驱动列表数据
    it('home_page_should_stay_rendered_with_food_model', 0, async () => {
      const rendered: boolean = await waitForHomePageStable(driver, TIMEOUT_PAGE_RENDER);
      expect(rendered).assertTrue();
      const count: number = await homeComponentCount(driver);
      expect(count).assertLargerOrEqual(1);
      const collection: FoodItemCollection = new FoodItemCollection();
      collection.addAll(FoodItemInfoFactory.createStandardSet());
      expect(collection.getCount()).assertEqual(3);
    });
  });
}
