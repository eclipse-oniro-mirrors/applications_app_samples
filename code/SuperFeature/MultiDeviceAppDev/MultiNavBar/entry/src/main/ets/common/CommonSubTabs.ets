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

import { BreakpointType } from '../common/BreakpointSystem';
import { StyleConfiguration } from '../common/Configuration';
import { BreakpointKey, Dimen, DimenText, FontSize, SideBarModeKey } from '../common/Constants';
import { MenuType } from '../model/MenuType';
import { RecommendationList } from './RecommendationList';
import { SearchModule, SecondaryMenu } from './SideBarController';

@Component
export struct CommonSubTabs {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @Link currentSubIndex: number;
  subTabsController: TabsController = new TabsController();
  subTabsContentList: MenuType[] = new Array();
  @LocalStorageProp("currentSideBarMode") currentSideBarMode: string = SideBarModeKey.TABS;

  subControllerChangeIndex(subController: TabsController, index: number) {
    subController.changeIndex(index);
  }

  build() {
    Column() {
      if (StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
        .isShowSecondMenu) {
        Column() {
          SecondaryMenu({
            subTitleNameList: this.subTabsContentList,
            changeIndex: this.subControllerChangeIndex,
            tabsController: this.subTabsController,
            currentSubIndex: $currentSubIndex
          }).height(Dimen.NAV_ROW_HEIGHT)
        }.width(DimenText.FULL)
      }

      SearchModule()
        .visibility(new BreakpointType(true, false, false).GetValue(this.currentBreakpoint) ? Visibility.Visible :
        Visibility.None)

      Tabs({ barPosition: BarPosition.Start, controller: this.subTabsController, index: this.currentSubIndex }) {
        ForEach(this.subTabsContentList, (item: MenuType, index: number) => {
          if (index === 0) {
            TabContent() {
              Column() {
                if (StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
                  .isShowPageTitle) {
                  SubTabsContentTitle({ subTabsTitleName: item.name })
                }

                RecommendationList()
                  .layoutWeight(1)
                  .margin(StyleConfiguration.getBreakpointStyle(this.currentBreakpoint)
                    .recommendCompMargin)
              }.height(DimenText.FULL).width(DimenText.FULL)
            }
          } else {
            TabContent()
          }
        }, (item: MenuType) => JSON.stringify(item))
      }
      .scrollable(false)
      .layoutWeight(1)
      .barHeight(0)
      .onChange((index: number) => {
        this.currentSubIndex = index;
      })
      .width(DimenText.FULL)
    }
  }
}

@Component
struct SubTabsContentTitle {
  subTabsTitleName: Resource = $r('app.string.recommend');
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;

  build() {
    Row() {
      Text(this.subTabsTitleName)
        .fontSize(FontSize.PAGE_TITLE)
        .fontWeight(FontWeight.Medium)
    }
    .width(DimenText.FULL)
    .height(Dimen.NAV_ROW_HEIGHT)
  }
}
