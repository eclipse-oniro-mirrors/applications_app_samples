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

  // Basic location features, matching location-guidelines.md and geocode-guidelines.md
  locationMenus: MenuItem[] = [
    { title: $r('app.string.menu_location'), subtitle: $r('app.string.menu_location_desc'), icon: '📍', color: $r('app.color.color_accent'), pageName: 'LocationPage' },
    { title: $r('app.string.menu_geocode'), subtitle: $r('app.string.menu_geocode_desc'), icon: '📮', color: $r('app.color.color_success'), pageName: 'GeocodePage' },
  ];

  // Advanced features, matching geofence-guidelines.md and location-guidelines-capi.md
  advancedMenus: MenuItem[] = [
    { title: $r('app.string.menu_geofence'), subtitle: $r('app.string.menu_geofence_desc'), icon: '🚧', color: $r('app.color.menu_card_teal'), pageName: 'GeofencePage' },
    { title: $r('app.string.menu_location_capi'), subtitle: $r('app.string.menu_location_capi_desc'), icon: '🧭', color: $r('app.color.menu_card_indigo'), pageName: 'LocationCapiPage' },
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
      hilog.info(0x0000, '[Sample_LocationKit]', `Navigate to ${item.pageName}`);
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
          this.SectionTitle($r('app.string.section_location_features'))
          ForEach(this.locationMenus, (item: MenuItem) => {
            this.MenuCard(item)
          })

          this.SectionTitle($r('app.string.section_advanced_features'))
          ForEach(this.advancedMenus, (item: MenuItem) => {
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
