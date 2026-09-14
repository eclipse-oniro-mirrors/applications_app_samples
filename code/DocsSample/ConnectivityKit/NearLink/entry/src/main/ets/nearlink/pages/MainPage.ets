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

import { hilog } from '@kit.PerformanceAnalysisKit';

// Menu item data model
interface MenuItem {
  title: ResourceStr;
  subtitle: ResourceStr;
  icon: string;
  color: ResourceStr;
  pageName: string;
}

@Component
export struct MainPage {
  @Consume('pageInfos') pageInfos: NavPathStack;

  // Basic features
  basicMenus: MenuItem[] = [
    { title: $r('app.string.menu_manager'), subtitle: $r('app.string.menu_manager_desc'), icon: '⚙', color: $r('app.color.color_accent'), pageName: 'ManagerPage' },
    { title: $r('app.string.menu_advertising'), subtitle: $r('app.string.menu_advertising_desc'), icon: '📡', color: $r('app.color.color_warning'), pageName: 'AdvertisingPage' },
    { title: $r('app.string.menu_scan'), subtitle: $r('app.string.menu_scan_desc'), icon: '🔍', color: $r('app.color.color_success'), pageName: 'ScanConfigPage' },
  ];

  // SSAP features
  ssapMenus: MenuItem[] = [
    { title: $r('app.string.menu_ssap_server'), subtitle: $r('app.string.menu_ssap_server_desc'), icon: '🖥', color: $r('app.color.menu_card_purple'), pageName: 'SsapServerPage' },
    { title: $r('app.string.menu_ssap_client'), subtitle: $r('app.string.menu_ssap_client_desc'), icon: '📱', color: $r('app.color.menu_card_indigo'), pageName: 'SsapClientPage' },
  ];

  // Other features
  otherMenus: MenuItem[] = [
    { title: $r('app.string.menu_data_transfer'), subtitle: $r('app.string.menu_data_transfer_desc'), icon: '📤', color: $r('app.color.menu_card_teal'), pageName: 'DataTransferPage' },
    { title: $r('app.string.menu_cdsm'), subtitle: $r('app.string.menu_cdsm_desc'), icon: '🔗', color: $r('app.color.menu_card_pink'), pageName: 'CdsmPage' },
  ];

  @Builder
  MenuCard(item: MenuItem) {
    Row() {
      Text(item.icon)
        .fontSize(28)
        .margin({ right: 16 })
      Column() {
        Text(item.title)
          .fontSize(16)
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.text_primary'))
        Text(item.subtitle)
          .fontSize(12)
          .fontColor($r('app.color.text_disabled'))
          .margin({ top: 2 })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('›')
        .fontSize(24)
        .fontColor('#BDBDBD')
    }
    .id(`menu_${item.pageName}`)
    .width('100%')
    .padding({ left: 20, right: 20, top: 16, bottom: 16 })
    .backgroundColor(Color.White)
    .borderRadius(12)
    .shadow({ radius: 4, color: '#10000000', offsetY: 2 })
    .onClick(() => {
      hilog.info(0x0000, 'testTag', `Navigate to ${item.pageName}`);
      this.pageInfos.pushPathByName(item.pageName, null);
    })
  }

  @Builder
  SectionTitle(title: ResourceStr) {
    Text(title)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor($r('app.color.text_hint'))
      .margin({ top: 20, bottom: 10 })
      .alignSelf(ItemAlign.Start)
  }

  build() {
    Column() {
      // Header
      Column() {
        Text($r('app.string.app_title'))
          .id('main_title_text')
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .fontColor(Color.White)
        Text($r('app.string.app_subtitle'))
          .fontSize(14)
          .fontColor('#B3FFFFFF')
          .margin({ top: 4 })
      }
      .width('100%')
      .padding({ top: 48, bottom: 28 })
      .linearGradient({
        angle: 135,
        colors: [[$r('app.color.color_primary'), 0.0], [$r('app.color.color_primary_dark'), 1.0]]
      })

      // Feature list
      Scroll() {
        Column() {
          this.SectionTitle($r('app.string.section_basic_features'))
          ForEach(this.basicMenus, (item: MenuItem) => {
            this.MenuCard(item)
          })

          this.SectionTitle($r('app.string.section_ssap_protocol'))
          ForEach(this.ssapMenus, (item: MenuItem) => {
            this.MenuCard(item)
          })

          this.SectionTitle($r('app.string.section_other_features'))
          ForEach(this.otherMenus, (item: MenuItem) => {
            this.MenuCard(item)
          })
        }
        .width('100%')
        .padding({ left: 16, right: 16, bottom: 32 })
      }
      .layoutWeight(1)
    }
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.bg_page'))
  }
}
