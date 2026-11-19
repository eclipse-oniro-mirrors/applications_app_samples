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

import { MenuType } from '../model/MenuType';
import { sideListData } from '../model/SideListData';
import { CommonMainTabs } from '../common/CommonMainTabs';
import { StyleConfiguration } from '../common/Configuration';
import { SideBarController } from '../common/SideBarController';
import { BreakpointType, SideBarMode } from '../common/BreakpointSystem';
import {
  BreakpointKey,
  Color,
  Dimen,
  DimenText,
  DurationMs,
  GridColumns,
  SideBarModeKey
} from '../common/Constants';

let storage = LocalStorage.GetShared();

@Entry(storage)
@Component
struct Index {
  // @LocalStorageLink 的键名在 ArkTS 中必须是字符串字面量，无法引用 StorageKey。
  @LocalStorageLink("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageLink("currentSideBarMode") @Watch('onCurrentSideBarModeChange')
  currentSideBarMode: string = SideBarModeKey.TABS;
  @State sideListData: MenuType[] = sideListData;
  @State currentMainIndex: number = 0;
  @State currentSubIndex: number = 0;
  mainController: TabsController = new TabsController();
  @State sideBarWidth: number = Dimen.SIDE_BAR_WIDTH_MD;

  onCurrentSideBarModeChange() {
    animateTo({ duration: DurationMs.ANIMATION }, () => {
      if (this.currentSideBarMode === SideBarModeKey.LIST) {
        let sideBarWidth: number | undefined = new BreakpointType(Dimen.SIDE_BAR_WIDTH_SM, Dimen.SIDE_BAR_WIDTH_MD,
          Dimen.SIDE_BAR_WIDTH_LG).GetValue(this.currentBreakpoint);
        this.sideBarWidth = sideBarWidth === undefined ? this.sideBarWidth : sideBarWidth;
      } else {
        this.sideBarWidth = Dimen.SIDE_BAR_WIDTH_TABS;
      }
    })
  }

  getMinSideBarWidth(): number {
    let sideBarWidth: number | undefined = new SideBarMode(this.sideBarWidth, Dimen.SIDE_BAR_MIN_WIDTH_TABS)
      .GetValue(this.currentSideBarMode);
    return sideBarWidth === undefined ? this.sideBarWidth : sideBarWidth;
  }

  getMaxSideBarWidth(): number {
    let sideBarWidth: number | undefined = new SideBarMode(this.sideBarWidth, Dimen.SIDE_BAR_MAX_WIDTH_TABS)
      .GetValue(this.currentSideBarMode);
    return sideBarWidth === undefined ? this.sideBarWidth : sideBarWidth;
  }

  build() {
    GridRow({ columns: GridColumns.MAIN }) {
      GridCol({ span: GridColumns.MAIN }) {
        Column() {
          // md、lg模式
          Column() {
            SideBarContainer() {
              Column() {
                SideBarController({
                  currentMainIndex: $currentMainIndex,
                  currentSubIndex: $currentSubIndex,
                  mainController: this.mainController
                })
              }

              Column() {
                CommonMainTabs({
                  currentMainIndex: $currentMainIndex,
                  currentSubIndex: $currentSubIndex,
                  mainTabsController: this.mainController,
                  subTabsController: this.sideListData[this.currentMainIndex].subController,
                  mainTabsContentList: this.sideListData,
                })
              }.width(DimenText.FULL).height(DimenText.FULL).backgroundColor($r('sys.color.ohos_id_color_background'))
            }
            .showControlButton(false)
            .backgroundColor(Color.PAGE_BACKGROUND)
            .controlButton(StyleConfiguration.getBreakpointStyle(this.currentBreakpoint)
              .controlButtonStyle)
            .autoHide(false)
            .sideBarWidth(this.sideBarWidth)
            .minSideBarWidth(this.getMinSideBarWidth())
            .maxSideBarWidth(this.getMaxSideBarWidth())
          }
          .visibility(this.currentBreakpoint !== BreakpointKey.SM ? Visibility.Visible : Visibility.None)

          // sm模式
          Column() {
            CommonMainTabs({
              currentMainIndex: $currentMainIndex,
              currentSubIndex: $currentSubIndex,
              mainTabsController: this.mainController,
              subTabsController: this.sideListData[this.currentMainIndex].subController,
              mainTabsContentList: this.sideListData,
            }).layoutWeight(1)

            SideBarController({
              currentMainIndex: $currentMainIndex,
              currentSubIndex: $currentSubIndex,
              mainController: this.mainController
            }).height(Dimen.NAV_ROW_HEIGHT)
          }
          .visibility(this.currentBreakpoint === BreakpointKey.SM ? Visibility.Visible : Visibility.None)
        }
      }
    }.onBreakpointChange((breakpoints: string) => {
      this.currentBreakpoint = breakpoints;
      setTimeout(() => {
        animateTo({ duration: DurationMs.ANIMATION }, () => {
          if (this.currentSideBarMode === SideBarModeKey.LIST) {
            let sideBarWidth: number | undefined = new BreakpointType(Dimen.SIDE_BAR_WIDTH_SM, Dimen.SIDE_BAR_WIDTH_MD,
              Dimen.SIDE_BAR_WIDTH_LG).GetValue(this.currentBreakpoint);
            this.sideBarWidth = sideBarWidth === undefined ? this.sideBarWidth : sideBarWidth;
          }
        })
      }, DurationMs.LAYOUT_SYNC)
    })
  }
}
