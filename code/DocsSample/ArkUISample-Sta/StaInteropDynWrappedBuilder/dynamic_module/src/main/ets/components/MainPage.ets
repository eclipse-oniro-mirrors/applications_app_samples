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

// [Start StaWrappedBuilderMainPage]
// dynamic_module/src/main/ets/components/MainPage.ets

// 定义字面量类
class Tmp {
  prop: string = 'Hello World!';
}

@Builder
function overBuilder(param: Tmp) { // 按引用传递参数，可以触发UI更新
  Column() {
    Text(param.prop)
      .fontSize(20)
      .margin(10)
  }
  .width('100%')
}

// 导出WrappedBuilder对象
export const globalBuilder: WrappedBuilder<[Tmp]> = wrapBuilder(overBuilder);
// [End StaWrappedBuilderMainPage]
