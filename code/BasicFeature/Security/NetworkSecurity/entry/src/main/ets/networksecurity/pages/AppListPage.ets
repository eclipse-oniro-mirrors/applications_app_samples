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

import { AppDetailParam, AppInfoItem, Logger } from 'library';
import { AppListViewModel } from '../viewmodel/AppListViewModel';

// Row height of one application entry, aligned with the list item guidance.
const ROW_HEIGHT: number = 56;
// Size of the icon block inside one row.
const ICON_SIZE: number = 40;
// Spacing between the search bar and the list body.
const CARD_SPACE: number = 12;

/**
 * Navigation stack holder shared by the entry pages. MainPage binds its stack on appear;
 * PolicyPage, AppListPage and AppDetailPage push through this holder because the V2 component
 * tree cannot share the NavPathStack through @Provide. It lives next to the app list page so
 * no entry page needs to import another page's struct.
 */
export class NsNav {
  // Stack bound by MainPage, null until the main page has appeared.
  private static stack: NavPathStack | null = null;
  // Parameter of the latest AppDetailPage push, read by the detail page builder.
  static detail: AppDetailParam | undefined = undefined;

  /**
   * Bind the navigation stack of the main page.
   * @param stack stack owned by MainPage.
   */
  static bind(stack: NavPathStack): void {
    // Store the stack for every later push.
    NsNav.stack = stack;
  }

  /**
   * Push the installed application list page without a parameter.
   */
  static pushAppList(): void {
    // Push the list route; an unbound stack only logs and skips.
    NsNav.push('AppListPage', '');
  }

  /**
   * Push the application detail page and remember the route parameter.
   * @param uid UID of the target application.
   * @param bundleName bundle name known by the caller, empty when unknown.
   * @param appName display name known by the caller, empty when unknown.
   */
  static pushAppDetail(uid: number, bundleName: string, appName: string): void {
    // Build the typed route parameter.
    const param: AppDetailParam = { uid: uid, bundleName: bundleName, appName: appName };
    // Remember the parameter for the detail page builder.
    NsNav.detail = param;
    // Push the detail route with the parameter object.
    NsNav.push('AppDetailPage', param);
  }

  /**
   * Push one route when the navigation stack is bound.
   * @param name registered route name.
   * @param param route parameter, an empty string when the route has none.
   */
  private static push(name: string, param: string | AppDetailParam): void {
    // Skip the push while the stack is not bound yet.
    if (NsNav.stack === null) {
      Logger.warn('[Nav] navigation stack is not bound yet, route: ' + name);
      return;
    }
    // Push the destination onto the shared stack.
    NsNav.stack.pushPathByName(name, param);
  }
}

/**
 * Installed application list page. It renders every application with icon, name, bundle name
 * and UID, supports name and bundle filtering and pushes the detail page for the tapped row.
 */
@ComponentV2
export struct AppListPage {
  // View model that holds the list state and the search keyword.
  @Local vm: AppListViewModel = new AppListViewModel();

  /**
   * Load the installed application list when the page appears.
   */
  aboutToAppear(): void {
    // Bind the host context so the service can request the runtime permission.
    const context = this.getUIContext().getHostContext();
    // Trigger the first load; the view model keeps the busy guard.
    this.vm.load(context);
  }

  /**
   * Build the icon or the initial block of one application row.
   * @param item application item rendered by this row.
   */
  @Builder
  appIcon(item: AppInfoItem) {
    // Render the real icon when the application info carries one.
    if (item.icon !== undefined) {
      Image(item.icon)
        .id('id_app_list_icon_' + item.uid.toString())
        .width(ICON_SIZE)
        .height(ICON_SIZE)
        .borderRadius(8)
        .objectFit(ImageFit.Cover)
    } else {
      // Fall back to an initial block so the row keeps its rhythm without an icon.
      Text(item.appName.length > 0 ? item.appName.charAt(0).toUpperCase() : '?')
        .id('id_app_list_icon_' + item.uid.toString())
        .width(ICON_SIZE)
        .height(ICON_SIZE)
        .borderRadius(8)
        .backgroundColor($r('app.color.brand_light'))
        .fontColor($r('app.color.brand_primary'))
        .fontSize(18)
        .fontWeight(FontWeight.Medium)
        .textAlign(TextAlign.Center)
    }
  }

  /**
   * Build one application row with the icon, the name and the bundle and UID captions.
   * @param item application item rendered by this row.
   */
  @Builder
  appRow(item: AppInfoItem) {
    Row({ space: 12 }) {
      this.appIcon(item)
      Column({ space: 2 }) {
        Text(item.appName)
          .id('id_app_list_name_' + item.uid.toString())
          .fontSize(16)
          .fontColor($r('app.color.text_primary'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
        Text(item.bundleName)
          .id('id_app_list_bundle_' + item.uid.toString())
          .fontSize(12)
          .fontColor($r('app.color.text_tertiary'))
          .maxLines(1)
          .textOverflow({ overflow: TextOverflow.Ellipsis })
      }
      .alignItems(HorizontalAlign.Start)
      .layoutWeight(1)

      Text('uid ' + item.uid.toString())
        .id('id_app_list_uid_' + item.uid.toString())
        .fontSize(12)
        .fontColor($r('app.color.text_tertiary'))
    }
    .id('id_app_list_row_' + item.uid.toString())
    .width('100%')
    .height(ROW_HEIGHT)
    .onClick(() => {
      // Open the detail page of the tapped application.
      NsNav.pushAppDetail(item.uid, item.bundleName, item.appName);
    })
  }

  /**
   * Build the list body with the search input, the state hints and the item list.
   */
  build() {
    Column({ space: CARD_SPACE }) {
      TextInput({ placeholder: $r('app.string.ns_app_list_search') })
        .id('id_app_list_search')
        .height($r('app.float.control_height'))
        .fontSize(14)
        .fontColor($r('app.color.text_primary'))
        .placeholderColor($r('app.color.text_tertiary'))
        .backgroundColor($r('app.color.fill_subtle'))
        .borderRadius(8)
        .width('100%')
        .onChange((value: string) => {
          // Forward the keyword to the view model filter.
          this.vm.filter(value);
        })

      // Show the loading hint while the first load is running.
      if (this.vm.busy && !this.vm.loaded) {
        Text($r('app.string.ns_app_list_loading'))
          .id('id_app_list_loading')
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
      } else if (!this.vm.loaded) {
        // Show the restriction hint on non-system-signed devices.
        Text(this.vm.message)
          .id('id_app_list_message')
          .fontSize(14)
          .fontColor($r('app.color.warning'))
          .width('100%')
      } else if (this.vm.filtered.length === 0) {
        // Show the empty hint when no application matches the keyword.
        Text($r('app.string.ns_app_list_empty'))
          .id('id_app_list_empty')
          .fontSize(14)
          .fontColor($r('app.color.text_tertiary'))
          .width('100%')
      } else {
        List({ space: 4 }) {
          Repeat<AppInfoItem>(this.vm.filtered)
            .each((repeatItem: RepeatItem<AppInfoItem>) => {
              ListItem() {
                this.appRow(repeatItem.item)
              }
            })
            .key((item: AppInfoItem) => item.uid.toString())
        }
        .id('id_app_list_list')
        .width('100%')
        .layoutWeight(1)
        .divider({ strokeWidth: 0.5, color: $r('app.color.divider') })
        .scrollBar(BarState.Off)
      }
    }
    .id('id_app_list_page')
    .width('100%')
    .height('100%')
    .padding(16)
    .backgroundColor($r('app.color.page_bg'))
  }
}

/**
 * NavDestination wrapper registered by the MainPage route map.
 */
@Builder
export function AppListPageBuilder() {
  NavDestination() {
    AppListPage()
  }
  .title($r('app.string.ns_app_list_title'))
  .backgroundColor($r('app.color.page_bg'))
}
