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
// CompConfigCenter demo - ArkTS 1.1 (Dynamic) Navigation sample.
// Push DetailPage1 (normal page) and DetailPage2 (trans page) through Navigation.

@Entry
@Component
struct Index {
  pathStack: NavPathStack = new NavPathStack();

  @Builder
  PageMap(name: string) {
    if (name === 'DetailPage1') {
      NavDestination() {
        Column({ space: 12 }) {
          Text($r('app.string.page1_title')).fontSize(22).fontWeight(FontWeight.Bold)
          Button($r('app.string.back')).width('80%')
            .onClick(() => { this.pathStack.pop(); })
        }
        .width('100%').height('100%').justifyContent(FlexAlign.Center)
      }
      .title($r('app.string.page1_title'))
    } else if (name === 'DetailPage2') {
      NavDestination() {
        Column({ space: 12 }) {
          Text($r('app.string.page2_title')).fontSize(22).fontWeight(FontWeight.Bold)
          Button($r('app.string.back')).width('80%')
            .onClick(() => { this.pathStack.pop(); })
        }
        .width('100%').height('100%').justifyContent(FlexAlign.Center)
      }
      .title($r('app.string.page2_title'))
    }
  }

  build() {
    Navigation(this.pathStack) {
      Column({ space: 16 }) {
        Button($r('app.string.push_page1'))
          .width('90%')
          .margin({ top: 24 })
          .onClick(() => {
            this.pathStack.pushPathByName('DetailPage1', null);
          })
        Button($r('app.string.push_page2'))
          .width('90%')
          .margin({ top: 12 })
          .onClick(() => {
            this.pathStack.pushPathByName('DetailPage2', null);
          })
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .id('MainNavigation')
    .navDestination(this.PageMap)
    .title($r('app.string.main_title'))
    .mode(NavigationMode.Stack)
  }
}
