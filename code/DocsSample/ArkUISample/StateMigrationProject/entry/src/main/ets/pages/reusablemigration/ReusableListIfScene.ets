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
// [Start reusable_list_if_scene]
@Entry
@ComponentV2
struct ReusableListIfScene {
  // 列表数据源
  private dataSource: FriendMoment[] = [];

  // 初始化数据源，包含有图片和无图片两种类型
  aboutToAppear(): void {
    for (let i = 0; i < 20; i++) {
      let title = i + 1 + 'test_if';
      // 开发者可自行替换显示图片的内容，此处以app.media.startIcon为例
      this.dataSource.push(new FriendMoment(i.toString(), title, 'app.media.startIcon'));
    }

    for (let i = 0; i < 50; i++) {
      let title = i + 1 + 'test_if';
      this.dataSource.push(new FriendMoment(i.toString(), title, ''));
    }
  }

  build() {
    Column() {
      List({ space: 3 }) {
        Repeat(this.dataSource)
          .virtualScroll()
          .each((ri) => {
            ListItem() {
              // 根据是否有图片选择不同的复用组
              if (ri.item.image) {
                OneMoment({ moment: ri.item })
                  .reuse({ reuseId: () => 'withImage' })
              } else {
                OneMoment({ moment: ri.item })
                  .reuse({ reuseId: () => 'noImage' })
              }
            }
          })
      }
      .cachedCount(0)
    }
  }
}

// 数据模型
@ObservedV2
class FriendMoment {
  @Trace public id: string = '';
  @Trace public text: string = '';
  @Trace public title: string = '';
  @Trace public image: string = '';
  @Trace public answers: Array<ResourceStr> = [];

  constructor(id: string, title: string, image: string) {
    this.text = id;
    this.title = title;
    this.image = image;
  }
}

// 复用组件
@ReusableV2
@ComponentV2
export struct OneMoment {
  // 接收外部传入的数据对象
  @Require @Param moment: FriendMoment;

  // 复用id相同的组件才能触发复用，如无需对状态变量做额外修改可移除
  aboutToReuse(): void {
    console.info(`=====aboutToReuse====OneMoment==复用了==${this.moment.text}`);
  }

  build() {
    Column() {
      // 显示文本内容
      Text(this.moment.text)
      // if分支判断，有图片时显示图片区域
      if (this.moment.image !== '') {
        // 使用Flex包裹实现自动换行布局
        Flex({ wrap: FlexWrap.Wrap }) {
          Image($r(this.moment.image))
            .height(50)
            .width(50)
          Image($r(this.moment.image))
            .height(50)
            .width(50)
          Image($r(this.moment.image))
            .height(50)
            .width(50)
          Image($r(this.moment.image))
            .height(50)
            .width(50)
        }
      }
    }
  }
}

// [End reusable_list_if_scene]
