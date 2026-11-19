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

import { BreakpointConstants, getUpdateTimes, RadioGroup, Style } from '@ohos/common'

@Preview
@CustomDialog
export default struct UpdateTimeDialog {
  private controller: CustomDialogController
  private updateTimes: string[] = getUpdateTimes()
  handleCancelDialog: () => void = () => {}
  @StorageLink('curBp') curBp: string = BreakpointConstants.MD

  build() {
    GridRow({ columns: { sm: Style.GRID_COLUMN_SM, md: Style.GRID_COLUMN_MD, lg: Style.GRID_COLUMN_LG },
      gutter: { x: Style.GRID_GUTTER, y: Style.GRID_GUTTER },
      breakpoints: { reference: BreakpointsReference.WindowSize } }) {
      GridCol({ span: 4, offset: { sm: 0, md: 2, lg: 4 } }) {
        Row() {
          Column() {
            Text($r('app.string.update_time'))
              .width('100%')
              .fontSize(Style.FONT_SIZE_TITLE)
              .fontWeight(FontWeight.Medium)
              .margin({ top: Style.NORMAL_MARGIN })
            List() {
              ForEach(this.updateTimes, (item: string, index: number) => {
                ListItem() {
                  UpdateTimeItem({ index: index, updateTime: item })
                }
              }, (item: string) => item)
            }
            .lanes(this.curBp === BreakpointConstants.LG ? Style.UPDATE_TIME_LANES_LG : Style.UPDATE_TIME_LANES_DEFAULT)
            .divider({ strokeWidth: Style.DIVIDER_WIDTH })
            .margin({ top: Style.TIME_LIST_MARGIN })
            .width('100%')
            .height(this.calcListHeight())

            Text($r('app.string.cancel'))
              .width('100%')
              .fontSize(Style.FONT_SIZE_MEDIUM)
              .fontColor($r('app.color.dialog_action'))
              .textAlign(TextAlign.Center)
              .fontWeight(FontWeight.Medium)
              .margin({ top: Style.DIALOG_CANCEL_MARGIN_TOP, bottom: Style.DIALOG_CANCEL_MARGIN_BOTTOM })
              .onClick(() => {
                this.handleCancelDialog()
              })
          }
          .padding({ left: Style.DIALOG_PADDING, right: Style.DIALOG_PADDING })
          .backgroundColor($r('app.color.white'))
          .borderRadius(Style.LARGE_RADIUS)
        }
        .height('100%')
        .alignItems(this.curBp === BreakpointConstants.SM ? VerticalAlign.Bottom : VerticalAlign.Center)
        .padding({
          left: Style.DIALOG_PADDING_OUT,
          right: Style.DIALOG_PADDING_OUT,
          bottom: this.curBp === BreakpointConstants.SM ? Style.DIALOG_PADDING_OUT : 0
        })
      }
    }
  }

  calcListHeight() {
    if (this.curBp === BreakpointConstants.LG) {
      return Style.TIME_LIST_HEIGHT * this.updateTimes.length / Style.UPDATE_TIME_LANES_LG +
        Style.TIME_LIST_MARGIN
    } else {
      return Style.TIME_LIST_HEIGHT * this.updateTimes.length + Style.TIME_LIST_MARGIN
    }
  }
}

@Component
struct UpdateTimeItem {
  private index: number = 0
  private updateTime: string = ''
  @StorageLink('curBp') curBp: string = BreakpointConstants.MD

  build() {
    Row() {
      Text(this.updateTime)
        .fontSize(Style.FONT_SIZE_MEDIUM)
      Blank()
      Radio({ group: RadioGroup.UPDATE_TIME, value: this.updateTime })
        .width(Style.RADIO_SIZE)
        .height(Style.RADIO_SIZE)
    }
    .width('100%')
    .height(Style.TIME_LIST_HEIGHT)
    .padding(this.curBp === BreakpointConstants.LG ?
      (this.index % Style.UPDATE_TIME_LANES_LG === 0 ? { right: Style.DIALOG_LANE_GAP } : { left: Style.DIALOG_LANE_GAP }) : 0)
  }
}