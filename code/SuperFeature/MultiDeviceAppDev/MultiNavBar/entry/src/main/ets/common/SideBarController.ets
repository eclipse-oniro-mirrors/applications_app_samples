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

import { BreakpointType, SideBarMode } from '../common/BreakpointSystem';
import { StyleConfiguration } from '../common/Configuration';
import {
  BreakpointKey,
  Color,
  ComponentId,
  Dimen,
  DimenText,
  DurationMs,
  FontSize,
  Radius,
  SideBarModeKey,
  Spacing,
  Threshold
} from '../common/Constants';
import { MenuType } from '../model/MenuType';
import { sideListData } from '../model/SideListData';

@Component
export struct SideBarController {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageLink("currentSideBarMode") currentSideBarMode: string = SideBarModeKey.TABS;
  @Link currentSubIndex: number;
  @Link currentMainIndex: number;
  mainController: TabsController = new TabsController();

  build() {
    Scroll() {
      Column() {
        if (new BreakpointType(false, true, true).GetValue(this.currentBreakpoint)) {
          Row() {
            Image($r('app.media.ic_public_drawer'))
              .width(Dimen.ICON)
              .height(Dimen.ICON)
              .margin({ top: Dimen.DRAWER_ICON_MARGIN_TOP, left: new SideBarMode(0, Spacing.LG)
                .GetValue(this.currentSideBarMode) })
              .id(ComponentId.SWITCH_BUTTON)
              .onClick(() => {
                animateTo({ duration: DurationMs.ANIMATION }, () => {
                  this.currentSideBarMode = this.currentSideBarMode === SideBarModeKey.TABS ?
                  SideBarModeKey.LIST : SideBarModeKey.TABS;
                })
              })
          }
          .width(DimenText.FULL)
          .justifyContent(new SideBarMode(FlexAlign.Center, FlexAlign.Start).GetValue(this.currentSideBarMode))
        }

        SideBarPrimaryNavigation({
          currentMainIndex: $currentMainIndex,
          currentSubIndex: $currentSubIndex,
          mainController: this.mainController
        }).layoutWeight(1)

        if (new BreakpointType(false, true, true).GetValue(this.currentBreakpoint)) {
          FootBarTools()
        }
      }.height(DimenText.FULL).backgroundColor(Color.PAGE_BACKGROUND)
    }.scrollBar(BarState.Off)
  }
}

@Component
struct AccountInfo {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageProp("currentSideBarMode") currentSideBarMode: string = SideBarModeKey.TABS;

  build() {
    Row() {
      Image($r('app.media.ic_mine_normal'))
        .width($r('app.float.icon_size'))
        .height($r(
          'app.float.icon_size'))
      if (this.currentSideBarMode === SideBarModeKey.TABS) {
        Column() {
          Text($r('app.string.accountTitle'))
            .id(ComponentId.ACCOUNT_TITLE)
            .fontSize(FontSize.SECTION_TITLE)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.TEXT_PRIMARY)
          Text($r('app.string.accountNumber'))
            .id(ComponentId.ACCOUNT_NUMBER)
            .fontSize(FontSize.SECTION_TITLE)
            .fontWeight(FontWeight.Medium)
            .fontColor(Color.TEXT_PRIMARY)
        }
        .transition({ type: TransitionType.All, opacity: 0 })
        .justifyContent(FlexAlign.SpaceAround)
        .alignItems(HorizontalAlign.Start)
        .layoutWeight(1)
        .margin({ left: Spacing.MD })
      }
    }.height(Dimen.LIST_ITEM_HEIGHT).margin({ left: new SideBarMode(0, Spacing.MD).GetValue(this.currentSideBarMode) })
  }
}


@Component
export struct SearchModule {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageLink("currentSideBarMode") @Watch('onCurrentSideBarModeChange')
  currentSideBarMode: string = SideBarModeKey.TABS;
  @State searchCompWidth: number | string = DimenText.FULL;
  controller: SearchController = new SearchController();
  @State searchFocusAble: boolean = true;
  @State placeholderText: Resource = $r('app.string.search');

  aboutToAppear() {
    if (this.currentSideBarMode === SideBarModeKey.LIST) {
      this.searchCompWidth = Dimen.SEARCH_COLLAPSED_WIDTH;
      this.placeholderText = $r('app.string.emptyString');
    }
  }

  onCurrentSideBarModeChange() {
    animateTo({ duration: DurationMs.ANIMATION, onFinish: () => {
      this.searchFocusAble = this.currentSideBarMode === SideBarModeKey.TABS ? true : false;
    } }, () => {
      this.searchCompWidth = this.searchCompWidth === DimenText.FULL ?
      Dimen.SEARCH_COLLAPSED_WIDTH : DimenText.FULL;
      this.placeholderText = this.searchCompWidth === Dimen.SEARCH_COLLAPSED_WIDTH ?
      $r('app.string.emptyString') : $r('app.string.search');
    })
  }

  build() {
    Row() {
      Search({
        placeholder: new BreakpointType($r('app.string.search'), this.placeholderText, this.placeholderText).GetValue(this.currentBreakpoint),
      })
        .focusable(this.searchFocusAble)
        .width(DimenText.FULL)
        .height(Dimen.SEARCH_HEIGHT)
        .id(ComponentId.SEARCH_BUTTON)
        .onTouch((event: TouchEvent) => {
          animateTo({ duration: DurationMs.ANIMATION }, () => {
            if (event.type === TouchType.Up && this.currentSideBarMode === SideBarModeKey.LIST) {
              this.currentSideBarMode = SideBarModeKey.TABS;
            }
          })
        })
        .backgroundColor(Color.CONTENT_BACKGROUND)
    }
    .width(new BreakpointType(DimenText.FULL, this.searchCompWidth, this.searchCompWidth)
      .GetValue(this.currentBreakpoint))
    .height(Dimen.NAV_ROW_HEIGHT)
    .padding(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
      .searchModulePadding)
    .margin({ bottom: Spacing.SM })
  }
}

@Component
export struct SideBarPrimaryNavigation {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageProp("currentSideBarMode") currentSideBarMode: string = SideBarModeKey.TABS;
  @State sideListData: MenuType[] = sideListData;
  mainController: TabsController = new TabsController();
  @Link currentSubIndex: number;
  @Link currentMainIndex: number;

  subControllerChangeIndex(subController: TabsController, index: number) {
    subController.changeIndex(index);
  }

  build() {
    List() {
      if (new BreakpointType(false, true, true).GetValue(this.currentBreakpoint)) {
        ListItem() {
          AccountInfo()
        }

        ListItem() {
          SearchModule()
        }
      }


      ForEach(this.sideListData, (item: MenuType, index: number) => {
        ListItem() {
          if (this.currentBreakpoint !== BreakpointKey.SM && index === this.sideListData.length - 1) {

          } else {
            Column() {
              PrimaryMenu({
                sideTitleName: item.name,
                subTitleNameList: item.subTitleList,
                changeIndex: () => this.subControllerChangeIndex,
                tabsController: item.subController,
                mainTabsController: this.mainController,
                icon: item.icon,
                currentSubIndex: $currentSubIndex,
                index: index,
                currentMainIndex: $currentMainIndex
              })
            }
          }
        }.width(StyleConfiguration.getBreakpointStyle(this.currentBreakpoint).sideBarPrimaryNavListItemWidth)
      })
    }
    .margin({ top: StyleConfiguration.getBreakpointStyle(this.currentBreakpoint).sideBarPrimaryNavListMargin })
    .padding(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
      .sideBarPrimaryNavListPadding)
    .height(StyleConfiguration.getBreakpointStyle(this.currentBreakpoint).sideBarPrimaryNavListHeight)
    .backgroundColor(Color.PAGE_BACKGROUND)
    .listDirection(new BreakpointType(Axis.Horizontal, Axis.Vertical, Axis.Vertical).GetValue(this.currentBreakpoint))
    .width(DimenText.FULL)
    .alignListItem(ListItemAlign.Center)
  }
}


@Component
export struct PrimaryMenu {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageProp("currentSideBarMode") currentSideBarMode: string = SideBarModeKey.TABS;
  @Link currentSubIndex: number;
  @Link currentMainIndex: number;
  sideTitleName: Resource = $r('app.string.index');
  subTitleNameList: MenuType[] = new Array();
  changeIndex: (controller: TabsController, index: number) => void = () => {
  };
  tabsController: TabsController = new TabsController();
  mainTabsController: TabsController = new TabsController();
  icon: Resource = $r('app.media.icon');
  index: number = 0;
  @State isItemWrap: boolean = false;
  @State iconList: Resource[] = [
  $r('app.media.ic_home_actived'),
  $r('app.media.ic_app_actived'),
  $r('app.media.ic_game_actived'),
  $r('app.media.ic_search_actived'),
  $r('app.media.ic_mine_actived'),
  ];

  getSelectColor(): string {
    if (this.index === 0 && (this.index !== this.currentMainIndex ||
      this.currentSideBarMode === SideBarModeKey.TABS)) {
      return Color.ICON_MUTED;
    } else if (this.currentSideBarMode === SideBarModeKey.TABS) {
      return DimenText.EMPTY;
    } else {
      return StyleConfiguration.getCurrentMainTabsStyle(this.index, this.currentMainIndex, this.currentBreakpoint)
        .fillColor ?? DimenText.EMPTY;
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Column() {
        Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center, alignItems: ItemAlign.Start }) {
          Flex({
            direction: this.isItemWrap ? FlexDirection.Column : new BreakpointType(FlexDirection.Row, FlexDirection.Row,
              this.currentSideBarMode === SideBarModeKey.LIST ? FlexDirection.Column : FlexDirection.Row)
              .GetValue(this.currentBreakpoint),
            justifyContent: StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
              .sideBarPrimaryMenuFlexAlign,
            alignItems: ItemAlign.Center,
            alignContent: new BreakpointType(FlexAlign.Start, FlexAlign.Start, FlexAlign.Center).GetValue(this.currentBreakpoint),
          }) {
            Image((this.index === this.currentMainIndex) &&
              (this.currentSideBarMode === SideBarModeKey.LIST || this.currentBreakpoint === BreakpointKey.SM) ?
              this.iconList[this.index] : this.icon)
              .width(Dimen.ICON)
              .height(Dimen.ICON)
              .fillColor(this.getSelectColor())
              .margin(this.isItemWrap ? StyleConfiguration.getBreakpointStyle(this.currentBreakpoint)
                .sideBarPrimaryMenuImgMargin : 0)
            if (this.currentSideBarMode === SideBarModeKey.TABS ||
              (this.currentBreakpoint !== BreakpointKey.MD && this.currentSideBarMode === SideBarModeKey.LIST)) {
              Text(this.sideTitleName)
                .fontColor(this.currentSideBarMode === SideBarModeKey.TABS ? Color.TEXT_SECONDARY :
                StyleConfiguration
                  .getCurrentMainTabsStyle(this.index, this.currentMainIndex, this.currentBreakpoint)
                  .fontColor as ResourceColor)
                .fontSize(StyleConfiguration.getBreakpointStyle(this.currentBreakpoint).sideBarPrimaryMenuTextSize)
                .height(StyleConfiguration.getBreakpointStyle(this.currentBreakpoint).sideBarPrimaryMenuTextHeight)
                .fontWeight(FontWeight.Medium)
                .margin(this.currentBreakpoint === BreakpointKey.SM && !this.isItemWrap ?
                  {
                    left: Spacing.XXS
                  } : StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
                  .sideBarPrimaryMenuTextMargin)
                .textAlign(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
                  .primaryMenuTextAlign)
                .transition({ type: TransitionType.All, opacity: 0 })
            }
          }
          .onClick(() => {
            animateTo({ duration: DurationMs.ANIMATION }, () => {
              this.currentMainIndex = this.index;
              this.currentSubIndex = 0;
              this.mainTabsController.changeIndex(this.index);
            })
          })
          .width(DimenText.FULL)
          .height(new BreakpointType(Dimen.NAV_ROW_HEIGHT, Dimen.NAV_ROW_HEIGHT_COMPACT,
            this.currentSideBarMode === SideBarModeKey.LIST ? Dimen.NAV_ROW_HEIGHT : Dimen.NAV_ROW_HEIGHT_COMPACT)
            .GetValue(this.currentBreakpoint))
          .padding(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
            .sideBarPrimaryMenuListPadding)
          .onAreaChange((oldVal, newVal) => {
            if (newVal.width > Threshold.MENU_WRAP_WIDTH) {
              this.isItemWrap = false;
            } else {
              this.isItemWrap = true;
            }
          })


          if (this.currentMainIndex === this.index
            && new BreakpointType(false, true, true).GetValue(this.currentBreakpoint)
            && this.currentSideBarMode === SideBarModeKey.TABS) {
            SecondaryMenu({
              subTitleNameList: this.subTitleNameList,
              changeIndex: this.changeIndex,
              tabsController: this.tabsController,
              currentSubIndex: $currentSubIndex
            })
          }
        }
      }
      .alignItems(new BreakpointType(HorizontalAlign.Center, HorizontalAlign.Start,
        HorizontalAlign.Start).GetValue(this.currentBreakpoint))
    }
    .backgroundColor(Color.PAGE_BACKGROUND)
  }
}

@Component
export struct SecondaryMenu {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageProp("currentSideBarMode") currentSideBarMode: string = SideBarModeKey.TABS;
  @Link currentSubIndex: number | undefined;
  subTitleNameList: MenuType[] = new Array();
  changeIndex: (controller: TabsController, index: number) => void = () => {
  };
  tabsController: TabsController = new TabsController();

  build() {
    Column() {
      Column() {
        List({
          space: StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
            .secondMenuListSpace
        }) {
          ForEach(this.subTitleNameList, (item: MenuType, index: number) => {
            ListItem() {
              Column() {
                Text(item.name)
                  .fontSize(StyleConfiguration.getCurrentSubTabsStyle(this.currentBreakpoint, this.currentSideBarMode, index, this.currentSubIndex)
                    .fontSize)
                  .fontWeight(FontWeight.Medium)
                  .fontColor(StyleConfiguration.getCurrentSubTabsStyle(this.currentBreakpoint, this.currentSideBarMode, index, this.currentSubIndex)
                    .fontColor as ResourceColor)
                  .margin(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
                    .secondMenuListItemMargin)
              }
              .height(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
                .secondMenuListItemHeight)
              .padding({ top: Spacing.MD, bottom: Spacing.MD })
              .justifyContent(new BreakpointType(FlexAlign.End, FlexAlign.Center, FlexAlign.Center)
                .GetValue(this.currentBreakpoint))
              .alignItems(new BreakpointType(HorizontalAlign.Center, HorizontalAlign.Start,
                HorizontalAlign.Start).GetValue(this.currentBreakpoint))
              .borderRadius(Radius.SM)
              .width(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
                .secondMenuListItemWidth)
              .backgroundColor(StyleConfiguration.getCurrentSubTabsStyle(this.currentBreakpoint, this.currentSideBarMode, index, this.currentSubIndex)
                .backgroundColor as ResourceColor)
            }.onClick(() => {
              animateTo({ duration: DurationMs.ANIMATION }, () => {
                this.currentSubIndex = index;
                this.changeIndex(this.tabsController, index);
              })
            })
          })
        }
        .width(DimenText.FULL)
        .listDirection(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
          .secondMenuListDirection)
        .alignListItem(ListItemAlign.Center)
      }.width(DimenText.FULL)
    }
    .clip(true)
    .transition({ opacity: 0 })
    .width(DimenText.FULL)
  }
}

interface MenuElement {
  value: ResourceStr;
  action: () => void;
  icon?: Resource;
}

@Component
struct FootBarTools {
  @LocalStorageProp("currentBreakpoint") currentBreakpoint: string = BreakpointKey.MD;
  @LocalStorageProp("currentSideBarMode") currentSideBarMode: string = SideBarModeKey.TABS;
  @State toolList: MenuElement[] = [
    { value: $r('app.string.toolMenuItem', 1), action: this.callback, icon: $r('app.media.ic_favourites') },
  ];

  callback() {
  }

  build() {
    Column() {
      List({ space: Spacing.LG }) {
        if (this.currentSideBarMode === SideBarModeKey.TABS) {
          ForEach(this.toolList, (item: MenuElement) => {
            ListItem() {
              Image(item.icon).width(Dimen.ICON).height(Dimen.ICON)
            }
          })
          ListItem() {
            Image($r('app.media.add')).width(Dimen.ICON).height(Dimen.ICON).onClick(() => {
              this.toolList.push(
                {
                  value: $r('app.string.toolMenuItem', this.toolList.length + 1),
                  action: this.callback,
                  icon: $r('app.media.ic_favourites3')
                })
            })
              .id(ComponentId.ADD_TOOLS)
          }
        } else {
          ListItem() {
            Column() {
              if (this.toolList.length >= Threshold.TOOL_ICON_MORE_MIN_COUNT) {
                Image($r('app.media.more'))
                  .width(Dimen.ICON)
                  .height(Dimen.ICON)
                  .bindMenu(this.toolList, { placement: Placement.TopRight })
                  .id(ComponentId.MORE_TOOLS)
              } else {
                Image($r('app.media.ic_favourites')).width(Dimen.ICON).height(Dimen.ICON)
                  .fillColor(Color.TEXT_PRIMARY)
              }
            }.width(DimenText.FULL)
          }
        }
      }
      .listDirection(Axis.Horizontal)
      .height(Dimen.TOOL_BAR_HEIGHT)
      .width(DimenText.FULL)
      .padding(StyleConfiguration.getSubTabsControllerStyle(this.currentBreakpoint, this.currentSideBarMode)
        .toolBarPadding)
      .alignListItem(ListItemAlign.Center)
    }
  }
}
