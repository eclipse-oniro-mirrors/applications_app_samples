/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { router } from '@kit.ArkUI'
import { BreakpointConstants, getMenuInfo, MenuData, MenuUrl, Style } from '@ohos/common'
import UpdateTimeDialog from './UpdateTimeDialog'

@Component
export default struct IndexTitleBar {
  @State popupState: boolean = false
  @StorageProp('curBp') @Watch('curBpChange') curBp: string = BreakpointConstants.SM
  @Link showSideBar: boolean
  @StorageLink('titleText') titleText: string[] = []
  @StorageLink('swiperIndex') swiperIndex: number = 0
  private showDialog: boolean = false
  private dialogController?: CustomDialogController = undefined

  @Builder popupBuilder() {
    Row() {
      Column() {
        ForEach(getMenuInfo(), (item: MenuData, index: number) => {
          if (index > 0) {
            Divider()
              .width('100%')
              .color($r('app.color.divider'))
              .margin({ top: Style.MENU_DIVIDER_MARGIN, bottom: Style.MENU_DIVIDER_MARGIN })
          }
          Text(item.title)
            .id(`menu${index}`)
            .fontSize(Style.FONT_SIZE_MEDIUM)
            .fontColor($r('app.color.text_primary'))
            .fontWeight(FontWeight.Regular)
            .width('100%')
            .onClick(() => {
              if (item.url !== MenuUrl.NONE) {
                this.popupState = false
                if (this.showSideBar) {
                  this.showSideBar = false
                }
                router.pushUrl({ url: item.url })
              } else {
                if (this.dialogController === undefined) {
                  this.dialogController = new CustomDialogController({
                    builder: UpdateTimeDialog({ handleCancelDialog: this.cancelDialog }),
                    autoCancel: false,
                    customStyle: true
                  })
                }
                this.showDialog = true
                this.popupState = false
                this.dialogController?.open()
              }
            })
        }, (item: MenuData) => item.title)
      }
      .width(Style.MENU_POPUP_WIDTH)
      .padding(Style.MENU_POPUP_PADDING)
      .backgroundColor($r('app.color.white'))
      .borderRadius(Style.NORMAL_RADIUS)
    }
    .padding({ right: Style.MENU_POPUP_RIGHT_PADDING })
  }

  build() {
    Row() {
      if (!this.showSideBar && this.curBp === BreakpointConstants.LG) {
        Image($r('app.media.icon_subarea'))
          .id('iconSubarea')
          .size({ width: Style.ICON_SIZE_NORMAL, height: Style.ICON_SIZE_NORMAL })
          .objectFit(ImageFit.Contain)
          .onClick(() => {
            this.showSideBar = !this.showSideBar
          })
      }
      Text(this.titleText[this.swiperIndex])
        .fontSize(Style.FONT_SIZE_TITLE)
        .fontColor($r('app.color.white'))
        .textAlign(TextAlign.Center)
        .margin({ left: (!this.showSideBar && this.curBp === BreakpointConstants.LG) ? 0 : Style.TITLE_TEXT_MARGIN })
        .layoutWeight(1)

      Image($r('app.media.icon_more'))
        .id('menuPopup')
        .size({ width: Style.ICON_SIZE_NORMAL, height: Style.ICON_SIZE_NORMAL })
        .objectFit(ImageFit.Fill)
        .bindPopup(this.popupState, {
          builder: this.popupBuilder,
          placement: Placement.BottomLeft,
          maskColor: $r('app.color.mask_popup'),
          popupColor: $r('app.color.transparent'),
          enableArrow: false,
          onStateChange: (e) => {
            if (!e.isVisible) {
              this.popupState = false
            }
          }
        })
        .onClick(() => {
          this.popupState = !this.popupState
        })
    }
    .width('100%')
    .height('100%')
    .padding({ left: Style.NORMAL_PADDING, right: Style.NORMAL_PADDING })
  }

  cancelDialog = () => {
    this.dialogController?.close()
    this.showDialog = false
  }

  curBpChange() {
    if (this.showDialog) {
      this.dialogController?.close()
      this.dialogController = new CustomDialogController({
        builder: UpdateTimeDialog({ handleCancelDialog: this.cancelDialog }),
        autoCancel: false,
        customStyle: true
      })
      this.dialogController?.open()
    }
  }
}