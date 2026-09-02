/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License")
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
// [Start wrapbuilder_as_field] 
@Builder
function myBuilder(value: string, size: number) {
  Text(value)
    .fontSize(size)
    .margin(10)
}

interface ChildOptions {
  wrappedBuilder: WrappedBuilder<[string, number]>; // 类型为WrappedBuilder的属性可以传递@Builder函数
}

@Entry
@Component
struct Index {
  childOptions: ChildOptions = {
    wrappedBuilder: wrapBuilder(myBuilder)
  };

  build() {
    Row() {
      Column() {
        Child({ options: this.childOptions })
      }
      .width('100%')
    }
    .height('100%')
  }
}

@Component
struct Child {
  @Prop options: ChildOptions;
  build() {
    this.options.wrappedBuilder.builder('Hello', 20);
  }
}
// [End wrapbuilder_as_field]
@Builder
export function wrapBuilderAsField() {
  NavDestination() {
    Index()
  }
}
