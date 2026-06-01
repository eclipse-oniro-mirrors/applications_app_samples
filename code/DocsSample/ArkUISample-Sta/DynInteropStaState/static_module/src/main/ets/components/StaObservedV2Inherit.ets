'use static'
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

// [Start DynInteropStaStatemgmtV2StaObservedV2Inherit]
// static_module/src/main/ets/components/StaObservedV2Inherit.ets
import { enableCompatibleObservedV2ForDynamic } from '@ohos.arkui.component';
import { ObservedV2, Trace } from '@ohos.arkui.stateManagement';

// 导出ArkTS-Sta中实现的enableCompatibleObservedV2ForDynamic方法
export function setEnableCompatibleObservedV2ForDynamicInherit(T: Object): void {
  // 调用setEnableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
  enableCompatibleObservedV2ForDynamic(T);
}

@ObservedV2
export class GrandFather {
  // 当age变化时，会刷新关联的组件
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
export class Sonny extends Father { // 定义静态@ObservedV2装饰的类并导出
  @Trace sonnyName: string = 'son';

  constructor(son: number) {
    super(son);
  }
}

@ObservedV2
export class Cousin extends Uncle { // 定义静态@ObservedV2装饰的类并导出
  @Trace cousinName: string = 'cousin';
  
  constructor(cousin: number) {
    super(cousin);
  }
}
// [End DynInteropStaStatemgmtV2StaObservedV2Inherit]
