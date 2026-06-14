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

// ===== generics_introduction =====
// [Start generics_introduction]
// 不使用泛型：需要为每种类型编写函数
function identityNumber(arg: number): number {
  return arg;
}

function identityString(arg: string): string {
  return arg;
}

// 使用泛型：一个函数适用于所有类型
function identity<T>(arg: T): T {
  return arg;
}

let num: number = identity<number>(42);
let str: string = identity<string>('Hello');
let bool: boolean = identity<boolean>(true);

console.info(`${num}`);   // 42
console.info(`${str}`);   // Hello
console.info(`${bool}`);  // true
// [End generics_introduction]

// ===== generic_function_usage =====
// [Start generic_function_usage]
// 泛型定义
function genericIdentity<T>(arg: T): T {
  return arg;
}

// 使用时指定具体类型
let genericOutput1 = genericIdentity<string>('Hello');
// 等价于：
function genericIdentityString(arg: string): string {
  return arg;
}

let genericOutput2 = genericIdentity<number>(42);
// 等价于：
function genericIdentityNumber(arg: number): number {
  return arg;
}

// 类型自动推断
let genericOutput3 = genericIdentity('ArkTS');  // 自动推断T为string
// [End generic_function_usage]

// ===== generic_stack_class =====
// [Start generic_stack_class]
// 不使用泛型：为每种类型创建数据结构
class NumberStack {
  private items: number[] = [];
  
  push(item: number): void {
    this.items.push(item);
  }
  
  pop(): number | undefined {
    return this.items.pop();
  }
}

class StringStack {
  private items: string[] = [];
  
  push(item: string): void {
    this.items.push(item);
  }
  
  pop(): string | undefined {
    return this.items.pop();
  }
}

// 使用泛型：一个数据结构适用于所有类型
class Stack<T> {
  private items: T[] = [];
  
  push(item: T): void {
    this.items.push(item);
  }
  
  pop(): T | undefined {
    return this.items.pop();
  }
}

let numberStack: Stack<number> = new Stack<number>();
let stringStack: Stack<string> = new Stack<string>();

numberStack.push(1);
numberStack.push(2);
console.info(`${numberStack.pop()}`); // 2

stringStack.push('Hello');
stringStack.push('World');
console.info(`${stringStack.pop()}`); // World
// [End generic_stack_class]

// ===== generic_function_declarations =====
// [Start generic_function_declarations]
// 基本泛型函数声明
function declarationsIdentity<T>(arg: T): T {
  return arg;
}

// 箭头函数形式的泛型函数
const identityArrow = <T>(arg: T): T => arg;

// 使用类型别名的泛型函数
type IdentityFunction = <T>(arg: T) => T;
let identityAlias: IdentityFunction = declarationsIdentity;

console.info(`${declarationsIdentity<number>(42)}`);       // 42
console.info(`${identityArrow<string>('Hello')}`); // Hello
console.info(`${identityAlias<boolean>(true)}`);   // true
// [End generic_function_declarations]

// ===== multi_type_parameter_class =====
// [Start multi_type_parameter_class]
// 使用不同命名规范的示例
class Pair<T, U> {
  public first: T;
  public second: U;

  constructor(first: T, second: U) {
    this.first = first;
    this.second = second;
  }
}

interface Person {
  name: string;
  age: number;
  email: string;
}

let personInfo: Pair<string, number> = new Pair<string, number>('Alice', 25);

console.info(`${personInfo.first}`);  // Alice
console.info(`${personInfo.second}`); // 25
// [End multi_type_parameter_class]

// ===== generic_type_inference =====
// [Start generic_type_inference]
function genericIdentityInferred<T>(arg: T): T {
  return arg;
}

// 显式指定类型参数
let result1: string = genericIdentityInferred<string>('Hello');
console.info(`${result1}`);

// 类型参数自动推断
let result2: string = genericIdentityInferred('World');
console.info(`${result2}`);

// 多类型参数的泛型函数
function createPair<T, U>(first: T, second: U): [T, U] {
  return [first, second];
}

let pair1: [string, number] = createPair<string, number>('Age', 25);
let pair2: [string, number] = createPair('Height', 180); // 自动推断为 [string, number]

console.info(`${pair1[0]}: ${pair1[1]}`); // Age: 25
console.info(`${pair2[0]}: ${pair2[1]}`); // Height: 180
// [End generic_type_inference]

// ===== multi_type_parameter_function =====
// [Start multi_type_parameter_function]
// 多类型参数的基本用法
function swap<T, U>(a: T, b: U): [U, T] {
  return [b, a];
}

let swapped: [string, number] = swap(1, 'Hello');
console.info(`${swapped[0]}, ${swapped[1]}`); // Hello, 1

// 多类型参数的复杂用法：用显式结构保存两个不同类型的值
interface PairValue<T, U> {
  left: T;
  right: U;
}

function combineValues<T, U>(left: T, right: U): PairValue<T, U> {
  return {
    left: left,
    right: right
  };
}

interface Name {
  name: string;
}

interface Age {
  age: number;
}

let nameObj: Name = { name: 'Alice' };
let ageObj: Age = { age: 25 };

let combinedObj: PairValue<Name, Age> = combineValues<Name, Age>(nameObj, ageObj);
console.info(`${combinedObj.left.name}`);
console.info(`${combinedObj.right.age}`);

// 使用类型参数创建映射函数
function mapArray<T, R>(arr: T[], mapper: (item: T) => R): R[] {
  let result: R[] = [];
  for (let item of arr) {
    result.push(mapper(item));
  }
  return result;
}

let numbers: number[] = [1, 2, 3, 4, 5];
let doubled: number[] = mapArray<number, number>(numbers, (n: number): number => n * 2);
console.info(`${doubled.join(', ')}`); // 2, 4, 6, 8, 10

let strings: string[] = ['a', 'b', 'c'];
let uppercased: string[] = mapArray<string, string>(strings, (s: string): string => s.toUpperCase());
console.info(`${uppercased.join(', ')}`); // A, B, C
// [End multi_type_parameter_function]

// ===== generic_class_basic =====
// [Start generic_class_basic]
// 基本泛型类声明
class Container<T> {
  private value: T;
  
  constructor(initialValue: T) {
    this.value = initialValue;
  }
  
  public getValue(): T {
    return this.value;
  }
  
  public setValue(newValue: T): void {
    this.value = newValue;
  }
}

let numberContainer: Container<number> = new Container<number>(42);
console.info(`${numberContainer.getValue()}`); // 42
numberContainer.setValue(100);
console.info(`${numberContainer.getValue()}`); // 100

let stringContainer: Container<string> = new Container<string>('Hello');
console.info(`${stringContainer.getValue()}`); // Hello
stringContainer.setValue('World');
console.info(`${stringContainer.getValue()}`); // World
// [End generic_class_basic]

// ===== generic_class_instantiation =====
// [Start generic_class_instantiation]
class GciContainer<T> {
  private value: T;

  constructor(value: T) {
    this.value = value;
  }

  getValue(): T {
    return this.value;
  }
}

// 显式指定类型参数实例化
let gciContainer1: GciContainer<number> = new GciContainer<number>(10);

// 类型参数自动推断实例化
let gciContainer2: GciContainer<string> = new GciContainer<string>('hello');

// 类型参数可以省略（编译器推断）
let gciContainer3: GciContainer<boolean> = new GciContainer<boolean>(true);

console.info(`${gciContainer1.getValue()}`); // 10
console.info(`${gciContainer2.getValue()}`); // hello
console.info(`${gciContainer3.getValue()}`); // true
// [End generic_class_instantiation]

// ===== generic_collection_class =====
// [Start generic_collection_class]
class GenericCollection<T> {
  // 泛型属性
  private items: T[] = [];
  public count: number = 0;
  
  // 泛型方法
  public add(item: T): void {
    this.items.push(item);
    this.count++;
  }
  
  public remove(item: T): boolean {
    let index = this.items.indexOf(item);
    if (index > -1) {
      this.items.splice(index, 1);
      this.count--;
      return true;
    }
    return false;
  }
  
  public get(index: number): T | undefined {
    return this.items[index];
  }
  
  public getAll(): T[] {
    return this.items;
  }
  
  // 泛型方法返回泛型类型
  public filter(predicate: (item: T) => boolean): GenericCollection<T> {
    let filtered = new GenericCollection<T>();
    this.items.forEach((item: T): void => {
      if (predicate(item)) {
        filtered.add(item);
      }
    });
    return filtered;
  }
}

let collection: GenericCollection<number> = new GenericCollection<number>();
collection.add(1);
collection.add(2);
collection.add(3);
collection.add(4);
collection.add(5);

console.info(`${collection.count}`); // 5
console.info(`${collection.get(0)}`); // 1

let evenNumbers: GenericCollection<number> = collection.filter((n: number): boolean => n % 2 === 0);
console.info(`${evenNumbers.getAll().join(', ')}`); // 2, 4
// [End generic_collection_class]

// ===== multi_type_parameter_generic_class =====
// [Start multi_type_parameter_generic_class]
// 多类型参数的泛型类
class ParamPair<K, V> {
  private key: K;
  private value: V;
  
  constructor(key: K, value: V) {
    this.key = key;
    this.value = value;
  }
  
  public getKey(): K {
    return this.key;
  }
  
  public getValue(): V {
    return this.value;
  }
  
  public setKey(newKey: K): void {
    this.key = newKey;
  }
  
  public setValue(newValue: V): void {
    this.value = newValue;
  }
  
  public toString(): string {
    return `(${this.key}: ${this.value})`;
  }
}

let paramPair1: ParamPair<string, number> = new ParamPair<string, number>('Age', 25);
console.info(`${paramPair1.toString()}`); // (Age: 25)

let paramPair2: ParamPair<number, string> = new ParamPair<number, string>(1, 'One');
console.info(`${paramPair2.toString()}`); // (1: One)

// 多类型参数的复杂泛型类
class Triple<A, B, C> {
  private first: A;
  private second: B;
  private third: C;
  
  constructor(first: A, second: B, third: C) {
    this.first = first;
    this.second = second;
    this.third = third;
  }
  
  public getFirst(): A {
    return this.first;
  }
  
  public getSecond(): B {
    return this.second;
  }
  
  public getThird(): C {
    return this.third;
  }
  
  public toArray(): [A, B, C] {
    return [this.first, this.second, this.third];
  }
}

let triple: Triple<string, number, boolean> = new Triple<string, number, boolean>('Hello', 42, true);
let tripleValues: [string, number, boolean] = triple.toArray();
console.info(`${tripleValues[0]}, ${tripleValues[1]}, ${tripleValues[2]}`); // Hello,42,true
// [End multi_type_parameter_generic_class]

// ===== generic_interface_basic =====
// [Start generic_interface_basic]
// 基本泛型接口声明
interface GenericIdentity {
  invoke<T>(arg: T): T;
}

class GenericIdentityImpl implements GenericIdentity {
  public invoke<T>(arg: T): T {
    return arg;
  }
}

// 泛型接口作为函数类型
let myIdentity: GenericIdentity = new GenericIdentityImpl();

console.info(`${myIdentity.invoke<string>('Hello')}`); // Hello

// 泛型参数作为接口参数
interface GenericIdentityFunction<T> {
  invoke(arg: T): T;
}

class NumberIdentityFunction implements GenericIdentityFunction<number> {
  public invoke(arg: number): number {
    return arg;
  }
}

let myIdentityFunction: GenericIdentityFunction<number> = new NumberIdentityFunction();

console.info(`${myIdentityFunction.invoke(42)}`); // 42
// [End generic_interface_basic]

// ===== generic_interface_callback =====
// [Start generic_interface_callback]
// 泛型接口定义函数类型
interface Callback<T> {
  invoke(result: T): void;
}

interface AsyncCallback<T> {
  invoke(result: T): Promise<void>;
}

// 使用泛型接口约束函数类型
function processData<T>(data: T, callback: Callback<T>): void {
  callback.invoke(data);
}

class StringCallback implements Callback<string> {
  public invoke(result: string): void {
    console.info(`Processed: ${result}`);
  }
}

class NumberCallback implements Callback<number> {
  public invoke(result: number): void {
    console.info(`Processed: ${result}`);
  }
}

processData<string>('Hello', new StringCallback());

processData<number>(42, new NumberCallback());

// 异步函数使用泛型接口
async function processAsyncData<T>(data: T, callback: AsyncCallback<T>): Promise<void> {
  await callback.invoke(data);
}

class AsyncStringCallback implements AsyncCallback<string> {
  public async invoke(result: string): Promise<void> {
    console.info(`Async processed: ${result}`);
  }
}

processAsyncData<string>('Hello', new AsyncStringCallback());
// [End generic_interface_callback]

// ===== generic_interface_repository =====
// [Start generic_interface_repository]
interface Repository<T> {
  findById(id: number): T | null;
  findAll(): T[];
  save(entity: T): void;
  delete(id: number): void;
}

interface User {
  id: number;
  name: string;
  email: string;
}

class UserRepository implements Repository<User> {
  private users: User[] = [];
  
  public findById(id: number): User | null {
    return this.users.find((user: User): boolean => user.id === id) ?? null;
  }
  
  public findAll(): User[] {
    return [...this.users];
  }
  
  public save(entity: User): void {
    let existing: User | null = this.findById(entity.id);
    if (existing !== null) {
      let index = this.users.indexOf(existing);
      this.users[index] = entity;
    } else {
      this.users.push(entity);
    }
  }
  
  public delete(id: number): void {
    this.users = this.users.filter((user: User): boolean => user.id !== id);
  }
}

let userRepo = new UserRepository();

userRepo.save({ id: 1, name: 'Alice', email: 'alice@example.com' });
userRepo.save({ id: 2, name: 'Bob', email: 'bob@example.com' });

console.info(`${userRepo.findAll().length}`); // 2
console.info(`${userRepo.findById(1)?.name}`); // Alice

userRepo.delete(1);
console.info(`${userRepo.findAll().length}`); // 1
// [End generic_interface_repository]

// ===== generic_interface_default_type =====
// [Start generic_interface_default_type]
// 泛型接口的默认类型参数
interface ApiResponse<T = string> {
  data: T;
  status: number;
  message: string;
}

// 使用默认类型
let response1: ApiResponse = {
  data: 'OK',
  status: 200,
  message: 'Success'
};

// 指定具体类型
let response2: ApiResponse<string> = {
  data: 'Hello',
  status: 200,
  message: 'Success'
};

console.info(`${response1.data}`);
console.info(`${response2.data}`);

// 多类型参数的默认值
interface DefaultPair<T = string, U = number> {
  first: T;
  second: U;
}

let defaultPair1: DefaultPair = { first: 'Hello', second: 42 };
let defaultPair2: DefaultPair<number> = { first: 100, second: 200 };
let pair3: DefaultPair<number, string> = { first: 100, second: 'Hello' };

console.info(`${defaultPair1}`);
console.info(`${defaultPair2}`);
console.info(`${pair3}`);
// [End generic_interface_default_type]

// ===== generic_constraint_property =====
// [Start generic_constraint_property]
interface HasId {
  id: number;
}

interface HasName {
  name: string;
}

// 约束泛型参数必须包含id属性
function findById<T extends HasId>(items: T[], id: number): T | null {
  for (let item of items) {
    if (item.id === id) {
      return item;
    }
  }
  return null;
}

// 约束泛型参数必须包含name属性
function findByName<T extends HasName>(items: T[], name: string): T | null {
  for (let item of items) {
    if (item.name === name) {
      return item;
    }
  }
  return null;
}

interface ConstraintUser {
  id: number;
  name: string;
  email: string;
}

let users: ConstraintUser[] = [
  { id: 1, name: 'Alice', email: 'alice@example.com' },
  { id: 2, name: 'Bob', email: 'bob@example.com' },
  { id: 3, name: 'Charlie', email: 'charlie@example.com' }
];

let userById: ConstraintUser | null = findById<ConstraintUser>(users, 1);
let userByName: ConstraintUser | null = findByName<ConstraintUser>(users, 'Bob');
console.info(`${userById ? userById.name : ''}`);    // Alice
console.info(`${userByName ? userByName.id : 0}`); // 2
// [End generic_constraint_property]

// ===== generic_constraint_multiple =====
// [Start generic_constraint_multiple]
interface MultipleHasId {
  id: number;
}

interface MultipleHasName {
  name: string;
}

interface HasTimestamp {
  createdAt: Date;
  updatedAt: Date;
}

interface NamedEntity extends MultipleHasId, MultipleHasName {}

interface AuditedEntity extends MultipleHasId, MultipleHasName, HasTimestamp {}

// 多约束条件的组合
function findEntity<T extends NamedEntity>(items: T[], id: number, name: string): T | null {
  return items.find(item => item.id === id && item.name === name) || null;
}

// 三重约束
function logEntity<T extends AuditedEntity>(entity: T): void {
  console.info(`ID: ${entity.id}, Name: ${entity.name}, Created: ${entity.createdAt}`);
}

interface MultipleUser extends MultipleHasId, MultipleHasName, HasTimestamp {
  email: string;
}

let user: MultipleUser = {
  id: 1,
  name: 'Alice',
  email: 'alice@example.com',
  createdAt: new Date('2024-01-01'),
  updatedAt: new Date('2024-01-02')
};

logEntity(user);
// [End generic_constraint_multiple]

// ===== related_interfaces =====
// [Start related_interfaces]
interface Product {
  id: number;
  title: string;
  description: string;
  price: number;
  stock: number;
  category: string;
}

interface ProductSummary {
  id: number;
  title: string;
  price: number;
}

interface CreateProductRequest {
  title: string;
  description: string;
  price: number;
  stock: number;
  category: string;
}

let summary: ProductSummary = {
  id: 1,
  title: 'Laptop',
  price: 999
};

let createRequest: CreateProductRequest = {
  title: 'Smartphone',
  description: 'High-end smartphone',
  price: 599,
  stock: 100,
  category: 'Electronics'
};
// [End related_interfaces]

// ===== generic_map =====
// [Start generic_map]
interface MenuItem {
  label: string;
  path: string;
  icon?: string;
}

let menu: Map<string, MenuItem> = new Map<string, MenuItem>();
menu.set('home', { label: 'Home', path: '/', icon: 'home-icon' });
menu.set('contact', { label: 'Contact', path: '/contact' });

let home: MenuItem | undefined = menu.get('home');
if (home !== undefined) {
  console.info(`${home.label}`);
}
// [End generic_map]

// ===== readonly_user =====
// [Start readonly_user]
class ReadonlyUser {
  public readonly id: number;
  public readonly name: string;

  constructor(id: number, name: string) {
    this.id = id;
    this.name = name;
  }
}

let userUser: ReadonlyUser = new ReadonlyUser(1, 'Alice');
console.info(`${userUser.name}`);
// [End readonly_user]

// ===== partial_update_request =====
// [Start partial_update_request]
interface UpdateUserRequest {
  name?: string;
  email?: string;
  age?: number;
}

function updateUser(id: number, request: UpdateUserRequest): void {
  console.info(`Update user ${id}`);
  if (request.name !== undefined) {
    console.info(`${request.name}`);
  }
}
// [End partial_update_request]

// ===== generic_constraint_example =====
// [Start generic_constraint_example]
interface ConstraintHasId {
  id: number;
}

function constraintFindById<T extends ConstraintHasId>(items: T[], id: number): T | null {
  for (let item of items) {
    if (item.id === id) {
      return item;
    }
  }
  return null;
}
// [End generic_constraint_example]

// ===== generic_first_element =====
// [Start generic_first_element]
function first<T>(items: T[]): T | undefined {
  return items.length > 0 ? items[0] : undefined;
}

let names: string[] = ['Alice', 'Bob'];
let firstName: string | undefined = first<string>(names);
// [End generic_first_element]

// ===== generic_default_type_parameter =====
// [Start generic_default_type_parameter]
// 泛型参数默认值
interface ParamApiResponse<T = string, E = Error> {
  data: T;
  error?: E;
  status: number;
}

class CustomError extends Error {
  public code: number;
  
  constructor(message: string) {
    super(message);
    this.code = 404;
  }
}

// 使用默认类型参数
let paramResponse1: ParamApiResponse = {
  data: 'Hello',
  status: 200
};

// 指定部分类型参数
let paramResponse2: ParamApiResponse<string> = {
  data: 'Hello',
  status: 200
};

// 指定所有类型参数
let response3: ParamApiResponse<string, CustomError> = {
  data: 'Hello',
  error: new CustomError('Not found'),
  status: 404
};

console.info(`${paramResponse1.data}`);
console.info(`${paramResponse2.data}`);
console.info(`${response3.error?.message}`);
// [End generic_default_type_parameter]

// ===== generic_data_structures =====
// [Start generic_data_structures]
// 通用栈数据结构
class StructuresStack<T> {
  private items: T[] = [];
  
  push(item: T): void {
    this.items.push(item);
  }
  
  pop(): T | undefined {
    return this.items.pop();
  }
  
  peek(): T | undefined {
    return this.items[this.items.length - 1];
  }
  
  isEmpty(): boolean {
    return this.items.length === 0;
  }
  
  size(): number {
    return this.items.length;
  }
  
  clear(): void {
    this.items = [];
  }
}

let structuresNumberStack = new StructuresStack<number>();
structuresNumberStack.push(1);
structuresNumberStack.push(2);
structuresNumberStack.push(3);

console.info(`${structuresNumberStack.pop()}`);    // 3
console.info(`${structuresNumberStack.peek()}`);   // 2
console.info(`${structuresNumberStack.size()}`);   // 2

// 通用队列数据结构
class Queue<T> {
  private items: T[] = [];
  
  enqueue(item: T): void {
    this.items.push(item);
  }
  
  dequeue(): T | undefined {
    return this.items.shift();
  }
  
  front(): T | undefined {
    return this.items[0];
  }
  
  isEmpty(): boolean {
    return this.items.length === 0;
  }
  
  size(): number {
    return this.items.length;
  }
}

let stringQueue = new Queue<string>();
stringQueue.enqueue('First');
stringQueue.enqueue('Second');
stringQueue.enqueue('Third');

console.info(`${stringQueue.dequeue()}`); // First
console.info(`${stringQueue.front()}`);   // Second
console.info(`${stringQueue.size()}`);    // 2

// 通用链表数据结构
class LinkedListNode<T> {
  public value: T;
  public next: LinkedListNode<T> | null = null;
  
  constructor(value: T) {
    this.value = value;
  }
}

class LinkedList<T> {
  private head: LinkedListNode<T> | null = null;
  private tail: LinkedListNode<T> | null = null;
  private length: number = 0;
  
  append(value: T): void {
    let newNode = new LinkedListNode(value);
    
    if (!this.head) {
      this.head = newNode;
      this.tail = newNode;
    } else {
      this.tail!.next = newNode;
      this.tail = newNode;
    }
    
    this.length++;
  }
  
  prepend(value: T): void {
    let newNode = new LinkedListNode(value);
    newNode.next = this.head;
    this.head = newNode;
    
    if (!this.tail) {
      this.tail = newNode;
    }
    
    this.length++;
  }
  
  insert(index: number, value: T): void {
    if (index === 0) {
      this.prepend(value);
      return;
    }
    
    if (index >= this.length) {
      this.append(value);
      return;
    }
    
    let newNode = new LinkedListNode(value);
    let prevNode = this.getNodeAt(index - 1);
    
    if (prevNode) {
      newNode.next = prevNode.next;
      prevNode.next = newNode;
      this.length++;
    }
  }
  
  remove(index: number): T | null {
    if (index < 0 || index >= this.length) {
      return null;
    }
    
    if (index === 0) {
      let removedNode = this.head;
      this.head = this.head?.next || null;
      this.length--;
      return removedNode?.value || null;
    }
    
    let prevNode = this.getNodeAt(index - 1);
    if (prevNode && prevNode.next) {
      let removedNode = prevNode.next;
      prevNode.next = removedNode.next;
      this.length--;
      return removedNode.value;
    }
    
    return null;
  }
  
  get(index: number): T | null {
    let node = this.getNodeAt(index);
    return node?.value || null;
  }
  
  private getNodeAt(index: number): LinkedListNode<T> | null {
    if (index < 0 || index >= this.length) {
      return null;
    }
    
    let current = this.head;
    for (let i = 0; i < index; i++) {
      current = current?.next || null;
    }
    
    return current;
  }
  
  size(): number {
    return this.length;
  }
  
  isEmpty(): boolean {
    return this.length === 0;
  }
}

let linkedList = new LinkedList<number>();
linkedList.append(1);
linkedList.append(2);
linkedList.append(3);
linkedList.prepend(0);

console.info(`${linkedList.get(0)}`); // 0
console.info(`${linkedList.get(2)}`); // 2
console.info(`${linkedList.size()}`); // 4

linkedList.remove(1);
console.info(`${linkedList.size()}`); // 3
// [End generic_data_structures]

// ===== generic_array_utilities =====
// [Start generic_array_utilities]
// 通用数组工具函数
function utilitiesFirst<T>(arr: T[]): T | undefined {
  return arr[0];
}

function last<T>(arr: T[]): T | undefined {
  return arr[arr.length - 1];
}

function shuffle<T>(arr: T[]): T[] {
  let result = [...arr];
  for (let i = result.length - 1; i > 0; i--) {
    let j = Math.floor(Math.random() * (i + 1));
    let temp: T = result[i];
    result[i] = result[j];
    result[j] = temp;
  }
  return result;
}

function unique<T>(arr: T[]): T[] {
  return Array.from(new Set(arr));
}

let utilitiesNumbers: number[] = [1, 2, 3, 4, 5, 3, 2];
let utilitiesStrings: string[] = ['a', 'b', 'c', 'b', 'a'];

let firstResult: number | undefined = utilitiesFirst(utilitiesNumbers);
console.info(`${firstResult}`);  // 1

let lastResult: string | undefined = last(utilitiesStrings);
console.info(`${lastResult}`);  // a

let shuffled: number[] = shuffle(utilitiesNumbers);
console.info(`${shuffled.join(', ')}`);  // 随机打乱

let uniqueNumbers: number[] = unique(utilitiesNumbers);
console.info(`${uniqueNumbers.join(', ')}`);  // 1, 2, 3, 4, 5

let uniqueStrings: string[] = unique(utilitiesStrings);
console.info(`${uniqueStrings.join(', ')}`);  // a, b, c

interface UtilitiesUser {
  id: number;
  name: string;
  email: string;
}

let utilitiesUser: UtilitiesUser = {
  id: 1,
  name: 'Alice',
  email: 'alice@example.com'
};

// ArkTS中优先使用明确的属性访问，避免依赖keyof和索引访问类型。
function renameUser(target: UtilitiesUser, newName: string): void {
  target.name = newName;
}

console.info(`${utilitiesUser.name}`);  // Alice
renameUser(utilitiesUser, 'Bob');
console.info(`${utilitiesUser.name}`);  // Bob
// [End generic_array_utilities]

// ===== generic_ui_components =====
// [Start generic_ui_components]
// 通用列表组件
interface ListComponentProps<T> {
  items: T[];
  renderItem: (item: T, index: number) => string;
  onItemClick?: (item: T, index: number) => void;
}

class ListComponent<T> {
  private props: ListComponentProps<T>;
  
  constructor(props: ListComponentProps<T>) {
    this.props = props;
  }
  
  render(): string {
    let itemsHtml = this.props.items.map((item, index) =>
      this.props.renderItem(item, index)
    ).join('');
    
    return `<ul>${itemsHtml}</ul>`;
  }
  
  handleClick(index: number): void {
    if (this.props.onItemClick) {
      this.props.onItemClick(this.props.items[index], index);
    }
  }
}

interface ComponentsUser {
  id: number;
  name: string;
  email: string;
}

let componentsUsers: ComponentsUser[] = [
  { id: 1, name: 'Alice', email: 'alice@example.com' },
  { id: 2, name: 'Bob', email: 'bob@example.com' },
  { id: 3, name: 'Charlie', email: 'charlie@example.com' }
];

let userList = new ListComponent<ComponentsUser>({
  items: componentsUsers,
  renderItem: (user) => `<li>${user.name} (${user.email})</li>`,
  onItemClick: (user) => console.info(`Clicked: ${user.name}`)
});

console.info(`${userList.render()}`);

// 通用表格组件
interface TableColumn<T> {
  header: string;
  getValue: (row: T) => string;
}

interface TableComponentProps<T> {
  columns: TableColumn<T>[];
  data: T[];
}

class TableComponent<T> {
  private props: TableComponentProps<T>;
  
  constructor(props: TableComponentProps<T>) {
    this.props = props;
  }
  
  render(): string {
    let headerHtml = this.props.columns.map(col =>
      `<th>${col.header}</th>`
    ).join('');
    
    let bodyHtml = this.props.data.map(row => {
      let cells = this.props.columns.map(col => {
        return `<td>${col.getValue(row)}</td>`;
      }).join('');
      return `<tr>${cells}</tr>`;
    }).join('');
    
    return `<table><thead><tr>${headerHtml}</tr></thead><tbody>${bodyHtml}</tbody></table>`;
  }
}

let userTable = new TableComponent<ComponentsUser>({
  columns: [
    { header: 'ID', getValue: (row: ComponentsUser): string => row.id.toString() },
    { header: 'Name', getValue: (row: ComponentsUser): string => row.name },
    { header: 'Email', getValue: (row: ComponentsUser): string => row.email }
  ],
  data: componentsUsers
});

console.info(`${userTable.render()}`);
// [End generic_ui_components]

// ===== generic_best_practices_inference =====
// [Start generic_best_practices_inference]
function inferredIdentity<T>(value: T): T {
  return value;
}

// 推荐：让编译器自动推断类型
let result: string = inferredIdentity('Hello');

// 反例：显式指定类型（除非必要）
let inferenceResult2: string = inferredIdentity<string>('Hello');
// [End generic_best_practices_inference]

// ===== generic_best_practices_default_parameter =====
// [Start generic_best_practices_default_parameter]
// 推荐：提供默认类型参数
interface ParamApiResponse2<T = string> {
  data: T;
  status: number;
}

// 反例：每次都需要指定类型
interface ApiResponseWithoutDefault<T> {
  data: T;
  status: number;
}
// [End generic_best_practices_default_parameter]

// ===== generic_best_practices_clear_interface =====
// [Start generic_best_practices_clear_interface]
// 推荐：为更新请求声明清晰接口
interface ClearUpdateUserRequest {
  name?: string;
  email?: string;
}

let request: ClearUpdateUserRequest = {
  name: 'Alice'
};
// [End generic_best_practices_clear_interface]

let globalLogUpdate: ((msg: string, isError: boolean) => void) | undefined;

function testGenericsIntroduction(): void {
  let giNum: number = identity<number>(42);
  let giStr: string = identity<string>('Hello');
  let giBool: boolean = identity<boolean>(true);
  let logMsg = 'identity<number>(42): ' + giNum + '\nidentity<string>(Hello): ' + giStr + '\nidentity<boolean>(true): ' + String(giBool);
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testGenericClass(): void {
  let gclStack: Stack<number> = new Stack<number>();
  gclStack.push(1);
  gclStack.push(2);
  let gclPopped: number | undefined = gclStack.pop();
  let gclContainer: Container<string> = new Container<string>('Hello');
  gclContainer.setValue('World');
  let gclValue: string = gclContainer.getValue();
  let logMsg = 'Stack.pop(): ' + String(gclPopped) + '\nContainer.getValue(): ' + gclValue;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testGenericFunction(): void {
  let gfNum: number = declarationsIdentity<number>(42);
  let gfStr: string = declarationsIdentity<string>('Hello');
  let logMsg = 'identity<number>(42): ' + gfNum + '\nidentity<string>(Hello): ' + gfStr;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

function testGenericConstraint(): void {
  let gcnUsers: ConstraintUser[] = [
    { id: 1, name: 'Alice', email: 'alice@example.com' },
    { id: 2, name: 'Bob', email: 'bob@example.com' }
  ];
  let gcnFound: ConstraintUser | null = findById<ConstraintUser>(gcnUsers, 1);
  let gcnName: string = gcnFound !== null ? gcnFound.name : 'not found';
  let logMsg = 'findById(1).name: ' + gcnName;
  if (globalLogUpdate) {
    globalLogUpdate(logMsg, false);
  }
}

@Entry
@Component
struct GenericsPage {
  @State currentState: string | ResourceStr = $r('app.string.Uninitialized');
  @State logMessages: string | ResourceStr = $r('app.string.No_log_information_available');

  aboutToAppear(): void {
    globalLogUpdate = (msg, isError) => this.updateLogInfo(msg, isError);
  }

  updateLogInfo(msg: string, isError: boolean): void {
    const timestamp = new Date().toLocaleTimeString();
    const prefix = isError ? '[ERROR]' : '[INFO]';
    this.logMessages = `[${timestamp}] ${prefix} ${msg}`;
  }

  build() {
    Scroll() {
      Column() {
        Column() {
          Text($r('app.string.Realtime_status_information'))
            .fontSize(18)
            .fontWeight(600)
            .margin({ bottom: 12 })

          Column() {
            Text($r('app.string.Current_status'))
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Text(this.currentState)
              .fontSize(14)
              .fontColor('#007DFF')
              .width('100%')
              .padding(10)
              .backgroundColor('#F0F0F0')
              .borderRadius(8)
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 12 })

          Column() {
            Text($r('app.string.Log_information'))
              .fontSize(14)
              .fontWeight(600)
              .margin({ bottom: 8 })
            Scroll() {
              Text(this.logMessages)
                .fontSize(12)
                .fontColor('#52C41A')
                .width('100%')
                .padding(10)
                .backgroundColor('#F0F0F0')
                .borderRadius(8)
            }
            .width('100%')
          }
          .width('100%')
          .alignItems(HorizontalAlign.Start)
          .margin({ bottom: 10 })
        }
        .width('100%')
        .padding(18)
        .backgroundColor(Color.White)
        .borderRadius(8)
        .margin({ bottom: 16 })

        Column() {
          Text($r('app.string.Test_Generics_Introduction')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testGenericsIntroduction();
          this.currentState = $r('app.string.Test_Generics_Introduction_finish');
        })

        Column() {
          Text($r('app.string.Test_Generics_Class')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testGenericClass();
          this.currentState = $r('app.string.Test_Generics_Class_finish');
        })

        Column() {
          Text($r('app.string.Test_Generics_Function')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testGenericFunction();
          this.currentState = $r('app.string.Test_Generics_Function_finish');
        })

        Column() {
          Text($r('app.string.Test_Generics_Constraint')).fontColor(Color.Black).fontSize(14);
        }
        .backgroundColor(Color.White)
        .borderRadius(20)
        .width('90%')
        .height(32)
        .justifyContent(FlexAlign.Center)
        .margin({ bottom: 12 })
        .onClick(() => {
          testGenericConstraint();
          this.currentState = $r('app.string.Test_Generics_Constraint_finish');
        })
      }
      .height('100%')
      .width('100%')
      .backgroundColor('#F1F3F5')
      .padding(16);
    }
  }
}


// ===== keyof_alternative =====
// [Start keyof_alternative]
interface KeyofPoint {
  x: number;
  y: number;
}

function keyofGetX(p: KeyofPoint): number {
  return p.x;
}

function keyofGetY(p: KeyofPoint): number {
  return p.y;
}

let keyofPt: KeyofPoint = { x: 10, y: 20 };
console.info(`${keyofGetX(keyofPt).toString()}`);  // 10
console.info(`${keyofGetY(keyofPt).toString()}`);  // 20
// [End keyof_alternative]

// ===== typeof_alternative =====
// [Start typeof_alternative]
interface TypeofConfig {
  url: string;
  timeout: number;
}

let typeofConfig: TypeofConfig = {
  url: 'EXAMPLE_CONFIG_URL',
  timeout: 5000
};

console.info(`${typeofConfig.url}`);
console.info(`${typeofConfig.timeout.toString()}`);
// [End typeof_alternative]

// ===== indexed_access_alternative =====
// [Start indexed_access_alternative]
interface IndexedAccessPerson {
  name: string;
  age: number;
  alive: boolean;
}

let iaPersonName: string = 'Alice';
let iaPersonAge: number = 30;
let iaPersonAlive: boolean = true;

console.info(`${iaPersonName}`);
console.info(`${iaPersonAge.toString()}`);
console.info(`${iaPersonAlive.toString()}`);
// [End indexed_access_alternative]

// ===== conditional_type_alternative =====
// [Start conditional_type_alternative]
function formatCondValue(value: string): string;
function formatCondValue(value: number): string;
function formatCondValue(value: string | number): string {
  if (typeof value === 'string') {
    return value.toUpperCase();
  }
  return value.toFixed(2);
}

let condS: string = formatCondValue('hello');
let condN: string = formatCondValue(42);
console.info(`${condS}`);  // HELLO
console.info(`${condN}`);  // 42.00
// [End conditional_type_alternative]

// ===== mapped_type_alternative =====
// [Start mapped_type_alternative]
interface MappedReadonlyUser {
  readonly id: number;
  readonly name: string;
}

interface MappedPartialUser {
  name?: string;
  age?: number;
  email?: string;
}

interface MappedUserGetters {
  getName(): string;
  getAge(): number;
}

class MappedUser implements MappedUserGetters {
  public name: string = '';
  public age: number = 0;

  getName(): string {
    return this.name;
  }

  getAge(): number {
    return this.age;
  }
}
// [End mapped_type_alternative]

// ===== exclude_alternative =====
// [Start exclude_alternative]
type ExcludeAllTypes = 'a' | 'b' | 'c';
type ExcludeFiltered = 'a' | 'b';

let excludeValue: ExcludeFiltered = 'a';
console.info(`${excludeValue}`);
// [End exclude_alternative]

// ===== nonnullable_alternative =====
// [Start nonnullable_alternative]
let nnValue: string = 'hello';
console.info(`${nnValue}`);
// [End nonnullable_alternative]

// ===== params_return_alternative =====
// [Start params_return_alternative]
function prArkFunc(s: string): number {
  return s.length;
}

let prParam: string = 'hello';
let prResult: number = prArkFunc(prParam);
console.info(`${prResult.toString()}`);  // 5
// [End params_return_alternative]

// ===== awaited_alternative =====
// [Start awaited_alternative]
async function awaitedGetData(): Promise<string> {
  return 'hello';
}

async function awaitedMain(): Promise<void> {
  let data: string = await awaitedGetData();
  console.info(`${data}`);  // hello
}

awaitedMain();
// [End awaited_alternative]


// ===== variance_annotations =====
// [Start variance_annotations]
interface VaConsumer<in T> { consume: (arg: T) => void; }
interface VaProducer<out T> { make(): T; }
interface VaProducerConsumer<in out T> { consume: (arg: T) => void; make(): T; }
// [End variance_annotations]

// ===== ctor_params_instance_alternative =====
// [Start ctor_params_instance_alternative]
class CpaPoint {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

let cpaParams: number[] = [3, 4];
let cpaInstance: CpaPoint = new CpaPoint(cpaParams[0], cpaParams[1]);
console.info(`${cpaInstance.x}, ${cpaInstance.y}`); // 3, 4
// [End ctor_params_instance_alternative]

// ===== string_method_alternative =====
// [Start string_method_alternative]
let smUpperStr: string = 'hello'.toUpperCase();
let smLowerStr: string = 'WORLD'.toLowerCase();
console.info(`${smUpperStr}`); // HELLO
console.info(`${smLowerStr}`); // world
// [End string_method_alternative]

// ===== thistype_alternative =====
// [Start thistype_alternative]
class ThContext {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  greet(): string {
    return this.name;
  }
}

let thCtx: ThContext = new ThContext('Alice');
console.info(`${thCtx.greet()}`); // Alice
// [End thistype_alternative]

// ===== generic_api_client =====
// [Start generic_api_client]
interface ClientApiResponse<T> {
  data: T;
  status: number;
  message: string;
}

class ApiClient {
  private baseUrl: string;

  constructor(baseUrl: string) {
    this.baseUrl = baseUrl;
  }

  async get<T>(endpoint: string): Promise<ClientApiResponse<T>> {
    let url: string = `${this.baseUrl}${endpoint}`;
    let result: string = await this.mockRequest(url);
    let data: T = JSON.parse(result) as T;
    return { data: data, status: 200, message: 'Success' };
  }

  async post<T, U>(endpoint: string, body: T): Promise<ClientApiResponse<U>> {
    let url: string = `${this.baseUrl}${endpoint}`;
    let result: string = await this.mockRequest(url);
    let data: U = JSON.parse(result) as U;
    return { data: data, status: 200, message: 'Success' };
  }

  private mockRequest(url: string): Promise<string> {
    return new Promise<string>((resolve: (value: string) => void): void => {
      setTimeout(() => {
        resolve(JSON.stringify({ id: 1, name: 'Alice', email: 'alice@example.com' }));
      }, 100);
    });
  }
}

interface ClientUser {
  id: number;
  name: string;
  email: string;
}

interface CreateUserRequest {
  name: string;
  email: string;
}

let gacClient: ApiClient = new ApiClient('EXAMPLE_API_URL');

async function gacFetchUser(id: number): Promise<void> {
  try {
    let response: ClientApiResponse<ClientUser> = await gacClient.get<ClientUser>(`/users/${id}`);
    console.info(`${response.data.name}`); // Alice
  } catch (error) {
    console.error(`Error: ${(error as Error).message}`);
  }
}

async function gacCreateUser(name: string, email: string): Promise<void> {
  try {
    let request: CreateUserRequest = { name: name, email: email };
    let response: ClientApiResponse<ClientUser> = await gacClient.post<CreateUserRequest, ClientUser>('/users', request);
    console.info(`${response.data.id}`); // 1
  } catch (error) {
    console.error(`Error: ${(error as Error).message}`);
  }
}

gacFetchUser(1);
gacCreateUser('Alice', 'alice@example.com');
// [End generic_api_client]

// ===== generic_nested_types =====
// [Start generic_nested_types]
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
// [End generic_nested_types]
