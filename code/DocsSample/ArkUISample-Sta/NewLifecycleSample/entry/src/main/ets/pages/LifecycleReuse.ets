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
// [Start LifecycleReuse]
import { ComponentInit, ComponentAppear, ComponentBuilt, ComponentDisappear, ComponentReuse, ComponentRecycle, Entry, Component, State, Column, Button, Reusable, Text, ReuseObject } from '@kit.ArkUI';
import { hilog } from '@kit.PerformanceAnalysisKit';

export class ReuseMessage {
  value: string | undefined;
  constructor(value: string) {
    this.value = value;
  }
}

@Reusable
@Component
struct GrandChild {
  @State message: ReuseMessage = new ReuseMessage('GrandChild');
  @State label: string = 'HelloWorld';
  @State switchReuse: boolean = true;
  // 组件生命周期ComponentInit，在GrandChild初始化执行完成之后回调myInit
  @ComponentInit
  myInit() {
    hilog.info(0x0000, 'testTag', 'GrandChild myInit');
  }
  // 组件生命周期ComponentAppear，在GrandChild创建实例后，执行build函数之前回调myAppear
  @ComponentAppear
  myAppear() {
    this.label = 'myAppear';
    hilog.info(0x0000, 'testTag', 'GrandChild myAppear');
  }
  // 组件生命周期ComponentBuilt，在GrandChild首次渲染触发的build函数执行完成之后回调myBuilt
  @ComponentBuilt
  myBuilt() {
    this.label = 'myBuilt';
    hilog.info(0x0000, 'testTag', 'GrandChild myBuilt');
  }
  // 组件生命周期ComponentRecycle，在GrandChild触发回收时回调myRecycle
  @ComponentRecycle
  myRecycle() {
    this.label = 'myRecycle';
    hilog.info(0x0000, 'testTag', 'GrandChild myRecycle');
  }
  // 组件生命周期ComponentDisappear，在GrandChild析构销毁之前回调myDisappear
  @ComponentDisappear
  myDisappear() {
    this.label = 'myDisappear';
    hilog.info(0x0000, 'testTag', 'GrandChild myDisappear');
  }
  // 组件生命周期ComponentReuse，在GrandChild触发复用时回调myReuse
  @ComponentReuse
  myReuse(params?: ReuseObject) {
    this.label = 'myReuse';
    hilog.info(0x0000, 'testTag', 'GrandChild myReuse');
  }

  build() {
    Column() {
      Text(this.message.value)
        .fontSize(30)
    }
    .borderWidth(1)
  }
}

@Reusable
@Component
struct ChildReuse {
  @State message: ReuseMessage = new ReuseMessage('Child');
  @State label: string = 'HelloWorld';
  @State switchReuse: boolean = true;
  // 组件生命周期ComponentInit，在Child初始化执行完成之后回调myInit
  @ComponentInit
  myInit() {
    hilog.info(0x0000, 'testTag', 'Child myInit');
  }
  // 组件生命周期ComponentAppear，在Child创建实例后，执行build函数之前回调myAppear
  @ComponentAppear
  myAppear() {
    this.label = 'myAppear';
    hilog.info(0x0000, 'testTag', 'Child myAppear');
  }
  // 组件生命周期ComponentBuilt，在Child首次渲染触发的build函数执行完成之后回调myBuilt
  @ComponentBuilt
  myBuilt() {
    this.label = 'myBuilt';
    hilog.info(0x0000, 'testTag', 'Child myBuilt');
  }
  // 组件生命周期ComponentRecycle，在Child触发回收时回调myRecycle
  @ComponentRecycle
  myRecycle() {
    this.label = 'myRecycle';
    hilog.info(0x0000, 'testTag', 'Child myRecycle');
  }
  // 组件生命周期ComponentDisappear，在Child析构销毁之前回调myDisappear
  @ComponentDisappear
  myDisappear() {
    this.label = 'myDisappear';
    hilog.info(0x0000, 'testTag', 'Child myDisappear');
  }
  // 组件生命周期ComponentReuse，在Child触发复用时回调myReuse
  @ComponentReuse
  myReuse(params?: ReuseObject) {
    this.label = 'myReuse';
    hilog.info(0x0000, 'testTag', 'Child myReuse');
  }

  build() {
    Column() {
      Text(this.message.value)
        .fontSize(30)
      Button('Hello')
        .fontSize(30)
        .onClick(() => {
          this.switchReuse = !this.switchReuse;
        })
      if (this.switchReuse) {
        GrandChild({ message: new ReuseMessage('GrandChild') })
      }
    }
    .borderWidth(1)
  }
}

@Entry
@Component
struct LifecycleReuseIndex {
  @State switchReuse: boolean = true;

  build() {
    Column() {
      Button('Hello')
        .fontSize(30)
        .onClick(() => {
          this.switchReuse = !this.switchReuse;
        })
      // 通过改变switchReuse，实现Child的回收和复用
      // 更改this.switchReuse为false，回收Child子组件，执行Child myRecycle
      // 更改this.switchReuse为true，复用Child子组件，执行Child myReuse
      if (this.switchReuse) {
        // 如果只有一个复用的组件，可以不用设置reuseId。
        ChildReuse({ message: new ReuseMessage('Child') })
      }
    }
    .height('100%')
    .width('100%')
  }
}
// [End LifecycleReuse]

@Builder
export function lifecycleReuse(): void {
  NavDestination() {
    LifecycleReuseIndex();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.lifecycle_reuse_title'))
}
