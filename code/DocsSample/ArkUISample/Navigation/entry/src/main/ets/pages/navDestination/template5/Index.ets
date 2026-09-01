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

// [Start ExamplePage]
@Entry
@Component
struct ExamplePage {
  private stack: NavPathStack = new NavPathStack();

  @Builder
  pageMap(name: string) {
    if (name === 'PageA') {
      NavDestination()
        .backgroundColor(Color.Red)
        .title('PageA')
    }
    if (name === 'PageB') {
      NavDestination()
        .backgroundColor(Color.Green)
        .title('PageB')
    }
    if (name === 'PageC') {
      NavDestination()
        .backgroundColor(Color.Blue)
        .title('PageC')
    }
  }

  build() {
    Navigation(this.stack) {
      Button("push PageA").onClick((event: ClickEvent) => {
        this.stack.pushPathByName("PageA", null)
      })
      Button("push PageB").onClick((event: ClickEvent) => {
        this.stack.pushPathByName("PageB", null)
      })
      Button("push PageC").onClick((event: ClickEvent) => {
        this.stack.pushPathByName("PageC", null)
      })
    }
    .navDestination(this.pageMap)
  }
}
// [End ExamplePage]