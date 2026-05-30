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

// [Start StaDynObservedV2MainPageClass]
// dynamic_module/src/main/ets/components/MainPage.ets

@ObservedV2
export class ObservedV2ForStatic {
  @Trace name: string = '';
  @Trace model:  ObservedV2ForStatic2 = new ObservedV2ForStatic2('Tom', 12);

  constructor(name: string, model: ObservedV2ForStatic2) {
    this.name = name;
    this.model = model;
  }
}

@ObservedV2
export class ObservedV2ForStatic2 { // 供ArkTS-Sta主模块使用的类
  // 定义@Trace修饰的属性
  @Trace name: string = '';
  @Trace age: number = 0;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}
// [End StaDynObservedV2MainPageClass]

// [Start StaDynObservedV2MainPageNested]
// dynamic_module/src/main/ets/components/MainPage.ets
@ObservedV2
export class Pencil {
  @Trace length: number = 21; // 当length变化时，会刷新关联的组件
}
@ObservedV2
export class Bag {
  width: number = 50;
  height: number = 60;
  @Trace pencil: Pencil = new Pencil();
}
@ObservedV2
export class Student {
  age: number = 5;
  school: string = 'some';
  @Trace bag: Bag = new Bag();
}
// [End StaDynObservedV2MainPageNested]

// [Start StaDynObservedV2MainPageInherit]
// dynamic_module/src/main/ets/components/MainPage.ets
@ObservedV2
export class GrandFather {
  // 定义@Trace修饰的属性
  @Trace age: number = 0;

  constructor(age: number) {
    this.age = age;
  }
}
@ObservedV2
export class Father extends GrandFather{
  @Trace name: string = 'father';

  constructor(father: number) {
    super(father);
  }
}
@ObservedV2
export class Uncle extends GrandFather {
  @Trace name: string = 'uncle';

  constructor(uncle: number) {
    super(uncle);
  }
}
@ObservedV2
export class Son extends Father {
  @Trace name: string = 'son';

  constructor(son: number) {
    super(son);
  }
}
@ObservedV2
export class Cousin extends Uncle {
  @Trace name: string = 'cousin';

  constructor(cousin: number) {
    super(cousin);
  }
}
// [End StaDynObservedV2MainPageInherit]
