/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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

import { MailNavigation } from '../common/MailNavigation';
import { MailSideBar } from '../common/MailSideBar';
import {
  BREAKPOINT_LG,
  BREAKPOINT_MD,
  BREAKPOINT_SM,
  CONTROL_BUTTON_HEIGHT,
  CONTROL_BUTTON_LEFT,
  CONTROL_BUTTON_TOP_MAILBOX,
  CONTROL_BUTTON_WIDTH,
  KEY_CURRENT_BREAKPOINT,
  MIN_CONTENT_WIDTH_MD_LG,
  MIN_CONTENT_WIDTH_SM,
  MIN_SIDE_BAR_WIDTH,
  SIDE_BAR_WIDTH
} from '../common/Constants';

const storage: LocalStorage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct MailBox {
  @LocalStorageLink(KEY_CURRENT_BREAKPOINT) currentBreakPoint: string = BREAKPOINT_MD
  @State isFold: boolean = false
  @State sideBarWidth: number = SIDE_BAR_WIDTH

  build() {
    GridRow() {
      GridCol({ span: { sm: 12, md: 12, lg: 12 } }) {
        SideBarContainer(SideBarContainerType.AUTO) {
          // Area A
          Column() {
            MailSideBar()
          }.width('100%').height('100%').backgroundColor($r('app.color.side_bar_background'))

          // Area B+C
          Column() {
            Stack() {
              MailNavigation()
              if (this.isFold && this.currentBreakPoint !== BREAKPOINT_LG) {
                Column().width('100%').height('100%').backgroundColor($r('app.color.mask_black'))
              }
            }
          }.height('100%').width('100%')
        }
        .sideBarWidth(this.sideBarWidth)
        .minSideBarWidth(MIN_SIDE_BAR_WIDTH)
        .minContentWidth(this.currentBreakPoint === BREAKPOINT_SM ? MIN_CONTENT_WIDTH_SM : MIN_CONTENT_WIDTH_MD_LG)
        .controlButton({
          left: CONTROL_BUTTON_LEFT,
          top: CONTROL_BUTTON_TOP_MAILBOX,
          width: CONTROL_BUTTON_WIDTH,
          height: CONTROL_BUTTON_HEIGHT
        })
        .showSideBar(this.currentBreakPoint === BREAKPOINT_LG)
        .onChange((value: boolean) => {
          this.isFold = value;
        })
      }
    }.onBreakpointChange((breakpoint: string) => {
      this.currentBreakPoint = breakpoint;
    })
  }
}



