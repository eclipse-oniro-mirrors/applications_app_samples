/**
 *
 * Copyright (c) 2025 Huawei Device Co., Ltd.
 *
 * All rights reserved.
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 *
 * Redistributions of source code must retain the above copyright notice,this
 * list of conditions and the following disclaimer.
 *
 * Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation
 * and/or other materials provided with the distribution.
 *
 * THIS IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS 'AS IS' AND ANY EXPRESS OR IMPLIED WARRANTIES,
 * INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
 * INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
 * STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS,
 *
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

'use static'

import { Entry, Text, Column, Component, Button, ClickEvent, Grid, GridItem, Image, Row, Stack, ToggleType, $r, ImageFit, Alignment, FontWeight, TextOverflow } from '@ohos.arkui.component';
import { State } from '@ohos.arkui.stateManagement';
import hilog from '@ohos.hilog';
import { ParallelizeUI } from '@ohos.arkui.Parallelize';
import { paramsObj } from './Index';

// 视频信息类
class Info {
  public title: string
  public up: string
  public views: string
  public likes: string
  public coverRes: string
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
  isEnable: boolean = false;
  @State stateVar: string = 'state var';
  @State arr:Array<Int>= [1]
  aboutToAppear() {
    const params = this.getUIContext().getRouter().getParams() as paramsObj;
    this.isEnable = params.isEnable;
    for (let i = 2; i <= 50; i++) {
      this.arr.push(i)
    }
  }

  build() {
    Column() {
      Grid() {
        ParallelizeUI<Int, Info>({ enable: this.isEnable }, this.arr,
          (item: Int, index: Int) => {
            const coverIndex = ((item - 1) % 5) + 1   // cycle through 1..5
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
            GridItem() {
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
      .columnsTemplate('1fr 1fr') // 两列网格
      .height('70%')
      .width('100%')
      .padding(10)
    }
  }
}