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

/**
 * 第三层页面：演示系统只自动恢复栈顶前 2 页，更深层级需要应用按路径快照补推。
 */
@Component
export struct DeepPage {
  build() {
    NavDestination() {
      Column({ space: 12 }) {
        Text('第三层页面')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
        Text('系统自动恢复只覆盖栈顶前 2 页；本页位于第 3 层，恢复时由首页按保存的路径快照补推。')
          .fontSize(14)
          .fontColor(Color.Gray)
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)
    }
    .title('第三层页面')
    .recoverable(true)
  }
}
