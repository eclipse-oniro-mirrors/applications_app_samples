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

@Entry
@Component
// [Start listScroll_ClearFocus]
struct listScrollClearFocus {
  private arr: number[] = Array.from<number, number>(
    { length: 100 } as ArrayLike<number>,
    (_, i: number) => i + 1
  );

  build() {
    NavDestination() {
      Column() {
        List({ space: 20, initialIndex: 0 }) {
          ForEach(this.arr, (item: number, index?: number) => {
            ListItem() {
              Flex({ direction: FlexDirection.Row, alignItems: ItemAlign.Center }) {
                TextInput({ placeholder: 'TextInput ' + item })
              }
            }
          }, (item: string) => item)
        }
        .onScrollStart(() => {
          // List开始滚动时清理焦点，达成收起键盘的目的
          this.getUIContext().getFocusController().clearFocus()
        })
        .width('80%')
        .height('80%')
        .margin('10%')
      }
      .justifyContent(FlexAlign.Center)
    }
  }
}
// [End listScroll_ClearFocus]

export { listScrollClearFocus };
