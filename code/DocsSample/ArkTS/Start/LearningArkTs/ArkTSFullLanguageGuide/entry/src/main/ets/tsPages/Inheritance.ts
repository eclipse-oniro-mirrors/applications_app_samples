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

// [Start ts_single_inheritance_limitation]
// ArkTS只支持单继承：一个子类只能有一个父类
class ParentA {
  methodA(): void {
    console.info(`Method A`);
  }
}

class ParentB {
  methodB(): void {
    console.info(`Method B`);
  }
}

// 不能同时继承ParentB
class ErrorChild extends ParentA, ParentB {}  // 编译错误

// 单继承：只能继承一个父类
class Child extends ParentA {
  // 可以继承ParentA
  methodA(): void {
    super.methodA();
    console.info(`Child overrides Method A`);
  }
}

let child: Child = new Child();
child.methodA();  // 'Method A', 'Child overrides Method A'
// [End ts_single_inheritance_limitation]

// [Start ts_access_modifier_inheritance]
class Parent {
  // 实例属性
  public publicValue: string = 'public';
  protected protectedValue: string = 'protected';

  // 实例方法
  public publicMethod(): void {
    console.info(`Public method`);
  }

  protected protectedMethod(): void {
    console.info(`Protected method`);
  }

  private privateMethod(): void {
    console.info(`Private method`);
  }

  // 访问私有方法的公开方法
  callPrivate(): void {
    this.privateMethod();
  }
}

class AccessChildTest extends Parent {
  // 继承public属性和方法
  testPublic(): void {
    console.info(`${this.publicValue}`);    // 可访问
    this.publicMethod();               // 可访问
  }

  // 继承protected属性和方法
  testProtected(): void {
    console.info(`${this.protectedValue}`); // 可访问
    this.protectedMethod();            // 可访问
  }

  // 无法继承private属性和方法
  testPrivate(): void {
    this.privateMethod();  // 编译错误
    this.callPrivate();       // 通过公开方法访问
  }
}

let accessChild: AccessChildTest = new AccessChildTest();

accessChild.testPublic();     // 'public', 'Public method'
accessChild.testProtected();  // 'protected', 'Protected method'
accessChild.testPrivate();    // 'Private method'
// [End ts_access_modifier_inheritance]

// [Start ts_access_permission_rules]
class AccessBase {
  public publicProp: string = 'public';
  protected protectedProp: string = 'protected';
  private privateProp: string = 'private';

  public publicMethod(): void {}
  protected protectedMethod(): void {}
  private privateMethod(): void {}

  // 访问所有属性
  accessAll(): void {
    console.info(`${this.publicProp}`);
    console.info(`${this.protectedProp}`);
    console.info(`${this.privateProp}`);
    this.publicMethod();
    this.protectedMethod();
    this.privateMethod();
  }
}

class AccessChild extends AccessBase {
  // 子类访问规则
  testAccess(): void {
    // public：可访问
    console.info(`${this.publicProp}`);
    this.publicMethod();

    // protected：可访问
    console.info(`${this.protectedProp}`);
    this.protectedMethod();

    // private：不可访问
    console.info(`${this.privateProp}`);  // 编译错误
    this.privateMethod();           // 编译错误
  }

  // 通过父类公开方法访问私有成员
  usePrivate(): void {
    this.accessAll();  // 调用父类方法
  }
}

// 外部访问规则
let permChild: AccessChild = new AccessChild();

// public：外部可访问
console.info(`${permChild.publicProp}`);    // 'public'
permChild.publicMethod();

// protected：外部不可访问
console.info(`${permChild.protectedProp}`);  // 编译错误
permChild.protectedMethod();           // 编译错误

// private：外部不可访问
console.info(`${permChild.privateProp}`);   // 编译错误

// 访问权限总结：
// public：无限制访问
// protected：类及子类访问
// private：仅类内部访问
// [End ts_access_permission_rules]

// [Start ts_override_access_permission]
class AccessParent {
  // public方法
  public publicMethod(): void {
    console.info(`Parent public`);
  }

  // protected方法
  protected protectedMethod(): void {
    console.info(`Parent protected`);
  }

  // public方法（演示降低访问权限）
  public loweredAccessMethod(): void {}

  // private方法（子类不可见，不能重写）
  private privateMethod(): void {}
}

class OverrideAccessChild extends AccessParent {
  // 重写public方法：必须保持public
  public publicMethod(): void {
    console.info(`Child public`);
  }

  // 重写protected方法：可保持protected或改为public
  public protectedMethod(): void {
    console.info(`Child public (was protected)`);
  }

  // 不能降低访问权限
  protected loweredAccessMethod(): void {}  // 编译错误：不能从public改为protected

  // 不能重写private方法（因为无法访问）
  privateMethod(): void {}  // 编译错误：父类方法不可见
}

let overrideChild: OverrideAccessChild = new OverrideAccessChild();

overrideChild.publicMethod();     // 'Child public'
overrideChild.protectedMethod();  // 'Child public (was protected)'
// [End ts_override_access_permission]

// [Start ts_private_member_restriction]
class SecretBase {
  private secretKey: string = 'secret';
  private privateKey: number = 123;

  private privateMethod(): void {
    console.info(`Private method in base`);
  }

  // 私有方法使用内部逻辑
  private internalProcess(): void {
    console.info(`Internal processing`);
  }

  // 公开接口访问私有成员
  getSecretKey(): string {
    return this.secretKey;
  }

  setSecretKey(key: string): void {
    if (key.length > 5) {
      this.secretKey = key;
    }
  }
}

class SecretChild extends SecretBase {
  // 无法访问父类私有成员
  attemptAccess(): void {
    console.info(`${this.secretKey}`);      // 编译错误
    console.info(`${this.privateKey}`);     // 编译错误
    this.privateMethod();              // 编译错误
    this.internalProcess();            // 编译错误

    // 通过公开接口访问
    console.info(`${this.getSecretKey()}`);  // 可访问
  }

  // 无法重写父类私有方法
  privateMethod(): void {}  // 编译错误

  // 可以定义同名私有方法（独立）
  private childPrivateKey: number = 456;  // 子类自己的私有属性
}

let secret: SecretChild = new SecretChild();
console.info(`${secret.getSecretKey()}`);  // secret
secret.setSecretKey('newsecretkey');
console.info(`${secret.getSecretKey()}`);  // newsecretkey
// [End ts_private_member_restriction]

// [Start ts_method_signature_match]
class NumberProcessor {
  process(value: number): number {
    return value * 2;
  }

  convert(input: string): number {
    return Number.parseInt(input, 10);
  }
}

class AdvancedProcessor extends NumberProcessor {
  // 参数和返回值必须完全匹配
  process(value: number): number {
    return value * 3;  // 返回值类型相同
  }

  // 返回值兼容（子类返回类型可以是父类返回值的子类型）
  convert(input: string): number {
    let result: number = super.convert(input);
    return result * 10;
  }

  // 不能改变参数类型
  process(value: string): number {}  // 编译错误

  // 不能改变参数数量
  process(value: number, extra: number): number {}  // 编译错误

  // 不能改变返回类型为不兼容类型
  process(value: number): string {}  // 编译错误
}

let processor: AdvancedProcessor = new AdvancedProcessor();

console.info(`${processor.process(5).toString()}`);      // 15
console.info(`${processor.convert('10').toString()}`);   // 100

// 父类引用指向子类实例
let baseProcessor: NumberProcessor = new AdvancedProcessor();
console.info(`${baseProcessor.process(5).toString()}`);  // 15（调用子类重写方法）
// [End ts_method_signature_match]

// [Start ts_super_usage_limitation]
class SuperBase {
  public value: number = 10;

  method(): void {
    console.info(`Base method`);
  }

  static staticMethod(): void {
    console.info(`Base static method`);
  }
}

class SuperChild extends SuperBase {
  public value: number = 20;

  method(): void {
    // super调用父类方法
    super.method();  // 正确

    // super不能直接访问父类实例属性
    console.info(`${super.value}`);  // 运行时为undefined，应使用this访问

    // 应使用this或父类名访问属性
    console.info(`${this.value}`);          // 20（子类属性）
    console.info(`${SuperChild.prototype.value}`); // 反例：父类属性
  }

  anotherMethod(): void {
    // super只能调用方法
    super.method();

    // 不能用于其他场景
    let base: SuperBase = super;  // 编译错误
    return super;  // 编译错误
  }

  static childStaticMethod(): void {
    // 静态方法中使用super调用父类静态方法
    super.staticMethod();

    // 也可使用类名调用
    SuperBase.staticMethod();
  }

  constructor() {
    super();  // 构造函数中使用super() 调用父类构造
  }
}
// [End ts_super_usage_limitation]

// [Start ts_super_mandatory_call]
// 必须调用super() 的场景：

// 1. 父类有构造函数（无默认构造函数）
class StrictParent {
  public id: number;

  constructor(id: number) {
    this.id = id;
  }
}

class StrictChild extends StrictParent {
  // 必须调用super(id)
  constructor(id: number, name: string) {
    super(id);  // 必须调用
    this.name = name;
  }

  public name: string;
}

// 2. 父类构造函数有必需参数
class ParameterParent {
  constructor(required: string) {}
}

class ParameterChild extends ParameterParent {
  constructor(required: string, optional?: string) {
    super(required);  // 必须传递必需参数
  }
}

// 3. 所有子类构造函数都必须显式调用super()
class BaseClass {
  // 无参数构造函数
  constructor() {}
}

class DerivedClass extends BaseClass {
  constructor() {
    super();  // 即使父类无参数，也必须显式调用
  }
}

// 调用时机：
// super() 必须在访问this之前
class TimingChild extends StrictParent {
  public name: string;

  constructor(id: number, name: string) {
    console.info(`${this.name}`);  // 编译错误：super() 未调用

    super(id);  // 必须先调用super()

    // super() 后可访问this
    this.name = name;
    console.info(`${this.name}`);  // 正确
  }
}
// [End ts_super_mandatory_call]

// [Start ts_class_inheritance_essence]
// 原型继承（传统方式），ArkTS不支持prototype赋值和function表达式
function animalProto(name: string) {
  this.name = name;
}

animalProto.prototype.speak = function(): void {
  console.info(`${this.name} speaks`);
};

function dogProto(name: string, breed: string) {
  animalProto.call(this, name);
  this.breed = breed;
}

dogProto.prototype = Object.create(animalProto.prototype);
dogProto.prototype.constructor = dogProto;

dogProto.prototype.bark = function(): void {
  console.info(`${this.name} barks`);
};

let dogProtoInstance = new dogProto('Max', 'Labrador');
dogProtoInstance.speak();
dogProtoInstance.bark();
// [End ts_class_inheritance_essence]

// [Start ts_abstract_class_usage]
// 抽象类定义：不能实例化，只能继承
abstract class Animal {
  public name: string;

  constructor(name: string) {
    this.name = name;
  }

  // 抽象方法：子类必须实现
  abstract speak(): void;

  // 具体方法：子类可继承
  move(): void {
    console.info(`${this.name} is moving`);
  }

  // 具体方法：提供默认实现
  sleep(): void {
    console.info(`${this.name} is sleeping`);
  }
}

// 子类实现抽象类
class Dog extends Animal {
  public breed: string;

  constructor(name: string, breed: string) {
    super(name);
    this.breed = breed;
  }

  // 实现抽象方法
  speak(): void {
    console.info(`${this.name} barks`);
  }

  // 重写具体方法
  move(): void {
    console.info(`${this.name} runs`);
  }
}

class Cat extends Animal {
  public color: string;

  constructor(name: string, color: string) {
    super(name);
    this.color = color;
  }

  // 实现抽象方法
  speak(): void {
    console.info(`${this.name} meows`);
  }
}

// 不能实例化抽象类
let animal: Animal = new Animal('Test');  // 编译错误

// 通过子类使用
let dog: Dog = new Dog('Max', 'Labrador');
let cat: Cat = new Cat('Whiskers', 'Orange');

dog.speak();  // Max barks（实现的方法）
dog.move();   // Max runs（重写的方法）
dog.sleep();  // Max is sleeping（继承的方法）

cat.speak();  // Whiskers meows（实现的方法）
cat.move();   // Whiskers is moving（继承的方法）
cat.sleep();  // Whiskers is sleeping（继承的方法）
// [End ts_abstract_class_usage]

// [Start ts_inherit_builtin_error]
// TypeScript对照写法，演示继承Error时修复原型链
class InhAppError extends Error {
  public code: number;

  constructor(message: string, code: number) {
    super(message);
    this.code = code;

    // 修复原型链（target为ES5时需要）
    Object.setPrototypeOf(this, InhAppError.prototype);
  }

  getInfo(): string {
    return `[${this.code}] ${this.message}`;
  }
}

let inhError: InhAppError = new InhAppError('Not found', 404);
console.info(`${inhError.getInfo()}`);  // [404] Not found
console.info(`${(inhError instanceof InhAppError).toString()}`);  // true
console.info(`${(inhError instanceof Error).toString()}`);  // true
// [End ts_inherit_builtin_error]

// [Start class_structural_relation]
class InhPoint1 {
  public x: number = 0;
  public y: number = 0;
}

class InhPoint2 {
  public x: number = 0;
  public y: number = 0;
}

// 结构相同，可互相赋值
let inhP1: InhPoint1 = new InhPoint2();
let inhP2: InhPoint2 = new InhPoint1();
console.info(`${inhP1.x.toString()}`);
// [End class_structural_relation]

// [Start ts_class_structural_relation]
class InhPoint1 {
  public x: number = 0;
  public y: number = 0;
}

class InhPoint2 {
  public x: number = 0;
  public y: number = 0;
}

// 结构相同，可互相赋值
let inhP1: InhPoint1 = new InhPoint2();
let inhP2: InhPoint2 = new InhPoint1();
console.info(`${inhP1.x.toString()}`);
// [End ts_class_structural_relation]
