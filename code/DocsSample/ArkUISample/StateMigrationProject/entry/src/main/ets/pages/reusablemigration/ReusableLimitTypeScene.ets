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
// [Start reusable_limit_type_scene]
@Entry
@ComponentV2
struct ReusableLimitTypeScene {
  // 列表数据源
  private data: number[] = [];

  // 初始化列表数据
  aboutToAppear() {
    for (let i = 0; i < 1000; i++) {
      this.data.push(i);
    }
  }

  build() {
    Column() {
      List({ space: 10 }) {
        Repeat(this.data)
          .virtualScroll()
          .each((ri) => {
            ListItem() {
              // 根据奇偶性选择不同的复用组
              if (ri.item % 2 === 0) {
                // 偶数项使用ReusableV2ComponentOne复用组
                ReusableV2Component({ item: ri.item })
                  .reuse({ reuseId: () => 'ReusableV2ComponentOne' })
              } else {
                ReusableV2Component({ item: ri.item })
                  .reuse({ reuseId: () => 'ReusableV2ComponentTwo' })
              }
            }
          })
      }
      .cachedCount(2)
    }
  }
}

// 复用组件
@ReusableV2
@ComponentV2
struct ReusableV2Component {
  // 接收外部传入的序号
  @Param item: number = 0;

  // 组件复用时回调，如无需对状态变量做额外修改可移除
  aboutToReuse() {
    console.info(`ReusableComponent aboutToReuse called${this.item}`);
  }

  build() {
    Column() {
      // 组件内部根据类型差异渲染不同内容
      if (this.item % 2 === 0) {
        // 偶数项渲染样式一
        Text(`Item ${this.item} ReusableComponentOne`)
          .fontSize(20)
          .margin({ left: 10 })
      } else {
        // 奇数项渲染样式二
        Text(`Item ${this.item} ReusableComponentTwo`)
          .fontSize(20)
          .margin({ left: 10 })
      }
    }
    .margin({ left: 10, right: 10 })
  }
}

// [End reusable_limit_type_scene]
