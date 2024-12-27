/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

// ========================== For S2D function call tests ==========================

class ClassA {
  num = 123;
}

export function funcReturnTypeNull() {
  return null;
}

export function funcReturnTypeUndefined() {
  return undefined;
}

export function funcReturnTypeBoolean() {
  return true;
}

export function funcReturnTypeNumber() {
  return 1;
}

export function funcReturnTypeBigint() {
  return 0n;
}

export function funcReturnTypeString() {
  return 'hello';
}

export function funcArgType(arg) {
  return arg;
}

// ========================== For S2D method call tests ==========================

export class MethodCallTestClass {
  constructor() {}
  argTypeMethod(arg) {
    return arg;
  }
  nullRetValMethod() {
    return null;
  }
  undefinedRetValMethod() {
    return undefined;
  }
  booleanRetValMethod() {
    return true;
  }
  numberRetValMethod() {
    return 1;
  }
  bigintRetValMethod() {
    return 0n;
  }
  stringRetValMethod() {
    return 'hi';
  }
  symbolRetValMethod() {
    return Symbol('id');
  }
  classInstRetValMethod() {
    return new ClassA();
  }
  objRetValMethod() {
    return { a: '123'};
  }
  arrRetValMethod() {
    return [1, 2, 3];
  }
}

// ========================== For S2D conversion tests ==========================

export let jsNull = null;
export let jsUndefined = undefined;
export let jsBoolean = true;
export let jsNumber = 10;
export let jsBigint = 0n;
export let jsString = 'hello';
export let jsSymbol = Symbol('id');
export let jsInst = new ClassA();

// ========================== For S2D operators tests ==========================

export let globalVar = 'global variable';

export class Person {
    static staticProp = 'static prop';

    static staticMethod() {
        return 'static method';
    }

    constructor(name = 'defaultPerson', age = 18) {
      this.name = name;
      this.age = age;
    }

    add(a, b) {
        return a + b;
    }

    call() {
        return 'call';
    }
}

export function Fruits(kinds, weight) {
    this.kinds = kinds;
    this.weight = weight;
}

export let arr = new Array(3);

export let numbers = [10, 20, 30, 40, 50];

export let man = {
    name: 'John',
    age: 30
};

let map = new Map();
map.set('name', 'Alice');
map.set('age', 30);
export let myMap = map;

let jsonObject = {
    'name': 'Alice',
    'age': 30,
};
export let jsonVal = jsonObject.age;


export let calculator = {
    add: function(a, b) {
        return a + b;
    }
};

export let err = new Error('Something went wrong!');


export function call() {
    return 'call';
}

export let anonymousFunction = function() {
    return 'anonymous';
};

export let arrowFunction = () => {
    return 'arrow';
};

export function Order(id, price) {
    this.id = id;
    this.price = price;
}

// ========================== For S2D import statements tests ==========================

export function subtract(a, b) {
    return a - b;
}

export function multiply(a, b) {
    return a * b;
}

// ========================== For S2D exception statements tests ==========================

export function funcError() {
    throw new Error('funcError');
}

export class MyError extends Error {
    constructor(message) {
      super(message);
    }
}

export function funcUserDefinedError() {
    throw new MyError('MyError');
}