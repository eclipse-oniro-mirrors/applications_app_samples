'use static'

// [Start parallelList_start]
// ArkTS-Sta示例
import { Entry, Text, Column, Component, List, ListItem, Image, Row, Stack, $r, ImageFit, Alignment, FontWeight, TextOverflow  } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import { ParallelizeUI } from '@ohos.arkui.Parallelize';

class Info {
  title: string
  up: string
  views: string
  likes: string
  coverRes: string
  constructor(title: string, up: string, views: string, likes: string, coverRes: string) {
    this.title = title
    this.up = up
    this.views = views
    this.likes = likes
    this.coverRes = coverRes
  }
}

@Entry
@Component
struct Index {
  @State arr: Array<Int> = [1]
  @State stateVar: string = 'state var';

  aboutToAppear() {
    // 构造并行循环创建的数据源，创建50个ListItem子组件
    for (let i = 2; i <= 50; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      List({ space: 10 }) {
        // 循环并行创建
        ParallelizeUI<Int, Info>({ enable:true }, this.arr,
          (item: Int, index: Int) => {
            const coverIndex = ((item - 1) % 5) + 1   // 为每个Item生成Index
            const coverResId = `app.media.cover${coverIndex}`

            return new Info(
              `【热门】搞笑视频 ${item}`,
              `UP主：用户${item}`,
              `${(Math.random() * 100).toFixed(1)}万播放`,
              `${(Math.random() * 1).toFixed(1)}万点赞`,
              coverResId
            )
          },
          (param: Info) => {
            ListItem() {
              Column() {
                // 封面
                Stack() {
                  Image($r(param.coverRes))
                    .width('100%')
                    .height(200)
                    .borderRadius(8)
                    .objectFit(ImageFit.Cover)
                    .alt('video cover')

                  // 播放量右下角浮层
                  Row() {
                    Text(param.views)
                      .fontSize(12)
                      .fontColor('#FFFFFF')
                      .backgroundColor('rgba(0,0,0,0.5)')
                      .borderRadius(10)
                  }
                  .align(Alignment.BottomEnd)
                }

                // 标题
                Text(param.title)
                  .fontSize(18)
                  .fontWeight(FontWeight.Medium)
                  .maxLines(2)
                  .textOverflow({ overflow: TextOverflow.Ellipsis })

                // 底部信息行（up主、点赞量）
                Row() {
                  Text(param.up)
                    .fontSize(14)
                    .fontColor('#888')

                  Text(` · ${param.likes}`)
                    .fontSize(14)
                    .fontColor('#888')
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .padding(8)
            }
            .width('100%')
          })
      }
      .width('100%')
      .height('100%')
      .padding(10)
      .backgroundColor('#F8F8F8')
    }
  }
}
// [End parallelList_start]
