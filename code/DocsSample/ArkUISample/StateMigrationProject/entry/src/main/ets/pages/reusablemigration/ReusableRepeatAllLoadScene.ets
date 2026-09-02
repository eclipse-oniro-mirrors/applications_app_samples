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
// [Start reusable_repeat_all_load_scene]
// xxx.ets
@Entry
@ComponentV2
struct ReusableRepeatAllLoadScene {
  // 列表数据源
  @Local dataSource: ListItemObject[] = [];

  build() {
    Column() {
      Row() {
        // 点击clear清空列表数据，触发组件销毁
        Button('clear')
          .onClick(() => {
            for (let i = 1; i < 50; i++) {
              this.dataSource.pop();
            }
          })
          .height(40)

        // 点击update重新填充数据，触发组件创建或复用
        Button('update')
          .onClick(() => {
            for (let i = 1; i < 50; i++) {
              let obj = new ListItemObject();
              obj.id = i;
              obj.uuid = Math.random().toString();
              obj.isExpand = false;
              this.dataSource.push(obj);
            }
          })
          .height(40)
      }

      List({ space: 10 }) {
        // 不使用virtualScroll，采用Repeat全量加载模式
        Repeat(this.dataSource)
          .each((ri) => {
            ListItem() {
              ListItemView({
                obj: ri.item
              })
            }
          })
      }
      .cachedCount(0)
      .width('100%')
      .height('100%')
    }
  }
}

// 复用组件
@ReusableV2
@ComponentV2
struct ListItemView {
  // 接收外部传入的数据对象
  @Require @Param obj: ListItemObject;

  // 首次创建时回调
  aboutToAppear(): void {
    // 点击update，首次进入，上下滑动，由于Repeat全量加载属性，无法复用
    console.info('=====aboutToAppear=====ListItemView==创建了==');
  }

  // 组件复用时回调
  aboutToReuse() {
    // 点击clear，再次update，复用成功
    // 符合一帧内重复创建多个已被销毁的自定义组件
    // 如无需对状态变量做额外修改可移除
    console.info('=====aboutToReuse====ListItemView==复用了==');
  }

  build() {
    Column({ space: 10 }) {
      // 显示标题文本
      Text(`${this.obj.id}.标题`)
        .fontSize(16)
        .fontColor('#000000')
        .padding({
          top: 20,
          bottom: 20,
        })

      // 根据展开状态显示额外内容
      if (this.obj.isExpand) {
        Text('expand')
          .fontSize(14)
          .fontColor('#999999')
      }
    }
    .width('100%')
    .borderRadius(10)
    .backgroundColor(Color.White)
    .padding(15)
    // 点击切换展开/折叠状态
    .onClick(() => {
      this.obj.isExpand = !this.obj.isExpand;
    })
  }
}

// 数据模型
@ObservedV2
class ListItemObject {
  @Trace public uuid: string = '';
  @Trace public id: number = 0;
  @Trace public isExpand: boolean = false;
}

// [End reusable_repeat_all_load_scene]
