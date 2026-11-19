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

import { PhotoContent } from '../common/PhotoContent';
import { PhotoSideBar } from '../common/PhotoSideBar';
import {
  BREAKPOINT_SM,
  CONTROL_BUTTON_HEIGHT,
  CONTROL_BUTTON_LEFT,
  CONTROL_BUTTON_TOP_PHOTO_ALBUM,
  CONTROL_BUTTON_WIDTH,
  KEY_CURRENT_BREAKPOINT,
  PHOTO_SIDE_BAR_MARGIN_TOP
} from '../common/Constants';

const storage: LocalStorage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct PhotoAlbum {
  @State sideBarStatus: boolean = true
  @LocalStorageLink(KEY_CURRENT_BREAKPOINT) currentBreakPoint: string = BREAKPOINT_SM

  build() {
    GridRow() {
      GridCol({ span: { sm: 12, md: 12, lg: 12 } }) {
        SideBarContainer(SideBarContainerType.AUTO) {
          Column() {
            PhotoSideBar().margin({ top: PHOTO_SIDE_BAR_MARGIN_TOP })
          }.backgroundColor($r('app.color.side_bar_background'))

          Column() {
            PhotoContent({ sideBarStatus: $sideBarStatus })
          }
        }
        .controlButton({
          left: CONTROL_BUTTON_LEFT,
          top: CONTROL_BUTTON_TOP_PHOTO_ALBUM,
          width: CONTROL_BUTTON_WIDTH,
          height: CONTROL_BUTTON_HEIGHT
        })
        .onChange((value: boolean) => {
          this.sideBarStatus = value;
        })
      }
    }.onBreakpointChange((breakpoint: string) => {
      this.currentBreakPoint = breakpoint;
    })
  }
}


