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

// [Start ts_instance_vs_static_methods]
class MathOperations {
  // 实例方法：通过实例调用，访问实例属性
  public instanceValue: number = 0;

  addInstanceValue(n: number): void {
    this.instanceValue += n;  // 使用this
  }

  getInstanceValue(): number {
    return this.instanceValue;  // 访问实例属性
  }

  // 静态方法：通过类名调用，访问静态属性
  static add(a: number, b: number): number {
    return a + b;  // 不使用this
  }

  static multiply(a: number, b: number): number {
    return a * b;
  }

  public static description: string = 'Math Operations';

  static getDescription(): string {
    return MathOperations.description;  // 通过类名访问
  }
}

let math: MathOperations = new MathOperations();

// 实例方法：通过实例调用
math.addInstanceValue(10);
console.info(`${math.getInstanceValue()}`);  // 10

// 静态方法：通过类名调用
console.info(`${MathOperations.add(5, 3)}`);    // 8
console.info(`${MathOperations.multiply(4, 7)}`); // 28

// 静态方法无法访问实例属性
let result = MathOperations.getInstanceValue();  // 编译错误
// [End ts_instance_vs_static_methods]

// [Start ts_method_access_modifiers]
class Service {
  // public：公开方法
  public start(): void {
    console.info(`Service started`);
    this.initialize();
  }

  // private：私有方法，仅类内部
  private initialize(): void {
    console.info(`Initializing...`);
    this.loadConfig();
  }

  // protected：受保护方法，子类可访问
  protected loadConfig(): void {
    console.info(`Loading configuration`);
  }

  // 公开方法调用私有方法
  public stop(): void {
    this.cleanup();
    console.info(`Service stopped`);
  }

  private cleanup(): void {
    console.info(`Cleaning up resources`);
  }
}

let service: Service = new Service();

// public方法可调用
service.start();  // Service started, Initializing..., Loading config
service.stop();   // Cleaning up..., Service stopped

// private方法不可访问
service.initialize();  // 编译错误

// protected方法不可访问
service.loadConfig();  // 编译错误

// 子类访问protected方法
class CustomService extends Service {
  configure(): void {
    this.loadConfig();  // 可访问protected
  }
}
// [End ts_method_access_modifiers]

// [Start ts_static_method_declaration]
class Utility {
  // 静态属性
  public static version: string = '1.0.0';

  // 静态方法声明
  static clamp(value: number, min: number, max: number): number {
    return Math.max(min, Math.min(max, value));
  }

  static formatCurrency(amount: number): string {
    return '$' + amount.toFixed(2);
  }

  static generateId(): string {
    return `ID-${Date.now()}`;
  }

  // 静态方法访问静态属性
  static getVersion(): string {
    return Utility.version;
  }

  // 静态方法不能访问实例属性
  static getInstanceValue(): number {
    return this.instanceValue;  // 编译错误
  }
}

// 静态方法通过类名调用
console.info(`${Utility.clamp(15, 0, 10)}`);      // 10
console.info(`${Utility.formatCurrency(123.456)}`); // $123.46
console.info(`${Utility.generateId()}`);          // ID-1234567890
console.info(`${Utility.getVersion()}`);           // 1.0.0

// 实例无法直接调用静态方法
let utility: Utility = new Utility();
utility.clamp(5, 0, 10);  // 编译错误
// [End ts_static_method_declaration]

// [Start ts_method_inheritance]
class Parent {
  // 实例方法：继承
  greet(): void {
    console.info(`Hello from Parent`);
  }

  // 静态方法：继承
  static getDescription(): string {
    return 'Parent class';
  }

  // protected方法：子类可访问
  protected internalMethod(): void {
    console.info(`Internal method`);
  }
}

class Child extends Parent {
  // 继承父类的实例方法
  callParentGreet(): void {
    this.greet();  // 继承的实例方法
  }

  // 继承父类的静态方法
  static getParentDescription(): string {
    return Parent.getDescription();  // 继承的静态方法
  }

  // 访问父类的protected方法
  callInternal(): void {
    this.internalMethod();  // 可访问
  }
}

let child: Child = new Child();

child.greet();              // 'Hello from Parent'（继承）
child.callParentGreet();    // 'Hello from Parent'
console.info(`${Parent.getDescription()}`);  // 'Parent class'
console.info(`${Child.getDescription()}`);   // 'Parent class'（继承）
child.callInternal();       // 'Internal method'

// 注意：静态方法不能通过实例访问
child.getDescription();  // 编译错误
// [End ts_method_inheritance]

// [Start ts_override_access_modifiers]
class Base {
  // public方法
  public publicMethod(): void {
    console.info(`Base public`);
  }

  // protected方法
  protected protectedMethod(): void {
    console.info(`Base protected`);
  }

  // private方法（不能重写）
  private privateMethod(): void {
    console.info(`Base private`);
  }

  protected loweredPublicMethod(): void {}
}

class Derived extends Base {
  // 重写public方法：保持public
  public publicMethod(): void {
    console.info(`Derived public`);
  }

  // 重写protected方法：可保持protected或改为public
  public protectedMethod(): void {
    console.info(`Derived public (was protected)`);
  }

  // 不能重写private方法
  private privateMethod(): void {}  // 编译错误

  // 不能降低访问权限
  private loweredPublicMethod(): void {}  // 编译错误：不能从protected改为private

  callProtected(): void {
    this.protectedMethod();  // 可访问父类protected
  }
}

let derived: Derived = new Derived();
derived.publicMethod();        // 'Derived public'
derived.protectedMethod();     // 'Derived public (was protected)'
derived.callProtected();       // 'Base protected'
// [End ts_override_access_modifiers]

// [Start ts_static_method_usage_patterns]
class Database {
  private static connectionCount: number = 0;

  // 静态方法：管理连接
  static connect(): void {
    Database.connectionCount++;
    console.info(`Connected. Total: ${Database.connectionCount}`);
  }

  static disconnect(): void {
    if (Database.connectionCount > 0) {
      Database.connectionCount--;
    }
    console.info(`Disconnected. Total: ${Database.connectionCount}`);
  }

  static getConnectionCount(): number {
    return Database.connectionCount;
  }

  // 静态工厂方法
  static createConnection(): Database {
    Database.connect();
    return new Database();
  }
}

// 通过类名调用静态方法
Database.connect();      // Connected. Total: 1
Database.connect();      // Connected. Total: 2
console.info(`${Database.getConnectionCount()}`);  // 2

Database.disconnect();   // Disconnected. Total: 1
console.info(`${Database.getConnectionCount()}`);  // 1

// 静态工厂方法
let db1: Database = Database.createConnection();
let db2: Database = Database.createConnection();
console.info(`${Database.getConnectionCount()}`);  // 3

// 实例无法调用静态方法
db1.connect();  // 编译错误
// [End ts_static_method_usage_patterns]


// [Start ts_this_type_guard]
// TypeScript的this is T类型守卫，ArkTS不支持（arkts-no-is）
class TsFileSystemObject {
  isFile(): this is TsFileRep {
    return this instanceof TsFileRep;
  }
}

class TsFileRep extends TsFileSystemObject {
  public content: string = '';
}

let tsFsObj: TsFileSystemObject = new TsFileRep();
if (tsFsObj.isFile()) {
  console.info(`${tsFsObj.content}`); // TypeScript通过类型守卫收窄为TsFileRep
}
// [End ts_this_type_guard]

// ===== ts_this_usage_limitation =====
// [Start ts_this_usage_limitation]
class TsThisLimitA {
  public n: number = 0;
  f1(arg1: this) {} // 编译错误：不支持this类型（arkts-no-typing-with-this）
  static f2(arg1: number): void {
    this.n = arg1;  // 编译错误：不支持在静态方法中使用this
  }
}

function foo(arg1: number) {
  this.n = arg1;    // 编译错误：不支持在函数中使用this
}
// [End ts_this_usage_limitation]

// ===== ts_special_static_names =====
// [Start ts_special_static_names]
class TsSsnConfig {
  static version: string = '1.0';

  static name: string = 'Config';  // 编译错误：与Function.name冲突
  static length: number = 0;       // 编译错误：与Function.length冲突

  static getConfigName(): string {
    return 'Config';
  }
}

console.info(`${TsSsnConfig.version}`);
console.info(`${TsSsnConfig.getConfigName()}`);
// [End ts_special_static_names]
