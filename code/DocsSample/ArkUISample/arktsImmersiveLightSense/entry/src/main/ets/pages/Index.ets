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

interface ListCategories {
  title: Resource,
  url: string,
}

@Entry
@Component
struct Index {
  @State message: string = '';
  private items: ListCategories[] = [
    // 请将$r('app.string.page_material_scope_adapt')替换为实际资源文件，在本示例中该资源文件的value值为"材质生效范围（标题栏 vs 内容区）"
    { title: $r('app.string.page_material_scope_adapt'), url: 'pages/MaterialScopeAdaptExample' },
    // 请将$r('app.string.page_app_level_compatibility')替换为实际资源文件，在本示例中该资源文件的value值为"应用级兼容性适配"
    { title: $r('app.string.page_app_level_compatibility'), url: 'pages/AppLevelCompatibilityExample' },
    // 请将$r('app.string.page_component_level_compatibility')替换为实际资源文件，在本示例中该资源文件的value值为"组件级兼容性适配"
    { title: $r('app.string.page_component_level_compatibility'), url: 'pages/ComponentLevelCompatibilityExample' },
    // 请将$r('app.string.page_material_color_invert')替换为实际资源文件，在本示例中该资源文件的value值为"材质自动反色"
    { title: $r('app.string.page_material_color_invert'), url: 'pages/MaterialColorInvertExample' },
    // 请将$r('app.string.page_material_color')替换为实际资源文件，在本示例中该资源文件的value值为"材质赋色"
    { title: $r('app.string.page_material_color'), url: 'pages/MaterialColorExample' },
    // 请将$r('app.string.page_material_interactive_light')替换为实际资源文件，在本示例中该资源文件的value值为"交互形变与点光源"
    { title: $r('app.string.page_material_interactive_light'), url: 'pages/MaterialInteractiveLightExample' },
    // 请将$r('app.string.page_custom_shadow')替换为实际资源文件，在本示例中该资源文件的value值为"自定义阴影"
    { title: $r('app.string.page_custom_shadow'), url: 'pages/CustomShadowExample' },
  ]

  build() {
    Column() {
      Text("Immersive Light Sense")
        .fontSize(22)
        .fontColor(0xFFFFFF)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .height(50)
        .backgroundColor('#2ebd82')
      Text("Sample")
        .fontSize(22)
        .fontColor(0xFFFFFF)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .width('100%')
        .height(50)
        .backgroundColor('#2ebd82')
      List({ space: '10vp' }) {
        ForEach(this.items, (item: ListCategories) => {
          ListItem() {
            Text(item.title).fontSize(16).fontWeight(FontWeight.Bold)
          }
          .width('90%')
          .height('40vp')
          .backgroundColor('#fff53ecd9')
          .borderRadius(10)
          .onClick(() => {
            this.message = 'Page: ' + item.url;
            this.getUIContext().getRouter().pushUrl({ url: item.url })
          })
        })
      }.alignListItem(ListItemAlign.Center).margin({ top: '10vp' }).width('100%').height('80%')

      Text(this.message).fontSize(20)
    }
    .width('100%')
    .height('100%')
  }
}
