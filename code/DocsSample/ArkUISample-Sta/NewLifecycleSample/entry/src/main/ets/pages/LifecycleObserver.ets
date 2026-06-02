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
import { NavDestination, $r } from '@kit.ArkUI';
// [Start LifecycleObserver]
import { ComponentInit, ComponentDisappear, UIUtils, CustomComponentLifecycleObserver, CustomComponentLifecycle, Entry, Component, State, Column, Button, FontWeight, Reusable, Text, ReuseObject } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

export class ObserverMessage {
  value: string | undefined;
  constructor(value: string) {
    this.value = value;
  }
}

export class MyObserver implements CustomComponentLifecycleObserver {
  // 重写CustomComponentLifecycleObserver中的生命周期事件
  // 被监听的自定义组件创建实例后，执行build函数之前回调aboutToAppear
  aboutToAppear(): void {
    hilog.info(0x0000, 'testTag', 'MyObserver aboutToAppear');
  }
  // 被监听的自定义组件首次渲染触发的build函数执行完成之后回调onDidBuild
  onDidBuild(): void {
    hilog.info(0x0000, 'testTag', 'MyObserver onDidBuild');
  }
  // 被监听的自定义组件触发复用时回调aboutToReuse
  aboutToReuse(params?: ReuseObject): void {
    hilog.info(0x0000, 'testTag', 'MyObserver aboutToReuse');
  }
  // 被监听的自定义组件触发回收时回调aboutToRecycle
  aboutToRecycle(): void {
    hilog.info(0x0000, 'testTag', 'MyObserver aboutToRecycle');
  }
  // 被监听的自定义组件析构销毁之前回调aboutToDisappear
  aboutToDisappear(): void {
    hilog.info(0x0000, 'testTag', 'MyObserver aboutToDisappear');
  }
}

// 创建Observer对象
const observer = new MyObserver();
export function registerObserver(lifeCycle: CustomComponentLifecycle): void {
  // 向lifeCycle注册监听
  lifeCycle.addObserver(observer);
}
export function unRegisterObserver(lifeCycle: CustomComponentLifecycle): void {
  // 向lifeCycle取消注册监听
  lifeCycle.removeObserver(observer);
}

@Reusable
@Component
struct ObserverChild {
  @State message: ObserverMessage = new ObserverMessage('AboutToReuse');
  @State label: string = 'HelloWorld';
  // 组件生命周期ComponentInit，在Child初始化执行完成之后回调myInit
  @ComponentInit
  myInit(): void {
    registerObserver(UIUtils.getLifecycle(this));
  }
  // 组件生命周期ComponentDisappear，在Child析构销毁之前回调myDisappear
  @ComponentDisappear
  myDisappear(): void {
    unRegisterObserver(UIUtils.getLifecycle(this));
  }

  build() {
    Column() {
      Text(this.message.value)
        .fontSize(30)
    }
  }
}

@Entry
@Component
struct LifecycleObserverIndex {
  @State switchReuse: boolean = true;

  build() {
    Column() {
      Button('Hello')
        .fontSize(30)
        .fontWeight(FontWeight.Bold)
        .onClick(() => {
          this.switchReuse = !this.switchReuse;
        })
      if (this.switchReuse) {
        // 如果只有一个复用的组件，可以不用设置reuseId。
        ObserverChild({ message: new ObserverMessage('Child') })
      }
    }
    .height('100%')
    .width('100%')
  }
}
// [End LifecycleObserver]

@Builder
export function lifecycleObserver(): void {
  NavDestination() {
    LifecycleObserverIndex();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.lifecycle_observer_title'))
}
