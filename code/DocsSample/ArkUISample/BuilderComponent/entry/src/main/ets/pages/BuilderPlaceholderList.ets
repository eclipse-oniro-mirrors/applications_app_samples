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
// [Start builder_placeholder_list]
import { PlaceholderOptions } from '@kit.ArkUI';

// 占位构建函数须为全局、无参，且仅执行不依赖状态变量的静态渲染
@Builder({ isPlaceholder: true })
function ItemPlaceholder() {
  Column() {
    Text('加载中...')
      .fontSize(16)
      .fontColor(0x999999)
  }
  .width('100%')
  .height(100)
  .justifyContent(FlexAlign.Center)
}

@Entry
@ComponentV2
struct BuilderPlaceholderList {
  @Local data: number[] = [];

  aboutToAppear(): void {
    // 通过UIContext获取占位注册表，占位构建函数经wrapBuilder包装后注册，供scrollPlaceholder按id引用
    this.getUIContext().getPlaceholderRegister()
      .register('itemPlaceholder', wrapBuilder(ItemPlaceholder));
    const list: number[] = [];
    for (let i = 0; i < 10000; i++) {
      list.push(i);
    }
    this.data = list;
  }

  build() {
    Column({ space: 5 }) {
      List({ space: 10 }) {
        Repeat<number>(this.data)
          .each((repeatItem: RepeatItem<number>) => {
            ListItem() {
              Text(repeatItem.item.toString())
                .fontSize(16)
                .width('100%')
                .height(100)
                .textAlign(TextAlign.Center)
            }
          })
      }
      .width('90%')
      .height(300)
      // id对应已注册的占位构建函数，size为占位的建议尺寸，与真实列表项高度一致，减小替换时的视觉跳动
      .scrollPlaceholder((index: number): PlaceholderOptions | undefined => {
        return { id: 'itemPlaceholder', size: { height: 100 } };
      })
    }
    .width('100%')
    .padding({ top: 10 })
    .backgroundColor('#FFDCDCDC')
  }
}
// [End builder_placeholder_list]
