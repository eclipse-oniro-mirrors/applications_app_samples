/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
struct Index {
  build() {
    Row() {
      Column({ space: 60 }) {
        Button($r('app.string.switchPageButton1'))
          .width('80%') // button width takes 80% of screen width
          .height('10%') // button height takes 10% of screen height
          .fontSize($r('app.float.size_25')) // button font size is 25
          .borderRadius($r('app.float.size_25')) // button corner radius is 25
          .backgroundColor($r('app.color.whiteColor')) // button background color is white
          .shadow({
            radius: $r('app.float.size_10'), // shadow radius is 10
            color: $r('app.color.grayColor'), // shadow color is gray
            offsetX: $r('app.float.size_15'), // shadow horizontal offset is 15
            offsetY: $r('app.float.size_15') // shadow vertical offset is 15
          })
          .fontColor($r('app.color.blackColor')) // button font color is black
          .onClick(() => {
            this.getUIContext().getRouter().pushUrl({
              url: 'filemanager/pages/FileManagerApplication',
            })
          })
        Button($r('app.string.switchPageButton2'))
          .width('80%') // button width takes 80% of screen width
          .height('10%') // button height takes 10% of screen height
          .fontSize($r('app.float.size_25')) // button font size is 25
          .borderRadius($r('app.float.size_25')) // button corner radius is 25
          .backgroundColor($r('app.color.whiteColor')) // button background color is white
          .shadow({
            radius: $r('app.float.size_10'), // shadow radius is 10
            color: $r('app.color.grayColor'), // shadow color is gray
            offsetX: $r('app.float.size_15'), // shadow horizontal offset is 15
            offsetY: $r('app.float.size_15') // shadow vertical offset is 15
          })
          .fontColor($r('app.color.blackColor')) // button font color is black
          .onClick(() => {
            this.getUIContext().getRouter().pushUrl({
              url: 'filemanager/pages/ListeningForDeviceOnline',
            })
          })

      }
      .width('100%') // outer column width fills the screen
      .height('100%') // outer column height fills the screen
      .alignItems(HorizontalAlign.Center) // align items horizontally centered
      .justifyContent(FlexAlign.Center) // justify content vertically centered
      .backgroundColor($r('app.color.lightGrayColor')) // background color is light gray
    }
  }
}