/*
 * Copyright (c) 2022-2023 Huawei Device Co., Ltd.
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
import router from '@ohos.router'

@Component
export struct TitleBar {
  private title: string = ''

  build() {
    Row() {
      Image($r('app.media.back'))
        .id('back')
        .size({ width: 50, height: '100%' })
        .objectFit(ImageFit.Contain)
        .margin({ left: 10 })
        .onClick(() => {
          router.back()
        })
      Text(this.title)
        .fontColor(Color.Black)
        .fontSize(25)
        .layoutWeight(1)
    }
    .size({ width: '100%', height: '8%' })
    .constraintSize({ minHeight: 50 })
  }
}