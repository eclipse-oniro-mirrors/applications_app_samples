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

// [Start ts_function_types]
// 函数类型定义
type MathOperation = (a: number, b: number) => number;

let add: MathOperation = (a: number, b: number): number => {
  return a + b;
};

let subtract: MathOperation = (a: number, b: number): number => {
  return a - b;
};

let multiply: MathOperation = (a: number, b: number): number => {
  return a * b;
};

// 函数类型必须匹配参数和返回值
type GreetingFunction = (name: string) => string;

let greet: GreetingFunction = (name: string): string => {
  return `Hello, ${name}`;
};

// 不匹配的类型会编译错误
let invalid: MathOperation = (a: string) => a; // 编译错误
// [End ts_function_types]

// [Start ts_optional_chaining_use_cases]
// 事件处理器
interface EventEmitter {
  emit?: (event: string) => void;
}

let emitter: EventEmitter | null = getEmitter();

function trigger(event: string): void {
  emitter?.emit?.(event);
}

function getEmitter(): EventEmitter | null {
  return null;
}

// 配置回调
interface Config {
  onSuccess?: (data: string) => void;
  onError?: (error: Error) => void;
}

function processWithCallbacks(config: Config): void {
  let result: string = 'data';
  config.onSuccess?.(result);

  // 或错误情况
  let error: Error = new Error('Failed');
  config.onError?.(error);
}

// 可选链式调用
interface Chain {
  next?: Chain;
  execute?: () => void;
}

let chain: Chain | null = { next: { execute: () => console.info(`Executed`) } };

chain?.next?.execute?.();  // 执行

// API响应处理
interface APIResponseData {
  items?: string[];
}

interface APIResponse {
  data?: APIResponseData;
  callback?: () => void;
}

let response: APIResponse | null = null;

response?.callback?.();  // 不执行
response?.data?.items?.forEach?.(item => console.info(`${item}`));
// [End ts_optional_chaining_use_cases]

// ===== ts_nested_function_declaration =====
// [Start ts_nested_function_declaration]
function addNum(a: number, b: number): void {
  function logToConsole(message: string): void {
    console.info(`${message}`);
  }

  let result: number = a + b;
  logToConsole('result is ' + result);
}
// [End ts_nested_function_declaration]

// ===== ts_optional_chaining_function_call =====
// [Start ts_optional_chaining_function_call]
// 可选调用函数
let callback: (() => void) | null = null;

callback?.();  // 不执行（callback为null）

callback = () => console.info(`Called`);
callback?.();  // 执行，输出 "Called"

// 方法可选调用
let service: Service | null = null;

service?.processData?.();  // 不执行

interface Service {
  processData?: () => void;
}

service = { processData: () => console.info(`Processing`) };
service?.processData?.();  // 执行

// 回调可选调用
function triggerEvent(callback?: () => void): void {
  callback?.();  // 安全调用
}

triggerEvent();  // 无回调，不执行
triggerEvent(() => console.info(`Event triggered`));  // 执行回调

// 对象方法可选调用
let handler: { onClick?: () => void } | null = null;

handler?.onClick?.();  // 不执行

handler = { onClick: () => console.info(`Clicked`) };
handler?.onClick?.();  // 执行
// [End ts_optional_chaining_function_call]

// [Start ts_call_signature]
// TypeScript对照写法，ArkTS中用接口分离属性和方法
type DescribableFunction = {
  description: string;
  (someArg: number): boolean;
};
// [End ts_call_signature]

// [Start ts_construct_signature]
// TypeScript构造签名，ArkTS不支持（arkts-no-ctor-signatures-type）
class SomeObject {
  public value: string;
  constructor(s: string) {
    this.value = s;
  }
}

type SomeConstructor = {
  new (s: string): SomeObject;
};

function createSomeInstance(ctor: SomeConstructor, s: string): SomeObject {
  return new ctor(s);
}

let someObj: SomeObject = createSomeInstance(SomeObject, 'hello');
console.info(`${someObj.value}`); // hello
// [End ts_construct_signature]

// [Start construct_signature_alternative]
class CtorPoint {
  public x: number;
  public y: number;

  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

function createCtorPoint(ctor: new (x: number, y: number) => CtorPoint, x: number, y: number): CtorPoint {
  return new ctor(x, y);
}

let ctorP: CtorPoint = createCtorPoint(CtorPoint, 3, 4);
console.info(`${ctorP.x}, ${ctorP.y}`);  // 3, 4
// [End construct_signature_alternative]
