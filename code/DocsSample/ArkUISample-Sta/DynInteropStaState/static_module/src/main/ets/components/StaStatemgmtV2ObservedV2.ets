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

// [Start DynInteropStaStatemgmtV2StaStateMgmtV2ObservedV2]
// static_module/src/main/ets/components/StaStatemgmtV2ObservedV2.ets
import { Entry, Text, Column, Component, Button, ClickEvent, enableCompatibleObservedV2ForDynamic } from '@ohos.arkui.component';
import { State, ObservedV2, Trace } from '@ohos.arkui.stateManagement';

// 导出ArkTS-Sta中实现的enableCompatibleObservedV2ForDynamic方法
export function setEnableCompatibleObservedV2ForDynamic(T: Object): void {
  // 调用enableCompatibleObservedV2ForDynamic方法，使ArkTS-Sta @Trace修饰的属性在ArkTS-Dyn中可观测
  enableCompatibleObservedV2ForDynamic(T);
}

@ObservedV2
export class ObservedV2ForStatic { // 定义静态@ObservedV2装饰的类并导出
  @Trace name: string = '';
  @Trace age: number = 0;

  constructor(name: string, age: number) {
    this.name = name;
    this.age = age;
  }
}
// [End DynInteropStaStatemgmtV2StaStateMgmtV2ObservedV2]
