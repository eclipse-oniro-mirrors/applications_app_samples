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

@Component
export struct DemoTitle {
  public title: Resource = $r('app.string.index_title');
  // 页面标识：控件 id 以此为前缀，UI 用例据此定位返回按钮与标题，不依赖界面文案。
  public pageKey: string = '';

  build() {
    Row() {
      Button($r('app.string.back'))
        .id('page_back_' + this.pageKey)
        .fontSize(14)
        .height(32)
        .backgroundColor($r('app.color.panel'))
        .fontColor($r('app.color.text_primary'))
        .onClick(() => {
          // 使用 UIContext 路由对象返回，避免调用已废弃的全局 router。
          this.getUIContext().getRouter().back();
        })
      Text(this.title)
        .id('page_title_' + this.pageKey)
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.text_primary'))
        .margin({ left: 12 })
        .layoutWeight(1)
    }
    .width('100%')
    .height(48)
    .alignItems(VerticalAlign.Center)
  }
}
