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

import { ContactsHost } from './ContactsHost';
import { ToolboxPage } from './pages/ToolboxPage';
import { HistoryPage } from './pages/HistoryPage';
import { SettingsPage } from './pages/SettingsPage';

const WIDE_BREAKPOINT: number = 600;
const SIDE_BAR_WIDTH: number = 88;
const BOTTOM_BAR_HEIGHT: number = 56;
const TAB_CONTACTS: number = 0;
const TAB_TOOLBOX: number = 1;
const TAB_HISTORY: number = 2;
const TAB_SETTINGS: number = 3;

@ComponentV2
export struct MainPage {
  @Local currentIndex: number = TAB_CONTACTS;
  @Local contactsToken: number = 0;
  @Local historyToken: number = 0;
  @Local isWide: boolean = false;

  @Builder
  tabItem(index: number, label: ResourceStr, idValue: string) {
    Column() {
      Text(label)
        .id(idValue)
        .fontSize('14fp')
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.text_primary'))
        .maxLines(1)
        .textOverflow({ overflow: TextOverflow.Ellipsis })
    }
    .width('100%')
    .height('100%')
    .padding({ left: 4, right: 4 })
    .justifyContent(FlexAlign.Center)
  }

  build() {
    Column() {
      Column() {
        Text($r('app.string.vc_app_title'))
          .id('id_main_title')
          .fontSize('24fp')
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.text_primary'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text($r('app.string.vc_app_slogan'))
          .fontSize('13fp')
          .fontColor($r('app.color.text_secondary'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
          .margin({ top: 4 })
      }
      .width('100%')
      .alignItems(HorizontalAlign.Start)
      .padding({ left: 20, right: 20, top: 16, bottom: 12 })

      Divider()
        .id('id_main_divider')
        .color($r('app.color.divider'))
        .strokeWidth(1)

      Tabs({ barPosition: this.isWide ? BarPosition.Start : BarPosition.End, index: this.currentIndex }) {
        TabContent() {
          ContactsHost({ refreshToken: this.contactsToken })
        }
        .tabBar(this.tabItem(TAB_CONTACTS, $r('app.string.vc_tab_contacts'), 'id_tab_contacts'))

        TabContent() {
          ToolboxPage({
            onOpenContacts: () => {
              this.currentIndex = TAB_CONTACTS;
              this.contactsToken += 1;
            }
          })
        }
        .tabBar(this.tabItem(TAB_TOOLBOX, $r('app.string.vc_tab_toolbox'), 'id_tab_toolbox'))

        TabContent() {
          HistoryPage({ refreshToken: this.historyToken })
        }
        .tabBar(this.tabItem(TAB_HISTORY, $r('app.string.vc_tab_history'), 'id_tab_history'))

        TabContent() {
          SettingsPage()
        }
        .tabBar(this.tabItem(TAB_SETTINGS, $r('app.string.vc_tab_settings'), 'id_tab_settings'))
      }
      .id('id_main_tabs')
      .barMode(BarMode.Fixed)
      .vertical(this.isWide)
      .barWidth(this.isWide ? SIDE_BAR_WIDTH : '100%')
      .barHeight(this.isWide ? '100%' : BOTTOM_BAR_HEIGHT)
      .barBackgroundColor($r('app.color.card_bg'))
      .animationDuration(200)
      // Keep the brand header fixed and let Tabs fill the rest of the column in both navigation modes.
      .layoutWeight(1)
      .onChange((index: number) => {
        this.currentIndex = index;
        if (index === TAB_CONTACTS) {
          this.contactsToken += 1;
        }
        if (index === TAB_HISTORY) {
          this.historyToken += 1;
        }
      })
    }
    .id('id_main_root')
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Start)
    .backgroundColor($r('app.color.page_bg'))
    .onAreaChange((_oldValue: Area, newValue: Area) => {
      this.isWide = Number(newValue.width) >= WIDE_BREAKPOINT;
    })
  }
}
