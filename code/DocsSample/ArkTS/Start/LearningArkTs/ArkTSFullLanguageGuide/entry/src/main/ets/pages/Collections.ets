/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

export {}

// ===== array_creation_methods =====
// [Start array_creation_methods]
// 使用类型后缀 []
let numbers: number[] = [1, 2, 3, 4, 5];
let strings: string[] = ['a', 'b', 'c'];
let booleans: boolean[] = [true, false, true];

// 使用泛型Array
let numbers2: Array<number> = [1, 2, 3];
let strings2: Array<string> = ['hello', 'world'];

// 空数组
let empty: number[] = [];
let empty2: string[] = [];

// 联合类型数组
let mixed: (number | string)[] = [1, 'two', 3, 'four'];
let nullable: (number | null)[] = [1, null, 3];

// 使用扩展运算符创建
let original: number[] = [1, 2, 3];
let copy: number[] = [...original];
let extended: number[] = [...original, 4, 5];
// [End array_creation_methods]

// ===== array_element_access =====
// [Start array_element_access]
let arr: number[] = [10, 20, 30, 40, 50];

// 读取元素
let first: number = arr[0];   // 10
let second: number = arr[1];  // 20
let last: number = arr[arr.length - 1];  // 50

// 修改元素
arr[0] = 100;
arr[1] = 200;
console.info(`${arr.join(', ')}`);  // 100, 200, 30, 40, 50

// 越界访问
let outOfBounds: number | undefined = arr[10];
console.info(`${outOfBounds}`);  // undefined

// 安全访问
let index: number = 5;
if (index >= 0 && index < arr.length) {
  let safe: number = arr[index];
}
// [End array_element_access]

// ===== array_for_loop_iteration =====
// [Start array_for_loop_iteration]
let iterArr: number[] = [1, 2, 3, 4, 5];

for (let value of iterArr) {
  console.info(`${value}`);
}

// 获取索引和值
for (let i: number = 0; i < iterArr.length; i++) {
  console.info(`Index ${i}: ${iterArr[i]}`);
}
// [End array_for_loop_iteration]

// ===== array_forEach_method =====
// [Start array_forEach_method]
let forEachArr: number[] = [1, 2, 3];

forEachArr.forEach((value: number, index: number): void => {
  console.info(`Index ${index}: ${value}`);
});
// [End array_forEach_method]

// ===== array_indexed_iteration =====
// [Start array_indexed_iteration]
let iterArr2: number[] = [1, 2, 3];

for (let i: number = 0; i < iterArr2.length; i++) {
  console.info(`${iterArr2[i]}`);
}
// [End array_indexed_iteration]

// ===== array_add_elements =====
// [Start array_add_elements]
let elemArr: number[] = [1, 2];

// push：末尾添加
elemArr.push(3);
elemArr.push(4, 5);  // 可添加多个
let newLength: number = elemArr.push(6);  // 返回新长度

// unshift：开头添加
elemArr.unshift(0);
elemArr.unshift(-1, -2);  // 可添加多个

console.info(`${elemArr.join(', ')}`);  // -1, -2, 0, 1, 2, 3, 4, 5, 6
// [End array_add_elements]

// ===== array_remove_elements =====
// [Start array_remove_elements]
let elemArr2: number[] = [1, 2, 3, 4, 5];

// pop：删除末尾
let elemLast: number | undefined = elemArr2.pop();  // 5
console.info(`${elemArr2.join(', ')}`);  // 1, 2, 3, 4

// shift：删除开头
let elemFirst: number | undefined = elemArr2.shift();  // 1
console.info(`${elemArr2.join(', ')}`);  // 2, 3, 4

// splice：删除指定位置
let removed: number[] = elemArr2.splice(1, 2);  // 删除索引1开始的2个元素
console.info(`${elemArr2.join(', ')}`);  // 2
console.info(`${removed.join(', ')}`);  // 3, 4
// [End array_remove_elements]

// ===== array_concat_and_slice =====
// [Start array_concat_and_slice]
let arr1: number[] = [1, 2];
let arr2: number[] = [3, 4];

// concat：拼接数组
let combined: number[] = arr1.concat(arr2);
console.info(`${combined.join(', ')}`);  // 1, 2, 3, 4
let sliceExtended: number[] = arr1.concat(3, 4, [5, 6]);
console.info(`${sliceExtended.join(', ')}`);  // 1, 2, 3, 4, 5, 6

// slice：拆分/截取
let sliceArr: number[] = [1, 2, 3, 4, 5];
let sub: number[] = sliceArr.slice(1, 4);
console.info(`${sub.join(', ')}`);  // 2, 3, 4
let tail: number[] = sliceArr.slice(2);
console.info(`${tail.join(', ')}`);  // 3, 4, 5
let sliceCopy: number[] = sliceArr.slice();
console.info(`${sliceCopy.join(', ')}`);  // 1, 2, 3, 4, 5（拷贝）
// [End array_concat_and_slice]

// ===== array_search_and_filter =====
// [Start array_search_and_filter]
let filterArr: number[] = [1, 2, 3, 2, 1];

// indexOf：查找索引
let filterIndex: number = filterArr.indexOf(2);  // 1（第一个匹配）
let lastIndex: number = filterArr.lastIndexOf(2);  // 3（最后一个匹配）
let notFound: number = filterArr.indexOf(10);  // -1

// includes：是否包含
let has2: boolean = filterArr.includes(2);  // true
let has10: boolean = filterArr.includes(10);  // false

// find：条件查找
let filterNumbers: number[] = [1, 5, 10, 15, 20];
let found: number | undefined = filterNumbers.find((value: number): boolean => {
  return value > 10;
});  // 15

let foundIndex: number = filterNumbers.findIndex((value: number): boolean => {
  return value > 10;
});  // 3

// filter：过滤
let allNumbers: number[] = [1, 2, 3, 4, 5, 6];
let evens: number[] = allNumbers.filter((value: number): boolean => {
  return value % 2 === 0;
});
console.info(`${evens.join(', ')}`);  // 2, 4, 6

let greaterThan3: number[] = allNumbers.filter((value: number): boolean => {
  return value > 3;
});
console.info(`${greaterThan3.join(', ')}`);  // 4, 5, 6
// [End array_search_and_filter]

// ===== tuple_basics =====
// [Start tuple_basics]
// TypeScript中的元组
let tuple: [number, string] = [1, 'hello'];
let coordinate: [number, number] = [10, 20];
let user: [number, string, boolean] = [1, 'Alice', true];

// 在ArkTS中，元组通常用数组表示
let pair: number[] = [1, 2];  // 两元素数组模拟元组
let triple: [number, string, boolean] = [1, 'text', true];  // 类型标注
// [End tuple_basics]

// ===== tuple_element_access =====
// [Start tuple_element_access]
// 索引访问
let accessTuple: [number, string] = [1, 'hello'];
let num: number = accessTuple[0];    // 1
let str: string = accessTuple[1];    // 'hello'

// 访问数组形式的元组
let accessPair: number[] = [10, 20];
let accessFirst: number = accessPair[0];   // 10
let accessSecond: number = accessPair[1];  // 20

// 安全访问（带类型检查）
function getPairElement(arr: number[], index: number): number | undefined {
  if (arr.length === 2 && index >= 0 && index < 2) {
    return arr[index];
  }
  return undefined;
}
// [End tuple_element_access]

// ===== tuple_vs_array =====
// [Start tuple_vs_array]
// 元组：固定长度和类型
let point: [number, number] = [10, 20];  // 只能有两个number

// 数组：可变长度，统一类型
let tupleNumbers: number[] = [1, 2, 3, 4, 5];  // 可添加更多number

// 元组表示固定结构
let userTuple: [number, string, boolean] = [1, 'Alice', true];
console.info(`${userTuple.join(', ')}`);  // 1, Alice, true

// 数组表示动态集合
let userIds: number[] = [1, 2, 3, 4, 5];
userIds.push(6);  // 可添加
// [End tuple_vs_array]

// ===== set_creation =====
// [Start set_creation]
// 创建空Set
let emptySet: Set<number> = new Set();

// 从数组创建
let numbersSet: Set<number> = new Set([1, 2, 3, 4, 5]);

// 添加初始元素
let stringSet: Set<string> = new Set();
stringSet.add('a');
stringSet.add('b');
// [End set_creation]

// ===== set_uniqueness =====
// [Start set_uniqueness]
let set: Set<number> = new Set([1, 2, 2, 3, 3, 3]);
console.info(`${set.size}`);  // 3（去除重复）

// 添加重复元素无效
set.add(1);
console.info(`${set.size}`);  // 3（不变）

// 去除数组重复元素
let uniqueArr: number[] = [1, 2, 2, 3, 3, 3];
let unique: number[] = Array.from(new Set(uniqueArr));
console.info(`${unique.join(', ')}`);  // 1, 2, 3
// [End set_uniqueness]

// ===== set_add_method =====
// [Start set_add_method]
let addSet: Set<number> = new Set();

addSet.add(1);
addSet.add(2);
addSet.add(3);

let addedSet: Set<number> = addSet.add(4);  // 返回Set本身
// [End set_add_method]

// ===== set_delete_method =====
// [Start set_delete_method]
let delSet: Set<number> = new Set([1, 2, 3]);

let deleted: boolean = delSet.delete(2);  // true（成功删除）
let isRemoved: boolean = delSet.delete(10);  // false（不存在）

console.info(`${delSet.size}`);  // 2
// [End set_delete_method]

// ===== set_has_method =====
// [Start set_has_method]
let hasSet: Set<number> = new Set([1, 2, 3]);

let has1: boolean = hasSet.has(1);  // true
let hasHas10: boolean = hasSet.has(10);  // false
// [End set_has_method]

// ===== set_iteration =====
// [Start set_iteration]
let iterSet: Set<number> = new Set([1, 2, 3]);

// for...of遍历
for (let value of iterSet) {
  console.info(`${value}`);
}

// forEach方法
iterSet.forEach((value: number): void => {
  console.info(`${value}`);
});

// 获取所有值
let values: IterableIterator<number> = iterSet.values();
for (let value of values) {
  console.info(`${value}`);
}

// 获取所有键（Set中键等于值）
let keys: IterableIterator<number> = iterSet.keys();
for (let key of keys) {
  console.info(`${key}`);
}
// [End set_iteration]

// ===== set_array_conversion =====
// [Start set_array_conversion]
// Set转数组
let convSet: Set<number> = new Set([1, 2, 3]);
let convArr: number[] = Array.from(convSet);
console.info(`${convArr.join(', ')}`);  // 1, 2, 3

// 数组转Set
let convNumbers: number[] = [1, 2, 2, 3];
let setFromArr: Set<number> = new Set(convNumbers);
console.info(`${Array.from(setFromArr).join(', ')}`);  // 1, 2, 3

// 去重
let duplicates: number[] = [1, 1, 2, 2, 3, 3];
let convUnique: number[] = Array.from(new Set(duplicates));
console.info(`${convUnique.join(', ')}`);  // 1, 2, 3
// [End set_array_conversion]

// ===== set_clear_method =====
// [Start set_clear_method]
let clearSet: Set<number> = new Set([1, 2, 3]);
clearSet.clear();
console.info(`${clearSet.size}`);  // 0
// [End set_clear_method]

// ===== map_creation =====
// [Start map_creation]
// 创建空Map
let emptyMap: Map<string, number> = new Map();

// 从数组创建（键值对数组）
let initMap: Map<string, number> = new Map([
  ['a', 1],
  ['b', 2],
  ['c', 3]
]);

// 添加初始键值对
let map: Map<string, number> = new Map();
map.set('one', 1);
map.set('two', 2);
// [End map_creation]

// ===== map_basic_operations =====
// [Start map_basic_operations]
let opsMap: Map<string, number> = new Map();

// 添加键值对
opsMap.set('a', 1);
opsMap.set('b', 2);
opsMap.set('c', 3);

// 访问值
let valueA: number | undefined = opsMap.get('a');  // 1
let valueB: number | undefined = opsMap.get('b');  // 2
let opsNotFound: number | undefined = opsMap.get('x');  // undefined

// 判断键是否存在
let hasA: boolean = opsMap.has('a');  // true
let hasX: boolean = opsMap.has('x');  // false

// 删除键值对
let opsDeleted: boolean = opsMap.delete('b');  // true
let opsNotDeleted: boolean = opsMap.delete('x');  // false

// 更新值
opsMap.set('a', 10);  // 更新 'a' 的值

// 清空Map
opsMap.clear();
console.info(`${opsMap.size}`);  // 0
// [End map_basic_operations]

// ===== map_iteration =====
// [Start map_iteration]
let iterMap: Map<string, number> = new Map([
  ['a', 1],
  ['b', 2],
  ['c', 3]
]);

// forEach遍历
iterMap.forEach((value: number, key: string): void => {
  console.info(`${key}: ${value}`);
});

// for...of遍历entries
for (let entry of iterMap.entries()) {
  let key: string = entry[0];
  let value: number = entry[1];
  console.info(`${key}: ${value}`);
}

// for...of遍历键
for (let key of iterMap.keys()) {
  console.info(`${key}`);
}

// for...of遍历值
for (let value of iterMap.values()) {
  console.info(`${value}`);
}

// 不使用解构遍历，显式读取entry元素
for (let entry of iterMap.entries()) {
  let key: string = entry[0];
  let value: number = entry[1];
  console.info(`${key}: ${value}`);
}
// [End map_iteration]

// ===== map_vs_object =====
// [Start map_vs_object]
// Map：任意键类型
let objMap2: Map<number, string> = new Map();
objMap2.set(1, 'one');
objMap2.set(2, 'two');

class KeyObject {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

let objMap: Map<KeyObject, string> = new Map();
let keyObj: KeyObject = new KeyObject(1);
objMap.set(keyObj, 'value');

// Record：适合表达字符串键值对象
let obj: Record<string, number> = {};
obj['key1'] = 1;
obj['key2'] = 2;

let objValue: number | undefined = obj['key1'];
if (objValue !== undefined) {
  console.info(`${objValue}`);
}

// Map：保持顺序
let orderedMap: Map<string, number> = new Map();
orderedMap.set('a', 1);
orderedMap.set('b', 2);
orderedMap.set('c', 3);
console.info(`${Array.from(orderedMap.keys()).join(', ')}`);  // a, b, c（保持顺序）

// Map：直接获取大小
console.info(`${orderedMap.size}`);  // 3

// Object：需要计算大小
let objSize: number = Object.keys(obj).length;
// [End map_vs_object]

// ===== record_type_basic =====
// [Start record_type_basic]
let ages: Record<string, number> = {
  'John': 25,
  'Mary': 21
};
ages['John']; // 25
// [End record_type_basic]

// ===== record_type_complex =====
// [Start record_type_complex]
interface PersonInfo {
  age: number;
  salary: number;
}
let staff: Record<string, PersonInfo> = {
  'John': { age: 25, salary: 10},
  'Mary': { age: 21, salary: 20}
};
// [End record_type_complex]

// ===== readonly_map_set_interfaces =====
// [Start readonly_map_set_interfaces]
interface ReadonlyMap<K, V> {
  get(key: K): V | undefined;
  has(key: K): boolean;
  size: number;
  forEach(callback: (value: V, key: K) => void): void;
}

interface ReadonlySet<T> {
  has(value: T): boolean;
  size: number;
  forEach(callback: (value: T) => void): void;
}

// 使用时返回只读接口
function getReadOnlyMap(): ReadonlyMap<string, number> {
  let map: Map<string, number> = new Map();
  map.set('a', 1);
  return map;  // 返回只读视图
}
// [End readonly_map_set_interfaces]

// ===== readonly_collection_scenarios =====
// [Start readonly_collection_scenarios]
// 配置数据：只读，防止意外修改
const CONFIG: ReadonlyArray<string> = ['api', 'db', 'cache'];

// 函数参数：只读，保护原始数据
function processItems(items: ReadonlyArray<number>): number {
  let sum: number = 0;
  for (let item of items) {
    sum += item;
  }
  return sum;
}

let scenariosNumbers: number[] = [1, 2, 3];
processItems(scenariosNumbers);  // 传入只读视图

// 返回只读结果：防止外部修改
function getConstants(): ReadonlyArray<string> {
  return ['CONST_A', 'CONST_B'];
}
// [End readonly_collection_scenarios]

// ===== for_of_iteration =====
// [Start for_of_iteration]
// 数组
let iterArr3: number[] = [1, 2, 3];
for (let value of iterArr3) {
  console.info(`${value}`);
}

// Set
let iterSet2: Set<number> = new Set([1, 2, 3]);
for (let value of iterSet2) {
  console.info(`${value}`);
}

// Map
let iterMap2: Map<string, number> = new Map([['a', 1], ['b', 2]]);
for (let entry of iterMap2) {
  console.info(`${entry[0]}: ${entry[1]}`);  // a: 1, b: 2
}

// 字符串
let text: string = 'Hello';
for (let char of text) {
  console.info(`${char}`);
}
// [End for_of_iteration]

// ===== iterator_manual_traversal =====
// [Start iterator_manual_traversal]
// 获取迭代器
let traverseArr: number[] = [1, 2, 3];
let iterator: IterableIterator<number> = traverseArr.values();

// 手动遍历
let result: IteratorResult<number> = iterator.next();
while (!result.done) {
  console.info(`${result.value}`);
  result = iterator.next();
}

// Set迭代器
let traverseSet: Set<string> = new Set(['a', 'b', 'c']);
let setIterator: IterableIterator<string> = traverseSet.values();

console.info(`${JSON.stringify(setIterator.next())}`);  // {"value":"a","done":false}
console.info(`${JSON.stringify(setIterator.next())}`);  // {"value":"b","done":false}
console.info(`${JSON.stringify(setIterator.next())}`);  // {"value":"c","done":false}
console.info(`${JSON.stringify(setIterator.next())}`);  // {"value":undefined,"done":true}

// Map迭代器
let traverseMap: Map<string, number> = new Map([['x', 10], ['y', 20]]);
let mapIterator: IterableIterator<[string, number]> = traverseMap.entries();

console.info(`${JSON.stringify(mapIterator.next())}`);  // {"value":["x",10],"done":false}
// [End iterator_manual_traversal]

// ===== unique_collection_with_set =====
// [Start unique_collection_with_set]
// 反例：每次插入都手动includes，容易遗漏去重逻辑
let ids: number[] = [];
if (!ids.includes(1001)) {
  ids.push(1001);
}

// 推荐：唯一性由Set表达
let uniqueIds: Set<number> = new Set();
uniqueIds.add(1001);
uniqueIds.add(1001);
console.info(`${uniqueIds.size}`);  // 1
// [End unique_collection_with_set]

// ===== object_key_with_record =====
// [Start object_key_with_record]
// 用普通对象保存对象键，需手动调用toString()转换
class RecordCacheKey {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }

  toString(): string {
    return `key-${this.id}`;
  }
}

let recordKey: RecordCacheKey = new RecordCacheKey(1);
let recordCache: Record<string, string> = {};
recordCache[recordKey.toString()] = 'value';
console.info(`${recordCache[recordKey.toString()]}`); // value
// [End object_key_with_record]

// ===== object_key_with_map =====
// [Start object_key_with_map]
class CacheKey {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

let key: CacheKey = new CacheKey(1);

let cache: Map<CacheKey, string> = new Map();
cache.set(key, 'value');
console.info(`${cache.get(key)!}`); // value
// [End object_key_with_map]

// ===== readonly_array_parameter =====
// [Start readonly_array_parameter]
// 反例：调用方传入的数组会被修改
function appendDefault(items: string[]): void {
  items.push('default');
}

// 推荐：只读场景声明为ReadonlyArray
function countItems(items: ReadonlyArray<string>): number {
  return items.length;
}
// [End readonly_array_parameter]


// [Start iterator_manual]
let imArr: number[] = [10, 20, 30];
let imIter: IterableIterator<number> = imArr.values();

let imResult: IteratorResult<number> = imIter.next();
while (!imResult.done) {
  console.info(`${imResult.value.toString()}`);
  imResult = imIter.next();
}
// 输出: 10, 20, 30

// Set迭代器
let imSet: Set<string> = new Set<string>();
imSet.add('a');
imSet.add('b');
let imSetIter: IterableIterator<string> = imSet.values();
let imSetResult: IteratorResult<string> = imSetIter.next();
while (!imSetResult.done) {
  console.info(`${imSetResult.value}`);
  imSetResult = imSetIter.next();
}
// 输出: a, b

// Map迭代器
let imMap: Map<string, number> = new Map<string, number>();
imMap.set('x', 10);
imMap.set('y', 20);
let imMapIter: IterableIterator<[string, number]> = imMap.entries();
let imMapResult: IteratorResult<[string, number]> = imMapIter.next();
while (!imMapResult.done) {
  let entry: [string, number] = imMapResult.value;
  console.info(`${entry[0]}: ${entry[1]}`);
  imMapResult = imMapIter.next();
}
// 输出: x: 10, y: 20
// [End iterator_manual]


// ===== array_map =====
// [Start array_map]
let amNumbers: number[] = [1, 2, 3, 4, 5];

let amDoubled: number[] = amNumbers.map((n: number): number => n * 2);
console.info(`${amDoubled.join(', ')}`);  // 2, 4, 6, 8, 10

let amStrings: string[] = amNumbers.map((n: number): string => `Item ${n}`);
console.info(`${amStrings.join(', ')}`);  // Item 1, Item 2, Item 3, Item 4, Item 5
// [End array_map]

// ===== array_filter =====
// [Start array_filter]
let afNumbers: number[] = [1, 2, 3, 4, 5, 6];

let afEvens: number[] = afNumbers.filter((n: number): boolean => n % 2 === 0);
console.info(`${afEvens.join(', ')}`);  // 2, 4, 6
// [End array_filter]

// ===== flat_flatmap_usage =====
// [Start flat_flatmap_usage]
let ffnNested: number[][] = [[1, 2], [3, 4], [5, 6]];

// flat：将二维数组展平为一维
let ffnFlat: number[] = ffnNested.flat();
console.info(`${ffnFlat.join(', ')}`); // 1, 2, 3, 4, 5, 6

// flatMap：对每个元素映射后展平一级
let ffnWords: string[] = ['hello world', 'foo bar'];
let ffnFlatMapped: string[] = ffnWords.flatMap((s: string): string[] => s.split(' '));
console.info(`${ffnFlatMapped.join(', ')}`); // hello, world, foo, bar

// reduce和展开运算符替代flat
let ffnFlatReduce: number[] = ffnNested.reduce((acc: number[], arr: number[]): number[] => {
  return [...acc, ...arr];
}, []);
console.info(`${ffnFlatReduce.join(', ')}`); // 1, 2, 3, 4, 5, 6
// [End flat_flatmap_usage]

// ===== array_reduce =====
// [Start array_reduce]
let arNumbers: number[] = [1, 2, 3, 4, 5];

let arSum: number = arNumbers.reduce((acc: number, n: number): number => acc + n, 0);
console.info(`${arSum.toString()}`);  // 15

let arProduct: number = arNumbers.reduce((acc: number, n: number): number => acc * n, 1);
console.info(`${arProduct.toString()}`);  // 120
// [End array_reduce]

// ===== array_sort =====
// [Start array_sort]
let asNumbers: number[] = [3, 1, 4, 1, 5, 9, 2, 6];

let asAscending: number[] = [...asNumbers].sort((a: number, b: number): number => a - b);
console.info(`${asAscending.join(', ')}`);  // 1, 1, 2, 3, 4, 5, 6, 9

let asDescending: number[] = [...asNumbers].sort((a: number, b: number): number => b - a);
console.info(`${asDescending.join(', ')}`);  // 9, 6, 5, 4, 3, 2, 1, 1

let asReversed: number[] = [...asNumbers].reverse();
console.info(`${asReversed.join(', ')}`);  // 6, 2, 9, 5, 1, 4, 1, 3
// [End array_sort]

// ===== array_chain =====
// [Start array_chain]
interface AcProduct {
  name: string;
  price: number;
  category: string;
}

let acProducts: AcProduct[] = [
  { name: 'Laptop', price: 999, category: 'Electronics' },
  { name: 'Mouse', price: 25, category: 'Electronics' },
  { name: 'Book', price: 15, category: 'Books' },
  { name: 'Keyboard', price: 75, category: 'Electronics' }
];

let acTotal: number = acProducts
  .filter((p) => p.category === 'Electronics')
  .map((p) => p.price)
  .reduce((acc: number, price: number) => acc + price, 0);

console.info(`Electronics total: ${acTotal}`);  // 1099
// [End array_chain]
