/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { AppDetailPageBuilder } from './pages/AppDetailPage';
import { AppListPageBuilder, NsNav } from './pages/AppListPage';
import { PolicyPage } from './pages/PolicyPage';
import { SecurityPage } from './pages/SecurityPage';

// Fixed width of the left navigation column in the tablet layout.
const NAV_WIDTH: number = 200;

/**
 * Main page that hosts the security and policy demo pages behind a responsive navigation.
 */
@ComponentV2
export struct MainPage {
  // Index of the currently selected tab.
  @Local currentIndex: number = 0;
  // Whether the current breakpoint maps to the wide two-pane layout.
  @Local isWide: boolean = false;

  /**
   * Build one bottom tab bar item that highlights the selected tab.
   * @param title tab title resource.
   * @param index tab index used for the selected-state comparison.
   * @param idValue accessibility id of the tab item.
   */
  @Builder
  tabBarItem(title: ResourceStr, index: number, idValue: string) {
    Column({ space: 4 }) {
      Text(title)
        .fontSize(14)
        .fontWeight(this.currentIndex === index ? FontWeight.Medium : FontWeight.Regular)
        .fontColor(this.currentIndex === index ? $r('app.color.brand_primary') : $r('app.color.text_tertiary'))
    }
    .id(idValue)
    .width('100%')
    .height(56)
    .justifyContent(FlexAlign.Center)
  }

  /**
   * Build one clickable side navigation item used by the tablet layout.
   * @param title navigation title resource.
   * @param index navigation index used for the selected-state comparison.
   * @param idValue accessibility id of the navigation item.
   */
  @Builder
  navItem(title: ResourceStr, index: number, idValue: string) {
    Row() {
      Text(title)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? FontWeight.Medium : FontWeight.Regular)
        .fontColor(this.currentIndex === index ? $r('app.color.brand_primary') : $r('app.color.text_primary'))
    }
    .id(idValue)
    .width('100%')
    .height(48)
    .padding({ left: 16, right: 16 })
    .borderRadius(8)
    .backgroundColor(this.currentIndex === index ? $r('app.color.brand_light') : $r('app.color.card_bg'))
    .clickEffect({ level: ClickEffectLevel.LIGHT })
    .onClick(() => {
      // Switch the active page to the tapped navigation item.
      this.currentIndex = index;
    })
  }

  /**
   * Build the phone layout with a bottom tab bar.
   */
  @Builder
  phoneLayout() {
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
      TabContent() {
        SecurityPage()
      }
      .tabBar(this.tabBarItem($r('app.string.ns_tab_security'), 0, 'id_tab_security'))

      TabContent() {
        PolicyPage()
      }
      .tabBar(this.tabBarItem($r('app.string.ns_tab_policy'), 1, 'id_tab_policy'))
    }
    .id('id_main_tabs')
    .width('100%')
    .height('100%')
    .barHeight(56)
    .barMode(BarMode.Fixed)
    .barBackgroundColor($r('app.color.card_bg'))
    .animationDuration(200)
    .onChange((index: number) => {
      // Keep the local index in sync with swipe-driven tab changes.
      this.currentIndex = index;
    })
  }

  /**
   * Build the tablet layout with a left navigation column and stacked page hosts.
   */
  @Builder
  tabletLayout() {
    Row() {
      Column({ space: 8 }) {
        // Security entry in the side navigation.
        this.navItem($r('app.string.ns_tab_security'), 0, 'id_nav_security')
        // Policy entry in the side navigation.
        this.navItem($r('app.string.ns_tab_policy'), 1, 'id_nav_policy')
      }
      .id('id_main_nav')
      .width(NAV_WIDTH)
      .height('100%')
      .padding(12)
      .backgroundColor($r('app.color.card_bg'))
      .borderRadius(12)
      .alignItems(HorizontalAlign.Start)

      Stack() {
        Column() {
          SecurityPage()
        }
        .id('id_main_security_host')
        .width('100%')
        .height('100%')
        .visibility(this.currentIndex === 0 ? Visibility.Visible : Visibility.None)

        Column() {
          PolicyPage()
        }
        .id('id_main_policy_host')
        .width('100%')
        .height('100%')
        .visibility(this.currentIndex === 1 ? Visibility.Visible : Visibility.None)
      }
      .id('id_main_content')
      .layoutWeight(1)
      .height('100%')
      .margin({ left: 12 })
      .alignContent(Alignment.TopStart)
    }
    .id('id_tablet_layout')
    .width('100%')
    .height('100%')
    .padding({ left: 24 })
    .alignItems(VerticalAlign.Top)
  }

  // Navigation stack shared with the app list and app detail destinations.
  pageStack: NavPathStack = new NavPathStack();

  /**
   * Bind the navigation stack for the push helpers of the entry pages.
   */
  aboutToAppear(): void {
    // Share the stack so PolicyPage can push the two application pages.
    NsNav.bind(this.pageStack);
  }

  /**
   * Map the pushed route names to the NavDestination builders of the application pages.
   * @param name route name pushed onto the navigation stack.
   */
  @Builder
  pageMap(name: string) {
    // Show the installed application list page.
    if (name === 'AppListPage') {
      AppListPageBuilder()
    } else if (name === 'AppDetailPage') {
      // Show the application detail page.
      AppDetailPageBuilder()
    }
  }

  /**
   * Build the page header and switch between phone and tablet layouts by breakpoint.
   */
  build() {
    Navigation(this.pageStack) {
    Column() {
      Column({ space: 4 }) {
        Text($r('app.string.ns_app_title'))
          .id('id_main_title')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
        Text($r('app.string.ns_app_slogan'))
          .id('id_main_slogan')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
      }
      .id('id_main_header')
      .width('100%')
      .padding({ left: 24, right: 24, top: 16, bottom: 12 })
      .alignItems(HorizontalAlign.Start)

      GridRow({ columns: { xs: 4, sm: 4, md: 8, lg: 12 } }) {
        GridCol({ span: { xs: 4, sm: 4, md: 8, lg: 12 } }) {
          // Pick the two-pane tablet layout or the phone tab layout by breakpoint.
          if (this.isWide) {
            this.tabletLayout()
          } else {
            this.phoneLayout()
          }
        }
        .id('id_main_breakpoint')
        .height('100%')
      }
      .id('id_main_layout')
      .width('100%')
      .layoutWeight(1)
      .onBreakpointChange((breakpoint: string) => {
        // md and lg breakpoints switch to the wide two-pane layout.
        this.isWide = breakpoint === 'md' || breakpoint === 'lg';
      })
    }
    .id('id_main_page')
    .width('100%')
    .height('100%')
    .padding({ bottom: 16 })
    .backgroundColor($r('app.color.page_bg'))
    }
    .id('id_main_navigation')
    .navDestination(this.pageMap)
    .mode(NavigationMode.Stack)
    .hideTitleBar(true)
    .hideToolBar(true)
    .width('100%')
    .height('100%')
  }
}
