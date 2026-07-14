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

// [Start ts_super_call_rules]
class Vehicle {
  public brand: string;

  constructor(brand: string) {
    this.brand = brand;
    console.info(`Vehicle constructor`);
  }
}

class Car extends Vehicle {
  public model: string;

  constructor(brand: string, model: string) {
    super(brand);  // 必须先调用super()
    this.model = model;
    console.info(`Car constructor`);
  }

  getInfo(): string {
    return `${this.brand} ${this.model}`;
  }
}

let car: Car = new Car('Toyota', 'Camry');
// 输出：'Vehicle constructor', 'Car constructor'

// super() 规则：
// 1. 子类构造函数必须调用super()
// 2. super() 必须在第一行
// 3. super() 参数匹配父类构造函数

class InvalidChild extends Vehicle {
  public model: string;

  constructor(brand: string, model: string) {
    this.model = model;  // 编译错误：super() 未调用

    super(brand);  // 必须在访问this之前

    this.model = model;  // 正确
  }
}
// [End ts_super_call_rules]

// [Start ts_super_call_scenarios]
// 必须调用super() 的场景：

// 1. 父类有构造函数（无论是否有参数）
class RequiredParent {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }
}

class RequiredChild extends RequiredParent {
  public age: number;

  constructor(name: string, age: number) {
    super(name);  // 必须
    this.age = age;
  }
}

// 2. 所有继承子类（除非父类无显式构造函数）
class ImplicitParent {
  public value: number = 10;
  // 无显式构造函数
}

class ImplicitChild extends ImplicitParent {
  public extra: number = 20;

  constructor() {
    super();  // 自动调用（可省略）
  }
}

// 调用时机：必须在访问this之前
class TimingParent {
  constructor() {}
}

class TimingChild extends TimingParent {
  public value: number;

  constructor() {
    console.info(`${this.value}`);  // 编译错误

    super();  // 必须先调用

    this.value = 10;  // 正确
    console.info(`${this.value}`);  // 正确
  }
}
// [End ts_super_call_scenarios]

// [Start ts_readonly_initialization_rules]
class ReadOnlyProperties {
  // readonly属性：声明时赋值
  public readonly constant1: number = 100;

  // readonly属性：构造函数中赋值
  public readonly constant2: number;

  // readonly + 可选
  public readonly optionalConstant?: number;

  constructor(value: number) {
    this.constant2 = value;  // 构造函数中可赋值
    this.optionalConstant = value * 2;
  }

  // 方法中不能修改readonly属性
  modifyConstant(): void {
    this.constant2 = 200;  // 编译错误
  }
}

let readOnly: ReadOnlyProperties = new ReadOnlyProperties(50);
console.info(`${readOnly.constant1}`);         // 100
console.info(`${readOnly.constant2}`);         // 50
console.info(`${readOnly.optionalConstant}`);  // 100
// [End ts_readonly_initialization_rules]

// [Start ts_immutable_config_readonly]
class ImmutableConfig {
  public readonly apiUrl: string;
  public readonly timeout: number;
  public readonly debug: boolean;

  constructor(apiUrl: string, timeout: number, debug: boolean = false) {
    // 构造函数中初始化readonly
    this.apiUrl = apiUrl;
    this.timeout = timeout;
    this.debug = debug;
  }

  // readonly属性不可修改
  updateUrl(url: string): void {
    this.apiUrl = url;  // 编译错误
  }

  // 创建新实例而非修改
  withUrl(newUrl: string): ImmutableConfig {
    return new ImmutableConfig(newUrl, this.timeout, this.debug);
  }
}
// [End ts_immutable_config_readonly]

// ===== ts_required_properties_initialization =====
// [Start ts_required_properties_initialization]
class StrictInitialization {
  // 必需属性：必须初始化
  public name: string;  // 编译警告：未初始化
  public age: number;   // 编译警告：未初始化
  
  constructor() {
    // 未初始化name和age
    // TypeScript会提示警告
  }
  
  // 正确做法：初始化所有属性
  correctConstructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}

class ProperInitialization {
  // 声明时初始化
  public name: string = '';
  public age: number = 0;
  
  constructor() {
    // 属性已初始化
  }
}

class OptionalInitialization {
  // 可选属性：可不初始化
  public name?: string;
  public age?: number;
  
  constructor() {
    // 可选属性允许未初始化
  }
  
  initialize(name: string, age: number): void {
    this.name = name;
    this.age = age;
  }
}
// [End ts_required_properties_initialization]
