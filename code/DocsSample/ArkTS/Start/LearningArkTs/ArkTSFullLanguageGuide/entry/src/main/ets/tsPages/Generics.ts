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

export {};

// [Start ts_generic_constraint_length]
// 约束泛型参数必须具有length属性
interface Lengthwise {
  length: number;
}

function getLength<T extends Lengthwise>(arg: T): number {
  return arg.length;
}

class LengthSample implements Lengthwise {
  public length: number;

  constructor(length: number) {
    this.length = length;
  }
}

console.info(`${getLength('Hello')}`);        // 5
console.info(`${getLength([1, 2, 3])}`);      // 3
console.info(`${getLength(new LengthSample(10))}`); // 10

// 编译错误：number类型没有length属性
console.info(`${getLength(42)}`);
// [End ts_generic_constraint_length]

// [Start ts_generic_constraint_serializable]
interface Serializable {
  serialize(): string;
}

class User implements Serializable {
  public name: string;
  public age: number;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }

  public serialize(): string {
    return JSON.stringify({ name: this.name, age: this.age });
  }
}

class Product implements Serializable {
  public id: number;
  public title: string;

  constructor(id: number, title: string) {
    this.id = id;
    this.title = title;
  }

  public serialize(): string {
    return JSON.stringify({ id: this.id, title: this.title });
  }
}

// 约束泛型参数必须实现Serializable接口
function saveToStorage<T extends Serializable>(entity: T): void {
  let serialized = entity.serialize();
  console.info(`Saving: ${serialized}`);
}

let user = new User('Alice', 25);
let product = new Product(1, 'Laptop');

saveToStorage(user);    // Saving: {"name":"Alice","age":25}
saveToStorage(product); // Saving: {"id":1,"title":"Laptop"}

// 编译错误：number类型没有serialize方法
saveToStorage(42);
// [End ts_generic_constraint_serializable]

// [Start ts_utility_types_note]
// TypeScript写法，ArkTS中不作为常规语法使用
type Nullable<T> = T | null;
type ReadonlyProps<T> = { readonly [P in keyof T]: T[P] };
type ElementType<T> = T extends Array<infer Item> ? Item : T;
// [End ts_utility_types_note]

// [Start ts_generics_vs_object]
// 使用Object类型会丢失具体类型信息
function identityObject(arg: Object): Object {
  return arg;
}

let result1 = identityObject(42);
// result1的类型是Object，无法直接作为number使用

// 使用泛型保留类型信息
function identityGeneric<T>(arg: T): T {
  return arg;
}

let result2 = identityGeneric(42);
// result2的类型自动推断为number
result2.toUpperCase(); // 编译错误：类型错误提示
// [End ts_generics_vs_object]

// ===== ts_generic_nested_types =====
// [Start ts_generic_nested_types]
// 泛型嵌套类型：树
interface TsTree<T> {
  value: T;
  children?: TsTree<T>[];
}

let tsLeaf4: TsTree<number> = { value: 4 };
let tsLeaf5: TsTree<number> = { value: 5 };
let tsBranch3: TsTree<number> = { value: 3, children: [tsLeaf4, tsLeaf5] };
let tsBranch2: TsTree<number> = { value: 2 };
let tsNumberTree: TsTree<number> = {
  value: 1,
  children: [tsBranch2, tsBranch3]
};

console.info(`${tsNumberTree.value}`); // 1
console.info(`${tsNumberTree.children?.[0].value}`); // 2

// 泛型嵌套类型：链表
interface TsListNode<T> {
  value: T;
  next?: TsListNode<T>;
}

let tsThird: TsListNode<string> = { value: 'third' };
let tsSecond: TsListNode<string> = { value: 'second', next: tsThird };
let tsFirst: TsListNode<string> = { value: 'first', next: tsSecond };

let tsCurrent: TsListNode<string> | undefined = tsFirst;
while (tsCurrent !== undefined) {
  console.info(`${tsCurrent.value}`); // first, second, third
  tsCurrent = tsCurrent.next;
}
// [End ts_generic_nested_types]

// ===== ts_keyof_operator =====
// [Start ts_keyof_operator]
// TypeScript对照写法，ArkTS中不作为常规语法使用
interface KeyofPointType {
  x: number;
  y: number;
}
type P = keyof KeyofPointType;  // "x" | "y"

function getProperty<T, K extends keyof T>(obj: T, key: K) {
  return obj[key];
}
// [End ts_keyof_operator]

// ===== ts_typeof_operator =====
// [Start ts_typeof_operator]
// TypeScript对照写法，ArkTS中不作为常规语法使用
let tsConfig = { url: 'EXAMPLE_API_URL', timeout: 5000 };
type TsConfig = typeof tsConfig; // { url: string; timeout: number; }
// [End ts_typeof_operator]

// ===== ts_indexed_access =====
// [Start ts_indexed_access]
// 变型标注：协变out、逆变in、不变in out
type IndexedPerson = { name: string; age: number; alive: boolean };
type IndexedName = IndexedPerson['name'];   // string
type IndexedAge = IndexedPerson['age'];     // number
// [End ts_indexed_access]

// ===== ts_conditional_types =====
// [Start ts_conditional_types]
// 变型标注：协变out、逆变in、不变in out
type IsString<T> = T extends string ? true : false;
type CondA = IsString<string>;   // true
type CondB = IsString<number>;   // false

// infer关键字
type GetReturn<T> = T extends (...args: never[]) => infer R ? R : never;
type CondR = GetReturn<() => string>;  // string

// 分配性条件类型
type ToArray<T> = T extends unknown ? T[] : never;
type CondResult = ToArray<string | number>;  // string[] | number[]
// [End ts_conditional_types]

// ===== ts_mapped_types =====
// [Start ts_mapped_types]
// 变型标注：协变out、逆变in、不变in out
type MappedReadonly<T> = { readonly [P in keyof T]: T[P] };
type MappedPartial<T> = { [P in keyof T]?: T[P] };

// 键重映射
type MappedGetters<T> = {
  [P in keyof T as `get${Capitalize<string & P>}`]: () => T[P]
};
// [End ts_mapped_types]

// ===== ts_exclude_extract =====
// [Start ts_exclude_extract]
// TypeScript对照写法，ArkTS中不作为常规语法使用
type AllTypes = 'a' | 'b' | 'c';
type Excluded = Exclude<AllTypes, 'c'>;      // 'a' | 'b'
type Extracted = Extract<AllTypes, 'a' | 'x'>; // 'a'
// [End ts_exclude_extract]

// ===== ts_nonnullable =====
// [Start ts_nonnullable]
// TypeScript对照写法，ArkTS中不作为常规语法使用
type NullableType = string | null | undefined;
type NonNullType = NonNullable<NullableType>;  // string
// [End ts_nonnullable]

// ===== ts_parameters_returntype =====
// [Start ts_parameters_returntype]
// TypeScript对照写法，ArkTS中不作为常规语法使用
function prFunction(s: string): number { return s.length; }
type PRParams = Parameters<typeof prFunction>;   // [string]
type PRReturn = ReturnType<typeof prFunction>;   // number
// [End ts_parameters_returntype]

// ===== ts_awaited =====
// [Start ts_awaited]
// TypeScript对照写法，ArkTS中不作为常规语法使用
type AwaitedType = Awaited<Promise<string>>;  // string
// [End ts_awaited]

// ===== ts_ctor_params_instance_type =====
// [Start ts_ctor_params_instance_type]
// TypeScript对照写法，ArkTS中不作为常规语法使用
class CpPoint {
  constructor(public x: number, public y: number) {}
}
type CpCtorParams = ConstructorParameters<typeof CpPoint>; // [number, number]
type CpInstance = InstanceType<typeof CpPoint>;             // CpPoint
// [End ts_ctor_params_instance_type]

// ===== ts_string_utils =====
// [Start ts_string_utils]
// TypeScript对照写法，ArkTS中不作为常规语法使用
type Upper = Uppercase<'hello'>;   // 'HELLO'
type Lower = Lowercase<'WORLD'>;   // 'world'
type Cap = Capitalize<'foo'>;      // 'Foo'
type Uncap = Uncapitalize<'Bar'>;  // 'bar'
// [End ts_string_utils]
