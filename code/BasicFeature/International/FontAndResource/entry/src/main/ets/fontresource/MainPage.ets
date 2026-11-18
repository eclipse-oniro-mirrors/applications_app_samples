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

// Import the font demo page shown in the first tab.
import { FontPage } from './pages/FontPage';
// Import the resource demo page shown in the second tab.
import { ResourcePage } from './pages/ResourcePage';

// The fixed width of the tablet side navigation column in vp.
const NAV_WIDTH: number = 200;

// The responsive shell that switches between phone tabs and tablet navigation.
@ComponentV2
export struct MainPage {
  // The index of the currently selected demo tab.
  @Local currentIndex: number = 0;
  // Whether the current breakpoint should render the wide tablet layout.
  @Local isWide: boolean = false;

  // Builds one bottom tab bar item for the phone layout.
  @Builder
  tabBarItem(title: ResourceStr, index: number, idValue: string) {
    // Stack the label inside a fixed height column.
    Column({ space: 4 }) {
      // Render the tab label with selection based styling.
      Text(title)
        .fontSize(14)
        .fontWeight(this.currentIndex === index ? FontWeight.Medium : FontWeight.Regular)
        .fontColor(this.currentIndex === index ? $r('app.color.brand_primary') : $r('app.color.text_tertiary'))
    }
    // Attach the tab item test id.
    .id(idValue)
    // Stretch the item across the tab width.
    .width('100%')
    // Keep the tab bar item at a fixed height.
    .height(56)
    // Center the label inside the item.
    .justifyContent(FlexAlign.Center)
  }

  // Builds one side navigation item for the tablet layout.
  @Builder
  navItem(title: ResourceStr, index: number, idValue: string) {
    // Wrap the label inside a clickable row.
    Row() {
      // Render the navigation label with selection based styling.
      Text(title)
        .fontSize(16)
        .fontWeight(this.currentIndex === index ? FontWeight.Medium : FontWeight.Regular)
        .fontColor(this.currentIndex === index ? $r('app.color.brand_primary') : $r('app.color.text_primary'))
    }
    // Attach the navigation item test id.
    .id(idValue)
    // Stretch the item across the navigation width.
    .width('100%')
    // Keep the navigation item at a fixed height.
    .height(48)
    // Pad the label inside the row.
    .padding({ left: 16, right: 16 })
    // Round the item corners to match the card style.
    .borderRadius(8)
    // Highlight the selected item with the brand tint background.
    .backgroundColor(this.currentIndex === index ? $r('app.color.brand_light') : $r('app.color.card_bg'))
    // Apply the light press feedback effect.
    .clickEffect({ level: ClickEffectLevel.LIGHT })
    .onClick(() => {
      // Select the tapped tab.
      this.currentIndex = index;
    })
  }

  // Builds the phone layout built on bottom tabs.
  @Builder
  phoneLayout() {
    // Render the bottom tab container bound to the selected index.
    Tabs({ barPosition: BarPosition.End, index: this.currentIndex }) {
      // Host the font page inside the first tab.
      TabContent() {
        // Render the font demo page.
        FontPage()
      }
      // Attach the font tab bar item.
      .tabBar(this.tabBarItem($r('app.string.fr_tab_font'), 0, 'id_tab_font'))

      // Host the resource page inside the second tab.
      TabContent() {
        // Render the resource demo page.
        ResourcePage()
      }
      // Attach the resource tab bar item.
      .tabBar(this.tabBarItem($r('app.string.fr_tab_resource'), 1, 'id_tab_resource'))
    }
    // Attach the tabs container test id.
    .id('id_main_tabs')
    // Stretch the tabs across the shell width.
    .width('100%')
    // Stretch the tabs across the shell height.
    .height('100%')
    // Keep the bottom bar at a fixed height.
    .barHeight(56)
    // Distribute the tab items evenly.
    .barMode(BarMode.Fixed)
    // Paint the bar with the card background color.
    .barBackgroundColor($r('app.color.card_bg'))
    // Animate the tab switch over a short duration.
    .animationDuration(200)
    .onChange((index: number) => {
      // Keep the selected index in sync with the swipe driven switches.
      this.currentIndex = index;
    })
  }

  // Builds the tablet layout built on a side navigation column.
  @Builder
  tabletLayout() {
    // Place the navigation and the content side by side.
    Row() {
      // Group both navigation items into one column.
      Column({ space: 8 }) {
        // Render the font navigation item.
        this.navItem($r('app.string.fr_tab_font'), 0, 'id_nav_font')
        // Render the resource navigation item.
        this.navItem($r('app.string.fr_tab_resource'), 1, 'id_nav_resource')
      }
      // Attach the navigation column test id.
      .id('id_main_nav')
      // Apply the fixed navigation width.
      .width(NAV_WIDTH)
      // Stretch the navigation across the layout height.
      .height('100%')
      // Pad the navigation items inside the column.
      .padding(12)
      // Paint the navigation with the card background color.
      .backgroundColor($r('app.color.card_bg'))
      // Round the navigation corners to match the card style.
      .borderRadius(12)
      // Align the navigation items to the leading edge.
      .alignItems(HorizontalAlign.Start)

      // Stack both page hosts so only the selected one is visible.
      Stack() {
        // Host the font page in the first layer.
        Column() {
          // Render the font demo page.
          FontPage()
        }
        // Attach the font host test id.
        .id('id_main_font_host')
        // Stretch the host across the content area.
        .width('100%')
        .height('100%')
        // Show the host only when the font tab is selected.
        .visibility(this.currentIndex === 0 ? Visibility.Visible : Visibility.None)

        // Host the resource page in the second layer.
        Column() {
          // Render the resource demo page.
          ResourcePage()
        }
        // Attach the resource host test id.
        .id('id_main_resource_host')
        // Stretch the host across the content area.
        .width('100%')
        .height('100%')
        // Show the host only when the resource tab is selected.
        .visibility(this.currentIndex === 1 ? Visibility.Visible : Visibility.None)
      }
      // Attach the content stack test id.
      .id('id_main_content')
      // Give the content all remaining horizontal space.
      .layoutWeight(1)
      // Stretch the content across the layout height.
      .height('100%')
      // Keep a gap between the navigation and the content.
      .margin({ left: 12 })
      // Align the stacked hosts to the top leading corner.
      .alignContent(Alignment.TopStart)
    }
    // Attach the tablet layout test id.
    .id('id_tablet_layout')
    // Stretch the layout across the shell width.
    .width('100%')
    // Stretch the layout across the shell height.
    .height('100%')
    // Keep a wide leading gutter for the tablet canvas.
    .padding({ left: 24 })
    // Align the children to the top edge.
    .alignItems(VerticalAlign.Top)
  }

  // Builds the shell header and the breakpoint driven layout body.
  build() {
    // Stack the header and the body vertically.
    Column() {
      // Group the title and slogan into one header block.
      Column({ space: 4 }) {
        // Render the application title.
        Text($r('app.string.fr_demo_title'))
          .id('id_main_title')
          .fontSize(20)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
          .width('100%')
        // Render the one-line slogan under the title.
        Text($r('app.string.fr_demo_slogan'))
          .id('id_main_slogan')
          .fontSize(12)
          .fontColor($r('app.color.text_secondary'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .width('100%')
      }
      // Attach the header test id.
      .id('id_main_header')
      // Stretch the header across the shell width.
      .width('100%')
      // Pad the header inside the shell.
      .padding({ left: 24, right: 24, top: 16, bottom: 12 })
      // Align the header children to the leading edge.
      .alignItems(HorizontalAlign.Start)

      // Wrap the body in a responsive grid row.
      GridRow({ columns: { xs: 4, sm: 4, md: 8, lg: 12 } }) {
        // Host the full span body column.
        GridCol({ span: { xs: 4, sm: 4, md: 8, lg: 12 } }) {
          // Switch between the two layouts by the breakpoint flag.
          if (this.isWide) {
            // Render the tablet layout on medium and larger screens.
            this.tabletLayout()
          } else {
            // Render the phone layout on small screens.
            this.phoneLayout()
          }
        }
        // Attach the breakpoint host test id.
        .id('id_main_breakpoint')
        // Stretch the host across the shell height.
        .height('100%')
      }
      // Attach the responsive body test id.
      .id('id_main_layout')
      // Stretch the body across the shell width.
      .width('100%')
      // Give the body all remaining vertical space.
      .layoutWeight(1)
      .onBreakpointChange((breakpoint: string) => {
        // Update the wide flag when the breakpoint moves to md or lg.
        this.isWide = breakpoint === 'md' || breakpoint === 'lg';
      })
    }
    // Attach the page shell test id.
    .id('id_main_page')
    // Stretch the shell across the window width.
    .width('100%')
    // Stretch the shell across the window height.
    .height('100%')
    // Keep a small bottom gutter under the body.
    .padding({ bottom: 16 })
    // Paint the page background behind the shell.
    .backgroundColor($r('app.color.page_bg'))
  }
}
