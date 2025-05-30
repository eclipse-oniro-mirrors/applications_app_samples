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
import contact from '@ohos.contact'
import Logger from '../data/Logger'

const TAG: string = 'ContactInfo'

@Preview
@Component
export struct ContactInfo {
  @State contact: contact.Contact = undefined

  build() {
    Column() {
      Column() {
        Text(this.contact.name.fullName.substring(0, 1)
          .toUpperCase())
          .width(130)
          .height(130)
          .fontSize(30)
          .fontColor(Color.White)
          .borderRadius(100)
          .margin({ top: 62, bottom: 22 })
          .textAlign(TextAlign.Center)
          .backgroundColor($r('app.color.user_name_color'))

        Text(this.contact.name.fullName)
          .fontSize(32)
          .margin({ bottom: 16 })

        Column() {
          Row() {
            if (this.contact.phoneNumbers !== undefined) {
              Text(this.contact.phoneNumbers[0].phoneNumber)
                .width('50%')
                .fontSize(22)
                .margin({ left: 16 })
            } else {
              Text()
                .width('50%')
                .fontSize(22)
                .margin({ left: 16 })
            }

            Blank()

            Image($r('app.media.phone2'))
              .width(32)
              .height(32)
              .margin({ right: 24 })
              .objectFit(ImageFit.Contain)

            Image($r('app.media.note'))
              .width(32)
              .height(32)
              .margin({ right: 24 })
              .objectFit(ImageFit.Contain)
          }
          .width('100%')
          .height('50%')

          Divider()
            .width('90%')
            .strokeWidth(1)
            .color($r('app.color.color5'))

          Row() {
            Column() {
              Text($r('app.string.defaults'))
                .fontSize(22)
                .margin({ left: 16 })
              Text($r('app.string.phone_ring'))
                .fontSize(20)
                .fontColor(Color.Gray)
                .margin({ left: 16 })
            }
            .alignItems(HorizontalAlign.Start)

            Blank()
              .width('52%')

            Image($r('app.media.right'))
              .width(16)
              .height(32)
              .margin({ right: 24 })
          }
          .width('100%')
          .height('50%')
        }
        .width('90%')
        .height(178)
        .borderRadius(30)
        .backgroundColor(Color.White)
      }

      Blank()

      Divider()
        .strokeWidth(0.65)
        .color(Color.Black)
        .opacity(0.05)

      Row() {
        Column() {
          Image($r('app.media.editor'))
            .width(32)
            .height(32)
            .margin({ top: 6 })
            .objectFit(ImageFit.Contain)

          Text($r('app.string.editor'))
            .fontSize(14)
            .fontColor(Color.Black)
            .margin(4)
            .borderRadius(10)
        }
        .id('editContact')
        .onClick(() => {
          router.pushUrl({
            url: 'pages/EditContact',
            params: { data: this.contact }
          })
        })
        .layoutWeight(1)

        Column() {
          Image($r('app.media.delete'))
            .width(32)
            .height(32)
            .margin({ top: 6 })
            .objectFit(ImageFit.Contain)

          Text($r('app.string.delete'))
            .fontSize(14)
            .fontColor(Color.Black)
            .borderRadius(10)
        }
        .id('deleteContact')
        .onClick(async () => {
          AlertDialog.show(
            {
              title: $r('app.string.warning'),
              message: $r('app.string.delete_show'),
              primaryButton: {
                value: $r('app.string.confirm'),
                action: async () => {
                  await contact.deleteContact(this.contact.key)
                  router.replaceUrl({
                    url: 'pages/Index'
                  })
                  router.clear()
                }
              },
              secondaryButton: {
                value: $r('app.string.cancel'),
                action: () => {
                  Logger.info(TAG, `AlertDialog enter`)
                }
              },
              cancel: () => {
                Logger.info(TAG, `AlertDialog close`)
              }
            })
        })
        .layoutWeight(1)
      }
      .width('100%')
      .height('20%')
      .margin({ bottom: 10 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.index_bg'))
  }
}