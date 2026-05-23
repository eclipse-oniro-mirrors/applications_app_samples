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
// [Start TraceInheritClass]
import { Column, ComponentV2, Entry, ObservedV2, Text, Trace } from '@kit.ArkUI';

@ObservedV2
class Father {
  @Trace name: string = 'Tom';
}

class Son extends Father {
}

@Entry
@ComponentV2
struct Index {
  son: Son = new Son();

  build() {
    Column() {
      // 当点击改变name时，Text组件会刷新
      Text(`${this.son.name}`)
        .onClick((e) => {
          this.son.name = 'Jack';
        })
    }
  }
}

// [End TraceInheritClass]

@Builder
export function traceInheritClass(): void {
  NavDestination() {
    Index();
  }
  .backgroundColor('#f1f2f3')
  .title($r('app.string.trace_inherit_class_title'))
}