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

// [Start DynInteropStaStatemgmtV2StaObservedV2Nested]
// static_module/src/main/ets/components/StaObservedV2Nested.ets
import { enableCompatibleObservedV2ForDynamic } from '@ohos.arkui.component';
import { ObservedV2, Trace } from '@ohos.arkui.stateManagement';
  
// 导出ArkTS-Sta中实现的enableCompatibleObservedV2ForDynamic方法
export function setEnableCompatibleObservedV2ForDynamicNested(T: Object): void {
  // 调用enableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
  enableCompatibleObservedV2ForDynamic(T);
}

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
export class Son {// 定义静态@ObservedV2装饰的类并导出
  age: number = 5;
  school: string = 'some';
  @Trace bag: Bag = new Bag();
}
// [End DynInteropStaStatemgmtV2StaObservedV2Nested]
