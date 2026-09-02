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
// [Start reusable_listitemgroup_scene]
@Entry
@ComponentV2
struct ListItemGroupAndReusable {
  // 列表分组数据源
  private dataSource: DataSrc[] = [];

  // 列表分组头部构建器
  @Builder
  itemHead(text: string) {
    Text(text)
      .fontSize(20)
      .backgroundColor(0xff519db4)
      .width('100%')
      .padding(10)
  }

  // 初始化分组数据
  aboutToAppear() {
    for (let i = 0; i < 10000; i++) { // 循环10000次
      let data = new DataSrc();
      for (let j = 0; j < 12; j++) { // 每组12条数据
        data.dataScr1.push(`测试条目数据: ${i} - ${j}`);
      }
      this.dataSource.push(data);
    }
  }

  build() {
    Stack() {
      List() {
        // 外层Repeat遍历分组数据
        Repeat(this.dataSource)
          .virtualScroll()
          .each((ri) => {
            ListItemGroup({ header: this.itemHead(ri.index.toString()) }) {
              // 内层Repeat遍历每组中的子项数据
              Repeat(ri.item.dataScr1)
                .virtualScroll()
                .each((ri) => {
                  ListItem() {
                    Inner({ str: ri.item })
                  }
                })
            }
          })
      }
    }
    .width('100%')
    .height('100%')
  }
}

// 复用组件
@ReusableV2
@ComponentV2
struct Inner {
  // 接收外部传入的文本内容
  @Param str: string = '';

  build() {
    // 显示文本内容
    Text(this.str)
  }
}

// 分组数据模型
@ObservedV2
class DataSrc {
  @Trace public dataScr1: string[] = [];
}

// [End reusable_listitemgroup_scene]
